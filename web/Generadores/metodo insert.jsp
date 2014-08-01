<%-- 
    Document   : metodo insert
    Created on : 31/07/2014, 06:47:46 PM
    Author     : Admin
--%>

<%@page import="pe.edu.upeu.application.factory.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <%
         ResultSet rs = null;
            Statement stmt2 = null;
            
            Connection cx = Conexion.getConex();

            stmt2 = cx.createStatement();
            rs = stmt2.executeQuery("select table_name, column_name,data_type from user_tab_columns  where table_name = 'RHTV_AUTORIZACION'order by table_name,column_id");

        
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table >

           <% String objeto = "cst"; 
                int num = 1;
            while(rs.next()){
             
            %>
           <tr>
               
               <td><%
                
                if(rs.getString(3).equals("NUMBER") ){
                out.print( objeto+".setDouble("+num+","+rs.getString(2)+");");    
                }else{
                out.print( objeto+".setString("+num+","+rs.getString(2)+");");  ;
               
                }
               
               %></td>
               
           </tr>
           <%}%>
       </table>
    </body>
</html>
