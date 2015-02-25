<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<jsp:useBean id="ListarTrabajador2" scope="application" class="java.util.ArrayList"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Generar DGP</title>

        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/Css_Reporte/Reportes.css">
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
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

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

    <body class="body"  >



        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">
                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">

                        <center>
                            <div class="spacing" >
                                <center>
                                    <h1 class="spacing" style="font-weight: bold;">
                                        <%
                                            String idreq = "";
                                            String text = request.getParameter("text");
                                            String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");

                                            if (text.equals("1")) {
                                                out.println("Requerimiento: Tiempo Completo");
                                                idreq = "REQ-0001";
                                            }

                                            if (text.equals("2")) {
                                                out.println("Requerimiento: Medio Tiempo");
                                                idreq = "REQ-0002";
                                            }

                                            if (text.equals("3")) {
                                                out.println("Requerimiento: Tiempo Parcial");
                                                idreq = "REQ-0003";
                                            }
                                            if (text.equals("5")) {
                                                out.println("Requerimiento: Contrato Extranjero");
                                                idreq = "REQ-0005";
                                            }
                                            if (text.equals("7")) {
                                                out.println("Requerimiento: Practicas Pre Profesionales");
                                                idreq = "REQ-0007";
                                            }
                                            if (text.equals("8")) {
                                                out.println("Requerimiento: Practicas Profesionales");
                                                idreq = "REQ-0008";
                                            }
                                            if (text.equals("9")) {
                                                out.println("Requerimiento: Convenio Laboral");
                                                idreq = "REQ-0009";
                                            }
                                            if (text.equals("10")) {
                                                out.println("Requerimiento: Locación de Servicios");
                                                idreq = "REQ-0010";
                                            }
                                            if (text.equals("11")) {
                                                out.println("Requerimiento: No Domiciliado");
                                                idreq = "REQ-0011";
                                            }
                                        %>
                                    </h1>
                                </center>
                            </div>
                            <br>
                            <div>
                                <form method="post" action="../../trabajador" class="form-inline">                    
                                    <div class="form-group">
                                        <label class="control-label">Nombres:</label><br>
                                        <input type="text"  class="form-control"  name="nom">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" >Apellido Paterno:</label><br>
                                        <input type="text"  class="form-control"  name="ape_pat">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" >Apellido Materno:</label><br>
                                        <input type="text"  class="form-control"  name="ape_mat">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" >DNI:</label><br>
                                        <input type="text"  class="form-control"  onKeyPress="return checkIt(event)" name="dni" maxlength="8">
                                    </div>
                                    <input type="hidden" name="opc" value="Buscar">
                                    <input type="hidden" name="busc" value="Busc">
                                    <input type="hidden" name="busqueda" value="Buscar">
                                    <input type="hidden" name="id_req" value="<%=idreq%>">
                                    <input type="hidden" name="text" value="<%=text%>">
                                    <div class="form-group">
                                        <br>
                                        <button type="submit" class="btn btn-labeled btn-default"><span class="btn-label"><i class="fa fa-search"></i></span>Buscar </button>
                                        <a href="?cancel=true&text=<%=text%>" class="btn btn-labeled btn-danger"> <span class="btn-label"><i class="glyphicon glyphicon-remove"></i></span>Cancelar </a>
                                    </div>

                                </form>
                            </div>
                            <br>
                            <%
                                int count = ListarTrabajador2.size();
                                String cancel = request.getParameter("cancel");
                                if (cancel != null) {
                                    if (cancel.equals("true")) {
                                        ListarTrabajador2.clear();
                                    }
                                } else {

                                    if (count == 0) {
                            %>
                            <!--<strong>No se encontraron registros...</strong>-->
                            <%}%>
                            <table class="table table-hover" style="width: 50%" >
                                <thead>
                                    <tr >
                                        <th>Nro</th>
                                        <th>Foto</th>
                                        <th>Nombre</th>
                                        <th>Carrera</th>
                                        <th>Acciones</th>
                                    </tr>

                                </thead>

                                <tbody>
                                    <%if (count > 0) {%>

                                    <% for (int i = 0; i < ListarTrabajador2.size(); i++) {
                                            V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                                            tr = (V_Ficha_Trab_Num_C) ListarTrabajador2.get(i);
                                    %>
                                    <tr>
                                        <td><%out.println(i + 1);%></td>         
                                        <% if (tr.getAr_foto() == null) {%>
                                        <td><img src="../../imagenes/avatar_default.jpg"  width="30"  height="30"></td>
                                            <% } else {%>
                                        <td><img src="../Usuario/Fotos/<%=tr.getAr_foto()%>"  width="30"  height="30"></td>
                                            <% }%>

                                        <td><a href="../../trabajador?idtr=<%=tr.getId_trabajador()%>&opc=list"><%=tr.getAp_paterno().toUpperCase() + " " + tr.getAp_materno().toUpperCase() + " "+tr.getNo_trabajador() %></a></td>
                                        <td><%if (tr.getNo_carrera() != null) {
                                                out.println(tr.getNo_carrera());
                                            } else {
                                                out.println("Ninguna");
                                            }
                                            %></td>
                                        <td>
                                            <%if (tr.getEs_proceso() != null) {%>
                                             <%out.print(tr.getEs_proceso());%> 

                                            <% } else {
                                            %>
                                            <a href="../../dgp?idtr=<%=tr.getId_trabajador()%>&idreq=<%=idreq%>&iddep=<%=iddep%>&opc=Reg_form" 
                                               class="btn btn-primary">Elaborar Requerimiento <i class="fa fa-arrow-circle-right"></i></a>

                                            <%}%>
                                        </td>
                                    </tr>
                                    <% }%>

                                    <%ListarTrabajador2.clear();
                                    }%>
                                </tbody>


                                <%}%> 
                            </table>
                        </center>


                    </div>

                    <!-- end row -->

                    <!-- end row -->

                </section>
                <!-- end widget grid -->




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
