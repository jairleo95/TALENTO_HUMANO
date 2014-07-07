<%-- 
    Document   : Prueba
    Created on : 07-jul-2014, 15:47:04
    Author     : Alfa.sistemas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="lib.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
        ResultSet rs = null;
          Connection cx= Conexion.getConex();
    PreparedStatement ps = cx.prepareStatement("SELECT  * FROM USUARIO");
   rs=ps.executeQuery();
   
 
   %>
       
       <table>

           <%  while(rs.next()){%>
           <tr>
               <td><%=rs.getString(2)%></td>
               
           </tr>
           <%}%>
       </table>
    </body>
</html>
