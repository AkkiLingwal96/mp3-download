<%
    if(session.getAttribute("uid") == null) {
      response.sendRedirect("login.html");
    }
    else {
        String id=(String)session.getAttribute("uid");
        String name=(String)session.getAttribute("uname");
        
        if(name.equals("Abhishek") && id.equals("admin01")) {
        out.println("Welcome Admin.."); %>
        <div align="center">
        <br><table align="center">
            <tr>
                <td> <a href="entry.html">
                        Insert Data<br>
            </a>
            </tr>
            <tr>
                <td> <a href="">
                        Update Data<br>
                    </a>
            </tr>
            <tr>
                <td> <a href="">
                        Delete Data<br>
                    </a>
            </tr>
        </table>
        <br><a href="logout.jsp">Logout</a>
        </div>
    <%
    } 
    else
       out.println("Welcome "+name+"..");
   
    }    
%>
<br><a href="logout.jsp">Logout</a>