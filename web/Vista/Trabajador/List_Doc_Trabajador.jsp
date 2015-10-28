<%@page import="pe.edu.upeu.application.dao.DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO"%>
<%@page import="pe.edu.upeu.application.model.Lis_Doc_tra"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    String rol = (String) sesion_1.getAttribute("IDROL");
    InterfaceDocumentoDAO doc_ = new DocumentoDAO();
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.model.V_Documento_Trabajador"%>
<jsp:useBean id="Lis_doc_trabajador_hab" scope="session" class="java.util.ArrayList"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Documentos</title>
        <link rel="stylesheet" href="../../css/Css_Lista/listas.css" />
        <link rel="stylesheet" href="../../css1/bootstrap.min.css" />

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
        <script type="text/javascript" src="../../js/shadowbox/demo.js"></script>
        <link rel="stylesheet" type="text/css" href="../../js/shadowbox/shadowbox.css"/>
        <link rel="stylesheet" type="text/css" href="../../js/shadowbox/style.css"/>
        <script type="text/javascript" src="../../js/shadowbox/shadowbox.js"></script>
        <script type="text/javascript">
            Shadowbox.init({
                // a darker overlay looks better on this particular site
                overlayOpacity: 0.8
                        // setupDemos is defined in assets/demo.js
            }, setupDemos);
        </script>
    </head>
    <body>
    <center>
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


                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3" data-widget-editbutton="false">
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


                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div >
                                        <!-- This area used as dropdown edit box -->
                                        <%//if (!rol.trim().equals("ROL-0013")) {%>
                                        <%if (!rol.trim().equals("ROL-0013")) {%>

                                        <a href="../../documento_trabajador?idtr=<%=request.getParameter("idtr")%>&opc=Listar_doc" class="btn btn-labeled btn-primary"> <span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span><%if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001")) {
                                                out.print("Registrar Documentos");
                                            } else {
                                                    out.print(" Visualizar Documentos");
                                                }%>  </a>      <%}%>
                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body">
                                        <table id="datatable_tabletools" class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th data-hide="phone" style="color:black;with:15%;text-align:center;">Nro</th>
                                                    <th data-class="expand" style="color:black;with:40%;text-align:center;">Nombres </th>
                                                    <th data-hide="phone,tablet" style="color:black;with:30%;text-align:center;" >Documento</th>
                                                    <th data-hide="phone" style="color:black;with:15%;text-align:center;">Descripción</th>
                                                </tr>  
                                            </thead>
                                            <tbody>

                                                <%  if (Lis_doc_trabajador_hab.size() == 0) {%>
                                                <%} else {%>
                                                <%for (int i = 0; i < Lis_doc_trabajador_hab.size(); i++) {
                                                        Lis_Doc_tra d = new Lis_Doc_tra();
                                                        d = (Lis_Doc_tra) Lis_doc_trabajador_hab.get(i);
                                                %>
                                                <tr>
                                                    <td style="color:black;with:15%;text-align:center;"><%=i + 1%></td>
                                                    <td style="color:#1E90FF;with:40%;text-align:center;"><%=d.getNo_documento()%></td>
                                                    <td style="color:#1E90FF;with:30%;text-align:center;"><%out.print(doc_.List_file_url2(d.getId_documento_adjunto().trim()));%></a></td>
                                                        <%if (d.getDe_documento_adjunto() != null) {
                                                        %>
                                                    <td style="color:black;with:15%;text-align:center;"><%=d.getDe_documento_adjunto()%></td>
                                                    <%} else {%>
                                                    <td style="color:black;with:15%;text-align:center;">No Registrado</td>
                                                    <%}%>
                                                </tr>
                                                <% }
                                                    }%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->



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




        <script src="../../js/plugin/flot/jquery.flot.cust.min.js"></script>
        <script src="../../js/plugin/flot/jquery.flot.resize.min.js"></script>
        <script src="../../js/plugin/flot/jquery.flot.fillbetween.min.js"></script>
        <script src="../../js/plugin/flot/jquery.flot.orderBar.min.js"></script>
        <script src="../../js/plugin/flot/jquery.flot.pie.min.js"></script>
        <script src="../../js/plugin/flot/jquery.flot.tooltip.min.js"></script>
        <script type="text/javascript">
            // PAGE RELATED SCRIPTS

            /* chart colors default */
            var $chrt_border_color = "#efefef";
            var $chrt_grid_color = "#DDD"
            var $chrt_main = "#E24913";
            /* red       */
            var $chrt_second = "#6595b4";
            /* blue      */
            var $chrt_third = "#FF9F01";
            /* orange    */
            var $chrt_fourth = "#7e9d3a";
            /* green     */
            var $chrt_fifth = "#BD362F";
            /* dark red  */
            var $chrt_mono = "#000";

            $(document).ready(function () {

                // DO NOT REMOVE : GLOBAL FUNCTIONS!
                pageSetUp();

                /* sales chart */

                if ($("#saleschart").length) {
                    var d = [[1203721200000, 100], [1203807600000, 40], [1203894000000, 2000]];
                    for (var i = 0; i < d.length; ++i)
                        d[i][0] += 60 * 60 * 1000;

                    function weekendAreas(axes) {
                        var markings = [];
                        var d = new Date(axes.xaxis.min);
                        // go to the first Saturday
                        d.setUTCDate(d.getUTCDate() - ((d.getUTCDay() + 1) % 7))
                        d.setUTCSeconds(0);
                        d.setUTCMinutes(0);
                        d.setUTCHours(0);
                        var i = d.getTime();
                        do {
                            // when we don't set yaxis, the rectangle automatically
                            // extends to infinity upwards and downwards
                            markings.push({
                                xaxis: {
                                    from: i,
                                    to: i + 2 * 24 * 60 * 60 * 1000
                                }
                            });
                            i += 7 * 24 * 60 * 60 * 1000;
                        } while (i < axes.xaxis.max);

                        return markings;
                    }

                    var options = {
                        xaxis: {
                            mode: "time",
                            tickLength: 5
                        },
                        series: {
                            lines: {
                                show: true,
                                lineWidth: 1,
                                fill: true,
                                fillColor: {
                                    colors: [{
                                            opacity: 0.1
                                        }, {
                                            opacity: 0.15
                                        }]
                                }
                            },
                            //points: { show: true },
                            shadowSize: 0
                        },
                        selection: {
                            mode: "x"
                        },
                        grid: {
                            hoverable: true,
                            clickable: true,
                            tickColor: $chrt_border_color,
                            borderWidth: 0,
                            borderColor: $chrt_border_color,
                        },
                        tooltip: true,
                        tooltipOpts: {
                            content: "Numero de Contratos en <b>%x</b> fue <span>%y</span>",
                            dateFormat: "%y-%0m-%0d",
                            defaultTheme: false
                        },
                        colors: [$chrt_second],
                    };

                    var plot = $.plot($("#saleschart"), [d], options);
                }
                ;

                /* end sales chart */

                /* Sin chart */

                if ($("#sin-chart").length) {
                    var sin = [], cos = [];
                    for (var i = 0; i < 16; i += 0.5) {
                        sin.push([i, Math.sin(i)]);
                        cos.push([i, Math.cos(i)]);
                    }

                    var plot = $.plot($("#sin-chart"), [{
                            data: sin,
                            label: "sin(x)"
                        }, {
                            data: cos,
                            label: "cos(x)"
                        }], {
                        series: {
                            lines: {
                                show: true
                            },
                            points: {
                                show: true
                            }
                        },
                        grid: {
                            hoverable: true,
                            clickable: true,
                            tickColor: $chrt_border_color,
                            borderWidth: 0,
                            borderColor: $chrt_border_color,
                        },
                        tooltip: true,
                        tooltipOpts: {
                            //content : "Value <b>$x</b> Value <span>$y</span>",
                            defaultTheme: false
                        },
                        colors: [$chrt_second, $chrt_fourth],
                        yaxis: {
                            min: -1.1,
                            max: 1.1
                        },
                        xaxis: {
                            min: 0,
                            max: 15
                        }
                    });

                    $("#sin-chart").bind("plotclick", function (event, pos, item) {
                        if (item) {
                            $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
                            plot.highlight(item.series, item.datapoint);
                        }
                    });
                }

                /* end sin chart */

                /* bar chart */

                if ($("#bar-chart").length) {

                    var data1 = [];
                    for (var i = 0; i <= 12; i += 1)
                        data1.push([i, parseInt(Math.random() * 30)]);

                    var data2 = [];
                    for (var i = 0; i <= 12; i += 1)
                        data2.push([i, parseInt(Math.random() * 30)]);

                    var data3 = [];
                    for (var i = 0; i <= 12; i += 1)
                        data3.push([i, parseInt(Math.random() * 30)]);

                    var ds = new Array();

                    ds.push({
                        data: data1,
                        bars: {
                            show: true,
                            barWidth: 0.2,
                            order: 1,
                        }
                    });
                    ds.push({
                        data: data2,
                        bars: {
                            show: true,
                            barWidth: 0.2,
                            order: 2
                        }
                    });
                    ds.push({
                        data: data3,
                        bars: {
                            show: true,
                            barWidth: 0.2,
                            order: 3
                        }
                    });

                    //Display graph
                    $.plot($("#bar-chart"), ds, {
                        colors: [$chrt_second, $chrt_fourth, "#666", "#BBB"],
                        grid: {
                            show: true,
                            hoverable: true,
                            clickable: true,
                            tickColor: $chrt_border_color,
                            borderWidth: 0,
                            borderColor: $chrt_border_color,
                        },
                        legend: true,
                        tooltip: true,
                        tooltipOpts: {
                            content: "<b>%x</b> = <span>%y</span>",
                            defaultTheme: false
                        }

                    });

                }

                /* end bar chart */

                /* bar-chart-h */
                if ($("#bar-chart-h").length) {
                    //Display horizontal graph
                    var d1_h = [];
                    for (var i = 0; i <= 3; i += 1)
                        d1_h.push([parseInt(Math.random() * 30), i]);

                    var d2_h = [];
                    for (var i = 0; i <= 3; i += 1)
                        d2_h.push([parseInt(Math.random() * 30), i]);

                    var d3_h = [];
                    for (var i = 0; i <= 3; i += 1)
                        d3_h.push([parseInt(Math.random() * 30), i]);

                    var ds_h = new Array();
                    ds_h.push({
                        data: d1_h,
                        bars: {
                            horizontal: true,
                            show: true,
                            barWidth: 0.2,
                            order: 1,
                        }
                    });
                    ds_h.push({
                        data: d2_h,
                        bars: {
                            horizontal: true,
                            show: true,
                            barWidth: 0.2,
                            order: 2
                        }
                    });
                    ds_h.push({
                        data: d3_h,
                        bars: {
                            horizontal: true,
                            show: true,
                            barWidth: 0.2,
                            order: 3
                        }
                    });

                    // display graph
                    $.plot($("#bar-chart-h"), ds_h, {
                        colors: [$chrt_second, $chrt_fourth, "#666", "#BBB"],
                        grid: {
                            show: true,
                            hoverable: true,
                            clickable: true,
                            tickColor: $chrt_border_color,
                            borderWidth: 0,
                            borderColor: $chrt_border_color,
                        },
                        legend: true,
                        tooltip: true,
                        tooltipOpts: {
                            content: "<b>%x</b> = <span>%y</span>",
                            defaultTheme: false
                        }
                    });

                }

                /* end bar-chart-h
                 
                 /* fill chart */

                if ($("#fill-chart").length) {
                    var males = {
                        '15%': [[2, 88.0], [3, 93.3], [4, 102.0], [5, 108.5], [6, 115.7], [7, 115.6], [8, 124.6], [9, 130.3], [10, 134.3], [11, 141.4], [12, 146.5], [13, 151.7], [14, 159.9], [15, 165.4], [16, 167.8], [17, 168.7], [18, 169.5], [19, 168.0]],
                        '90%': [[2, 96.8], [3, 105.2], [4, 113.9], [5, 120.8], [6, 127.0], [7, 133.1], [8, 139.1], [9, 143.9], [10, 151.3], [11, 161.1], [12, 164.8], [13, 173.5], [14, 179.0], [15, 182.0], [16, 186.9], [17, 185.2], [18, 186.3], [19, 186.6]],
                        '25%': [[2, 89.2], [3, 94.9], [4, 104.4], [5, 111.4], [6, 117.5], [7, 120.2], [8, 127.1], [9, 132.9], [10, 136.8], [11, 144.4], [12, 149.5], [13, 154.1], [14, 163.1], [15, 169.2], [16, 170.4], [17, 171.2], [18, 172.4], [19, 170.8]],
                        '10%': [[2, 86.9], [3, 92.6], [4, 99.9], [5, 107.0], [6, 114.0], [7, 113.5], [8, 123.6], [9, 129.2], [10, 133.0], [11, 140.6], [12, 145.2], [13, 149.7], [14, 158.4], [15, 163.5], [16, 166.9], [17, 167.5], [18, 167.1], [19, 165.3]],
                        'mean': [[2, 91.9], [3, 98.5], [4, 107.1], [5, 114.4], [6, 120.6], [7, 124.7], [8, 131.1], [9, 136.8], [10, 142.3], [11, 150.0], [12, 154.7], [13, 161.9], [14, 168.7], [15, 173.6], [16, 175.9], [17, 176.6], [18, 176.8], [19, 176.7]],
                        '75%': [[2, 94.5], [3, 102.1], [4, 110.8], [5, 117.9], [6, 124.0], [7, 129.3], [8, 134.6], [9, 141.4], [10, 147.0], [11, 156.1], [12, 160.3], [13, 168.3], [14, 174.7], [15, 178.0], [16, 180.2], [17, 181.7], [18, 181.3], [19, 182.5]],
                        '85%': [[2, 96.2], [3, 103.8], [4, 111.8], [5, 119.6], [6, 125.6], [7, 131.5], [8, 138.0], [9, 143.3], [10, 149.3], [11, 159.8], [12, 162.5], [13, 171.3], [14, 177.5], [15, 180.2], [16, 183.8], [17, 183.4], [18, 183.5], [19, 185.5]],
                        '50%': [[2, 91.9], [3, 98.2], [4, 106.8], [5, 114.6], [6, 120.8], [7, 125.2], [8, 130.3], [9, 137.1], [10, 141.5], [11, 149.4], [12, 153.9], [13, 162.2], [14, 169.0], [15, 174.8], [16, 176.0], [17, 176.8], [18, 176.4], [19, 177.4]]
                    };

                    var females = {
                        '15%': [[2, 84.8], [3, 93.7], [4, 100.6], [5, 105.8], [6, 113.3], [7, 119.3], [8, 124.3], [9, 131.4], [10, 136.9], [11, 143.8], [12, 149.4], [13, 151.2], [14, 152.3], [15, 155.9], [16, 154.7], [17, 157.0], [18, 156.1], [19, 155.4]],
                        '90%': [[2, 95.6], [3, 104.1], [4, 111.9], [5, 119.6], [6, 127.6], [7, 133.1], [8, 138.7], [9, 147.1], [10, 152.8], [11, 161.3], [12, 166.6], [13, 167.9], [14, 169.3], [15, 170.1], [16, 172.4], [17, 169.2], [18, 171.1], [19, 172.4]],
                        '25%': [[2, 87.2], [3, 95.9], [4, 101.9], [5, 107.4], [6, 114.8], [7, 121.4], [8, 126.8], [9, 133.4], [10, 138.6], [11, 146.2], [12, 152.0], [13, 153.8], [14, 155.7], [15, 158.4], [16, 157.0], [17, 158.5], [18, 158.4], [19, 158.1]],
                        '10%': [[2, 84.0], [3, 91.9], [4, 99.2], [5, 105.2], [6, 112.7], [7, 118.0], [8, 123.3], [9, 130.2], [10, 135.0], [11, 141.1], [12, 148.3], [13, 150.0], [14, 150.7], [15, 154.3], [16, 153.6], [17, 155.6], [18, 154.7], [19, 153.1]],
                        'mean': [[2, 90.2], [3, 98.3], [4, 105.2], [5, 112.2], [6, 119.0], [7, 125.8], [8, 131.3], [9, 138.6], [10, 144.2], [11, 151.3], [12, 156.7], [13, 158.6], [14, 160.5], [15, 162.1], [16, 162.9], [17, 162.2], [18, 163.0], [19, 163.1]],
                        '75%': [[2, 93.2], [3, 101.5], [4, 107.9], [5, 116.6], [6, 122.8], [7, 129.3], [8, 135.2], [9, 143.7], [10, 148.7], [11, 156.9], [12, 160.8], [13, 163.0], [14, 165.0], [15, 165.8], [16, 168.7], [17, 166.2], [18, 167.6], [19, 168.0]],
                        '85%': [[2, 94.5], [3, 102.8], [4, 110.4], [5, 119.0], [6, 125.7], [7, 131.5], [8, 137.9], [9, 146.0], [10, 151.3], [11, 159.9], [12, 164.0], [13, 166.5], [14, 167.5], [15, 168.5], [16, 171.5], [17, 168.0], [18, 169.8], [19, 170.3]],
                        '50%': [[2, 90.2], [3, 98.1], [4, 105.2], [5, 111.7], [6, 118.2], [7, 125.6], [8, 130.5], [9, 138.3], [10, 143.7], [11, 151.4], [12, 156.7], [13, 157.7], [14, 161.0], [15, 162.0], [16, 162.8], [17, 162.2], [18, 162.8], [19, 163.3]]
                    };

                    var dataset = [{
                            label: 'female mean',
                            data: females['mean'],
                            lines: {
                                show: true
                            },
                            color: "rgb(255,50,50)"
                        }, {
                            id: 'f15%',
                            data: females['15%'],
                            lines: {
                                show: true,
                                lineWidth: 0,
                                fill: false
                            },
                            color: "rgb(255,50,50)"
                        }, {
                            id: 'f25%',
                            data: females['25%'],
                            lines: {
                                show: true,
                                lineWidth: 0,
                                fill: 0.2
                            },
                            color: "rgb(255,50,50)",
                            fillBetween: 'f15%'
                        }, {
                            id: 'f50%',
                            data: females['50%'],
                            lines: {
                                show: true,
                                lineWidth: 0.5,
                                fill: 0.4,
                                shadowSize: 0
                            },
                            color: "rgb(255,50,50)",
                            fillBetween: 'f25%'
                        }, {
                            id: 'f75%',
                            data: females['75%'],
                            lines: {
                                show: true,
                                lineWidth: 0,
                                fill: 0.4
                            },
                            color: "rgb(255,50,50)",
                            fillBetween: 'f50%'
                        }, {
                            id: 'f85%',
                            data: females['85%'],
                            lines: {
                                show: true,
                                lineWidth: 0,
                                fill: 0.2
                            },
                            color: "rgb(255,50,50)",
                            fillBetween: 'f75%'
                        }, {
                            label: 'male mean',
                            data: males['mean'],
                            lines: {
                                show: true
                            },
                            color: "rgb(50,50,255)"
                        }, {
                            id: 'm15%',
                            data: males['15%'],
                            lines: {
                                show: true,
                                lineWidth: 0,
                                fill: false
                            },
                            color: "rgb(50,50,255)"
                        }, {
                            id: 'm25%',
                            data: males['25%'],
                            lines: {
                                show: true,
                                lineWidth: 0,
                                fill: 0.2
                            },
                            color: "rgb(50,50,255)",
                            fillBetween: 'm15%'
                        }, {
                            id: 'm50%',
                            data: males['50%'],
                            lines: {
                                show: true,
                                lineWidth: 0.5,
                                fill: 0.4,
                                shadowSize: 0
                            },
                            color: "rgb(50,50,255)",
                            fillBetween: 'm25%'
                        }, {
                            id: 'm75%',
                            data: males['75%'],
                            lines: {
                                show: true,
                                lineWidth: 0,
                                fill: 0.4
                            },
                            color: "rgb(50,50,255)",
                            fillBetween: 'm50%'
                        }, {
                            id: 'm85%',
                            data: males['85%'],
                            lines: {
                                show: true,
                                lineWidth: 0,
                                fill: 0.2
                            },
                            color: "rgb(50,50,255)",
                            fillBetween: 'm75%'
                        }]

                    $.plot($("#fill-chart"), dataset, {
                        xaxis: {
                            tickDecimals: 0
                        },
                        yaxis: {
                            tickFormatter: function (v) {
                                return v + " cm";
                            }
                        },
                    });
                }

                /* end fill chart */

                /* pie chart */

                if ($('#pie-chart').length) {

                    var data_pie = [];
                    var series = Math.floor(Math.random() * 10) + 1;
                    for (var i = 0; i < series; i++) {
                        data_pie[i] = {
                            label: "Series" + (i + 1),
                            data: Math.floor(Math.random() * 100) + 1
                        }
                    }

                    $.plot($("#pie-chart"), data_pie, {
                        series: {
                            pie: {
                                show: true,
                                innerRadius: 0.5,
                                radius: 1,
                                label: {
                                    show: false,
                                    radius: 2 / 3,
                                    formatter: function (label, series) {
                                        return '<div style="font-size:11px;text-align:center;padding:4px;color:white;">' + label + '<br/>' + Math.round(series.percent) + '%</div>';
                                    },
                                    threshold: 0.1
                                }
                            }
                        },
                        legend: {
                            show: true,
                            noColumns: 1, // number of colums in legend table
                            labelFormatter: null, // fn: string -> string
                            labelBoxBorderColor: "#000", // border color for the little label boxes
                            container: null, // container (as jQuery object) to put legend in, null means default on top of graph
                            position: "ne", // position of default legend container within plot
                            margin: [5, 10], // distance from grid edge to default legend container within plot
                            backgroundColor: "#efefef", // null means auto-detect
                            backgroundOpacity: 1 // set to 0 to avoid background
                        },
                        grid: {
                            hoverable: true,
                            clickable: true
                        },
                    });

                }

                /* end pie chart */

                /* site stats chart */

                if ($("#site-stats").length) {

                    var pageviews = [[1, 75], [3, 87], [4, 93], [5, 127], [6, 116], [7, 137], [8, 135], [9, 130], [10, 167], [11, 169], [12, 179], [13, 185], [14, 176], [15, 180], [16, 174], [17, 193], [18, 186], [19, 177], [20, 153], [21, 149], [22, 130], [23, 100], [24, 50]];
                    var visitors = [[1, 65], [3, 50], [4, 73], [5, 100], [6, 95], [7, 103], [8, 111], [9, 97], [10, 125], [11, 100], [12, 95], [13, 141], [14, 126], [15, 131], [16, 146], [17, 158], [18, 160], [19, 151], [20, 125], [21, 110], [22, 100], [23, 85], [24, 37]];
                    //console.log(pageviews)
                    var plot = $.plot($("#site-stats"), [{
                            data: pageviews,
                            label: "Your pageviews"
                        }, {
                            data: visitors,
                            label: "Site visitors"
                        }], {
                        series: {
                            lines: {
                                show: true,
                                lineWidth: 1,
                                fill: true,
                                fillColor: {
                                    colors: [{
                                            opacity: 0.1
                                        }, {
                                            opacity: 0.15
                                        }]
                                }
                            },
                            points: {
                                show: true
                            },
                            shadowSize: 0
                        },
                        xaxis: {
                            mode: "time",
                            tickLength: 10
                        },
                        yaxes: [{
                                min: 20,
                                tickLength: 5
                            }],
                        grid: {
                            hoverable: true,
                            clickable: true,
                            tickColor: $chrt_border_color,
                            borderWidth: 0,
                            borderColor: $chrt_border_color,
                        },
                        tooltip: true,
                        tooltipOpts: {
                            content: "%s for <b>%x:00 hrs</b> was %y",
                            dateFormat: "%y-%0m-%0d",
                            defaultTheme: false
                        },
                        colors: [$chrt_main, $chrt_second],
                        xaxis : {
                            ticks: 15,
                            tickDecimals: 2
                        },
                        yaxis: {
                            ticks: 15,
                            tickDecimals: 0
                        },
                    });

                }

                /* end site stats */

                /* updating chart */

                if ($('#updating-chart').length) {

                    // For the demo we use generated data, but normally it would be coming from the server
                    var data = [], totalPoints = 200;
                    function getRandomData() {
                        if (data.length > 0)
                            data = data.slice(1);

                        // do a random walk
                        while (data.length < totalPoints) {
                            var prev = data.length > 0 ? data[data.length - 1] : 50;
                            var y = prev + Math.random() * 10 - 5;
                            if (y < 0)
                                y = 0;
                            if (y > 100)
                                y = 100;
                            data.push(y);
                        }

                        // zip the generated y values with the x values
                        var res = [];
                        for (var i = 0; i < data.length; ++i)
                            res.push([i, data[i]])
                        return res;
                    }

                    // setup control widget
                    var updateInterval = 1000;
                    $("#updating-chart").val(updateInterval).change(function () {
                        var v = $(this).val();
                        if (v && !isNaN(+v)) {
                            updateInterval = +v;
                            if (updateInterval < 1)
                                updateInterval = 1;
                            if (updateInterval > 2000)
                                updateInterval = 2000;
                            $(this).val("" + updateInterval);
                        }
                    });

                    // setup plot
                    var options = {
                        yaxis: {
                            min: 0,
                            max: 100
                        },
                        xaxis: {
                            min: 0,
                            max: 100
                        },
                        colors: [$chrt_fourth],
                        series: {
                            lines: {
                                lineWidth: 1,
                                fill: true,
                                fillColor: {
                                    colors: [{
                                            opacity: 0.4
                                        }, {
                                            opacity: 0
                                        }]
                                },
                                steps: false

                            }
                        }
                    };
                    var plot = $.plot($("#updating-chart"), [getRandomData()], options);

                    function update() {
                        plot.setData([getRandomData()]);
                        // since the axes don't change, we don't need to call plot.setupGrid()
                        plot.draw();

                        setTimeout(update, updateInterval);
                    }

                    update();

                }

                /*end updating chart*/

            });

            /* end flot charts */

        </script>
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

    </center>
</body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>