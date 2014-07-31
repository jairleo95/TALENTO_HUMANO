<%-- 
    Document   : Prueba_Jair
    Created on : 31-jul-2014, 10:35:40
    Author     : Alfa.sistemas
--%>

<%@page import="pe.edu.upeu.application.factory.Conexion"%>
<%@page import="java.sql.Types"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String ID = "";
            Connection cx = Conexion.getConex();
            CallableStatement sentencia = cx.prepareCall("{?=call RHFU_REQ_PRO_ID_DGP(?)}");
            sentencia.registerOutParameter(1, Types.VARCHAR);
            sentencia.setString(2, "DGP-000821");

            sentencia.executeQuery();

            ID = sentencia.getString(1);

            out.println(ID);

        %>
    </body>
</html>
