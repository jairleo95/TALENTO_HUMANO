<%@page import="pe.edu.upeu.application.util.DateFormat"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>

<%@page import="pe.edu.upeu.application.model.x_List_Id_Trab_Dgp"%>
<jsp:useBean id="LIST_ID_TRAB_DGP" class="java.util.ArrayList" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title>Historial de Requerimientos</title>

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
    <body >
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">
                <div class="jarviswidget jarviswidget-color-darken slideInDown fast animated" id="wid-id-0" data-widget-editbutton="false">
                    <header>
                        <span class="widget-icon"> <i class="fa fa-list"></i> </span>
                        <h2 class="font-md"><strong>Historial </strong> <i>Requerimientos</i></h2>		
                    </header>
                    <div>
                        <div class="widget-body no-padding">
                            <table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
                                <thead> 
                                    <tr>
                                        <th data-hide="phone">Nro</th>
                                        <th data-class="phone,tablet">Fecha Desde</th>
                                        <th data-hide="phone,tablet">Fecha Hasta</th>
                                        <th data-hide="expand">Motivo</th>
                                        <th data-hide="phone,tablet">Puesto</th>
                                        <th data-hide="phone,tablet">Sección</th>
                                        <th data-hide="phone,tablet">Area</th>
                                        <th data-hide="phone,tablet">Estado</th>
                                        <th data-hide="phone,tablet">Documentos</th>
                                        <th data-hide="phone,tablet">Detalle</th>
                                    </tr>
                                </thead>
                                <%
                                    if (LIST_ID_TRAB_DGP.size() == 0) {%>

                                <%}%>

                                <tbody> 
                                    <%for (int i = 0; i < LIST_ID_TRAB_DGP.size(); i++) {
                                            x_List_Id_Trab_Dgp d = new x_List_Id_Trab_Dgp();
                                            d = (x_List_Id_Trab_Dgp) LIST_ID_TRAB_DGP.get(i);
                                    %>
                                    <tr>
                                        <td ><%=i + 1%></td>
                                        <td ><%=d.getFe_desde()%></td>
                                        <td ><%=d.getFe_hasta()%></td>
                                        <td ><%=d.getNo_req()%></td>
                                        <td ><%=d.getNo_puesto()%></td>
                                        <td ><%=d.getNo_seccion()%></td> 

                                        <td ><%=d.getNo_area()%></td> 

                                        <td >
                                            <%
                                                if (d.getEs_dgp() != null) {
                                                    if (d.getEs_dgp().trim().equals("0")) {
                                            %>
                                            <a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&opc=Seguimiento" class="btn btn-labeled btn-primary"> <span class="btn-label"><i class="glyphicon glyphicon-arrow-right"></i></span>En Proceso </a>
                                                    <% }%>
                                                    <%if (d.getEs_dgp().trim().equals("1")) {
                                                    %>
                                            <a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&opc=Seguimiento" class="btn btn-labeled btn-success"> <span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span>Ver Proceso Terminado </a>
                                                    <% }
                                                    } else {%>
                                            <a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&opc=Seguimiento" class="btn btn-labeled btn-danger"> <span class="btn-label"><i class="glyphicon glyphicon-thumbs-down"></i></span>Incompleto - Interrumpido</a>
                                                    <%}%>
                                        </td> 
                                        <td >

                                            <a href="../../documento?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=Ver_Documento"class="btn btn-labeled btn-default"> <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>Ver Documentos </a>
                                        </td> 


                                        <td>
                                            <a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=Detalle" class="btn btn-labeled btn-info"> <span class="btn-label"><i class="glyphicon glyphicon-info-sign"></i></span>Ver Detalle</a>
                                        </td>
                                    </tr> 
                                    <%}%>
                                </tbody>
                            </table>


                        </div>


                    </div>

                </div>





            </div>
            <!-- end widget div -->





        </div>


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


        <!-- JARVIS WIDGETS -->
        <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>

        <!-- EASY PIE CHARTS -->

        <!-- SPARKLINES -->

        <!-- JQUERY VALIDATE -->

        <!-- JQUERY MASKED INPUT -->

        <!-- JQUERY SELECT2 INPUT -->

        <!-- JQUERY UI + Bootstrap Slider -->

        <!-- browser msie issue fix -->

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

        <!-- PAGE RELATED PLUGIN(S) -->
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

        <script type = "text/javascript" >
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
                // custom toolbar
                $("div.toolbar").html('<div class="text-right"><img src="img/logo.png" alt="SmartAdmin" style="width: 111px; margin-top: 3px; margin-right: 10px;"></div>');

            });

        </script>


    </center>
</body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>