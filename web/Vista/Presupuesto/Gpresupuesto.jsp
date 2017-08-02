<%-- 
    Document   : Gpresupuesto
    Created on : 24/06/2017, 09:37:35 PM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Presupuesto</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <link href="../../js/plugin/pfnotify/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/datatable.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="col-lg-2 col-md-2">
            <div class="list-group"><br/><br/>
                <button type="button" id="v2" onclick="changeOption(this.id)" class="list-group-item us" >Actualizar Presupuesto</button>
                <button type="button" id="v1" onclick="changeOption(this.id)" class="list-group-item us active">Asignar Presupuesto</button>
                <button type="button" id="v3" onclick="changeOption(this.id)" class="list-group-item us">Historial de Presupuesto</button>
            </div>
        </div>
        <div id="vcont" class="col-md-9 col-lg-9">            
        </div>        
        <input type="hidden" id="vopt" value="1">
        <input type="hidden" id="id_cc" value="1">
        <input type="hidden" id="tipo_p" value="0">


        <script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>        
        <script src="../../ajax/ajax.google.min.js"></script> 
        <script src="../../js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../js/plugin/pfnotify/pnotify.custom.min.js" type="text/javascript"></script>
        <script src="../../js/plugin/datatables/datatable.js" type="text/javascript"></script>
        <script src="LogicPresup.js" type="text/javascript"></script>

    </body>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
