<%-- 
    Document   : index
    Created on : 07-jul-2014, 11:31:10
    Author     : Docente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/jscss1.jspf" %>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/toplogueo.jspf" %>
        <div>
        <div id="logueo"></div>
        <div id="caja_logueo">
            <form class="form-signin" method="post" action="CIndex">
                <!--<div style="font-size: 24px; text-align: center;" >RRHH</div>-->
                <div><input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" autocomplete="off" autofocus ></div>
                <div><input type="password" class="form-control" placeholder="Clave" name="clave" id="clave"></div>
                <div><input  type="submit" id="enviar" class="btn btn-lg btn-primary btn-block" value="Iniciar Sesión" name="opc"></div>
            </form>
        </div>
        <div id="mensaje"></div>
        </div>
        <%@include file="WEB-INF/jspf/bottom1.jspf" %>
        <%@include file="WEB-INF/jspf/seg1.jspf" %>
    </body>
</html>
