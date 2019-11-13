package bo;

import java.util.ArrayList;

import bean.GioHangBean;

public class GioHangBo {
	public ArrayList<GioHangBean> ds= new ArrayList<GioHangBean>();
	public void Them(String masach, String tensach, String tacgia, long gia, long soluong){
		GioHangBean gh= new GioHangBean(masach, tensach, tacgia, gia, soluong);
		ds.add(gh);
	}
	
	public void Xoa(String masach){
		for(GioHangBean g: ds){
			if(g.getMasach().equals(masach)){
				ds.remove(g);
				return;
			}
		}
	}
	
	public void SuaSoLuong(String masach, long soluong){
		for(GioHangBean g: ds){
			if(g.getMasach().equals(masach)){
				g.setSoluong(soluong);
			}
		}
	}
	
	public long Tong(){
		long s=0;
		for(GioHangBean g: ds)
			s+=g.getThanhtien();
		return s;
	}
}
