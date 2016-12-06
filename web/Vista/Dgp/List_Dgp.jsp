<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.model.X_List_det_dgp"%>
<jsp:useBean id="List_Det_Dgp" scope="session" class="java.util.ArrayList"/>  
<jsp:useBean id="List_Trb_Mod_Rel" scope="session" class="java.util.ArrayList"/>  
<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Reportes </title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
            <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
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
    </head>
    <body class="">
        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">
                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">

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
                                    <span class="widget-icon"> <i class="fa fa-list"></i> </span>
                                    <h2 class="font-md"><strong>Lista </strong> <i>Requerimientos</i></h2>
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
                                        <table id="dt_basic" class="table table-striped table-bordered table-hover" >
                                            <thead>
                                                <tr>
                                                    <th data-hide="phone">ID</th>
                                                    <th data-hide="phone">Mes</th>
                                                    <th data-hide="phone">Año</th>
                                                    <th data-class="expand">Apellidos y Nmbres</th>
                                                    <th data-class="expand">Nro. Documento</th>
                                                    <th data-class="expand">Código APS</th>
                                                    <th>Motivo</th>
                                                    <th>Fecha Inicio</th>
                                                    <th data-hide="phone">Fecha Fin</th>
                                                    <th data-hide="phone,tablet">Sueldo</th>
                                                    <th data-hide="phone,tablet">Bono de Alimentos </th>
                                                    <th data-hide="phone,tablet">Bono por Función </th>
                                                    <th data-hide="phone,tablet">Asig. Familiar</th>
                                                    <th data-hide="phone,tablet">Total Remun.</th>
                                                    <th data-hide="phone,tablet">Puesto</th>
                                                    <th data-hide="phone,tablet">Area</th>
                                                    <th data-hide="phone,tablet">Requerimiento</th>
                                                    <th data-hide="phone,tablet">Estado</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (int i = 0; i < List_Det_Dgp.size(); i++) {
                                                        X_List_det_dgp x = new X_List_det_dgp();
                                                        x = (X_List_det_dgp) List_Det_Dgp.get(i); %>
                                                <tr>
                                                    <td><%out.print(i + 1);%></td>
                                                    <td><%=x.getMes_procesamiento()%></td>
                                                    <td><%=x.getAnno_procesamiento()%></td>
                                                    <td ><a href="../../trabajador?idtr=<%=x.getId_trabajador()%>&opc=list"><%=x.getAp_paterno().toUpperCase() + " " + x.getAp_materno().toUpperCase() + " " + x.getNo_trabajador().toUpperCase()%></a></td>
                                                   
                                                    <td><%=x.getNu_doc()%></td>
                                                    <td> <%
                                                        if (x.getCod_aps() == 0) {
                                                            out.print("");
                                                        } else {
                                                            out.print(x.getCod_aps());
                                                        }
                                                    %>
                                                   </td>
                                                    <td>  <%if (x.getLi_motivo().equals("2")) {
                                                            out.print("Renovación");
                                                        } else if (x.getLi_motivo().equals("1")) {
                                                            out.print("Trabajador Nuevo");
                                                        }
                                                        %>
                                                    </td>   
                                                    <td><%=x.getFe_desde()%></td>
                                                    <td><%=x.getFe_hasta()%></td>
                                                    <td><%=x.getCa_sueldo()%></td>
                                                    <td><%=x.getCa_bono_alimentario()%></td>
                                                    <td><%=x.getCa_bonificacion_p()%></td>
                                                    <td><%=x.getCa_asig_familiar()%></td>
                                                    <td><%=x.getCa_sueldo() + x.getCa_bono_alimentario() + x.getCa_bonificacion_p() + x.getCa_asig_familiar()%></td>
                                                    <td><%=x.getNo_puesto()%></td>
                                                    <td><%=x.getNo_area()%></td>
                                                    <td><a href="../../dgp?iddgp=<%=x.getId_dgp()%>&idtr=<%=x.getId_trabajador()%>&opc=Detalle "><%=x.getNo_req()%></a></td>
                                                    <td><%
                                                        if (x.getEs_dgp().equals("1")) {
                                                            out.print("Terminado");
                                                        }
                                                        if (x.getEs_dgp().equals("0")) {
                                                            out.print("En Proceso");
                                                        }
                                                        %></td>
                                                </tr>
                                                <%}
                                                    List_Det_Dgp.clear();%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- end widget content -->
                                </div>
                            </div>
                            <!-- end widget div -->
                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-1" data-widget-editbutton="false">
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
                                    <span class="widget-icon"> <i class="fa fa-list"></i> </span>
                                    <h2 class="font-md"><strong>Trabajadores </strong> <i>Modificados</i></h2>

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

                                        <table id="datatable_tabletools2" class="table table-striped table-bordered table-hover" width="100%">
                                            <thead>
                                                <tr>
                                                    <th data-hide="phone">ID</th>
                                                    <th data-class="expand">Nombres y Apellidos</th>
                                                    <th>DNI</th>
                                                    <th data-hide="phone">Religión</th>
                                                    <th data-hide="phone,tablet">E-mail</th>
                                                    <th data-hide="phone,tablet">Celular</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (int i = 0; i < List_Trb_Mod_Rel.size(); i++) {
                                                        Trabajador e = new Trabajador();
                                                        e = (Trabajador) List_Trb_Mod_Rel.get(i);
                                                %>
                                                <tr>
                                                    <td><%out.print(i + 1);%></td>
                                                    <td>
                                                        <a href="../../trabajador?idtr=<%=e.getId_trabajador()%>&opc=list"><%=e.getNo_trabajador().toUpperCase() + " " + e.getAp_paterno().toUpperCase() + " " + e.getAp_materno().toUpperCase()%></a></td>
                                                    <td><%=e.getNu_doc_c()%></td>
                                                    <td>
                                                        <%
                                                            if (e.getLi_religion().trim().equals("1")) {
                                                                out.print("Adventista");
                                                            }
                                                            if (e.getLi_religion().trim().equals("2")) {
                                                                out.print("Católico");
                                                            }
                                                            if (e.getLi_religion().trim().equals("3")) {
                                                                out.print("Otros");
                                                            }%>
                                                    </td>
                                                    <td><%=e.getDi_correo_personal()%></td>
                                                    <td align="center">
                                                        <%if (e.getCl_tra() == null) {
                                                                out.print("-");
                                                            }%>
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


                        </article>
                        <!-- WIDGET END -->




                    </div>


                    <!-- end row -->

                </section>
                <!-- end widget grid -->

            </div>
            <!-- END MAIN CONTENT -->

        </div>
        <!-- END MAIN PANEL -->



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
        <!-- Voice command : plugin -->

        <!-- PAGE RELATED PLUGIN(S) 
        <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>-->

        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

        <script type="text/javascript">

    // DO NOT REMOVE : GLOBAL FUNCTIONS!

    $(document).ready(function () {

        pageSetUp();

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
            /*tablet: 1024,
             phone: 480*/
        };

        $('#dt_basic').dataTable({
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
                        "sTitle": "Lista_Requerimientos_PDF",
                        "sPdfMessage": "Empleados PDF Export",
                        "sPdfSize": "letter"
                    },
                    {
                        "sExtends": "print",
                        "sMessage": "Generado por AlfaTeam <i>(presiona Esc para cerrar)</i>"
                    }
                ],
                "sSwfPath": "../../js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
            },
            "autoWidth": true,
            "preDrawCallback": function () {
                // Initialize the responsive datatables helper once.
                if (!responsiveHelper_datatable_tabletools) {
                    responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
                }
            },
            "rowCallback": function (nRow) {
                responsiveHelper_datatable_tabletools.createExpandIcon(nRow);
            },
            "drawCallback": function (oSettings) {
                responsiveHelper_datatable_tabletools.respond();
            }
        });

        /* END BASIC */
        /* TABLETOOLS */



        /* END COLUMN SHOW - HIDE */

        /* TABLETOOLS */
        $('#datatable_tabletools2').dataTable({
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
                        "sTitle": "Requerimientos_PDF",
                        "sPdfMessage": "Requeriemintos PDF Export",
                        "sPdfSize": "letter"
                    },
                    {
                        "sExtends": "print",
                        "sMessage": "Generado por AlfaTeam <i>(presiona Esc para cerrar)</i>"
                    }
                ],
                "sSwfPath": "../../js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
            },
            "autoWidth": true,
            "preDrawCallback": function () {
                // Initialize the responsive datatables helper once.
                if (!responsiveHelper_datatable_tabletools) {
                    responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper($('#datatable_tabletools2'), breakpointDefinition);
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
    </body>


</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>                                                                                                                                        