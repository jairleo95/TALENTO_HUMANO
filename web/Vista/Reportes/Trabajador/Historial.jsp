<%-- 
    Document   : Historial
    Created on : 14/04/2015, 10:05:59 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial de Modificaciones</title>

        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

        <!-- #FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- #GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
    </head>
    <body>
        <header>
            <div class="page-header">
                <h1 class="text-center">Historial de Modificaciones <small>/ Trabajadores</small></h1>

            </div>
        </header>
        <div id="main" role="main" style="margin: 0px;">
            <div id="content" >
                <section id="widget-grid" class="">
                    <div class="row">
                        <div class="col col-sm-12">
                            <div class="well">
                                <form class="smart-form">
                                    <h1 class="text-left font-md semi-bold">Filtros</h1><br>
                                    <div class="row">
                                        <section class="col col-sm-2">
                                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
                                                <input type="text" name="request" placeholder="Seleccionar Fecha" class="datepicker" data-dateformat='dd/mm/yy'>
                                            </label>
                                        </section>                                    
                                    </div>
                                </form>
                            </div>

                        </div>

                    </div>
                    <div class="row">
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3" data-widget-editbutton="false">
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Historial</h2>
                                </header>
                                <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>a</th>
                                                        <th>a</th>
                                                        <th>a</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </section>
            </div>
        </div>







        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
            if (!window.jQuery) {
                document.write('<script src="../../js/libs/jquery-2.0.2.min.js"><\/script>');
            }
        </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
            if (!window.jQuery.ui) {
                document.write('<script src="../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
            }
        </script>
        <script src="../../../js/app.config.js"></script>
        <script src="../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 
        <script src="../../../js/bootstrap/bootstrap.min.js"></script>
        <script src="../../../js/notification/SmartNotification.min.js"></script>
        <script src="../../../js/smartwidgets/jarvis.widget.min.js"></script>
        <script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
        <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>
        <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>
        <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>
        <script src="../../../js/plugin/select2/select2.min.js"></script>
        <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
        <script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>
        <script src="../../../js/plugin/fastclick/fastclick.min.js"></script>
        <!--[if IE 8]>
        
        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
        
        <![endif]-->

        <!-- Demo purpose only -->
        <script src="../../../js/demo.min.js"></script>
        <script src="../../../js/app.min.js"></script>
        <script src="../../../js/speech/voicecommand.min.js"></script>
        <script src="../../../js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="../../../js/plugin/fuelux/wizard/wizard.min.js"></script>
        <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>
        <script type="text/javascript">
            runAllForms();
            $(function () {
                $("#smart-form-register").validate();
            });
        </script>
    </body>

</html>
