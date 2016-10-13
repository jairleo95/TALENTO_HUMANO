<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <style>
            .caja{
                background:transparent url(../../img/Gifloader.GIF) center no-repeat;
            }
        </style>
        <title>Reporte APS</title>
    </head>
    <body> 

        <div class="col-lg-10 col-lg-offset-1">
            <div class="row">
                <div class="form-group">  
                    <br>
                    <a id="btnbuscar" class="btn btn-primary btn-circle btn-xl btnEnviar">
                        <i class="glyphicon glyphicon-search"></i>
                    </a>
                    <a id="btncancel" class="btn btn-danger btn-circle btn-xl btnCancelar">
                        <i class="glyphicon glyphicon-remove"></i>
                    </a>
                </div>
            </div>
            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3" data-widget-editbutton="false">
                <header>
                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                    <h2>Reporte ················· </h2>

                </header>

                <!-- widget div-->
                <div>

                    <!-- widget edit box -->
                    <div class="jarviswidget-editbox">
                        <!-- This area used as dropdown edit box -->

                    </div>
                    <!-- end widget edit box -->
                    <!-- widget content -->
                    <div class="widget-body no-padding">

                        <table id="datatable_tabletools" class="table table-striped table-bordered table-hover table-responsive" width="100%">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>CÓDIGO APS</th>
                                    <th>Tipo de documento del trabajador</th>
                                    <th>Número de documento del trabajador</th>
                                    <th>País emisor del documento</th>
                                    <th>Formación Superior Completa</th>
                                    <th>CODIGO DE SITUACION EDUCATIVA</th>
                                    <th>Indicador de educación completa en una Institución Educativa del Perú</th>
                                    <th>Código de la Institución Educativa</th>
                                    <th>Código de la Carrera</th>
                                    <th>Año de Egreso</th>
                                </tr>
                            </thead>
                            <tbody id="Li_cump">
                            </tbody>
                        </table>
                        <div class="div_t">                                                                                     
                        </div>

                    </div>
                    <!-- end widget content -->
                </div>
            </div>    

            <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>

            <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
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

            <!-- IMPORTANT: APP CONFIG -->
            <script src="../../js/app.config.js"></script>

            <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
            <script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

            <!-- BOOTSTRAP JS -->
            <script src="../../js/bootstrap/bootstrap.min.js"></script>

            <!-- CUSTOM NOTIFICATION -->
            <script src="../../js/notification/SmartNotification.min.js"></script>

            <!-- JARVIS WIDGETS -->
            <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>

            <!-- EASY PIE CHARTS -->
            <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

            <!-- SPARKLINES -->
            <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

            <!-- JQUERY VALIDATE -->
            <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

            <!-- JQUERY MASKED INPUT -->
            <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

            <!-- JQUERY SELECT2 INPUT -->
            <script src="../../js/plugin/select2/select2.min.js"></script>

            <!-- JQUERY UI + Bootstrap Slider -->
            <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

            <!-- browser msie issue fix -->
            <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

            <!-- FastClick: For mobile devices -->
            <script src="../../js/plugin/fastclick/fastclick.min.js"></script>

            <!--[if IE 8]>
    
            <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
    
            <![endif]-->

            <!-- Demo purpose only -->
            <script src="../../js/demo.min.js"></script>

            <!-- MAIN APP JS FILE -->
            <script src="../../js/app.min.js"></script>

            <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
            <!-- Voice command : plugin -->
            <script src="../../js/speech/voicecommand.min.js"></script>

            <!-- PAGE RELATED PLUGIN(S) -->
            <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
            <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
            <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
            <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
            <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
            <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>

            <script>
                $(document).ready(function () {
                });
            </script>
    </body>


</html>
