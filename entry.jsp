<%@page import="beans.ServerConnection"%>
<jsp:useBean id="obj" class="beans.degap"></jsp:useBean>
<%@page import = "java.sql.*"%>
<%

    String uname = request.getParameter("uname");
    String uid = request.getParameter("id");    
    String country = request.getParameter("country");
    String gender = request.getParameter("gen");
    String scl = request.getParameter("clg");
    String address = request.getParameter("addrs");
    String degree[] = request.getParameterValues("deg");
    String dob = request.getParameter("dob");
    float phone = Float.parseFloat(request.getParameter("phn"));
    String password = request.getParameter("pass");
    
    StringBuilder str= new StringBuilder(obj.appnd(degree));
    String deg = str.toString();

    Connection con=ServerConnection.getCon();
    PreparedStatement ps=con.prepareStatement("Insert into customer values (?,?,?,?,?,?,?,?,?,?)");
    ps.setString(1, uname);
    ps.setString(2, uid);
    ps.setString(3, country);
    ps.setString(4, gender);
    ps.setString(5, scl);
    ps.setString(6, address);
    ps.setString(7, deg);
    ps.setString(8, dob);
    ps.setFloat(9, phone);
    ps.setString(10, password);

    int row = ps.executeUpdate();
    if(row==10) {
        out.println("<h1> You have successfully registered! </h1>");
    }

%>

