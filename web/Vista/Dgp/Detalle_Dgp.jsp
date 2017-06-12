<%@page import="pe.edu.upeu.application.util.DateFormat"%>
<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="pe.edu.upeu.application.dao.Solicitud_RequerimientoDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceSolicitud_RequerimientoDAO"%>
<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfacePlazo_DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao.Plazo_DgpDAO"%>
<%@page import="pe.edu.upeu.application.model.Detalle_Centro_Costo"%>
<%@page import="pe.edu.upeu.application.model.Centro_Costos"%>
<%@page import="pe.edu.upeu.application.dao.UsuarioDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.V_Det_DGP"%>
<%@page import="pe.edu.upeu.application.model.X_List_id_dgp"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.upeu.application.dao.DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDgpDAO"%>
<jsp:useBean id="LIST_ID_DGP" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="LIST_ID_USER" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Cargar_dcc_dgp" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->
        <title> Requerimiento </title>
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
        <link href="../../css/businessLogic/Dgp/detalleDGP.css" rel="stylesheet" type="text/css"/>
        </head>
        <body>
            <div id="main" role="main" style="margin-left: 0px;">
                <center>
                    <div id="content" >
                        <section id="widget-grid" class="">
                            <div class="row div_dgp slideInDown fast animated">
                                <form action="../../dgp">
                                    <table class="table table-bordered table-hover table-striped  table-responsive">
                                        <%
                                            String iddgp = "";
                                            HttpSession sesion = request.getSession(true);
                                            String idrol = (String) sesion.getAttribute("IDROL");
                                            if (LIST_ID_DGP.size() > 0) {
                                                for (int i = 0; i < LIST_ID_DGP.size(); i++) {
                                                    V_Det_DGP d = new V_Det_DGP();
                                                    d = (V_Det_DGP) LIST_ID_DGP.get(i);
                                                    iddgp = d.getId_dgp();
                                                    BigDecimal cs = new BigDecimal(d.getCa_sueldo()).setScale(2, RoundingMode.UP);
                                                    BigDecimal bev = new BigDecimal(d.getDe_bev()).setScale(2, RoundingMode.UP);
                                                    BigDecimal bal = new BigDecimal(d.getCa_bono_alimentario()).setScale(2, RoundingMode.UP);
                                                    BigDecimal bp = new BigDecimal(d.getCa_bonificacion_p()).setScale(2, RoundingMode.UP);
                                                    BigDecimal total = new BigDecimal((d.getCa_bonificacion_p() + d.getCa_asig_familiar() + d.getCa_bono_alimentario() + d.getDe_bev() + d.getCa_sueldo())).setScale(2, RoundingMode.UP);
                                        %>

                                        <input type="hidden"  class="fe_desde_dgp" value="<%=DateFormat.toFormat3(d.getFe_desde())%>"/>
                                        <tr><td colspan="2" class="txt-color-blueDark"><h6><i class="fa fa-file"></i> REQUERIMIENTO : <%=d.getNo_req()%> </h6></td></tr>
                                        <!--<label style="color: black; //font-family: cursive;"><h2><%=d.getNo_req()%></h2></label>
                                        -->
                                        <%if (d.getLi_motivo() != null) {%>

                                        <tr><td class="text-info ">Motivo :</td>
                                            <% if (d.getLi_motivo().equals("1")) {%>
                                            <td colspan="2" class="text-info ">Trabajador Nuevo</td></tr>
                                            <%}
                                                if (d.getLi_motivo().equals("2")) {%>
                                        <td colspan="2" class="text-info ">Renovación</td></tr>
                                        <%}
                                            }%>
                                        <tr><td  class="text-info " >Trabajador :</td><td class=""><%=d.getNombre_trabajador()%></td></tr>
                                        <tr><td  class="text-info " >Fecha Desde :</td><td class="text-info "><%=d.getFe_desde()%></td></tr>
                                        <tr ><td class="text-info ">Fecha Hasta:</td><td class="text-info "><%=d.getFe_hasta()%></td></tr>
                                        <tr><td class="text-info ">Sueldo Basico : S/.</td><td class="text-info "><%=cs.toPlainString()%></td></tr>
                                        <tr><td class="text-info ">BEV: </td><td class="text-info "><%=bev.toPlainString()%></td></tr>
                                        <tr><td class="text-info ">Bono Alimentario : S/.</td><td  class="text-info "><%=bal.toPlainString()%></td></tr>
                                        <tr><td class="text-info ">Asignación Familiar : S/.</td><td  class="text-info "><%=d.getCa_asig_familiar()%></td></tr>
                                        <tr><td class="text-info ">Bono por Funcion : S/.</td><td  class="text-info "><%=bp.toPlainString()%></td></tr>
                                        <tr><td class="text-info " >Total Remunerativo : S/.</td><td class="text-danger" ><%=total.toPlainString()%></td></tr>
                                        <tr><td  Class="text-info ">Departamento:</td><td class="text-info "><%=d.getNo_dep()%></td></tr>
                                        <tr><td  Class="text-info ">Area :</td><td class="text-info "><%=d.getNo_area()%></td></tr>
                                        <tr><td  Class="text-info ">Sección :</td><td class="text-info "><%=d.getNo_seccion()%></td></tr>
                                        <tr><td  Class="text-info ">Puesto :</td><td class="text-info "><%=d.getNo_puesto()%></td></tr>
                                            <%if (Cargar_dcc_dgp.size() > 0) {
                                                    for (int p = 0; p < Cargar_dcc_dgp.size(); p++) {
                                                        Detalle_Centro_Costo dcc = new Detalle_Centro_Costo();
                                                        dcc = (Detalle_Centro_Costo) Cargar_dcc_dgp.get(p);
                                            %>
                                        <tr><td class="text-info ">Centro de Costo N° <%=p + 1%></td><td class="text-info "><label class="text-danger"> <%=dcc.getCa_porcentaje() + "%"%> &nbsp;</label><%=dcc.getDe_centro_costo()%>&nbsp;&nbsp;&nbsp;<span class="text-success">  Codigo : <%=dcc.getCo_centro_costo()%></span></td></tr>
                                        <%}
                                        } else {%>
                                        <tr><td class="text-info ">Centro de Costo </td><td class="text-info ">No tiene Centro de costo </td></tr>
                                        <%}%>

                                        <input type="hidden" name="iddgp" value="<%=d.getId_dgp().trim()%>">
                                        <input type="hidden" name="idreq" value="<%=d.getId_requerimiento().trim()%>">
                                        <%if (d.getDe_antecedentes_policiales() != null) {%>
                                        <%if (d.getDe_antecedentes_policiales().equals("1")) {%>
                                        <tr><td class="text-info ">Antecedentes Policiales: </td><td class="text-info ">No</td></tr>
                                        <%} else {%>
                                        <tr><td class="text-info ">Antecedentes Policiales: </td><td class="text-info ">Si</td></tr>
                                        <%}%>
                                        <%} else {%>
                                        <tr><td class="text-info ">Antecedentes Policiales: </td><td class="text-info ">No registrado</td></tr>
                                        <%}%>
                                        <tr><td class="text-info ">Certificado de Salud: </td><td class="text-info " ><%if (d.getEs_certificado_salud() != null) {
                                                if (d.getEs_certificado_salud().trim().equals("1")) {
                                                    out.print("Si");
                                                }
                                                if (d.getEs_certificado_salud().trim().equals("0")) {
                                                    out.print("No");
                                                }
                                            } else {
                                                out.print("No ingresado");
                                            }%></td></tr>
                                                <%
                                                    String num = request.getParameter("num");

                                                    if (d.getEs_dgp() != null) {
                                                        if (num.equals("0") & d.getEs_dgp().equals("0") & idrol.trim().equals("ROL-0006")) {

                                                %>
                                                <%}
                                                    if (d.getEs_dgp().equals("1") & num.equals("0") & !"ROL-0006".equals(idrol.trim())) {%>
                                        <tr><td colspan="3" class="ct"><a href="">Ver Contrato</a></td></tr>
                                        <%}
                                            }%>

                                        <% if (d.getUs_creacion() != null) {%>
                                        <tr ><td class="text-info ">Creado por:</td><td colspan="2" class="text-info "><%=d.getNo_trab_us_cr() + " - " + d.getNo_usuario_crea()%></td></tr>
                                            <%} else {%>
                                        <tr ><td class="text-info ">Creado por:</td><td colspan="2" class="text-info ">No Registrado</td></tr>
                                        <%}%>
                                        <%if (d.getUs_modif() != null) {%>
                                        <tr><td class="text-info ">Fuera de plazo autorizado por:</td><td class="text-danger" colspan="2"><%=d.getNo_trab_us_mod() + " - " + d.getNo_usuario_mod()%></td></tr>
                                            <%} else {%>
                                        <tr><td class="text-info ">Fuera de plazo autorizado por:</td><td class=" ">Sin Modificaciones</td></tr>
                                        <%}%>


                                        <%if (d.getFe_modif() == null) {%>
                                        <tr><td class="text-info ">Fecha Modificacion</td><td colspan="2" class="text-info ">Sin Modificaciones</td></tr>
                                        <%} else {%>
                                        <tr><td class="text-info ">Fecha de Modificacion:</td><td colspan="2" class="text-info "><%=d.getFe_modif()%></td></tr>
                                            <%}%>
                                            <%if (d.getFe_creacion() == null) {%>
                                        <tr><td class="text-info ">fecha Creacion:</td><td colspan="2" class="text-info ">Sin Modificaciones</td></tr>
                                        <%} else {%>
                                        <tr><td class="text-info ">Fecha de Creacion:</td><td colspan="2" class="text-info "><%=d.getFe_creacion()%></td></tr>
                                            <%}%>


                                        <%                                            if (d.getEs_mfl().equals("1")) {%>
                                        <tr><td class="text-info ">MFL:</td><td colspan="2" class="text-info ">Si</td></tr>
                                        <%}
                                            if (d.getEs_mfl().equals("0")) {%>
                                        <tr><td class="text-info ">MFL:</td><td colspan="2" class="text-info ">No</td></tr>
                                        <%}%>

                                        <%                                            if (d.getEs_presupuestado().equals("1")) {%>
                                        <tr><td class="text-info ">Presupuestado:</td><td colspan="2" class="text-info ">Si</td></tr>
                                        <%}
                                            if (d.getEs_presupuestado().equals("0")) {%>
                                        <tr><td class="text-info ">Presupuestado:</td><td colspan="2" class="text-info ">No</td></tr>
                                        <%}%>

                                        <input type="hidden" name="idtr" value="<%=request.getParameter("idtr")%>">
                                        <input type="hidden" name="opc" value="MODIFICAR REQUERIMIENTO">   
                                    </table>
                                    <% if (idrol.trim().equals("ROL-0001")) {%>
                                    <%
                                        if (d.getEs_dgp() == null) {
                                    %>
                                    <a href="../../dgp?opc=MODIFICAR REQUERIMIENTO&iddgp=<%=d.getId_dgp().trim()%>&redirect=proceso_dgp" class="btn btn-primary btn-labeled"><span class="btn-label"><i class="fa fa-pencil-square-o"></i></span> Editar DGP</a> 
                                            <%} else if (d.getEs_dgp().trim().equals("2")) {
                                            %>
                                    <a href="../../dgp?opc=MODIFICAR REQUERIMIENTO&iddgp=<%=d.getId_dgp().trim()%>" class="btn btn-primary btn-labeled"><span class="btn-label"><i class="fa fa-pencil-square-o"></i></span> Editar DGP</a> 
                                            <%}%>
                                    <a class="btn btn-primary btn-labeled" href="../../documento?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=Ver_Documento"><span class="btn-label"><i class="glyphicon glyphicon-info-sign"></i></span>Ver Documentos</a>
                                    <a class="btn btn-primary btn-labeled" href="../../horario?iddgp=<%=d.getId_dgp()%>&opc=Listar"><span class="btn-label"><i class="glyphicon glyphicon-info-sign"></i></span>Ver Horario</a>
                                    <a href="../../dgp?opc=MODIFICAR REQUERIMIENTO&iddgp=<%=d.getId_dgp().trim()%>" class="btn btn-primary btn-labeled"><span class="btn-label"><i class="fa fa-pencil-square-o"></i></span> Editar DGP</a>         
                                            <%}%>
                                            <%}
                                                }%> 
                                </form>
                            </div>
                            <div class="row">

                                <% if (request.getParameter("opc") != null) {
                                        if (request.getParameter("opc").equals("reg_doc")) {
                                            InterfacePlazo_DgpDAO p = new Plazo_DgpDAO();
                                            InterfaceSolicitud_RequerimientoDAO s = new Solicitud_RequerimientoDAO();
                                            int val_btn = p.Validar_cumple_dias_pt2(iddgp.trim());
                                            boolean x = false;
                                %>
                                <h3 style="text-align: center;">Enviar Requerimiento</h3> 
                                <%if (val_btn == 0) {
                                        x = s.Validar_Envio_Solicitud(iddgp.trim());
                                        if (x) {%>
                                <input type="hidden" name="iddgp"  value="<%=iddgp%>" class="dgp" required="">   
                                <div class="aviso_cumplimiento">

                                    <div class="alert alert-warning fade in div_dgp">
                                        <button class="close" data-dismiss="alert">
                                            ×
                                        </button>
                                        <i class="fa-fw fa fa-warning"></i>
                                        <strong>Advertencia</strong> Usted no ha cumplido con los dias de tolerancia del plazo <strong>Inicio de contrato</strong>, 
                                        porfavor envie solicitud para la nueva fecha de inicio del trabajador.
                                    </div>
                                </div> 

                                <br>
                                <button class="btn btn-primary btn-labeled btn_solicitud" data-toggle="modal" type="button" data-target="#myModal">
                                    <span class="btn-label"><i class="fa fa-envelope"></i></span>
                                    Solicitud de Plazo
                                </button>
                                <button type="button" class="btn btn-success btn-labeled" disabled="true">
                                    <span class="btn-label"><i class="fa fa-arrow-circle-right"></i></span>
                                    Terminar
                                </button>
                                <%}%>
                                <%}%>
                                <%if (x == false & val_btn != 0) {
                                %>
                                <form action="../../dgp" method="get" class="form_terminar_req">
                                    <input  type="hidden" value="<%=iddgp%>" name="iddgp">
                                    <input type="hidden" value="Terminar" name="opc">
                                    <footer> 
                                        <button type="button" class="btn btn-success btn-labeled btn_terminar">
                                            <span class="btn-label"><i class="fa fa-arrow-circle-right"></i></span>
                                            TERMINAR
                                        </button>
                                    </footer>
                                    <input type="hidden" name="iddgp"  value="<%=iddgp%>" class="dgp" required="">
                                </form>
                                <%} else if (x == false & val_btn == 0) {
                                %>
                                <div class="alert alert-success fade in div_dgp"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-check"></i>Usted tiene una solicitud en proceso, una vez que se haya autorizado se podrá enviar el <strong>requerimiento</strong>.</div>
                                <%}%>
                                <%    }
                                    }%>
                            </div>
                        </section>
                        <!-- Modal -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel"><span class="btn-label"><i class="fa fa-envelope"></i></span> <strong>Solicitud de Requerimiento</strong></h4>
                                    </div>
                                    <div class="modal-body body_mdal_sol">
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                    </div>
                </center>    

            </div>

        </body>


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

        <!-- EASY PIE CHARTS 
        <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>-->

        <!-- SPARKLINES -
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>->

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT 
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->

        <!-- JQUERY SELECT2 INPUT -->
        <script src="../../js/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider 
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>-->

        <!-- browser msie issue fix -->
        <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="../../js/plugin/fastclick/fastclick.min.js"></script>

        <!--[if IE 8]>
    
        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
    
        <![endif]-->

        <!-- Demo purpose only 
        <script src="../../js/demo.min.js"></script>-->

        <!-- MAIN APP JS FILE -->
        <script src="../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin
        <script src="../../js/speech/voicecommand.min.js"></script> -->

        <!-- BUSINESS LOGIC PLUGINS -->
        <script src="../../js/Js_Formulario/Js_Form.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
        <script src="../../js/businessLogic/Dgp/Detalle/Js_Detallle_dgp-api.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript" charset="UTF-8"></script>
    
</html>
    <%} else {
            out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
        }
    %>
