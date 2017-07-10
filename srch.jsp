<%@page import="beans.ServerConnection"%>
<%@page import = "java.sql.*"%>
<%
    String Id = request.getParameter("id");
    Connection con=ServerConnection.getCon();
    PreparedStatement ps = con.prepareStatement("Select * from customer where ID=?");
    ps.setString(1,Id);
    ResultSet rs = ps.executeQuery();
    if(!rs.next())
    {
        out.println("<h1>User does not exist!</h1>");
        out.println("<a href=search.html>Back</a>");
    }
    else {
    do {
    String name=rs.getString(1);
    String gen=rs.getString(4);
    String clg=rs.getString(5);
    out.println("Found");
    out.println("Name: "+name+"<br>");
    out.println("College/School: "+clg+"<br>");
    out.println("Gender: "+gen+"<br>");
    
    } while(rs.next());
    }
%>