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
    ResultSet rs= null;
    
    Connection cx=  Conexion.getConex();
    Statement stmt=  null;

stmt= cx.createStatement();
//rs=stmt.executeQuery("select table_name, SUBSTR(column_name,1,1)||SUBSTR(lower(column_name),2,length(column_name)), data_type from user_tab_columns where table_name = 'RHTM_CONTRATO' order by table_name,column_id");
rs=stmt.executeQuery(" select * from List_Dao");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%System.out.println("1");%>
            <table >

           <% String objeto = "icd"; 

            while(rs.next()){
             
            %>
           <tr>
               
               <td><%
                if(rs.getString(4).equals("NUMBER") ){
                out.print( objeto+".set"+rs.getString(2)+"(rs.getDouble("+rs.getString(3).toLowerCase()+"));");    
                }else{
                out.print( objeto+".set"+rs.getString(2)+"(rs.getString("+rs.getString(3).toLowerCase()+"));");
               
                }
               
               %></td>
               
           </tr>
           <%}%>
       </table>
   
    </body>
</html>
