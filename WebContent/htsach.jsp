<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.sachbo"%> <!-- Jsp không được khai báo bo, vì thầy nói -->
<%@page import="bean.sachbean"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark">
  <a class="navbar-brand" href="sachcontroller">Home</a>
  <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="giohangcontroller">Gio Hang</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="sachcontroller">Dang Nhap</a>
      </li>
      </ul>
</nav>
	<table align="center" width='600'>
		<tr>
			<td valign="top" width="200">
				<% ArrayList<loaibean> dsloai= (ArrayList<loaibean>)request.getAttribute("dsloai");
				%>
				<table width="200">
				<tr>
					<td>
						<a href="sachcontroller"> 
							All
						</a>
					</td>
				</tr>
					<%for(loaibean l: dsloai){ %>
						<tr>
							<td>
								<a href="sachcontroller?ml=<%=l.getMaloai() %>"> 
									<%=l.getTenloai() %>
								</a>
							</td>
						</tr>
						<%} %>
				</table>
			</td>
			<td valign="top" width="600">
				<table align="center" width='600'>
				<%
					
					ArrayList<sachbean> ds= ( ArrayList<sachbean>)request.getAttribute("dssach");
					
					
					int ss=ds.size();
					for(int i=0;i<ss;i++){
						sachbean s= ds.get(i);
				%>
					<tr>
						<td><img src='<%=s.getAnh() %>'> <br>
							<%=s.getTensach() %> <br>
							<%=s.getTacgia() %> <br>	
							<%=s.getGia() %> <br>
							<a href="giohangcontroller?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&tg=<%=s.getTacgia()%>&gia=<%=s.getGia()%>">Mua</a>
						</td>
						<%i++;
						if(i<ss){
							s=ds.get(i);%>
						<td><img src='<%=s.getAnh() %>'> <br>
							<%=s.getTensach() %> <br>
							<%=s.getTacgia() %> <br>				
							<%=s.getGia() %> <br>
							<a href="giohangcontroller?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&tg=<%=s.getTacgia()%>&gia=<%=s.getGia()%>">Mua</a>
						</td>
						<%} %>
					</tr>	
				<%} %>
				</table>	
			</td>
			<td></td>
		</tr>
	</table>
	



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>