<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
        HttpSession sesion_1 = request.getSession(true);
        String iddep = (String) sesion_1.getAttribute("DEPARTAMENTO_ID");
        String iduser = (String) sesion_1.getAttribute("IDUSER");
        String rol = (String) sesion_1.getAttribute("IDROL");
        rol = rol.trim();
%>

<%@page import="pe.edu.upeu.application.model.Cuenta_Sueldo"%>
<%@page import="pe.edu.upeu.application.model.Tipo_Institucion"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.Tipo_Documento"%>
<%@page import="pe.edu.upeu.application.model.Ub_Departamento"%>
<%@page import="pe.edu.upeu.application.model.Situacion_Educativa"%>
<%@page import="pe.edu.upeu.application.model.Universidad"%>
<%@page import="pe.edu.upeu.application.model.Carrera"%>
<%@page import="pe.edu.upeu.application.model.V_Ubigeo"%>
<%@page import="pe.edu.upeu.application.model.Nacionalidad"%>
<jsp:useBean id="List_Cuenta_Sueldo" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_año" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_tipo_institucion" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Universidad" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="ListaridTrabajador" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Carrera" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Situacion_Educativa" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->
        <title>Modificar Trabajador</title>
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

    </head>
    <body class="">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->
        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">
                <!-- widget grid -->
                <section id="widget-grid" class="" >

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-sm-12 col-md-12 col-lg-12">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false" 
                                 data-widget-fullscreenbutton="false"  data-widget-togglebutton="false">
                                <!-- widget options:
                                usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

                                data-widget-colorbutton="false"
                                data-widget-editbutton="false"
                                data-widget-togglebutton="false"
                                data-widget-deletebutton="false"
                                data-widget-fullscreenbutton="false"
                                data-widget-custombutton="false"
                                data-widget-collapsed="true"
                                data-widget-sortable="false"

                                -->
                                <header>
                                    <span class="widget-icon"> <i class="glyphicon glyphicon-user"></i> </span>
                                    <h2 class="font-md"><strong>Modificar </strong> <i>apecto académico</i></h2>
                                </header>
                                <!-- widget div-->
                                <div>
                                    <!-- widget content -->
                                    <div class="widget-body">
                                        <div class="row">
                                            <div id="bootstrap-wizard-1" class="col-sm-12">
                                                <form id="wizard-1" novalidate="novalidate" action="../../trabajador">
                                                    <% String edit = request.getParameter("edit");
                                                        for (int i = 0; i < ListaridTrabajador.size(); i++) {
                                                            V_Ficha_Trab_Num_C t = new V_Ficha_Trab_Num_C();
                                                            t = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(i);
                                                    %>
                                                    <div class="">


                                                        <div class="row">
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label>Situación Educativa:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-mortar-board fa-lg fa-fw"></i></span>
                                                                        <select name="NIVEL_EDUCATIVO" class="form-control input-group-sm" id="sit_edu" required>
                                                                            <option value="" selected="selected" >[Seleccione]</option>
                                                                            <%for (int s = 0; s < List_Situacion_Educativa.size(); s++) {
                                                                                    Situacion_Educativa e = new Situacion_Educativa();
                                                                                    e = (Situacion_Educativa) List_Situacion_Educativa.get(s);
                                                                                    if (e.getNo_s_educativa().trim().equals(t.getNo_s_educativa())) {%>
                                                                            <option value="<%=e.getId_situacion_educativa()%>" selected=""><%=e.getNo_s_educativa()%></option>
                                                                            <%} else {%>
                                                                            <option value="<%=e.getId_situacion_educativa()%>"><%=e.getNo_s_educativa()%></option>
                                                                            <%}
                                                                                }%>
                                                                        </select>
                                                                       <!-- <input type="text" value="<%=t.getId_situacion_educativa()%>">-->
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-sm-4" id="es_inst_p" style="display: none">
                                                                <div class="form-group">
                                                                    <label>¿Estudio en una institucion educativa del Perú?</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                        <select class="form-control input-group-sm" id="inst_peru" name="ES_INST_PERU" required>
                                                                            <option value="" selected="selected" >[Seleccione]</option>
                                                                            <% if (t.getEs_inst_educ_peru() != null) {
                                                                                    if (t.getEs_inst_educ_peru().trim().equals("1")) {%>
                                                                            <option value="1" selected="">Si</option>
                                                                            <option value="2">No</option>
                                                                            <%}
                                                                                if (t.getEs_inst_educ_peru().trim().equals("2")) {%>
                                                                            <option value="1">Si</option>
                                                                            <option value="2" selected="">No</option>
                                                                            <%}
                                                                            } else {%>
                                                                            <option value="1">Si</option>
                                                                            <option value="2">No</option>
                                                                            <%}%>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4" id="regimen" style="display: none">
                                                                <div class="form-group">
                                                                    <label>Regimen de la Institución Educativa:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                        <select class="form-control input-group-sm" id="rg" name="REGIMEN" required>
                                                                            <option value="" selected="selected">[Seleccione]</option>
                                                                            <%if (t.getLi_reg_inst_educativa() != null) {
                                                                                    if (t.getLi_reg_inst_educativa().trim().equals("1")) {%>
                                                                            <option value="1" selected="">Publica</option>
                                                                            <option value="2">Privada</option>
                                                                            <%}
                                                                                if (t.getLi_reg_inst_educativa().trim().equals("2")) {%>
                                                                            <option value="1">Publica</option>
                                                                            <option value="2" selected="">Privada</option>
                                                                            <%}
                                                                            } else {%>
                                                                            <option value="1">Publica</option>
                                                                            <option value="2">Privada</option>
                                                                            <%}%>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-sm-4" id="ti" style="display: none">
                                                                <div class="form-group">
                                                                    <label>Tipo de Institución:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                        <select class="form-control input-group-sm" id="ti_inst"  required>
                                                                            <option value="" selected="selected">[Seleccione]</option>
                                                                            <% if (t.getNo_universidad() != null)
                                                                                    for (int y = 0; y < List_Universidad.size(); y++) {
                                                                                        Universidad un = new Universidad();
                                                                                        un = (Universidad) List_Universidad.get(y);
                                                                                        if (t.getNo_universidad().trim().equals(un.getNo_universidad().trim())) {

                                                                                            for (int r = 0; r < List_tipo_institucion.size(); r++) {
                                                                                                Tipo_Institucion ti = new Tipo_Institucion();
                                                                                                ti = (Tipo_Institucion) List_tipo_institucion.get(r);

                                                                                                if (un.getId_tipo_institucion().trim().equals(ti.getId_tipo_institucion().trim())) {
                                                                            %>
                                                                            <option  value="<%=ti.getId_tipo_institucion()%>" selected=""><%=ti.getNo_tipo_institucion()%></option>
                                                                            <%
                                                                                                }
                                                                                            }

                                                                                        }
                                                                                    }

                                                                            %>

                                                                        </select>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4" id="institucion" style="display: none">
                                                                <div class="form-group">
                                                                    <label>Institución:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                        <select class="form-control input-group-sm" id="inst"  required name="UNIVERSIDAD">
                                                                            <option value="" selected="selected">[Seleccione]</option>

                                                                            <%if (t.getNo_universidad() != null) {
                                                                                    for (int w = 0; w < List_Universidad.size(); w++) {
                                                                                        Universidad u = new Universidad();
                                                                                        u = (Universidad) List_Universidad.get(w);
                                                                                        if (u.getNo_universidad().trim().equals(t.getNo_universidad().trim())) {
                                                                            %>
                                                                            <option value="<%=u.getId_universidad()%>" selected="" > <%=u.getNo_universidad()%></option>
                                                                            <%} else {%>
                                                                            <option value="<%=u.getId_universidad()%>" > <%=u.getNo_universidad()%></option>
                                                                            <%}
                                                                                    }
                                                                                }
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4" id="carr" style="display: none">
                                                                <div class="form-group">
                                                                    <label>Carrera:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-mortar-board fa-lg fa-fw"></i></span>
                                                                        <select class="form-control input-group-sm" id="carrera" name="CARRERA" required>
                                                                            <option value="" >[Seleccione]</option>
                                                                            <% if (t.getId_universidad_carrera() != null) {
                                                                                    for (int q = 0; q < List_Carrera.size(); q++) {
                                                                                        Carrera c = new Carrera();
                                                                                        c = (Carrera) List_Carrera.get(q);
                                                                                        if (c.getNo_carrera().equals(t.getNo_carrera())) {
                                                                            %>
                                                                            <option value="<%=t.getId_universidad_carrera()%>" selected="" > <%=c.getNo_carrera()%></option>
                                                                            <%} else {%>
                                                                            <option value="<%=c.getId_carrera()%>" > <%=c.getNo_carrera()%></option>
                                                                            <%}
                                                                                    }
                                                                                }
                                                                                List_Carrera.clear(); %>
                                                                        </select>

                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-sm-4">   
                                                                <div class="form-group">
                                                                    <label>Codigo Universitario:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-mortar-board fa-lg fa-fw"></i></span>
                                                                            <%if (t.getCo_universitario() != null) {%>
                                                                        <input class="form-control input-group-sm" value="<%=t.getCo_universitario()%>"   type="text" name="CO_UNIVERSITARIO" maxlength="9">
                                                                        <%} else {%>
                                                                        <input class="form-control input-group-sm" value="<%%>"   type="text" name="CO_UNIVERSITARIO" maxlength="9">
                                                                        <%}%>
                                                                    </div>
                                                                </div>
                                                            </div>           
                                                            <div class="col-sm-4" id="egreso">
                                                                <div class="form-group">
                                                                    <label>Año Egreso:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-mortar-board fa-lg fa-fw"></i></span>
                                                                        <select   id="ano_e" name="A_EGRESO" class="form-control input-group-sm" required="" >
                                                                            <option value="">[Seleccione]</option>
                                                                            <% if (t.getDe_anno_egreso() != null) {
                                                                                    for (int jj = 0; jj < list_año.size(); jj++) {
                                                                                        if (t.getDe_anno_egreso().trim().equals(list_año.get(jj))) {
                                                                            %>
                                                                            <option value="<%=list_año.get(jj)%>" selected=""><%=list_año.get(jj)%></option>
                                                                            <%} else {%>
                                                                            <option value="<%=list_año.get(jj)%>"><%=list_año.get(jj)%></option>
                                                                            <%}
                                                                                }
                                                                            } else {
                                                                                for (int jj = 0; jj < list_año.size(); jj++) {%>

                                                                            <option value="<%=list_año.get(jj)%>"><%=list_año.get(jj)%></option>
                                                                            <%}
                                                                                }
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%
                                                                if (!rol.equals("ROL-0013")) {%>

                                                            <div class="col-sm-4">   
                                                                <div class="form-group">
                                                                    <label>Tipo Hora Pago Referencial:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-money fa-lg fa-fw"></i></span>
                                                                        <input class="form-control input-group-sm" value="<%if (t.getCa_tipo_hora_pago_refeerencial() == null) {
                                                                                out.print("0");
                                                                            } else {
                                                                                out.print(t.getCa_tipo_hora_pago_refeerencial());
                                                                            }%>"   type="text" name="TIPO_HORA_PAGO_REFEERENCIAL" maxlength="6">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%}%>
                                                        </div>
                                                        <!--  <input pattern=".{3,}" required title="3 characters minimum">
                                                        <input pattern=".{5,10}" required title="5 to 10 characters">-->
                                                        <div class="row">

                                                            <div class="col-sm-10">
                                                                <div class="form-group">
                                                                    <label>Otros Estudios:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-align-justify fa-lg fa-fw"></i></span>
                                                                            <%if (t.getCm_otros_estudios() != null) {%>
                                                                        <textarea name="OTROS_ESTUDIOS"  class="form-control input-group-sm"  cols="60" rows="6" maxlength="1000"><%=t.getCm_otros_estudios()%></textarea>
                                                                        <%} else {%>
                                                                        <textarea name="OTROS_ESTUDIOS"  class="form-control input-group-sm"  cols="60" rows="6" maxlength="1000"></textarea>
                                                                        <%}%>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <h3>Cuenta Sueldo </h3>
                                                        <div class="row" >           
                                                            <div class="col-sm-3">
                                                                <div class="form-group">
                                                                    <label>Banco:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <%
                                                                                boolean permissionEdit = false;
                                                                                String disabled = "";
                                                                                if (!rol.equals("ROL-0002") || !rol.equals("ROL-0005") || !rol.equals("ROL-0016")) {
                                                                                    permissionEdit = true;
                                                                                }
                                                                                if (iduser.equals("USR-001874")) {
                                                                                    permissionEdit = true;
                                                                                }
                                                                                if (!permissionEdit) {
                                                                                    disabled = "disabled";
                                                                                }
                                                                            %>
                                                                        <select name="BANCO" id="banco" class="form-control input-group-sm" <%=disabled%>>
                                                                            <option value=""   selected="" >[Seleccione]</option>
                                                                            <%
                                                                                for (int u = 0; u < List_Cuenta_Sueldo.size(); u++) {
                                                                                    Cuenta_Sueldo cs = new Cuenta_Sueldo();
                                                                                    cs = (Cuenta_Sueldo) List_Cuenta_Sueldo.get(u);
                                                                                    if (cs.getNo_banco() != null) {
                                                                                        if (cs.getNo_banco().trim().equals("0")) {
                                                                            %>
                                                                            <option value="0" selected="">Ninguno</option>
                                                                            <option value="1" >BBVA</option>
                                                                            <option value="2" >BCP</option>
                                                                            <option value="3" >Otros</option>
                                                                            <%}
                                                                                if (cs.getNo_banco().trim().equals("1")) {
                                                                            %>
                                                                            <option value="0" >Ninguno</option>
                                                                            <option value="1" selected="" >BBVA</option>
                                                                            <option value="2" >BCP</option>
                                                                            <option value="3" >Otros</option>
                                                                            <%}
                                                                                if (cs.getNo_banco().trim().equals("2")) {
                                                                            %>
                                                                            <option value="0" >Ninguno</option>
                                                                            <option value="1" >BBVA</option>
                                                                            <option value="2" selected="">BCP</option>
                                                                            <option value="3" >Otros</option>
                                                                            <%}
                                                                                if (cs.getNo_banco().trim().equals("3")) {
                                                                            %>
                                                                            <option value="0" >Ninguno</option>
                                                                            <option value="1" >BBVA</option>
                                                                            <option value="2" >BCP</option>
                                                                            <option value="3" selected="">Otros</option>
                                                                            <%}
                                                                            } else {%>
                                                                            <option value="0" >Ninguno</option>
                                                                            <option value="1" >BBVA</option>
                                                                            <option value="2" >BCP</option>
                                                                            <option value="3" >Otros</option>
                                                                            <% }%>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-sm-3" id="no_cuen_otros" >
                                                                <div class="form-group">
                                                                    <label>Nombre del Banco:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <%if (cs.getNo_banco_otros() != null) {%>
                                                                        <input class="form-control input-group-sm" value="<%=cs.getNo_banco_otros()%>"   type="text" name="BANCO_OTROS" id="nu_cuen_otros" <%=disabled%> maxlength="30">
                                                                        <%} else {%>
                                                                        <input class="form-control input-group-sm" value=""   type="text" name="BANCO_OTROS" id="nu_cuen_otros" maxlength="30" <%=disabled%>>
                                                                        <%}%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3" id="no_cuen" >
                                                                <div class="form-group">
                                                                    <label>Nro de Cuenta:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <%if (cs.getNu_cuenta() != null) {%>
                                                                        <input class="form-control input-group-sm" value="<%=cs.getNu_cuenta().trim()%>"   type="text" name="CUENTA" id="nu_cuen" maxlength="30" <%=disabled%>>
                                                                        <%} else {%>
                                                                        <input class="form-control input-group-sm" value=""   type="text" name="CUENTA" id="nu_cuen" maxlength="30" <%=disabled%>>
                                                                        <%}%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3" id="no_cuen_ban" >
                                                                <div class="form-group">
                                                                    <label>Nro de Cuenta Bancaria:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <%if (cs.getNu_cuenta_banc() != null) {%>
                                                                        <input class="form-control input-group-sm" value="<%=cs.getNu_cuenta_banc()%>"   type="text" name="CUENTA_BANC" id="nu_cuen_ban" maxlength="30" <%=disabled%>>
                                                                        <%} else {%>
                                                                        <input class="form-control input-group-sm" value=""   type="text" name="CUENTA_BANC" id="nu_cuen_ban" maxlength="30" <%=disabled%>>
                                                                        <%}%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4" id="texto" >
                                                                <div class="form-group">
                                                                    <div class="input-g">
                                                                        <p >Autorizo a la UPeU gestionar mi cuenta de sueldo en el BBVA Banco Continental, para tal efecto adjunto copia legible y vigente de mi DNI   </p>
                                                                    </div>
                                                                </div>
                                                            </div>   
                                                            <div class="col-sm-3" id="generar" >
                                                                <div class="form-group">
                                                                    <div class="input-g">
                                                                        <%if (cs.getEs_gem_nu_cuenta().trim().equals("1")) {%>
                                                                        <input type="checkbox" checked="" name="GEN_NU_CUEN" id="subscription"  value="1" <%=disabled%>>
                                                                        <%} else {%>
                                                                        <input type="checkbox"  name="GEN_NU_CUEN" id="subscription"  value="0" <%=disabled%>>
                                                                        <%}%>
                                                                        <i></i>Generar Nro de Cuenta Bancaria
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                        </div>
                                                        <input type="hidden" value="1" name="ES_CUENTA_SUELDO" id="es_cuenta"/>
                                                        <%String idtr = request.getParameter("idtr");%>
                                                        <input type="hidden" name="idtr" value="<%=idtr%>"/>
                                                        <input type="hidden" name="opc" value="Modificar_Asp_Acad">
                                                        <input type="hidden" name="US_MODIF" value="<%=id_user%>">

                                                        <%}
                                                        %>
                                                    </div>
                                                    <%}%>
                                                    <footer>
                                                        <center>
                                                            <button type="submit" class="btn btn-labeled btn-info">
                                                                <span class="btn-label">
                                                                    <i class="glyphicon glyphicon-pencil"></i>
                                                                </span>Modificar
                                                            </button>
                                                        </center>
                                                    </footer>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end widget content -->
                                </div>
                                <!-- end widget div -->
                            </div>
                            <!-- end widget -->

                        </article>
                        <!-- WIDGET END -->
                    </div>
                    <!-- end row -->
                </section>
                <!-- end widget grid -->
            </div>
            <!-- END MAIN CONTENT -->
        </div>

        <!-- END MAIN PANEL -->


        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>-->

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

        <!-- CUSTOM NOTIFICATION 
        <script src="../../js/notification/SmartNotification.min.js"></script>-->

        <!-- JARVIS WIDGETS -->
        <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>

        <!-- EASY PIE CHARTS 
        <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>-->

        <!-- SPARKLINES 
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>-->

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT 
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->

        <!-- JQUERY SELECT2 INPUT -->
        <script src="../../js/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider 
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>-->

        <!-- browser msie issue fix 
        <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>-->

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
        <!-- Voice command : plugin 
        <script src="../../js/speech/voicecommand.min.js"></script>-->

        <!-- PAGE RELATED PLUGIN(S) -->

        <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
        <script type="text/javascript" src="../../js/businessLogic/Trabajador/regTrabajador.js"></script>

        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!
            $(document).ready(function () {
                pageSetUp();
                var $validator = $("#wizard-1").validate({
                    rules: {
                        FECHA_NAC: {
                            required: true
                        }
                    },
                    highlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    },
                    errorElement: 'span',
                    errorClass: 'help-block',
                    errorPlacement: function (error, element) {
                        if (element.parent('.input-group').length) {
                            error.insertAfter(element.parent());
                        } else {
                            error.insertAfter(element);
                        }
                    }
                });

                $("#docs, .doc_c, #nu_cuen, #nu_cuen_ban").numeric();
                $("#doc, .doc_c").numeric(false, function () {
                    alert("Solo Numeros Enteros");
                    this.value = "";
                    this.focus();
                });
            });
            //MOSTRAR ASPECTO ACADEMICO PARA MODIFICAR
            if ($("#sit_edu").val() == 'SED-0011' | $("#sit_edu").val() == 'SED-0013' | $("#sit_edu").val() == 'SED-0014'
                    | $("#sit_edu").val() == 'SED-0015'
                    | $("#sit_edu").val() == 'SED-0016' | $("#sit_edu").val() == 'SED-0017'
                    | $("#sit_edu").val() == 'SED-0017' | $("#sit_edu").val() == 'SED-0018'
                    | $("#sit_edu").val() == 'SED-0019' | $("#sit_edu").val() == 'SED-0020'
                    | $("#sit_edu").val() == 'SED-0021') {

                $("#es_inst_p").show();

            } else {
                /*$("#es_inst_p").hide();
                 $("#es_inst_p").removeAttr("selected");
                 $("#regimen").hide("");
                 $("#regimen").removeAttr("selected");
                 $("#egreso").hide("");
                 $("#egreso").removeAttr("selected");
                 $("#ti").hide("");
                 $("#ti").removeAttr("selected");
                 $("#institucion").hide("");
                 $("#institucion").removeAttr("selected");
                 $("#carr").hide("");
                 $("#carr").removeAttr("selected");*/
            }
            if ($("#inst_peru").val() == "1") {
                $("#regimen").show();
                $("#egreso").show();
                $("#ti").show();
                $("#institucion").show();
                $("#carr").show();
            } else {
                $("#regimen").hide();
                $("#egreso").hide();
                $("#ti").hide();
                $("#institucion").hide();
                $("#carr").hide();
            }

            $("#no_cuen").hide();
            $("#no_cuen_ban").hide();
            $("#generar").hide();
            $("#no_cuen_otros").hide();
            $("#texto").hide();
            if ($("#banco").val() == "1") {
                $("#no_cuen").show();
            }
            if ($("#banco").val() == "2") {
                $("#no_cuen").show();
            }
            if ($("#banco").val() == "3") {
                $("#no_cuen").show();
                $("#no_cuen_ban").show();
                $("#no_cuen_otros").show();
            }
            if ($("#banco").val() == "0") {
                $("#generar").show();
                $("#no_cuen_otros").show();
                $("#texto").show();
            }

            $("#banco").change(function () {
                cuenta_bancaria($(this).val());
                $("#nu_cuen").focus();
            });
            $("#reli").change(function () {
                if ($("#reli").val() == "1") {
                    $("#igle").attr("required", "required");
                } else {
                    $("#igle").removeAttr("required");
                }
            });

            /*Datos Academicos*/
            $("#rg").change(function () {
                var ti = $("#ti_inst");
                ti.empty();
                var rg = $("#rg").val();
                var data = "regimen=" + rg + "&opc=ti_inst";

                ti.append('<option value="">Cargando...</option>').val('');
                $.post("../../detalle_carrera", data, function (objJson) {
                    ti.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        ti.append("<option value=''>[Seleccione]</option>");
                    } else {
                        ti.append("<option value=''>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                        ti.append(item);
                    }
                });
            });


            $("#ti_inst").change(function () {
                var inst = $("#inst");
                inst.empty();
                var ti = $("#ti_inst").val();

                var data = "ti=" + ti + "&opc=institucion";
                inst.append('<option value="">Cargando...</option>').val('');
                $.post("../../detalle_carrera", data, function (objJson) {
                    inst.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        inst.append("<option value='0'>[Seleccione]</option>");
                    } else {
                        inst.append("<option value='0'>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                        inst.append(item);
                    }
                });
            });

            $("#inst").change(function () {
                var carr = $("#carrera");
                carr.empty();
                var data = "inst=" + $(this).val() + "&opc=carrera";
                carr.append('<option value="">Cargando...</option>').val('');
                $.post("../../detalle_carrera", data, function (objJson) {
                    carr.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        carr.append("<option value='0'>[Seleccione]</option>");
                    } else {
                        carr.append("<option value='0'>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                        carr.append(item);
                    }
                });
            });
        </script>
    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
