<%
    if(session.getAttribute("uid") == null) {
      response.sendRedirect("login.html");
    }    
%>
<br><a href="logout.jsp">Logout</a>