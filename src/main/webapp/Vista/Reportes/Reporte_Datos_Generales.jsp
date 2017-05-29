<%-- 
    Document   : Reporte_Datos_Generales
    Created on : 05-feb-2015, 9:11:47
    Author     : joserodrigo
--%>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Reportes Generales </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

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
        <style>
            .caja{
                background:transparent url(../../img/Gifloader.GIF) center no-repeat;
            }
        </style>
    </head>
    <body style="padding:1%;box-sizing: border-box;">
        <div class="spacing">
            <center><h1 class="spacing" style="font-weight: bold;">REPORTES GENERALES</h1></center> 
        </div>
        <form class="form-inline validarform" id="frm_filtro2" method="post" action="../../Imprimir" name="formulario" onclick="return marcado();">
            <center>                
                <div class="cont" style="width:100%;padding: 1%;box-sizing: border-box;">
                    <div class="col-md-12">
                        <div class="panel panel-info">
                            <div class="panel-body" style="background:#eeeeee  ;">
                                <div class="col-md-4">
                                    <div class="col-md-12">
                                        <div class="form-group col-md-6">
                                            <label>NOMBRES</label><br>
                                            <input type="text"  class="form-control nom" placeholder="Ingrese APELLIDOS Y NOMBRES" length="45" style="width: 100%;" id="des"/>
                                        </div>   
                                        <div class="form-group col-md-6">
                                            <label>APELLIDO PATERNO</label><br>
                                            <input type="text"  class="form-control pat" placeholder="Ingrese el apellido paterno" length="45" style="width: 100%;" id="des"/>
                                        </div>
                                        <div class="form-group col-md-6" style="width: 50%;">
                                            <label>APELLIDO MATERNO</label><br>
                                            <input type="text"  class="form-control mat" placeholder="Ingrese el apellido materno" length="45" style="width: 100%;" id="des"/>
                                        </div>                                                    
                                        <div class="col-md-6">
                                            <label>NACIONALIDAD</label><br>
                                            <select class="form-control" style="width:100%;margin-top: 1%;">
                                                <option selected disabled>Elegir Pais</option>
                                                <option>Peru</option>
                                                <option>Chile</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>ESTADO CIVIL</label><br>
                                            <select class="form-control" style="width:100%;margin-top: 1%;">
                                                <option selected disabled>Elegir Estado Civil</option>
                                                <option>Casado</option>
                                                <option>Es complicado</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>RELIGIÓN</label><br>
                                            <select class="form-control" style="width:100%;margin-top: 1%;">
                                                <option selected disabled>Elegir Religión</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>SEXO</label><br>
                                            <label class="radio">
                                                <input type="radio" name="radio">
                                                Masculino   <i class="fa fa-male"></i></label>
                                            <label class="radio">
                                                <input type="radio" name="radio">
                                                Femenino    <i class="fa fa-female"></i></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-6">
                                        <label>SISTEMA PENSIONARIO</label><br>
                                        <select class="form-control" style="width:100%;margin-top: 1%;">
                                            <option selected disabled>Elegir Sistema Pensionario</option>
                                            <option value="1">AFP</option>
                                            <option value="2">ONP</option>
                                            <option value="3" >Sin Régimen Provisional(jubilado, cesante).</option>
                                            <option value="4" selected="">Fuera de Planilla</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label>SITUACIÓN EDUCATIVA</label><br>
                                        <select class="form-control selSE" style="width:100%;margin-top: 1%;">
                                            <option selected disabled>Elegir situación educativa</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label>AÑO DE EGRESO</label><br>
                                        <input type="date" class="form-control">
                                    </div>
                                    <div class="col-md-6">
                                        <label>CONDICIÓN</label><br>
                                        <select class="form-control" style="width:100%;margin-top: 1%;">
                                            <option selected disabled>Elegir Condición</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label>CARRERA</label><br>
                                        <select class="form-control" style="width:100%;margin-top: 1%;">
                                            <option selected disabled>Elegir Carrera</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label>ESTADO</label><br>
                                        <select class="form-control" style="width:100%;margin-top: 1%;">
                                            <option selected disabled>Elegir Estado</option>
                                            <option>Activo</option>
                                            <option>Inactivo</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label>TIPO DE REQUERIMIENTO</label><br>
                                        <select class="form-control" style="width:100%;margin-top: 1%;">
                                            <option selected disabled>Elegir Estado</option>
                                            <option>Activo</option>
                                            <option>Inactivo</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="cselectores">
                                        <div class="col-md-6">
                                            <label>DIRECCIÓN</label><br>
                                            <select onchange="listdepartamento(this.value)" class="form-control selDir" style="width:100%;margin-top: 1%;">
                                                <option value="" selected disabled>Elegir Dirección</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>DEPARTAMENTO</label><br>
                                            <select onchange="listarea(this.value)"  class="form-control selDep" style="width:100%;margin-top: 1%;">
                                                <option value="" selected disabled>Elegir Departamento</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>ÁREA</label><br>
                                            <select onchange="listseccion(this.value)" class="form-control selArea" style="width:100%;margin-top: 1%;">
                                                <option value="" selected disabled>Elegir Area</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>SECCIÓN</label><br>
                                            <select onclick="listpuesto(this.value)" class="form-control selSeccion" style="width:100%;margin-top: 1%;">
                                                <option value="" selected disabled>Elegir Sección</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>PUESTO</label><br>
                                            <select class="form-control selPuesto" style="width:100%;margin-top: 1%;">
                                                <option value="" selected disabled>Elegir Puesto</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="padding:1%;box-sizing: border-box;">
                    <div class="form-group">  
                        <a onclick="searchTb()" id="btnbuscar" class="btn btn-primary btn-circle btn-lg btnEnviar">
                            <i class="glyphicon glyphicon-search"></i>
                        </a>
                        <a id="btncancel" class="btn btn-danger btn-circle btn-lg btnCancelar">
                            <i class="glyphicon glyphicon-remove"></i>
                        </a>
                    </div>
                </div>
            </center>            
        </form>
    <center>
        <div class="hidden conLoad">
            <img src="../../img/loader.gif" alt=""/>
        </div>
        <div class="conMTable">
            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3" data-widget-editbutton="false">
                <header>
                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                    <h2>Datos Generales</h2>
                </header>
                <div>
                    <div class="jarviswidget-editbox">
                    </div>
                    <div class="widget-body no-padding conTable">
                        <!--<table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%">
                        </table>-->
                    </div>
                </div>
            </div>
        </div>
    </center>
    <!--<script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <!--<script>
            /*if (!window.jQuery) {
                document.write('<script src="../../js/libs/jquery-2.0.2.min.js"><\/script>');
            }*/
    </script>

    <!--<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>-->
    <!--<script>
            /*if (!window.jQuery.ui) {
                document.write('<script src="../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
            }*/
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
    <script src="../../js/plugin/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
    <script>
                            var responsiveHelper_datatable_tabletools = undefined;
                            $(document).ready(function () {
                                listseducativa();
                                listdireccion();
                            });
                            function listdireccion() {
                                var url = '../../reporte?opc=list_da';
                                var data = 'ps=dir';
                                $.post(url, data, function (objJson) {
                                    var lista = objJson.dir;
                                    if (lista.length > 0) {
                                        var m = '';
                                        m += '<option value="" selected disabled>Elegir Dirección</option>';
                                        for (var i = 0; i < lista.length; i++) {
                                            m += '<option value="' + lista[i].id + '">' + lista[i].nombre + '</option>';
                                        }
                                        $(".selDir").empty();
                                        $(".selDir").append(m);
                                    }
                                });
                            }
                            function listdepartamento(dir) {
                                var url = '../../reporte?opc=list_da';
                                var data = 'ps=dep&iddir=' + dir;
                                $.post(url, data, function (objJson) {
                                    var lista = objJson.dep;
                                    if (lista.length > 0) {
                                        var m = '';
                                        m += '<option value="" selected disabled>Elegir Departamento</option>';
                                        for (var i = 0; i < lista.length; i++) {
                                            m += '<option value="' + lista[i].id + '">' + lista[i].nombre + '</option>';
                                        }
                                        $(".selDep").empty();
                                        $(".selDep").append(m);
                                    }
                                });
                            }
                            function listarea(dep) {
                                var url = '../../reporte?opc=list_da';
                                var data = 'ps=area&iddep=' + dep;
                                $.post(url, data, function (objJson) {
                                    var lista = objJson.area;
                                    if (lista.length > 0) {
                                        var m = '';
                                        m += '<option value="" selected disabled>Elegir Área</option>';
                                        for (var i = 0; i < lista.length; i++) {
                                            m += '<option value="' + lista[i].id + '">' + lista[i].nom + '</option>';
                                        }
                                        $(".selArea").empty();
                                        $(".selArea").append(m);
                                    }
                                });
                            }
                            function listseccion(area) {
                                var url = '../../reporte?opc=list_da';
                                var data = 'ps=seccion&idarea=' + area;
                                $.post(url, data, function (objJson) {
                                    var lista = objJson.seccion;
                                    if (lista.length > 0) {
                                        var m = '';
                                        m += '<option value="" selected disabled>Elegir Seccion</option>';
                                        for (var i = 0; i < lista.length; i++) {
                                            m += '<option value="' + lista[i].id + '">' + lista[i].nombre + '</option>';
                                        }
                                        $(".selSeccion").empty();
                                        $(".selSeccion").append(m);
                                    }
                                });
                            }
                            function listpuesto(seccion) {
                                var url = '../../reporte?opc=list_da';
                                var data = 'ps=puesto&idseccion=' + seccion;
                                $.post(url, data, function (objJson) {
                                    var lista = objJson.puesto;
                                    if (lista.length > 0) {
                                        var m = '';
                                        m += '<option value="" selected disabled>Elegir Puesto</option>';
                                        for (var i = 0; i < lista.length; i++) {
                                            m += '<option value="' + lista[i].id + '">' + lista[i].nombre + '</option>';
                                        }
                                        $(".selPuesto").empty();
                                        $(".selPuesto").append(m);
                                    }
                                });
                            }
                            function listseducativa() {
                                var url = '../../reporte?opc=list_da';
                                var data = 'ps=seducativa';
                                $.post(url, data, function (objJson) {
                                    var lista = objJson.seducativa;
                                    if (lista.length > 0) {
                                        var m = '';
                                        m += '<option value="" selected disabled>Elegir situación educativa</option>';
                                        for (var i = 0; i < lista.length; i++) {
                                            m += '<option value="' + lista[i].id_situacion + '">' + lista[i].no_s_educativa + '</option>';
                                        }
                                        $(".selSE").empty();
                                        $(".selSE").append(m);
                                    }
                                });
                            }
                            function searchTb() {
                                //$(".conLoad").attr("class", "conLoad");
                                var url = '../../reporte?opc=searchtb';
                                var data = 'direccion=' + $(".selDir").val();
                                data += '&departamento=' + $(".selDep").val();
                                data += '&area=' + $(".selArea").val();
                                data += '&seccion=' + $(".selSeccion").val();
                                data += '&puesto=' + $(".selPuesto").val();
                                $.post(url, data, function (objJson) {
                                    var lista = objJson.respuesta;
                                    if (lista.length) {
                                        var m = '';
                                        for (var i = 0; i < lista.length; i++) {
                                            m += '<tr>';
                                            m += '<td>' + i +1+ '</td>';
                                            m += '<td>' + lista[i].aps + '</td>';
                                            m += '<td>' + lista[i].dir + '</td>';
                                            m += '<td>' + lista[i].dep + '</td>';
                                            m += '<td>' + lista[i].area + '</td>';
                                            m += '<td>' + lista[i].secc + '</td>';
                                            m += '<td>' + lista[i].puesto + '</td>';
                                            m += '<td>' + lista[i].tipo + '</td>';
                                            m += '<td>' + lista[i].num + '</td>';
                                            m += '<td>' + lista[i].appa + '</td>';
                                            m += '<td>' + lista[i].apma + '</td>';
                                            m += '<td>' + lista[i].nombre + '</td>';
                                            m += '<td>' + lista[i].apell + '</td>';
                                            m += '<td>' + lista[i].desde + '</td>';
                                            m += '<td>' + lista[i].hasta + '</td>';
                                            m += '<td>' + lista[i].mes + '</td>';
                                            m += '<td>' + lista[i].sexo + '</td>';
                                            m += '<td>' + lista[i].fe_nac + '</td>';
                                            m += '<td>' + lista[i].naci + '</td>';
                                            m += '<td>' + lista[i].es_civil + '</td>';
                                            m += '<td>' + lista[i].gp_san + '</td>';
                                            m += '<td>' + lista[i].sis_pen + '</td>';
                                            m += '<td>' + lista[i].afp + '</td>';
                                            m += '<td>' + lista[i].sit_edu + '</td>';
                                            m += '<td>' + lista[i].ins_per + '</td>';
                                            m += '<td>' + lista[i].reg + '</td>';
                                            m += '<td>' + lista[i].tip_ins + '</td>';
                                            m += '<td>' + lista[i].co_ins + '</td>';
                                            m += '<td>' + lista[i].carr + '</td>';
                                            m += '<td>' + lista[i].a_egr + '</td>';
                                            m += '<td>' + lista[i].hora_p + '</td>';
                                            m += '<td>' + lista[i].domi + '</td>';
                                            m += '<td>' + lista[i].depar + '</td>';
                                            m += '<td>' + lista[i].prov + '</td>';
                                            m += '<td>' + lista[i].dis + '</td>';
                                            m += '<td>' + lista[i].rel + '</td>';
                                            m += '<td>' + lista[i].igl + '</td>';
                                            m += '<td>' + lista[i].carg + '</td>';
                                            m += '<td>' + lista[i].aut + '</td>';
                                            m += '<td>' + lista[i].condicion + '</td>';
                                            m += '<td>' + lista[i].dep + '</td>';
                                            m += '<td>' + lista[i].dep + '</td>';
                                            m += '<td>' + lista[i].dep + '</td>';
                                            m += '</tr>';
                                        }
                                        var tabla = createTable();
                                        $(".conTable").empty();
                                        $(".conTable").append(tabla);
                                        $('#dataCon').empty();
                                        $('#dataCon').append(m);
                                        $('#datatable_tabletools').dataTable({
                                            "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'T>r>" +
                                                    "t" +
                                                    "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
                                            "oLanguage": {
                                                "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
                                            },
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
                                    } else {
                                        alert("No hay datos");
                                    }
                                });
                            }
                            function createTable() { //funcion para crear tabla que tendra los datos generales
                                var t = '<table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%">';
                                t += '<thead>';
                                t += '<tr>';
                                t += '<th data-hide="phone">N°</th>';
                                t += '<th data-class="APS">Codigo APS</th>';
                                t += '<th data-hide="DEP">Direccion</th>';
                                t += '<th data-hide="DEP">Departamento</th>';
                                t += '<th data-hide="ARE">Area</th>';
                                t += '<th data-hide="secc">SecciÃ³n</th>';
                                t += '<th data-hide="pues">Puesto</th>';
                                t += '<th data-class="fec_nac">Tipo Documento</th>';
                                t += '<th data-class="ed">Numero Documento</th>';
                                t += '<th data-class="nom">Apellido Paterno</th>';
                                t += '<th data-class="nom">Apellido Materno</th>';
                                t += '<th data-class="tip">Nombre(s)</th>';
                                t += '<th data-class="tip">Apellidos y Nombre(s)</th>';
                                t += '<th data-class="tip">Fecha de Inicio</th>';
                                t += '<th data-class="tip">Fecha de Cese</th>';
                                t += '<th data-class="tip">Mes de Requerieminto</th>';
                                t += '<th data-class="tip">Sexo</th>';
                                t += '<th data-class="tip">Fecha de Nacimiento</th>';
                                t += '<th data-class="tip">Nacionalidad</th>';
                                t += '<th data-class="tip">Estado Civil</th>';
                                t += '<th data-class="tip">Grupo Sanguineo</th>';
                                t += '<th data-class="tip">Sistema Pensionario</th>';
                                t += '<th data-class="tip">AFP</th>';
                                t += '<th data-class="tip">Situación Educativa</th>';
                                t += '<th data-class="tip">Estudio en Instituto</th>';
                                t += '<th data-class="tip">Regimen</th>';
                                t += '<th data-class="tip">Tipo de Institución</th>';
                                t += '<th data-hide="pues">Institución</th>';
                                t += '<th data-class="fec_nac">Carrera</th>';
                                t += '<th data-class="ed">Año de Egreso</th>';
                                t += '<th data-class="nom">Tipo de Hora Pago</th>';
                                t += '<th data-class="nom">Domicilio Actual</th>';
                                t += '<th data-class="tip">Departamento</th>';
                                t += '<th data-class="tip">Provincia</th>';
                                t += '<th data-class="tip">Distrito</th>';
                                t += '<th data-class="tip">Religión</th>';
                                t += '<th data-class="tip">Iglesia</th>';
                                t += '<th data-class="tip">Cargo</th>';
                                t += '<th data-class="tip">Autoridad</th>';
                                t += '<th data-class="tip">Condición Laboral</th>';
                                t += '<th data-class="tip">Remuneración Básica</th>';
                                t += '<th data-class="tip">Bono de Alimentos</th>';
                                t += '<th data-class="tip">Bonificación por puesto</th>';
                                t += '<th data-class="tip">BEV</th>';
                                t += '<th data-class="tip">Sueldo Total</th>';
                                t += '<th data-class="tip">Banco</th>';
                                t += '<th data-class="tip">N° de Cuenta Saldo</th>';
                                t += '<th data-class="tip">CCI</th>';
                                t += '<th data-class="tip">Centro de Costos</th>';
                                t += '<th data-class="tip">Situación Educativa</th>';
                                t += '<th data-class="tip">Cod. Régimen</th>';
                                t += '<th data-class="tip">Desc. Régimen</th>';
                                t += '<th data-class="tip">Cod. Institución</th>';
                                t += '<th data-class="ed">Cod. Carrera</th>';
                                t += '<th data-class="nom">Desc. Carrera</th>';
                                t += '</tr>';
                                t += '</thead>';
                                t += '<tbody id="dataCon"></tbody>';
                                t += '</table>';
                                return t;
                            }
    </script>

    <script>

        // DO NOT REMOVE : GLOBAL FUNCTIONS!



        //$(document).ready(function () {
        /*pageSetUp();
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
         "oLanguage": {
         "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
         },
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
         var otable = $('#datatable_fixed_column').DataTable({
         "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6 hidden-xs'f><'col-sm-6 col-xs-12 hidden-xs'<'toolbar'>>r>" +
         "t" +
         "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
         "autoWidth": true,
         "oLanguage": {
         "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
         },
         "preDrawCallback": function () {
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
         $("div.toolbar").html('<div class="text-right"><img src="../../img/logo.png" alt="SmartAdmin" style="width: 111px; margin-top: 3px; margin-right: 10px;"></div>');
         $("#datatable_fixed_column thead th input[type=text]").on('keyup change', function () {
         
         otable
         .column($(this).parent().index() + ':visible')
         .search(this.value)
         .draw();
         
         });
         $('#datatable_col_reorder').dataTable({
         "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'C>r>" +
         "t" +
         "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
         "autoWidth": true,
         "oLanguage": {
         "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
         },
         "preDrawCallback": function () {
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
         $('#datatable_tabletools').dataTable({
         "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'T>r>" +
         "t" +
         "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
         "oLanguage": {
         "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
         },
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
         });*/
        /*alert("as");
         listseducativa();
         listdireccion();
         });*/

        /*var _gaq = _gaq || [];
         _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
         _gaq.push(['_trackPageview']);
         
         (function () {
         var ga = document.createElement('script');
         ga.type = 'text/javascript';
         ga.async = true;
         ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
         var s = document.getElementsByTagName('script')[0];
         s.parentNode.insertBefore(ga, s);
         })();*/



        /*function listar_trabajor_na() {
         var ap = $(".aps").val();
         var de = $(".dep").val();
         var ar = $(".are").val();
         var se = $(".sec").val();
         var pu = $(".pue").val();
         //var ti = $(".tip").val();
         var fe = $(".fec").val();
         var apt = $(".pat").val();
         var ma = $(".mat").val();
         var no = $(".nom").val();
         var nu = $(".num").val();
         var b = $("#Datos_generales");
         var texto = '';
         $.post("../../reporte", "opc=reporte_datos_genereales&aps=" + ap + "&departamento=" + de + "&area=" + ar + "&seccion=" + se + "&puesto=" + pu + "&fecha=" + fe + "&paterno=" + apt + "&materno=" + ma + "&nombre=" + no + "&num=" + nu, function (objJson) {
         if (objJson.rpta == -1) {
         $('.div_t').empty();
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
         texto += '<td>' + lista[i].sec + '</td>';
         texto += '<td>' + lista[i].pue + '</td>';
         texto += '<td>' + lista[i].doc + '</td>';
         texto += '<td>' + lista[i].n_doc + '</td>';
         texto += '<td>' + lista[i].ape + '</td>';
         texto += '<td>' + lista[i].mat + '</td>';
         texto += '<td>' + lista[i].nom + '</td>';
         texto += '<td>' + lista[i].ape + " " + lista[i].mat + " " + lista[i].nom + '</td>';
         texto += '<td>' + lista[i].has + '</td>';
         texto += '<td>' + lista[i].dni_hi + '</td>';
         texto += '<td>' + lista[i].nom_hi + '</td>';
         texto += '<td>' + lista[i].gen_hi + '</td>';
         texto += '<td>' + lista[i].nac_hi + '</td>';
         texto += '<td>' + lista[i].eda_hi + '</td>';
         texto += '</tr>';
         $('.div_t').empty();
         }
         b.append(texto);
         } else {
         $('.div_t').empty();
         b.append("<td colspan='11' align='center'><strong>NO SE ENCONTRARON DATOS</strong></td>");
         }
         });
         
         }*/
        /*$(document).ready(function () {
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
         );*/
        /*function GifLoader(contenedor, msg, action) {
         $('.headerr').hide();
         var text = "";
         contenedor.empty();
         if (action == 1) {
         text += "<div class='caja' style='height:250px; width:150px; margin:auto;'><center><h3>" + msg + "</h3></center></div>";
         } else if (action == 2) {
         text += "<div style='height:150px; width:150px; margin:auto; padding-top:30px;'><center><h3>" + msg + "</h3></center></div>";
         }
         contenedor.append(text);
         }*//*
          function createTable() {
          var t = '<table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%">';
          t += '<thead>';
          t += '<tr>';
          t += '<th data-hide="phone">N°</th>';
          t += '<th data-class="APS">Codigo APS</th>';
          t += '<th data-hide="DEP">Departamento</th>';
          t += '<th data-hide="ARE">Area</th>';
          t += '<th data-hide="secc">SecciÃ³n</th>';
          t += '<th data-hide="pues">Puesto</th>';
          t += '<th data-class="fec_nac">Tipo Documento</th>';
          t += '<th data-class="ed">Numero Documento</th>';
          t += '<th data-class="nom">Apellido Paterno</th>';
          t += '<th data-class="nom">Apellido Materno</th>';
          t += '<th data-class="tip">Nombre(s)</th>';
          t += '<th data-class="tip">Apellidos y Nombre(s)</th>';
          t += '<th data-class="tip">Fecha de Inicio</th>';
          t += '<th data-class="tip">Fecha de Cese</th>';
          t += '<th data-class="tip">Mes de Requerieminto</th>';
          t += '<th data-class="tip">Sexo</th>';
          t += '<th data-class="tip">Fecha de Nacimiento</th>';
          t += '<th data-class="tip">Nacionalidad</th>';
          t += '<th data-class="tip">Estado Civil</th>';
          t += '<th data-class="tip">Grupo Sanguineo</th>';
          t += '<th data-class="tip">Sistema Pensionario</th>';
          t += '<th data-class="tip">AFP</th>';
          t += '<th data-class="tip">Situación Educativa</th>';
          t += '<th data-class="tip">Estudio en Instituto</th>';
          t += '<th data-class="tip">Regimen</th>';
          t += '<th data-class="tip">Tipo de Institución</th>';
          t += '<th data-hide="pues">Institución</th>';
          t += '<th data-class="fec_nac">Carrera</th>';
          t += '<th data-class="ed">Año de Egreso</th>';
          t += '<th data-class="nom">Tipo de Hora Pago</th>';
          t += '<th data-class="nom">Domicilio Actual</th>';
          t += '<th data-class="tip">Departamento</th>';
          t += '<th data-class="tip">Provincia</th>';
          t += '<th data-class="tip">Distrito</th>';
          t += '<th data-class="tip">Religión</th>';
          t += '<th data-class="tip">Iglesia</th>';
          t += '<th data-class="tip">Cargo</th>';
          t += '<th data-class="tip">Autoridad</th>';
          t += '<th data-class="tip">Condición Laboral</th>';
          t += '<th data-class="tip">Remuneración Básica</th>';
          t += '<th data-class="tip">Bono de Alimentos</th>';
          t += '<th data-class="tip">Bonificación por puesto</th>';
          t += '<th data-class="tip">BEV</th>';
          t += '<th data-class="tip">Sueldo Total</th>';
          t += '<th data-class="tip">Banco</th>';
          t += '<th data-class="tip">N° de Cuenta Saldo</th>';
          t += '<th data-class="tip">CCI</th>';
          t += '<th data-class="tip">Centro de Costos</th>';
          t += '<th data-class="tip">Situación Educativa</th>';
          t += '<th data-class="tip">Cod. Régimen</th>';
          t += '<th data-class="tip">Desc. Régimen</th>';
          t += '<th data-class="tip">Cod. Institución</th>';
          t += '<th data-class="ed">Cod. Carrera</th>';
          t += '<th data-class="nom">Desc. Carrera</th>';
          return t;
          }
          */


    </script>

</body>

</html>
