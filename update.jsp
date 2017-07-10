<%@page import="beans.ServerConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit your profile</title>
    </head>
    <body>
        <%
        try{ 
            String Uid =(String)session.getAttribute("uid");
            Connection con = ServerConnection.getCon();
            PreparedStatement ps = con.prepareStatement("Select * from customer where ID=?");
            ps.setString(1, Uid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){ 
            %> 
        <form action="updateprocess.jsp" method="GET">
            <table align="center">
                <tr>
                    <td> Name: <td> <input type="text" name="uname" value="<%=rs.getString("Name")%>"><br> 
                     </tr>
                <tr>
                    <td> Country:<td> <select name="country" <%=rs.getString("Country")%>>
                            <option value=""></option>
                            <option value="India">India</option>
                            <option value="Sri Lanka">Sri Lanka</option>
                            <option value="Pakistan">Pakistan</option>
                            <option value="Nepal">Nepal</option>
                            <option value="Myanmar">Myanmar</option>
                            <option value="Bangladesh">Bangladesh</option>
                        </select><br> 
                    </tr>    
                <tr>
                    <td> College:<td> <input type="text" name="clg" value="<%=rs.getString("College")%>"><br> 
                    </tr>
                <tr>
                    <td> Address:<td> <input type="text" name="addrs" value="<%=rs.getString("Address")%>"><br> 
                    </tr>
                <tr> 
                   <td> Degree: <td><input type="checkbox" name="deg" value="Maths">Maths <input type="checkbox" name="deg" value="B.tech"> B.tech
                       <input type="checkbox" name="deg" value="BBA">BBA <input type="checkbox" name="deg" value="MBA">MBA 
                       <input type="checkbox" name="deg" value="BCOM">BCOM <input type="checkbox" name="deg" value="BSc">BSc
                       <td><input type="checkbox" name="deg" value="MA">MA<br>
                     </tr>
                <tr>
                    <td> Date of Birth:<td> <input type="date" name="dob" value="<%=rs.getString("DOB")%>"><br> 
                    </tr>
                <tr>
                    <td> Contact:<td> <input type="text" name="phn" value="<%=rs.getString("Contact")%>"><br> 
                    </tr>
                    <% 
                        }

                        } catch (Exception e) {
    
                        e.printStackTrace();
                        }  
                     %>
                    <td>&emsp; <input type="submit" value="Save"> 
                    <td> <input type="reset" value="Clear">
                        <input type="submit" formaction="loginpg.jsp" value="Back">
                     </tr> 
            </table>
        </form>
    </body>
</html>
