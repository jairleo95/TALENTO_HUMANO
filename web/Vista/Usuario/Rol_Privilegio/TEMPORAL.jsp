<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : TEMPORAL
    Created on : 13-nov-2014, 20:54:31
    Author     : joserodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <li ><a href="../../../Roles?opc=Listar_Rol" class="homeIcon">Mantenimiento roles</a> </li>
    <li ><a href="../../../Privilegio?opc=Listar_Privilegio">Mantenimiento Privilegios</a> </li>
    <li ><a href="../../../Privilegio?opc=Otorgar">Otorgar Roles</a> </li>
    <!--<li ><a href="Mantenimiento_Privilegio.jsp">Otorgar Roles</a> </li>-->
    </body>
</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>