<%-- 
    Document   : List_DAO
    Created on : 24/07/2014, 09:05:45 AM
    Author     : Admin
--%>

<%@page import="pe.edu.upeu.application.factory.Conexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

            ResultSet rs = null;
            Statement stmt2 = null;
            
            Connection cx = Conexion.getConex();

            stmt2 = cx.createStatement();
            rs = stmt2.executeQuery("select table_name, initcap(SUBSTR(COLUMN_NAME,1,2))||lower(SUBSTR(COLUMN_NAME,3,LENGTH(COLUMN_NAME))),column_name,data_type from user_tab_columns  where table_name='RHVD_USUARIO'");

   
    
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <table >

           <% String objeto = "v"; 

            while(rs.next()){
             
            %>
           <tr>
               
               <td><%
                
                if(rs.getString(4).equals("NUMBER") ){
                out.print( objeto+".set"+rs.getString(2)+"(rs.getDouble(\""+rs.getString(3).toLowerCase()+"\"));");    
                }else{
                out.print( objeto+".set"+rs.getString(2)+"(rs.getString(\""+rs.getString(3).toLowerCase()+"\"));");
               
                }
               
               %></td>
               
           </tr>
           <%}%>
       </table>
   
    </body>
</html>
