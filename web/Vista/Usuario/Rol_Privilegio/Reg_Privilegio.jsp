<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%-- 
    Document   : List_Roles
    Created on : 31-oct-2014, 12:36:30
    Author     : joserodrigo
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Listar Privilegios</title>
        <link rel="stylesheet" href="../../../css/Css_Lista/listas.css" />

    </head>
    <body>
        <form action="../../../Privilegio" method="post">
            <center>
            <button name="opc" value="Registrar">Registrar Nuevo Privilegio </button>
        </center>
        </form>
    </body>
</html>
<%@include file="List_Privilegios.jsp" %>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>