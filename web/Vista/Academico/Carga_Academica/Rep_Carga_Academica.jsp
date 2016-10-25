
<%@page import="pe.edu.upeu.application.model.Carga_Academica"%>
<%@page import="pe.edu.upeu.application.dao.Carga_AcademicaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO"%>
<jsp:useBean id="ListCarAca" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Carga Académica</title>

        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">
        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">

        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../../img/splash/sptouch-icon-iphone.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
    </head>
    <body>
        <div id="content">
            <div class="row">
                <div class="col-sm-12">

                    <div class="well">

                        <h1><span class="semi-bold">Reporte</span> <i class="ultra-light">Carga Académica</i> (Docentes) <sup class="badge bg-color-red bounceIn animated">v 2.0</sup> <br>
                            <small class="text-danger slideInRight fast animated"><strong>Inicio de contratación</strong></small></h1>
                        <div class="row">
                            <div class="col-md-4">
                                <select class="form-control" >
                                    <option value="" >[Condición Laboral]</option>
                                    <option value="1" >Contratado</option>
                                    <option value="2" >Tiempo Parcial</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <select class="form-control" >
                                    <option value="" >[Facultad Adscrita]</option>
                                    <option value="1" >item 1</option>
                                    <option value="2" >item 2</option>
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <section id="widget-grid" class="">
                <div class="row">
                    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="jarviswidget" id="wid-id-0" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
                            <header>
                                <span class="widget-icon"> <i class="glyphicon glyphicon-stats txt-color-darken"></i> </span>
                                <h2>Carga Académica</h2>
                                <ul class="nav nav-tabs pull-right in" id="myTab"> 
                                    <li class="active">
                                        <a data-toggle="tab" href="#s1"><i class="fa fa-user"></i> <span class="hidden-mobile hidden-tablet">Usuarios RRHH</span></a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#s2"><i class="fa fa-users"></i> <span class="hidden-mobile hidden-tablet">Usuarios Académico</span></a>
                                    </li>
                                </ul>
                            </header>
                            <div class="no-padding">
                                <div class="widget-body">
                                    <div id="myTabContent" class="tab-content">
                                        <div class="tab-pane fade active in padding-10 no-padding-bottom" id="s1">
                                            <table   class="table table-striped table-bordered table-hover datatableRepCargaAcademica" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>Acciones</th>
                                                        <th>Tipo Documento</th>
                                                        <th>N° Documento</th>
                                                        <th>Apellidos y Nombres</th>
                                                        <th>Facultad</th>
                                                        <th>Escuela</th>
                                                        <th>Situación Educativa</th>
                                                        <th>Profesión Docente</th>
                                                        <th>Condición</th>
                                                        <th>Ciclo</th>
                                                        <th>Fecha Inicio</th>
                                                        <th>Fecha Cese</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (int i = 0; i < ListCarAca.size(); i++) {
                                                            Carga_Academica ca = new Carga_Academica();
                                                            ca = (Carga_Academica) ListCarAca.get(i);
                                                    %>
                                                    <tr >
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                                    <i class="fa fa-gear fa-lg"></i>
                                                                </button>
                                                                <ul class="dropdown-menu">
                                                                    <li>
                                                                        <a href="../../../carga_academica?opc=Completar_Datos&nro_doc=<%=ca.getNu_doc()%>&ap_p=<%=ca.getAp_paterno()%>&ap_m=<%=ca.getAp_materno()%>&no_tr=<%=ca.getNo_trabajador()%>&ti_doc=<%=ca.getEs_tipo_doc()%>&eap=<%=ca.getNo_eap()%>&facultad=<%=ca.getNo_facultad()%>"   >Completar Datos</a>

                                                                    </li>

                                                                    <li class="divider"></li>
                                                                    <li>
                                                                    <li>
                                                                        <a href="" data-toggle="modal" data-target="#myModal" data-backdrop="static" 
                                                                           data-keyboard="false" class="btnCargaAcademica"
                                                                           data-valor="&nro_doc=<%=ca.getNu_doc()%>&eap=<%=ca.getNo_eap()%>&facultad=<%=ca.getNo_facultad()%>&idtr=<%=ca.getId_trabajador()%>&ciclo=<%=ca.getDe_carga()%>"  >Carga Academica</a>
                                                                    </li>
                                                                </ul>
                                                            </div>

                                                        </td>
                                                        <td><%=ca.getEs_tipo_doc()%></td>
                                                        <td><%=ca.getNu_doc()%></td>
                                                        <td><%=ca.getAp_paterno() + " " + ca.getAp_materno() + " " + ca.getNo_trabajador()%></td>
                                                        <td><%=ca.getNo_facultad()%></td>
                                                        <td><%=ca.getNo_eap()%></td>
                                                        <td><%=ca.getNo_s_educativa()%></td>
                                                        <td><%=ca.getProfesion_docente()%></td>
                                                        <td><%=ca.getDe_condicion()%></td>
                                                        <td><%=ca.getDe_carga()%></td>
                                                        <td><%=ca.getFe_desde()%></td>
                                                        <td><%=ca.getFe_hasta()%></td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane fade" id="s2">
                                            <table id="example-table2" class="table table-condensed" >
                                                <thead>
                                                    <tr>
                                                        <th>AP_PATERNO</th>
                                                        <th>AP_MATERNO</th>
                                                        <th>NO_FACULTAD</th>
                                                        <th>DE_CARGA</th>

                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>


            </section>
        </div>

        <!-------------- Modal  ----------->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close-form close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                        <h4 class="modalTitle" id="myModalLabel">Académico</h4>
                    </div>
                    <div class="modal-body">
                        <div class="areaModal">

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="close-form btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" onclick="" class="btn btn-success">Aceptar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-----Modal------------------------------------------->

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
            if (!window.jQuery) {
                document.write('<script src="../../../js/libs/jquery-2.0.2.min.js"><\/script>');
            }
        </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
            if (!window.jQuery.ui) {
                document.write('<script src="../../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
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
        <script src="../../../js/demo.min.js"></script>

        <!-- MAIN APP JS FILE -->
        <script src="../../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="../../../js/speech/voicecommand.min.js"></script>

        <!-- PAGE RELATED PLUGIN(S) -->
        <script src="../../../js/plugin/jquery-form/jquery-form.min.js"></script>
        <script src="../../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script type="text/javascript">
            function showCargaAcademica(objBodyPrint,dataAjax) {
                var url = '../../../carga_academica';
                var arr = [];
                var fila = 1;
                var columna = 0;
                var g = 0;

                objBodyPrint.empty();
                $.ajax({url: "horarioCursosAcademico.html", type: 'POST', success: function (htmlContent, textStatus, jqXHR) {
                        objBodyPrint.append(htmlContent);
                        /*test*/
                        $.post(url, 'opc=getDetCargaAcademica'+dataAjax, function (data) {
                            /*imprimir los cursos*/
                            $.each(data, function (f, campo) {
                                $('.tbody-cursos').append('<tr><td >' + (g + 1) + '.</td><td><b>' + campo.nombrecurso + '</b></td><td ><li> ' + campo.nombre + '</li><li>Ing.Sist. Ciclo:6</li></td></tr>');
                                arr[g] = campo.horario.toString();
                                g++;
                            });
                            arr[0] = '0100100010010001001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
                            arr[1] = '0000000000000000000100000010000001000000100000000000000000000000000000000000000000000000000000000000000000000000';
                            for (var j = 0; j < arr.length; j++) {
                                var myArray = arr[j].split('');
                                for (var i = 0; i < myArray.length; i++) {
                                    columna++;
                                    if (myArray[i] == "1") {
                                        $(".fila-" + fila + " .columna-" + columna).css("background", "blue");
                                    }
                                    if (columna == 7) {
                                        columna = 0;
                                        fila++;
                                    }
                                }
                                fila = 1;
                                columna = 0;
                            }
                        });

                    }});
            }
            $(document).ready(function () {
                var opc = "list";
                var dataAditional = "";
                var idRow = "";
                var urlListDatatable = "../usuario/executeCrudUsuario.htm";
                // PAGE RELATED SCRIPTS
                var responsiveHelper_dt_basic = undefined;
                var responsiveHelper_datatable_fixed_column = undefined;
                var responsiveHelper_datatable_col_reorder = undefined;
                var responsiveHelper_datatable_tabletools = undefined;
                var breakpointDefinition = {
                    tablet: 1024,
                    phone: 480
                };

                var tableRepAcademico = $('#datatableRepCargaAcademica')
                        .DataTable(
                                {
                                    "ajax": {
                                        "url": urlListDatatable,
                                        "type": "POST",
                                        "dataSrc": "data",
                                        "data": {
                                            "opc": "list"
                                        }
                                    },
                                    "columns": [{
                                            "data": "personaBean.idPersona"
                                        }, {
                                            "data": "nombres"
                                        }, {
                                            "data": "varUsuario"
                                        }, {
                                            "data": "varClave",
                                            "defaultContent": ""
                                        }, {
                                            "data": "fecInicio"
                                        }, {
                                            "data": "fecFin"
                                        }, {
                                            "orderable": false,
                                            "data": null,
                                            "defaultContent": ""
                                        }],
                                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>"
                                            + "t"
                                            + "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                                    "oLanguage": {
                                        "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
                                    },
                                    "autoWidth": true,
                                    "preDrawCallback": function () {
                                        // Initialize the responsive datatables helper once.
                                        if (!responsiveHelper_dt_basic) {
                                            responsiveHelper_dt_basic = new ResponsiveDatatablesHelper(
                                                    $('#dt_basic'),
                                                    breakpointDefinition);
                                        }
                                    },
                                    "rowCallback": function (row, data, index) {
                                        responsiveHelper_dt_basic.createExpandIcon(row);
                                        $('td:eq(0)', row).html(index + 1);
                                        console.log(data.personaBean.idPersona);
                                        $('td:eq(6)', row)
                                                .html(
                                                        '<button class="btn btn-success btn-xs btnEditar" value="' + data.personaBean.idPersona + '" ><i class="fa fa-pencil" ></i></button> '
                                                        + '<button class="btn btn-danger btn-xs btnEliminar" value="' + data.personaBean.idPersona + '" ><i class="fa fa-times"></i></button>');

                                    },
                                    "drawCallback": function (oSettings) {
                                        responsiveHelper_dt_basic.respond();
                                        // var api = this.api();
                                        console.log("Enter to drawCallBack")
                                        $(".btnEditar")
                                                .click(
                                                        function () {
                                                            var id = $(this).val();
                                                            idRow = $(this).val();
                                                            console.log("idEdit : "
                                                                    + idRow)
                                                            opc = "findById";
                                                            $
                                                                    .ajax({
                                                                        url: "../usuario/executeCrudUsuario.htm",
                                                                        data: "opc="
                                                                                + opc
                                                                                + "&id="
                                                                                + id,
                                                                        type: "POST",
                                                                        success: function (
                                                                                objJson) {
                                                                            objJson = JSON
                                                                                    .parse(objJson);
                                                                            var mensaje = objJson.message;
                                                                            var item = objJson.showItem;
                                                                            $(
                                                                                    ".persona, .select2")
                                                                                    .hide();
                                                                            $(
                                                                                    ".persona")
                                                                                    .attr(
                                                                                            "disabled",
                                                                                            true);
                                                                            $(
                                                                                    ".personaReadOnly")
                                                                                    .show(
                                                                                            200);
                                                                            $(
                                                                                    ".personaReadOnly")
                                                                                    .empty();
                                                                            $(
                                                                                    ".personaReadOnly")
                                                                                    .append(
                                                                                            "<option>"
                                                                                            + item["nombres"]
                                                                                            + "</option>");
                                                                            $(".user")
                                                                                    .val(
                                                                                            item["varUsuario"]);
                                                                            $('#from')
                                                                                    .datepicker(
                                                                                            'setDate',
                                                                                            item["fecInicio"]);
                                                                            $('#to')
                                                                                    .datepicker(
                                                                                            'setDate',
                                                                                            item["fecFin"]);
                                                                            formData = $(
                                                                                    ".formSubmit")
                                                                                    .serialize();
                                                                            $(
                                                                                    ".btnAgregar")
                                                                                    .click();
                                                                            opc = "edit";
                                                                            dataAditional = "&id="
                                                                                    + id;
                                                                            fieldUniqueSave = "fieldUniqueEdit";
                                                                        }
                                                                    });
                                                        });
                                        $(".btnEliminar")
                                                .click(
                                                        function () {
                                                            idRow = $(this).val();
                                                            console.log("idEdit : "
                                                                    + idRow)
                                                            deleteRecord(
                                                                    idRow,
                                                                    "../usuario/executeCrudUsuario.htm",
                                                                    "", $("#dt_basic"));

                                                            listPersona();
                                                        });
                                    }
                                });

                $(".btnCargaAcademica").click(function () {
                    var objBodyPrint = $(".areaModal");
                    showCargaAcademica(objBodyPrint,$(this).data("valor"));
                });



            });
        </script>



    </body>

</html>
