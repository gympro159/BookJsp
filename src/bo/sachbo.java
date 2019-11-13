package bo;

import java.util.ArrayList;

import bean.sachbean;
import dao.sachdao;

public class sachbo {
	sachdao sach=new sachdao();
	public ArrayList<sachbean> getsach() throws Exception{
		return sach.getsach();
	}
	
	public ArrayList<sachbean> getsach(String maloai) throws Exception{
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		for(sachbean s: sach.getsach())
		{
			if(s.getMaloai().equals(maloai))
			{
				ds.add(s);
			}
		}
		return ds;
	}
}
