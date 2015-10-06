<%@page import="pe.edu.upeu.application.dao.AutorizacionDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
        String ID_DEP = (String) sesion_1.getAttribute("DEPARTAMENTO_ID");
%>
<%@page import="java.util.Iterator"%>
<%@page import="pe.edu.upeu.application.dao.DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDgpDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.upeu.application.model.V_Es_Requerimiento"%>

<jsp:useBean class="java.util.ArrayList" id="LIST_DGP_PROCESO" scope="application" />
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Estado de Requerimiento </title>
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
        <style type="text/css">
            *, *:after, *:before {
                /*    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: "Open Sans";*/
            }


            /* Form Progress */
            .new-progress {
                //width: 100%;
                margin:0px;
                text-align: center;
            }
            .new-progress .new-circle,
            .new-progress .new-bar {
                display: inline-block;
                background: #fff;
                width: 33px; height: 33px;
                border-radius: 100%;
                border: 1px solid #d5d5da;
            }
            .new-progress .new-bar {
                position: relative;
                display: inline-block;
                width: 30px;
                height: 6px;
                //margin: 0 -0.01% 3% -5px;
                border-left: none;
                border-right: none;
                border-radius: 0;
            }

            .new-progress .new-circle .new-label {
                display: inline-block;
                width: 25px;
                height: 25px;
                // line-height: 32px;
                border-radius: 32px;
                margin-top: 3px;
                color: #b5b5ba;
                // font-size: 17px;
            }
            .new-progress .new-circle .new-title {
                color: #b5b5ba;
                font-size: 100%;
                //line-height: 30px;
                //margin-left: -5px;
            }

            /* Done / Active */
            .new-progress .new-bar.done,
            .new-progress .new-circle.done {
                background: #eee;
                color:black;
            }
            .new-progress .new-circle.rechazo {
                background: #a90329;
                color: #b5b5ba;
            }
            .new-progress .new-bar.active {
                background: linear-gradient(to right, #EEE 40%, #FFF 60%);
            }
            .new-progress .new-circle.done .new-label {
                color: #FFF;
                background: #8bc435;
                box-shadow: inset 0 0 2px rgba(0,0,0,.2);
            }
            .new-progress .new-circle.done .new-title {
                color: #b5b5ba;
            }
            .new-progress .new-circle.active .new-label {
                color: #FFF;
                background: #0c95be;
                box-shadow: inset 0 0 2px rgba(0,0,0,.2);
            }
            .new-progress .new-circle.active .new-title {
                color: black;
            }
            .new-progress .new-circle.done .new-label:hover, .new-circle:hover{

                //  background-color:blue; 
            }

        </style>
    </head>
    <%  //String num = request.getParameter("num");
        // int num_doc = Integer.parseInt(num);
        if (request.getParameter("a") != null) {
            if (request.getParameter("a").equals("t")) {
    %>

    <body onload="closedthis();
            nobackbutton();">

        <%
            }
        } else {
        %>
    <body class="" onload="nobackbutton()">
        <%}%>
        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">

                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12"  style="margin-top:2.5%;">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"   data-widget-editbutton="false">
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
                                    <h2>Estado de Requerimientos </h2>

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
                                                    <th data-hide="phone">Nro</th>
                                                    <th>MES</th>
                                                    <th data-hide="phone,tablet"><i class="fa fa-fw fa-building text-muted hidden-md hidden-sm hidden-xs"></i> Acciones</th>

                                                    <th data-class="expand">Nombre</th>
                                                    <th data-class="expand">Proceso</th>
                                                        <%if (ID_DEP.equals("DPT-0019")) {%>
                                                    <th data-hide="phone,tablet">Departamento</th>
                                                        <%}%>
                                                    <th >Estado</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <input type="hidden" value="<%=LIST_DGP_PROCESO.size()%>" class="tamaño"/>
                                            <%
                                                InterfaceDgpDAO d = new DgpDAO();
                                                for (int i = 0; i < LIST_DGP_PROCESO.size(); i++) {
                                                    V_Es_Requerimiento r = new V_Es_Requerimiento();
                                                    r = (V_Es_Requerimiento) LIST_DGP_PROCESO.get(i);
                                            %>
                                            <tr>
                                                <td><strong><%=i + 1%></strong></td>
                                                <%
                                                    InterfaceAutorizacionDAO ad = new AutorizacionDAO();
                                                %>
                                                <td><%=ad.Mes_plazo(r.getId_dgp().trim())%></td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                            Accion <span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu">

                                                            <li><a href="../../dgp?iddgp=<%=r.getId_dgp().trim()%>&opc=User_Aut">Usuarios - Prox. Autorizacion</a></li>
                                                            <li><a href="../../dgp?iddgp=<%=r.getId_dgp().trim()%>&opc=Seguimiento">Ver Historial</a> </li>
                                                            <li><a href="../../documento?iddgp=<%=r.getId_dgp().trim()%>&idtr=<%=r.getId_trabajador().trim()%>&opc=Ver_Documento">Ver Documentos</a></li>
                                                            <li><a href="../../comentario?iddgp=<%=r.getId_dgp().trim()%>&opc=Comentar_Dgp">Comentarios</a></li>    
                                                            <li><a href="../../solicitud_requerimiento?iddgp=<%=r.getId_dgp().trim()%>&opc=Reg_List_Solicitud">Hacer Solicitud</a></li>    
                                                            <li class="divider"></li><li>
                                                            <li><a href="../../dgp?iddgp=<%=r.getId_dgp().trim()%>&idtr=<%=r.getId_trabajador().trim()%>&opc=Detalle">Ver Requerimiento</a> </li>
                                                            </li>
                                                        </ul>
                                                    </div>

                                                </td> 
                                                <% if (r.getAr_foto() == null) {%>
                                                <td><img src="../../imagenes/avatar_default.jpg"  width="30"  height="30">
                                                    <a style="margin-left: 3%;" href="../../trabajador?idtr=<%=r.getId_trabajador()%>&opc=list"> 

                                                        <strong><%=r.getAp_paterno().toUpperCase() + " " + r.getAp_materno().toUpperCase() + " " + r.getNo_trabajador().toUpperCase()%></strong></a>


                                                    <input type="hidden" class="num_aut<%=(i + 1)%>" value="<%=r.getAut_actual()%>"/>

                                                </td>

                                                <td><div class="new-progress prog_aut<%=(i + 1)%>"  >
                                                        <%
                                                            out.println(d.Imprimir_det_proceso(r.getId_dgp(), r.getId_detalle_req_proceso(), ID_DEP));
                                                        %>
                                                    </div></td>
                                                    <%if (ID_DEP.equals("DPT-0019")) {%>
                                                <td><%=r.getNo_dep()%></td>
                                                <%} %>
                                                <td><%if (r.getEs_dgp().equals("2")) {
                                                        out.print(" <span class='label label-danger'>Fuera de Proceso</span>");
                                                    } else {
                                                        out.print(" <span class='label label-primary'>En Proceso</span>");
                                                    }%></td>
                                                    <% } else {%>
                                                <td><img src="../Usuario/Fotos/<%=r.getAr_foto()%>"  width="30"  height="30"><a href="../../trabajador?idtr=<%=r.getId_trabajador()%>&opc=list"> 

                                                        <strong><%=r.getAp_paterno().toUpperCase() + " " + r.getAp_materno().toUpperCase() + " " + r.getNo_trabajador().toUpperCase()%></strong></a> 




                                                    <input type="hidden" class="num_aut<%=(i + 1)%>" value="<%=r.getAut_actual()%>"/>
                                                </td>
                                                <td><div class="new-progress prog_aut<%=(i + 1)%>"  >
                                                        <%
                                                            out.println(d.Imprimir_det_proceso(r.getId_dgp(), r.getId_detalle_req_proceso(), ID_DEP));
                                                        %>
                                                    </div></td>
                                                <td>  <%if (r.getEs_dgp().equals("2")) {
                                                        out.print(" <span class='label label-danger'>Fuera de Proceso</span>");
                                                    } else {
                                                        out.print(" <span class='label label-primary'>En Proceso</span>");
                                                    }%></td>
                                                    <% }%>
                                            </tr>
                                            <% }
                                                LIST_DGP_PROCESO.clear();%>


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

        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script src="../../js/plugin/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>



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


        })

        </script>
        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!
            function closedthis() {
                $.smallBox({
                    title: "¡DGP registrada correctamente!",
                    content: "Ya puede visualizar la informacion del DGP",
                    color: "#739E73",
                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                    timeout: 6000
                });
            }
            function closedthis2() {
                $.smallBox({
                    title: "¡Documentos del trabajador registrados correctamente!",
                    content: "ya puede visualizar toda los documentos del trabajador...",
                    color: "#739E73",
                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                    timeout: 6000
                });
            }
            $(document).ready(function () {

                pageSetUp();
                $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                    $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                });
                /*
                 * Autostart Carousel
                 */
                $('.carousel.slide').carousel({
                    interval: 3000,
                    cycle: true
                });
                $('.carousel.fade').carousel({
                    interval: 3000,
                    cycle: true
                });
                // Fill all progress bars with animation

                $('.progress-bar').progressbar({
                    display_text: 'fill'
                });
                /*
                 * Smart Notifications
                 */
                $('#eg1').click(function (e) {

                    $.bigBox({
                        title: "Big Information box",
                        content: "This message will dissapear in 6 seconds!",
                        color: "#C46A69",
                        //timeout: 6000,
                        icon: "fa fa-warning shake animated",
                        number: "1",
                        timeout: 6000
                    });
                    e.preventDefault();
                })

                $('#eg2').click(function (e) {

                    $.bigBox({
                        title: "Big Information box",
                        content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#3276B1",
                        //timeout: 8000,
                        icon: "fa fa-bell swing animated",
                        number: "2"
                    });
                    e.preventDefault();
                })

                $('#eg3').click(function (e) {

                    $.bigBox({
                        title: "Shield is up and running!",
                        content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#C79121",
                        //timeout: 8000,
                        icon: "fa fa-shield fadeInLeft animated",
                        number: "3"
                    });
                    e.preventDefault();
                })

                $('#eg4').click(function (e) {

                    $.bigBox({
                        title: "Success Message Example",
                        content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#739E73",
                        //timeout: 8000,
                        icon: "fa fa-check",
                        number: "4"
                    }, function () {
                        closedthis();
                    });
                    e.preventDefault();
                })



                $('#eg5').click(function () {

                    $.smallBox({
                        title: "Ding Dong!",
                        content: "Someone's at the door...shall one get it sir? <p class='text-align-right'><a href='javascript:void(0);' class='btn btn-primary btn-sm'>Yes</a> <a href='javascript:void(0);' class='btn btn-danger btn-sm'>No</a></p>",
                        color: "#296191",
                        //timeout: 8000,
                        icon: "fa fa-bell swing animated"
                    });
                });
                $('#eg6').click(function () {

                    $.smallBox({
                        title: "Big Information box",
                        content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#5384AF",
                        //timeout: 8000,
                        icon: "fa fa-bell"
                    });
                })

                $('#eg7').click(function () {

                    $.smallBox({
                        title: "James Simmons liked your comment",
                        content: "<i class='fa fa-clock-o'></i> <i>2 seconds ago...</i>",
                        color: "#296191",
                        iconSmall: "fa fa-thumbs-up bounce animated",
                        timeout: 4000
                    });
                })

                function closedthis() {
                    $.smallBox({
                        title: "Great! You just closed that last alert!",
                        content: "This message will be gone in 5 seconds!",
                        color: "#739E73",
                        iconSmall: "fa fa-cloud",
                        timeout: 5000
                    });
                }

                /*
                 * SmartAlerts
                 */
                // With Callback
                $("#smart-mod-eg1").click(function (e) {
                    $.SmartMessageBox({
                        title: "Smart Alert!",
                        content: "This is a confirmation box. Can be programmed for button callback",
                        buttons: '[No][Yes]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Yes") {

                            $.smallBox({
                                title: "Callback function",
                                content: "<i class='fa fa-clock-o'></i> <i>You pressed Yes...</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 4000
                            });
                        }
                        if (ButtonPressed === "No") {
                            $.smallBox({
                                title: "Callback function",
                                content: "<i class='fa fa-clock-o'></i> <i>You pressed No...</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 4000
                            });
                        }

                    });
                    e.preventDefault();
                })
                // With Input
                $("#smart-mod-eg2").click(function (e) {

                    $.SmartMessageBox({
                        title: "Smart Alert: Input",
                        content: "Please enter your user name",
                        buttons: "[Accept]",
                        input: "text",
                        placeholder: "Enter your user name"
                    }, function (ButtonPress, Value) {
                        alert(ButtonPress + " " + Value);
                    });
                    e.preventDefault();
                })
                // With Buttons
                $("#smart-mod-eg3").click(function (e) {

                    $.SmartMessageBox({
                        title: "Smart Notification: Buttons",
                        content: "Lots of buttons to go...",
                        buttons: '[Need?][You][Do][Buttons][Many][How]'
                    });
                    e.preventDefault();
                })
                // With Select
                $("#smart-mod-eg4").click(function (e) {

                    $.SmartMessageBox({
                        title: "Smart Alert: Select",
                        content: "You can even create a group of options.",
                        buttons: "[Done]",
                        input: "select",
                        options: "[Costa Rica][United States][Autralia][Spain]"
                    }, function (ButtonPress, Value) {
                        alert(ButtonPress + " " + Value);
                    });
                    e.preventDefault();
                });
                // With Login
                $("#smart-mod-eg5").click(function (e) {

                    $.SmartMessageBox({
                        title: "Login form",
                        content: "Please enter your user name",
                        buttons: "[Cancel][Accept]",
                        input: "text",
                        placeholder: "Enter your user name"
                    }, function (ButtonPress, Value) {
                        if (ButtonPress == "Cancel") {
                            alert("Why did you cancel that? :(");
                            return 0;
                        }

                        Value1 = Value.toUpperCase();
                        ValueOriginal = Value;
                        $.SmartMessageBox({
                            title: "Hey! <strong>" + Value1 + ",</strong>",
                            content: "And now please provide your password:",
                            buttons: "[Login]",
                            input: "password",
                            placeholder: "Password"
                        }, function (ButtonPress, Value) {
                            alert("Username: " + ValueOriginal + " and your password is: " + Value);
                        });
                    });
                    e.preventDefault();
                });
            })

        </script>
        <script type="text/javascript">
            function nobackbutton() {

                window.location.hash = "no-back-button";
                window.location.hash = "Again-No-back-button" //chrome

                window.onhashchange = function () {
                    window.location.hash = "no-back-button";
                }
            }
            function iterar_aut(s, t) {
                var i = 1;
                $('.prog_aut' + s + ' .new-circle').removeClass().addClass('new-circle');
                $('.prog_aut' + s + ' .new-bar').removeClass().addClass('new-bar');
                setInterval(function () {
                    if (i < t) {
                        $('.prog_aut' + s + ' .new-circle:nth-of-type(' + i + ')').addClass('active');
                        $('.prog_aut' + s + ' .new-circle:nth-of-type(' + (i - 1) + ')').removeClass('active').addClass('done');
                        $('.prog_aut' + s + ' .new-circle:nth-of-type(' + (i - 1) + ') .new-label').html('&#10003;');
                        $('.prog_aut' + s + ' .new-bar:nth-of-type(' + (i - 1) + ')').addClass('active');
                        $('.prog_aut' + s + ' .new-bar:nth-of-type(' + (i - 2) + ')').removeClass('active').addClass('done');
                        i++;
                        if (i == 0) {
                            $('.prog_aut' + s + ' .new-bar').removeClass().addClass('new-bar');
                            $('.prog_aut' + s + '  div.new-circle').removeClass().addClass('new-circle');
                            i = 1;
                        }
                    }
                }, 50);
            }
            $(document).ready(function () {
                /* for (var u = 0; u < $(".tamaño").val() + 1; u++) {
                 iterar_aut(u, parseInt($(".num_aut" + u).val()) + 2);
                 }*/



                //$('.new-progress .new-bar').removeClass().addClass('new-bar');


            });</script>
    </body>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
