<%@page import="java.sql.*,beans.ServerConnection"%>
<%
    String Uid=(String)session.getAttribute("uid");
    Connection con=ServerConnection.getCon();
    PreparedStatement ps = con.prepareStatement("Delete from customer where ID=?");
    ps.setString(1, Uid);
    int row=ps.executeUpdate();
    session.removeAttribute("uname");
    session.removeAttribute("uid");
    session.removeAttribute("name");
    session.invalidate();
    if(row>0) {
        out.println("Account Deleted");
    }
%>