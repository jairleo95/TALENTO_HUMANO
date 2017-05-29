<%@page import="pe.edu.upeu.application.model.V_Solicitud_Requerimiento"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Validar Foto</title>

        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../../img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">

        <link href="../../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../../css/your_style.css" rel="stylesheet" type="text/css"/>
        <style>
            .noti{ 
                width:40px;
                height: 40px; 
                border-radius:50%;
                background: #e74c3c; 
                color: white;
                font-size: 20px;
                padding-left:6px;
                padding-top: 9px;
                margin-left: 230px;
                position:fixed;
                z-index: 5;
            }
            .pre-img{
                width:50px;
                height: 50px;
                border-radius: 50%;
            }
            .modal-dialog {
                top: 20%;
                width: 100%;
                position: absolute;
            }
            .modal-content {
                border-radius: 0px;
                border: none;
                top: 40%;
            }
            .modal-body {
                background-color: #fff;

                color: black;
            }
        </style>
    </head>
    <body class="body"  >
        <div class="col-lg-offset-1 col-md-offset-1">
            <!-- widget grid -->
            <section id="widget-grid" class="">

                <!-- row -->
                <div class="row">
                    <article class="col-sm-11">
                        <!-- new widget -->
                        <div class="jarviswidget" id="wid-id-0" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">

                            <header>
                                <span class="widget-icon"> <i class="glyphicon glyphicon-stats txt-color-darken"></i> </span>
                                <h2>Validar Fotos</h2>

                                <ul class="nav nav-tabs pull-right in" id="myTab"> 
                                    <li class="active">
                                        <a data-toggle="tab" href="#s1"><i class="fa fa-check-circle"></i> <span class="hidden-mobile hidden-tablet">Fotos Para Validar</span></a>

                                    </li>

                                    <li>
                                        <a data-toggle="tab" href="#s2"><i class="fa fa-check"></i> <span class="hidden-mobile hidden-tablet">Fotos Validadas</span></a>
                                    </li>
                                </ul>

                            </header>

                            <!-- widget div-->
                            <div class="no-padding">
                                <!-- end widget edit box -->

                                <div class="widget-body">
                                    <!-- content -->
                                    <div id="myTabContent" class="tab-content">
                                        <div class="tab-pane fade active in padding-10 no-padding-bottom" id="s1">


                                            <table id="example-table" class="table table-striped" >
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Apellido Paterno</th>
                                                        <th>Apellido Materno</th>
                                                        <th>Nombre</th>
                                                        <th>Foto</th>

                                                    </tr>
                                                </thead>
                                            </table>

                                        </div>
                                        <!-- end s1 tab pane -->

                                        <div class="tab-pane fade" id="s2">
                                            <table id="example-table2" class="table table-condensed" >
                                                <thead>
                                                    <tr>
                                                        <th>DNI</th>
                                                        <th>Apellido Paterno</th>
                                                        <th>Apellido Materno</th>
                                                        <th>Nombre</th>
                                                        <th>Foto</th>
                                                    </tr>
                                                </thead>
                                            </table>

                                        </div>

                                    </div>

                                    <!-- end content -->
                                </div>

                            </div>
                            <!-- end widget div -->
                        </div>
                        <!-- end widget -->

                    </article>
                </div>

                <!-- end row -->

            </section>
            <!-- end widget grid -->
        </div>

        <div class="modal-foto modal fade  bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <div class="modal-body text-center">

                        <h1 class="namet"></h1>
                        <span class="badge noti"></span>
                        <div class="foto-tr">
                            <img style= "width: 400px; height:  300px;" class="imagental img-thumbnail"/>
                        </div>

                        <div class="Validar">
                            <small>Validar la Foto  ? </small>
                            <form>
                                <input class="id-tr" type="hidden" >
                                <input type="hidden" value="">

                                <button class="acep btn btn-success btn-md"><samp class="fa fa-check"></samp> Aceptar</button>
                                <button class="recha btn btn-danger btn-md"><samp class="fa fa-ban"></samp> Rechazar</button>

                            </form>   
                        </div>



                    </div>
                </div>
            </div>
        </div>
    </body>



    <!--================================================== -->

    <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->

    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script>
        if (!window.jQuery) {
            document.write('<script src="../../../js/libs/jquery-2.0.2.min.js"><\/script>');
        }
    </script>

    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script>
        if (!window.jQuery.ui) {
            document.write('<script src="../../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
        }
    </script>

    <!-- IMPORTANT: APP CONFIG -->
    <script src="../../../js/app.config.js"></script>

    <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
    <script src="../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

    <!-- BOOTSTRAP JS -->
    <script src="../../../js/bootstrap/bootstrap.min.js"></script>

    <!-- CUSTOM NOTIFICATION -->
    <script src="../../../js/notification/SmartNotification.min.js"></script>

    <!-- JARVIS WIDGETS -->
    <script src="../../../js/smartwidgets/jarvis.widget.min.js"></script>

    <!-- EASY PIE CHARTS -->
    <script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

    <!-- SPARKLINES -->
    <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

    <!-- JQUERY VALIDATE -->
    <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

    <!-- JQUERY MASKED INPUT -->
    <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

    <!-- JQUERY SELECT2 INPUT -->
    <script src="../../../js/plugin/select2/select2.min.js"></script>

    <!-- JQUERY UI + Bootstrap Slider -->
    <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

    <!-- browser msie issue fix -->
    <script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

    <!-- FastClick: For mobile devices -->
    <script src="../../../js/plugin/fastclick/fastclick.min.js"></script>

    <!--[if IE 8]>
    
    <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
    
    <![endif]-->

    <!-- Demo purpose only 
    <script src="../../../js/demo.min.js"></script>-->

    <!-- MAIN APP JS FILE -->
    <script src="../../../js/app.min.js"></script>

    <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
    <!-- Voice command : plugin -->
    <script src="../../../js/speech/voicecommand.min.js"></script>

    <!-- PAGE RELATED PLUGIN(S) -->
    <script src="../../../js/plugin/jquery-form/jquery-form.min.js"></script>
    <script src="../../../js/plugin/datatables/jquery.dataTables.min.js"></script>
    <script src="../../../js/plugin/datatables/dataTables.colVis.min.js"></script>
    <script src="../../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
    <script src="../../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
    <script src="../../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
    <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>
    <script type="text/javascript">
        var term;
        $(document).ready(function () {
            DataT("0", "#example-table");
            DataT("2", "#example-table2");

        });

        function DataT(p, tab) {

            $(tab).DataTable({
                "autoWidth": true,
                "ajax": {
                    "url": "../../../validar_foto?opc=getFotos&estado=" + p,
                    "type": "POST",
                    "dataSrc": "Fotos_NoVal"
                },
                "columns": [
                    {"data": "NU_DOC"},
                    {"data": "AP_PATERNO"},
                    {"data": "AP_MATERNO"},
                    {"data": "NO_TRABAJADOR"}
                ],
                "createdRow": function (row, data, index) {
                    $(row).append('<td><img class="pre-img" src="../../../Archivo/Fotos/' + data.AR_FOTO + '" /></td>');
                    if (data.EFOTO == "1") {
                        $(row).addClass("success");
                    } else if (data.EFOTO == "2") {
                        $(row).addClass("danger");
                    }
                    $(row).click(function () {
                        if (data.EFOTO == "0") {
                            $('.Validar').show(200);
                            $('.modal-foto').modal('show');
                            $('.imagental').attr("src", "../../../Archivo/Fotos/" + data.AR_FOTO);
                            $('.namet').text(data.NO_TRABAJADOR + ' ' + data.AP_PATERNO + ' ' + data.AP_MATERNO);
                            $('.id-tr').val(data.ID_TRABAJADOR);
                        } else {
                            $('.Validar').hide();
                            $('.modal-foto').modal('show');
                            $('.imagental').attr("src", "../../../Archivo/Fotos/" + data.AR_FOTO);
                            $('.namet').text(data.NO_TRABAJADOR + ' ' + data.AP_PATERNO + ' ' + data.AP_MATERNO);

                        }

                    });

                }

            });

        }




        $('.acep').click(function () {
            var idtr = $('.id-tr').val();
            $.ajax({
                type: 'POST',
                url: '../../../validar_foto',
                data: 'opc=validar&idtr=' + idtr + '&estado=1',
                success: function (r) {

                }
            });

        });

        $('.recha').click(function () {
            var idtr = $('.id-tr').val();
            $.ajax({
                type: 'POST',
                url: '../../../validar_foto',
                data: 'opc=validar&idtr=' + idtr + '&estado=2',
                success: function (r) {
                }
            });
        });

    </script>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
