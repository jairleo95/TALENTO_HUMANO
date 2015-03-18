<%-- 
    Document   : Menu_puesto
    Created on : 16/03/2015, 08:22:34 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String opc= request.getParameter("opc"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">
    </head>
    <body>
        <div class="collapse navbar-collapse navbar-inverse">
            <ul class="nav navbar-nav">
                <li class="li1a"><a  href="Mant_Direccion.jsp"  target="myframe3"><i class="glyphicon glyphicon-plus"></i><span> Direccion</span></a></li>
                <li class="li2a"><a href="Mant_Departamento.jsp"  target="myframe3"><i class="glyphicon glyphicon-cog"></i><span> Departamento</span></a></li>
                <li class="li3a"><a  href="Mant_Area.jsp"  target="myframe3"><i class="glyphicon glyphicon-flash"></i><span> Area</span></a></li> 
                <li class="li4a"><a  href="Mant_Seccion.jsp"  target="myframe3"><i class="glyphicon glyphicon-flash"></i><span> Seccion</span></a></li> 
                <li class="li5a"><a  href="Mant_Puesto.jsp"  target="myframe3"><i class="glyphicon glyphicon-flash"></i><span> Puesto</span></a></li> 
            </ul>

        </div>
        <iframe id="myframe" name="myframe3" width="100%" height="800" scrolling="si" frameborder="0" src="<%=opc%>.jsp" ></iframe>
    </body>
</html>
