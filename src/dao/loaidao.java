package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	DungChung dc = new DungChung();
	public ArrayList<loaibean> getloai() throws Exception{
	  
	  ArrayList<loaibean> ds = new ArrayList<loaibean>();
	  //b1: Kết nối vào CSDL
	  dc.KetNoi();
	  //b2: Lấy dữ liệu về
	  String sql="select * from loai";
	  PreparedStatement cmd = dc.cn.prepareStatement(sql);
	  ResultSet rs= cmd.executeQuery();//Lấy dữ liệu về
	  while(rs.next()){ //Duyệt qua các dòng trên bảng sach
		  String maloai = rs.getString("maloai");
		  String tenloai = rs.getString("tenloai");
		  
		  loaibean l= new loaibean(maloai, tenloai);
		  ds.add(l);
	  }
	  //b3: Đóng kết nối
	  rs.close();
	  dc.cn.close();
	  return ds;
  } 
}
