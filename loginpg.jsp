<%@page import = "java.sql.*"%>
<%@page import = "beans.ServerConnection"%>
<%
    if(session.getAttribute("uid") == null) {
    String userid=request.getParameter("uname");
    String name=(String)session.getAttribute("name");  
    session.setAttribute("uid",userid);
    session.setAttribute("uname",name);
    }        
%>
