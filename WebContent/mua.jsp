<%@page import="bean.GioHangBean"%>
<%@page import="bo.GioHangBo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String masach= request.getParameter("ms");
		String tensach= request.getParameter("ts");
		String tacgia= request.getParameter("tg");
		String giatam= request.getParameter("gia");
		if(giatam!=null){
			long gia= Long.parseLong(giatam);
			GioHangBo gh=null;
			//Kiem tra xem da tao session gh chua
			if(session.getAttribute("gh")==null){
				//Neu chua thi tao 1 session: gh
				gh= new GioHangBo();
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
			//b3: luu bien gh vao session: gh
			session.setAttribute("gh", gh);
			//b4: hien thi gio hang: gh
			response.sendRedirect("htgio.jsp");
			for(GioHangBean g: gh.ds){
				out.print(g.getTensach()+":"+g.getThanhtien()+"<hr>");
			}
		}
	%>
</body>
</html>