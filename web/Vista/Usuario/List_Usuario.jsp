<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.model.V_Var_Usuario"%>
<jsp:useBean id="List_Usuario_var" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html">
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Usuarios</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/smartadmin-production.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/smartadmin-skins.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <script src="../../js/Js_Sort/modernizr.custom.63321.js" type="text/javascript"></script>
        <!--<link rel="stylesheet" href="../../css/Css_Sort/style.css" />
        <!--Css pannel contact-->
        <!--<link href="../../css/Css_Sort/stylesContact.css" rel="stylesheet" type="text/css" />
        <!--End Css pannel contact
        <script type="text/javascript">
            function changeCSS(cssFile, cssLinkIndex) {

                var oldlink = document.getElementsByTagName("link").item(cssLinkIndex);

                var newlink = document.createElement("link")
                newlink.setAttribute("rel", "stylesheet");
                newlink.setAttribute("type", "text/css");
                newlink.setAttribute("href", cssFile);

                document.getElementsByTagName("head").item(0).replaceChild(newlink, oldlink);
            }

        </script>

        <script>
            function checkAGE()
            {
                if (!confirm
                        ("¿Estas seguro de eliminar este registro?"))
                    history.go(-1);
                return " "
            }

            //document.writeln(checkAGE())

        </script>-->
        <script>
            var valorr= 0;
        </script>
    </head>
    <body>
        <div id="main" role="main" style="margin-left: 0px;">
            <div id="content">
                <section id="widget-grid" class="">
                    <div class="row">
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3" data-widget-editbutton="false">
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Usuarios</h2>
                                </header>
                                <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body no-padding">
                                        <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%">
                                            <thead>
                                                <tr>
                                                    <th data-hide="phone">ID</th>
                                                    <th>Accion</th>
                                                    <th data-class="expand">Nombres y Apellidos</th>
                                                    <th>Rol</th>
                                                    <th>Puesto</th>
                                                    <th>Seccion</th>
                                                    <th>Area</th>
                                                    <th>Departamento</th>
                                                    <th>Usuario</th>
                                                    <th>Clave</th>
                                                    <th>Estado</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%for (int i = 0; i < List_Usuario_var.size(); i++) {
                                                        V_Var_Usuario v = new V_Var_Usuario();
                                                        v = (V_Var_Usuario) List_Usuario_var.get(i);
                                                %>
                                                <tr>
                                                    <td class="valor"><%=i + 1%></td>
                                                    <td>
                                                        <div class="btn-group">
                                                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                                Accion <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu" role="menu">
                                                                <li><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Mod_Usuario_con"  >Editar</a></li>
                                                                <li><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Desac_Usuario_con">Desactivar</a></li>
                                                                <li class="divider"></li>
                                                                <li><a class="btnActivar<%=i%>">Activar</a></li>                                                                
                                                                <li><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Elim_Usuario_con">Eliminar</a></li>
                                                                <li><a href="#" id="smart-mod-eg1" class="btn btn-success"> Callback ()</a></li>                                           
                                                            </ul>
                                                        </div>
                                                    </td>
                                                    <td class="name"><a href="../../Usuario?id_Usuario=<%=v.getId_usuario()%>&opc=Mod_Usuario_con"><%=v.getNo_trabajador() + " " + v.getAp_paterno() + " " + v.getAp_materno()%></a></td>
                                                    <td><%=v.getNo_rol()%></td>
                                                    <td><%=v.getNo_puesto()%></td>
                                                    <td><%=v.getNo_seccion()%></td>
                                                    <td><%=v.getNo_area()%></td>
                                                    <td><%=v.getNo_dep()%></td>
                                                    <td><%=v.getNo_usuario()%></td>
                                                    <td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Modificar_clave_1"><%=v.getPw_usuario()%> </a></td>
                                                    <td><%=v.getEs_usuario()%></td>

                                                    <%--<td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Mod_Usuario_con"><img src="../../imagenes/lapiz.png" alt=""   width="25px" height="25px"/></a> </td>
                                                    <td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Desac_Usuario_con"><img src="../../imagenes/eliminar.png" alt=""   width="25px" height="25px"/></a> </td>
                                                    <td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Activar_Usuario_con"><img src="../../imagenes/Aprobado.png" alt=""   width="25px" height="25px"/></a> </td>
                                                    <td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Elim_Usuario_con"><img src="../../imagenes/Desaprobado.png" alt=""   width="25px" height="25px"/></a> </td>--%>

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
                    <!-- end row -->
                </section>
                <!-- end widget grid -->
            </div>
            <!-- END MAIN CONTENT -->
        </div>
        <!-- END MAIN PANEL -->


        <%-- <div class="container">
             <div id="tablewrapper">
                 <div id="tableheader">
                     <div class="search">
                         <select id="columns" onchange="sorter.search('query')"></select>
                         <input type="text" id="query" onkeyup="sorter.search('query')" />
                     </div>
                     <span class="details">
                         <div>Registros de <span id="startrecord"></span>-<span id="endrecord"></span> de <span id="totalrecords"></span></div>
                         <div class="btn-reset"><a class="button blue" href="javascript:sorter.reset()">Restaurar</a></div>
                     </span>
                 </div>
                 <table cellpadding="0" order="0" id="table" class="tinytable table">
                     <thead class="table-bordered">
                         <tr>
                             <th ><h3>ID</h3></th>
                     <th><h3>Nombres y Apellidos</h3></th>
                     <th><h3>Rol</h3></th>
                     <th><h3>Puesto</h3></th>
                     <th><h3>Sección</h3></th>
                     <th><h3>Area</h3></th>
                     <th><h3>Departamento</h3></th>
                     <th><h3>Usuario</h3></th>
                     <th><h3>Clave</h3></th>
                     <th><h3>Estado</h3></th>
                     <th colspan="4"><h3>Opcion</h3></th>
                     </tr>
                     </thead>
                     <tbody>
                         <%for (int i = 0; i < List_Usuario_var.size(); i++) {
                                 V_Var_Usuario v = new V_Var_Usuario();
                                 v = (V_Var_Usuario) List_Usuario_var.get(i);
                         %>
                         <tr>
                             <td><%=i + 1%></td>
                             <td class="name"><a href="../../Usuario?id_Usuario=<%=v.getId_usuario()%>&opc=Mod_Usuario_con"><%=v.getNo_trabajador() + " " + v.getAp_paterno() + " " + v.getAp_materno()%></a></td>
                             <td><%=v.getNo_rol()%></td>
                             <td><%=v.getNo_puesto()%></td>
                             <td><%=v.getNo_seccion()%></td>
                             <td><%=v.getNo_area()%></td>
                             <td><%=v.getNo_dep()%></td>
                             <td><%=v.getNo_usuario()%></td>
                             <td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Modificar_clave_1"><%=v.getPw_usuario()%> </a></td>
                             <td><%=v.getEs_usuario()%></td>
                             <td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Mod_Usuario_con"><img src="../../imagenes/lapiz.png" alt=""   width="25px" height="25px"/></a> </td>
                             <td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Desac_Usuario_con"><img src="../../imagenes/eliminar.png" alt=""   width="25px" height="25px"/></a> </td>
                             <td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Activar_Usuario_con"><img src="../../imagenes/Aprobado.png" alt=""   width="25px" height="25px"/></a> </td>
                             <td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Elim_Usuario_con"><img src="../../imagenes/Desaprobado.png" alt=""   width="25px" height="25px"/></a> </td>

                        </tr>
                        <%}%>        
                    </tbody>
                </table>
                <div id="tablefooter">
                    <div id="tablenav">
                        <div>
                            <img src="../../imagenes/Img_Sort/first.png" width="16" height="16" alt="First Page" onclick="sorter.move(-1, true)" />
                            <img src="../../imagenes/Img_Sort/previous.png" width="16" height="16" alt="First Page" onclick="sorter.move(-1)" />
                            <img src="../../imagenes/Img_Sort/next.png" width="16" height="16" alt="First Page" onclick="sorter.move(1)" />
                            <img src="../../imagenes/Img_Sort/last.png" width="16" height="16" alt="Last Page" onclick="sorter.move(1, true)" />
                        </div>
                        <div>
                            <label>Página: </label>
                            <select  id="pagedropdown"></select>
                        </div>
                        <div class="btn-reset"><a class="button blue" href="javascript:sorter.showall()">Ver todo</a>
                        </div>
                    </div>
                    <div id="tablelocation">
                        <div>
                            <select onchange="sorter.size(this.value)">
                                <option value="5" selected="selected">5</option>
                                <option value="10" >10</option>
                                <!-- <option value="15">15</option>
                                <option value="50">50</option>
                                <option value="100">100</option>-->
                            </select>
                            <span class="txt-page">Entradas por página</span>
                        </div>

                        <div class="page txt-txt">Página <span id="currentpage"></span> de <span id="totalpages"></span></div>
                    </div>
                </div>
            </div>
        </div>--%>


        <!--<script type="text/javascript" src="../../js/Js_Sort/script.js"></script>
        <script type="text/javascript">
            var sorter = new TINY.table.sorter('sorter', 'table', {
                headclass: 'head', // Header Class //
                ascclass: 'asc', // Ascending Class //
                descclass: 'desc', // Descending Class //
                evenclass: 'evenrow', // Even Row Class //
                oddclass: 'oddrow', // Odd Row Class //
                evenselclass: 'evenselected', // Even Selected Column Class //
                oddselclass: 'oddselected', // Odd Selected Column Class //
                paginate: true, // Paginate? (true or false) //
                size: 5, // Initial Page Size //
                colddid: 'columns', // Columns Dropdown ID (optional) //
                currentid: 'currentpage', // Current Page ID (optional) //
                totalid: 'totalpages', // Current Page ID (optional) //
                startingrecid: 'startrecord', // Starting Record ID (optional) //
                endingrecid: 'endrecord', // Ending Record ID (optional) //
                totalrecid: 'totalrecords', // Total Records ID (optional) //
                hoverid: 'selectedrow', // Hover Row ID (optional) //
                pageddid: 'pagedropdown', // Page Dropdown ID (optional) //
                navid: 'tablenav', // Table Navigation ID (optional) //
                sortcolumn: 1, // Index of Initial Column to Sort (optional) //
                sortdir: 1, // Sort Direction (1 or -1) //
                sum: [8], // Index of Columns to Sum (optional) //
                //avg: [6, 7, 8, 9], // Index of Columns to Average (optional) //
                columns: [{index: 7, format: '%', decimals: 1}, {index: 8, format: '$', decimals: 0}], // Sorted Column Settings (optional) //
                init: true// Init Now? (true or false) //

            });
        </script>-->


        <!--Script Open Pannel--->
        <script src="../../js/jquery.min.js"></script>
        <script src="../../js/Js_Sort/jquery.reveal.js" type="text/javascript"></script>


        <script type="text/javascript">
            $(document).ready(function() {
                $('.button-email').click(function(e) { // Button which will activate our modal
                    var title = $(this).attr('title');
                    var title2 = $('.name').attr('title');
                    document.getElementById("email").innerHTML = title.toString();
                    $('#modal').reveal({// The item which will be opened with reveal
                        animation: 'fade', // fade, fadeAndPop, none
                        animationspeed: 600, // how fast animtions are
                        closeonbackgroundclick: true, // if you click background will modal close?
                        dismissmodalclass: 'close'    // the class of a button or element that will close an open modal
                    });
                    return false;
                });
            });
        </script> 
        <!--End Script Open Pannel--->

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
                $("div.toolbar").html('<div class="text-right"><img src="img/logo.png" alt="SmartAdmin" style="width: 111px; margin-top: 3px; margin-right: 10px;"></div>');

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
                                "sTitle": "Empleados_PDF",
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
                    "preDrawCallback": function() {
                        // Initialize the responsive datatables helper once.
                        if (!responsiveHelper_datatable_tabletools) {
                            responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper($('#datatable_tabletools'), breakpointDefinition);
                        }
                    },
                    "rowCallback": function(nRow) {
                        responsiveHelper_datatable_tabletools.createExpandIcon(nRow);
                    },
                    "drawCallback": function(oSettings) {
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

            (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                pageSetUp();

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
                $('#eg1').click(function(e) {

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

                $('#eg2').click(function(e) {

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

                $('#eg3').click(function(e) {

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

                $('#eg4').click(function(e) {

                    $.bigBox({
                        title: "Success Message Example",
                        content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#739E73",
                        //timeout: 8000,
                        icon: "fa fa-check",
                        number: "4"
                    }, function() {
                        closedthis();
                    });

                    e.preventDefault();

                })



                $('#eg5').click(function() {

                    $.smallBox({
                        title: "Ding Dong!",
                        content: "Someone's at the door...shall one get it sir? <p class='text-align-right'><a href='javascript:void(0);' class='btn btn-primary btn-sm'>Yes</a> <a href='javascript:void(0);' class='btn btn-danger btn-sm'>No</a></p>",
                        color: "#296191",
                        //timeout: 8000,
                        icon: "fa fa-bell swing animated"
                    });

                });



                $('#eg6').click(function() {

                    $.smallBox({
                        title: "Big Information box",
                        content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#5384AF",
                        //timeout: 8000,
                        icon: "fa fa-bell"
                    });

                })

                $('#eg7').click(function() {

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
                $(".btnActivar"+valorr).click(function(e) {
                    $.SmartMessageBox({
                        title: "Activar usuario!",
                        content: "¿Esta seguro de habilitar el usuario?",
                        buttons: '[No][Yes]'
                    }, function(ButtonPressed) {
                        if (ButtonPressed === "Yes") {
                            alert($(this).href );
                            $.post("../../Usuario", "id_Usuaio=" + $('.btnActivar').attr('id') + "&opc=Activar_Usuario_con", function() {
                                $.smallBox({
                                    title: "Activar Usuario",
                                    content: "<i class='fa fa-clock-o'></i> <i>El Usuario ha sido activado </i>",
                                    color: "#659265",
                                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                    timeout: 4000
                                });
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
                    //e.preventDefault();
                })
                $("#smart-mod-eg1").click(function(e) {
                    $.SmartMessageBox({
                        title: "Smart Alert!",
                        content: "This is a confirmation box. Can be programmed for button callback",
                        buttons: '[No][Yes]'
                    }, function(ButtonPressed) {
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
                $("#smart-mod-eg2").click(function(e) {

                    $.SmartMessageBox({
                        title: "Smart Alert: Input",
                        content: "Please enter your user name",
                        buttons: "[Accept]",
                        input: "text",
                        placeholder: "Enter your user name"
                    }, function(ButtonPress, Value) {
                        alert(ButtonPress + " " + Value);
                    });

                    e.preventDefault();
                })
                // With Buttons
                $("#smart-mod-eg3").click(function(e) {

                    $.SmartMessageBox({
                        title: "Smart Notification: Buttons",
                        content: "Lots of buttons to go...",
                        buttons: '[Need?][You][Do][Buttons][Many][How]'
                    });

                    e.preventDefault();
                })
                // With Select
                $("#smart-mod-eg4").click(function(e) {

                    $.SmartMessageBox({
                        title: "Smart Alert: Select",
                        content: "You can even create a group of options.",
                        buttons: "[Done]",
                        input: "select",
                        options: "[Costa Rica][United States][Autralia][Spain]"
                    }, function(ButtonPress, Value) {
                        alert(ButtonPress + " " + Value);
                    });

                    e.preventDefault();
                });

                // With Login
                $("#smart-mod-eg5").click(function(e) {

                    $.SmartMessageBox({
                        title: "Login form",
                        content: "Please enter your user name",
                        buttons: "[Cancel][Accept]",
                        input: "text",
                        placeholder: "Enter your user name"
                    }, function(ButtonPress, Value) {
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
                        }, function(ButtonPress, Value) {
                            alert("Username: " + ValueOriginal + " and your password is: " + Value);
                        });
                    });

                    e.preventDefault();
                });


            });

        </script>
    </body>
</html>



<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>