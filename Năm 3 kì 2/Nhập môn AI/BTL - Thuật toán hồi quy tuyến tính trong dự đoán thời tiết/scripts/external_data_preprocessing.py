import matplotlib
matplotlib.use('Agg')
import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler, PowerTransformer
from scipy.stats import zscore
from statsmodels.stats.outliers_influence import variance_inflation_factor
import requests
from datetime import datetime, timedelta

# Thông số truy vấn
latitude = 21.0285   # Hà Nội
longitude = 105.8542
start_date = "2023-01-01"
end_date = "2025-01-01"

# Gọi API Open-Meteo 
url = (
    f"https://archive-api.open-meteo.com/v1/archive?"
    f"latitude={latitude}&longitude={longitude}"
    f"&start_date={start_date}&end_date={end_date}"
    f"&daily=temperature_2m_max,temperature_2m_min,temperature_2m_mean,"
    f"precipitation_sum,windspeed_10m_max,winddirection_10m_dominant,"
    f"cloudcover_mean,visibility_mean,relative_humidity_2m_mean"
    f"&timezone=Asia%2FBangkok"
)

response = requests.get(url)
data = response.json()

# Tạo DataFrame
df = pd.DataFrame(data["daily"])

# Đổi tên cột theo yêu cầu
df = df.rename(columns={
    "time": "datetime",
    "temperature_2m_mean": "temp",
    "temperature_2m_max": "target_tempmax",
    "temperature_2m_min": "target_tempmin",
    "relative_humidity_2m_mean": "humidity",
    "precipitation_sum": "precip",
    "windspeed_10m_max": "windspeed",
    "winddirection_10m_dominant": "winddir",
    "cloudcover_mean": "cloudcover",
    "visibility_mean": "visibility"
})

# Chuyển datetime
df["datetime"] = pd.to_datetime(df["datetime"])

# Tính winddir_sin, winddir_cos
df['winddir_sin'] = np.sin(np.radians(df['winddir']))
df['winddir_cos'] = np.cos(np.radians(df['winddir']))

# Tạo rolling mean
df['humidity_roll_mean_7'] = df['humidity'].rolling(window=7).mean()
df['precip_roll_mean_7'] = df['precip'].rolling(window=7).mean()

# Tạo các trường lag
for i in range(1, 4):
    df[f'temp_lag_{i}'] = df['temp'].shift(i)
    df[f'humidity_lag_{i}'] = df['humidity'].shift(i)
    df[f'precip_lag_{i}'] = df['precip'].shift(i)

# Tính tempmax_vs_doy_avg 
df['doy'] = df['datetime'].dt.dayofyear
df['tempmax_vs_doy_avg'] = df.groupby('doy')['target_tempmax'].transform(lambda x: x.mean())
df['tempmax_vs_doy_avg'] = df['target_tempmax'] - df['tempmax_vs_doy_avg']

# Xóa các cột không cần thiết
df.drop(['winddir'], axis=1, inplace=True)
df.drop(['doy'], axis=1, inplace=True)
df.drop(['visibility'], axis=1, inplace=True)

# Danh sách đặc trưng số
numeric_columns = [
    'target_tempmax','target_tempmin','temp'
    ,'humidity','precip','windspeed','winddir_sin','winddir_cos',
    'cloudcover','humidity_roll_mean_7','precip_roll_mean_7','temp_lag_1','humidity_lag_1','precip_lag_1'
    ,'temp_lag_2','humidity_lag_2','precip_lag_2','temp_lag_3','humidity_lag_3','precip_lag_3','tempmax_vs_doy_avg'
]

print("\n=== TIỀN XỬ LÝ DỮ LIỆU ===")

# 1. Loại bỏ hàng trống
print("\n1. Loại bỏ hàng trống:")
initial_rows = len(df)
df = df.dropna(how='all')
print(f"- Số hàng ban đầu: {initial_rows}")
print(f"- Số hàng sau khi loại bỏ hàng trống: {len(df)}")

# 2. Xử lý giá trị thiếu
print("\n2. Xử lý giá trị thiếu:")
print("- Giá trị thiếu trước xử lý:")
print(df[numeric_columns].isnull().sum())

# Chuyển đổi kiểu dữ liệu các cột số
for col in numeric_columns:
    df[col] = pd.to_numeric(df[col], errors='coerce')

# Xử lý tất cả các cột lag nếu chúng chưa tồn tại trong dữ liệu
lag_features = {
    'temp': ['temp_lag_1', 'temp_lag_2', 'temp_lag_3'],
    'humidity': ['humidity_lag_1', 'humidity_lag_2', 'humidity_lag_3'],
    'precip': ['precip_lag_1', 'precip_lag_2', 'precip_lag_3']
}

# Tạo các cột lag nếu chưa tồn tại
for source_col, lag_cols in lag_features.items():
    for i, lag_col in enumerate(lag_cols, 1):
        if lag_col not in df.columns or df[lag_col].isnull().sum() > 0:
            df[lag_col] = df[source_col].shift(i)

# Điền giá trị thiếu cho các cột lag
all_lag_cols = [col for sublist in lag_features.values() for col in sublist]
for col in all_lag_cols:
    df[col] = df[col].fillna(method='bfill')
    df[col] = df[col].fillna(method='ffill')
    df[col] = df[col].fillna(df[col].median())

# Điền giá trị thiếu cho các cột còn lại
for col in numeric_columns:
    if col not in all_lag_cols:
        df[col] = df[col].fillna(df[col].median())

# Đảm bảo không có giá trị thiếu trong target
df = df.dropna(subset=['target_tempmax', 'target_tempmin'])

print("- Giá trị thiếu sau xử lý:")
print(df[numeric_columns].isnull().sum())
print(f"- Số hàng sau khi xử lý target: {len(df)}")

# 3. Chuyển đổi kiểu dữ liệu datetime
print("\n3. Chuyển đổi kiểu dữ liệu:")
df['datetime'] = pd.to_datetime(df['datetime'], errors='coerce')
df = df.dropna(subset=['datetime'])
print("- Đã chuyển cột datetime sang định dạng datetime.")
print(f"- Số hàng sau khi xử lý datetime: {len(df)}")

# 4. Kiểm tra dữ liệu trước khi xử lý bất thường
print("\n4. Kiểm tra dữ liệu trước khi xử lý bất thường:")
print("- Thống kê mô tả cho các cột quan trọng:")
print(df[['target_tempmax', 'target_tempmin', 'precip', 'humidity', 'windspeed']].describe())

# 5. Xử lý giá trị bất thường bằng clip
print("\n5. Xử lý giá trị bất thường:")
initial_rows = len(df)

# Clip giá trị nằm ngoài phạm vi hợp lý
df['humidity'] = df['humidity'].clip(lower=20, upper=100)
df['precip'] = df['precip'].clip(lower=0, upper=500)
df['windspeed'] = df['windspeed'].clip(lower=0, upper=50)
df['target_tempmax'] = df['target_tempmax'].clip(lower=15, upper=38)
df['target_tempmin'] = df['target_tempmin'].clip(lower=8, upper=32)


# Lọc bỏ các hàng vẫn còn giá trị bất thường sau khi clip
df = df[(df['humidity'] >= 20) & (df['humidity'] <= 95)]
df = df[(df['precip'] >= 0) & (df['precip'] <= 500)]
df = df[(df['windspeed'] >= 0) & (df['windspeed'] <= 50)]
df = df[(df['target_tempmax'] >= 10) & (df['target_tempmax'] <= 40)]
df = df[(df['target_tempmin'] >= 5) & (df['target_tempmin'] <= 35)]

# 6. Xử lý ngoại lai bằng Z-score
print("\n6. Xử lý ngoại lai:")
# Thêm các đặc trưng mới vào danh sách cột số
z = np.abs(zscore(df[numeric_columns]))
threshold = 3.5
df = df[(z < threshold).all(axis=1)]
print(f"- Số hàng sau khi loại bỏ ngoại lai: {len(df)}")
print(f"- Tỷ lệ dữ liệu mất: {(initial_rows - len(df)) / initial_rows * 100:.2f}%")

# 7. Xử lý độ lệch (skewness)
print("\n7. Kiểm tra độ lệch:")
skewness = df[numeric_columns].skew()
skewed_cols = skewness[abs(skewness) > 2.0].index.tolist()
print(f"- Các cột bị lệch (|skew| > 2.0): {skewed_cols}")

if skewed_cols:
    scaler = PowerTransformer(method='yeo-johnson')
    df[skewed_cols] = scaler.fit_transform(df[skewed_cols].values)
    print("- Đã giảm độ lệch bằng Yeo-Johnson cho các cột được chọn.")

# 8. Chuẩn hóa dữ liệu
print("\n9. Chuẩn hóa dữ liệu:")
scaler = StandardScaler()
features_to_scale = [col for col in numeric_columns if col not in ['target_tempmax', 'target_tempmin']]
df[features_to_scale] = scaler.fit_transform(df[features_to_scale])
print("- Đã chuẩn hóa các cột số (ngoại trừ target_tempmax và target_tempmin).")

# Lưu dữ liệu
df.to_csv('../data/processed/external_weather_processed.csv', index=False)
print("\n10. Dữ liệu đã được làm sạch và lưu vào 'external_weather_processed.csv'")