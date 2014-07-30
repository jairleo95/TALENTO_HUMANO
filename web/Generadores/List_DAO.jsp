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
//sentencia para generar correctamente los set y get en los list DAO
/*select table_name, column_name,data_type,data_length,column_id from user_tab_columns order by table_name,column_id;

select * from user_tab_columns;

create view List_Dao1 as
select table_name, SUBSTR(column_name,1,1)||SUBSTR(lower(column_name),2,length(column_name)) as columna , '"'||COLUMN_NAME||'"' as columna1, data_type 
from user_tab_columns 
where table_name = 'RHTD_PADRE_MADRE_CONYUGUE' order by table_name,column_id;
*/
//rs=stmt.executeQuery(" select * from List_Dao5");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%System.out.println("1");%>
            <table >

           <% String objeto = "ft"; 

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
