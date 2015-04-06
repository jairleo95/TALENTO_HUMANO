<%-- 
    Document   : Menu_puesto
    Created on : 16/03/2015, 08:22:34 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <style>
            a{
                color: #3276b1;
            }
        </style>
    </head>
   
    <body>
        <div class="navbar-collapse bg-color-white">
            <ul class="nav navbar-nav">
                <li class=" active li1a"><a  href="Mant_Direccion.jsp"  target="myframe3"><i class="glyphicon glyphicon-bookmark"></i><span> Direccion</span></a></li>
                <li class="li2a"><a href="Mant_Departamento.jsp"  target="myframe3"><i class="glyphicon glyphicon-bookmark"></i><span> Departamento</span></a></li>
                <li class="li3a"><a  href="Mant_Area.jsp"  target="myframe3"><i class="glyphicon glyphicon-bookmark"></i><span> Area</span></a></li> 
                <li class="li4a"><a  href="Mant_Seccion.jsp"  target="myframe3"><i class="glyphicon glyphicon-bookmark"></i><span> Seccion</span></a></li> 
                <li class="li5a"><a  href="Mant_Puesto.jsp"  target="myframe3"><i class="glyphicon glyphicon-bookmark"></i><span> Puesto</span></a></li> 
            </ul>

        </div>
        
        <iframe id="myframe" name="myframe3" width="100%" height="800" scrolling="si" frameborder="0" src="Mant_Direccion.jsp" ></iframe>
    </body>
    <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
            if (!window.jQuery) {
                document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');
            }
        </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
            if (!window.jQuery.ui) {
                document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
            }
        </script>
        <script src="../../js/app.config.js"></script>
        <script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 
        <script src="../../js/bootstrap/bootstrap.min.js"></script>
        <script src="../../js/notification/SmartNotification.min.js"></script>
        <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>
        <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>
        <script src="../../js/plugin/select2/select2.min.js"></script>
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
        <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>
        <script src="../../js/plugin/fastclick/fastclick.min.js"></script>
        <script src="../../js/demo.min.js"></script>
        <script src="../../js/app.min.js"></script>
</html>
