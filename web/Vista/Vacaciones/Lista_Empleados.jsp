<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.model.V_List_Empleado"%>
<jsp:useBean id="List_Empleado" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-us">
    <head>
        <meta charset="utf-8">
            <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

            <title> Lista Empleado </title>
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
                                                                                                                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                                                                                                            <h2>Lista de Empleados </h2>

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

                                                                                                                                <table id="datatable_fixed_column"  class="table table-striped table-bordered" width="100%">

                                                                                                                                    <thead>
                                                                                                                                        <tr>
                                                                                                                                            <th></th>
                                                                                                                                            <th class="hasinput" style="width:16%">
                                                                                                                                                <input type="text" class="form-control" placeholder="Filtro Nombre" />
                                                                                                                                            </th>
                                                                                                                                            <th class="hasinput" style="width:16%">
                                                                                                                                                <input type="text" class="form-control" placeholder="Filtro Área" />
                                                                                                                                            </th>
                                                                                                                                            <th class="hasinput" style="width:16%">
                                                                                                                                                <input type="text" class="form-control" placeholder="Filtro Sección" />
                                                                                                                                            </th>
                                                                                                                                            <th class="hasinput" style="width:16%">
                                                                                                                                                <input type="text" class="form-control" placeholder="Filtro Puesto" />
                                                                                                                                            </th>
                                                                                                                                            <th class="hasinput" style="width:12%">
                                                                                                                                                <input type="text" class="form-control" placeholder="Filtro Puesto" />
                                                                                                                                            </th>
                                                                                                                                            <th class="hasinput" style="width:12%">
                                                                                                                                                <input type="text" class="form-control" placeholder="Filtro Puesto" />
                                                                                                                                            </th>
                                                                                                                                            <th></th>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <th data-class="expand">ID</th>
                                                                                                                                            <th data-hide="phone">Nombre Y Apellidos</th>
                                                                                                                                            <th data-hide="phone">Area</th>
                                                                                                                                            <th data-hide="phone,tablet">Seccion</th>
                                                                                                                                            <th data-hide="phone,tablet">Puesto</th>
                                                                                                                                            <th data-hide="phone,tablet">Fecha Inico</th>
                                                                                                                                            <th data-hide="phone,tablet">Fecha Fin</th>
                                                                                                                                            <th class="sorting_asc_disabled" >Vacaciones<center><input type="checkbox" name="all" id="all" onclick="checkAll();"></center></th>


                                                                                                                                        </tr>
                                                                                                                                    </thead>
                                                                                                                                    <tbody>
                                                                                                                                        <% for (int i = 0; i < List_Empleado.size(); i++) {
                                                                                                                                                V_List_Empleado e = new V_List_Empleado();
                                                                                                                                                e = (V_List_Empleado) List_Empleado.get(i);
                                                                                                                                        %>
                                                                                                                                        <tr>
                                                                                                                                            <td><%out.print(i + 1);%></td>

                                                                                                                                            <td>
                                                                                                                                                <% if (e.getAr_foto() == null) {%>
                                                                                                                                                <img src="../../img/avatar_default.jpg"  width="30"  height="30">
                                                                                                                                                    <% } else {%>
                                                                                                                                                    <img src="../Usuario/Fotos/<%=e.getAr_foto()%>"  width="30"  height="30">
                                                                                                                                                        <% }%>

                                                                                                                                                        <a href="../../trabajador?idtr=<%=e.getId_trabajador()%>&opc=list"><%=e.getNo_trabajador().toUpperCase() + " " + e.getAp_paterno().toUpperCase() + " " + e.getAp_materno().toUpperCase()%></a></td>
                                                                                                                                                        <td><%=e.getNo_area()%></td>
                                                                                                                                                        <td><%=e.getNo_seccion()%></td>
                                                                                                                                                        <td><%=e.getNo_puesto()%></td>
                                                                                                                                                        <td><%=e.getFe_desde()%></td>
                                                                                                                                                        <td><%=e.getFe_hasta()%></td>
                                                                                                                                                        <td><center><input type="checkbox" /></center></td>
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
                                                                                                                                                        <footer>
                                                                                                                                                            <center>
                                                                                                                                                                <button type="submit" class="btn btn-primary">
                                                                                                                                                                    Enviar Lista de  Empelados  
                                                                                                                                                            </center>
                                                                                                                                                        </footer>
                                                                                                                                                        </div>
                                                                                                                                                        <!-- end row -->

                                                                                                                                                        <!-- end row -->

                                                                                                                                                        </section>
                                                                                                                                                        <!-- end widget grid -->

                                                                                                                                                        </div>
                                                                                                                                                        <!-- END MAIN CONTENT -->

                                                                                                                                                        </div>
                                                                                                                                                        <!-- END MAIN PANEL -->





                                                                                                                                                        <!--================================================== -->

                                                                                                                                                        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
                                                                                                                                                        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>

                                                                                                                                                        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
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
                                                                                                                                                        <script src="../../js/plugin/datatables/newjavascript.js"></script>
                                                                                                                                                        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
                                                                                                                                                        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
                                                                                                                                                        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
                                                                                                                                                        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

                                                                                                                                                        <script>
                                                                                                                                                function checkAll() {
                                                                                                                                                    var nodoCheck = document.getElementsByTagName("input");
                                                                                                                                                    var varCheck = document.getElementById("all").checked;
                                                                                                                                                    for (i = 0; i < nodoCheck.length; i++) {
                                                                                                                                                        if (nodoCheck[i].type == "checkbox" && nodoCheck[i].name != "all" && nodoCheck[i].disabled == false) {
                                                                                                                                                            nodoCheck[i].checked = varCheck;
                                                                                                                                                        }
                                                                                                                                                    }
                                                                                                                                                }
                                                                                                                                                        </script>

                                                                                                                                                        <script type="text/javascript">

                                                                                                                                                            // DO NOT REMOVE : GLOBAL FUNCTIONS!

                                                                                                                                                            $(document).ready(function() {

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
                                                                                                                                                                    tablet: 1024,
                                                                                                                                                                    phone: 480
                                                                                                                                                                };

                                                                                                                                                                $('#dt_basic').dataTable({
                                                                                                                                                                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                                                                                                                                                                            "t" +
                                                                                                                                                                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                                                                                                                                                                    "autoWidth": true,
                                                                                                                                                                    "preDrawCallback": function() {
                                                                                                                                                                        // Initialize the responsive datatables helper once.
                                                                                                                                                                        if (!responsiveHelper_dt_basic) {
                                                                                                                                                                            responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
                                                                                                                                                                        }
                                                                                                                                                                    },
                                                                                                                                                                    "rowCallback": function(nRow) {
                                                                                                                                                                        responsiveHelper_dt_basic.createExpandIcon(nRow);
                                                                                                                                                                    },
                                                                                                                                                                    "drawCallback": function(oSettings) {
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
                                                                                                                                                                    "preDrawCallback": function() {
                                                                                                                                                                        // Initialize the responsive datatables helper once.
                                                                                                                                                                        if (!responsiveHelper_datatable_fixed_column) {
                                                                                                                                                                            responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper($('#datatable_fixed_column'), breakpointDefinition);
                                                                                                                                                                        }
                                                                                                                                                                    },
                                                                                                                                                                    "rowCallback": function(nRow) {
                                                                                                                                                                        responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
                                                                                                                                                                    },
                                                                                                                                                                    "drawCallback": function(oSettings) {
                                                                                                                                                                        responsiveHelper_datatable_fixed_column.respond();
                                                                                                                                                                    }

                                                                                                                                                                });

                                                                                                                                                                // custom toolbar
                                                                                                                                                                // $("div.toolbar").html('<div class="text-right"><img src="img/logo.png" alt="SmartAdmin" style="width: 111px; margin-top: 3px; margin-right: 10px;"></div>');

                                                                                                                                                                // Apply the filter
                                                                                                                                                                $("#datatable_fixed_column thead th input[type=text]").on('keyup change', function() {

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
                                                                                                                                                                    "preDrawCallback": function() {
                                                                                                                                                                        // Initialize the responsive datatables helper once.
                                                                                                                                                                        if (!responsiveHelper_datatable_col_reorder) {
                                                                                                                                                                            responsiveHelper_datatable_col_reorder = new ResponsiveDatatablesHelper($('#datatable_col_reorder'), breakpointDefinition);
                                                                                                                                                                        }
                                                                                                                                                                    },
                                                                                                                                                                    "rowCallback": function(nRow) {
                                                                                                                                                                        responsiveHelper_datatable_col_reorder.createExpandIcon(nRow);
                                                                                                                                                                    },
                                                                                                                                                                    "drawCallback": function(oSettings) {
                                                                                                                                                                        responsiveHelper_datatable_col_reorder.respond();
                                                                                                                                                                    }
                                                                                                                                                                });

                                                                                                                                                                /* END COLUMN SHOW - HIDE */

                                                                                                                                                                /* TABLETOOLS */


                                                                                                                                                                /* END TABLETOOLS */

                                                                                                                                                            })

                                                                                                                                                        </script>

                                                                                                                                                        <!-- Your GOOGLE ANALYTICS CODE Below -->
                                                                                                                                                        <script type="text/javascript">
                                                                                                                                                            var _gaq = _gaq || [];
                                                                                                                                                            _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
                                                                                                                                                            _gaq.push(['_trackPageview']);

                                                                                                                                                            (function() {
                                                                                                                                                                var ga = document.createElement('script');
                                                                                                                                                                ga.type = 'text/javascript';
                                                                                                                                                                ga.async = true;
                                                                                                                                                                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                                                                                                                                                                var s = document.getElementsByTagName('script')[0];
                                                                                                                                                                s.parentNode.insertBefore(ga, s);
                                                                                                                                                            })();
                                                                                                                                                        </script>

                                                                                                                                                        </body>

                                                                                                                                                        </html>
 <%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>                                                                                                                                                       