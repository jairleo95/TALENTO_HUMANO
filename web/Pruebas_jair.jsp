<%-- 
    Document   : Pruebas_jair
    Created on : 22/07/2014, 05:15:39 PM
    Author     : Admin
--%>


<%@page import="pe.edu.upeu.application.factory.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="pe.edu.upeu.application.factory.ConexionBD"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="pe.edu.upeu.application.model.V_Privilegio"%>
<%@page import="pe.edu.upeu.application.dao.RolDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceRolDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection cnn= Conexion.getConex();
     CallableStatement cst= cnn.prepareCall("{CALL SP_ANNO (?,?,?,?,?)}");
        %>
    </body>
</html>
