package bo;

import java.util.ArrayList;

import bean.loaibean;
import dao.loaidao;

public class loaibo {
	loaidao loai=new loaidao();
	ArrayList<loaidao> ds;
	public ArrayList<loaibean> getloai() throws Exception{
		return loai.getloai();
	}
}
