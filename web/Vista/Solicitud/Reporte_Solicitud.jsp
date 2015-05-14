<%@page import="pe.edu.upeu.application.model.V_Solicitud_Requerimiento"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>

<jsp:useBean id="Listar_solicitud" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Reporte de Solicitudes</title>

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
        <script type="text/javascript" src="../../js/Js_Alerta/alertify.js"></script>
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.core.css" />
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.default.css" />
        <script type="text/javascript"  src="../../js/Js_Alerta/Alertas.js"></script>
    </head>

    <%if (request.getParameter("r") != null) {
            if (request.getParameter("r").equals("ok")) {
    %>

    <body onload='exito("Procesado con exito!", "Usted ha realizado una autorización correctamente.");' class="body">
        <%
                }
            }%>
        <%if (request.getParameter("m") != null) {
                if (request.getParameter("m").equals("si")) {
        %>

    <body onload='exito("Procesado con exito!", "Codigo APS ingresado correctamente");' class="body">
        <%
                }
            }%>
        <%if (request.getParameter("h") != null) {
                if (request.getParameter("h").equals("si")) {
        %>

    <body onload='exito("Procesado con exito!", "Codigo huella ingresado correctamente");' class="body">
        <%
            }
        } else {
        %>
    <body class="body"  >
        <%}%> 
        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">
                <!-- widget grid -->
                <section id="widget-grid" class="">
                    <div class="row">
                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div id="alerta_dgp">
                            </div>
                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-greenDark" id="wid-id-0" data-widget-editbutton="false">
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
                                    <h2>Solicitud de Requerimientos</h2>
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

                                        <table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
                                            <thead>
                                                <tr>
                                                    <th><strong>Nro</strong></th>
                                                    <th>Acciones</th>  
                                                    <th data-class="expand"><strong>Apellidos y Nombres</strong></th>
                                                    <th data-hide="phone,tablet" ><strong>Departamento</strong></th>
                                                    <th data-class="expand" ><strong>Area</strong></th>
                                                    <th data-hide="phone,tablet"><strong>Puesto</strong></th>

                                                    <th data-hide="phone,tablet"><strong>Fecha Inicio</strong></th>
                                                    <th data-hide="phone,tablet"><strong>Fecha Cese</strong></th>
                                                    <th  data-hide="phone,tablet">Fecha Solicitud</th>  
                                                    <th  data-hide="phone,tablet">Estado</th>  
                                                </tr>
                                            </thead>
                                            <tbody> 
                                                <%for (int i = 0; i < Listar_solicitud.size(); i++) {
                                                        V_Solicitud_Requerimiento s = new V_Solicitud_Requerimiento();
                                                        s = (V_Solicitud_Requerimiento) Listar_solicitud.get(i);
                                                %>
                                                <tr>
                                                    <td><%=(i + 1)%></td>
                                                    <td>
                                                        <div class="btn-group">
                                                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                                Accion <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu">
                                                                <li><a href="../../dgp?iddgp=<%=s.getId_dgp().trim()%>&idtr=<%=s.getId_trabajador().trim()%>&opc=Detalle"> Ver Requerimiento</a></li>
                                                                <li class="divider"></li>
                                                                <li>
                                                                    <button class="btn btn-primary btn-labeled btn_sol" data-toggle="modal" type="button" data-target="#myModal" value="<%=s.getId_solicitud_dgp()%>"><span class="btn-label"><i class="fa fa-envelope"></i></span>
                                                                        Ver Solicitud
                                                                    </button>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                    <td><a href="../../trabajador?idtr=<%=s.getId_trabajador()%>&opc=list"><strong><%=s.getAp_paterno() + " " + s.getAp_materno() + " " + s.getNo_trabajador()%></strong></a></td>
                                                    <td><%=s.getNo_dep()%></td>
                                                    <td><%=s.getNo_area()%></td>
                                                    <td><%=s.getNo_puesto()%></td>
                                                    <td><%=s.getFe_desde()%></td>
                                                    <td><%=s.getFe_hasta()%></td>

                                                    <td><%=s.getFe_creacion()%></td>
                                                    <td>
                                                        <%if (s.getEs_autorizar().trim().equals("0")) {
                                                                out.print("Sin autorizar");
                                                            } else if (s.getEs_autorizar().trim().equals("1")) {
                                                                out.print("Autorizado");
                                                            }

                                                        %>
                                                    </td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
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


                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel"><span class="btn-label"><i class="fa fa-envelope"></i></span> <strong>Solicitud de Requerimiento</strong></h4>
                            </div>
                            <div class="modal-body">
                                <table class="table table-hover table-striped  table-responsive tabla_detalle_sol" ></table>
                                <input  type="hidden" value="" class="data_procesar" />
                            </div>
                            <div class="modal-footer foot_sol">
                                <button type="button" class="btn btn-default btn-labeled" data-dismiss="modal"><span class="btn-label"><i class="fa fa-times"></i></span>
                                    Cancel
                                </button>
                                <button class="btn btn-primary btn-labeled btn_procesar_sol"  type="button" ><span class="btn-label"><i class="fa fa-check"></i></span>
                                    Procesar
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->

            </div>
        </div>
    </body>



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
    <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>
    <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
    <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
    <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>


    <script type="text/javascript">

        // DO NOT REMOVE : GLOBAL FUNCTIONS!

        $(document).ready(function () {
            pageSetUp();
            $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
            });
            $(".cod_aps").numeric();
            $(".btn_procesar_sol").click(function () {

                var valor = $(this).val();
                $.SmartMessageBox({
                    title: "¡Advertencia!",
                    content: "¿Esta seguro de procesar esta solicitud?",
                    buttons: '[No][Si]'
                }, function (ButtonPressed) {
                    if (ButtonPressed === "Si") {
                        $.ajax({
                            url: "../../solicitud_requerimiento",
                            data: "opc=Procesar_Solicitud" + $(".data_procesar").val(),
                            type: "post"

                        }).done(function () {
                            $.smallBox({
                                title: "¡Procesado con exito!",
                                content: "<i class='fa fa-clock-o'></i> <i>Se ha procesado la solicituid correctamente...</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 4000
                            });

                        });
                    }
                    if (ButtonPressed === "No") {
                    }
                });
            });
            $(".btn_sol").click(function () {

                var tb = $(".tabla_detalle_sol");
                tb.empty();
                var texto_html = '';
                $.post("../../solicitud_requerimiento", "opc=Ver_Solicitud&id=" + $(this).val(), function (objJson) {
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    for (var i = 0; i < lista.length; i++) {
                        texto_html += '<tr><td colspan="2" class="text-info table-bordered"><i class="fa fa-file"></i> REQUERIMIENTO : ' + lista[i].req + '</td></tr>';
                        texto_html += '<tr><td>Apellidos y Nombres</td><td>' + lista[i].ap_p + ' ' + lista[i].ap_m + ' ' + lista[i].nombre + '</td></tr>';
                        if (lista[i].ti_plazo == '1') {
                            texto_html += '<tr><td>Tipo de Plazo</td><td>Ingreso a planilla</td></tr>';
                        }

                        if (lista[i].ti_plazo == '2') {
                            texto_html += '<tr><td>Tipo de Plazo</td><td>Inicio de Contrato</td></tr>';
                        }

                        texto_html += '<tr><td>Nombre de Plazo</td><td>' + lista[i].plazo + '</td></tr>';
                        texto_html += '<tr><td>Detalle de Plazo</td><td>' + lista[i].detalle_plazo + '</td></tr>';
                        if (lista[i].ti_plazo == '2') {
                            texto_html += ' <tr><td>Fecha de inicio de contrato solicitado : </td><td>' + lista[i].fecha_plazo + '</td></tr>';
                        }
                        else {
                            texto_html += ' <tr><td>Mes de ingreso solicitado : </td><td>' + lista[i].mes + '</td></tr>';
                        }
                        texto_html += '<tr><td>Motivo de solicitud</td><td>' + lista[i].solicitud + '</td></tr>';
                        $(".data_procesar").val("&id=" + lista[i].id + "&tipo=" + lista[i].ti_plazo + "&fecha=" + lista[i].fecha_plazo);
                        if (lista[i].es_aut == '1') {
                            texto_html += '<tr><td>Estado de solicitud</td><td>Autorizado</td></tr>';
                        }
                        if (lista[i].es_aut == '0') {
                            texto_html += '<tr><td>Estado de solicitud</td><td>Sin Autorizar</td></tr>';
                        }

                    }
                    tb.append(texto_html);
                    texto_html = "";
                });
            });
            /* // DOM Position key index //
             l - Length changing (dropdown)
             f - Filtering input (search)
             t - The Table! (datatable)
             i - Information (records)
             p - Pagination (paging)
             r - pRocessing 
             < and > - div elements
             <"#id" and > - div with an id
             <"class" and > - div with a class
             <"#id.class" and > - div with an id and class
             
             Also see: http://legacy.datatables.net/usage/features
             */

            /* BASIC ;*/
            var responsiveHelper_dt_basic = undefined;
            var responsiveHelper_datatable_fixed_column = undefined;
            var responsiveHelper_datatable_col_reorder = undefined;
            var responsiveHelper_datatable_tabletools = undefined;
            var breakpointDefinition = {
                tablet: 1024,
                phone: 480
            };
            $('#dt_basic').dataTable({
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
            /* END BASIC */

            /* COLUMN FILTER  */
            var otable = $('#datatable_fixed_column').DataTable({
                //"bFilter": false,
                //"bInfo": false,
                //"bLengthChange": false
                //"bAutoWidth": false,
                //"bPaginate": false,
                //"bStateSave": true // saves sort state using localStorage
                "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6 hidden-xs'f><'col-sm-6 col-xs-12 hidden-xs'<'toolbar'>>r>" +
                        "t" +
                        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                "autoWidth": true,
                "preDrawCallback": function () {
                    // Initialize the responsive datatables helper once.
                    if (!responsiveHelper_datatable_fixed_column) {
                        responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper($('#datatable_fixed_column'), breakpointDefinition);
                    }
                },
                "rowCallback": function (nRow) {
                    responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
                },
                "drawCallback": function (oSettings) {
                    responsiveHelper_datatable_fixed_column.respond();
                }

            });
            // custom toolbar
            $("div.toolbar").html('<div class="text-right"><img src="img/logo.png" alt="SmartAdmin" style="width: 111px; margin-top: 3px; margin-right: 10px;"></div>');
            // Apply the filter
            $("#datatable_fixed_column thead th input[type=text]").on('keyup change', function () {

                otable
                        .column($(this).parent().index() + ':visible')
                        .search(this.value)
                        .draw();
            });
            /* END COLUMN FILTER */

            /* COLUMN SHOW - HIDE */
            $('#datatable_col_reorder').dataTable({
                "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'C>r>" +
                        "t" +
                        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
                "autoWidth": true,
                "preDrawCallback": function () {
                    // Initialize the responsive datatables helper once.
                    if (!responsiveHelper_datatable_col_reorder) {
                        responsiveHelper_datatable_col_reorder = new ResponsiveDatatablesHelper($('#datatable_col_reorder'), breakpointDefinition);
                    }
                },
                "rowCallback": function (nRow) {
                    responsiveHelper_datatable_col_reorder.createExpandIcon(nRow);
                },
                "drawCallback": function (oSettings) {
                    responsiveHelper_datatable_col_reorder.respond();
                }
            });
            /* END COLUMN SHOW - HIDE */

            /* TABLETOOLS */
            $('#datatable_tabletools').dataTable({
                // Tabletools options: 
                //   https://datatables.net/extensions/tabletools/button_options
                "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'T>r>" +
                        "t" +
                        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
                "oTableTools": {
                    "aButtons": [
                        "copy",
                        "csv",
                        "xls",
                        {
                            "sExtends": "pdf",
                            "sTitle": "SmartAdmin_PDF",
                            "sPdfMessage": "SmartAdmin PDF Export",
                            "sPdfSize": "letter"
                        },
                        {
                            "sExtends": "print",
                            "sMessage": "Generated by SmartAdmin <i>(press Esc to close)</i>"
                        }
                    ],
                    "sSwfPath": "js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
                },
                "autoWidth": true,
                "preDrawCallback": function () {
                    // Initialize the responsive datatables helper once.
                    if (!responsiveHelper_datatable_tabletools) {
                        responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper($('#datatable_tabletools'), breakpointDefinition);
                    }
                },
                "rowCallback": function (nRow) {
                    responsiveHelper_datatable_tabletools.createExpandIcon(nRow);
                },
                "drawCallback": function (oSettings) {
                    responsiveHelper_datatable_tabletools.respond();
                }
            });
            /* END TABLETOOLS */

        })

    </script>
    <!-- Your GOOGLE ANALYTICS CODE Below -->
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
        _gaq.push(['_trackPageview']);
        (function () {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();
    </script>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>
