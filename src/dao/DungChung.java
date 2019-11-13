package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DungChung {
	public Connection cn;
	public void KetNoi() throws Exception{
		//b1: xác định hQTCSDL
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		System.out.print("Đã xác định hSQTCSDL");
		//b2: Kết nối vào csdl
		String url="jdbc:sqlserver://DESKTOP-UB560BC\\MISASME2017:1433;databaseName=KhoaCNTT;user=khoacntt; password=123";
		cn = DriverManager.getConnection(url);
		System.out.print("Da ket noi");
	}
}
