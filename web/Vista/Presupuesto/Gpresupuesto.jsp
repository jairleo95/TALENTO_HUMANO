<%-- 
    Document   : Gpresupuesto
    Created on : 24/06/2017, 09:37:35 PM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
        <div class="col-lg-2 col-md-2">
            <div class="list-group"><br/><br/>
                <button type="button" id="v2" onclick="changeOption(this.id)" class="list-group-item us" >Actualizar Presupuesto</button>
                <button type="button" id="v1" onclick="changeOption(this.id)" class="list-group-item us active">Asignar Presupuesto</button>
                <button type="button" class="list-group-item disabled">Historial de Modificaciones</button>
                <button type="button" class="list-group-item disabled">Reporte por Área</button>
            </div>
        </div>
        <div id="vcont" class="col-md-8 col-lg-8">            
        </div>



        <div class="col-lg-2 col-md-2">
            <input type="hidden" id="vopt" value="1">
        </div>


        <script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
        <script src="../../ajax/ajax.google.min.js"></script> 
        <script src="../../js/plugin/pfnotify/pnotify.custom.min.js" type="text/javascript"></script>
        <script src="LogicPresup.js" type="text/javascript"></script>
        
    </body>

</html>
