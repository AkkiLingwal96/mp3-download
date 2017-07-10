<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Log out</title>
    </head>
    <body> 
        <%
            session.removeAttribute("uname");
            session.removeAttribute("uid");
            session.removeAttribute("name");
            session.invalidate();
            %>
            <h1>You have successfully logged out!<br></h1>

    </body>
</html>
