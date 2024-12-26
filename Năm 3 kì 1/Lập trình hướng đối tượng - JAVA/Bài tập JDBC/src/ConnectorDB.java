import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ConnectorDB {
	private static String DB_URL = "jdbc:mysql://localhost:3306/jdbc";
    private static String USER_NAME = "root";
    private static String PASSWORD = "khoi21102004";
    
    public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			return conn;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
    
	public static ArrayList<SinhVien> getDSSinhVien() {
	    	ArrayList<SinhVien> dsSinhVien = new ArrayList<>();
	    	try(Connection conn = getConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM sinhvien")) {
				
				while(rs.next()) {
					SinhVien sv = new SinhVien();
					sv.setMaSinhVien(rs.getString("masv"));
					sv.setHoTen(rs.getString("hoten"));
					sv.setLop(rs.getString("lop"));
					sv.setGpa(rs.getDouble("GPA"));
					dsSinhVien.add(sv);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.print("Connected database failed");
			}
	    	return dsSinhVien;
	}
	
	public static void addDSSinhVien(SinhVien sv) {
		String sql = "INSERT INTO sinhvien (masv, hoten, lop, GPA) VALUES (?, ?, ?, ?);";
		try (Connection connection = getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	            preparedStatement.setString(1, sv.getMaSinhVien());
	            preparedStatement.setString(2, sv.getHoTen());
	            preparedStatement.setString(3, sv.getLop());
	            preparedStatement.setDouble(4, sv.getGpa());
	            preparedStatement.executeUpdate();
	            //System.out.println("Sinh viên đã được thêm thành công!");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	}
	
	public static void deleteSinhVien(String maSinhVien) {
		String sql = "DELETE FROM sinhvien WHERE masv = ?;";
		// Câu lệnh SQL
        try (Connection connection = getConnection();
        		PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, maSinhVien); // Gán giá trị cho tham số
            preparedStatement.executeUpdate(); // Thực hiện cập nhật
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	public static boolean isMaSinhVienExist(String maSV) {
	    String sql = "SELECT COUNT(*) FROM sinhvien WHERE masv = ?";
	    try (Connection connection = getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	        preparedStatement.setString(1, maSV);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        if (resultSet.next()) {
	            return resultSet.getInt(1) > 0; 
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false; 
	}

	public static void updateSinhVien(SinhVien sv) {
		String sql = "UPDATE sinhvien SET hoten = ?, lop = ?, GPA = ? WHERE masv = ?"; 
	    try (Connection connection = getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	        
	        preparedStatement.setString(1, sv.getHoTen());
	        preparedStatement.setString(2, sv.getLop());
	        preparedStatement.setDouble(3, sv.getGpa());
	        preparedStatement.setString(4, sv.getMaSinhVien());

	        int rowsAffected = preparedStatement.executeUpdate();
	    
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	
}
