<%@page import="pe.edu.upeu.application.model.x_List_Id_Trab_Dgp"%>
<jsp:useBean id="LIST_ID_TRAB_DGP" class="java.util.ArrayList" scope="application"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title>Autorizaciones DGP</title>

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
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

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


    </head>
    <body>
    <center>
        <!--<label>DGP Elaborados del Trabajador</label>-->

        <div class="widget-body ">
            
            <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%">
                <thead> 
                    <tr>
                        <th data-hide="phone">Nro</th>
                        <th data-class="expand">Fecha Desde</th>
                        <th data-hide="phone,tablet">Fecha Hasta</th>
                        <th data-hide="phone">Motivo</th>
                        <th data-hide="phone,tablet">Puesto Trabajador</th>
                        <th data-hide="phone,tablet">Secci�n</th>
                        <th data-hide="phone,tablet">Area</th>
                        <th data-hide="phone,tablet">Estado</th>
                        <th data-hide="phone,tablet">Documentos</th>
                        <th data-hide="phone,tablet">Detalle</th>
                    </tr>
                </thead>
                <%  if (LIST_ID_TRAB_DGP.size() == 0) {%>
                <td colspan="10" style="text-align: center"><h2>El Trabajador  no Tiene ningun DGP elaborado...</h2></td>
                <%}%>

                <tbody> 
                    <%for (int i = 0; i < LIST_ID_TRAB_DGP.size(); i++) {
                            x_List_Id_Trab_Dgp d = new x_List_Id_Trab_Dgp();
                            d = (x_List_Id_Trab_Dgp) LIST_ID_TRAB_DGP.get(i);
                    %>
                    <tr>
                        <td ><%=i + 1%></td>
                        <td ><%=d.getFe_desde()%></td>
                        <td ><%=d.getFe_hasta()%></td>
                        <td ><%=d.getNo_req()%></td>
                        <td ><%=d.getNo_puesto()%></td>
                        <td ><%=d.getNo_seccion()%></td> 

                        <td ><%=d.getNo_area()%></td> 

                        <td >
                            <%
                                if (d.getEs_dgp() != null) {
                                    if (d.getEs_dgp().trim().equals("0")) {
                            %>
                            <a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&opc=Seguimiento">En Proceso</a>
                            <% }%>
                            <%if (d.getEs_dgp().trim().equals("1")) {
                            %>
                            <a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&opc=Seguimiento">Ver Proceso Terminado</a>
                            <% }
                            } else {%>
                            <a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&opc=Seguimiento">Incompleto - Interrumpido</a>
                            <%}%>
                        </td> 
                        <td ><a href="../../documento?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=Ver_Documento">Ver Documentos</a></td> 


                        <td ><a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=Detalle">Ver Detalle</a></td>
                    </tr> 
                    <%}%>
                </tbody>
            </table>
        </div>
    </center>

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




<script src="../../js/plugin/flot/jquery.flot.cust.min.js"></script>
<script src="../../js/plugin/flot/jquery.flot.resize.min.js"></script>
<script src="../../js/plugin/flot/jquery.flot.fillbetween.min.js"></script>
<script src="../../js/plugin/flot/jquery.flot.orderBar.min.js"></script>
<script src="../../js/plugin/flot/jquery.flot.pie.min.js"></script>
<script src="../../js/plugin/flot/jquery.flot.tooltip.min.js"></script>


</body>
</html>