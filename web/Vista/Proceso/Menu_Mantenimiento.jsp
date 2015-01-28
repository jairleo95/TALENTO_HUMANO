<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
        Usuario us = new Usuario();
%>
<%-- 
    Document   : Mantenimiento_Proceso
    Created on : 14-nov-2014, 1:52:51
    Author     : ALFA 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="../../js/JQuery/jquery.autoheight.js"></script>
    </head>
    <body>
        <h1></h1>
        <ul>
    <li><a href="Mant_Proceso.jsp"  target="myframe">Procesos</a> </li>
    <li><a href="Mant_Tipo_Requerimiento.jsp"  target="myframe">Requerimiento</a></li>
    <li><a href="Mant_Paso.jsp"  target="myframe">Pasos</a></li>
    <li><a href="Mant_Paso_Puesto.jsp"  target="myframe">Paso - Puesto</a></li>
    <li><a href="Mant_Req_Proceso.jsp"  target="myframe">Requerimiento - Proceso</a></li>
    </ul>
    <iframe id="myframe" name="myframe" width="100%" height="800" scrolling="si" frameborder="0" src="Edit_Paso.jsp" />

</body>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>