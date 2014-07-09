<%-- 
    Document   : Prueba
    Created on : 07-jul-2014, 15:47:04
    Author     : Alfa.sistemas
--%>


<%@page import="java.sql.Statement"%>
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
    /*PreparedStatement ps = cx.prepareStatement("SELECT  * FROM USUARIO WHERE USUARIO=? AND CLAVE=?");
    
    ps.setString(1, "SECRE135");
    ps.setString(2, "123");
   rs=ps.executeQuery();*/
       Statement stmt = null;
       String u="SECRE57";
       String c="123";
       stmt=cx.createStatement();
       rs= stmt.executeQuery("select * from usuario where usuario='"+u+"' and clave='"+c+"'");
 
          
          
   

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
