
<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>
<%@page import="pe.edu.upeu.application.dao.TrabajadorDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.dao.Tipo_DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.model.Tipo_Documento"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceTipo_DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<%@page import="pe.edu.upeu.application.web.controller.CCriptografiar"%>
<%@page import="pe.edu.upeu.application.web.controller.CConversion"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.Empleado"%>
<%@page import="javax.print.DocFlavor.STRING"%>
<%@page import="pe.edu.upeu.application.model.Auto_Mostrar"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<jsp:useBean id="ListaridTrabajador" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Auto_mostrar" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="id_empleadox_ide" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Detalle de Trabajador</title>
        <!-- Estilos plantilla-->
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
        <link href="../../css/your_style.css" rel="stylesheet" type="text/css"/>
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
        <link rel="stylesheet" type="text/css" href="../../js/shadowbox/shadowbox.css"/>
        <link rel="stylesheet" type="text/css" href=".../../js/shadowbox/style.css"/>
        <style type="text/css">
            body{

                margin-left: auto;
                margin-right: auto  ;
                width: 95%;
                // margin: 0;
            }
            .autoHeight{
                border-style:none;            
            }

            .ui-progressbar {
                position: relative;
            }
            .progress-label {
                position: absolute;
                left: 50%;
                top: 4px;
                font-weight: bold;
                text-shadow: 1px 1px 0 #fff;
            }
        </style>
    </head>
    <%          if (request.getParameter("ms") != null) {
            if (request.getParameter("ms").equals("ok")) {
    %>
    <body onload="closedthis2();">
        <%}
            if (request.getParameter("ms").equals("t")) {
        %>
    <body onload="closedthis();">
        <%}
        } else {%> 
    <body >
        <%}%>
        <%
            V_Ficha_Trab_Num_C t = new V_Ficha_Trab_Num_C();
            t = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(0);
            String idtr = t.getId_trabajador().trim();
            String aut = request.getParameter("aut");
            HttpSession sesion = request.getSession(true);
            String idp = (String) sesion.getAttribute("p");
            String idrol = (String) sesion.getAttribute("IDROL");
            String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
            String idtr_session = (String) sesion.getAttribute("IDTR");
            String cl = (String) sesion.getAttribute("CL");
            String user = (String) sesion.getAttribute("USER");
            String iddgp = request.getParameter("dgp");
            String cod = request.getParameter("c");
            String iddrp = request.getParameter("drp");
            String id_pasos = request.getParameter("pas");
            String nropaso = request.getParameter("np");
            String edit = request.getParameter("edit");
        %>
        <!--Begin Detalle Trabajador-->

        <div class="jarviswidget jarviswidget-color-darken" id="wid-id-3" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false">
            <header>
                <span class="widget-icon"> <i class="fa fa-user"></i> </span>
                <h2 class="font-md"><strong>Datos del</strong> <i>Trabajador</i></h2>				

            </header>
            <%                String hl = "";
                String academico = request.getParameter("academico");
                if (academico != null) {
                    if (Boolean.valueOf(academico) == true) {
                        hl = request.getParameter("hl");
            %>
            <div>
                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
                    Trabajador Nuevo
                </button>
                <button class="btn btn-default btn-sm btn_procesar" type="button" style="display:none">
                    Procesar Carga Academica
                </button>
            </div>
            <%}
                }%>
            <div class="row" style="padding-bottom: 10px;">
                <div class="col-md-4">
                    <div class="media">
                        <!--  upload foto --> 
                        <form action="../../foto" method="POST" enctype="multipart/form-data" class="form-subir-foto">
                            <input type="hidden" name="idtr" class="idtr" id="input-file" value="<%=t.getId_trabajador()%>">
                            <input style="display:none" class="file-foto" type="file" name="archivo" required="">
                        </form>
                        <a class="avatar mustang-gallery pull-left" href="../../imagenes/avatar_default.jpg" ><img src="../../imagenes/avatar_default.jpg" class="borde" width="100" height="100" ></a>
                        <div class="foto-user" style="display: none;">
                        </div>
                        <a class="ver_foto btn bg-color-purple txt-color-white btn-xs">Cambiar Imagen</a>           
                        <div class="media-body">
                            <%
                                CConversion c = new CConversion();
                                for (int index = 0; index < ListaridTrabajador.size(); index++) {
                                    V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                                    trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);
                            %>
                            <button data-toggle="modal" data-target="#myModal" id="btn-mostrar" hidden="">asas</button>
                            <strong>  Nombre : </strong><%=trb.getNo_trabajador().toUpperCase()%><br>
                            <strong>Apellido Paterno :</strong> <%=trb.getAp_paterno().toUpperCase()%><br>
                            <strong>Apellido Materno :</strong> <%=trb.getAp_materno().toUpperCase()%><br>
                            <strong>Fecha de Nacimiento :</strong><%=c.convertFecha5(trb.getFe_nac())%><br>
                            <%if (idrol.trim().equals("ROL-0009")) {%>

                            <strong>Tipo de documento:</strong> <%=c.convertFecha5(trb.getFe_nac())%><br>
                            <strong>Tipo Documento: </strong>
                            <%InterfaceTipo_DocumentoDAO itd = new Tipo_DocumentoDAO();
                                for (int k = 0; k < itd.Listar_tipo_doc().size(); k++) {
                                    Tipo_Documento td = new Tipo_Documento();
                                    td = (Tipo_Documento) itd.Listar_tipo_doc().get(k);
                                    if (trb.getTi_doc() != null) {
                                        if (td.getId_tipo_doc_ident().trim().equals(trb.getTi_doc().trim())) {
                                            out.print(td.getDe_tdoc_abreviada());
                                        }
                                    } else {
                                        out.print("No Registrado");
                                    }
                                }
                            %><br>
                            <strong>Numero de documento:</strong> <%=trb.getNu_doc()%><br>
                            <%}%>
                        </div>

                    </div>

                </div>
                <%
                    String ID_ROL = (String) sesion.getAttribute("IDROL");
                %>
                <!-- INICIO codigos aps y huella-->
                <input type="hidden"  class="idtr" value="<%=t.getId_trabajador()%>">
                <div class="col-md-4">
                    <div class='row row_cod_aps'>
                    </div>
                    <div class='row row_cod_huella'>
                    </div>
                    <div class="row">
                        <%if (ID_ROL.equals("ROL-0001")) {%>
                        <div class="col-md-4"><strong>Descuento de Diezmo</strong></div>
                        <div class="col-md-8 div_input_diezmo"></div>
                        <%} else {%>
                        <div class="col-md-8"><strong>Descuento de Diezmo</strong></div>
                        <div class="col-md-4"><%=((trb.getEs_diezmo().equals("0")) ? "No" : "Si")%></div>
                        <%}%>
                    </div>
                    <%if (iddgp != null) {
                    %>
                    <input type="hidden" class="dgp" value="<%=iddgp%>" >
                    <div class='row smart-form col_procesar_asigFam'>

                    </div>
                    <div class='row smart-form col_procesar_sis'>

                    </div>
                    <%}%>
                    <div class="row_afp_sp"></div>

                </div>
                <div class="col-md-4">
                    <% InterfaceTrabajadorDAO iTr = new TrabajadorDAO();
                        int porcentaje = iTr.ShowPorcentageTrabajador(idtr);%>
                    <center><strong>Datos Completados: </strong><br>
                        <div class="showPorcentage">
                            <div class="easy-pie-chart txt-color-blue easyPieChart pcDatosCompTrabajador" data-percent="<%=porcentaje%>" data-pie-size="100"  >
                                <span class="percent percent-sign txt-color-blue font-lg semi-bold spDatosCompTrabajador"><%=porcentaje%></span>
                            </div>

                        </div>

                    </center>
                </div>
            </div>
            <!-- FIN DE codigos aps y huella-->
            <!-- widget div-->


            <div class="row" style="padding: 0px;">

                <ul  class="nav nav-tabs bordered tab_detalle_trabajador">
                    <%
                        if (List_Auto_mostrar.size() == 1 && aut != null) {
                            for (int r = 0; r < List_Auto_mostrar.size(); r++) {
                                Auto_Mostrar a = new Auto_Mostrar();
                                a = (Auto_Mostrar) List_Auto_mostrar.get(r);
                    %>
                    <li  class="active" >
                        <a href="<%=a.getDi_url() + "&iddgp=" + iddgp + "&idtr=" + trb.getId_trabajador()%>" target="myframe2"><i class="fa fa-file-text fa-gear"></i> Datos de Requerimientos</a>
                    </li>
                    <%}
                        }%>
                    <%if (iddep != null) {

                            if ((iddep.equals("DPT-0019") || idrol.trim().equals("ROL-0012") || idrol.trim().equals("ROL-0005"))) {
                    %>
                    <li>
                        <a href="../../contrato?idtr=<%=idtr%>&opc=Detalle_Contractual" target="myframe2"  ><i class="fa fa-file-text fa-gear"></i> Información Contractual </a>
                    </li>
                    <%}
                        }%>
                    <li >
                        <a href="Datos_Generales.jsp?edit=<%=edit%>" target="myframe2"  ><i class="fa fa-male fa-gear"></i> Información General </a>
                    </li>
                    <li>
                        <a href="Aspecto_Academico.jsp?edit=<%=edit%>" target="myframe2"><i class="fa fa-graduation-cap fa-gear"></i> Aspecto Académico</a>
                    </li>
                    <li >
                        <a href="../../trabajador?idtr=<%=idtr%>&opc=Listar_Asp_Social" target="myframe2"><i class="fa fa-home fa-gear"></i> Aspecto Social </a>
                    </li>
                    <li>
                        <a href="../../familiar?idtr=<%=idtr%>&opc=Detalle_Familiar" target="myframe2"><i class="fa fa-group fa-gear"></i> Familiares </a>
                    </li>
                    <%if (!idrol.trim().equals("ROL-0013")) {
                    %>
                    <li >
                        <a href="../../dgp?idtr=<%=idtr%>&opc=List_Dgp_Tr" target="myframe2"><i class="fa fa-file-o fa-gear"></i> Historial de Requerimientos </a>
                    </li>
                    <%}%>
                    <li>
                        <a href="../../trabajador?idtr=<%=idtr%>&opc=Documento_Trabajador" target="myframe2"><i class="fa fa-file fa-gear"></i> Documentación </a>
                    </li>

                    <%if (idrol.trim().equals("ROL-0007") | ID_ROL.trim().equals("ROL-0001")) {
                    %>
                    <li >
                        <a href="../../empleado?opc=Eva_Emp&idtr=<%=idtr%>" target="myframe2"><i class="fa fa-file-text fa-gear"></i> Evaluación de Empleado</a>
                    </li>
                    <%}%>
                    <%if (idtr.equals(idtr_session)) {

                    %>
                    <li>
                        <%if (cl.trim().equals(user.trim())) {
                        %>
                        <a href="../../trabajador?opc=Form_Cambiar_Clave" target="myframe2" rel="" data-placement="top" data-original-title="<h1><b>One</b> <em>Really</em> big tip!</h1>" data-html="true" ><i class="fa fa-lock"></i> Contraseña <span class="badge bg-color-red pull-right inbox-badge">¡Cambiar!</span></a>
                        <%} else {%>
                        <a href="../../trabajador?opc=Form_Cambiar_Clave" target="myframe2"  ><i class="fa fa-lock"></i> Contraseña</a>
                        <%}%>
                    </li>
                    <%}%>
                    <%if (idrol.trim().equals("ROL-0002") | ID_ROL.trim().equals("ROL-0001")) {
                    %>
                    <li>
                        <a href="../../contrato?idtr=<%=idtr%>&opc=SI_CONNTRATO" target="myframe2"><i class="fa fa-male fa-gear"></i> Imprimir / Subir Contratos </a>
                    </li>
                    <%}%>
                </ul>

                <div id="myTabContent1" class="tab-content">
                    <%  if (List_Auto_mostrar.size() == 1 && aut != null) {
                            for (int r = 0; r < List_Auto_mostrar.size(); r++) {
                                Auto_Mostrar a = new Auto_Mostrar();
                                a = (Auto_Mostrar) List_Auto_mostrar.get(r);
                    %>
                    <iframe id="myframe2" name="myframe2" class="autoHeight" src="<%=a.getDi_url() + "&iddgp=" + iddgp + "&idtr=" + trb.getId_trabajador()%>" width="100%" height="100%" ></iframe>
                    <%}
                        List_Auto_mostrar.clear();
                    } else {%>
                    <iframe id="myframe2" name="myframe2" width="100%" height="800" scrolling="si"  frameborder="0" src="Datos_Generales.jsp?edit=<%=edit%>"></iframe>
                    <%}%>
                </div>
            </div>

            <!-- end widget content -->


            <!-- end widget div -->

        </div>        
        <!-- end TABS-->
        <div >
            <%

                if (aut != null) {
                    if (aut.equals("1")) {


            %>
            <center>
                <form class="form-aut" action="../../autorizacion" method="post" > 
                    <table > 
                        <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >           
                        <input type="hidden" name="NROPASO" value="<%=nropaso%>"  >                
                        <input type="hidden" name="COD" value="<%=cod%>"  >               
                        <input type="hidden" name="PUESTO_ID" value="<%=idp%>" >  
                        <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>"  >  
                        <input type="hidden" name="IDPASOS" value="<%=id_pasos%>"   >
                        <tr><td><input type="hidden" name="opc"  class="submit" value="Aceptar"/></td></tr>
                                <%
                                    if (idrol.trim().equals("ROL-0006")) {
                                        int vnc = Integer.parseInt(request.getParameter("vnc"));
                                        if (vnc > 0) {
                                %>
                        <button class="btn btn-labeled btn-success btn-autor" type="submit">
                            <span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span>PROCESAR  </button>
                                <%
                                    }
                                } else {%>

                        <!--INICIO DE  validacion-->
                        <div class="validacionBtnAutorizar"></div><br>

                        <!--fin validacion-->
                        <%}%>
                    </table>
                </form>

                <form class="form-rech" action="../../autorizacion" method="post">
                    <table>
                        <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >           
                        <input type="hidden" name="NROPASO" value="<%=nropaso%>"  >                
                        <input type="hidden" name="COD" value="<%=cod%>"  >               
                        <input type="hidden" name="PUESTO_ID" value="<%=idp%>" >  
                        <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>"  >  
                        <input type="hidden" name="IDPASOS" value="<%=id_pasos%>" 
                               <tr><td><input type="hidden" name="opc"  class="submit" value="Rechazar"/></td></tr>
                        <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close-form close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel"> Motivo </h4>
                                    </div>
                                    <div class="modal-body">
                                        <legend>Comentario : </legend>
                                        <div class="area-coment" style="display: block;">
                                            <textarea rows="3" placeholder="Inserte Comentario" maxlength="200" required="" class="mensaje" name="comentario"></textarea>
                                            <div class="contador">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary btn-conti"> Continuar </button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal" > Cancel </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a data-toggle="modal" href="#myModal6" class="btn btn-labeled btn-danger"><span class="btn-label"><i class="glyphicon glyphicon-remove"></i></span>RECHAZAR</a>
                    </table>
                </form>   
            </center>
            <%}
                }
            %>
        </div>
        <%    if (academico != null) {%>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Carga Academica</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form_carga_academica">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="category"> Fecha de Inicio:</label>
                                        <input type="date" class="form-control fe_desde_p" value="" name="DESDE" required />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="category"> Fecha de Cese:</label>
                                        <input type="date" class="form-control fe_hasta_p" value="" name="HASTA" required />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="category"> Tipo de Hora Pago:</label>
                                        <input type="text" class="form-control ti_hp_docente" value="25" placeholder="0.0"  name="TI_HORA_PAGO" required />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="category"> Horas Laborables:</label>
                                        <%
                                            if (hl != null) {
                                                if (Boolean.valueOf(academico) == true) {
                                        %>
                                        <input type="text" class="form-control hl_docente" value="0" name="HL" placeholder="0" required />
                                        <%} else {%>
                                        <input type="text" class="form-control hl_docente" value="0" name="HL" placeholder="0" required />
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                            <label for="category" > <strong>CUOTAS</strong></label>
                            <br>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="cuota_docente">

                                        </div>
                                        <input type="hidden" name="PUESTO" value="PUT-000482" >
                                        <input type="hidden" name="REQ" value="REQ-0018">
                                        <input type="hidden" name="IDTR" value="<%=idtr%>" >
                                        <input type="hidden" name="eap" value="<%=request.getParameter("eap")%>" >
                                        <input type="hidden" name="facultad" value="<%=request.getParameter("facultad")%>" >
                                        <input type="hidden" name="dgp"  class="dgp" value="<%=request.getParameter("dgp")%>" >
                                        <input type="hidden" name="proceso" class="proceso" value="<%=request.getParameter("proceso")%>" >
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                    Cancelar
                                </button>
                                <button type="button" class="btn btn-primary btn_guardar_ca"  data-dismiss="modal">
                                    Guardar
                                </button>

                            </div>
                        </form>

                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

        <%}%>
        <%}%> <%}%>
        <div class="div_dialog"></div>
        <input  value="<%out.print(FactoryConnectionDB.url_archivos);%>" type="hidden" class="url_archivo"/> 
        <!-- #dialog-message -->
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

        <!-- SPARKLINES 
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>-->

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT 
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->

        <!-- JQUERY SELECT2 INPUT 
        <script src="../../js/plugin/select2/select2.min.js"></script>-->

        <!-- JQUERY UI + Bootstrap Slider 
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>-->

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

        <!-- PAGE RELATED PLUGIN(S) 
        <script src="../../js/plugin/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <script src="../../js/Js_Formulario/Js_Form.js" type="text/javascript"></script>
        
        
        <script src="../../js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="../../js/plugin/fuelux/wizard/wizard.min.js"></script>
        -->

        <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>


        <!-- PAGE RELATED PLUGIN(S)
         <script src="../../js/plugin/maxlength/bootstrap-maxlength.min.js"></script>
         <script src="../../js/plugin/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
         <script src="../../js/plugin/clockpicker/clockpicker.min.js"></script>
         <script src="../../js/plugin/bootstrap-tags/bootstrap-tagsinput.min.js"></script>
         <script src="../../js/plugin/noUiSlider/jquery.nouislider.min.js"></script>
         <script src="../../js/plugin/ion-slider/ion.rangeSlider.min.js"></script>
         <script src="../../js/plugin/colorpicker/bootstrap-colorpicker.min.js"></script>
         <script src="../../js/plugin/knob/jquery.knob.min.js"></script>
         <script src="../../js/plugin/x-editable/moment.min.js"></script>
         <script src="../../js/plugin/x-editable/jquery.mockjax.min.js"></script>
         <script src="../../js/plugin/x-editable/x-editable.min.js"></script>
         <script src="../../js/plugin/typeahead/typeahead.min.js"></script>
         <script src="../../js/plugin/typeahead/typeaheadjs.min.js"></script> -->
        <script type="text/javascript" src="../../js/JQuery/jquery.autoheight.js"></script>
        <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
        <script src="../../js/shadowbox/shadowbox.js" type="text/javascript"></script>
        <script src="../../js/JQuery/jquery.session.js" type="text/javascript"></script>
        <script type="text/javascript" src="../../js/Js_Trabajador/Js_Trabajador.js"></script>
        <script type="text/javascript" src="../../js/Js_Autorizacion/Js_Autorizacion.js"></script>
        <script type="text/javascript" src="../../js/Js_Academico/Js_Carga_Academica.js"></script>
        <script type="text/javascript">
        var url_archivos = $(".url_archivo").val() + "Fotos/";
        var idtrl = $(".idtr").val().trim();
        var repeat = 0;

        function closedthis() {
            $.smallBox({
                title: "¡Ficha de trabajador registrada correctamente!",
                content: "ya puede visualizar toda la informacion del trabajador...",
                color: "#739E73",
                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                timeout: 6000
            });
        }
        function closedthis2() {
            $.smallBox({
                title: "¡Contrato Especial registrado con exito!",
                content: "ya puede visualizar el contrato en Detalle del Trabajador",
                color: "#739E73",
                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                timeout: 6000
            });
        }
        function validar_shadowbox() {

            Shadowbox.init({
                overlayOpacity: 0.9
            });
            Shadowbox.setup("a.mustang-gallery", {
                gallery: "mustang",
                continuous: true,
                counterType: "skip"
            });
        }
        $(document).ready(function () {
            getAvatar("perfil", idtrl);
            getAvatar("todo", idtrl);

            Listar_Cod_Huella();
            Listar_Cod_APS();
            ShowCbk_Procesar_Ind($(".dgp").val());
            ValBtnAutorizarDgp($(".idtr").val(), $(".validacionBtnAutorizar"));
            pageSetUp();
            $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
            });
            $(".tab_detalle_trabajador li").click(function () {
                $(".tab_detalle_trabajador li").removeClass("active");
                $(this).addClass("active");
            });
            validar_shadowbox();
            setTimeout(function () {
                document.getElementById('myframe2').onload = function () {
                    porcentaje_datos($(".idtr").val());
                };
            }, 5000);
            showEsDiezmo();
            ShowAFP_SP();


            $(".btnCodigoAPS").click(function () {
                Actualizar_Cod_APS();
            });

            $(".btn-conti").click(function (e) {
                $.SmartMessageBox({
                    title: "Alerta de Confirmación",
                    content: "¿Está totalmente seguro de rechazar este requerimiento?",
                    buttons: '[No][Si]'
                }, function (ButtonPressed) {
                    if (ButtonPressed === "Si") {
                        $(".form-rech").submit();
                        //$(".form-rech").submit();
                    }
                    if (ButtonPressed === "No") {
                        return false;
                    }
                });
                e.preventDefault();

            });

            /*carga academica*/
            $(".fe_desde_p, .fe_hasta_p, .hl_docente, .ti_hp_docente").change(function () {
                calcularCuotasDocente($(".fe_desde_p").val(), $(".fe_hasta_p").val(), $(".hl_docente").val(), $(".ti_hp_docente").val());
            });
         
            $(".btn_guardar_ca").click(function () {
                $.ajax({
                    url: "../../carga_academica",
                    type: "POST",
                    data: "opc=Registrar_CA&" + $(".form_carga_academica").serialize()
                }).done(function (data) {
                  //  var arr_id = ids.split(":");
                    alert("Registrado con exito!...");
                    $(".proceso").val(data.proceso);
                    $(".dgp").val(data.dgp);
                    $(".btn_procesar").show();
                }).fail(function (e) {
                    alert("Error: " + e);
                });
            });
            $(".btn_procesar").click(function () {
                ProcesarCargaAcademica($(".dgp").val(), $(".proceso").val());
            });
            /*FIN carga academica*/

            /*AUTORIZACIONES*/
            $(".btn-autor").click(function (e) {
                $.SmartMessageBox({
                    title: "¡Alerta de Confirmación!",
                    content: "¿Está totalmente seguro de autorizar este requerimiento?",
                    buttons: '[No][Si]'
                }, function (ButtonPressed) {
                    if (ButtonPressed === "Si") {
                        $(".form-aut").submit();
                        window.parent.sendMessage();
                    }
                    if (ButtonPressed === "No") {
                        return false;
                    }
                });
                e.preventDefault();
            });
            $(".btn-rech").click(function (e) {
                $.SmartMessageBox({
                    title: "Alerta de Confirmación!",
                    content: "¿Está totalmente seguro de rechazar este requerimiento?",
                    buttons: '[No][Si]'
                }, function (ButtonPressed) {
                    if (ButtonPressed === "Si") {
                        $(".btn-mos").click();
                        $(".form-rech").submit();
                    }
                    if (ButtonPressed === "No") {
                        return false;
                    }
                });
                e.preventDefault();
            });
            /* FIN AUTORIZACIONES*/
        });


        function addImage(e) {
            var file = e.target.files[0], imageType = /image.*/;
            if (!file.type.match(imageType))
                return;
            var reader = new FileReader();
            reader.onload = fileOnload;
            reader.readAsDataURL(file);
            $('.ver_foto').hide(200);
        }

        function precarga(e) {
            var file = e.target.files[0], imageType = /image.*/;
            if (!file.type.match(imageType))
                return;
            var reader = new FileReader();
            reader.onload = prefile;
            reader.readAsDataURL(file);
        }
        function prefile(e) {
            var result = e.target.result;
            $('.pre_foto').attr("src", result);
        }

        // cargar imagen
        function fileOnload(e) {
            var result = e.target.result;
            $('.pre_foto').attr("src", result);
            $(function () {
                $(".progressbar").show(200);
                var progressbar = $(".progressbar"),
                        progressLabel = $(".progress-label");

                progressbar.progressbar({
                    value: false,
                    change: function () {
                        progressLabel.text(progressbar.progressbar("value") + "%");
                    },
                    complete: function () {
                        progressLabel.text("Complete!");
                        $(".progressbar").hide(200);
                    }});
                function progress() {
                    var val = progressbar.progressbar("value") || 0;

                    progressbar.progressbar("value", val + 2);

                    if (val < 99) {
                        setTimeout(progress, 68);
                    }
                }

                setTimeout(progress, 100);
            });
        }
        $('.ver_foto').click(function () {
            //$(".file-foto").val('');
            $("#modal_link").click();
            $(".file-foto").click();
        });


        $('.file-foto').change(function (e) {
            var evento;
            console.log("load foto");
            evento = e;
            if (this.files[0].size <= 500000) {
                var objDivDialog = $(".div_dialog");
                objDivDialog.empty();
                $.ajax({url: "../../trabajador", data: "opc=ShowDialogFotoTrabajador&id=" + idtrl, type: 'POST', async: false, success: function (data, textStatus, jqXHR) {
                        if (data.rpta == "1") {
                            objDivDialog.append(data.html);
                            $(".dialog-message").dialog({
                                autoOpen: false,
                                modal: true,
                                height: 600,
                                width: 630,
                                title: "<div class='widget-header'><h4><i class='icon-ok'></i>¿ Seguro que desea cambiar ?</h4></div>",
                                buttons: [{
                                        html: "Cancel",
                                        "class": "btn btn-default",
                                        click: function () {
                                            $(this).dialog("close");
                                        }
                                    }, {
                                        html: "<i class='fa fa-check'></i>&nbsp; OK",
                                        "class": "add-foto btn btn-primary",
                                        click: function () {

                                        }
                                    }]

                            });
                            $('.dialog-message').dialog('open');
                            precarga(e);
                            $(".add-foto").on('click', function (event) {
                                event.preventDefault();

                                var jForm = new FormData();
                                jForm.append("idtr", $('.idtr').val());
                                jForm.append("archivo", $('.file-foto').get(0).files[0]);

                                $.ajax({
                                    type: "POST",
                                    url: "../../foto",
                                    cache: false,
                                    processData: false,
                                    contentType: false,
                                    data: jForm, async: false,
                                    success: function (objJson) {
                                        console.log(objJson);
                                        if (objJson.rpta === "-1") {
                                            $.smallBox({
                                                title: "¡Alerta!",
                                                content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar su imagen...</i>",
                                                color: "#C46A69",
                                                iconSmall: "fa fa-cloud bounce animated",
                                                timeout: 7000
                                            });
                                        } else if (objJson.rpta === "1") {
                                            addImage(evento);
                                            this.timer = setTimeout(function () {
                                                var padre = $(window.parent.document.getElementById('foto_usuario'));
                                                var idtra = $(window.parent.document.getElementById('id_trabajador')).val();
                                                if (idtra.trim() == $(".idtr").val().trim()) {
                                                    $('.foto-user').empty();
                                                    $(padre).attr("src", url_archivos + objJson.archivo);
                                                }
                                                Shadowbox.clearCache();
                                                validar_shadowbox();
                                                getAvatar("perfil", idtrl);
                                                getAvatar("todo", idtrl);
                                                repeat = 0;
                                                $(".borde").removeClass("ver_foto");
                                                $(".ver_foto").show(200);
                                                //$(".form-subir-foto").remove();
                                                $.smallBox({
                                                    title: "¡Felicitaciones!",
                                                    content: "<i class='fa fa-clock-o'></i> <i>Su imagen se ha subido con éxito...</i>",
                                                    color: "#296191",
                                                    iconSmall: "fa fa-cloud bounce animated",
                                                    timeout: 6000
                                                });
                                                $('.dialog-message').dialog("close");
                                            }, 4000);
                                        }
                                    }
                                }).fail(function (objJson) {
                                });
                            });
                        }
                    }});



            } else {
                alert("Archivo no permitido, su tamaño debe ser menor a 500 KB");
                $(this).val('');
            }
        });



        function getAvatar(tipo, idtra) {
            console.log("geAvatar");
            $.ajax({
                url: "../../foto",
                type: "POST",
                data: "opc=getfoto&tipo=" + tipo + "&idtra=" + idtra,
                success: getImagen,
                error: errors
            });
            function getImagen(data) {
                $.each(data, function (i, datos) {
                    $.each(datos, function (i, obj) {
                        if (tipo == 'todo') {
                            console.log("foto todo");
                            var imgens = '<img class="img-thumbnail" title="foto ' + i + '" src="' + url_archivos +
                                    obj.ar_foto + '"style="width:100px; height:100px;" />';
                            $('.fotos').append(imgens);
                            if (repeat == 0) {
                                var imgens = '<a class="mustang-gallery pull-left" href="' + url_archivos + obj.ar_foto + '" >' +
                                        '<img class="img-thumbnail" title="foto ' + i + '" src="' + url_archivos +
                                        obj.ar_foto + '"style="width:100px; height:100px;" /></a>';
                                $('.foto-user').append(imgens);
                                $('.fotos').append(imgens);
                            } else {
                            }

                        } else if (tipo == 'perfil') {
                            console.log("foto perfil ");
                            $('.borde').attr("src", url_archivos + obj.ar_foto);
                            $(".avatar").attr("href", url_archivos + obj.ar_foto);
                            $("#sb-player").attr("href", url_archivos + obj.ar_foto);
                            console.log(obj.ar_foto);
                        }
                    });
                });
            }
            function errors(data) {
                console.log("error" + data);
            }
        }

        $('.avatar').click(function () {
            console.log("mostar-imegen");
            var cont = '<div class="fotos conteiner"></div>';
            $('#sb-overlay').html(cont);
            getAvatar("todo", idtrl);
            repeat = 1;
            validar_shadowbox();
        });

        // Alert
        $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
            _title: function (title) {
                if (!this.options.title) {
                    title.html("&#160;");
                } else {
                    title.html(this.options.title);
                }
            }
        }));
        $('.ver4foto').click(function () {
            $('#dialog-message').dialog('open');
            return false;
        });


        </script>

    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%> 
