<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
        String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        String iduser = (String) sesion.getAttribute("IDUSER");

%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.Tipo_Documento"%>
<%@page import="pe.edu.upeu.application.model.Via"%>
<%@page import="pe.edu.upeu.application.model.Zona"%>
<%@page import="pe.edu.upeu.application.model.Ub_Departamento"%>
<%@page import="pe.edu.upeu.application.model.Situacion_Educativa"%>
<%@page import="pe.edu.upeu.application.model.Universidad"%>
<%@page import="pe.edu.upeu.application.model.Carrera"%>
<%@page import="pe.edu.upeu.application.model.V_Ubigeo"%>
<%@page import="pe.edu.upeu.application.model.Nacionalidad"%>
<jsp:useBean id="List_Nacionalidad" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Departamento" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Carrera" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Universidad" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Situacion_Educativa" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_zona" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_via" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_tipo_doc" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_año" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title>Registrar Trabajador</title>
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
        <link href="../../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <style>
            #btn-duplicar{
                margin: 1%;
                margin-left:  6%;
            }
        </style>


    </head>
    <body class="" onload="nobackbutton()">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->

        <!-- HEADER -->
        <header >

        </header>
        <!-- END HEADER -->

        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">



            <!-- MAIN CONTENT -->
            <div id="content">


                <!-- widget grid -->
                <section id="widget-grid" class="" >

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-sm-12 col-md-12 col-lg-6" style="width: 95%">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false"  >
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
                                    <span class="widget-icon"> <i class="fa fa-check"></i> </span>
                                    <h2>FICHA DE TRABAJADOR</h2>

                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->
                                    <%                                        String nombres = request.getParameter("no_tr");
                                        String app = request.getParameter("ap_p");
                                        String apm = request.getParameter("ap_m");
                                        String tidoc = request.getParameter("ti_doc");
                                        String nro_doc = request.getParameter("nro_doc");
                                    %>
                                    <!-- widget content -->
                                    <div class="widget-body">
                                        <div class="row">
                                            <form id="wizard-1" novalidate="novalidate" action="../../trabajador">
                                                <div id="bootstrap-wizard-1" class="col-sm-12">
                                                    <div class="form-bootstrapWizard">
                                                        <ul class="bootstrapWizard form-wizard">
                                                            <li class="active" data-target="#step1">
                                                                <a href="#tab1" data-toggle="tab"> <span class="step">1</span> <span class="title">Datos Personales</span> </a>
                                                            </li>
                                                            <li data-target="#step2">
                                                                <a href="#tab2" data-toggle="tab"> <span class="step">2</span> <span class="title">Aspecto Académico</span> </a>
                                                            </li>
                                                            <li data-target="#step3">
                                                                <a href="#tab3" data-toggle="tab"> <span class="step">3</span> <span class="title">Aspecto Social</span> </a>
                                                            </li>
                                                            <li data-target="#step4">
                                                                <a href="#tab4" data-toggle="tab"> <span class="step">4</span> <span class="title">Familiar</span> </a>
                                                            </li>
                                                        </ul>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="tab1">
                                                            <h3><strong>Paso 1 </strong> - Datos del Trabajador</h3>
                                                            <div class="row">
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                                <%if (app != null) {
                                                                                %>
                                                                            <input type="text" name="APELLIDO_P"  value="<%=app.toUpperCase()%>" required="" id="fname" placeholder="Apellido Paterno"  class="form-control input-group-sm"  onblur="this.value = this.value.toUpperCase()" maxlength="50" >
                                                                            <%} else if (app == null) {
                                                                            %>
                                                                            <input type="text" name="APELLIDO_P"  required="" id="fname" placeholder="Apellido Paterno"  class="form-control input-group-sm" onblur="this.value = this.value.toUpperCase()" maxlength="50" >
                                                                            <%}%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                                <%if (apm != null) {
                                                                                %>
                                                                            <input type="text" name="APELLIDO_M" required="" value="<%=apm.toUpperCase()%>" id="lname" placeholder="Apellido Materno" class="form-control input-group-sm" onblur="this.value = this.value.toUpperCase()" maxlength="50" >
                                                                            <%} else if (apm == null) {
                                                                            %>
                                                                            <input type="text" name="APELLIDO_M" required=""  id="lname" placeholder="Apellido Materno" class="form-control input-group-sm" onblur="this.value = this.value.toUpperCase()" maxlength="50" >
                                                                            <%}%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                                <%if (nombres != null) {
                                                                                %>
                                                                            <input type="text" name="NOMBRES" required="" value="<%=nombres.toUpperCase()%>"  id="lname" placeholder="Nombres" class="form-control input-group-sm" onblur="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                            <%} else if (nombres == null) {
                                                                            %>
                                                                            <input type="text" name="NOMBRES" required=""  id="lname" placeholder="Nombres" class="form-control input-group-sm" onblur="this.value = this.value.toUpperCase()" maxlength="50" >
                                                                            <%}%>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="SEXO" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Sexo]</option>
                                                                                <option value="M">Masculino</option>
                                                                                <option value="F">Femenino</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-calendar fa-lg fa-fw"></i><label class="edad"></label></span>

                                                                            <input type="text" name="FECHA_NAC" required=""  id="edad" placeholder="Fecha de Nacimiento" class="simple-field-data-mask from-datepicker form-control input-group-sm fechapicker" data-mask="00/00/0000" autocomplete="off" >

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-flag fa-lg fa-fw"></i></span>
                                                                            <select name="NACIONALIDAD" class="form-control input-group-sm"  id="nac" required="" >
                                                                                <option value="" selected="selected">Nacionalidad</option>
                                                                                <%for (int s = 0; s < List_Nacionalidad.size(); s++) {
                                                                                        Nacionalidad nac = new Nacionalidad();
                                                                                        nac = (Nacionalidad) List_Nacionalidad.get(s);
                                                                                        if (nac.getId_nacionalidad().equals("NAC-0193")) {
                                                                                %>
                                                                                <option value="<%=nac.getId_nacionalidad()%>" selected="selected" ><%=nac.getNo_nacionalidad()%></option>
                                                                                <%} else {%>
                                                                                <option value="<%=nac.getId_nacionalidad()%>" ><%=nac.getNo_nacionalidad()%></option>
                                                                                <%}
                                                                                    }%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>



                                                            </div>
                                                            <div class="row" id="dist">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select  class="form-control input-group-sm" id="dep_nac" name="name" required="">
                                                                                <option value="" selected="selected">[Departamento]</option>
                                                                                <%for (int d = 0; d < List_Departamento.size(); d++) {
                                                                                        Ub_Departamento dep = new Ub_Departamento();
                                                                                        dep = (Ub_Departamento) List_Departamento.get(d);

                                                                                %>
                                                                                <option value="<%=dep.getId_departamento()%>" ><%=dep.getNo_departamento()%></option>
                                                                                <%}%>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="pro_nac" name="" id="dist_nac" required="">
                                                                                <option value="" selected="selected">[Provincia]</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" name="DISTRITO" id="dist_nac" required="">
                                                                                <option value="" selected="selected">[Distrito]</option>
                                                                                <option value="DST-001832" >EXTRANJERO</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-indent fa-lg fa-fw"></i></span>
                                                                            <select name="TIPO_DOC" class="form-control input-group-sm select-doc"  required="">
                                                                                <option value="">[Tipo Documento]</option>

                                                                                <%
                                                                                    for (int h = 0; h < Listar_tipo_doc.size(); h++) {
                                                                                        Tipo_Documento tdoc = new Tipo_Documento();
                                                                                        tdoc = (Tipo_Documento) Listar_tipo_doc.get(h);
                                                                                        if (tidoc == null) {
                                                                                            
                                                                                            if (tdoc.getId_tipo_doc_ident().trim().equals("1")) {
                                                                                %>
                                                                                <option selected="selected" value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%} else {%>

                                                                                <option value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%}
                                                                                } else if (tidoc != null) {
                                                                                    if (tidoc.equals("DNI")) {

                                                                                %>
                                                                                <%                                                                                    if (tdoc.getId_tipo_doc_ident().trim().equals("1")) {
                                                                                %>
                                                                                <option selected="selected" value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%} else {%>
                                                                                <option value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%}%>


                                                                                <%} else if (tidoc.equals("PAS")) {
                                                                                %>

                                                                                <%    
                                                                                    if (tdoc.getId_tipo_doc_ident().trim().equals("4")) {
                                                                                %>
                                                                                <option selected="selected" value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%} else {%>
                                                                                <option value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%}%>

                                                                                <%
                                                                                    }
                                                                                %>


                                                                                <%}
                                                                                    }%>
                                                                            </select>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group class_doc">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-list-alt fa-lg fa-fw"></i></span>
                                                                                <%if (nro_doc != null) {%>
                                                                            <input type="text" name="NRO_DOC" id="doc" value="<%=nro_doc%>" placeholder="Numero Documento" required="" maxlength="10" class="form-control input-group-sm doc" >
                                                                            <%} else if (nro_doc == null) {
                                                                            %>
                                                                            <input type="text" name="NRO_DOC" id="doc" placeholder="Numero Documento" required="" maxlength="10" class="form-control input-group-sm doc" >
                                                                            <%}%>                                                                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-list-alt fa-lg fa-fw"></i></span>
                                                                            <input type="date" name="FE_CAD" id="fec"  placeholder="Fecha de Caducidad"  class="form-control input-group-sm" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-heart fa-lg fa-fw"></i></span>
                                                                            <select id="es_civil" name="ESTADO_CIVIL" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Estado Civil]</option>
                                                                                <option value="1">Soltero(a)</option>
                                                                                <option value="2">Casado(a)</option>
                                                                                <option value="3">Divorciado(a)</option>
                                                                                <option value="4">Viudo(a)</option>
                                                                                <option value="5">Separado(a)</option>
                                                                                <option value="6">Conviviente(a)</option>
                                                                            </select>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row" >

                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-group fa-lg fa-fw"></i></span>
                                                                            <select name="GRUPO_SANGUINEO" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Grupo Sanguineo]</option>
                                                                                <option value="1">A</option>
                                                                                <option value="2">B</option>
                                                                                <option value="3">AB</option>
                                                                                <option value="4">0</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="FACTOR_RH_ID" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Factor RH]</option>
                                                                                <option value="1">Positivo</option>
                                                                                <option value="2">Negativo</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-phone fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="TELEFONO"  placeholder="Teléfono"  data-mask="(99) 999-9999" data-mask-placeholder= "X"   formnovalidate maxlength="50" value="" class="form-control input-group-sm telefono" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-mobile fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="CELULAR"  placeholder="Celular"  data-mask="999-999-999" data-mask-placeholder= "X" formnovalidate maxlength="38" class="form-control input-group-sm" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-envelope-square fa-lg fa-fw"></i></span>
                                                                            <input type="email" name="CORREO_PERSONAL"  placeholder="Correo Personal"  required=""  maxlength="100" class="form-control input-group-sm" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa  fa-envelope fa-lg fa-fw"></i></span>
                                                                            <input type="email" name="CORREO_INST"  placeholder="Correo Institucional"  required=""  maxlength="100" class="form-control input-group-sm" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <div class="row">

                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="SISTEMA_PENSIONARIO" class="form-control input-group-sm"  id="sis_pens" required="">
                                                                                <option value="">[Sistema Pensionario]</option>
                                                                                <option value="1">AFP</option>
                                                                                <option value="2">ONP</option>
                                                                                <option value="3">Sin Régimen Provisional(jubilado, cesante).</option>
                                                                                <option value="4">Fuera de Planilla</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group afp" >
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="NOMBRE_AFP_ID" class="form-control input-group-sm" id="nom_afp" required=""  >
                                                                                <option value="">[Nombre AFP]</option>
                                                                                <option value="1">Integra</option>
                                                                                <option value="2">Prima</option>
                                                                                <option value="3">Profuturo</option>
                                                                                <option value="4">Horizonte</option>
                                                                                <option value="5">Habitat</option>
                                                                                <option value="6">Ninguno</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group" >
                                                                            <span class="input-group-addon"><i class="fa fa-medkit fa-lg fa-fw"></i></span>
                                                                            <select name="AFILIADO_ESSALUD_ID" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Afiliado ESSALUD-VIDA]</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="0" selected="">No</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="TIPO_TRABAJADOR_ID" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Tipo Trabajador]</option>
                                                                                <option value="T" selected >Trabajador</option>
                                                                                <option value="A">Alumno</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                        </div>

                                                        <div class="tab-pane" id="tab2">

                                                            <h3><strong>Paso 2</strong> - Aspecto Académico</h3>

                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-mortar-board fa-lg fa-fw"></i></span>
                                                                            <select name="NIVEL_EDUCATIVO" class="form-control input-group-sm" id="sit_edu" required>
                                                                                <option value="" selected="selected" >[Situación Educativa]</option>
                                                                                <%for (int s = 0; s < List_Situacion_Educativa.size(); s++) {
                                                                                        Situacion_Educativa e = new Situacion_Educativa();
                                                                                        e = (Situacion_Educativa) List_Situacion_Educativa.get(s);
                                                                                %>
                                                                                <option value="<%=e.getId_situacion_educativa()%>"><%=e.getNo_s_educativa()%></option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="es_inst_p" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-flag fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="inst_peru" name="ES_INST_PERU" required>
                                                                                <option value="" selected="selected" >[¿Estudio en una institucion educativa del Perú?]</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="2">No</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="regimen" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-legal fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="rg" name="REGIMEN" required>
                                                                                <option value="" selected="selected">[Regimen de la Institución Educativa]</option>
                                                                                <option value="1">Publica</option>
                                                                                <option value="2">Privada</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-4" id="ti" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="ti_inst"  required>
                                                                                <option value="" selected="selected">[Tipo de Institución]</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="institucion" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="inst"  required>
                                                                                <option value="" selected="selected">[Institución]</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="carr" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-mortar-board fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="carrera" name="CARRERA" required>
                                                                                <option value="" selected="selected">[Carrera]</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">  <!-- <label>Codigo Universitario:</label>-->
                                                                    <div class="form-group class_cod">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-th fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm cod_uni"  type="text" name="COD_UNI" maxlength="9" placeholder="Codigo Universitario" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="egreso" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-calendar fa-lg fa-fw"></i></span>
                                                                            <select    name="A_EGRESO" class="form-control input-group-sm" required="" >
                                                                                <option value="">[Año Egreso]</option>
                                                                                <% for (int jj = 0; jj < list_año.size(); jj++) {%>
                                                                                <option value="<%=list_año.get(jj)%>"><%=list_año.get(jj)%></option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>                        
                                                                <div class="col-sm-4"> <!--  <label>Tipo Hora Pago Referencial:</label>-->
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-money fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm" placeholder="Tipo Hora Pago Referencial" type="text" name="TIPO_HORA_PAGO_REFEERENCIAL" maxlength="6">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--  <input pattern=".{3,}" required title="3 characters minimum">
                                                            <input pattern=".{5,10}" required title="5 to 10 characters">-->
                                                            <div class="row">

                                                                <div class="col-sm-12">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-align-justify fa-lg fa-fw"></i></span>
                                                                            <textarea name="OTROS_ESTUDIOS"  placeholder="Otros Estudios"  class="form-control input-group-sm" class="text-box" cols="60" rows="6" maxlength="500"></textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>


                                                            <h3>Cuenta sueldo </h3>
                                                            <div class="row">
                                                                <div class="col-sm-4" id="" >
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-credit-card  fa-lg fa-fw"></i></span>
                                                                            <select name="BANCO" id="banco" class="form-control input-group-sm">
                                                                                <option value="" selected="" >[BANCO]</option>
                                                                                <option value="0" >Ninguno</option>
                                                                                <option value="1" >BBVA</option>
                                                                                <option value="2" >BCP</option>
                                                                                <option value="3" >Otros</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="no_cuen_otros" >
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-bank fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"  placeholder="Nombre del Banco" type="text" name="BANCO_OTROS"  id="nu_cuen_otros" maxlength="20"   />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4 numero_cuenta" id="no_cuen" >
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-bank fa-lg fa-fw"></i></span>
                                                                            <input placeholder="Nro de Cuenta" class="form-control input-group-sm" type="text" name="CUENTA"  id="nu_cuen" maxlength="20"   />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="no_cuen_ban" >
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-bank fa-lg fa-fw"></i></span>
                                                                            <input placeholder="Nro de Cuenta Bancaria" class="form-control input-group-sm" type="text" name="CUENTA_BANC" id="nu_cuen_ban">
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-4" id="generar" >
                                                                    <div class="form-group">
                                                                        <p style="font-weight:bold;">Autorizo a la UPeU gestionar mi cuenta de sueldo en el BBVA Banco Continental, para tal efecto adjunto copia legible y vigente de mi DNI   </p>

                                                                        <div class="input-g">
                                                                            <input type="checkbox" name="GEN_NU_CUEN" id="subscription"  value="1">
                                                                            <i></i>Generar Nro de Cuenta Bancaria
                                                                        </div>
                                                                    </div>
                                                                </div> 
                                                                <input type="hidden" value="0" name="ES_CUENTA_SUELDO" id="es_cuenta"/>
                                                            </div>

                                                        </div>  



                                                        <div class="tab-pane" id="tab3">
                                                            <h3><strong>Paso 3 -</strong> Aspecto Social</h3>
                                                            <h3>Domicilio Actual del Trabajador</h3>
                                                            <label>Direccion :</label>
                                                            <div class="row">

                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_A_D1_ID" id="DOM_A_D1" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Seleccione Via]</option>
                                                                                <%for (int i = 0; i < Listar_via.size(); i++) {
                                                                                        Via zo = new Via();
                                                                                        zo = (Via) Listar_via.get(i);%>    
                                                                                <option value="<%=zo.getId_via()%>"><%=zo.getDe_via()%></option>
                                                                                <%}%>
                                                                            </select>   
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                                <div class="col-sm-3">
                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-pencil fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_A_D2" id="DOM_A_D2" maxlength="100">

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_A_D3_ID" id="DOM_A_D3" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Seleccione]</option>
                                                                                <option value="1">Número</option>
                                                                                <option value="2">Lote</option>
                                                                                <option value="3">S/N</option>
                                                                                <option value="4">Km</option>
                                                                                <option value="5">Block</option>
                                                                                <option value="6">Etapa</option>
                                                                                <option value="7">Departamento</option>
                                                                                <option value="8">Interior</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-pencil  fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_A_D4" id="DOM_A_D4" maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_A_D5_ID" id="DOM_A_D5" class="form-control input-group-sm"  required="">

                                                                                <option value="">[Seleccione Zona]</option>
                                                                                <%for (int i = 0; i < Listar_zona.size(); i++) {
                                                                                        Zona zo = new Zona();
                                                                                        zo = (Zona) Listar_zona.get(i);%>    
                                                                                <option value="<%=zo.getId_zona()%>"><%=zo.getDe_zona()%></option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-pencil  fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_A_D6" id="DOM_A_D6" maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-pencil  fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Referencia" type="text" name="DIR_DOM_A_REF" id="DOM_A_REF" maxlength="200">
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select  id="dep_dir_a" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Departamento]</option>
                                                                                <%for (int d = 0; d < List_Departamento.size(); d++) {
                                                                                        Ub_Departamento dep = new Ub_Departamento();
                                                                                        dep = (Ub_Departamento) List_Departamento.get(d);

                                                                                %>
                                                                                <option value="<%=dep.getId_departamento()%>" ><%=dep.getNo_departamento()%></option>
                                                                                <%}%>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select  id="pro_dir_a" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Provincia]</option>


                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_A_DISTRITO_ID"  id="DOM_A_DISTRITO" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Distrito]</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <button onclick="duplicar();
                                                                                return false;"  class="btn btn-primary btn-sm" id="btn-duplicar" style="width: 90%;margin-top:0px;" >Duplicar</button>
                                                                    </div>

                                                                </div>
                                                            </div>

                                                            <h3>Domicilio Legal (segun DNI)</h3>
                                                            <label>Direccion :</label>
                                                            <div class="row">
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_LEG_D1_ID"  id="DOM_LEG_D1" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Seleccione Via]</option>
                                                                                <%for (int i = 0; i < Listar_via.size(); i++) {
                                                                                        Via zo = new Via();
                                                                                        zo = (Via) Listar_via.get(i);%>    
                                                                                <option value="<%=zo.getId_via()%>"><%=zo.getDe_via()%></option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-pencil fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_LEG_D2" id="DOM_LEG_D2" maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_LEG_D3_ID"  id="DOM_LEG_D3" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Seleccione]</option>
                                                                                <option value="1">Número</option>
                                                                                <option value="2">Lote</option>
                                                                                <option value="3">S/N</option>
                                                                                <option value="4">Km</option>
                                                                                <option value="5">Block</option>
                                                                                <option value="6">Etapa</option>
                                                                                <option value="7">Departamento</option>
                                                                                <option value="8">Interior</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-pencil fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_LEG_D4" id="DOM_LEG_D4" maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_LEG_D5_ID"  id="DOM_LEG_D5" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Seleccione Zona]</option>
                                                                                <%for (int i = 0; i < Listar_zona.size(); i++) {
                                                                                        Zona zo = new Zona();
                                                                                        zo = (Zona) Listar_zona.get(i);%>    
                                                                                <option value="<%=zo.getId_zona()%>"><%=zo.getDe_zona()%></option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-pencil fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_LEG_D6" id="DOM_LEG_D6" maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>



                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select   id="dep_dir_l" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Departamento]</option>
                                                                                <%for (int d = 0; d < List_Departamento.size(); d++) {
                                                                                        Ub_Departamento dep = new Ub_Departamento();
                                                                                        dep = (Ub_Departamento) List_Departamento.get(d);

                                                                                %>
                                                                                <option value="<%=dep.getId_departamento()%>" ><%=dep.getNo_departamento()%></option>
                                                                                <%}%>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select   id="pro_dir_l" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Provincia]</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select   name="DIR_DOM_LEG_DISTRITO_ID"   id="DOM_LEG_DISTRITO" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Distrito]</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <h3>Ingresos de Quinta Categoria</h3>
                                                            <div class="row">
                                                                <div class="col-sm-6">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-cube fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Empresa" type="text" name="ING_QTA_CAT_EMPRESA"  maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-barcode fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="RUC" type="text" name="ING_QTA_CAT_RUC"  maxlength="20">

                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <div class="row">

                                                                <div class="col-sm-12">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-cubes fa-lg fa-fw"></i></span>
                                                                            <textarea name="ING_QTA_CAT_OTRAS_EMPRESAS"  placeholder="Otras Empresas"  class="form-control input-group-sm"  cols="60" rows="6" maxlength="500" ></textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <h3>Informacion Religiosa</h3>
                                                            <div class="row">
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                            <select  class="form-control input-group-sm"  id="reli" required="" name="RELIGION">
                                                                                <option value="">[Religión]</option>
                                                                                <option value="1">Adventista</option>
                                                                                <option value="2">Catolico</option>
                                                                                <option value="3">Otros</option>
                                                                            </select>   

                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div  class="col-sm-4 div_diezmo" style="display: none">
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-money fa-lg fa-fw"></i></span>
                                                                        <span class="form-control" style="">¿Autorizar descuento de Diezmo?</span>
                                                                        <span class="input-group-addon">
                                                                            <span class="onoffswitch">
                                                                                <input type="checkbox" name="diezmo" value="1" class="onoffswitch-checkbox" id="st3">
                                                                                <label class="onoffswitch-label" for="st3"> 
                                                                                    <span class="onoffswitch-inner" data-swchon-text="SI" data-swchoff-text="NO"></span> 
                                                                                    <span class="onoffswitch-switch"></span> 
                                                                                </label> 
                                                                            </span>
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Iglesia" type="text" name="IGLESIA"   maxlength="30" id="igle">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row"> 
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-male fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Cargo en la Iglesia" type="text" name="CARGO"  maxlength="30">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-male fa-lg fa-fw"></i></span>
                                                                            <select  name="AUTORIDAD" class="form-control input-group-sm"   >
                                                                                <option value="">[Autoridad]</option>
                                                                                <option value="1">Pastor</option>
                                                                                <option value="2">Primer Anciano</option>
                                                                                <option value="3">Sacerdote</option>
                                                                            </select>   

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Nombres y Apellidos" type="text"  name="AUT_APELLIDOSNOMBRES"  maxlength="90">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-mobile-phone fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Telefono/Celular" type="text" name="AUT_CELULAR"  maxlength="20">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">

                                                                <div class="col-sm-12">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-suitcase fa-lg fa-fw"></i></span>
                                                                            <textarea  name="ING_QTA_CAT_OTRAS_EMPRESAS"  placeholder="Otras Empresas"  class="form-control input-group-sm"  cols="60" rows="6" maxlength="500" ></textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="tab-pane" id="tab4">

                                                            <h3><strong>Paso 4</strong> - Datos de padre y madre</h3>

                                                            <div class="row">

                                                                <div class="col-sm-6">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" class="form-control input-group-sm" name="APELLIDOS_NOMBRES_PADRE" placeholder="Apellidos y nombres del Padre" onblur="this.value = this.value.toUpperCase()"  maxlength="50">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text"  class="form-control input-group-sm" name="APELLIDOS_NOMBRES_MADRE" placeholder="Apellidos y nombre del Madre" onblur="this.value = this.value.toUpperCase()"  maxlength="50">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <h3><strong>Paso 5</strong> - Datos del cónyugue</h3>

                                                            <div class="row"> 
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-male fa-lg fa-fw"></i></span>


                                                                            <select  id="tra_upeu_con" name="TRABAJA_UPEU_CONYUGUE" required="" class="form-control input-group-sm select-conyugue" >
                                                                                <option value="" selected=""  disabled="">¿Trabaja Upeu Conyugue?</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="0">No</option>

                                                                            </select> 

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>

                                                                            <input id="nom_ape_con" type="text" name="APELLIDO_NOMBRES_CONYUGUE" placeholder="Apellidos y Nombres" required="" onblur="this.value = this.value.toUpperCase()" class="nom_c form-control input-group-sm" maxlength="110">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-calendar fa-lg fa-fw"></i><label class="text_edad"></label></span>
                                                                            <input id="nac_con" type="date" name="FECHA_NAC_CONYUGUE" placeholder="Fecha de Nacimiento dd/mm/yy" class="date f_nac form-control input-group-sm fe_nac_c" required="">
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-indent fa-lg fa-fw"></i></span>
                                                                            <select id="doc_con" name="TIPO_DOC_ID" required="" class="ti_documento form-control input-group-sm select-doc_c">
                                                                                <option value="">[Tipo Documento]</option>

                                                                                <%
                                                                                    for (int h = 0; h < Listar_tipo_doc.size(); h++) {
                                                                                        Tipo_Documento tdoc = new Tipo_Documento();
                                                                                        tdoc = (Tipo_Documento) Listar_tipo_doc.get(h);
                                                                                        if (tdoc.getId_tipo_doc_ident().trim().equals("1")) {
                                                                                %>
                                                                                <option selected="selected" value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%} else {%>

                                                                                <option value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%}
                                                                                    }%>
                                                                            </select> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-list-alt fa-lg fa-fw"></i></span>
                                                                            <input id="num_con" type="text" name="NRO_DOC_C" placeholder="Nro de Documento" maxlength="10" class="num_doc form-control input-group-sm doc_c" required="">
                                                                            <input type="hidden" class="cony"  name="CONYUGUE"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-medkit fa-lg fa-fw"></i></span>
                                                                            <select id="ins_vig_con" name="INSCRIPCION_VIG_ESSALUD" required=""  class="form-control input-group-sm" >
                                                                                <option value="" selected="" >[Inscripción Vigente en Essalud]</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="0">No</option>

                                                                            </select> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <h3><strong>Paso 6</strong> - Datos de hijo(s)</h3>   
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="APELLIDO_P_H" placeholder="Apellido Paterno"  maxlength="30" onblur="this.value = this.value.toUpperCase()" class="form-control input-group-sm i_app_h formHijo" />

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text"  name="APELLIDO_M_H" placeholder="Apellido Materno"  maxlength="30"  onblur="this.value = this.value.toUpperCase()" class="form-control input-group-sm i_apm_h formHijo" />

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text"  name="NOMBRE_H" placeholder="Nombres"  maxlength="30" onblur="this.value = this.value.toUpperCase()" class="form-control input-group-sm i_no_h formHijo" />

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-calendar fa-lg fa-fw"></i></span>
                                                                            <input type="date" name="FECHA_NAC_H" placeholder="Fecha de Nacimiento dd/mm/yy"  class="form-control input-group-sm i_fnac_h formHijo"  />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="SEXO_H" class="form-control input-group-sm i_sexo_h formHijo" >
                                                                                <option value="" selected=""  >[Sexo]</option>
                                                                                <option value="M">Masculino</option>
                                                                                <option value="F">Femenino</option>

                                                                            </select> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-indent fa-lg fa-fw"></i></span>
                                                                            <select name="TIPO_DOC_ID_H"  class="form-control input-group-sm i_tdoc_h formHijo"  >
                                                                                <option value="">[Tipo Documento]</option>
                                                                                <%
                                                                                    for (int h = 0; h < Listar_tipo_doc.size(); h++) {
                                                                                        Tipo_Documento tdoc = new Tipo_Documento();
                                                                                        tdoc = (Tipo_Documento) Listar_tipo_doc.get(h);
                                                                                        if (tdoc.getId_tipo_doc_ident().trim().equals("1")) {
                                                                                %>
                                                                                <option selected="selected" value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%} else {%>

                                                                                <option value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%}
                                                                                    }%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-list-alt fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="NRO_DOC_H"  class="form-control input-group-sm i_ndoc_h formHijo" placeholder="Nro de Documento" maxlength="10" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-medkit fa-lg fa-fw"></i></span>
                                                                            <select name="INSCRIPCION_VIG_ESSALUD_H"   class="form-control input-group-sm i_essalud_h formHijo">
                                                                                <option value="" selected="" disabled="">[Inscripción Vigente en Essalud]</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="0">No</option>
                                                                            </select> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-graduation-cap fa-lg fa-fw"></i></span>
                                                                            <select name="ESTUD_NIV_SUPERIOR_H" class="form-control input-group-sm i_es_sup_h formHijo" >
                                                                                <option value="" selected="" disabled="">Estudio de Nivel Superior</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="0">No</option>
                                                                            </select> 
                                                                            <input type="hidden" name="num_hijo"  value="0" class="num_hijo"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                            <div class="btn-mant">
                                                                <button type="button" class="btn-reg-hijo btn btn-info btn-labeled"><span class="btn-label">
                                                                        <i class="fa fa-child fa-lg fa-fw"></i>
                                                                    </span>Agregar Hijo</button>
                                                            </div>
                                                            <div class="row">
                                                                <table class="table table-bordered" style="width: 98%; margin:auto;margin-top:1%; ">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Apellido Paterno</th>
                                                                            <th>Apellido Materno</th>
                                                                            <th>Nombres</th>
                                                                            <th>Fecha de Nacimiento</th>
                                                                            <th>Sexo</th>
                                                                            <th>Tipo de Documento</th>
                                                                            <th>Nro de Documento</th>
                                                                            <th>Essalud</th>
                                                                            <th>Estudios Superiores</th>
                                                                            <th colspan="2"><center>Opciones</center></th>
                                                                    </tr>        
                                                                    </thead>
                                                                    <tbody class="tabla-hijo">
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <br><br>
                                                            <input type="hidden" name="opc" value="Registrar" >
                                                            <center><input type="submit" name=""  class="submit btn btn-primary" value="Registrar Trabajador" style="width: 30%"></center>
                                                        </div>
                                                        <div class="form-actions">
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <ul class="pager wizard no-margin">
                                                                        <!--<li class="previous first disabled">
                                                                        <a href="javascript:void(0);" class="btn btn-lg btn-default"> First </a>
                                                                        </li>-->
                                                                        <li class="previous disabled">
                                                                            <a href="javascript:void(0);" class="btn btn-lg btn-default "><i class="fa fa-chevron-left"></i> Atras </a>
                                                                        </li>
                                                                        <!--<li class="next last">
                                                                        <a href="javascript:void(0);" class="btn btn-lg btn-primary"> Last </a>
                                                                        </li>-->
                                                                        <li class="next">
                                                                            <a href="javascript:void(0);" class="btn btn-lg txt-color-darken"> Siguiente <i class="fa fa-chevron-right"></i></a>
                                                                        </li>

                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                        </div>
                                        </form>


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
    <center>                                                                       
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Encontrar Conyugue</h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div id="contenido">
                                <div >

                                    <form class="form-inline" id="frm_filtro" method="post" name="formulario"  >

                                        <div class="row">
                                            <div class="form-group" >
                                                <label class="control-label" >Nombres</label><br>
                                                <input type="text"  class="form-control"  name="nom" maxlength="80" >
                                            </div>
                                            <div class="form-group" >
                                                <label class="control-label" >Apellido Paterno</label><br>
                                                <input type="text"  class="form-control"  name="ap_pa" maxlength="80">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="control-label" >Apellido Materno</label><br>
                                                <input type="text"  class="form-control"  name="ap_ma" maxlength="80" >
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label" >DNI:</label><br>
                                                <input type="text"  class="form-control"  onKeyPress="return checkIt(event)"   name="dni" maxlength="8">
                                            </div>
                                        </div>

                                        <div class="row">

                                            <div class="form-group">                            
                                                <button type="button" class="btn btn-primary" id="btnfiltrar" >Buscar</button>
                                            </div>
                                            <div class="form-group">  
                                                <a href="javascript:;"  id="btncancel" class="btn btn-primary" >Cancelar</a>
                                            </div>

                                        </div>

                                    </form>

                                </div> 

                                <hr/>

                                <table  id="data"  >
                                    <thead class="tab_cabe">
                                        <tr>
                                            <td><span title="NOMBRE_AP">Nombres y Apellidos</span></td>
                                            <td><span  >DNI</span></td>
                                            <td></td>

                                        </tr>
                                    </thead>

                                    <tbody class="tbodys">
                                    </tbody>
                                </table>

                            </div>
                        </div>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-salir-busc"  data-dismiss="modal">Salir</button>

                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <button  data-toggle="modal" data-target="#myModal" id="btn-mostrar" hidden="">
            Launch demo modal
        </button>
    </center>
    <!-- END MAIN PANEL -->


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

    <!-- EASY PIE CHARTS 
    <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>-->

    <!-- SPARKLINES 
    <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>-->

    <!-- JQUERY VALIDATE -->
    <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

    <!-- JQUERY MASKED INPUT -->
    <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

    <!-- JQUERY SELECT2 INPUT -->
    <script src="../../js/plugin/select2/select2.min.js"></script>

    <!-- JQUERY UI + Bootstrap Slider
    <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script> -->

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
    <!-- Voice command : plugin 
    <script src="../../js/speech/voicecommand.min.js"></script>-->

    <!-- PAGE RELATED PLUGIN(S) -->
    <script src="../../js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="../../js/plugin/fuelux/wizard/wizard.min.js"></script>
    <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
    <script type="text/javascript" src="../../js/Js_Validar/Validar_Formulario.js"></script>
    <script src="../../js/jquery-ui.js" type="text/javascript"></script>
    <script src="../../js/jquery.mask.js" type="text/javascript"></script>
    <script src="../../js/Js_Formulario/Js_Form.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../js/Js_Trabajador/Js_Form_Trabajador.js"></script>
    <script type="text/javascript">
                                                    $(".cod_uni").keypress(function (event) {
                                                        return /\d/.test(String.fromCharCode(event.keyCode));
                                                    });
                                                    function cod_uni_unico() {
                                                        var x = false;
                                                        $.ajax({
                                                            async: false,
                                                            url: "../../trabajador",
                                                            type: "POST",
                                                            data: "opc=validar_cod_uni&" + "cod_uni=" + $(".cod_uni").val()
                                                        }).done(function (e) {
                                                            if (e.cod > 0) {
                                                                x = false;
                                                            } else {
                                                                x = true;
                                                            }
                                                        }).fail(function (e) {
                                                            alert("Error: " + e);
                                                        });
                                                        return x;
                                                    }
                                                    function estado_civil(es_civil) {
                                                        if (es_civil == '1' || es_civil == '3' || es_civil == '4' || es_civil == '5') {
                                                            //REMOVE REQUIRED
                                                            $("#tra_upeu_con").removeAttr('required');
                                                            $("#nom_ape_con").removeAttr('required');
                                                            $("#nac_con").removeAttr('required');
                                                            $("#doc_con").removeAttr('required');
                                                            $("#num_con").removeAttr('required');
                                                            $("#ins_vig_con").removeAttr('required');
                                                            //ADD DISABLED
                                                            document.getElementById("tra_upeu_con").disabled = true;
                                                            document.getElementById("nom_ape_con").disabled = true;
                                                            document.getElementById("nac_con").disabled = true;
                                                            document.getElementById("doc_con").disabled = true;
                                                            document.getElementById("num_con").disabled = true;
                                                            document.getElementById("ins_vig_con").disabled = true;
                                                        }
                                                        if (es_civil == '2' || es_civil == '6') {
                                                            //ADD REQUIRED
                                                            $("#tra_upeu_con").attr("required", "required");
                                                            $("#nom_ape_con").attr("required", "required");
                                                            $("#nac_con").attr("required", "required");
                                                            $("#doc_con").attr("required", "required");
                                                            $("#num_con").attr("required", "required");
                                                            $("#ins_vig_con").removeAttr("required", "required");
                                                            //ADD DISABLED
                                                            document.getElementById("tra_upeu_con").disabled = false;
                                                            document.getElementById("nom_ape_con").disabled = false;
                                                            document.getElementById("nac_con").disabled = false;
                                                            document.getElementById("doc_con").disabled = false;
                                                            document.getElementById("num_con").disabled = false;
                                                            document.getElementById("ins_vig_con").disabled = false;
                                                        }
                                                    }
                                                    function cuenta_bancaria(banco) {
                                                        if (banco == '') {
                                                            $("#no_cuen").hide(200);
                                                            $("#no_cuen_ban").hide(200);
                                                            $("#generar").hide(200);
                                                            $("#texto").hide(200);
                                                            $("#no_cuen_otros").hide(200);
                                                            $("#banco").val("");
                                                            $("#nu_cuen").val("");
                                                            $("#nu_cuen_ban").val("");
                                                            $("#nu_cuen_ban_otros").val("");
                                                            $("#nu_cuen_otros").val("");
                                                            $("#es_cuenta").val(0);
                                                            $("#subscription").attr('checked', false);
                                                        }
                                                        if (banco == '0') {
                                                            $("#no_cuen").hide(200);
                                                            $("#nu_cuen").val("");
                                                            $("#no_cuen_ban").hide(200);
                                                            $("#nu_cuen_ban").val("");
                                                            $("#no_cuen_otros").show(200);
                                                            $("#nu_cuen_otros").val("BBVA Banco Continental");
                                                            $("#nu_cuen_otros").attr('readonly', 'readonly');
                                                            $("#texto").show(200);
                                                            $("#generar").show(200);
                                                            $("#subscription").attr("required", "required");
                                                            $("#nu_cuen_otros").attr("required", "required");
                                                            $("#nu_cuen_otros").removeAttr('maxlength');
                                                            $("#nu_cuen_otros").removeAttr('minlength');
                                                            $("#es_cuenta").val(1);
                                                        }
                                                        if (banco == '1') {
                                                            $("#generar").hide(200);
                                                            $("#no_cuen").show(200);
                                                            $("#nu_cuen").val("");
                                                            $("#nu_cuen").attr("required", "required");
                                                            $("#no_cuen_ban").hide(200);
                                                            $("#nu_cuen_ban").val("");
                                                            $("#subscription").attr('checked', false);
                                                            $("#nu_cuen").attr("maxlength", "21");
                                                            $("#nu_cuen").attr("minlength", "18");
                                                            //$("#nu_cuen").val("0011-")
                                                            $("#no_cuen_otros").hide(200);
                                                            $("#nu_cuen_otros").val("");
                                                            $("#texto").hide(200);
                                                            $("#es_cuenta").val(1);
                                                        }
                                                        if (banco == '2') {
                                                            
                                                            $("#generar").hide(200);
                                                            $("#subscription").attr('checked', false);
                                                            $("#no_cuen_ban").hide(200);
                                                            $("#nu_cuen_ban").val("");
                                                            $("#no_cuen").show(200);
                                                            $("#nu_cuen").val("");
                                                            $("#nu_cuen").attr("required", "required");
                                                            $("#nu_cuen_otros").removeAttr('maxlength');
                                                            $("#nu_cuen_otros").removeAttr('minlength');
                                                            $("#nu_cuen").removeAttr('maxlength');
                                                            $("#nu_cuen").removeAttr('minlength');
                                                            $("#nu_cuen").attr("maxlength", "14");
                                                            $("#nu_cuen").attr("minlength", "0");
                                                            //$("#nu_cuen").mask("99999999999999", {placeholder: "X"});
                                                            $("#no_cuen_otros").hide(200);
                                                            $("#nu_cuen_otros").val("");
                                                            $("#texto").hide(200);
                                                            $("#nu_cuen").valid();
                                                            $("#es_cuenta").val(1);
                                                        }
                                                        if (banco == '3') {
                                                            $("#no_cuen").show(200);
                                                            $("#no_cuen").val("");
                                                            $("#nu_cuen").attr("required", "required");
                                                            $("#no_cuen_ban").show(200);
                                                            $("#no_cuen_ban").val("");
                                                            $("#nu_cuen_ban").attr("required", "required");
                                                            $("#no_cuen_otros").show(200);
                                                            $("#nu_cuen_otros").val("");
                                                            $("#nu_cuen_otros").attr("required", "required");
                                                            $("#generar").hide(200);
                                                            $("#subscription").attr('checked', false);
                                                            $("#texto").hide(200);
                                                            $("#nu_cuen_otros").removeAttr('readonly');
                                                            $("#nu_cuen_otros").removeAttr('maxlength');
                                                            $("#nu_cuen_otros").removeAttr('minlength');
                                                            $("#es_cuenta").val(1);
                                                        }
                                                    }
                                                    function  duplicar() {
                                                        var DAD1 = $("#DOM_A_D1").val();
                                                        var DAD2 = $("#DOM_A_D2").val();
                                                        var DAD3 = $("#DOM_A_D3").val();
                                                        var DAD4 = $("#DOM_A_D4").val();
                                                        var DAD5 = $("#DOM_A_D5").val();
                                                        var DAD6 = $("#DOM_A_D6").val();
                                                        var DEP_A = $("#dep_dir_a").val();
                                                        var DADIS = $("#DOM_A_DISTRITO").val();
                                                        var PRO_ACT = $("#pro_dir_a").val();
                                                        $("#DOM_LEG_D1").val(DAD1);
                                                        $("#DOM_LEG_D2").val(DAD2);
                                                        $("#DOM_LEG_D3").val(DAD3);
                                                        $("#DOM_LEG_D4").val(DAD4);
                                                        $("#DOM_LEG_D5").val(DAD5);
                                                        $("#DOM_LEG_D6").val(DAD6);
                                                        list_prov_id_dep(DEP_A, $("#pro_dir_l"), "1", PRO_ACT)
                                                        list_dist_id_prov(PRO_ACT, $("#DOM_LEG_DISTRITO"), "1", DADIS);
                                                        //  $("#DOM_LEG_DISTRITO").val(DADIS);
                                                        $("#dep_dir_l").val(DEP_A);
                                                        // $("#pro_dir_l").val(PRO_ACT);
                                                    }
                                                    function nobackbutton() {
                                                        
                                                        window.location.hash = "no-back-button";
                                                        window.location.hash = "Again-No-back-button" //chrome
                                                        
                                                        window.onhashchange = function () {
                                                            window.location.hash = "no-back-button";
                                                        }
                                                    }
                                                    function val_doc(valor) {
                                                        var x = false;
                                                        if (true) {
                                                            $.ajax({
                                                                async: false,
                                                                url: "../../trabajador",
                                                                data: "opc=Val_num_Doc&doc=" + valor,
                                                                type: "post"
                                                            }).done(function (e) {
                                                                if (e.nu_doc) {
                                                                    x = false;
                                                                } else {
                                                                    x = true;
                                                                }
                                                            });
                                                        }
                                                        return x;
                                                    }
                                                    
                                                    function val_diezmo() {
                                                        var x = false;
                                                        if ($('.cbkDiezmo').is(':visible')) {
                                                            if ($(".cbkDiezmo").prop('checked')) {
                                                                $(".cbkDiezmo").parent().removeClass("state-error");
                                                                $(".cbkDiezmo").parent().addClass("state-success");
                                                                x = true;
                                                            } else {
                                                                $(".cbkDiezmo").parent().removeClass("state-success");
                                                                $(".cbkDiezmo").parent().addClass("state-error");
                                                            }
                                                        }
                                                        return x;
                                                    }
                                                    
                                                    function list_prov_id_dep(rg, ti, selected, id_select) {
                                                        var data = "id_dep=" + rg + "&opc=dep_nac";
                                                        ti.append('<option value="">Cargando...</option>').val('');
                                                        $.post("../../ubigeo", data, function (objJson) {
                                                            ti.empty();
                                                            if (objJson.rpta == -1) {
                                                                alert(objJson.mensaje);
                                                                return;
                                                            }
                                                            var lista = objJson.lista;
                                                            if (lista.length > 0) {
                                                                if (selected == "0") {
                                                                    ti.append("<option value=''>[Seleccione]</option>");
                                                                    for (var i = 0; i < lista.length; i++) {
                                                                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                                                                        ti.append(item);
                                                                    }
                                                                } else if (selected == "1") {
                                                                    
                                                                    ti.append("<option value=''>[Seleccione]</option>");
                                                                    for (var i = 0; i < lista.length; i++) {
                                                                        if (id_select === lista[i].id) {
                                                                            var item = "<option value='" + lista[i].id + "' selected>" + lista[i].descripcion + "</option>";
                                                                            ti.append(item);
                                                                        } else {
                                                                            var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                                                                            ti.append(item);
                                                                        }
                                                                    }
                                                                }
                                                            } else {
                                                                ti.append("<option value=''>[Provincia]</option>");
                                                            }
                                                        });
                                                    }
                                                    //DISTRITO
                                                    function list_dist_id_prov(rg, ti, selected, id_select) {
                                                        var data = "id_dist=" + rg + "&opc=pro_nac";
                                                        ti.append('<option value="">Cargando...</option>').val('');
                                                        ti.empty();
                                                        $.post("../../ubigeo", data, function (objJson) {
                                                            
                                                            if (objJson.rpta == -1) {
                                                                alert(objJson.mensaje);
                                                                return;
                                                            }
                                                            var lista = objJson.lista;
                                                            if (lista.length > 0) {
                                                                if (selected == "0") {
                                                                    ti.append("<option value=''>[Seleccione]</option>");
                                                                    for (var i = 0; i < lista.length; i++) {
                                                                        var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                                                                        ti.append(item);
                                                                    }
                                                                } else if (selected == "1") {
                                                                    ti.append("<option value=''>[Seleccione]</option>");
                                                                    for (var i = 0; i < lista.length; i++) {
                                                                        if (id_select === lista[i].id) {
                                                                            var item = "<option value='" + lista[i].id + "' selected>" + lista[i].descripcion + "</option>";
                                                                            ti.append(item);
                                                                        } else {
                                                                            var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                                                                            ti.append(item);
                                                                        }
                                                                    }
                                                                }
                                                            } else {
                                                                ti.append("<option value=''>[Distrito]</option>");
                                                            }
                                                        });
                                                    }
                                                    
                                                    //PROVINCIA
                                                    $("#dep_dir_l").change(function () {
                                                        var ti = $("#pro_dir_l");
                                                        var rg = $("#dep_dir_l").val();
                                                        list_prov_id_dep(rg, ti, "0", "");
                                                    });
                                                    
                                                    $(document).ready(function () {
                                                        $("#wizard-1")[0].reset();
                                                        pageSetUp();
                                                        var $validator = $("#wizard-1").validate({
                                                            rules: {
                                                                email: {
                                                                    required: true,
                                                                    email: "Your email address must be in the format of name@domain.com"
                                                                },
                                                                FECHA_NAC: {
                                                                    required: true,
                                                                    val_fecha: true,
                                                                    val_edad: true
                                                                }
                                                                ,
                                                                FECHA_NAC_H: {
                                                                    val_fecha: true
                                                                }
                                                                ,
                                                                FECHA_NAC_CONYUGUE: {
                                                                    val_fecha: true,
                                                                    val_edad: true
                                                                },
                                                                wphone: {
                                                                    required: true,
                                                                    minlength: 10
                                                                },
                                                                hphone: {
                                                                    required: true,
                                                                    minlength: 10
                                                                }, NRO_DOC: {
                                                                    val_doc: true
                                                                }, COD_UNI: {
                                                                    val_cod_uni: true
                                                                            
                                                                }
                                                                /*, diezmo: {
                                                                 required: true
                                                                 }*/
                                                            },
                                                            messages: {
                                                                fname: "Please specify your First name",
                                                                lname: "Please specify your Last name",
                                                                email: {
                                                                    required: "We need your email address to contact you",
                                                                    email: "Your email address must be in the format of name@domain.com"
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
                                                        
                                                        jQuery.validator.addMethod("val_fecha", function (value, element) {
                                                            var d = value.split("-");
                                                            return this.optional(element) || String(parseInt(d[0])).length === 4;
                                                        }, "¡Fecha ingresada invalida!");
                                                        jQuery.validator.addMethod("val_edad", function (value, element) {
                                                            return this.optional(element) || calcular_edad(value) > 0;
                                                        }, "¡La edad debe ser mayor a cero!");
                                                        
                                                        jQuery.validator.addMethod("val_doc", function (value, element) {
                                                            return this.optional(element) || val_doc(value);
                                                        }, "¡Numero de documento ya existe!");
                                                        jQuery.validator.addMethod("val_cod_uni", function (value, element) {
                                                            return this.optional(element) || cod_uni_unico();
                                                        }, "¡Código universitario ya existe!");
                                                        
                                                        
                                                        $('.step').click(function () {
                                                            var index = $('#bootstrap-wizard-1').bootstrapWizard('currentIndex');
                                                            if ($(this).find('i').hasClass("fa-check")) {
                                                                if (!$("#wizard-1").valid() & $('.step').eq(index).find('i').hasClass("fa-check")) {
                                                                    $validator.focusInvalid();
                                                                } else {
                                                                    $('#bootstrap-wizard-1').bootstrapWizard('show', $('.step').index(this));
                                                                }
                                                            } else {
                                                                if (!$("#wizard-1").valid()) {
                                                                    $validator.focusInvalid();
                                                                } else {
                                                                    $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index).addClass(
                                                                            'complete');
                                                                    $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index).find('.step')
                                                                            .html('<i class="fa fa-check"></i>');
                                                                    
                                                                    if ($('.step').eq($('.step').index(this) - 1).find('i').hasClass("fa-check")) {
                                                                        $('#bootstrap-wizard-1').bootstrapWizard('show', $('.step').index(this));
                                                                    }
                                                                }
                                                            }
                                                        });
                                                        function validateTab(index) {
                                                            var $valid = $("#wizard-1").valid();
                                                            if (!$valid) {
                                                                $validator.focusInvalid();
                                                                return true;
                                                            } else {
                                                                $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).addClass(
                                                                        'complete');
                                                                $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).find('.step')
                                                                        .html('<i class="fa fa-check"></i>');
                                                            }
                                                            return true;
                                                        }
                                                        
                                                        $('#bootstrap-wizard-1').bootstrapWizard({
                                                            'tabClass': 'form-wizard',
                                                            onTabClick: function (tab, navigation, index) {
                                                                return validateTab(index, tab)
                                                                //return true;
                                                            },
                                                            'onNext': function (tab, navigation, index) {
                                                                return validateTab(index);
                                                            }
                                                        });
                                                        $("#inst").change(function () {
                                                            var carr = $("#carrera");
                                                            carr.empty();
                                                            var insti = $("#inst").val();
                                                            var data = "inst=" + insti + "&opc=carrera";
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
                                                        var tip = $("#pro_dir_l");
                                                        tip.empty();
                                                        var rg = $("#dep_dir_l").val();
                                                        var data = "id_dep=" + rg + "&opc=dep_nac";
                                                        tip.append('<option value="">Cargando...</option>').val('');
                                                        $.post("../../ubigeo", data, function (objJson) {
                                                            tip.empty();
                                                            if (objJson.rpta === -1) {
                                                                alert(objJson.mensaje);
                                                                return;
                                                            }
                                                            var lista = objJson.lista;
                                                            if (lista.length > 0) {
                                                                tip.append("<option value=''>[Seleccione]</option>");
                                                            } else {
                                                                tip.append("<option value=''>[]</option>");
                                                            }
                                                            for (var i = 0; i < lista.length; i++) {
                                                                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                                                                tip.append(item);
                                                            }
                                                        });
                                                        var ti = $("#DOM_LEG_DISTRITO");
                                                        ti.empty();
                                                        var rg = $("#pro_dir_l").val();
                                                        var data = "id_dist=" + rg + "&opc=pro_nac";
                                                        ti.append('<option value="">Cargando...</option>').val('');
                                                        $.post("../../ubigeo", data, function (objJson) {
                                                            ti.empty();
                                                            if (objJson.rpta === -1) {
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
                                                        $(".doc, .doc_c").attr("maxlength", "8");
                                                        $(".doc, .doc_c").attr("minlength", "8");
                                                        //  $(".doc, .doc_c").val("");
                                                        $("#docs, .doc_c, #nu_cuen, #nu_cuen_ban").numeric();
                                                        $("#doc, .doc_c").numeric(false, function () {
                                                            alert("Solo Numeros Enteros");
                                                            this.value = "";
                                                            this.focus();
                                                        });
                                                        $(".positive").numeric({negative: false}, function () {
                                                            alert("No negative values");
                                                            this.value = "";
                                                            this.focus();
                                                        });
                                                        $(".positive-integer").numeric({decimal: false, negative: false}, function () {
                                                            alert("Positive integers only");
                                                            this.value = "";
                                                            this.focus();
                                                        });
                                                        $("#remove").click(function (e) {
                                                            e.preventDefault();
                                                            $(".numeric,.integer,.positive").removeNumeric();
                                                        }
                                                        );
                                                        
                                                        $("#reli").change(function () {
                                                            if ($(this).val() === "1") {
                                                                $(".div_diezmo").show(200);
                                                                
                                                            } else {
                                                                $(".div_diezmo").hide(200);
                                                                
                                                            }
                                                        });//
                                                        $('.cbkDiezmo').click(function () {
                                                            val_diezmo();
                                                        });
                                                        //  }
                                                        
                                                        /*Ubigeo*/
                                                        $("#dep_nac").change(function () {
                                                            var ti = $("#pro_nac");
                                                            ti.empty();
                                                            var rg = $("#dep_nac").val();
                                                            var data = "id_dep=" + rg + "&opc=dep_nac";
                                                            ti.append('<option value="">Cargando...</option>').val('');
                                                            $.post("../../ubigeo", data, function (objJson) {
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
                                                        $("#pro_nac").change(function () {
                                                            var ti = $("#dist_nac");
                                                            ti.empty();
                                                            var rg = $("#pro_nac").val();
                                                            var data = "id_dist=" + rg + "&opc=pro_nac";
                                                            ti.append('<option value="">Cargando...</option>').val('');
                                                            $.post("../../ubigeo", data, function (objJson) {
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
                                                        // ============ DIRECCION ===========
                                                        $("#dep_dir_a").change(function () {
                                                            var ti = $("#pro_dir_a");
                                                            ti.empty();
                                                            var rg = $("#dep_dir_a").val();
                                                            var data = "id_dep=" + rg + "&opc=dep_nac";
                                                            ti.append('<option value="">Cargando...</option>').val('');
                                                            $.post("../../ubigeo", data, function (objJson) {
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
                                                        $("#pro_dir_a").change(function () {
                                                            var ti = $("#DOM_A_DISTRITO");
                                                            ti.empty();
                                                            var rg = $("#pro_dir_a").val();
                                                            var data = "id_dist=" + rg + "&opc=pro_nac";
                                                            ti.append('<option value="">Cargando...</option>').val('');
                                                            $.post("../../ubigeo", data, function (objJson) {
                                                                ti.empty();
                                                                if (objJson.rpta === -1) {
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
                                                        
                                                        $("#nac").change(
                                                                function () {
                                                                    if ($("#nac").val() !== "NAC-0193") {
                                                                        $("#dist").hide(200);
                                                                        $("#dist_nac").val("DST-001832");
                                                                    }
                                                                    if ($("#nac").val() === "NAC-0193") {
                                                                        $("#dist").show(200);
                                                                    }
                                                                }
                                                        );
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
                                                        $("#pro_dir_l").change(function () {
                                                            var ti = $("#DOM_LEG_DISTRITO");
                                                            var rg = $("#pro_dir_l").val();
                                                            list_dist_id_prov(rg, ti, "0", "");
                                                        });
                                                        
                                                        
                                                        $(".select-doc").change(
                                                                function () {
                                                                    $(".doc").val("");
                                                                    if ($(".select-doc").val() === 1) {
                                                                        $("#doc").numeric(false, function () {
                                                                        });
                                                                        $(".doc").attr("maxlength", "8");
                                                                        $(".doc").attr("minlength", "8");
                                                                    } else {
                                                                        $("#doc").removeNumeric();
                                                                        $(".doc").attr("maxlength", "10");
                                                                        $(".doc").removeAttr("minlength");
                                                                        //    $(".doc").val("");
                                                                    }
                                                                    $(".doc").focus();
                                                                }
                                                        );
                                                        $(".select-doc_c").change(function () {
                                                            $(".doc_c").val("");
                                                            if ($(".select-doc_c").val() === 1) {
                                                                $(".doc_c").numeric(false, function () {
                                                                });
                                                                $(".doc_c").attr("maxlength", "8");
                                                                $(".doc_c").attr("minlength", "8");
                                                            } else {
                                                                
                                                                $(".doc_c").removeNumeric();
                                                                $(".doc_c").attr("maxlength", "10");
                                                                $(".doc_c").removeAttr("minlength");
                                                                //    $(".doc").val("");
                                                            }
                                                            
                                                        }
                                                        );
                                                        
                                                        
                                                        $(".alerta-req").hide(200);
                                                        $("#edad").change(function () {
                                                            $(".alerta-req").hide(200);
                                                            var edad = calcular_edad($("#edad").val());
                                                            $(".edad").text(edad + " años");
                                                        });
                                                        $(".fe_nac_c").change(function () {
                                                            $(".alerta-req").hide(200);
                                                            var edad = calcular_edad($(this).val());
                                                            $(".text_edad").text(edad + " años");
                                                        });
                                                        $("#sis_pens").change(function () {
                                                            if ($("#sis_pens").val() !== "1") {
                                                                $(".n_afp").remove();
                                                                $("#nom_afp").attr("disabled", true);
                                                                $(".afp").append('<input name="NOMBRE_AFP_ID" type="hidden" class="n_afp" value="6"/>');
                                                                $("#nom_afp").val("6");
                                                            }
                                                            if ($("#sis_pens").val() === "1") {
                                                                
                                                                $("#nom_afp").val("");
                                                                $("#nom_afp").removeAttr("disabled");
                                                                $(".n_afp").remove();
                                                            }
                                                        }
                                                        );
                                                        
                                                        $("#no_cuen").hide(200);
                                                        $("#no_cuen_ban").hide(200);
                                                        $("#generar").hide(200);
                                                        $("#texto").hide(200);
                                                        $("#no_cuen_otros").hide(200);
                                                        $("#banco").change(function () {
                                                            cuenta_bancaria($(this).val());
                                                            $("#nu_cuen").focus();
                                                        });
                                                        $("#es_civil").change(function () {
                                                            estado_civil($(this).val());
                                                        });
                                                        $("#DOM_A_D3").change(
                                                                function () {
                                                                    if ($("#DOM_A_D3").val() === "3") {
                                                                        $("#DOM_A_D4").val("Sin Numero");
                                                                    } else {
                                                                        $("#DOM_A_D4").val("");
                                                                    }
                                                                }
                                                        );
                                                        $("#DOM_LEG_D3").change(
                                                                function () {
                                                                    if ($("#DOM_LEG_D3").val() === "3") {
                                                                        $("#DOM_LEG_D4").val("Sin Numero");
                                                                    } else {
                                                                        $("#DOM_LEG_D4").val("");
                                                                    }
                                                                }
                                                        );
                                                        $("#reli").change(function () {
                                                            if ($("#reli").val() === "1") {
                                                                $("#igle").attr("required", "required")
                                                            } else {
                                                                $("#igle").removeAttr("required");
                                                            }
                                                        });
                                                        
                                                        $(".i_ndoc_h").numeric(false);
                                                        var p = 1;
                                                        var texto_h = "";
                                                        $(".i_tdoc_h").change(function () {
                                                            $(".i_ndoc_h").val("");
                                                            if ($(this).val() === 1) {
                                                                $(".i_ndoc_h").numeric(false);
                                                                $(".i_ndoc_h").attr("maxlength", "8");
                                                                $(".i_ndoc_h").attr("minlength", "8");
                                                            } else {
                                                                $(".i_ndoc_h").removeNumeric();
                                                                $(".i_ndoc_h").attr("maxlength", "10");
                                                                $(".i_ndoc_h").removeAttr("minlength");
                                                            }
                                                            $(".i_ndoc_h").focus();
                                                        });
                                                        function validarFormHijo() {
                                                            var ap_pat = $(".i_app_h");
                                                            var ap_mat = $(".i_apm_h");
                                                            var nombre = $(".i_no_h");
                                                            var fe_nac = $(".i_fnac_h");
                                                            var sexo = $(".i_sexo_h");
                                                            var t_doc = $(".i_tdoc_h");
                                                            var ndoc = $(".i_ndoc_h");
                                                            var essalud = $(".i_essalud_h");
                                                            var es_sup = $(".i_es_sup_h");
                                                            var x, a, b, c, d, e, f, g, h, i = false;
                                                            if (ap_pat.val() === "") {
                                                                var $p = ap_pat.parent().parent();
                                                                $p.removeClass('has-success');
                                                                $p.addClass('has-error');
                                                                if (ap_pat.parents(".form-group").find(".help-block").length === 0) {
                                                                    ap_pat.parents(".form-group").append("<span  class='help-block'>Ingrese un apellido paterno</span>");
                                                                }
                                                                a = false;
                                                            } else {
                                                                ap_pat.parents(".form-group").find(".help-block").remove();
                                                                a = true;
                                                            }
                                                            if (ap_mat.val() === "") {
                                                                var $p = ap_mat.parent().parent();
                                                                $p.removeClass('has-success');
                                                                $p.addClass('has-error');
                                                                if (ap_mat.parents(".form-group").find(".help-block").length === 0) {
                                                                    ap_mat.parents(".form-group").append("<span  class='help-block'>Ingrese un apellido materno</span>");
                                                                }
                                                                
                                                                b = false;
                                                            } else {
                                                                ap_mat.parents(".form-group").find(".help-block").remove();
                                                                b = true;
                                                            }
                                                            if (nombre.val() === "") {
                                                                var $p = nombre.parent().parent();
                                                                $p.removeClass('has-success');
                                                                $p.addClass('has-error');
                                                                if (nombre.parents(".form-group").find(".help-block").length === 0) {
                                                                    nombre.parents(".form-group").append("<span  class='help-block'>Ingrese un nombre</span>");
                                                                }
                                                                
                                                                c = false;
                                                            } else {
                                                                nombre.parents(".form-group").find(".help-block").remove();
                                                                c = true;
                                                            }
                                                            if (fe_nac.val() === "") {
                                                                var $p = fe_nac.parent().parent();
                                                                $p.removeClass('has-success');
                                                                $p.addClass('has-error');
                                                                if (fe_nac.parents(".form-group").find(".help-block").length === 0) {
                                                                    fe_nac.parents(".form-group").append("<span  class='help-block'>Ingrese fecha de nacimiento</span>");
                                                                }
                                                                
                                                                d = false;
                                                            } else {
                                                                fe_nac.parents(".form-group").find(".help-block").remove();
                                                                d = true;
                                                            }
                                                            if (sexo.val() === "") {
                                                                var $p = sexo.parent().parent();
                                                                $p.removeClass('has-success');
                                                                $p.addClass('has-error');
                                                                if (sexo.parents(".form-group").find(".help-block").length === 0) {
                                                                    sexo.parents(".form-group").append("<span  class='help-block'>Seleccione un género</span>");
                                                                }
                                                                
                                                                e = false;
                                                            } else {
                                                                sexo.parents(".form-group").find(".help-block").remove();
                                                                e = true;
                                                            }
                                                            if (t_doc.val() === "") {
                                                                var $p = t_doc.parent().parent();
                                                                $p.removeClass('has-success');
                                                                $p.addClass('has-error');
                                                                if (t_doc.parents(".form-group").find(".help-block").length === 0) {
                                                                    t_doc.parents(".form-group").append("<span  class='help-block'>Seleccione un tipo de documento</span>");
                                                                    
                                                                }
                                                                f = false;
                                                            } else {
                                                                t_doc.parents(".form-group").find(".help-block").remove();
                                                                f = true;
                                                            }
                                                            if (ndoc.val() === "") {
                                                                var $p = ndoc.parent().parent();
                                                                $p.removeClass('has-success');
                                                                $p.addClass('has-error');
                                                                if (ndoc.parents(".form-group").find(".help-block").length === 0) {
                                                                    ndoc.parents(".form-group").append("<span  class='help-block'>Ingrese numero de documento</span>");
                                                                }
                                                                g = false;
                                                            } else {
                                                                ndoc.parents(".form-group").find(".help-block").remove();
                                                                g = true;
                                                            }
                                                            if (essalud.val() === null) {
                                                                var $p = essalud.parent().parent();
                                                                $p.removeClass('has-success');
                                                                $p.addClass('has-error');
                                                                if (essalud.parents(".form-group").find(".help-block").length === 0) {
                                                                    essalud.parents(".form-group").append("<span  class='help-block'>Seleccione un item</span>");
                                                                    
                                                                }
                                                                h = essalud;
                                                            } else {
                                                                essalud.parents(".form-group").find(".help-block").remove();
                                                                h = true;
                                                            }
                                                            if (es_sup.val() === null) {
                                                                var $p = es_sup.parent().parent();
                                                                $p.removeClass('has-success');
                                                                $p.addClass('has-error');
                                                                if (es_sup.parents(".form-group").find(".help-block").length === 0) {
                                                                    es_sup.parents(".form-group").append("<span  class='help-block'>Seleccione un item</span>");
                                                                }
                                                                
                                                                i = false;
                                                            } else {
                                                                es_sup.parents(".form-group").find(".help-block").remove();
                                                                i = true;
                                                            }
                                                            if (a && b && c && d && e && f && g && h && i) {
                                                                x = true;
                                                            } else {
                                                                x = false;
                                                            }
                                                            return x;
                                                        }
                                                        $(".formHijo").change(function () {
                                                            validarFormHijo();
                                                        });
                                                        $(".btn-reg-hijo").click(function () {
                                                            var tabla_hijo = $(".tabla-hijo");
                                                            var ap_pat = $(".i_app_h");
                                                            var ap_mat = $(".i_apm_h");
                                                            var nombre = $(".i_no_h");
                                                            var fe_nac = $(".i_fnac_h");
                                                            var sexo = $(".i_sexo_h");
                                                            var t_doc = $(".i_tdoc_h");
                                                            var ndoc = $(".i_ndoc_h");
                                                            var essalud = $(".i_essalud_h");
                                                            var es_sup = $(".i_es_sup_h");
                                                            var f = fe_nac.val();
                                                            var a = f.split("");
                                                            var fecha_naci = a[8] + a[9] + "/" + a[5] + a[6] + "/" + a[2] + a[3];
                                                            if (validarFormHijo()) {
                                                                texto_h += ("<tr class='tr_item_hijo tr-hijo_" + p + "'>");
                                                                texto_h += ('<td ><label class="td-ap_pat' + p + '">' + ap_pat.val() + '</label><input type="hidden" value="' + ap_pat.val() + '" name="APELLIDO_P_H' + p + '" class="ap_p_h_' + p + '"/></td>');
                                                                texto_h += ('<td ><label class="td-ap_mat' + p + '">' + ap_mat.val() + '</label><input type="hidden" value="' + ap_mat.val() + '" name="APELLIDO_M_H' + p + '" class="ap_m_h_' + p + '"/></td>');
                                                                texto_h += ('<td ><label class="td-nom' + p + '">' + nombre.val() + '</label><input type="hidden" value="' + nombre.val() + '" name="NOMBRE_H' + p + '" class="no_h_' + p + '"/></td>');
                                                                texto_h += ('<td ><label class="td-fe_nac' + p + '">' + fecha_naci + '</label><input type="hidden" value="' + fe_nac.val() + '" name="FECHA_NAC_H' + p + '" class="fe_n_h_' + p + '"/></td>');
                                                                texto_h += (' <td ><label class="td-sex' + p + '">' + $(".i_sexo_h option:selected").html() + '</label><input type="hidden" value="' + sexo.val() + '" name="SEXO_H' + p + '" class="sex_h_' + p + '"/></td>');
                                                                texto_h += ('<td ><label class="td-tdoc' + p + '">' + $(".i_tdoc_h option:selected").html() + '</label><input type="hidden" value="' + t_doc.val() + '" name="TIPO_DOC_ID_H' + p + '" class="ti_doc_h_' + p + '"/></td>');
                                                                texto_h += ('<td ><label class="td-ndoc' + p + '">' + ndoc.val() + '</label><input type="hidden" value="' + ndoc.val() + '" name="NRO_DOC_H' + p + '" class="nu_doc_h_' + p + '"/></td>');
                                                                texto_h += ('<td ><label class="td-essalud' + p + '">' + $(".i_essalud_h option:selected").html() + '</label><input type="hidden" value="' + essalud.val() + '" name="ESSALUD_H' + p + '" class="essalud_h_' + p + '"/></td>');
                                                                texto_h += ('<td ><label class="td-es_sup' + p + '">' + $(".i_es_sup_h option:selected").html() + '</label><input type="hidden" value="' + es_sup.val() + '" name="EST_SUP_H' + p + '" class="es_sup_h_' + p + '"/></td>');
                                                                texto_h += ('<td><button href="javascript:void(0);" type="button" value="' + p + '" class="btn btn-danger btn-labeled btn_remover" ><span class="btn-label"><i class="glyphicon glyphicon-remove"></i></span>Quitar</button> </td>');
                                                                texto_h += ('<td><button class="btn btn-success btn-labeled btn-modificar_' + p + '" href="javascript:void(0);" type="button" value="' + p + '"><span class="btn-label"><i class="glyphicon glyphicon-edit"></i></span>Modificar</button></td>');
                                                                texto_h += ("</tr>");
                                                                tabla_hijo.append(texto_h);
                                                                // $(".codigo").text(texto_h);
                                                                ap_pat.val("");
                                                                ap_mat.val("");
                                                                nombre.val("");
                                                                fe_nac.val("");
                                                                sexo.val("");
                                                                t_doc.val("");
                                                                ndoc.val("");
                                                                essalud.val("");
                                                                es_sup.val("");
                                                                $(".num_hijo").val(p);
                                                                
                                                                texto_h = "";
                                                                //  $(".num_hijo").val($(".tr_item_hijo").length);
                                                                console.log("p:" + p)
                                                                $(".btn-modificar_" + p).click(function () {
                                                                    console.log("click to button modificar")
                                                                    ap_pat.val($(".ap_p_h_" + $(this).val()).val());
                                                                    ap_mat.val($(".ap_m_h_" + $(this).val()).val());
                                                                    nombre.val($(".no_h_" + $(this).val()).val());
                                                                    fe_nac.val($(".fe_n_h_" + $(this).val()).val());
                                                                    sexo.val($(".sex_h_" + $(this).val()).val());
                                                                    t_doc.val($(".ti_doc_h_" + $(this).val()).val());
                                                                    ndoc.val($(".nu_doc_h_" + $(this).val()).val());
                                                                    essalud.val($(".essalud_h_" + $(this).val()).val());
                                                                    es_sup.val($(".es_sup_h_" + $(this).val()).val());
                                                                    $(".btn-reg-hijo").hide(200);
                                                                    $(".btn-mant").append('<button type="button" value="' + $(this).val() + '" class="btn-mod-hijo btn btn-info">Modificar Hijo</button>');
                                                                    $(".btn-mod-hijo").click(function () {
                                                                        if (validarFormHijo()) {
                                                                         $(".ap_p_h_" + $(this).val()).val(ap_pat.val());
                                                                        $(".ap_m_h_" + $(this).val()).val(ap_mat.val());
                                                                        $(".no_h_" + $(this).val()).val(nombre.val());
                                                                        $(".fe_n_h_" + $(this).val()).val(fe_nac.val());
                                                                        $(".sex_h_" + $(this).val()).val(sexo.val());
                                                                        $(".ti_doc_h_" + $(this).val()).val(t_doc.val());
                                                                        $(".nu_doc_h_" + $(this).val()).val(ndoc.val());
                                                                        $(".essalud_h_" + $(this).val()).val(essalud.val());
                                                                        $(".es_sup_h_" + $(this).val()).val(es_sup.val());
                                                                        $(".td-ap_pat" + $(this).val()).text(ap_pat.val());
                                                                        $(".td-ap_mat" + $(this).val()).text(ap_mat.val());
                                                                        $(".td-nom" + $(this).val()).text(nombre.val());
                                                                        $(".td-fe_nac" + $(this).val()).text(fe_nac.val());
                                                                        $(".td-sex" + $(this).val()).text($(".i_sexo_h option:selected").html());
                                                                        $(".td-tdoc" + $(this).val()).text($(".i_tdoc_h option:selected").html());
                                                                        $(".td-ndoc" + $(this).val()).text(ndoc.val());
                                                                        $(".td-essalud" + $(this).val()).text($(".i_essalud_h option:selected").html());
                                                                        $(".td-es_sup" + $(this).val()).text($(".i_es_sup_h option:selected").html());
                                                                        ap_pat.val("");
                                                                        ap_mat.val("");
                                                                        nombre.val("");
                                                                        fe_nac.val("");
                                                                        sexo.val("");
                                                                        t_doc.val("");
                                                                        ndoc.val("");
                                                                        essalud.val("");
                                                                        es_sup.val("");
                                                                        $(".btn-reg-hijo").show(200);
                                                                        $(".btn-mod-hijo").remove();   
                                                                        }
                                                                        
                                                                    });
                                                                });
                                                                p++;
                                                            }
                                                            $(".btn_remover").click(function () {
                                                                $('.tr-hijo_' + $(this).val()).remove();
                                                                // $(".num_hijo").val($(".tr_item_hijo").length);
                                                            });
                                                            
                                                            
                                                        });
                                                        
                                                        var b = $(".tbodys");
                                                        $("#btnfiltrar").click(
                                                                function () {
                                                                    $.post("../../ajax/Ajax_Conyugue/Ajax_Busc_Conyug.jsp", $("#frm_filtro").serialize(), function (objJson) {
                                                                        b.empty();
                                                                        var list = objJson.lista;
                                                                        for (var i = 0; i < list.length; i++) {
                                                                            b.append("<tr>");
                                                                            b.append("<td>" + list[i].NOM + " " + list[i].AP_PA + " " + list[i].AP_MA + "</td>");
                                                                            b.append("<td>" + list[i].NU_DOC + "</td>");
                                                                            b.append("<input type ='hidden' class='trab_" + i + "' value='" + list[i].ID_TRAB + "' />");
                                                                            b.append("<input type ='hidden' class='nac_" + i + "' value='" + list[i].NAC + "' />");
                                                                            b.append("<input type ='hidden' class='dni_" + i + "' value='" + list[i].NU_DOC + "' />");
                                                                            b.append("<input type ='hidden' class='tipo_" + i + "' value='" + list[i].TIPO + "' />");
                                                                            b.append("<input type ='hidden' class='nom_ape_" + i + "' value='" + list[i].NOM + " " + list[i].AP_PA + " " + list[i].AP_MA + "' />");
                                                                            if (typeof (list[i].ID_C) === "undefined") {
                                                                                b.append('<td><button type="button" class="btn btn-primary btn-add-conyugue" value="' + i + '" data-dismiss="modal">Agregar</button></td>');
                                                                            } else {
                                                                                b.append('<td>Tiene conyugue</td>');
                                                                            }
                                                                            b.append("</tr>");
                                                                        }
                                                                        $(".btn-add-conyugue").click(function () {
                                                                            var v = $(this).val();
                                                                            $(".nom_c").val($(".nom_ape_" + v).val());
                                                                            $(".f_nac").val($(".nac_" + v).val());
                                                                            $(".ti_documento").val($(".tipo_" + v).val());
                                                                            $(".num_doc").val($(".dni_" + v).val());
                                                                            $(".cony").val($(".trab_" + v).val());
                                                                            //$(".select-conyugue").val("1");
                                                                        });
                                                                    }
                                                                    );
                                                                });
                                                        $(".btn-salir-busc, .close").click(function () {
                                                            
                                                            $(".select-conyugue").val("0");
                                                        });
                                                        $(".select-conyugue").change(function () {
                                                            if ($(this).val() === "1") {
                                                                $("#btn-mostrar").click();
                                                            }
                                                            if ($(this).val() === "0") {
                                                                $(".nom_c").val("");
                                                                $(".f_nac").val("");
                                                                $(".ti_documento").val("");
                                                                $(".num_doc").val("");
                                                                $(".cony").val("");
                                                            }
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
                                                    });</script>

</body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
