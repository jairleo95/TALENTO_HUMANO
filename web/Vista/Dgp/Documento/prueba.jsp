
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
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

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
                        <article class="col-xs-3 col-sm-3 col-md-3 col-lg-3">

                            <!-- Widget ID (each widget will need unique ID)-->
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
                                                    <th data-hide="phone,tablet">Proceso</th>
                                                    <th >Estado</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <input type="hidden" value="" class="tamaño"/>
                                            <tr>
                                                <td><strong></strong></td>
                                                <td></td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                            Accion <span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu">
                                                        </ul>
                                                    </div>

                                                </td> 
                                                <td><img src="../../imagenes/avatar_default.jpg"  width="30"  height="30">
                                                    <a style="margin-left: 3%;" href=""> 
                                          
                                                        <strong></strong></a>

                                                    
                                                    <input type="hidden" class="num_aut" value=""/>

                                                </td>
                                                <td><div class="new-progress prog_aut"  >
                                                    </div></td>
                                                    <td></td>
                                          
                                                <td><img src=""  width="30"  height="30"><a href=""> 
                                    
                                                        <strong></strong></a> 


                                                   

                                                    <input type="hidden" class="num_aut" value=""/>
                                                </td>
                                                <td><div class="new-progress prog_aut"  >
                                                    </div></td>
                                                    <td>  </td>
                                            </tr>


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

        <!-- Demo purpose only -->
        <script src="../../../HTML_version/js/demo.min.js"></script>

        <!-- MAIN APP JS FILE -->
        <script src="../../../HTML_version/js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="../../../HTML_version/js/speech/voicecommand.min.js"></script>

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

    </body>

</html>
