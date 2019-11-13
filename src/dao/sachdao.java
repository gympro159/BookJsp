package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.sachbean;

public class sachdao {
	DungChung dc = new DungChung();
	public ArrayList<sachbean> getsach() throws Exception{
	  
	  ArrayList<sachbean> ds = new ArrayList<sachbean>();
	  //b1: Kết nối vào CSDL
	  dc.KetNoi();
	  //b2: Lấy dữ liệu về
	  String sql="select * from sach";
	  PreparedStatement cmd = dc.cn.prepareStatement(sql);
	  ResultSet rs= cmd.executeQuery();//Lấy dữ liệu về
	  while(rs.next()){ //Duyệt qua các dòng trên bảng sach
		  String masach = rs.getString("masach");
		  String tensach = rs.getString("tensach");
		  String tacgia = rs.getString("tacgia");
		  Long gia = rs.getLong("gia");
		  String anh = rs.getString("anh");
		  Date ngaynhap = rs.getDate("ngaynhap");
		  String maloai = rs.getString("maloai");
		  sachbean s= new sachbean(masach, tensach, tacgia, gia, anh, ngaynhap, maloai);
		  ds.add(s);
	  }
	  //b3: Đóng kết nối
	  rs.close();
	  dc.cn.close();
	  return ds;
  } 
}