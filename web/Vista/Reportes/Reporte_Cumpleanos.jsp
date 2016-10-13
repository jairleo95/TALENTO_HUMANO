<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

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
        <title>Reporte de Cumpleaños</title>
    </head>
    <body>  
        <form class="form-inline validarform" id="frm_filtro2" method="post" action="../../Imprimir" name="formulario" onclick="return marcado();">
            <div class="spacing">
                <center><h1 class="spacing" style="font-weight: bold;">Cumpleaños Del Trabajador</h1></center> 
            </div>
            <center>
                <div class="spacing">
                    <center><h3 class="spacing" style="font-weight: bold;">Filtro</h3></center> 
                </div>
                <br>
                <div id="contenido" >
                    <div class="form-group" >
                        <label>CODIGO APS</label><br>
                        <input type="text"  class="form-control aps" placeholder="APS"  length="45" style="width: 80px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>DEPARTAMENTO</label><br>
                        <input type="text"  class="form-control dep" placeholder="Ingrese el DEPARTAMENTO" length="45" style="width: 150px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>AREA</label><br>
                        <input type="text"  class="form-control are" placeholder="Ingrese su AREA" length="45" style="width: 150px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>SECCIÓN</label><br>
                        <input type="text"  class="form-control sec" placeholder="Ingrese su SECCIÓN" length="45" style="width: 150px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>PUESTO</label><br>
                        <input type="text"  class="form-control pue" placeholder="Ingrese su PUESTO" length="45" style="width: 150px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>EDAD</label><br>
                        <input type="text"  class="form-control edad" placeholder="EDAD" length="45" style="width: 80px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>APELLIDO PATERNO</label><br>
                        <input type="text"  class="form-control pat" placeholder="Ingrese Apellido Paterno" length="45" style="width: 250px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>APELLIDO MATERNO</label><br>
                        <input type="text"  class="form-control mat" placeholder="Ingrese Apellido Materno" length="45" style="width: 250px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>NOMBRE</label><br>
                        <input type="text"  class="form-control nom" placeholder="Ingrese NOMBRES" length="45" style="width: 250px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>TIPO DOC</label><br>
                        <input type="text"  class="form-control tip" placeholder="Ingrese el tipo de Docuemtno" length="45" style="width: 250px" id="des"/>
                    </div>
                    <div class="form-group" >
                        <label>Nº DOCUMENTO</label><br>
                        <input type="text"  class="form-control num" placeholder="Nº Documento" length="45" style="width: 120px" id="des"/>
                    </div>
                    <div>
                        <!--style="padding-left: 30px"-->
                        <br>

                        <div class="form-group">
                            <label>Mes de Cumpleaños:</label><br>
                            <select name="puesto" class="form-control selec_mes" id="selec_mes" style="width: 250px"> 
                                <option value="">[Seleccione]</option>
                                <option value="01">Enero</option>
                                <option value="02">Febrero</option>
                                <option value="03">Marzo</option>
                                <option value="04">Abril</option>
                                <option value="05">Mayo</option>
                                <option value="06">Junio</option>
                                <option value="07">Julio</option>
                                <option value="08">Agosto</option>
                                <option value="09">Setiembre</option>
                                <option value="10">Octubre</option>
                                <option value="11">Noviembre</option>
                                <option value="12">Diciembre</option>
                                <option value="13">Todos</option>
                            </select>
                        </div>
                        <br>
                        <br>
                        <div class="form-group">
                            <label>Dia de Cumpleaños:</label><br>
                            <select name="puesto" class="form-control select_dia aaa" id="select_dia" style="width: 250px"> 
                                <option value="">[Seleccione]</option>
                            </select>

                        </div>
                        <br>

                        <div class="row">
                            <div class="form-group">  
                                <br>
                                <a id="btnbuscar" class="btn btn-primary btn-circle btn-xl btnEnviar">
                                    <i class="glyphicon glyphicon-search"></i>
                                </a>
                                <a id="btncancel" class="btn btn-danger btn-circle btn-xl btnCancelar">
                                    <i class="glyphicon glyphicon-remove"></i>
                                </a>
                            </div>
                        </div>
                    </div> 
                </div>
                <br>
                <br>
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
                                        <th data-class="APS">Codigo APS</th>
                                        <th data-hide="DEP">Departamento</th>
                                        <th data-hide="ARE">Area</th>
                                        <th data-hide="secc">Sección</th>
                                        <th data-hide="pues">Puesto</th>
                                        <th data-class="fec_nac">Fecha Nacimiento</th>
                                        <th data-class="ed">Edad</th>
                                        <th data-class="nom">Apellidos y Nombres</th>
                                        <th data-class="tip">TIPO DOC</th>
                                        <th data-class="num">NUMERO DOCUMETO</th>
                                    </tr>
                                </thead>
                                <tbody id="Li_cump">
                                </tbody>
                            </table>
                            <div class="div_t">                                                                                     
                            </div>

                        </div>
                        <!-- end widget content -->

                    </div>
                    <!-- end widget div -->

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
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <script>
            $(document).ready(function () {
                TableTools.DEFAULTS.aButtons = ["copy", "xmls", "print"]
            });
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
        function listar_cumpleaños() {
            var a = $(".selec_mes").val();
            var b = $(".select_dia").val();
            var ap = $(".aps").val();
            var de = $(".dep").val();
            var ar = $(".are").val();
            var se = $(".sec").val();
            var pu = $(".pue").val();
            var fe = $(".fec").val();
            var eda = $(".edad").val();
            var apt = $(".pat").val();
            var ma = $(".mat").val();
            var no = $(".nom").val();
            var ti = $(".tip").val();
            var nu = $(".num").val();
            var d = $("#Li_cump");
            var texto = '';
            $.post("../../reporte", "opc=reporte_cumpleaños&mes=" + a + "&dia=" + b + "&aps=" + ap + "&departamento=" + de + "&area=" + ar + "&seccion=" + se + "&puesto=" + pu + "&fecha=" + fe + "&edad=" + eda + "&paterno=" + apt + "&materno=" + ma + "&nombre=" + "&tipo=" + ti + "&num=" + nu, function (objJson) {

                d.empty();
                var lista = objJson.lista;
                if (lista.length > 0) {
                    for (var i = 0; i < lista.length; i++) {
                        texto += '<tr role="row" class="odd">';
                        texto += '<td class>' + (i + 1) + '</td>';
                        texto += '<td>' + lista[i].aps + '</td>';
                        texto += '<td>' + lista[i].dep + '</td>';
                        texto += '<td>' + lista[i].are + '</td>';
                        texto += '<td>' + lista[i].secc + '</td>';
                        texto += '<td>' + lista[i].pue + '</td>';
                        texto += '<td>' + lista[i].fec_na + '</td>';
                        texto += '<td>' + lista[i].edad + '</td>';
                        texto += '<td>' + lista[i].nom + '</td>';
                        texto += '<td>' + lista[i].tip + '</td>';
                        texto += '<td>' + lista[i].dni + '</td>';
                        texto += '</tr>';
                        $('.div_t').empty();
                    }
                    d.append(texto);
                } else {
                    $('.div_t').empty();
                    d.append("<td colspan='11' align='center'><strong>NO SE ENCONTRARON DATOS...</strong></td>");
                }
            });
        }
        $(document).ready(function () {
            var b = $('#tbodys');
            $("#btnbuscar").click(
                    function () {
                        GifLoader($('.div_t'), " Por Favor Espere un Momento..", 1);
                        listar_cumpleaños();
                        if ($(".selec_mes").val() == "") {
                            //alert("Ingresa mes");
                        } else {
                            GifLoader($('.div_t'), " Por Favor Espere un Momento..", 1);
                            listar_cumpleaños();
                        }
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
            $(".selec_mes").change(function () {
                var mes = $(".selec_mes").val();
                var dia = $(".select_dia");
                dia.empty();
                var dias = 0;
                var texto = "<option value=''>[SELECCIONE]</option>";
                if (mes == "01") {
                    dias = 31;
                }
                if (mes == "02") {
                    dias = 28;
                }
                if (mes == "03") {
                    dias = 31;
                }
                if (mes == "04") {
                    dias = 30;
                }
                if (mes == "05") {
                    dias = 31;
                }
                if (mes == "06") {
                    dias = 30;
                }
                if (mes == "07") {
                    dias = 31;
                }
                if (mes == "08") {
                    dias = 31;
                }
                if (mes == "09") {
                    dias = 30;
                }
                if (mes == "10") {
                    dias = 31;
                }
                if (mes == "11") {
                    dias = 30;
                }
                if (mes == "12") {
                    dias = 31;
                }
                for (var i = 0; i < dias; i++) {
                    texto += "<option value='" + (i + 1) + "'>" + (i + 1) + "</option>";
                }
                dia.append(texto);
            });
        });
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
