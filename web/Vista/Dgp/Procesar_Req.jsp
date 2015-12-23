
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Procesar Requerimientos</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <!-- Basic Styles -->
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
        <script type="text/javascript" src="../../js/JQuery/jQuery.js" ></script>
    </head>
    <body>
        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">
                <!-- widget grid -->
                <section id="widget-grid" class="">
                    <!-- end row -->
                    <div class="row">
                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div id="alerta_dgp">
                            </div>
                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-blue" id="wid-id-1" data-widget-editbutton="false"  data-widget-deletebutton="false">
                                <!-- widget options:
                                usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

                                data-widget-colorbutton="false"
                                data-widget-editbutton="false"
                                data-widget-togglebutton="false"
                                data-widget-deletebutton="false"
                                data-widget-fullscreenbutton="false"
                                data-widget-custombutton="false"
                                data-widget-collapsed="true"
                                data-widget-sortable="false"

                                -->
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Procesar Requerimientos</h2>
                                </header>
                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding imprimir_tabla">

                                    </div>
                                    <!-- end widget content -->
                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->
                        </article>
                        <!-- WIDGET END -->
                    </div>
                    <!-- end row -->
                </section>
                <!-- end widget grid -->
            </div>
        </div>
    </body>
    <script src="../../js/coment/coment.js" type="text/javascript"></script>
    <!--================================================== -->

    <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
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

    <!-- EASY PIE CHARTS 
    <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>-->

    <!-- SPARKLINES 
    <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>-->

    <!-- JQUERY VALIDATE 
    <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>-->

    <!-- JQUERY MASKED INPUT 
    <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->

    <!-- JQUERY SELECT2 INPUT 
    <script src="../../js/plugin/select2/select2.min.js"></script>-->

    <!-- JQUERY UI + Bootstrap Slider 
    <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>-->

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

    <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT
    <!-- Voice command : plugin 
    <script src="../../js/speech/voicecommand.min.js"></script> -->

    <!-- PAGE RELATED PLUGIN(S) 
    <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>-->

    <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
    <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
    <script type="text/javascript">

        function reload_table() {
            var breakpointDefinition = {
                tablet: 1024,
                phone: 480
            };
            var responsiveHelper_dt_basic = undefined;
            /*  var responsiveHelper_datatable_fixed_column = undefined;
             var responsiveHelper_datatable_col_reorder = undefined;
             var responsiveHelper_datatable_tabletools = undefined;*/

            var otable = $('#dt_basic').dataTable({
                "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                        "t" +
                        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                "autoWidth": true,
                "preDrawCallback": function () {
                    // Initialize the responsive datatables helper once.
                    if (!responsiveHelper_dt_basic) {
                        responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
                    }
                },
                "rowCallback": function (nRow) {
                    responsiveHelper_dt_basic.createExpandIcon(nRow);
                },
                "drawCallback": function (oSettings) {
                    responsiveHelper_dt_basic.respond();
                }
            });

            // Apply the filter
            $("#dt_basic thead th input[type=text]").on('keyup change', function () {
                otable.column($(this).parent().index() + ':visible').search(this.value).draw();
            });
        }
        function procesar_lista(lista, tipo) {
            var array_id_dgp = [];
            var pos = 0;
            var url = (tipo === 1) ? "../../autorizacion?opc=UpdateStatusDgp_Procesar&tipo=1" : "../../autorizacion?opc=UpdateStatusDgp_Procesar&tipo=2";
            if (tipo === 1) {
                for (var i = 0, max = lista; i < max; i++) {
                    if ($(".chkAsigFam" + i).prop('checked')) {
                        array_id_dgp[pos] = $(".chkAsigFam" + i).val();
                        pos++;
                    }
                }
            } else if (tipo === 2) {
                for (var i = 0, max = lista; i < max; i++) {
                    if ($(".chkActSistEs" + i).prop('checked')) {
                        array_id_dgp[pos] = $(".chkActSistEs" + i).val();
                        pos++;
                    }
                }
            }

            if (array_id_dgp.length > 0) {
                //alert()
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {json: array_id_dgp},
                    dataType: 'json',
                    success: function (data) {
                        if (data.rpta == "1") {
                            $.SmartMessageBox({
                                title: "¡Atención!",
                                content: "¿Está seguro de procesar " + array_id_dgp.length + " requerimiento(s)?",
                                buttons: '[No][Si]'
                            }, function (ButtonPressed) {
                                if (ButtonPressed === "Si") {
                                    listar_autorizados();
                                    $.smallBox({
                                        title: "Se ha procesado correctamente los requerimientos...",
                                        content: "<i class='fa fa-clock-o'></i> <i>2 segundos atras...</i>",
                                        color: "#296191",
                                        iconSmall: "fa fa-thumbs-up bounce animated",
                                        timeout: 4000
                                    });
                                }

                            });
                        } else {
                            $.smallBox({
                                title: "¡Atención!",
                                content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar los requerimientos...</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 4000
                            });
                        }


                    },
                    error: function () {
                        $.smallBox({
                            title: "¡Atención!",
                            content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar los requerimientos...</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 4000
                        });

                    }
                });
            }
        }
        function listar_autorizados() {
            // var text_html = "";
            $.post("../../autorizacion", "opc=ShowListProcesarReq", function (objJson) {
                var lista = objJson.lista;
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                } else {/*
                 for (var i = 0; i < lista.length; i++) {
                 text_html += "<tr>";
                 text_html += "<td>" + (i + 1) + "</td>";
                 text_html += "<td><a href='../../trabajador?idtr=" + lista[i].idtr + "&opc=list'>" + lista[i].ap_p + " " + lista[i].ap_m + " " + lista[i].nombre + "</a></td>";
                 text_html += "<td>" + lista[i].puesto + "</td>";
                 text_html += "<td>" + lista[i].area + "</td>";
                 text_html += "<td>" + lista[i].dep + "</td>";
                 text_html += "<td>" + lista[i].req + "</td>";
                 if (lista[i].es_asignacion_f == "0") {
                 text_html += "<td class='smart-form'><center><label class='toggle'><input type='checkbox' name='checkbox-toggle' class='chkAsigFam" + (i) + "' value='" + lista[i].iddgp + "'><i data-swchon-text='SI' data-swchoff-text='NO'></i></label></center></td>";
                 } else {
                 text_html += "<td>Si</td>";
                 }
                 if (lista[i].es_activ_sis == "0") {
                 text_html += "<td class='smart-form' ><center><label class='toggle'><input type='checkbox' name='checkbox-toggle' class='chkActSistEs" + (i) + "' value='" + lista[i].iddgp + "' ><i data-swchon-text='SI' data-swchoff-text='NO'></i></label></center></td>";
                 } else {
                 text_html += "<td>Si</td>";
                 }
                 text_html += "</tr>";
                 
                 }*/
                    $('.imprimir_tabla').empty();
                    $('.imprimir_tabla').append(objJson.html_table);
                    $(".tbody_procesar_req").append(objJson.text_html);
                    $(".btnAsigFam").click(function () {
                        procesar_lista(lista, 1);
                    });
                    $(".btnActSisEs").click(function () {
                        procesar_lista(lista, 2);
                    });
                    reload_table();
                }
            });
        }
        $(document).ready(function () {
            pageSetUp();
            $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
            });
            listar_autorizados();

        })

    </script>
</html>
<%
    } else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
