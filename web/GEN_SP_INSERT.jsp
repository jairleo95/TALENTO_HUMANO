<%-- 
    Document   : GEN_SP_INSERT
    Created on : 17-jul-2014, 11:53:24
    Author     : Alfa.sistemas
--%>
<%@page import="java.sql.Statement"%>
<%@page import="lib.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%
     Connection cx = Conexion.getConex();
     Connection cx2 = Conexion.getConex();
     ResultSet rs = null;
     Statement stmt = null;
    ResultSet rs2 = null;
    Statement stmt2 = null;
   
    stmt = cx.createStatement();
    rs = stmt.executeQuery("select table_name ,count(column_name)from user_tab_columns group by table_name order by table_name");
    
    stmt2 = cx2.createStatement();
    rs2 = stmt2.executeQuery("select table_name, column_name,data_type,data_length,column_id from user_tab_columns order by table_name,column_id");


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% while (rs.next()){%>
        <%out.println( "CREATE OR REPLACE PROCEDURE SP_INSERT_"+rs.getString(1)+" (");
      
        %>     
         <br>
         <%while(rs2.next()){%>
         <%if (rs.getString(1)==rs2.getString(1)) {%>
         <%out.println(rs2.getString(2)+"_SP"+rs.getString(3)); %>
         <%if (rs2.getString(5)!=rs.getString(2)) {
                out.println(",");%>
         <br>
         <%}else{%>
                 <br>
                 <%out.println(") ");%>
             <%}}%>   
         <%}%>
         <% out.println(" IS BEGIN");%>
         <br>
         <% out.println(" INSERT INTO "+rs.getString(1)+" ( ");
         
         %>
         
         <% while (rs2.next()){
            
             if(rs2.getString(1)==rs.getString(1)){
             out.println(rs2.getString(1));
             if(rs2.getString(5)!=rs.getString(2)){
             out.println(",");
             } else{
             out.println(") VALUES (");
             }
             } 
             
         }%>
         
         <%
         while(rs2.next()){
         if(rs.getString(1)==rs2.getString(1)){
         out.println(rs2.getString(2)+"_SP");
         if(rs2.getString(5)!=rs.getString(2)){
         out.println(",");
         }else{
             out.println(");");%>
         <br>
         <%out.println("END;");
         
            }%>
         
         <%}%>
         <%}%>
    <br>
   <%out.println("/");%>
   <br>
   <br>
<%}%>
         
         
       <% //}%> 
       
        
    </body>
</html>
