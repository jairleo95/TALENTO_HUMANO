<%-- 
    Document   : Reporte_Datos_Generales
    Created on : 05-feb-2015, 9:11:47
    Author     : joserodrigo
--%>


<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Reporte Navidad </title>
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
        <style>
            .caja{
                background:transparent url(../../img/Gifloader.GIF) center no-repeat;
            }
        </style>
    </head>
    <body>
        <form class="form-inline validarform" id="frm_filtro2" method="post" action="../../Imprimir" name="formulario" onclick="return marcado();">
            <div class="spacing">
                <center><h1 class="spacing" style="font-weight: bold;">REPORTE-TRABAJADORES EN NAVIDAD</h1></center> 
            </div>
            <div class="row">
                <div align="center">
                    <div class="form-group" >
                        <label>CODIGO APS</label><br>
                        <input type="text"  class="form-control mes" placeholder="APS" name=""  length="45" style="width: 80px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>DEPARTAMENTO</label><br>
                        <input type="text"  class="form-control mes" placeholder="Ingrese el DEPARTAMENTO" name=""  length="45" style="width: 150px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>AREA</label><br>
                        <input type="text"  class="form-control mes" placeholder="Ingrese su AREA" name=""  length="45" style="width: 150px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>SECCIÓN</label><br>
                        <input type="text"  class="form-control mes" placeholder="Ingrese su SECCIÓN" name=""  length="45" style="width: 150px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>PUESTO</label><br>
                        <input type="text"  class="form-control mes" placeholder="Ingrese su PUESTO" name=""  length="45" style="width: 150px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>EDAD</label><br>
                        <input type="text"  class="form-control mes" placeholder="EDAD" name=""  length="45" style="width: 80px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>APELLIDO Y NOMBRES</label><br>
                        <input type="text"  class="form-control mes" placeholder="Ingrese APELLIDOS Y NOMBRES" name=""  length="45" style="width: 250px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>TIPO DOC</label><br>
                        <input type="text"  class="form-control mes" placeholder="Ingrese la cantidad de meses" name=""  length="45" style="width: 250px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>Nº DOCUMENTO</label><br>
                        <input type="text"  class="form-control mes" placeholder="Nº Documento" name=""  length="45" style="width: 120px" id="des"/>
                    </div><br>
                    <div class="row">
                        <div class="form-group" >
                            <label>Tiempo de Trabajo (Mayor a 10 meses)</label><br>
                            <input type="text"  class="form-control mes" placeholder="Ingrese la cantidad de meses" name="mes"  length="45" style="width: 250px" id="des"/>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="form-group">  
                            <br>
                            <a id="btnbuscar"class="btn btn-primary btn-circle btn-xl btnEnviar">
                                <i class="glyphicon glyphicon-search"></i>
                            </a>
                            <a id="btncancel" class="btn btn-danger btn-circle btn-xl btnCancelar">
                                <i class="glyphicon glyphicon-remove"></i>
                            </a>
                        </div>

                    </div> 
                </div> 
            </div>
        </form>
        <div id="main" role="main" style="margin-left: 0px">

            <!-- RIBBON -->
            <!-- END RIBBON -->

            <!-- MAIN CONTENT -->
            <div id="content">

                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <!-- end widget -->

                            <!-- Widget ID (each widget will need unique ID)-->
                            <!-- end widget -->

                            <!-- Widget ID (each widget will need unique ID)-->
                            <!-- end widget -->

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-1" data-widget-editbutton="false">

                                <header width="200%">
                                    <span class="widget-icon"><i class="fa fa-table"></i>  </span>
                                    <label style=" font-size:21px; font-family:cambria; color:white ;padding-left:5px;padding-top: 2px;">Reporte Filtro</label>
                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox" width="200%">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding">

                                        <table id="datatable_tabletools" class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th data-hide="phone">#</th>
                                                    <th data-class="APS">Codigo APS</th>
                                                    <th data-hide="DEP">Departamento</th>
                                                    <th data-hide="ARE">Area</th>
                                                    <th data-hide="ARE">Puesto</th>
                                                    <th data-class="tip">Tipo Documento</th>  
                                                    <th data-class="tip">Numerno de Documento</th>
                                                    <th data-class="tip">Sección</th>
                                                    <th data-class="tip">Apelido Paterno</th>
                                                    <th data-class="tip">Apellido Materno</th>
                                                    <th data-class="tip">Nombres</th>
                                                    <th data-class="tip">Apellidos y Nombres</th>
                                                    <th data-class="tip">sexo</th>
                                                    <th data-class="tip">Fecha Nacimiento</th>                                                    
                                                    <th data-class="tip">Fecha de Inicio</th>
                                                    <th data-class="tip">Fecha de Cese</th>
                                                    <th data-class="tip">Meses Trabajando</th>
                                                </tr>
                                            </thead>

                                            <tbody id="listar_trabajor_na">

                                            </tbody>
                                        </table>
                                        <div class="div_t">                                                                                     
                                        </div>
                                    </div>

                                </div>

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


        <!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
        Note: These tiles are completely responsive,
        you can add as many as you like
        -->
        <!-- END SHORTCUT AREA -->

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
                        "sSwfPath": "../../js/DataTables-1.10.4/media/js/copy_csv_xls_pdf.swf"
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

            });

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


        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
    </body>
    <script>

            function listar_trabajor_na() {
                var a = $(".mes").val();
                var b = $("#listar_trabajor_na");
                var texto = '';
                $.post("../../reporte", "opc=reporte_t_navidad&mes=" + a, function (objJson) {
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    b.empty();
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        for (var i = 0; i < lista.length; i++) {
                            texto += '<tr role="row" class="odd">';
                            texto += '<td class>' + (i + 1) + '</td>';
                            texto += '<td>' + lista[i].aps + '</td>';
                            texto += '<td>' + lista[i].dep + '</td>';
                            texto += '<td>' + lista[i].are + '</td>';
                            texto += '<td>' + lista[i].pue + '</td>';
                            texto += '<td>' + lista[i].ti_doc + '</td>';
                            texto += '<td>' + lista[i].nu_doc + '</td>';
                            texto += '<td>' + lista[i].sec + '</td>';
                            texto += '<td>' + lista[i].pat + '</td>';
                            texto += '<td>' + lista[i].mat + '</td>';
                            texto += '<td>' + lista[i].nom_t + '</td>';
                            texto += '<td>' + lista[i].pat + " " + lista[i].mat + " " + lista[i].nom_t + '</td>';
                            texto += '<td>' + lista[i].sex + '</td>';
                            texto += '<td>' + lista[i].fe_nac + '</td>';
                            texto += '<td>' + lista[i].des + '</td>';
                            texto += '<td>' + lista[i].has + '</td>';
                            texto += '<td>' + lista[i].t_tra + '</td>';
                            texto += '</tr>';
                            $('.div_t').empty();
                        }
                        b.append(texto);
                    } else {
                        $('.div_t').empty();
                        b.append("<td colspan='11' align='center'><strong>NO SE ENCONTRARON DATOS</strong></td>");

                    }
                });

            }
            //OPCIONES DEL BOTTON
            $(document).ready(function () {
                var b = $('#tbodys');

                $("#btnbuscar").click(
                        function () {
                            GifLoader($('.div_t'), " Por Favor Espere un Momento..", 1);
                            listar_trabajor_na();
                        }
                );
                $("#btncancel").click(
                        function () {
                            document.formulario.reset();
                            b.empty();
                            html = '<tr><td colspan="8" align="center">Haga la busqueda por algunos de los filtros...</td></tr>'
                            $(".tbodys").html(html);
                        }
                );
            }
            );
            // Login En el reporte
            function GifLoader(contenedor, msg, action) {
                $('.headerr').hide();
                var text = "";
                contenedor.empty();
                if (action == 1) {
                    text += "<div class='caja' style='height:250px; width:150px; margin:auto;'><center><h3>" + msg + "</h3></center></div>";
                } else if (action == 2) {
                    text += "<div style='height:150px; width:150px; margin:auto; padding-top:30px;'><center><h3>" + msg + "</h3></center></div>";
                }
                contenedor.append(text);
            }

    </script>

</html>
