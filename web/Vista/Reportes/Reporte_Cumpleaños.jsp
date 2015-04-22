
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/ico" href="http://www.sprymedia.co.uk/media/images/favicon.ico">
        <style type="text/css" title="currentStyle">
            @import "../../js/DataTables-1.10.4/media/css/demo_page.css";
            @import "../../js/DataTables-1.10.4/media/css/demo_table.css";
            @import "../../js/DataTables-1.10.4/media/css/jquery-ui.css";
            @import "../../js/DataTables-1.10.4/media/css/jquery-ui-1.7.2.custom.css";
        </style>
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <script src="../../js/DataTables-1.10.4/media/js/jquery-1.4.4.min.js" type="text/javascript"></script>
        <script src="../../js/DataTables-1.10.4/media/js/jquery.dataTables.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="../../js/DataTables-1.10.4/media/css/site.css?_=c3204084d1e8a5f5906d625e768e171a">
        <link rel="stylesheet" type="text/css" href="../../js/DataTables-1.10.4/extensions/TableTools/css/dataTables.tableTools.css">
        <script type="text/javascript" language="javascript" src="../../js/DataTables-1.10.4/extensions/TableTools/js/dataTables.tableTools.js"></script>
        <title>Reporte de Cumpleaños</title>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function () {
                //          alert();

            });
        </script>
    </head>
    <body> 
        <form class="form-inline validarform" id="frm_filtro2" method="post" action="../../Imprimir" name="formulario" onclick="return marcado();">
            <div class="spacing">
                <center><h1 class="spacing" style="font-weight: bold;">Cumpleaños Del Trabajador</h1></center> 
            </div>
            <center>
                <br>
                <div id="contenido">

                    <div   >
                        <!--style="padding-left: 30px"-->
                        <br>
                        <div class="form-group">
                            <label>Mes de Cumpleaños:</label><br>
                            <select name="puesto" class="form-control selec_mes" id="selec_mes" style="width: 250px" required=""> 
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
                                <option value="12">Dicienbre</option>
                                <option value="13">Todos</option>
                            </select>
                        </div>
                        <br>
                        <br>
                        <div class="row">
                            <label>Dia de Cumpleaños:</label><br>
                            <select name="puesto" class="form-control select_dia aaa" id="select_dia" style="width: 250px"> 
                                <option value="">[Seleccione]</option>
                            </select>

                        </div>
                        <br>
                        <div class="row">
                            <div class="form-group">                            
                                <button type="button" class="btn btn-primary" id="btnbuscar">Buscar</button>
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

                                <table  id="datatable_tabletools">
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

                            </div>
                            <!-- end widget content -->

                        </div>
                        <!-- end widget div -->

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
                var d = $("#Li_cump");
                var texto = '';
                $.post("../../reporte", "opc=reporte_cumpleaños&mes=" + a + "&dia=" + b, function (objJson) {
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
                        }
                        d.append(texto);
                    } else {
                        d.append("<td colspan='11' align='center'><strong>No hay datos</strong></td>");
                    }
                });
            }
            $(document).ready(function () {
                var b = $('#tbodys');
                $("#btnbuscar").click(
                        function () {
                            if ($(".selec_mes").val() == "") {
                                alert("Ingresa mes");
                            } else {
                                listar_cumpleaños();
                                TableTools.DEFAULTS.aButtons = ["copy", "xls", "print"];
                                $('#datatable_tabletools').dataTable({
                                    "dom": 'T<"clear">lfrtip',
                                    "tableTools": {
                                        "sSwfPath": "../../js/DataTables-1.10.4/media/js/copy_csv_xls.swf"
                                    }
                                });
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
    </script>

</html>
