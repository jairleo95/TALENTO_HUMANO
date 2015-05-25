<%@page import="pe.edu.upeu.application.dao_imp.InterfacePlazo_DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao.Plazo_DgpDAO"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%><%@page import="pe.edu.upeu.application.model.Detalle_Centro_Costo"%>
<%@page import="pe.edu.upeu.application.model.Centro_Costos"%>
<%@page import="pe.edu.upeu.application.dao.UsuarioDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.V_Det_DGP"%>
<%@page import="pe.edu.upeu.application.model.X_List_id_dgp"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.upeu.application.dao.DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDgpDAO"%>
<jsp:useBean id="LIST_ID_DGP" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="LIST_ID_USER" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Cargar_dcc_dgp" scope="application" class="java.util.ArrayList"/>
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
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css">  
        <title>Detalle DGP</title>
        <style type="text/css">
            table{
                //font-weight:bold ;
                width: 50px;
                font-size: 130%;
                font-color: black;
            }

            .text-info{
                text-align: left;

            }
            body{

                margin-left: auto;
                margin-right: auto  ;
                // width: 45%;
                // margin: 0;
            }

            .ct{
                text-align: center;   
            }

            #header{
                padding: 0%;
                font-family: verdana;
                font-size: 130%;
                text-align: center;
                color:#474747;

            }


            @media screen and (max-width: 3500px) {
                .div_dgp {
                    width: 65%;
                }
            }
            @media screen and (max-width: 800px) {
                .div_dgp {
                    width: auto;
                }



            </style>
        </head>
        <body onload="closedthis();">
            <script >
                $(document).ready(function() {
                    function exito(titulo, mensaje) {
                        $.smallBox({
                            title: titulo,
                            content: mensaje,
                            color: "#739E73",
                            iconSmall: "fa fa-cloud",
                            timeout: 3000
                        });
                    }
                    function closedthis() {
                        $.smallBox({
                            title: "¡Ficha de trabajador registrada correctamente!",
                            content: "ya puede visualizar toda la informacion del trabajador...",
                            color: "#739E73",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 6000
                        });
                    }
                });
            </script>

            <div id="main" role="main" style="margin-left: 0px;">
                <center>
                    <div id="content" >
                        <section id="widget-grid" class="">

                            <div class="row div_dgp">

                                <form action="../../dgp">
                                    <table class="table table-hover table-striped  table-responsive">
                                        <%
                                            String iddgp = "";
                                            HttpSession sesion = request.getSession(true);
                                            String idrol = (String) sesion.getAttribute("IDROL");%>

                                        <% if (LIST_ID_DGP.size() > 0) {
                                                for (int i = 0; i < LIST_ID_DGP.size(); i++) {
                                                    V_Det_DGP d = new V_Det_DGP();
                                                    d = (V_Det_DGP) LIST_ID_DGP.get(i);
                                                    iddgp = d.getId_dgp();
                                        %>
                                        <tr><td colspan="2" class="text-info table-bordered"><i class="fa fa-file"></i> REQUERIMIENTO : <%=d.getNo_req()%> </td></tr>
                                        <!--<label style="color: black; //font-family: cursive;"><h2><%=d.getNo_req()%></h2></label>
                                        --><tr><td  class="text-info table-bordered" style="text-align:align;">Fecha Desde:</td><td class="text-info table-bordered"><%=d.getFe_desde()%></td></tr>
                                        <tr ><td class="text-info table-bordered">Fecha Hasta:</td><td class="text-info table-bordered"><%=d.getFe_hasta()%></td></tr>
                                        <tr><td class="text-info table-bordered">Sueldo : S/.</td><td class="text-info table-bordered"><%=d.getCa_sueldo()%></td></tr>
                                        <tr><td class="text-info table-bordered">BEV: </td><td class="text-info table-bordered"><%=d.getDe_bev()%></td></tr>
                                        <tr><td class="text-info table-bordered">Bono Alimentario : S/.</td><td  class="text-info table-bordered"><%=d.getCa_bono_alimentario()%></td></tr>
                                        <tr><td class="text-info table-bordered">Bono Puesto : S/.</td><td  class="text-info table-bordered"><%=d.getCa_bonificacion_p()%></td></tr>
                                        <tr style="color: red;"><td class="text-info table-bordered" >Sueldo Total : S/.</td><td class=" table-bordered" style="color-text:red; "><%=(d.getCa_sueldo() + d.getCa_bono_alimentario() + d.getDe_bev() + d.getCa_bonificacion_p())%></td></tr>
                                        <tr><td  Class="text-info table-bordered">Departamento:</td><td class="text-info table-bordered"><%=d.getNo_dep()%></td></tr>
                                        <tr><td  Class="text-info table-bordered">Puesto:</td><td class="text-info table-bordered"><%=d.getNo_puesto()%></td></tr>
                                        <input type="hidden" name="iddgp" value="<%=d.getId_dgp().trim()%>">
                                        <input type="hidden" name="idreq" value="<%=d.getId_requerimiento().trim()%>">


                                        <!--<td><table class="table table-hover table-striped  table-responsive"><tbody><td class="text-info table-bordered">Centro de Costos: </td><td><a href="" >Ver Horario</a></td></tbody></table></td>-->
                                        <%if (d.getDe_antecedentes_policiales() != null) {%>
                                        <%if (d.getDe_antecedentes_policiales().equals("1")) {%>
                                        <tr><td class="text-info table-bordered">Antecedentes Policiales: </td><td class="text-info table-bordered">No</td></tr>
                                        <%} else {%>
                                        <tr><td class="text-info table-bordered">Antecedentes Policiales: </td><td class="text-info table-bordered">Si</td></tr>
                                        <%}%>
                                        <%} else {%>
                                        <tr><td class="text-info table-bordered">Antecedentes Policiales: </td><td class="text-info table-bordered">No registrado</td></tr>
                                        <%}%>
                                        <tr><td class="text-info table-bordered">Certificado de Salud: </td><td class="text-info table-bordered" ><%if (d.getEs_certificado_salud() != null) {
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
                                        <tr> <td  colspan="3" class="ct"><a href="../../contrato?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=enviar">Hacer Contrato</a></td></tr>
                                        <%}
                                            if (d.getEs_dgp().equals("1") & num.equals("0") & !"ROL-0006".equals(idrol.trim())) {%>
                                        <tr><td colspan="3" class="ct"><a href="">Ver Contrato</a></td></tr>
                                        <%}
                                            }%>

                                        <% if (d.getUs_creacion() != null) {%>
                                        <tr style="color: red;"><td class="text-info table-bordered">Creado por:</td><td colspan="2" class="text-info table-bordered"><%=d.getNo_usuario_crea()%></td></tr>
                                            <%} else {%>
                                        <tr style="color: red;"><td class="text-info table-bordered">Usuario Creador:</td><td colspan="2" class="text-info table-bordered">No Registrado</td></tr>
                                        <%}%>
                                        <%if (d.getUs_modif() != null) {%>
                                        <tr style="color: red;"><td class="text-info table-bordered">Ultima Modificacion por:</td><td class="table-bordered" colspan="2"><%=d.getNo_usuario_mod()%></td></tr>
                                            <%} else {%>
                                        <tr style="color: red;"><td class="text-info table-bordered">Modificaciones</td><td class=" table-bordered">Sin Modificaciones</td></tr>
                                        <%}%>


                                        <%if (d.getFe_modif() == null) {%>
                                        <tr><td class="text-info table-bordered">Fecha Modificacion</td><td colspan="2" class="text-info table-bordered">Sin Modificaciones</td></tr>
                                        <%} else {%>
                                        <tr><td class="text-info table-bordered">Fecha de Modificacion:</td><td colspan="2" class="text-info table-bordered"><%=d.getFe_modif()%></td></tr>
                                            <%}%>
                                            <%if (d.getFe_creacion() == null) {%>
                                        <tr><td class="text-info table-bordered">fecha Creacion:</td><td colspan="2" class="text-info table-bordered">Sin Modificaciones</td></tr>
                                        <%} else {%>
                                        <tr><td class="text-info table-bordered">Fecha de Creacion:</td><td colspan="2" class="text-info table-bordered"><%=d.getFe_creacion()%></td></tr>
                                            <%}%>

                                        <%if (Cargar_dcc_dgp.size() > 0) {
                                                for (int p = 0; p < Cargar_dcc_dgp.size(); p++) {
                                                    Detalle_Centro_Costo dcc = new Detalle_Centro_Costo();
                                                    dcc = (Detalle_Centro_Costo) Cargar_dcc_dgp.get(p);
                                        %>
                                        <tr><td class="text-info table-bordered">Centro de costo Nro <%=p + 1%></td><td class="text-info table-bordered"><%=dcc.getDe_centro_costo()%></td></tr>
                                            <%}
                                            } else {%>
                                        <tr><td class="text-info table-bordered">Centro de costo </td><td class="text-info table-bordered">No tiene Centro de costo </td></tr>
                                        <%}%>

                                        <%if (d.getLi_motivo() != null) {%>

                                        <tr><td class="text-info table-bordered">Motivo :</td>
                                            <% if (d.getLi_motivo().equals("1")) {%>
                                            <td colspan="2" class="text-info table-bordered">Trabajador Nuevo</td></tr>
                                            <%}
                                            if (d.getLi_motivo().equals("2")) {%>
                                        <td colspan="2" class="text-info table-bordered">Renovación</td></tr>
                                        <%}
                                            }
                                            if (d.getEs_mfl().equals("1")) {%>
                                        <tr><td class="text-info table-bordered">MFL:</td><td colspan="2" class="text-info table-bordered">Si</td></tr>
                                        <%}
                                            if (d.getEs_mfl().equals("0")) {%>
                                        <tr><td class="text-info table-bordered">MFL:</td><td colspan="2" class="text-info table-bordered">No</td></tr>
                                        <%}%>

                                        <input type="hidden" name="idtr" value="<%=request.getParameter("idtr")%>">
                                        <input type="hidden" name="opc" value="MODIFICAR REQUERIMIENTO">   
                                        <% if (idrol.trim().equals("ROL-0002") | idrol.trim().equals("ROL-0005") | idrol.trim().equals("ROL-0003")) {%>
                                    </table>
                                    <table>
                                        <tr><td> </td><td><a class="btn btn-primary btn-labeled" href="../../documento?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=Ver_Documento"><span class="btn-label"><i class="glyphicon glyphicon-info-sign"></i></span>Ver Documentos</a></td><td><a class="btn btn-primary btn-labeled" href="../../horario?iddgp=<%=d.getId_dgp()%>&opc=Listar"><span class="btn-label"><i class="glyphicon glyphicon-info-sign"></i></span>Ver Horario</a></td></tr><%}%>
                                    </table>
                                    <%}
                                        }%> 
                                </form>


                            </div>


                            <div class="row">

                                <% if (request.getParameter("opc") != null) {
                                        if (request.getParameter("opc").equals("reg_doc")) {

                                %>

                                <h3 style="text-align: center;">Enviar Requerimiento</h3> 
                                <form action="../../dgp" method="get" class="form_terminar_req">
                                    <input  type="hidden" value="<%=iddgp%>" name="iddgp">
                                    <input type="hidden" value="Terminar" name="opc">
                                    <footer> <%
                                        InterfacePlazo_DgpDAO p = new Plazo_DgpDAO();
                                        int val_btn = p.Validar_cumple_dias_pt2(iddgp.trim());
                                        %>
                                        <%if (val_btn == 0) {

                                        %>
                                        <label>Usted no ha cumplido con los dias de tolerancia del plazo <strong>Inicio de contrato</strong>, porfavor envie solicitud para la nueva fecha de inicio del trabajador.</label><br>
                                        <%}%>
                                        <button class="btn btn-primary btn-labeled" data-toggle="modal" type="button" data-target="#myModal"><span class="btn-label"><i class="fa fa-envelope"></i></span>
                                            SOLICITUD DE PLAZO
                                        </button>

                                        <button type="button" class="btn btn-success btn-labeled btn_terminar" <%if (val_btn == 0) {
                                                out.print("disabled");
                                            }
                                                %> ><span class="btn-label"><i class="fa fa-arrow-circle-right"></i></span>
                                            TERMINAR
                                        </button>
                                    </footer>
                                </form>
                                <%}
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
                                    <div class="modal-body">
                                        <form id="checkout-form" class="smart-form solicitud_plazo">
                                            <div class="row">

                                                <section class="col col-4">
                                                    <label class="label">Tipo de Plazo :</label>
                                                    <label class="select"> 
                                                        <select name="tipo" class="tipo" required="">
                                                            <option value=''>[SELECCIONE]</option>
                                                            <option value='2'>Ingreso a planilla</option>
                                                            <option value='1'>Inicio de Contrato</option>

                                                        </select>          
                                                    </label>
                                                </section>
                                                <section class="col col-4">
                                                    <label class="label">Plazo :</label>
                                                    <label class="select"> 
                                                        <select name="plazo" class="plazo" required="">
                                                            <option value='' selected >[SELECCIONE]</option>
                                                        </select>          
                                                    </label>
                                                </section>
                                                <section class="col col-4">
                                                    <label class="label lb_fecha_solicitud">Fecha de Inicio :</label>
                                                    <label class="input"> 

                                                        <input type="date" name="desde"  class="fe_inicio" required="">
                                                        <input type="hidden" name="tipo_fecha"  class="tipo_fecha" value="date" required="">
                                                        <input type="hidden" name="iddgp"  value="<%=iddgp%>" class="dgp" required="">
                                                    </label>
                                                </section>
                                            </div>
                                            <section >
                                                <label class="label">Motivo :</label>
                                                <label class="textarea"> 										
                                                    <textarea rows="3" class="comentario" name="descripcion" placeholder="" required=""></textarea> 
                                                </label>
                                            </section>
                                            <footer>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                                    Cancelar
                                                </button>
                                                <button type="button" class="btn btn-primary sbm_solicitud" >
                                                    Enviar
                                                </button>
                                            </footer>

                                        </form>  </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                    </div>
                </center>    

            </div>

        </body>
        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
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
        <script src="../../js/plugin/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <script src="../../js/Js_Formulario/Js_Form.js" type="text/javascript"></script>


        <script type="text/javascript">
                // DO NOT REMOVE : GLOBAL FUNCTIONS!
                $(document).ready(function() {
                    pageSetUp();
                    $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function() {
                        $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                    });
                    $(".tipo").change(function() {
                        if ($(this).val() == '2') {
                            $(".fe_inicio").attr("type", "month");
                            $(".lb_fecha_solicitud").text("Mes :");
                            $(".tipo_fecha").val("month");
                        }
                        if ($(this).val() == '1') {
                            $(".fe_inicio").attr("type", "date");
                            $(".lb_fecha_solicitud").text("Fecha de Inicio :");
                            $(".tipo_fecha").val("date");
                        }
                        //alert();
                        list_select($(".plazo"), "../../plazo_dgp?opc=List_id_plazo", $(".solicitud_plazo").serialize(), "1", $(".tipo").val());
                    });
                    $(".btn_terminar").click(function() {
                        $.SmartMessageBox({
                            title: "¡Advertencia!",
                            content: "¿Esta seguro de enviar la solicitud?",
                            buttons: '[No][Si]'
                        }, function(ButtonPressed) {
                            if (ButtonPressed === "Si") {
                                $(".form_terminar_req").submit();
                            }
                            if (ButtonPressed === "No") {
                            }
                        });
                    });
                    $(".sbm_solicitud").click(function(e) {
                        if ($(".solicitud_plazo").valid() == true) {
                            $.SmartMessageBox({
                                title: "¡Advertencia!",
                                content: "¿Esta seguro de enviar la solicitud?",
                                buttons: '[No][Si]'
                            }, function(ButtonPressed) {
                                if (ButtonPressed === "Si") {
                                    $.ajax({
                                        url: "../../solicitud_requerimiento",
                                        type: "post",
                                        data: $(".solicitud_plazo").serialize() + "&opc=Registrar_solicitud"
                                    }).done(function() {
                                        $('.solicitud_plazo')[0].reset();
                                        var $p = $(this).parent().parent();
                                        $p.removeClass('has-success');
                                        $("section > label").removeClass('state-success');
                                        /*vuelve a cargar el selector para evitar enviar solicitudes del mismo plazo*/
                                        list_select($(".plazo"), "../../plazo_dgp?opc=List_id_plazo", $(".solicitud_plazo").serialize(), "1", $(".tipo").val());
                                        $.smallBox({
                                            title: "¡Exito!",
                                            content: "<i class='fa fa-clock-o'></i> <i>La solicitud ha sido enviada exitosamente...</i>",
                                            color: "#659265",
                                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                            timeout: 4000
                                        });
                                    }).error(function() {
                                        $.smallBox({
                                            title: "¡Error!",
                                            content: "<i class='fa fa-clock-o'></i> <i>La solicitud no ha podido ser enviada...</i>",
                                            color: "#C46A69",
                                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                            timeout: 4000
                                        });
                                    });
                                }
                                if (ButtonPressed === "No") {
                                }

                            });

                        }

                    });
                    /*
                     * Autostart Carousel
                     */
                    $('.carousel.slide').carousel({
                        interval: 3000,
                        cycle: true
                    });
                    $('.carousel.fade').carousel({
                        interval: 3000,
                        cycle: true
                    });

                    // Fill all progress bars with animation

                    $('.progress-bar').progressbar({
                        display_text: 'fill'
                    });


                    /*
                     * Smart Notifications
                     */
                    $('#eg1').click(function(e) {

                        $.bigBox({
                            title: "Big Information box",
                            content: "This message will dissapear in 6 seconds!",
                            color: "#C46A69",
                            //timeout: 6000,
                            icon: "fa fa-warning shake animated",
                            number: "1",
                            timeout: 6000
                        });

                        e.preventDefault();

                    })

                    $('#eg2').click(function(e) {

                        $.bigBox({
                            title: "Big Information box",
                            content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                            color: "#3276B1",
                            //timeout: 8000,
                            icon: "fa fa-bell swing animated",
                            number: "2"
                        });

                        e.preventDefault();
                    })

                    $('#eg3').click(function(e) {

                        $.bigBox({
                            title: "Shield is up and running!",
                            content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                            color: "#C79121",
                            //timeout: 8000,
                            icon: "fa fa-shield fadeInLeft animated",
                            number: "3"
                        });

                        e.preventDefault();

                    })

                    $('#eg4').click(function(e) {

                        $.bigBox({
                            title: "Success Message Example",
                            content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                            color: "#739E73",
                            //timeout: 8000,
                            icon: "fa fa-check",
                            number: "4"
                        }, function() {
                            closedthis();
                        });

                        e.preventDefault();

                    })



                    $('#eg5').click(function() {

                        $.smallBox({
                            title: "Ding Dong!",
                            content: "Someone's at the door...shall one get it sir? <p class='text-align-right'><a href='javascript:void(0);' class='btn btn-primary btn-sm'>Yes</a> <a href='javascript:void(0);' class='btn btn-danger btn-sm'>No</a></p>",
                            color: "#296191",
                            //timeout: 8000,
                            icon: "fa fa-bell swing animated"
                        });

                    });



                    $('#eg6').click(function() {

                        $.smallBox({
                            title: "Big Information box",
                            content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                            color: "#5384AF",
                            //timeout: 8000,
                            icon: "fa fa-bell"
                        });

                    })

                    $('#eg7').click(function() {

                        $.smallBox({
                            title: "James Simmons liked your comment",
                            content: "<i class='fa fa-clock-o'></i> <i>2 seconds ago...</i>",
                            color: "#296191",
                            iconSmall: "fa fa-thumbs-up bounce animated",
                            timeout: 4000
                        });

                    })

                    function closedthis() {
                        $.smallBox({
                            title: "Great! You just closed that last alert!",
                            content: "This message will be gone in 5 seconds!",
                            color: "#739E73",
                            iconSmall: "fa fa-cloud",
                            timeout: 5000
                        });
                    }

                    /*
                     * SmartAlerts
                     */
                    // With Callback

                    // With Input
                    $("#smart-mod-eg2").click(function(e) {

                        $.SmartMessageBox({
                            title: "Smart Alert: Input",
                            content: "Please enter your user name",
                            buttons: "[Accept]",
                            input: "text",
                            placeholder: "Enter your user name"
                        }, function(ButtonPress, Value) {
                            alert(ButtonPress + " " + Value);
                        });

                        e.preventDefault();
                    })
                    // With Buttons
                    $("#smart-mod-eg3").click(function(e) {

                        $.SmartMessageBox({
                            title: "Smart Notification: Buttons",
                            content: "Lots of buttons to go...",
                            buttons: '[Need?][You][Do][Buttons][Many][How]'
                        });

                        e.preventDefault();
                    })
                    // With Select
                    $("#smart-mod-eg4").click(function(e) {

                        $.SmartMessageBox({
                            title: "Smart Alert: Select",
                            content: "You can even create a group of options.",
                            buttons: "[Done]",
                            input: "select",
                            options: "[Costa Rica][United States][Autralia][Spain]"
                        }, function(ButtonPress, Value) {
                            alert(ButtonPress + " " + Value);
                        });

                        e.preventDefault();
                    });

                    // With Login
                    $("#smart-mod-eg5").click(function(e) {

                        $.SmartMessageBox({
                            title: "Login form",
                            content: "Please enter your user name",
                            buttons: "[Cancel][Accept]",
                            input: "text",
                            placeholder: "Enter your user name"
                        }, function(ButtonPress, Value) {
                            if (ButtonPress == "Cancel") {
                                alert("Why did you cancel that? :(");
                                return 0;
                            }

                            Value1 = Value.toUpperCase();
                            ValueOriginal = Value;
                            $.SmartMessageBox({
                                title: "Hey! <strong>" + Value1 + ",</strong>",
                                content: "And now please provide your password:",
                                buttons: "[Login]",
                                input: "password",
                                placeholder: "Password"
                            }, function(ButtonPress, Value) {
                                alert("Username: " + ValueOriginal + " and your password is: " + Value);
                            });
                        });

                        e.preventDefault();
                    });


                })

        </script>

        <!-- Your GOOGLE ANALYTICS CODE Below -->
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();

        </script>

    </html>
    <%} else {
            response.sendRedirect("/TALENTO_HUMANO/");
        }
    %>
