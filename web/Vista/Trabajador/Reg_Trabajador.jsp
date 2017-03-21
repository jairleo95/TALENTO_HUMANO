<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
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
                                    <h2>Ficha de Trabajador</h2>

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

                                                                            <input type="text" name="FECHA_NAC" required=""  id="edad"   class="simple-field-data-mask from-datepicker form-control input-group-sm datePickerInput"
                                                                                   data-mask="99/99/9999" data-mask-placeholder= "_"  >

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
                                                                            <select class="form-control input-group-sm" id="pro_nac" name=""   required="">
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
                                                                            <input type="date" name="FE_CAD" id="fec"  class="form-control input-group-sm" >
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
                                                                            <textarea name="OTROS_ESTUDIOS"  placeholder="Otros Estudios"  class="form-control input-group-sm"  cols="60" rows="6" maxlength="500"></textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>


                                                            <h3>Cuenta sueldo </h3>
                                                            <div class="row">
                                                                <div class="col-sm-4" >
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
                                                                            <input class="form-control input-group-sm"    placeholder="Cargo en la Iglesia" type="text" name="CARGO"  maxlength="100">

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
                                                                            <input id="nac_con" type="text" name="FECHA_NAC_CONYUGUE" data-mask="99/99/9999" data-mask-placeholder= "_" 
                                                                                   class="date f_nac form-control input-group-sm fe_nac_c datePickerInput" required="">
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
                                                                            <input type="text" name="FECHA_NAC_H" data-mask="99/99/9999" data-mask-placeholder= "_"  
                                                                                   class="form-control input-group-sm i_fnac_h formHijo datePickerInput"  />
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
            modal
        </button>
    </center>
    <!-- END MAIN PANEL -->



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

    <!-- Demo purpose only 
    <script src="../../js/demo.min.js"></script>-->

    <!-- MAIN APP JS FILE -->
    <script src="../../js/app.min.js"></script>

    <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
    <!-- Voice command : plugin 
    <script src="../../js/speech/voicecommand.min.js"></script>-->

    <!-- PAGE RELATED PLUGIN(S) -->
    <script src="../../js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="../../js/plugin/fuelux/wizard/wizard.min.js"></script>
    <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
    <script src="../../js/Js_Formulario/Js_Form.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    
    <script src="../../js/businessLogic/Trabajador/regTrabajador.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    

</body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
