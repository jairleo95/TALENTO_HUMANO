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
            Connection cx = Conexion.getConex();
     CallableStatement cst = cx.prepareCall("{CALL RHSP_INSERT_CONTRATO( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
       
            cst.setString(1,"");
            cst.setString(2, "DGP-000821");
            cst.setString(3, null);
            cst.setString(4, null);
            cst.setString(5, null);
            cst.setString(6, null);
            cst.setString(7, null);
            cst.setDouble(8, 0);
            cst.setDouble(9, 0);
            cst.setDouble(10, 0);
            cst.setDouble(11, 0);
            cst.setDouble(12, 0);
            cst.setDouble(13, 0);
            cst.setString(14, null);
            cst.setString(15, null);
            cst.setString(16, null);
            cst.setString(17, null);
            cst.setString(18, null);
            cst.setString(19, null);
            cst.setString(20, null);
            cst.setString(21, null);
            cst.setString(22, null);
            cst.setString(23, null);
            cst.setString(24, null);
            cst.setString(25, null);
            cst.setString(26, null);
            cst.setString(27, null);
            cst.setString(28, null);
            cst.setString(29, null);
            cst.setString(30, null);
            cst.setString(31, null);
            cst.setString(32, null);
            cst.setString(33, null);
            cst.setDouble(34, 0);
            cst.setString(35, null);
            cst.setString(36, null);
            cst.setString(37, null);
            cst.setDouble(38, 0);
            cst.setString(39, null);
            cst.setString(40, null);
            cst.setString(41, null);
            cst.setString(42, null);
            cst.setString(43, null);
            cst.setString(44, null);
            cst.setString(45, null);
            cst.setString(46, null);
            cst.setString(47, null);
            cst.execute();
        %>
    </body>
</html>
