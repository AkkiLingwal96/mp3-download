<%@page import="java.sql.*,beans.ServerConnection"%>
<jsp:useBean id="obj" class="beans.degap"></jsp:useBean>
<%
    String uid=(String)session.getAttribute("uid");
    String uname = request.getParameter("uname");    
    String country = request.getParameter("country");
    String scl = request.getParameter("clg");
    String address = request.getParameter("addrs");
    String degree[] = request.getParameterValues("deg");
    String dob = request.getParameter("dob");
    float phone = Float.parseFloat(request.getParameter("phn"));
    
    StringBuilder str= new StringBuilder(obj.appnd(degree));
    String deg = str.toString();

    Connection con=ServerConnection.getCon();
    PreparedStatement ps=con.prepareStatement("Update customer set Name=?,Country=?,College=?,Address=?,Degree=?,DOB=?,Contact=? where ID=?");
    ps.setString(1, uname);
    ps.setString(2, country);
    ps.setString(3, scl);
    ps.setString(4, address);
    ps.setString(5, deg);
    ps.setString(6, dob);
    ps.setFloat(7, phone);
    ps.setString(8, uid);
    
    int row=ps.executeUpdate();
    if(row>0) {
        out.println("Update successful");
    }
 %>
 <a href="loginpg.jsp">Back</a>