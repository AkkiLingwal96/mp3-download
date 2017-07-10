<%@page import="beans.ServerConnection"%>
<jsp:useBean id="obj" class="beans.degap"></jsp:useBean>
<%@page import = "java.sql.*"%>
<%

    String uname = request.getParameter("uname");
    String uid = request.getParameter("id");    
    String country = request.getParameter("country");
    String gender = request.getParameter("gen");
    String dob = request.getParameter("dob");
    String password = request.getParameter("pass");
    
    Connection con=ServerConnection.getCon();
    PreparedStatement ps=con.prepareStatement("Insert into customer values (?,?,?,?,?,?)");
    ps.setString(1, uname);
    ps.setString(2, uid);
    ps.setString(3, password);
    ps.setString(4, gender);
    ps.setString(5, dob);
    ps.setString(6, country);
    
    int row = ps.executeUpdate();
    if(row>0) {
        out.println("<h1> You have successfully registered! </h1>");
    }

%>

