<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : Mantenimiento_Proceso
    Created on : 14-nov-2014, 1:52:51
    Author     : ALFA 3
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Procesos</title>
       
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
       

    </head>    
    <body>
        <h1></h1>
        <div class="collapse navbar-collapse navbar-inverse">
            <ul class="nav navbar-nav">
                <li class="li1a"><a href="Mant_Paso.jsp"  target="myframe3"><i class="glyphicon glyphicon-cog"></i><span> Procesos</span></a></li>
                <!-- <li><a href="Mant_Tipo_Requerimiento.jsp"  target="myframe3">Requerimiento</a></li>-->
                <li class="li2a"><a  href="Mant_Proceso.jsp"  target="myframe3"><i class="glyphicon glyphicon-plus"></i><span> Pasos</span></a></li>
                <li class="li3a"><a  href="Mant_Req_Proceso.jsp"  target="myframe3"><i class="glyphicon glyphicon-flash"></i><span> Requerimiento-Proceso</span></a></li> 
            </ul>

        </div>
        <iframe id="myframe" name="myframe3" width="100%" height="800" scrolling="si" frameborder="0" src="Mant_Proceso.jsp" ></iframe>
         <script src="../../js/JQuery/jQuery.js" type="text/javascript"></script>
          <script type="text/javascript" src="../../js/JQuery/jquery.autoheight.js"></script>
         <script src="../../js/businessLogic/Proceso/MenuMantenimiento.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>