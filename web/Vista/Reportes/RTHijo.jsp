<%-- 
    Document   : RTHijo
    Created on : 15/10/2015, 11:41:29 AM
    Author     : Andres
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de Hijos de Trabajadores</title>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
    </head>
    <style>
        .dt-toolbar{
            width: 50%;
        }
    </style>

    <body>
        <div class="row">
            <div class="page-header">
                <center><h1>Datos de Hijos</h1></center>
            </div>
        </div>
        <div class="well">
            <form class="smart-form" id="formdatos">
                <div class="row">
                    <section class="col col-xs-12">
                        <div class="col col-xs-3">
                            <label class="label">Nombre</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="Nombres" name="nombre">
                            </label>
                        </div>
                        <div class="col col-xs-2">
                            <label class="label">Apellido Paterno</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="Paterno" name="paterno">
                            </label>
                        </div>
                        <div class="col col-xs-2">
                            <label class="label">Apellido Materno</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="Materno" name="materno">
                            </label>
                        </div>
                        <div class="col col-xs-2">
                            <label class="label">DNI</label>
                            <label class="input">
                                <input class="form-control" type="text" placeholder="DNI" name="dni">
                            </label>
                        </div>
                        <div class="col col-xs-3">
                            <label class="label">Genero</label>
                            <label class="select">
                                <select name="genero">
                                    <option value="">[Seleccione]</option>
                                    <option value="F">Femenino</option>
                                    <option value="M">Masculino</option>
                                </select>
                                <i></i></label>
                        </div>
                    </section>
                </div>
                <hr>
                <div class="row">
                    <section class="col col-xs-12">
                        <div class="col col-xs-3">
                            <label class="label">Edad Especifica</label>
                            <label class="input">
                                <input class="form-control" type="number" placeholder="Edad" name="edad" min="0">
                                </label>
                        </div>
                        <div class="col col-xs-3">
                            <label class="label">Desde</label>
                            <label class="input">
                                <input class="form-control" type="date" placeholder="Desde" name="desde">
                            </label>
                        </div>
                        <div class="col col-xs-3">
                            <label class="label">Hasta</label>
                            <label class="input">
                                <input class="form-control" type="date" placeholder="Hasta" name="hasta">
                            </label>
                        </div>
                    </section>                    
                </div>
                <div style="float: right">
                    <a class="btn btn-primary btn-circle btn-lg btnBuscar"><i class="fa fa-search"></i></a>
                    <a class="btn btn-danger btn-circle btn-lg" onclick="javascript:document.getElementById('formdatos').reset();"><i class="fa fa-times"></i></a>
                </div>
            </form>
        </div>
        <br>

        <div class="row" style="width: 200%">
            <section class="col col-xs-12">
                <div class="col col-xs-12">
                    <div class="well cont_t">
                        <h3>Reporte</h3>
                        <table id="tabladato" class="table table-striped table-responsive table-bordered">
                            <thead>
                                <tr>
                                    <td>#</td>
                                    <td>Apellidos y Nombres(Trabajador)</td>
                                    <td>DNI</td>
                                    <td>Departamento</td>
                                    <td>Area</td>
                                    <td>Seccion</td>
                                    <td>Puesto</td>
                                    <td>APS</td>
                                    <td>Condicion</td>
                                    <td>Tipo de Contrato</td>
                                    <td>Apellidos y Nombres(Hijo)</td>
                                    <td>Sexo</td>
                                    <td>Nacimiento</td>
                                    <td>Edad</td>
                                    <td>Tipo documento</td>
                                    <td>Nro Documento</td>
                                    <td>Apellidos y Nombres(Conyuge)</td>
                                    <td>DNI</td>
                                    <td>Trabaja UPeU</td>
                                </tr>
                            </thead>
                            <tbody class="tbdHijos">

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </div>
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
        <script >
                        $(document).ready(function () {

                            pageSetUp();
                            setTable();

                            //BUSCAR
                            $('.btnBuscar').click(function () {
                                buscar();
                            });

                            function buscar() {
                                var data = $('#formdatos').serialize();
                                $.post("../../CReporte_Hijo?opc=reporte_hijos", data, function (objJson) {
                                    var lista = objJson.lista;
                                    if (lista.length > 0) {
                                        var t = "";
                                        for (var i = 0; i < lista.length; i++) {
                                            if(lista[i].AP_PATERNO===undefined){
                                                lista[i].AP_PATERNO='Sin Datos';
                                            }
                                            if(lista[i].AP_MATERNO===undefined){
                                                lista[i].AP_MATERNO='Sin Datos';
                                            }
                                            if(lista[i].NO_TRABAJADOR===undefined){
                                                lista[i].NO_TRABAJADOR='Sin Datos';
                                            }
                                            if(lista[i].NU_DOC===undefined){
                                                lista[i].NU_DOC='Sin Datos';
                                            }
                                            if(lista[i].NO_DEP===undefined){
                                                lista[i].NO_DEP='Sin Datos';
                                            }
                                            if(lista[i].NO_AREA===undefined){
                                                lista[i].NO_AREA='Sin Datos';
                                            }
                                            if(lista[i].NO_SECCION===undefined){
                                                lista[i].NO_SECCION='Sin Datos';
                                            }
                                            if(lista[i].NO_PUESTO===undefined){
                                                lista[i].NO_PUESTO='Sin Datos';
                                            }
                                            if(lista[i].CO_APS===undefined){
                                                lista[i].CO_APS='Sin Datos';
                                            }
                                            if(lista[i].TI_CONTRATO===undefined){
                                                lista[i].TI_CONTRATO='Sin Datos';
                                            }else{
                                                lista[i].TI_CONTRATO=parseInt(lista[i].TI_CONTRATO)+1-1;
                                                switch(lista[i].TI_CONTRATO){
                                                    case 1:
                                                        lista[i].TI_CONTRATO='Necesidad de Mercado';
                                                        break;
                                                    case 2:
                                                        lista[i].TI_CONTRATO='Incremento de Actividad';
                                                        break;
                                                    case 3:
                                                        lista[i].TI_CONTRATO='Servicio Especifico';
                                                        break;
                                                    case 4:
                                                        lista[i].TI_CONTRATO='Inicio de Actividad';
                                                        break;
                                                    case 5:
                                                        lista[i].TI_CONTRATO='Tiempo Parcial';
                                                        break;
                                                    case 6:
                                                        lista[i].TI_CONTRATO='Indeterminado';
                                                        break;
                                                    case 7:
                                                        lista[i].TI_CONTRATO='Extranjero';
                                                        break;
                                                    case 8:
                                                        lista[i].TI_CONTRATO='Suplencia';
                                                        break;
                                                    case 9:
                                                        lista[i].TI_CONTRATO='Contrato Civil';
                                                        break;
                                                    case 10:
                                                        lista[i].TI_CONTRATO='De Temporada';
                                                        break;
                                                    case 11:
                                                        lista[i].TI_CONTRATO='Locacion de Servicios';
                                                        break;
                                                    case 12:
                                                        lista[i].TI_CONTRATO='No Domiciliados';
                                                        break;
                                                }
                                            }
                                            if(lista[i].AP_PATERNO_HIJO===undefined){
                                                lista[i].AP_PATERNO_HIJO='Sin Datos';
                                            }
                                            if(lista[i].AP_MATERNO_HIJO===undefined){
                                                lista[i].AP_MATERNO_HIJO='Sin Datos';
                                            }
                                            if(lista[i].NO_HIJO_TRABAJADOR===undefined){
                                                lista[i].NO_HIJO_TRABAJADOR='Sin Datos';
                                            }
                                            if(lista[i].ES_SEXO===undefined){
                                                lista[i].ES_SEXO='Sin Datos';
                                            }
                                            if(lista[i].FE_NACIMIENTO===undefined){
                                                lista[i].FE_NACIMIENTO='Sin Datos';
                                            }
                                            if(lista[i].EDAD_HIJO===undefined){
                                                lista[i].EDAD_HIJO='Sin Datos';
                                            }
                                            if(lista[i].ES_TIPO_DOC===undefined){
                                                lista[i].ES_TIPO_DOC='Sin Datos';
                                            }else{
                                                if(lista[i].ES_TIPO_DOC==='1'){
                                                    lista[i].ES_TIPO_DOC="DNI";
                                                }
                                                if(lista[i].ES_TIPO_DOC==='2'){
                                                    lista[i].ES_TIPO_DOC="BOLETA DE INSCRIPCION MILITAR";
                                                }
                                                if(lista[i].ES_TIPO_DOC==='3'){
                                                    lista[i].ES_TIPO_DOC="CARNÉ DE EXTRANJERÍA";
                                                }
                                                if(lista[i].ES_TIPO_DOC==='4'){
                                                    lista[i].ES_TIPO_DOC="PASAPORTE";
                                                }
                                                if(lista[i].ES_TIPO_DOC==='5'){
                                                    lista[i].ES_TIPO_DOC="PARTIDA DE NACIMIENTO";
                                                }
                                                if(lista[i].ES_TIPO_DOC==='6'){
                                                    lista[i].ES_TIPO_DOC="LIBRETA ELECTORAL";
                                                }
                                                if(lista[i].ES_TIPO_DOC==='7'){
                                                    lista[i].ES_TIPO_DOC="LIBRETA MILITAR";
                                                }
                                                if(lista[i].ES_TIPO_DOC==='8'){
                                                    lista[i].ES_TIPO_DOC="PERMISO PARA MENORES";
                                                }
                                            }
                                            if(lista[i].ES_TRABAJA_UPEU_C===undefined){
                                                lista[i].ES_TRABAJA_UPEU_C='Sin Datos';
                                            }else{
                                                if(lista[i].ES_TRABAJA_UPEU_C==='1'){
                                                    lista[i].ES_TRABAJA_UPEU_C='Si';
                                                }else{
                                                    lista[i].ES_TRABAJA_UPEU_C='No';
                                                }
                                            }
                                            if(lista[i].NU_DOC_HIJO===undefined){
                                                lista[i].NU_DOC_HIJO='Sin Datos';
                                            }
                                            if(lista[i].AP_NOMBRES_C===undefined){
                                                lista[i].AP_NOMBRES_C='Sin Datos';
                                            }
                                            if(lista[i].NU_DOC_C===undefined){
                                                lista[i].NU_DOC_C='Sin Datos';
                                            }
                                            if(lista[i].ID_CONTRATO===undefined){
                                                lista[i].NU_DOC_C='Sin Datos';
                                            }
                                        
                                            t += "<tr>";
                                            t += "<td>" + (i + 1) + "</td>";
                                            t += "<td>" + lista[i].AP_PATERNO + " " + lista[i].AP_MATERNO + " " + lista[i].NO_TRABAJADOR + "</td>";
                                            t += "<td>" + lista[i].NU_DOC + "</td>";
                                            t += "<td>" + lista[i].NO_DEP + "</td>";
                                            t += "<td>" + lista[i].NO_AREA + "</td>";
                                            t += "<td>" + lista[i].NO_SECCION + "</td>";
                                            t += "<td>" + lista[i].NO_PUESTO + "</td>";
                                            t += "<td>" + lista[i].CO_APS + "</td>";
                                            if(lista[i].ID_CONTRATO===undefined){
                                                t += "<td>Sin Contrato</td>";
                                                t += "<td>Sin Contrato</td>";
                                            }else{
                                                t += "<td>Contratado</td>";
                                                t += "<td>" + lista[i].TI_CONTRATO + "</td>";
                                            }
                                            
                                            
                                            t += "<td>" + lista[i].AP_PATERNO_HIJO + " " + lista[i].AP_MATERNO_HIJO + " " + lista[i].NO_HIJO_TRABAJADOR + "</td>";
                                            t += "<td>" + lista[i].ES_SEXO + "</td>";
                                            t += "<td>" + lista[i].FE_NACIMIENTO_HIJO + "</td>";
                                            t += "<td>" + lista[i].EDAD_HIJO + "</td>";
                                            t += "<td>" + lista[i].ES_TIPO_DOC + "</td>";
                                            t += "<td>" + lista[i].NU_DOC_HIJO + "</td>";
                                            t += "<td>" + lista[i].AP_NOMBRES_C + "</td>";
                                            t += "<td>" + lista[i].NU_DOC_C + "</td>";
                                            t += "<td>" + lista[i].ES_TRABAJA_UPEU_C + "</td>";
                                            t += "</tr>";
                                        }
                                        crear_tabla();
                                        $('.tbdHijos').append(t);
                                        setTable();

                                    } else {
                                        $.smallBox({
                                            title: "No hay Resultados para su busqueda",
                                            content: "<i class='fa fa-clock-o'></i> <i>Vuelva a Intentarlo</i>",
                                            color: "#f0ad4e",
                                            iconSmall: "fa fa-thumbs-up bounce animated",
                                            timeout: 4000
                                        });
                                        crear_tabla();
                                        setTable();
                                    }
                                });
                            }
                            function crear_tabla() {
                                var t = "";
                                t += '<h3>Reporte</h3><table id="tabladato" class="table table-striped table-responsive table-bordered">';
                                t += ' <thead><tr><td>#</td><td>Apellidos y Nombres(Trabajador)</td><td>DNI</td><td>Departamento</td>';
                                t += '<td>Area</td><td>Seccion</td><td>Puesto</td><td>APS</td><td>Condicion</td>';
                                t += '<td>Tipo de Contrato</td><td>Apellidos y Nombres(Hijo)</td><td>Sexo</td>';
                                t += '<td>Nacimiento</td><td>Edad</td><td>Tipo documento</td><td>Nro Documento</td><td>Apellidos y Nombres(Conyuge)</td>';
                                t += '<td>DNI</td><td>Trabaja UPeU</td></tr></thead><tbody class="tbdHijos"></tbody></table>';
                                $('.cont_t').empty();
                                $('.cont_t').append(t);
                            }


                            function setTable() {
                                var responsiveHelper_datatable_tabletools = undefined;

                                var breakpointDefinition = {
                                    tablet: 1024,
                                    phone: 480
                                };

                                $('#tabladato').dataTable({
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
                                    "autoWidth": false,
                                    "preDrawCallback": function () {
                                        // Initialize the responsive datatables helper once.
                                        if (!responsiveHelper_datatable_tabletools) {
                                            responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper($('#tabladato'), breakpointDefinition);
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
                        });
        </script>

    </body>
</html>
