package WebProject;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class AudioDAO {
	private String jdbc_dirver = "com.mysql.jdbc.Driver";
	private String jdbc_url = "jdbc:mysql://localhost/mydb";
	private Connection conn;
	private Statement stme;

	private void connect() { // DB 연결
		try {
			Class.forName(jdbc_dirver);
			conn = (Connection) DriverManager.getConnection(jdbc_url, "root", "wldnrwldnr1");
			stme = (Statement) conn.createStatement();
		} catch (Exception e) {
		}
	}

	private void disconnect() { // DB 연결 해제
		try {
			stme.close();
			conn.close();
		} catch (Exception e) {
		}
	}

	public void addID(AudioDTO data) { // 회원가입
		String sql = "insert into A_User value('" + data.getId() + "', '" + data.getPass() + "')";
		try {
			connect();
			stme.executeUpdate(sql);
			disconnect();
		} catch (Exception e) {
		}
	}

	public void addAudio(AudioDTO data) { // 재생목록 추가
		String sql = "insert into Audio value('" + data.getId() + "', '" + data.getSlot() + "', '" + data.getAudioNum()
				+ "', '" + data.getVolume() + "')";
		System.out.println(sql);
		try {
			connect();
			stme.executeUpdate(sql);
			disconnect();
		} catch (Exception e) {
		}
	}

	public void removeAudio(String id, int slot) { // 재생목록 제거
		String sql = "delete from Audio where Id ='" + id + "' and" + " Slot = " + slot;
		try {
			connect();
			stme.executeUpdate(sql);
			disconnect();
		} catch (Exception e) {
		}
	}

	public AudioDTO getData(String id, int slot) { // 재생목록 불러오기
		String sql = "select Track , Volume from Audio where Slot=" + slot + ", Id =" + id;
		AudioDTO data = new AudioDTO();
		try {
			connect();
			ResultSet rs = stme.executeQuery(sql);
			rs.next();
			data.getAudioNum();
			data.getVolume();
			rs.close();
			disconnect();
		} catch (Exception e) {
		}
		return data;
	}

	public boolean CheckID(String id) { // ID 확인
		String sql = "select Id from A_User ";
		try {
			connect();
			ResultSet rs = stme.executeQuery(sql);
			while (rs.next()) {
				if (rs.getString("Id").equals(id)) {
					return false;
				}
			}
			rs.close();
			disconnect();
		} catch (Exception e) {
		}

		return true;

	}

	public boolean CheckLogin(String id, String pass) { // 로그인 확인
		String sql = "select Id , pass from A_User ";
		try {
			connect();
			ResultSet rs = stme.executeQuery(sql);
			while (rs.next()) {
				if (rs.getString("Id").equals(id)) {
					if (rs.getString("pass").equals(pass)) {
						return true;
					}
				}
			}
			rs.close();
			disconnect();
		} catch (Exception e) {
		}

		return false;
	}

	public ArrayList<AudioDTO> getAllData(String id, int slot) { // 모든 재생목록 가져오기
		// TODO Auto-generated method stub
		String sql = "select Track , Volume from Audio where Id='" + id + "' and Slot =" + slot;
		// System.out.println(sql);
		ArrayList<AudioDTO> list = new ArrayList<AudioDTO>();
		try {
			connect();
			ResultSet rs = stme.executeQuery(sql);
			while (rs.next()) {
				AudioDTO data = new AudioDTO();
				float temp = rs.getFloat("Volume");
				String temps = String.format("%.1f", temp);
				// System.out.println(Float.parseFloat(temps));
				data.setAudioNum(rs.getInt("Track"));
				data.setVolume(Float.parseFloat(temps));
				list.add(data);
			}
			rs.close();
			disconnect();

		} catch (Exception e) {
		}
		return list;
	}
}
