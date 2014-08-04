<%-- 
    Document   : Prueba_Jair
    Created on : 31-jul-2014, 10:35:40
    Author     : Alfa.sistemas
--%>

<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pe.edu.upeu.application.factory.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           /* Connection cx = Conexion.getConex();
     CallableStatement cst = cx.prepareCall("{CALL RHSP_INSERT_AUTORIZACION( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, "DGP-000823");
            cst.setString(3, "1");
            cst.setString(4, "PU1");
            cst.setString(5, "123412312");
            cst.setString(6, "qwerrtrewq");
            cst.setString(7, "qweqweqwee");
            cst.setString(8, "31/07/14");
            cst.setString(9, "3213");
            cst.setString(10, "PUT-000136");
            cst.setString(11, "DRP-000001");
            cst.setString(12, "PAS-000001");
           cst.execute();*/

        %>
        
        <form action="../autorizacion">
            <input type="submit" >
        </form>
    </body>
</html>
