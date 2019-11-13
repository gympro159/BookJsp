package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.GioHangBean;
import bo.GioHangBo;

/**
 * Servlet implementation class giohangcontroller
 */
@WebServlet("/giohangcontroller")
public class giohangcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giohangcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    GioHangBo gh = new GioHangBo();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session = request.getSession();
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String masach= request.getParameter("ms");
			String tensach= request.getParameter("ts");
			String tacgia= request.getParameter("tg");
			String giatam= request.getParameter("gia");
			String masach2 = request.getParameter("ms2");
			String soluongtam = request.getParameter("txtsl");
			if(giatam!=null){
				long gia= Long.parseLong(giatam);
				
				//Kiem tra xem da tao session gh chua
				if(session.getAttribute("gh")==null){
					//Neu chua thi tao 1 session: gh
					session.setAttribute("gh", gh);
				}
				
				//b1: lay session: gh luu vao bien: gh
				gh=(GioHangBo)session.getAttribute("gh");
				
				//b2: thay doi bien: goi ham Them
				int k=0;
				if(gh.ds.size()>0){
					for(GioHangBean g: gh.ds){
						if(g.getMasach().equals(masach)){
							g.setSoluong(g.getSoluong()+1);
							k=1;
							break;
						}
					}
					if(k==0){
						gh.Them(masach, tensach, tacgia, gia, 1);
					}
				}
				else{
					gh.Them(masach, tensach, tacgia, gia, 1);
				}
			}
			if(masach2!=null && soluongtam !=null){
				gh.SuaSoLuong(masach2, Long.parseLong(soluongtam));
			}
			else if(masach2!=null)
			{
				gh.Xoa(masach2);
			}
			//b3: luu bien gh vao session: gh
			session.setAttribute("gh", gh);
			//b4: hien thi gio hang: gh
			response.sendRedirect("loading.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
