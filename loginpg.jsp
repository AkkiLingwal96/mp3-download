<%@page import = "java.sql.*"%>
<%@page import = "beans.ServerConnection"%>
<%
    if(session.getAttribute("uid") == null) {
    String userid=request.getParameter("uname");
    String name=(String)session.getAttribute("name");  
    session.setAttribute("uid",userid);
    session.setAttribute("uname",name);
    }
    
    
    String uid = (String)session.getAttribute("uid");
    String name = (String)session.getAttribute("uname");
    
    if(uid.equals("admin01") && name.equals("Abhishek")) {
        out.println("Welcome Admin.."); %>
        <br><table align="center">
            <tr>
                <td> <a href="insert.html">
                        Insert Data<br>
            </a>
            </tr>
            <tr>
                <td> <a href="update.jsp">
                        Edit Profile<br>
                    </a>
            </tr>
            <tr>
                <td> <a href="">
                        Delete Data<br>
                    </a>
            </tr>
        </table>
        <br><a href="logout.jsp">Logout</a>
    <%
    } 
 else {
    
       out.println("Welcome "+name+"..");
%>
<br><table align="center">
            <tr>
                <td> <a href="update.jsp">
                        Edit Profile<br>
                    </a>
            </tr>
            <tr>
                <td> <a href="deleteacc.jsp">
                        Delete Account<br>
                    </a>
            </tr>
        </table>
<br><a href="logout.jsp">Logout</a>
    <%
}
  
%>