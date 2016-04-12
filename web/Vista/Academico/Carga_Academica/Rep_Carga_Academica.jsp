
<%@page import="pe.edu.upeu.application.model.Carga_Academica"%>
<%@page import="pe.edu.upeu.application.dao.Carga_AcademicaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO"%>
<jsp:useBean id="ListCarAca" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta charset="utf-8">
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



    </head>

                                           
<body class="main"  >
        <div class="content">
        <section id="widget-grid" style="margin-left: 50px; margin-right: 50px;">
            <div class="row">
                <article >
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
                                            <table  id="example" class="table table-striped table-bordered table-hover" width="100%">
                                            <thead>
                                                <tr>
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
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <%
                                                    for (int i = 0; i < ListCarAca.size(); i++) {
                                                        Carga_Academica ca = new Carga_Academica();
                                                        ca = (Carga_Academica) ListCarAca.get(i);
                                                %>
                                                <tr >
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
                                                    <td><a href="../../../carga_academica?opc=Completar_Datos&nro_doc=<%=ca.getNu_doc()%>&ap_p=<%=ca.getAp_paterno()%>&ap_m=<%=ca.getAp_materno()%>&no_tr=<%=ca.getNo_trabajador()%>&ti_doc=<%=ca.getEs_tipo_doc()%>&eap=<%=ca.getNo_eap()%>&facultad=<%=ca.getNo_facultad()%>" class="btn btn-primary" >Completar Datos</a></td>
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
   



    <!--================================================== -->

    <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>

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
    <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>
    <script type="text/javascript">
        var term;
        

     $(document).ready(function () {
      
          
        $("#example-table2").DataTable( {
        "autoWidth": true,
         "ajax": {
            "url": "../../../carga_academica?opc=actualizar_ws&semestre=2016-1",
            "type": "POST",
            "dataSrc": "Fotos_NoVal"
        },
        "columns": [ 
           
        ]
        
        });  
       
       
       
        
    
        });

    </script>

    <!--DATATABLE FILTRO DEMO-->
    <!--<div class="spacer" style="border: 3px solid black;"></div>-->
</body>
<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
<script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>

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
<script src="../../../js/DataTables-1.10.4/media/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="../../../js/DataTables-1.10.4/media/js/jquery-ui.js" type="text/javascript"></script>
<script src="../../../js/DataTables-1.10.4/media/js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>

<script src="../../../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../../../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="../../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

<script>
 $(document).ready(function () {
       DataT("0","#example-table");
       DataT("2","#example-table2");
               
        });
        
        function DataT(p,tab){
           
        $(tab).DataTable( {
        "autoWidth": true,
         "ajax": {
            "url": "../../../carga_academica?opc=actualizar_ws&semestre=2016-1",
            "type": "POST"
        },
        "columns": [ 
            { "data": "NU_DOC" },
            { "data": "AP_PATERNO" },
            { "data": "AP_MATERNO" },
            { "data": "NO_TRABAJADOR" },
            { "data": "NO_FACULTAD" },
            { "data": "DE_CARGA" }
        ]
        
        } );  
       
        }


</script>
</html>
