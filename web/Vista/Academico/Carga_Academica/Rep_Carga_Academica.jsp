
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
                        <!--<div class="row">
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
                        </div>-->

                    </div>
                </div>
            </div>
            <section id="widget-grid" class="">
                <div class="row">
                    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="jarviswidget" id="wid-id-0" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" 
                             data-widget-deletebutton="false">
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
                                    <div class="tab-pane fade active in padding-10 no-padding-bottom" id="s1">
                                        <table   class="table table-striped table-bordered table-hover datatableRepCargaAcademica" width="100%">
                                            <thead>
                                                <tr>
                                                    <th class="hasinput" colspan="10"  rowspan="1"></th>  
                                                    <th class='hasinput' >
                                                        <input type="text" class='form-control input-sm dateDesdeM' />
                                                    </th>
                                                    <th class='hasinput' >
                                                        <input type="text" class='form-control input-sm dateHastaM' />
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th></th>
                                                    <th>Tipo Doc.</th>
                                                    <th>N° Documento</th>
                                                    <th style="width: 16%">Apellidos y Nombres</th>
                                                    <th>Facultad</th>
                                                    <th>Escuela</th>
                                                    <th>Situación Educativa</th>
                                                    <th>Profesión Docente</th>
                                                    <th>Condición</th>
                                                    <th>Ciclo</th>
                                                    <th>Inicio</th>
                                                    <th>Cese</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (int i = 0; i < ListCarAca.size(); i++) {
                                                        Carga_Academica ca = new Carga_Academica();
                                                        ca = (Carga_Academica) ListCarAca.get(i);
                                                %>
                                                <tr>
                                                    <td>  
                                                        <div class="btn-group"> 
                                                            <button class="btn btn-primary dropdown-toggle bounceIn animated" data-toggle="dropdown">
                                                                <i class="fa fa-gear fa-lg"></i>
                                                            </button>
                                                            <ul class="dropdown-menu">
                                                                <%if (ca.getValidateExistTrabajador() != null) {
                                                                %>
                                                                <li>
                                                                    <a href="../../../carga_academica?opc=Completar_Datos&<%=ca.toDataSent()%>">Completar Datos</a>
                                                                </li>

                                                                <li class="divider"></li>
                                                                <li>
                                                                <li>
                                                                    <button  data-toggle="modal" data-target="#myModal" data-backdrop="static" 
                                                                       data-keyboard="false" class="btnCargaAcademica"
                                                                       data-valor="&<%=ca.toDataSent()%>"  value="<%=(i+1)%>" >Carga Academica</button>
                                                                </li>
                                                                <%} else {%>
                                                                <li>
                                                                    <a href="../../../carga_academica?opc=Completar_Datos&<%=ca.toDataSent()%>" >Completar Datos</a>
                                                                </li>
                                                                <%}%>
                                                            </ul>
                                                        </div>

                                                    </td>
                                                    <td><%=ca.getEs_tipo_doc()%></td>
                                                    <td><%=ca.getNu_doc()%></td>
                                                    <td><label><%=ca.getAp_paterno() + " " + ca.getAp_materno() + " " + ca.getNo_trabajador()%> </label>
                                                        <sup class="badge bg-color-greenLight bounceIn animated"><%=ca.getCountCursos()%></sup></td>
                                                    <td><%=ca.getNo_facultad()%></td>
                                                    <td><%=ca.getNo_eap()%></td>
                                                    <td><%=ca.getNo_s_educativa()%></td>
                                                    <td><%=ca.getProfesion_docente()%></td>
                                                    <td><%=ca.getDe_condicion()%></td>
                                                    <td><%=ca.getDe_carga()%></td>
                                                    <td><%if (ca.getFe_desde() == null & ca.getValidateExistTrabajador() != null) {
                                                        %> 
                                                        <input type="text" class="dateDesdeItem form-control input-sm" style="width:100px"/>
                                                        <% }
                                                        %></td>
                                                    <td><%if (ca.getFe_hasta() == null & ca.getValidateExistTrabajador() != null) {
                                                        %> 
                                                        <input type="text" class="dateHastaItem form-control input-sm" style="width:100px"/>
                                                        <% }
                                                        %></td>
                                            <input type="text" class="idtr<%=(i+1)%>" value="<%=ca.getId_trabajador()%>"/>
                                            <input type="text" class="iddgp<%=(i+1)%>" value=""/>
                                            <input type="text" class="proceso<%=(i+1)%>" value=""/>
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
                    </article>
                </div>
            </section>
        </div>

        <!-------------- Modal  ----------->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="modal-dialog"   >
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close-form close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                        <h4 class="modalTitle" id="myModalLabel">Académico</h4>
                    </div>
                    <div class="modal-body">
                        <div class="areaModal">

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
        <script  type="text/javascript" src="../../../js/Js_Formulario/Js_Form.js"></script>
        <script type="text/javascript" src="../../../js/Js_Academico/Js_Carga_Academica.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                pageSetUp();
                initFormPlugins();
                initCargaAcademica();
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
                var tableRepAcademico = $('.datatableRepCargaAcademica').DataTable();

                $(".dateDesdeM").datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 2,
                    dateFormat: 'dd/mm/yy',
                    prevText: '<i class="fa fa-chevron-left"></i>',
                    nextText: '<i class="fa fa-chevron-right"></i>',
                    onClose: function (selectedDate) {
                        $(this).parents("tr").find($(".dateHastaM")).datepicker("option", "minDate", selectedDate);
                    }
                });
                $(".dateHastaM").datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 2,
                    dateFormat: 'dd/mm/yy',
                    prevText: '<i class="fa fa-chevron-left"></i>',
                    nextText: '<i class="fa fa-chevron-right"></i>',
                    onClose: function (selectedDate) {
                        $(this).parents("tr").find($(".dateDesdeM")).datepicker("option", "maxDate", selectedDate);
                    }
                });
                $(".dateDesdeItem").datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 2,
                    dateFormat: 'dd/mm/yy',
                    prevText: '<i class="fa fa-chevron-left"></i>',
                    nextText: '<i class="fa fa-chevron-right"></i>',
                    onClose: function (selectedDate) {
                        $(this).parents("tr").find($(".dateHastaItem")).datepicker("option", "minDate", selectedDate);
                    }
                });
                $(".dateHastaItem").datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 2,
                    dateFormat: 'dd/mm/yy',
                    prevText: '<i class="fa fa-chevron-left"></i>',
                    nextText: '<i class="fa fa-chevron-right"></i>',
                    onClose: function (selectedDate) {
                        $(this).parents("tr").find($(".dateDesdeItem")).datepicker("option", "maxDate", selectedDate);
                    }
                });


            });
        </script>
    </body>

</html>
