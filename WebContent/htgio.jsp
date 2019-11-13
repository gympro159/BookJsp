<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.GioHangBean"%>
<%@page import="bo.GioHangBo"%>
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

<%
	long s1=0,tt=0;
	GioHangBo g1= (GioHangBo)session.getAttribute("gh");
	if(g1!=null){
		s1=g1.ds.size();
		tt=g1.Tong();
	}
	%>

<nav class="navbar navbar-expand-sm bg-dark">
  <a class="navbar-brand" href="sachcontroller">Home</a>
  <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="giohangcontroller">Gio Hang(<%=s1 %>:<%=tt %>)</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="sachcontroller">Dang Nhap</a>
      </li>
      </ul>
</nav>

<table align="center" width="1200" border="1">
				<tr>
					<td>Mã sách</td>
					<td>Tên sách</td>
					<td>Tác giả</td>
					<td>Giá</td>
					<td>Số lượnng</td>
					<td>Edit</td>
					<td>Thành tiền</td>
					<td></td>
				</tr>
			<%
				if(session.getAttribute("gh")!=null){
					GioHangBo gh= (GioHangBo)session.getAttribute("gh");
					for(GioHangBean g:gh.ds){ 
						g.setThanhtien();
			%>
				<tr>
					<td><%=g.getMasach() %></td>
					<td><%=g.getTensach() %></td>
					<td><%=g.getTacgia() %></td>
					<td><%=g.getGia() %></td>
					<td><%=g.getSoluong() %></td>
					<td><form action="giohangcontroller?ms2=<%=g.getMasach()%>" method="post">
							<input type="text" name="txtsl">
							<button type="submit" class="btn btn-primary">Sửa</button>
						</form>
					</td>
					<td><%=g.getThanhtien() %></td>
					<td><a href="giohangcontroller?ms2=<%=g.getMasach()%>">Xoá</a></td>
					
				</tr>
		<% }%>
</table>
<%DecimalFormat dd = new DecimalFormat("###.###"); %>
<div align="right">Tong: <%=gh.Tong() %></div>
<%} %>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>