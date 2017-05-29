
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

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
        <title>Reporte Datos Hijos</title>
        <style>
            .caja{
                background:transparent url(../../img/Gifloader.GIF) center no-repeat;
            }
        </style>
    </head>
    <body>  
        <form class="form-inline validarform" id="frm_filtro2" method="post" action="../../Imprimir" name="formulario" onclick="return marcado();">
            <div class="spacing" >
                <center><h1 class="spacing" style="font-weight: bold;">Datos Hijos</h1></center>
                <a href="RTHijo.jsp">new</a>
            </div>
            <center>
                <br>
                <div id="contenido">

                    <div class="well">
                        <!--style="padding-left: 30px"-->
                        <div class="form-group" >
                            <label>Nombre</label><br>
                            <input type="text"  class="form-control nom" placeholder="Nombre" length="45" style="width:280px"/>
                        </div>
                        <div class="form-group" >
                            <label>Apellido Paterno</label><br>
                            <input type="text"  class="form-control ape" placeholder="Nombre" length="45" style="width:280px"/>
                        </div>
                        <div class="form-group" >
                            <label>Apellido Materno</label><br>
                            <input type="text"  class="form-control mat" placeholder="Nombre" length="45" style="width:280px" />
                        </div>
                        <div class="form-group" >
                            <label>Dni</label><br>
                            <input type="text"  class="form-control dni" placeholder="Dni" length="45" style="width:120px"/>
                        </div>
                        <div class="form-group" >
                            <label>Genero:</label><br>
                            <select name="puesto"class="form-control selec_gen" id="selec_gen"style="width: 150px"> 
                                <option value="">[Seleccione]</option>
                                <option value="F">Femenino</option>
                                <option value="M">Masculino</option>
                            </select>
                        </div>
                        <br>
                        <hr1 class="spacing" style="font-weight: bold;">Filtro Rango Edad del Hijos</hr1>
                        <div class="row">
                            <div class="form-group" >
                                <label>Desde</label><br>
                                <input type="text"  class="form-control des" placeholder="Inicio rango de edad"  length="45" style="width: 250px" id="des"/>
                            </div>
                            <div class="form-group" >
                                <label>Hasta</label><br>
                                <input type="text"  class="form-control has" placeholder="Fin rango de edad" size="45" maxlength="100" style="width: 250px" id="has" />
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="form-group" >
                                <label>Edad</label><br>
                                <input type="text"  class="form-control edad" placeholder="Rango general de edad" length="45" style="width: 250px" id="edad"/>
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
                    <br>
                    <br>
                    <div class="row" style="padding-left: 25px;padding-right: 25px;">

                        <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3" data-widget-editbutton="false">
                            <header>
                                <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                <h2>Exportar en PDF o Excel</h2>

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

                                    <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%">
                                        <thead>
                                            <tr>
                                                <th data-hide="phone">#</th>
                                                <th data-class="nom">Nombre</th>
                                                <th data-hide="dni">Dni</th>
                                                <th data-hide="Genero">Genero</th>
                                                <th data-hide="fec_nac">Fecha de nacimiento</th>
                                                <th data-hide="edad">Edad</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody id="Li_hijos">

                                        </tbody>
                                    </table>
                                    <div class="div_t">                                                                                     
                                    </div>

                                </div>
                                <!-- end widget content -->

                            </div>
                            <!-- end widget div -->

                        </div>

                    </div>
                </div>
            </center>
        </form>
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
                setTable();

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
                
                function setTable() {
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
                }

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
    <script>
        function listar_opciones(opc, id) {
            if (opc == 'Listar_dir_dep') {
                var a = $(".selectdep");
                $(".selectarea").empty();
                $(".selectarea").append("<option value=''>[Seleccione]</option>");
                $(".selectsec").empty();
                $(".selectsec").append("<option value=''>[Seleccione]</option>");
                $(".selectpu").empty();
                $(".selectpu").append("<option value=''>[Seleccione]</option>");
            }
            if (opc == 'Listar_area2') {
                var a = $(".selectarea");
                $(".selectsec").empty();
                $(".selectsec").append("<option value=''>[Seleccione]</option>");
                $(".selectpu").empty();
                $(".selectpu").append("<option value=''>[Seleccione]</option>");
            }
            if (opc == 'Listar_sec2') {
                var a = $(".selectsec");
                $(".selectpu").empty();
                $(".selectpu").append("<option value=''>[Seleccione]</option>");
            }
            if (opc == 'Listar_pu_id') {
                var a = $(".selectpu");
            }
            $.post("../../Direccion_Puesto", "opc=" + opc.trim() + "&id=" + id.trim(), function (objJson) {
                var list = objJson.lista;
                a.empty();
                a.append("<option value=''>[Seleccione]</option>");
                for (var i = 0; i < list.length; i++) {
                    a.append("<option value='" + list[i].id + "'>" + list[i].nombre + "</option>");
                }
                $(".tbodys").append();
            });

        }
        function buscar(del, al, nombre, dir, dep, area, sec, puesto, fe_i, fe_fi, ca_sueldo, fe_sus) {
            var b = $(".tbodys");
            $.post("../../impresion_masiva?opc=filtrar" + "&desde=" + del + "&al=" + al + "&nom_ape=" + nombre + "&direccion=" + dir + "&departamento=" + dep + "&area=" + area + "&seccion=" + sec + "&puesto=" + puesto + "&fec_i=" + fe_i + "&fec_f=" + fe_fi + "&sueldo=" + ca_sueldo + "&fe_sus=" + fe_sus, function (objJson) {
                b.empty();
                //alert($("#select_pu").val());
                var list = objJson.lista;
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var nuro = 1;
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        nuro = nuro + i;
                        b.append("<tr>");
                        b.append("<td>" + nuro + "</td>");
                        b.append("<td><p>" + list[i].nombre + "</p></td>");
                        b.append("<td>" + list[i].fe_de + "</td>");
                        if (list[i].fe_ha != null) {
                            b.append("<td>" + list[i].fe_ha + "</td>");
                        } else {
                            b.append("<td>indefinido</td>");
                        }
                        // b.append("<td>" + list[i].fe_ha + "</td>");
                        b.append("<td><p>" + list[i].no_ar + "</p></td>");
                        b.append("<td><p>" + list[i].no_se + "</p></td>");
                        b.append("<td><p>" + list[i].no_pu + "</p></td>");
                        b.append("<td>" + list[i].ca_su + '</td>');
                        b.append("<td>" + list[i].fe_su + "</td>");
                        b.append('<td><a class="btn-warming" href="../../contrato?opc=Detalle_Contractual&idtr=' + list[i].id_tr + '">Ver detalle</a> </td>');
                        //b.append('<td id="sel' + i + '"></td>');
                        if (list[i].id_pl != null) {
                            b.append('<td><input type="checkbox" id="imp" name="Imprimir" value="' + list[i].id_co + '/' + list[i].id_pl + '"></td>');
                        } else {
                            b.append('<td>NO TIENE</td>');
                        }
                        b.append("</tr>");
                        nuro = 1;
                    }
                    if (list.length !== 0) {
                        $("#asa").show();
                    }
                    $("#btns").click(
                            function () {
                                $("#gg :checkbox").attr('checked', true);
                                $('#imp').is(':checked');
                                alerta(checkboxValues.push($("#imp").val()));
                            });
                    $("#btns2").click(
                            function () {
                                var checkboxValues = new Array();
//recorremos todos los checkbox seleccionados con .each
                                $('input[name="orderBox[]"]:checked').each(function () {
                                    //$(this).val() es el valor del checkbox correspondiente
                                    checkboxValues.push($(this).val());
                                    alert(checkboxValues.push($(this).val()));
                                });
                            });
                } else {
                    b.append("<tr><TD colspan='12' style='text-align:center;'> NO SE HA ENCONTRADO DATOS DE LA BUSQUEDA</TD></tr>")
                }

            }
            );
        }
        function marcado() {
            if (document.form.termin.checked) {
                document.form.submit();
            }
            else {
                alert("Debes aceptar los términos y condiciones");
                document.form.termin.focus();
                return false;
            }

        }
        //Listar Hijos de Trabajadores
        function listar_hijos() {
            var a = $(".des").val();
            var b = $(".has").val();
            var c = $(".edad").val();
            var no = $(".nom").val();
            var ap = $(".ape").val();
            var ma = $(".mat").val();
            var dn = $(".dni").val();
            var ge = $(".selec_gen").val();
            var fe = $(".fec").val();
            var d = $("#Li_hijos");
            var texto = '';
            $.post("../../reporte", "opc=reporte_hijo&desde=" + a + "&hasta=" + b + "&edad=" + c + "&nom=" + no + "&paterno=" + ap + "&materno=" + ma + "&dni=" + dn + "&genero=" + ge, function (objJson) {
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                d.empty();
                var lista = objJson.lista;
                if (lista.length > 0) {
                    for (var i = 0; i < lista.length; i++) {
                        texto += '<tr role="row" class="odd">';
                        texto += '<td class>' + (i + 1) + '</td>';
                        texto += '<td>' + lista[i].nom + '</td>';
                        texto += '<td>' + lista[i].dni + '</td>';
                        texto += '<td>' + lista[i].gen + '</td>';
                        texto += '<td>' + lista[i].fec_na + '</td>';
                        texto += '<td>' + lista[i].edad + '</td>';
                        texto += '</tr>';
                        $('.div_t').empty();

                    }
                    d.append(texto);
                } else {
                    $('.div_t').empty();
                    d.append("<td colspan='11' align='center'><strong>NO SE ENCONTRARON DATOS</strong></td>");
                }
            });
        }
        $(document).ready(function () {
            var b = $('#tbodys');
            $("#btnbuscar").click(
                    function () {
                        GifLoader($('.div_t'), " Por Favor Espere un Momento..", 1);
                        listar_hijos();
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
        });
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
