import numpy as np
class LinearRegressionNormalEquation:
    def __init__(self):
        self.coefficients = None
        self.intercept = None

    def fit(self, X, y):
        X = np.c_[np.ones(X.shape[0]), X]

        # Tính các hệ số
        X_transpose = X.T
        beta = np.linalg.inv(X_transpose.dot(X)).dot(X_transpose).dot(y)
        
        # Phân tách intercept và coefficients
        self.intercept = beta[0]
        self.coefficients = beta[1:]
        return self

    def predict(self, X):
        # Dự đoán: y = intercept + X * coefficients
        return np.dot(X, self.coefficients) + self.intercept
    