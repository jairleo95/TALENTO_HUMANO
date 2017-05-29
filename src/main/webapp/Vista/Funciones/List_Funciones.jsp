<%-- 
    Document   : List_Funciones
    Created on : 29-ene-2015, 7:04:40
    Author     : joserodrigo
--%>
<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upeu.application.model.Funciones"%>
<jsp:useBean id="Listar_funciones" scope="session" class="java.util.ArrayList"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <%--<link href="../../css/Css_Lista/listas.css" rel="stylesheet" type="text/css"/>--%>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Funciones</title>
        <link href="../../css/businessLogic/Funciones/funciones.css" rel="stylesheet" type="text/css"/>
    <menu class="doc">        
    </menu>
</head>   
<body>
    <h1>Funciones</h1>
    <table class=" tabla table table-bordered"> 
        <thead>
            <tr>
                <td>N°</td>
                <td>Detalle Funcion</td>
                <td>Estado</td>
                <td>Puesto</td>
                <td>Tipo</td>
                <td colspan="2"><center>Opcion</center></td>
</tr>
</thead>
<tbody class="tbodys"></tbody>                    
</table>
</body>
</html>
<script src="../../js/JQuery/jQuery.js" type="text/javascript"></script>
<script src="../../js/businessLogic/Funciones/funciones.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>