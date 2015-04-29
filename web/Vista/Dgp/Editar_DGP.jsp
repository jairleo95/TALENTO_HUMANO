
<%@page import="pe.edu.upeu.application.web.controller.CConversion"%>
<%@page import="pe.edu.upeu.application.model.V_Det_DGP"%>
<%@page import="pe.edu.upeu.application.model.Cuenta_Sueldo"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {

%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.When"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.V_Puesto_Direccion"%>
<%@page import="pe.edu.upeu.application.model.Puesto"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<jsp:useBean id="Listar_Trabajador_id" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="LIST_ID_DGP" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Det_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Requerimiento" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="list_Cuenta_Sueldo" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="fecha_maxima_plazo" scope="application" class="java.lang.String"/>

<!DOCTYPE html >
<html>
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Editar DGP </title>
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

        <link rel="stylesheet" href="../../css/Css_Formulario/form.css"  type="text/css" > 
        <script language="javascript" type="text/javascript" src="../../js/JQuery/jQuery.js"></script>


        <style>

            .td{
                font-weight: bold;
            }

            #titu{
                font-weight: bold;
                color: #005cac;
                // color: blue;
            }
            p{
                font-weight: bold; 
            }

        </style>

        <%            HttpSession sesion = request.getSession(true);
            String id_dep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
            String fecha_min = (String) sesion.getAttribute("FECHA_MINIMA");
            CConversion c = new CConversion();
        %>

    </head>
    <body>   


        <div id="main" role="main" style="margin: 0px;">


            <div id="content">
                <section id="widget-grid" class="">
                    <div class="row">
                        <form id="checkout-form" action="../../dgp"  novalidate="novalidate">
                            <!-- NEW COL START -->
                            <article class="col-sm-12 col-md-12 col-lg-6">

                                <div id="alerta_dgp">

                                </div>
                                <div class="div_info">

                                </div>

                                <!-- Widget ID (each widget will need unique ID)-->
                                <div class="jarviswidget" id="wid-id-2" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-custombutton="false">
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
                                        <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                        <h2>Editar Requerimiento</h2>

                                    </header>

                                    <!-- widget div-->
                                    <div>

                                        <!-- widget edit box -->
                                        <div class="jarviswidget-editbox">
                                            <!-- This area used as dropdown edit box -->

                                        </div>
                                        <!-- end widget edit box -->

                                        <!-- widget content -->
                                        <div class="widget-body no-padding">

                                            <div class="smart-form" id="form_dgp"  method="post" action="../../dgp">
                                                <header class="titulo_req">

                                                    <div class="spacing">
                                                        <center><h1 class="spacing" style="font-weight: bold; margin: 0px;  color: #005cac;"> Documento de Gestión de Personal</h1></center>
                                                        <br>

                                                    </div>
                                                    <br>

                                                </header>
                                                <%for (int a = 0; a < LIST_ID_DGP.size(); a++) {
                                                        V_Det_DGP dg = new V_Det_DGP();
                                                        dg = (V_Det_DGP) LIST_ID_DGP.get(a);
                                                %>
                                                <fieldset id="fila-agregar">
                                                    <%                                                        /*Temporal*/

                                                        for (int i = 0; i < Listar_Trabajador_id.size(); i++) {
                                                            V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                                                            tr = (V_Ficha_Trab_Num_C) Listar_Trabajador_id.get(i);
                                                    %>
                                                    <div class="row">
                                                        <input value=""  type="hidden" id="" />
                                                        <section class="col col-6">
                                                            <label class="label" id="titu">Trabajador :</label>
                                                            <label class="input" style="color: red; font-weight: bold;">
                                                                <%=tr.getAp_paterno() + " " + tr.getAp_materno() + " " + tr.getNo_trabajador()%>
                                                                <input type="hidden" value="<%=tr.getId_trabajador()%>" name="IDDATOS_TRABAJADOR" class="id_tr input-xs">
                                                                <%}%>
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <script>
                                                        $(document).ready(function() {
                                                        });
                                                    </script>

                                                    <section>
                                                        <label class="label" id="titu">Puesto | Seccion | Area:</label>
                                                        <label class="select">
                                                            <select name="IDPUESTO"  required="" >
                                                                <option value="">[SELECCIONE]</option>
                                                                <%for (int b = 0; b < List_Puesto.size(); b++) {
                                                                        V_Puesto_Direccion p = new V_Puesto_Direccion();
                                                                        p = (V_Puesto_Direccion) List_Puesto.get(b);
                                                                        if (dg.getId_puesto().trim().equals(p.getId_puesto().trim())) {
                                                                %>
                                                                <option value="<%=p.getId_puesto()%>" selected=""><% out.println(p.getNo_puesto() + " | " + p.getNo_seccion() + " | " + p.getNo_area());%></option>
                                                                <%} else {%>
                                                                <option value="<%=p.getId_puesto()%>"><% out.println(p.getNo_puesto() + " | " + p.getNo_seccion() + " | " + p.getNo_area());%></option>
                                                                <%}
                                                                    }%>
                                                            </select>
                                                        </label>
                                                    </section>

                                                    <section>
                                                        <label class="label" id="titu">Requerimiento :</label>
                                                        <label class="select">
                                                            <select name="IDREQUERIMIENTO"    disabled="" onchange="mostrar()"  id="nom_req"  > 
                                                                <option value="">[SELECCIONAR]</option>
                                                                <%
                                                                    for (int index = 0; index < Listar_Requerimiento.size(); index++) {
                                                                        Requerimiento r = new Requerimiento();
                                                                        r = (Requerimiento) Listar_Requerimiento.get(index);
                                                                        if (dg.getId_requerimiento().trim().equals(r.getId_requerimiento().trim())) {
                                                                %>
                                                                //<option value="<%=r.getId_requerimiento()%>" selected=""  ><%=r.getNo_req()%></option>
                                                                <%} else {%>
                                                                <option value="<%=r.getId_requerimiento()%>"><%=r.getNo_req()%></option>                      
                                                                <%}
                                                                    }%>
                                                            </select> 
                                                        </label>
                                                    </section>
                                                    <div class="row" >
                                                        <section class="col col-6">
                                                            <label class="select" id="titu">
                                                                Motivo :<select name="MOTIVO" class="ant_policiales" required="" >
                                                                    <option value="" >[SELECCIONE]</option>
                                                                    <%if (dg.getLi_motivo().equals("1")) {%>
                                                                    <option value="1" selected="">Trabajdor Nuevo</option>
                                                                    <option value="2">Renovación</option>
                                                                    <%}
                                                                        if (dg.getLi_motivo().equals("2")) {%>
                                                                    <option value="1">Trabajdor Nuevo</option>
                                                                    <option value="2" selected="">Renovación</option>
                                                                    <%}%>
                                                                </select>
                                                            </label>

                                                        </section>
                                                        <section class="col col-2" style=" margin-top:2%;">
                                                            <label class="toggle" id="titu" > MFL:
                                                                <%if (dg.getEs_mfl().trim().equals("0")) {%>
                                                                <input type="checkbox" value="1"  name="MFL" name="checkbox-toggle" >
                                                                <%}
                                                                    if (dg.getEs_mfl().trim().equals("1")) {%>
                                                                <input type="checkbox" value="1"  name="MFL" name="checkbox-toggle" checked="">
                                                                <%}%>
                                                                <i data-swchon-text="SI" data-swchoff-text="NO"></i>
                                                            </label>
                                                        </section>
                                                    </div>

                                                    <div class="row">
                                                        <section class="col col-6" >
                                                            <label class="input" id="titu">Fecha de Inicio :
                                                                <input type="date" name="FEC_DESDE" id="datepicker" required="" class="val_fe" min="<%=fecha_maxima_plazo%>" value="<%=c.convertFecha3(dg.getFe_desde())%>">
                                                            </label>
                                                        </section>
                                                        <section class="col col-6">
                                                            <label class="input"  id="titu">Fecha de Cese :
                                                                <input type="date" name="FEC_HASTA"  required="" id="datepicker" class="val_fe" min="<%=fecha_maxima_plazo%>" value="<%=c.convertFecha3(dg.getFe_hasta())%>">
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <%if (dg.getId_requerimiento().trim().equals("REG-0008")) {%>
                                                    <%String es_cue_sue = request.getParameter("es_cs");%>
                                                    <input type="hidden" name="ESTADO" value="<%=es_cue_sue%>">
                                                    <%if (es_cue_sue.equals("0")) {%>
                                                    <input type="hidden" name="ES_CUENTA_SUELDO" value="1" required="" />
                                                    <div class="row"> 
                                                        <section class="col col-3" name="">
                                                            <label class="select" id="titu">Cta Sueldo - Banco:
                                                                <select name="BANCO" id="banco" required="">
                                                                    <option value="" selected="" disabled="" >[Selecione]</option>
                                                                    <option value="0" >Ninguno</option>
                                                                    <option value="1" >BBVA</option>
                                                                    <option value="2" >BCP</option>
                                                                    <option value="3" >Otros</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-3" id="no_cuen_otros">

                                                            <label class="input" id="titu">Nombre Banco :
                                                                <input type="text" name="BANCO_OTROS"  id="nu_cuen_otros" maxlength="30"   />
                                                            </label>

                                                        </section>
                                                        <section class="col col-4" id="no_cuen">

                                                            <label class="input" id="titu">Nro Cuenta :
                                                                <input type="text" name="CUENTA"  id="nu_cuen" maxlength="30" />
                                                            </label>

                                                        </section>
                                                        <section class="col col-4"  id="no_cuen_ban">

                                                            <label class="input" id="titu">Nro Cuenta Bancaria:
                                                                <input type="text" name="CUENTA_BANC" id="nu_cuen_ban">
                                                            </label>

                                                        </section>

                                                        <section class="col col-6" id="generar">
                                                            <p style="font-weight:bold;">Autorizo a la UPeU gestionar mi cuenta de sueldo en el BBVA Banco Continental, para tal efecto adjunto copia legible y vigente de mi DNI   </p>
                                                            <label class="checkbox" >
                                                                <input type="checkbox" name="GEN_NU_CUEN" id="subscription"  value="1" >
                                                                <i></i>Generar Nro de Cuenta Bancaria</label>
                                                        </section>

                                                    </div>
                                                    <%} else { %>
                                                    <%for (int i = 0; i < list_Cuenta_Sueldo.size(); i++) {
                                                            Cuenta_Sueldo cs = new Cuenta_Sueldo();
                                                            cs = (Cuenta_Sueldo) list_Cuenta_Sueldo.get(i);
                                                    %>
                                                    <div class="row"> 
                                                        <section class="col col-3" name="">
                                                            <label class="select" id="titu" >Cta Sueldo - Banco:
                                                                <select name="BANCO"  required="" disabled="">
                                                                    <%if (cs.getNo_banco().equals("0")) {%>
                                                                    <option >Ninguno</option>
                                                                    <%}
                                                                        if (cs.getNo_banco().equals("1")) {%>
                                                                    <option >BBVA</option>
                                                                    <%}
                                                                        if (cs.getNo_banco().equals("2")) {%>
                                                                    <option >BCP</option>
                                                                    <%}
                                                                        if (cs.getNo_banco().equals("3")) {%>
                                                                    <option >Otros</option>
                                                                    <%}%>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <%if (cs.getNo_banco_otros() != null) {%>
                                                        <section class="col col-3">
                                                            <label class="input" id="titu">Nombre Banco :
                                                                <input type="text" disabled="" value="<%=cs.getNo_banco_otros()%>" />
                                                            </label>
                                                        </section>
                                                        <%}
                                                            if (cs.getNu_cuenta() != null) {%>
                                                        <section class="col col-4">
                                                            <label class="input" id="titu">Nro Cuenta :
                                                                <input type="text" disabled="" value="<%=cs.getNu_cuenta()%>" />
                                                            </label>
                                                        </section>
                                                        <%}
                                                            if (cs.getNu_cuenta_banc() != null) {%>
                                                        <section class="col col-4">
                                                            <label class="input" id="titu">Nro Cuenta Bancaria:
                                                                <input type="text" disabled="" value="<%=cs.getNu_cuenta_banc()%>">
                                                            </label>
                                                        </section>
                                                        <%}
                                                            if (cs.getNo_banco().equals("0")) {%>
                                                        <section class="col col-5" >

                                                            <p >Autorizo a la UPeU gestionar mi cuenta de sueldo en el BBVA Banco Continental, para tal efecto adjunto copia legible y vigente de mi DNI   </p>
                                                            <label class="checkbox" >
                                                                <%if (cs.getEs_gem_nu_cuenta().equals("1")) {%>
                                                                <input type="checkbox" name="GEN_NU_CUEN"  id="subscription"  value="1" checked="" disabled="">
                                                                <%} else {%>
                                                                <input type="checkbox" name="GEN_NU_CUEN" id="subscription"  value="0" disabled="">
                                                                <%}%>
                                                                <i></i>Generar Nro de Cuenta Bancaria</label>
                                                        </section>
                                                        <%}%>
                                                    </div>
                                                    <%}
                                                        }%>
                                                    <%}%>
                                                    <div class="row">
                                                        <section class="col col-3" >
                                                            <label class="input" id="titu">Sueldo :
                                                                <input type="text" name="SUELDO" required="" maxlength="13" value="<%=dg.getCa_sueldo()%>"  id="sueldo" >
                                                            </label>
                                                        </section>
                                                        <%if (dg.getId_requerimiento().trim().equals("REQ-0001") || dg.getId_requerimiento().trim().equals("REQ-0002") || dg.getId_requerimiento().trim().equals("REQ-0003") || dg.getId_requerimiento().trim().equals("REQ-0005")) {
                                                        %> 
                                                        <section class="col col-3">
                                                            <label class="input"  id="titu"> 
                                                                Bono de Alimentos :<input type="text" maxlength="13"  value="<%=dg.getCa_bono_alimentario()%>" name="BONO_ALIMENTARIO"  id="bono_al">
                                                            </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label class="input"  id="titu"> 
                                                                Bonificaion Puesto :<input type="text" maxlength="13"  value="<%=dg.getCa_bonificacion_p()%>" name="BONO_PUESTO"  id="bono_pu">
                                                            </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label class="input"  id="titu"> 
                                                                BEV :<input type="text" name="BEV" maxlength="13" value="<%=dg.getDe_bev()%>" id="bev">
                                                            </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label class="input"  id="titu"> 
                                                                Sueldo Total :<div id="suel_total" style="color: red;">0.0</div>
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <div  class="row" >
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">
                                                                Antecedentes Policiales :<select name="ANTECEDENTES_POLICIALES" class="ant_policiales" >
                                                                    <option value="" >[SELECCIONE]</option>
                                                                    <%if (dg.getDe_antecedentes_policiales() != null) {
                                                                            if (dg.getDe_antecedentes_policiales().equals("1")) {
                                                                    %>
                                                                    <option value="1" selected="">No</option>
                                                                    <option value="2">Si</option>
                                                                    <%}
                                                                        if (dg.getDe_antecedentes_policiales().equals("2")) {%>
                                                                    <option value="1" >No</option>
                                                                    <option value="2" selected="">Si</option>
                                                                    <%}
                                                                    } else {%>
                                                                    <option value="1" >No</option>
                                                                    <option value="2">Si</option>
                                                                    <%}%>
                                                                </select>
                                                            </label>

                                                        </section>
                                                        <section class="col col-4">

                                                            <label class="select" id="titu">
                                                                Certificado de Salud: 
                                                                <select name="CERTIFICADO_SALUD" required=""  class="essalud">
                                                                    <option value="">[SELECCIONE]</option>
                                                                    <%if (dg.getEs_certificado_salud() != null) {
                                                                            if (dg.getEs_certificado_salud().equals("1")) {
                                                                    %>
                                                                    <option value="1" selected="" >Si</option>
                                                                    <option value="0">No</option>
                                                                    <%}
                                                                        if (dg.getEs_certificado_salud().equals("0")) {%>
                                                                    <option value="1">Si</option>
                                                                    <option selected="" value="0">No</option>
                                                                    <%}
                                                                    } else {%>
                                                                    <option value="1" >Si</option>
                                                                    <option value="0">No</option>
                                                                    <%}%>
                                                                </select>
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <%String es_cue_sue = request.getParameter("es_cs");%>
                                                    <input type="hidden" name="ESTADO" value="<%=es_cue_sue%>">
                                                    <%if (es_cue_sue.trim().equals("0")) {%>
                                                    <input type="hidden" name="ES_CUENTA_SUELDO" value="1" />
                                                    <div class="row"> 
                                                        <section class="col col-3" name="">
                                                            <label class="select" id="titu">Cta Sueldo - Banco:
                                                                <select name="BANCO" id="banco" required="">
                                                                    <option value="" selected="" disabled="" >[Selecione]</option>
                                                                    <option value="0" >Ninguno</option>
                                                                    <option value="1" >BBVA</option>
                                                                    <option value="2" >BCP</option>
                                                                    <option value="3" >Otros</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-3" id="no_cuen_otros">

                                                            <label class="input" id="titu">Nombre Banco :
                                                                <input type="text" name="BANCO_OTROS"  id="nu_cuen_otros" maxlength="30"   />
                                                            </label>

                                                        </section>
                                                        <section class="col col-4" id="no_cuen">

                                                            <label class="input" id="titu">Nro Cuenta :
                                                                <input type="text" name="CUENTA"  id="nu_cuen" maxlength="30" />
                                                            </label>

                                                        </section>
                                                        <section class="col col-4"  id="no_cuen_ban">

                                                            <label class="input" id="titu">Nro Cuenta Bancaria:
                                                                <input type="text" name="CUENTA_BANC" id="nu_cuen_ban">
                                                            </label>

                                                        </section>

                                                        <section class="col col-6" id="generar">
                                                            <p style="font-weight:bold;">Autorizo a la UPeU gestionar mi cuenta de sueldo en el BBVA Banco Continental, para tal efecto adjunto copia legible y vigente de mi DNI   </p>
                                                            <label class="checkbox" >
                                                                <input type="checkbox" name="GEN_NU_CUEN" id="subscription"  value="1" >
                                                                <i></i>Generar Nro de Cuenta Bancaria</label>
                                                        </section>

                                                    </div>
                                                    <%} else {%>
                                                    <%for (int i = 0; i < list_Cuenta_Sueldo.size(); i++) {
                                                            Cuenta_Sueldo cs = new Cuenta_Sueldo();
                                                            cs = (Cuenta_Sueldo) list_Cuenta_Sueldo.get(i);

                                                    %>
                                                    <div class="row"> 

                                                        <section class="col col-3" name="">
                                                            <label class="select" id="titu" >Cta Sueldo - Banco:
                                                                <select name="BANCO"  required="" disabled="">
                                                                    <%if (cs.getNo_banco().equals("0")) { %>
                                                                    <option >Ninguno</option>
                                                                    <%}
                                                                        if (cs.getNo_banco().equals("1")) {%>
                                                                    <option >BBVA</option>
                                                                    <%}
                                                                        if (cs.getNo_banco().equals("2")) { %>
                                                                    <option >BCP</option>
                                                                    <%}
                                                                        if (cs.getNo_banco().equals("3")) { %>
                                                                    <option >Otros</option>
                                                                    <% }%>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <%if (cs.getNo_banco_otros() != null) {%>
                                                        <section class="col col-3">
                                                            <label class="input" id="titu">Nombre Banco :
                                                                <input type="text" disabled="" value="<%=cs.getNo_banco_otros()%>"   />
                                                            </label>
                                                        </section>
                                                        <%}%>
                                                        <%if (cs.getNu_cuenta() != null) {%>
                                                        <section class="col col-4">
                                                            <label class="input" id="titu">Nro Cuenta :
                                                                <input type="text" disabled="" value="<%=cs.getNu_cuenta()%>"    />
                                                            </label>
                                                        </section>
                                                        <%}%>
                                                        <%if (cs.getNu_cuenta_banc() != null) {%>
                                                        <section class="col col-4">
                                                            <label class="input" id="titu">Nro Cuenta Bancaria:
                                                                <input type="text" disabled="" value="<%=cs.getNu_cuenta_banc()%>">
                                                            </label>
                                                        </section>
                                                        <%}
                                                            if (cs.getNo_banco().trim().equals("0")) {%>%>
                                                        <section class="col col-5" >
                                                            <p >Autorizo a la UPeU gestionar mi cuenta de sueldo en el BBVA Banco Continental, para tal efecto adjunto copia legible y vigente de mi DNI   </p>
                                                            <label class="checkbox" >
                                                                <%if (cs.getEs_gem_nu_cuenta().trim().equals("1")) {%>
                                                                <input type="checkbox" name="GEN_NU_CUEN"  id="subscription"  value="1" checked="" disabled="">
                                                                <%} else {%>
                                                                <input type="checkbox" name="GEN_NU_CUEN" id="subscription"  value="0" disabled="">
                                                                <%}%>
                                                                <i></i>Generar Nro de Cuenta Bancaria</label>
                                                        </section>
                                                        <%}%>
                                                    </div>
                                                    <%}
                                                            }
                                                        }%>
                                                    <%if (dg.getId_requerimiento().equals("REQ-0010")) {%>
                                                    <div class="">
                                                        <section class="col col-4" >
                                                            <label class="input" id="titu"> RUC:
                                                                <input type="text" name="RUC" id="" maxlength="20" required="" >
                                                            </label>

                                                        </section>
                                                    </div>
                                                    <div class="">
                                                        <section class="col col-6" >
                                                            <label class="input" id="titu"> Domicilio Fiscal:
                                                                <input type="text" name="DOMICILIO_FISCAL" id="" required="" >
                                                            </label>
                                                        </section>
                                                        <%}%>
                                                        <%if (dg.getId_requerimiento().equals("REQ-0010") || dg.getId_requerimiento().equals("REQ-0011")) {%>
                                                        <section class="col col-6" >
                                                            <label class="input" id="titu"> Lugar de Servicio:
                                                                <input type="text" name="LUGAR_SERVICIO" id="" required="" value="<%=dg.getDe_lugar_servicio()%>">
                                                            </label>
                                                        </section>
                                                        <section class="col col-lg-12" >
                                                            <label class="textarea" id="titu" >Descripcion del Servicio 										
                                                                <textarea rows=4 name="DESCRIPCION_SERVICIO" value="<%=dg.getDe_servicio()%>"></textarea> 
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <div class="pago_cuotas_1">
                                                        <section class="col col-2">
                                                            <a type="button" class="btn btn-default btn-lg" id="btn_add" >Agregar</a>
                                                        </section>
                                                        <section class="col col-2" >
                                                            <label class="input" id="titu"> CUOTA:
                                                                <input type="text" name="CUOTA_1" id="cuota" required="" value="1" >
                                                            </label>
                                                        </section>
                                                        <section class="col col-4" >
                                                            <label class="input" id="titu">Fecha a Pagar :
                                                                <input type="date" name="FEC_PAGAR_1" id="datepicker" required="" >
                                                            </label>
                                                        </section>
                                                        <section class="col col-4" >
                                                            <label class="input" id="titu">Monto :
                                                                <input type="text" name="MONTO_1" required=""  value="0.0"  class="monto" >
                                                            </label>
                                                        </section>
                                                        <input type="hidden" value="1" name="ES_PERIODO" />
                                                        <input type="hidden" value="1" name="CANT" class="cant" />
                                                    </div>
                                                    <%}%>

                                                    <input type="hidden" value="1" name="numero" class="cant-input" />
                                                    <code class="ver"></code>
                                                    <input type="hidden" name="IDREQUERIMIENTO"  id="combito"  value="<%=dg.getId_requerimiento()%>">
                                                    <div id="div_2" class="contenido" style="display: none">
                                                        <table  class="table">
                                                            <tr><td class="td">Subvencion:</td><td><input type="text" name="SUBVENCION"  ></td></tr>   
                                                            <tr><td class="td">Horario de Capacitacion:</td><td><input type="text" name="HORARIO_CAPACITACION"  ></td></tr>   
                                                            <tr><td class="td">Horario de Refrigerio:</td><td><input type="text" name="HORARIO_REFRIGERIO"  ></td></tr>  
                                                            <tr><td class="td">Dias de Capacitacion:</td><td><input type="text" name="DIAS_CAPACITACION" ></td></tr>  
                                                        </table>
                                                    </div >

                                                    <div id="div_3" class="contenido" style="display:none ">
                                                        <table class="table">
                                                            <tr><td class="td">Monto del Honorario:</td><td><input type="text" name="MONTO_HONORARIO" ></td></tr>   
                                                        </table>
                                                    </div>
                                                    <input type="hidden" name="ID_DGP" value="<%=dg.getId_dgp()%>" class="iddgp">
                                                    <input type="hidden" name="cant_actual_anti" class="can_centro_cos" value="<%=request.getParameter("can_cc")%>">
                                                    <input type="hidden" name="cant_inicial" class="conteo" value="<%=request.getParameter("num_cc")%>">
                                                    <input type="hidden" name="cant_eliminada" class="cant-elimi" value="0">
                                                    <input type="hidden" name="CANT_actu" class="cant-actualmente" value="<%=request.getParameter("can_cc")%>">
                                                    <input type="hidden" name="cant_ingresada" class="cant-ing" value="0">
                                                </fieldset>
                                                <fieldset id="list-cc">

                                                </fieldset>    
                                                <%}%>
                                            </div>

                                        </div>
                                        <!-- end widget content -->

                                    </div>
                                    <!-- end widget div -->

                                </div>
                                <!-- end widget -->

                            </article>


                            <article class="col-sm-12 col-md-12 col-lg-6">

                                <!-- Widget ID (each widget will need unique ID)-->
                                <div class="jarviswidget" id="wid-id-1" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false" data-widget-deletebutton="false">
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
                                        <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                        <h2>Registrar Horario</h2>

                                    </header>

                                    <!-- widget div-->
                                    <div>

                                        <!-- widget edit box -->
                                        <div class="jarviswidget-editbox">
                                            <!-- This area used as dropdown edit box -->

                                        </div>
                                        <!-- end widget edit box -->

                                        <!-- widget content -->
                                        <div class="widget-body no-padding">

                                            <div class="smart-form" >
                                                <header class="titulo_req">

                                                    <div class="spacing">
                                                        <center><h1 class="spacing" style="font-weight: bold; margin: 0px;  color: #005cac;"> Horario</h1></center>
                                                        <br>

                                                    </div>
                                                </header>

                                                <fieldset>

                                                    <section>
                                                        <label class="label" id="titu">Tipo de Horario :</label>
                                                        <label class="select">

                                                            <select id="horario" required="" name="HORARIO" >
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="0">Editable</option>

                                                            </select>

                                                        </label>
                                                    </section>
                                                    <div class="row">
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">LUNES
                                                                <select id=select_lun >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">MARTES
                                                                <select id=select_mar >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2" >
                                                            <label class="select" id="titu">MIERCOLES
                                                                <select id=select_mie  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">JUEVES
                                                                <select id=select_jue  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select> 
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">VIERNES
                                                                <select id=select_vie  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">SABADO
                                                                <select id=select_sab  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>

                                                        <section class="col col-2">
                                                            <label class="select" id="titu">DOMINGO
                                                                <select id=select_dom >

                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>    
                                                        </section>
                                                    </div>
                                                    <div class="input-desp dias_semana">
                                                        <table style="" id="show_lun" class="cont_lun"> 
                                                            <tr><td align="center" colspan="2">Lunes</td></tr>


                                                        </table>

                                                        <table id="show_mar" class="cont_mar">     
                                                            <tr><td align="center" colspan="2">Martes</td></tr>

                                                        </table>
                                                        <table id="show_mie" class="cont_mie">     
                                                            <tr ><td align="center" colspan="2">Miercoles</td></tr>

                                                        </table>


                                                        <table id="show_jue" class="cont_jue">     
                                                            <tr><td align="center" colspan="2">Jueves</td></tr>

                                                        </table>
                                                        <table id="show_vie" class="cont_vie">     
                                                            <tr><td align="center" colspan="2">Viernes</td></tr>

                                                        </table>
                                                        <table id="show_sab" class="cont_sab">     
                                                            <tr><td align="center" colspan="2">Sábado</td></tr>

                                                        </table>
                                                        <table id="show_dom" class="cont_dom" >
                                                            <tr><td align="center" colspan="2">Domingo</td></tr>

                                                        </table>


                                                        <div  class="row" >

                                                            <section class="col col-4">
                                                                <label class="input" id="titu">
                                                                    <div class="h_total" style=" font-weight: bold;">Horas Totales : 00:00 horas</div>
                                                                    <input  readonly="" type="text" name="h_total" class=" h_total" required="" max="48"/>
                                                                </label>
                                                            </section>
                                                        </div>
                                                        <input  type="hidden" name="dep_actual" value="" class="dep_actual" />
                                                        <input  type="hidden" name="estado_de_horario" value="" class="modificacion-total" />
                                                        <input  type="hidden" name="id_det_hor" value="<%=request.getParameter("id_det_hor")%>" class="id_det_hor" />
                                                    </div>
                                                </fieldset>
                                                <footer>
                                                    <button type="submit" class="btn btn-primary btn-labeled">
                                                        Modificar  <i class="fa fa-pencil"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-default" onclick="window.history.back();">
                                                        <i class="fa fa-arrow-circle-left"></i>  Regresar
                                                    </button>
                                                </footer>
                                            </div>


                                        </div>
                                        <!-- end widget content -->

                                    </div>
                                    <!-- end widget div -->

                                </div>
                                <!-- end widget -->

                            </article>
                            <!-- END COL -->


                            <input type="hidden" name="opc"  class="submit" value="Modificar">
                        </form>


                    </div>

                </section>
            </div>
        </div>

    </body>
    <script>
        $(document).ready(function() {
            var b = $("#alerta_dgp");
            var info = $(".div_info");
            // $("#alerta_dgp").hide();
            function listar() {
                $.post("../../plazo_dgp", "opc=Listar", function(objJson) {
                    b.empty();
                    var lista = objJson.lista;
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    for (var i = 0; i < lista.length; i++) {
                        b.append("<div class='alert alert-danger alert-block' ><a class='close' data-dismiss='alert' href='#'>×</a><h4 class='alert-heading'>" + lista[i].nom + "</h4>" + lista[i].det + " , Fecha Plazo " + lista[i].desde + " al " + lista[i].hasta + "</div>");

                        info.append('<div class="alert alert-info fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-info"></i><strong>¡Importante!</strong> Su requerimiento será procesado en el mes de <strong>' + lista[i].mes + '.</strong></div>');
                    }
                });
            }
            listar();
        });
        var cantidad = 1;

        $("#btn_add").click(function() {
            var agregar = $('#fila-agregar');
            var texto = "";
            cantidad++;
            texto += '<div class="row pago_cuotas_' + cantidad + '">';
            texto += '<section class="col col-2"><label class="btn">';
            texto += '<button type="button" class="eliminar' + cantidad + '"  >Eliminar</button>';
            texto += '</label></section>';
            texto += '<section class="col col-2" ><label class="input" id="titu">';
            texto += '<input type="text" name="CUOTA_' + cantidad + '" id="cuota" required="" value="' + cantidad + '" >';
            texto += '</label></section>';
            texto += '<section class="col col-4" ><label class="input" id="titu">';
            texto += '<input type="date" name="FEC_PAGAR_' + cantidad + '" id="datepicker" required="" >';
            texto += '</label></section>';
            texto += '<section class="col col-4" ><label class="input" id="titu">';
            texto += '<input type="text" name="MONTO_' + cantidad + '" required="" class="monto" >';
            texto += '</label></section>';
            texto += '</div>';


            agregar.append(texto);
            periodo_pago(cantidad);
            $(".cant").val(cantidad);
            //alert($(".cant").val())
            $(".eliminar" + cantidad).click(function() {
                $(".pago_cuotas_" + cantidad).remove();
                periodo_pago(cantidad);
                cantidad--;
                periodo_pago(cantidad);

                //alert(cantidad)
            });
        });

        $(document).ready(
                function() {
                    $("#sueldo").keyup(
                            function() {
                                var sueldo = parseFloat($("#sueldo").val());
                                $(".monto").val(Math.round(sueldo));
                            });
                }
        );
        function periodo_pago(cantidad) {
            var sueldo = parseFloat($("#sueldo").val());
            var p_p = sueldo / cantidad;
            $.each($(".monto"), function() {
                $(".monto").val(p_p);
            });
        }

        function calcular_sueldo_total() {
            var x = parseFloat($("#sueldo").val());
            var y = parseFloat($("#bono_al").val());
            var w = parseFloat($("#bono_pu").val());
            var z = parseFloat($("#bev").val());
            var v = x + y + z + w;
            $("#suel_total").text(Math.round(v * 100) / 100);
        }
        $(document).ready(
                function() {
                    $("#sueldo").keyup(
                            function() {
                                calcular_sueldo_total();
                            }
                    );
                    $("#bono_al").keyup(
                            function() {
                                calcular_sueldo_total();
                            }
                    );
                    $("#bev").keyup(
                            function() {
                                calcular_sueldo_total();
                            }
                    );
                    $("#bono_pu").keyup(
                            function() {
                                calcular_sueldo_total();
                            }
                    );
                }
        );</script>
    <script>
        /*$(".texto-h").setMask("29:59").keypress(
         function () {
         var currentMask = $(this).data('mask').mask;*/
        //var newMask = $(this).val().match(/^2.*/) ? "23:59" : "29:59";
        /*  if (newMask != currentMask) {
         $(this).setMask(newMask);
         }
         });
         $(".texto-h").attr("data-mask", "29:59");*/

    </script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function() {
            $(".contenido").hide();
            /*TEMPORAL*/
            //Planilla
            //if ($("#combito").val()=="REQ-0001" | $("#combito").val() == "REQ-0002" | $("#combito").val() == "REQ-0003" | $(this).val() == "REQ-0004" | $(this).val() == "REQ-0005" | $(this).val() == "REQ-0006") {
            if (true) {
                $(".contenido").hide();
                $("#div_1").show();
            }
            //Fuera PLanilla
            if ($("#combito").val() == 7 | $(this).val() == 8 | $(this).val() == 9) {
                $(".contenido").hide();
                $("#div_2").show();
            }
            //Otros
            if ($("#combito").val() == 10 | $(this).val() == 11 | $(this).val() == 12) {
                $(".contenido").hide();
                $("#div_3").show();
            }

        });</script>
    <script language="javascript" type="text/javascript">
        $(document).ready(
                function mostrar() {

                    $(".cont_lun").hide();
                    $(".cont_mar").hide();
                    $(".cont_mie").hide();
                    $(".cont_jue").hide();
                    $(".cont_vie").hide();
                    $(".cont_sab").hide();
                    $(".cont_dom").hide();


                    $("#select_lun").change(
                            function() {
                                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                                if (msg == true) {
                                    if ($(this).val() == 1) {
                                        $("#show_lun").show();
                                    }
                                    if ($(this).val() == 2) {
                                        $(".cont_lun").hide();
                                        $("#show_lun input").val("00:00");
                                    }
                                    calcularHoras();
                                } else {
                                    $("#select_lun").val("1");
                                    return false;
                                }
                            }
                    );
                    $("#select_mar").change(
                            function() {
                                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                                if (msg == true) {
                                    if ($(this).val() == 1) {
                                        $("#show_mar").show();
                                    }
                                    if ($(this).val() == 2) {
                                        $(".cont_mar").hide();
                                        $("#show_mar input").val("00:00");
                                    }
                                    calcularHoras();
                                } else {
                                    $("#select_mar").val("1")
                                    return false;
                                }
                            }
                    );
                    $("#select_mie").change(
                            function() {
                                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                                if (msg == true) {
                                    if ($(this).val() == 1) {
                                        $("#show_mie").show();
                                    }
                                    if ($(this).val() == 2) {
                                        $(".cont_mie").hide();
                                        $("#show_mie input").val("00:00");
                                    }
                                    calcularHoras();
                                } else {
                                    $("#select_mie").val("1")
                                    return false;
                                }
                            }
                    );
                    $("#select_jue").change(
                            function() {
                                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                                if (msg == true) {
                                    if ($(this).val() == 1) {
                                        $("#show_jue").show();
                                    }
                                    if ($(this).val() == 2) {
                                        $(".cont_jue").hide();
                                        $("#show_jue input").val("00:00");
                                    }
                                    calcularHoras();
                                } else {
                                    $("#select_jue").val("1")
                                    return false;
                                }
                            }
                    );
                    $("#select_vie").change(
                            function() {
                                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                                if (msg == true) {
                                    if ($(this).val() == 1) {
                                        $("#show_vie").show();
                                    }
                                    if ($(this).val() == 2) {
                                        $(".cont_vie").hide();
                                        $("#show_vie input").val("00:00");
                                    }
                                    calcularHoras();
                                } else {
                                    $("#select_vie").val("1")
                                    return false;
                                }
                            }
                    );
                    $("#select_sab").change(
                            function() {
                                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                                if (msg == true) {
                                    if ($(this).val() == 1) {
                                        $("#show_sab").show();
                                    }
                                    if ($(this).val() == 2) {
                                        $(".cont_sab").hide();
                                        $("#show_sab input").val("00:00");
                                    }
                                    calcularHoras();
                                } else {
                                    $("#select_sab").val("1")
                                    return false;
                                }
                            }
                    );
                    $("#select_dom").change(
                            function() {
                                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                                if (msg == true) {
                                    if ($(this).val() == 1) {
                                        $("#show_dom").show();
                                    }
                                    if ($(this).val() == 2) {
                                        $(".cont_dom").hide();
                                        $("#show_dom input").val("00:00");
                                    }
                                    calcularHoras();
                                } else {
                                    $("#select_dom").val("1")
                                    return false;
                                }
                            }
                    );
                }

        );</script>
    <script  language="javascript" type="text/javascript">
        function calcularHoras() {
            var dias_semana = new Array("lun", "mar", "mie", "jue", "vie", "sab", "dom");
            var acum = 0;
            for (var i = 0; i < dias_semana.length; i++) {

                for (var j = 0, max = 5; j < max; j++) {
                    var horaTurno = 0;
                    //var str = $("#HORA_DESDE_" + dias_semana[i] + j).val();

                    var Desde = $(".HORA_DESDE_" + dias_semana[i] + (j + 1)).val();
                    var Hasta = $(".HORA_HASTA_" + dias_semana[i] + (j + 1)).val();
                    if ($(".HORA_DESDE_" + dias_semana[i] + (j + 1)).val() == null) {
                        Desde = "00:00";
                        Hasta = "00:00";
                    }
                    //  var arrDesde = $(str).val().split(":");
                    //if (typeof Desde !== 'undefined' && typeof Hasta !== 'undefined') {
                    var arrDesde = Desde.split(":");
                    var arrHasta = Hasta.split(":");
                    horaTurno = (((parseInt(arrHasta[0]) * 60) + (parseInt(arrHasta[1]))) - ((parseInt(arrDesde[0]) * 60) + (parseInt(arrDesde[1]))));
                    // alert(horaTurno + Desde + ".HORA_DESDE_" + dias_semana[i] + (j + 1));

                    acum = acum + horaTurno;
                    // }
                }
            }
            var minutos_totales = acum;
            acum = acum / 60;
            var min = ((acum - parseInt(acum)) * 60);
            min = parseInt(min.toPrecision(2));
            $(".h_total").text("Hora Semanal Total : " + parseInt(acum) + ":" + min + " Horas.");
            $(".h_total").val(acum);
            if (minutos_totales > 2880) {

            }
        }
        function Listar_centro_costo1() {
            var x = $("#list-cc");
            $.post("../../centro_costo", "opc=Listar_centro_id_dgp&" + "id_dgp=" + $(".iddgp").val(), function(objJson) {
                if ($(".can_centro_cos").val() != 0) {
                    //alert($(".iddgp").val());
                    /*if (objJson.rpta == -1) {
                     alert(objJson.mensaje);
                     return;
                     }*/
                    var lista = objJson.lista;
                    x.empty();
                    var CANT_T = 0;
                    var numero = 1;
                    var texto = "";
                    cant_act = lista.length;
                    $(".cant-actualmente").val(cant_act);
                    //alert(lista.length);
                    texto += '<div class="row" ><section class="col col-1"><br><label  id="titu">Agregar:</label><br><label class="btn"><a type="button" style="padding:9%; padding-right:20%; padding-left:20%;" id="btn-agregar-cc2" class=" btn btn-default txt-color-green btn-agregar-cc"><i class="fa fa-plus fa-2x"></i></a></label></section><section class="col col-2"><label class="input" id="titulo">%:<input type="text" name="PORCENTAJE_TOTAL" max="100" min="100" maxlength="3"  class="input-group-sm por_sum_to" id="bo_a" readonly=""></label></section></div>';
                    for (var i = 0; i < lista.length; i++) {

                        numero = numero + i;
                        if ($(".can_centro_cos").val() == "1") {
                            texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + (i + 1) + ':</label>';
                            texto += '<div  class="row centro-costo_' + ag + '" >';
                            texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '" id="cc-dir' + ag + '" readonly="readonly"  disabled><option value="">[DIRECCION]</option></select></label></section>';
                            texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '" readonly="readonly"  disabled><option value="">[DEPARTAMENTO]</option></select></label></section>';
                            texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required="" readonly="readonly"  disabled><option value="">[CENTRO COSTO]</option></select></label></section>';
                            texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ingr + '" value="' + lista[i].ca_por_cc + '"  type="text" required="" class="porcentaje_cc por-cen-' + ag + '" onkeyup="dar_valor($(this).val(),' + ag + ');"/><input type="hidden" name="porcent_ant_' + (i + 1) + '"  value="' + lista[i].ca_por_cc + '" class="porc' + ag + ' por-i" /></label> </section>';
                            texto += '<section class="col col-1" ><br><label class="btn"><button type="button" style="padding:9%; padding-right:20%; padding-left:20%;" value="' + ag + '" class=" btn btn-default txt-color-red remover' + ag + ' dis-total" onclick="Eliminar2($(this).val());"  disabled><i class="fa fa-minus fa-2x"></i></button></label></section>';
                            texto += '<input type="hidden" value="' + lista[i].id_det_ce + '" class="id_dcc' + ag + '" ><input type="hidden" name="id_d_cen_cos' + (i + 1) + '" value="' + lista[i].id_det_ce + '" ></div>';
                            var dir, dep, cc;
                            dir = lista[i].id_dir_cc;
                            dep = lista[i].id_dep_cc;
                            cc = lista[i].id;
                            listar_cc2(ag, dir, dep, cc);
                            /*texto += ('<section class="col col-4 cen-co-im' + i + '"><br><label class="select" id="titulo"> Centro costo Nº ' + numero + '<select name="select_cent_c_' + i + '" required="" class="input-group-sm selec' + i + '"><option value="' + lista[i].id_det_ce + '">' + lista[i].nombre + '</option></select></section><section class="col col-1 cen-co-im' + i + '" ><br><label class="btn"><button type="button" style="padding:9%; padding-right:20%; padding-left:20%;"value="' + i + '" class=" btn btn-default txt-color-red rem' + i + '" id="rem' + (i + 1) + '" onclick="Eliminar($(this).val());" disabled=""><i class="fa fa-minus fa-2x"></i></button></label></section>');
                             texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '"><option value="">[DIRECCION]</option></select></label></section>';
                             texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
                             texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';*/
                        } else {
                            texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + (i + 1) + ':</label>';
                            texto += '<div  class="row centro-costo_' + ag + '" >';
                            texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '" id="cc-dir' + ag + '" readonly="readonly"  disabled><option value="">[DIRECCION]</option></select></label></section>';
                            texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '" readonly="readonly"  disabled><option value="">[DEPARTAMENTO]</option></select></label></section>';
                            texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required="" readonly="readonly"  disabled=""><option value="">[CENTRO COSTO]</option></select></label></section>';
                            texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ingr + '" value="' + lista[i].ca_por_cc + '"  type="text" required="" class="porcentaje_cc por-cen-' + ag + '" onkeyup="dar_valor($(this).val(),' + ag + ');"/><input type="hidden" name="porcent_ant_' + (i + 1) + '" value="' + lista[i].ca_por_cc + '" class="porc' + ag + ' por-i" /></label></section>';
                            texto += '<section class="col col-1" ><br><label class="btn"><button type="button" style="padding:9%; padding-right:20%; padding-left:20%;" value="' + ag + '" class=" btn btn-default txt-color-red remover' + ag + ' dis-total" onclick="Eliminar2($(this).val());" ><i class="fa fa-minus fa-2x"></i></button></label></section>';
                            texto += '<input type="hidden" value="' + lista[i].id_det_ce + '" class="id_dcc' + ag + '" ><input type="hidden" name="id_d_cen_cos' + (i + 1) + '" value="' + lista[i].id_det_ce + '" ></div>';
                            var dir, dep, cc;
                            dir = lista[i].id_dir_cc;
                            dep = lista[i].id_dep_cc;
                            cc = lista[i].id;
                            listar_cc2(ag, dir, dep, cc);
                            // texto += ('<section class="col col-4 cen-co-im' + i + '"><br><label class="select" id="titulo"> Centro costo Nº ' + numero + '<select name="select_cent_c_' + i + '" required="" class="input-group-sm selec' + i + '"><option value="' + lista[i].id_det_ce + '">' + lista[i].nombre + '</option></select></section><section class="col col-1 cen-co-im' + i + '" ><br><label class="btn"><button type="button" style="padding:9%; padding-right:20%; padding-left:20%;"value="' + i + '" class=" btn btn-default txt-color-red rem' + i + '" onclick="Eliminar($(this).val());"><i class="fa fa-minus fa-2x"></i></button></label></section>');
                        }

                        //listar_cc2(ag, lista[i].id_dir_cc, lista[i].id_dep_cc, lista[i].id);

                        numero = 1;
                        ag++;
                        CANT_T = (CANT_T + parseInt(lista[i].ca_por_cc));
                    }

                    x.append(texto);
                    $('#btn-agregar-cc2').click(function() {
                        agregar_centro_costo();
                    });
                    $(".por_sum_to").val(CANT_T);
                } else {
                    remover_fil();
                }
            });
        }
        function dar_valor(caracter, num) {
            $(".porc" + num).val(caracter);
        }
        var ag = 1;
        var ingr = 0;
        var cant_act = 0;
        var estable = 0;
        var can_eliminada = 0;
        function listar_cc2(num, dir, dep, cc) {
            $.post("../../centro_costo?opc=Listar_dir", function(objJson) {
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                for (var i = 0; i < lista.length; i++) {

                    if (dir == lista[i].id) {
                        $("#cc-dir" + num).append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                        listar_dep_cc2(num, dep, cc);
                    } else {
                        $("#cc-dir" + num).append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                    }
                }
            });
            $("#cc-dir" + num).change(function() {

                listar_dep_cc2(num);
            });
            $(".cc-dep" + num).change(function() {

                listar_centro_costo2(num, "0", arr_cc);
            });
            //  alert(num);
            $(".por-cen-1").keyup(function() {
                alert();
            });
            $(".remover" + num).click(function() {
                $(".remover" + (num - 1)).removeAttr("disabled");
                remover(num);
                sumn_porcen_total();
                ag--;
            });
        }
        function remover(rem) {
            $(".centro-costo_" + rem).remove();
        }
        function sumn_porcen_total() {
            var acum = 0;
            $.each($(".porcentaje_cc"), function() {
                acum = acum + parseFloat($(this).val());
            });
            $(".por_sum_to").val(acum);
        }
        function listar_dep_cc2(x, dep, cc) {
            var cc_dep = $(".cc-dep" + x);
            $.post("../../centro_costo?opc=Listar_dep", "&id_dir=" + $(".cc-dir" + x).val(), function(objJson) {

                cc_dep.empty();
                cc_dep.append("<option value=''>[DEPARTAMENTO]</option>");
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                for (var i = 0; i < lista.length; i++) {
                    if (dep == lista[i].id) {
                        cc_dep.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                        listar_centro_costo3(x, cc);
                    } else {
                        cc_dep.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                    }

                }
            });
        }
        function listar_centro_costo3(x, cc) {

            var centro_costo = $(".centro_costo" + x);
            $.post("../../centro_costo?opc=Listar_CC", "&id_dep=" + $(".cc-dep" + x).val(), function(objJson) {
                centro_costo.empty();
                centro_costo.append("<option value=''>[CENTRO COSTO]</option>");
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                for (var i = 0; i < lista.length; i++) {
                    if (cc == lista[i].id) {
                        centro_costo.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                    } else {
                        centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                    }

                }
            });
        }
        function listar_centro_costo2(x, opc, arr_cc) {

            var centro_costo = $(".centro_costo" + x);
            $.post("../../centro_costo?opc=Listar_CC", "&id_dep=" + $(".cc-dep" + x).val(), function(objJson) {
                centro_costo.empty();
                centro_costo.append("<option value=''>[CENTRO COSTO]</option>");
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                for (var i = 0; i < lista.length; i++) {


                    if (opc == "1") {
                        if (arr_cc[4] == lista[i].id) {
                            centro_costo.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                        } else {
                            centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                        }
                    } else {
                        centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                    }

                }
            });
        }
        function Actualizar_valores() {
            $(".porcentaje_cc").val(Math.round((100 / (ingr + ag - 1 - estable)) * 100) / 100);
            $(".procent").val(Math.round((100 / (ingr + ag - 1 - estable)) * 100) / 100);
            $(".por-i").val(Math.round((100 / (ingr + ag - 1 - estable)) * 100) / 100);
            sumn_porcen_total();
        }
        function agregar_centro_costo(opc, arr_cc) {
            if ($(".cant-actualmente").val() == "1") {
                ingr++;
                texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + ag + ':</label>';
                texto += '<div  class="row centro-costo_' + ag + '" >';
                texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '" ><option value="">[DIRECCION]</option></select></label></section>';
                texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
                texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';
                texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ingr + '"  value="' + (ingr + ag - 1) + '"  type="text" required="" class="porcentaje_cc porcenttaj' + ag + '"/><input name="PORCENTAJE_CC' + ingr + '"  type="hidden" class="procent cont_dif' + ag + '"></label></section>';
                texto += '<section class="col col-1" ><br><label class="btn"><a type="button" style="padding:9%; padding-right:20%; padding-left:20%;"  class=" btn btn-default txt-color-red remover' + ag + ' "><i class="fa fa-minus fa-2x"></i></a></label></section>';
                texto += '</div>';
                agregar.append(texto);
                remover_atrib(ag - 1);
                //agrgar_atrib(ag - 1);
                //agrgar_atrib_rem_t();
                listar_cc(ag);
                var c_porcentaje = $(".porcentaje_cc").size();
                actualizar_porcentaje();
                estable++;
                //sumn_porcen_total();
                cant_act++;
                $(".cant-actualmente").val(cant_act);
                $(".cant-ing").val(ingr);
                //agrgar_atrib_rem_t();
            } else {
                ingr++;
                texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + ag + ':</label>';
                texto += '<div  class="row centro-costo_' + ag + '" >';
                texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '"><option value="">[DIRECCION]</option></select></label></section>';
                texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
                texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';
                texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ingr + '"  min="0" value="' + (ingr + ag - 1) + '"  type="text" required="" class="porcentaje_cc porcenttaj' + ag + '"/><input name="PORCENTAJE_CC' + ingr + '"  type="hidden" class="procent cont_dif' + ag + '"/></label></section>';
                texto += '<section class="col col-1" ><br><label class="btn"><a type="button" style="padding:9%; padding-right:20%; padding-left:20%;"  class=" btn btn-default txt-color-red remover' + ag + ' "><i class="fa fa-minus fa-2x"></i></a></label></section>';
                texto += '</div>';
                agregar.append(texto);
                // remover_atrib(ag - 1);
                //remover_atrib(ag-1);
                agrgar_atrib(ag - 1);
                agrgar_atrib_rem_t();
                listar_cc(ag);
                var c_porcentaje = $(".porcentaje_cc").size();
                cant_act++;
                $(".cant-actualmente").val(cant_act);
                $(".cant-ing").val(ingr);
                actualizar_porcentaje();
                estable++;
                //sumn_porcen_total();
                //agrgar_atrib_rem_t();

            }
            //$(".ver").text(texto); 
            texto = "";
            $(".cant").val(ag);
            ag++;
            $(".porcentaje_cc").keyup(function() {
                sumn_porcen_total();
            });
        }
        function agrgar_atrib_rem_t() {
            $(".dis-total").attr("disabled", "disabled");
        }
        function agrgar_atrib(num) {
            if ((num) == $(".can_centro_cos").val()) {
            } else {
                $(".remover" + num).attr("disabled", "disabled");
            }
        }
        function agrgar_atrib_sol(num) {
            if ($(".cant-actualmente").val() == "1") {
                $(".remover" + num).attr("disabled", "disabled");
            }

        }
        function remover_atrib(num) {
            $(".remover" + num).removeAttr("disabled");
        }
        function listar_cc(num, opc, arr_cc) {
            var cc_dir = $(".cc-dir" + num);
            $.post("../../centro_costo?opc=Listar_dir", function(objJson) {
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                for (var i = 0; i < lista.length; i++) {
                    if (opc == "1") {
                        if (arr_cc[0] == lista[i].id) {
                            cc_dir.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                            listar_dep_cc(num, opc, arr_cc);
                        } else {
                            cc_dir.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                        }
                    } else {
                        cc_dir.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                    }
                }
            });
            $(".cc-dir" + num).change(function() {

                listar_dep_cc(num, "0", arr_cc);

            });
            $(".cc-dep" + num).change(function() {
                listar_centro_costo2(num, "0", arr_cc);
            });
            $(".porcenttaj" + num).keyup(function() {
                $(".cont_dif" + num).val($(this).val());
                // act_va_an();
            });
            $(".remover" + num).click(function() {
                remover(num);
                ag--;
                ingr--;
                estable--;
                cant_act--;
                $(".cant-actualmente").val(cant_act);
                $(".remover" + (num - 1)).removeAttr("disabled");
                if (ingr == 0) {
                    rem_atrib_rem_t();
                }
                $(".cant-ing").val(ingr);
                actualizar_porcentaje();
                sumn_porcen_total();
            });

        }
        function rem_atrib_rem_t() {
            $(".dis-total").removeAttr("disabled");
        }
        function listar_dep_cc(x, opc, arr_cc) {

            var cc_dep = $(".cc-dep" + x);
            $.post("../../centro_costo?opc=Listar_dep", "&id_dir=" + $(".cc-dir" + x).val(), function(objJson) {

                cc_dep.empty();
                cc_dep.append("<option value=''>[DEPARTAMENTO]</option>");
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                for (var i = 0; i < lista.length; i++) {
                    if (opc == "1") {
                        if (arr_cc[1] == lista[i].id) {
                            cc_dep.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                            (x, opc, arr_cc);
                        } else {
                            cc_dep.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                        }
                    } else {
                        cc_dep.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                    }

                }
            });
        }
        function actualizar_porcentaje() {
            $(".porcentaje_cc").val(Math.round((100 / (ingr + ag - 1 - estable)) * 100) / 100);
            $(".procent").val(Math.round((100 / (ingr + ag - 1 - estable)) * 100) / 100);
            $(".por-i").val(Math.round((100 / (ingr + ag - 1 - estable)) * 100) / 100);
            var acum = 0;
            $.each($(".porcentaje_cc"), function() {
                acum = acum + parseFloat($(this).val());
            });
            $(".por_sum_to").val(acum);

        }
        function Eliminar2(i) {
            //alert();
            var x = $("#fila-agregar-cc");

            var msg = confirm('Si aceptas se eliminara la informacion totalmente ¿aceptas?');
            if (msg == true) {
                $.post("../../centro_costo", "opc=Eliminar_det_cc&" + "id_dcc=" + $(".id_dcc" + i).val(), function() {
                    ag--;
                    $(".remover" + i + 1).attr("disabled", "disabled");
                    remov(i);
                    can_eliminada++;
                    $(".cant-elimi").val(can_eliminada);
                    var can = $(".can_centro_cos ").val();
                    can--;
                    //Listar_centro_costo();
                    $(".can_centro_cos ").val(can);
                    Actualizar_valores().after(Listar_centro_costo1());
                    ag = 1;
                });
            } else if (msg == false) {
                return false;
            }
        }
        function remov(i) {
            $(".centro-costo_" + i).remove();
        }
        function sumn_porcen_total() {

            var acum = 0;
            $.each($(".porcentaje_cc"), function() {
                acum = acum + parseFloat($(this).val());
            });
            $(".total_porcentaje").val(acum);
        }
        function cuenta_bancaria(banco) {
            if (banco == '') {
                $("#no_cuen").hide();
                $("#no_cuen_ban").hide();
                $("#generar").hide();
                $("#texto").hide();
                $("#no_cuen_otros").hide();
            }
            if (banco == '0') {
                $("#no_cuen").hide();
                $("#nu_cuen").val("");
                $("#no_cuen_ban").hide();
                $("#nu_cuen_ban").val("");
                $("#no_cuen_otros").show();
                $("#nu_cuen_otros").val("BBVA Banco Continental");
                $("#nu_cuen_otros").attr('readonly', 'readonly');
                //document.getElementById("nu_cuen_otros").readOnly = true;
                $("#texto").show();
                $("#generar").show();
                $("#subscription").attr("required", "required");
                $("#nu_cuen_otros").attr("required", "required");
                $("#nu_cuen_otros").removeAttr('maxlength');
                $("#nu_cuen_otros").removeAttr('minlength');

            }
            if (banco == '1') {
                $("#generar").hide();
                $("#no_cuen").show();
                $("#nu_cuen").val("");
                $("#nu_cuen").attr("required", "required");
                $("#no_cuen_ban").hide();
                $("#nu_cuen_ban").val("");
                $("#subscription").attr('checked', false);
                $("#nu_cuen").attr("maxlength", "21");
                $("#nu_cuen").attr("minlength", "19");
                $("#nu_cuen").val("0011-")
                $("#no_cuen_otros").hide();
                $("#nu_cuen_otros").val("");
                $("#texto").hide();
            }
            if (banco == '2') {

                $("#generar").hide();
                $("#subscription").attr('checked', false);
                $("#no_cuen_ban").hide();
                $("#nu_cuen_ban").val("");
                $("#no_cuen").show();
                $("#nu_cuen").val("");
                $("#nu_cuen").attr("required", "required");
                $("#nu_cuen_otros").removeAttr('maxlength');
                $("#nu_cuen_otros").removeAttr('minlength');
                $("#nu_cuen").removeAttr('maxlength');
                $("#nu_cuen").removeAttr('minlength');
                $("#nu_cuen").attr("maxlength", "14");
                $("#nu_cuen").attr("minlength", "0");
                //$("#nu_cuen").mask("99999999999999", {placeholder: "X"});
                $("#no_cuen_otros").hide();
                $("#nu_cuen_otros").val("");
                $("#texto").hide();
                $("#nu_cuen").valid();


            }
            if (banco == '3') {
                $("#no_cuen").show();
                $("#no_cuen").val("");
                $("#nu_cuen").attr("required", "required");
                $("#no_cuen_ban").show();
                $("#no_cuen_ban").val("");
                $("#nu_cuen_ban").attr("required", "required");
                $("#no_cuen_otros").show();
                $("#nu_cuen_otros").val("");
                $("#nu_cuen_otros").attr("required", "required");
                $("#generar").hide();
                $("#subscription").attr('checked', false);
                $("#texto").hide();
                $("#nu_cuen_otros").removeAttr('readonly');
                $("#nu_cuen_otros").removeAttr('maxlength');
                $("#nu_cuen_otros").removeAttr('minlength');
            }


        }
        var agregar = $('#list-cc');
        var ag = $('#fila-agregar .porcentaje_cc').size() + 1;
        var texto = "";
        function listar_tipo_horario() {
            $.post("../../formato_horario", "opc=Listar_Tip_Horario", function(objJson) {

                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                var horario = $("#horario");
                horario.empty();
                horario.append('<option value="" >[SELECCIONE]</option>');
                for (var i = 0; i < lista.length; i++) {
                    if ($(".id_det_hor").val().trim() == lista[i].id) {
                        horario.append('<option value="' + lista[i].id + '" selected="">' + lista[i].nombre + '</option>');

                    } else {
                        horario.append('<option value="' + lista[i].id + '" >' + lista[i].nombre + '</option>');
                    }
                }

            });
        }
        function list_horario(valor) {
            if (valor == 0) {
                $(".cont_lun").hide();
                $(".cont_mar").hide();
                $(".cont_mie").hide();
                $(".cont_jue").hide();
                $(".cont_vie").hide();
                $(".cont_sab").hide();
                $(".cont_dom").hide();
                $("#select_lun").val(2);
                $("#select_mar").val(2);
                $("#select_mie").val(2);
                $("#select_jue").val(2);
                $("#select_vie").val(2);
                $("#select_sab").val(2);
                $("#select_dom").val(2);
            } else {


                var dias_semana = new Array("lun", "mar", "mie", "jue", "vie", "sab", "dom");
                $(".tr-dia").remove();
                $.post("../../formato_horario", "opc=Listar_Horario&id=" + valor, function(objJson) {
                    var lista = objJson.lista;
                    var text_html = '';
                    var primera_fila = 0;
                    for (var f = 0; f < dias_semana.length; f++) {
                        var d = 0;
                        for (var i = 0; i < lista.length; i++) {
                            if (dias_semana[f] == lista[i].dia) {
                                primera_fila++;
                                var scntDiv = $('#show_' + dias_semana[f]);
                                $(".cont_" + dias_semana[f]).show();
                                $("#select_" + dias_semana[f]).val(lista[i].estado);
                                if (lista[i].estado == '2') {
                                    scntDiv.hide();
                                } else if (lista[i].estado == '1') {
                                    scntDiv.show();
                                    text_html += '<tr class="tr-dia turno_' + (i + 1) + '" ><td>T' + (d + 1);
                                    text_html += ' :</td><td><input type="text"   class="texto-h HORA_DESDE_' + dias_semana[f] + (d + 1) + '"   name="HORA_DESDE_' + dias_semana[f] + (d + 1);
                                    text_html += '" value="' + lista[i].desde + '"  /></td><td><input type="text"  class="texto-h HORA_HASTA_' + dias_semana[f] + (d + 1) + '"  value="' + lista[i].hasta + '" name="HORA_HASTA_' + dias_semana[f] + (d + 1)
                                            + '" /><input type="hidden" name="DIA_' + dias_semana[f] + (d + 1) + '" class="nombre_dia_' + (i + 1) + '" value="' + dias_semana[f] + '" >';
                                    if (primera_fila == 1) {
                                        text_html += '<button type="button" class="btn btn-primary agregar_turno" value="' + (i + 1) + '"><i class="fa fa-plus-square"></i></button></td></tr>';
                                    } else {
                                        text_html += '<button type="button" class="btn btn-danger remover_turno" value="' + (i + 1) + '"><i class="fa  fa-minus-circle"></i></button></td></tr>';
                                    }
                                    d++;
                                    scntDiv.append(text_html);
                                    text_html = "";
                                }

                            }
                            // alert(dias_semana[f]);
                        }
                        primera_fila = 0;
                    }
                    calcularHoras();
                    //$(".texto-h").mask("99:99", {placeholder: "X"});
                    $(".texto-h").keypress(
                            function() {
                                calcularHoras();
                            }
                    );
                    $(".remover_turno").click(function() {
                        //alert($(this).val());
                        $(".turno_" + $(this).val()).remove();
                        calcularHoras();
                    });
                    $(".agregar_turno").click(function() {
                        var turno = $('#show_' + $(".nombre_dia_" + $(this).val()).val() + ' .tr-dia').size() + 1;
                        var dia = $(".nombre_dia_" + $(this).val()).val();
                        var agregar_turno = $('#show_' + dia);

                        var i = $(".dias_semana .tr-dia").size();
                        text_html += '<tr class="tr-dia turno_' + (i + 1) + '" ><td>T' + turno;
                        text_html += ' :</td><td><input type="text"   class="texto-h HORA_DESDE_' + dia + turno + '"   name="HORA_DESDE_' + dia + turno;
                        text_html += '" value="00:00"  /></td><td><input type="text"  class="texto-h HORA_HASTA_' + dia + turno + '"  value="00:00" name="HORA_HASTA_' + dia + turno
                                + '" /><input type="hidden" name="DIA_' + dia + turno + '" class="nombre_dia_' + (i + 1) + '" value="' + dia + '" >';
                        text_html += '<button type="button" class="btn btn-danger remover_turno" value="' + (i + 1) + '"><i class="fa  fa-minus-circle"></i></button></td></tr>';
                        agregar_turno.append(text_html);
                        //$(".texto-h").mask("99:99", {placeholder: "X"});
                        $(".remover_turno").click(function() {
                            //alert($(this).val());
                            $(".turno_" + $(this).val()).remove();
                            calcularHoras();
                        });
                        $(".texto-h").keypress(
                                function() {
                                    calcularHoras();
                                }
                        );

                    });

                });

            }


        }
        function listar_horas() {
            $.post("../../formato_horario", "opc=Listar_Horas_horario&iddgp=" + $(".iddgp").val(), function(objJson) {
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                var turno_l = 0;
                var turno_ma = 0;
                var turno_mi = 0;
                var turno_j = 0;
                var turno_v = 0;
                var turno_s = 0;
                var turno_d = 0;
                var turno = 0;
                var dia = 0;
                $(".dias_semana").append("<input type='hidden' value='" + lista.length + "' name='cantidad_inicial_horario'>")
                for (var i = 0; i < lista.length; i++) {
                    $("#select_" + lista[i].dia_h).val(1);
                    $('#show_' + lista[i].dia_h).show();
                    var g = $("#show_" + lista[i].dia_h);
                    var text_html = '';
                    if (lista[i].dia_h == "lun") {
                        turno = turno_l;
                        dia = 1;
                    }
                    if (lista[i].dia_h == "mar") {
                        turno = turno_ma;
                        dia = 2;
                    }
                    if (lista[i].dia_h == "mie") {
                        turno = turno_mi;
                        dia = 3;
                    }
                    if (lista[i].dia_h == "jue") {
                        turno = turno_j;
                        dia = 4;
                    }
                    if (lista[i].dia_h == "vie") {
                        turno = turno_v;
                        dia = 5;
                    }
                    if (lista[i].dia_h == "sab") {
                        dia = 6;
                        turno = turno_s;
                    }
                    if (lista[i].dia_h == "dom") {
                        turno = turno_d;
                        dia = 7;
                    }

                    text_html += '<tr class="tr-dia turno_' + (turno + 1) + lista[i].dia_h + '" ><td>T' + (turno + 1);
                    text_html += ' :</td><td><input type="text"   class="texto-h HORA_DESDE_' + lista[i].dia_h + (turno + 1) + '"   name="HORA_DESDE_' + lista[i].dia_h + (turno + 1);
                    text_html += '" value="' + lista[i].hor_d + '"  /></td><td><input type="text"  class="texto-h HORA_HASTA_' + lista[i].dia_h + (turno + 1) + '"  value="' + lista[i].hor_h + '" name="HORA_HASTA_' + lista[i].dia_h + (turno + 1)
                            + '" /><input type="hidden" name="DIA_' + lista[i].dia_h + (turno + 1) + '" class="nombre_dia_' + (i + 1) + '" value="' + lista[i].dia_h + '" >';
                    text_html += '<input type="hidden" value="' + lista[i].id + '" name="id_horario' + (turno + 1) + lista[i].dia_h + '">'
                    if (turno + 1 == 1) {
                        text_html += '<button type="button" class="btn btn-primary agregar_turno' + (turno + 1) + '" value="' + lista[i].id + '" ><i class="fa fa-plus-square"></i></button></td></tr>';
                    } else {
                        text_html += '<button type="button" class="btn btn-danger remover_turno' + (turno + 1) + lista[i].dia_h + '" value="' + lista[i].id + '" onclick="Eliminar($(this).val(),' + (turno + 1) + ',' + dia + ');"><i class="fa  fa-minus-circle"></i></button></td></tr>';
                    }
                    g.append(text_html);
                    if (lista[i].dia_h == "lun") {
                        turno_l++;
                    }
                    if (lista[i].dia_h == "mar") {
                        turno_ma++;
                    }
                    if (lista[i].dia_h == "mie") {
                        turno_mi++;
                    }
                    if (lista[i].dia_h == "jue") {
                        turno_j++;
                    }
                    if (lista[i].dia_h == "vie") {
                        turno_v++;
                    }
                    if (lista[i].dia_h == "sab") {
                        turno_s++;
                    }
                    if (lista[i].dia_h == "dom") {
                        turno_d++;
                    }
                    calcularHoras();
                    //$(".texto-h").mask("99:99", {placeholder: "X"});
                    $(".texto-h").keypress(
                            function() {
                                calcularHoras();
                            }
                    );
                    /* $(".remover_turno" + (turno + 1)).click(function() {
                     //alert($(this).val());
                     //$(".turno_" + $(this).val()).remove();
                     Eliminar();
                     });*/
                    $(".agregar_turno").click(function() {
                        //var turno = $('#show_' + $(".nombre_dia_" + $(this).val()).val() + ' .tr-dia').size() + 1;
                        var dia = $(".nombre_dia_" + $(this).val()).val();
                        var agregar_turno = $('#show_' + dia);

                        var i = $(".dias_semana .tr-dia").size();
                        text_html += '<tr class="tr-dia turno_' + (i + 1) + '" ><td>T' + (turno + 1);
                        text_html += ' :</td><td><input type="text"   class="texto-h HORA_DESDE_' + dia + (turno + 1) + '"   name="HORA_DESDE_' + dia + (turno + 1);
                        text_html += '" value="00:00"  /></td><td><input type="text"  class="texto-h HORA_HASTA_' + dia + (turno + 1) + '"  value="00:00" name="HORA_HASTA_' + dia + (turno + 1)
                                + '" /><input type="hidden" name="DIA_' + dia + (turno + 1) + '" class="nombre_dia_' + (i + 1) + '" value="' + dia + '" >';
                        text_html += '<button type="button" class="btn btn-danger remover_turno" value="' + (i + 1) + '"><i class="fa  fa-minus-circle"></i></button></td></tr>';
                        agregar_turno.append(text_html);
                        //$(".texto-h").mask("99:99", {placeholder: "X"});
                        $(".remover_turno").click(function() {
                            //alert($(this).val());
                            $(".turno_" + $(this).val()).remove();
                            calcularHoras();
                        });
                        $(".texto-h").keypress(
                                function() {
                                    calcularHoras();
                                }
                        );

                    });
                }
            });
        }
        function Eliminar(id, num, dia) {
            var dia_string = "";
            var msg = confirm('Si aceptas se eliminara la informacion totalmente ¿estas seguro de realizar esta operacion?');
            if (msg == true) {
                $.post("../../formato_horario", "opc=Eliminar_turno&id_horario=" + id, function(objJson) {
                    if (dia == 1) {
                        dia_string = "lun";
                    }
                    if (dia == 2) {
                        dia_string = "mar";
                    }
                    if (dia == 3) {
                        dia_string = "mie";
                    }
                    if (dia == 4) {
                        dia_string = "jue";
                    }
                    if (dia == 5) {
                        dia_string = "vie";
                    }
                    if (dia == 6) {
                        dia_string = "sab";
                    }
                    if (dia == 7) {
                        dia_string = "dom";
                    }
                    $(".turno_" + num + dia_string).remove();
                    calcularHoras();
                });
            } else {
                return false;
            }
        }
        $(document).ready(function() {
            Listar_centro_costo1();
            listar_tipo_horario();
            listar_horas();
            sumn_porcen_total();
            $("#no_cuen").hide();
            $("#no_cuen_ban").hide();
            $("#generar").hide();
            $("#no_cuen_otros").hide();



            //  var r = "";
            $('#btn-agregar-cc').click(function() {
                agregar_centro_costo();
            });
            $("#banco").change(function() {

                cuenta_bancaria($(this).val());
                $("#nu_cuen").focus();
                $("#es_cuenta").val(1);
                //  alert($("#es_cuenta").val());
            });
            listar_cc();

            $("#horario").change(function() {
                var select_an = $("#horario").val();
                var msg = confirm('Si aceptas se eliminara la informacion totalmente los horarios que se ven ahora ¿deseas continuar?');
                if (msg == true) {
                    list_horario($(this).val());
                    $(".modificacion-total").val("1");
                } else {
                    listar_tipo_horario();
                    return false;
                }
            });
        });</script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#sueldo").numeric();
            $("#bono_al").numeric();
            $("#bev").numeric();
            $("#nu_cuen").numeric();
            $("#nu_cuen_ban").numeric();
            // $(".texto-h").mask("99:99", {placeholder: "0"});
            /* $("#sueldo").mask("99999.99", {placeholder: "0"});
             $("#bono_al").mask("99999.99", {placeholder: "0"});
             $("#bev").mask("99999.99", {placeholder: "0"});*/
            var scntDiv = $('#show_lun');
            var i = $('#show_lun .texto-h').size() + 1;
            var s = $('#show_lun .tr-count').size() + 1;
            $('#addScnt').click(function() {
                $('<tr><td>T' + s + ' :</td><td><input type="text"   name="HORA_DESDE_lun' + i
                        + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_lun' + i
                        + '" value="" placeholder=" " /><input type="hidden" name="DIA_lun' + i
                        + '" value="lun" ><input type="hidden" name="USER_CREACION_lun' + i
                        + '"> <a href="#" id="remScnt">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('#remScnt').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });
        //MARTES
        $(function() {
            var scntDiv = $('#show_mar');
            var i = $('#show_mar .texto-h').size() + 1;
            var s = $('#show_mar .tr-count_2').size() + 1;
            $('#add_2').click(function() {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mar' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mar' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mar' + i + '" value="mar" ><input type="hidden" name="USER_CREACION_mar' + i + '"> <a href="#" id="remove_2">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_2').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });
        //MIERCOLES
        $(function() {
            var scntDiv = $('#show_mie');
            var i = $('#show_mie .texto-h').size() + 1;
            var s = $('#show_mie .tr-count_3').size() + 1;
            $('#add_3').click(function() {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mie' + i + '" value="mie" ><input type="hidden" name="USER_CREACION_mie' + i + '"> <a href="#" id="remove_3">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_3').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });
        //JUEVES
        $(function() {
            var scntDiv = $('#show_jue');
            var i = $('#show_jue .texto-h').size() + 1;
            var s = $('#show_jue .tr-count_4').size() + 1;
            $('#add_4').click(function() {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_jue' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_jue' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_jue' + i + '" value="jue" ><input type="hidden" name="USER_CREACION_jue' + i + '"> <a href="#" id="remove_4">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_4').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });
        //VIERNES
        $(function() {
            var scntDiv = $('#show_vie');
            var i = $('#show_vie .texto-h').size() + 1;
            var s = $('#show_vie .tr-count_5').size() + 1;
            $('#add_5').click(function() {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_vie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_vie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_vie' + i + '" value="vie" ><input type="hidden" name="USER_CREACION_vie' + i + '"> <a href="#" id="remove_5">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_5').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });
        //DOMINGO
        $(function() {
            var scntDiv = $('#show_sab');
            var i = $('#show_sab .texto-h').size() + 1;
            var s = $('#show_sab .tr-count_6').size() + 1;
            $('#add_6').click(function() {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_dom' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_dom' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_dom' + i + '" value="dom" ><input type="hidden" name="USER_CREACION_dom' + i + '"> <a href="#" id="remove_6">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_6').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });</script>

    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>
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

    <!-- PAGE RELATED PLUGIN(S) 
    <script src="..."></script>-->
    <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>
    <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
    <script src="../../js/JQuery/jquery.maskMoney.js" type="text/javascript"></script>

    <script type="text/javascript">

        // DO NOT REMOVE : GLOBAL FUNCTIONS!

        $(document).ready(function() {
            $(".val_fe").change(function() {
                var fecha = $(this).val().split("-");

                if (fecha[0].length > 4) {
                    $(this).val("");
                }
            });
            pageSetUp();
            var $checkoutForm = $('#checkout-form').validate({
                // Rules for form validation
                rules: {
                    fname: {
                        required: true
                    },
                    FEC_DESDE: {
                        val_fecha: true
                    },
                    FEC_HASTA: {
                        val_fecha: true
                    },
                    horas_totales: {
                        required: true
                    },
                    lname: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    phone: {
                        required: true
                    },
                    country: {
                        required: true
                    },
                    city: {
                        required: true
                    },
                    code: {
                        required: true,
                        digits: true
                    },
                    address: {
                        required: true
                    },
                    name: {
                        required: true
                    },
                    card: {
                        required: true,
                        creditcard: true
                    },
                    cvv: {
                        required: true,
                        digits: true
                    },
                    month: {
                        required: true
                    },
                    year: {
                        required: true,
                        digits: true
                    }
                },
                // Messages for form validation
                messages: {
                    fname: {
                        required: 'Please enter your first name'
                    },
                    horas_totales: {
                        max: 'Porfavor digite un horario que se menor a 48 Horas de Trabajo'
                    },
                    lname: {
                        required: 'Please enter your last name'
                    },
                    email: {
                        required: 'Please enter your email address',
                        email: 'Please enter a VALID email address'
                    },
                    phone: {
                        required: 'Please enter your phone number'
                    },
                    country: {
                        required: 'Please select your country'
                    },
                    city: {
                        required: 'Please enter your city'
                    },
                    code: {
                        required: 'Please enter code',
                        digits: 'Digits only please'
                    },
                    address: {
                        required: 'Please enter your full address'
                    },
                    name: {
                        required: 'Please enter name on your card'
                    },
                    card: {
                        required: 'Please enter your card number'
                    },
                    cvv: {
                        required: 'Enter CVV2',
                        digits: 'Digits only'
                    },
                    month: {
                        required: 'Select month'
                    },
                    year: {
                        required: 'Enter year',
                        digits: 'Digits only please'
                    }
                },
                // Do not change code below
                errorPlacement: function(error, element) {
                    error.insertAfter(element.parent());
                }
            });


            jQuery.validator.addMethod("val_fecha", function(value, element) {
                var d = value.split("-");
                return this.optional(element) || String(parseInt(d[0])).length == 4;
            }, "¡Fecha ingresada invalida!");

            var $registerForm = $("#smart-form-register").validate({
                // Rules for form validation
                rules: {
                    username: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 3,
                        maxlength: 20
                    },
                    passwordConfirm: {
                        required: true,
                        minlength: 3,
                        maxlength: 20,
                        equalTo: '#password'
                    },
                    firstname: {
                        required: true
                    },
                    lastname: {
                        required: true
                    },
                    gender: {
                        required: true
                    },
                    terms: {
                        required: true
                    }
                },
                // Messages for form validation
                messages: {
                    login: {
                        required: 'Please enter your login'
                    },
                    email: {
                        required: 'Please enter your email address',
                        email: 'Please enter a VALID email address'
                    },
                    password: {
                        required: 'Please enter your password'
                    },
                    passwordConfirm: {
                        required: 'Please enter your password one more time',
                        equalTo: 'Please enter the same password as above'
                    },
                    firstname: {
                        required: 'Please select your first name'
                    },
                    lastname: {
                        required: 'Please select your last name'
                    },
                    gender: {
                        required: 'Please select your gender'
                    },
                    terms: {
                        required: 'You must agree with Terms and Conditions'
                    }
                },
                // Do not change code below
                errorPlacement: function(error, element) {
                    error.insertAfter(element.parent());
                }
            });
            var $reviewForm = $("#review-form").validate({
                // Rules for form validation
                rules: {
                    name: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    review: {
                        required: true,
                        minlength: 20
                    },
                    quality: {
                        required: true
                    },
                    reliability: {
                        required: true
                    },
                    overall: {
                        required: true
                    }
                },
                // Messages for form validation
                messages: {
                    name: {
                        required: 'Please enter your name'
                    },
                    email: {
                        required: 'Please enter your email address',
                        email: '<i class="fa fa-warning"></i><strong>Please enter a VALID email addres</strong>'
                    },
                    review: {
                        required: 'Please enter your review'
                    },
                    quality: {
                        required: 'Please rate quality of the product'
                    },
                    reliability: {
                        required: 'Please rate reliability of the product'
                    },
                    overall: {
                        required: 'Please rate the product'
                    }
                },
                // Do not change code below
                errorPlacement: function(error, element) {
                    error.insertAfter(element.parent());
                }
            });
            var $commentForm = $("#comment-form").validate({
                // Rules for form validation
                rules: {
                    name: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    url: {
                        url: true
                    },
                    comment: {
                        required: true
                    }
                },
                // Messages for form validation
                messages: {
                    name: {
                        required: 'Enter your name',
                    },
                    email: {
                        required: 'Enter your email address',
                        email: 'Enter a VALID email'
                    },
                    url: {
                        email: 'Enter a VALID url'
                    },
                    comment: {
                        required: 'Please enter your comment'
                    }
                },
                // Ajax form submition
                submitHandler: function(form) {
                    $(form).ajaxSubmit({
                        success: function() {
                            $("#comment-form").addClass('submited');
                        }
                    });
                },
                // Do not change code below
                errorPlacement: function(error, element) {
                    error.insertAfter(element.parent());
                }
            });
            var $contactForm = $("#contact-form").validate({
                // Rules for form validation
                rules: {
                    name: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    message: {
                        required: true,
                        minlength: 10
                    }
                },
                // Messages for form validation
                messages: {
                    name: {
                        required: 'Please enter your name',
                    },
                    email: {
                        required: 'Please enter your email address',
                        email: 'Please enter a VALID email address'
                    },
                    message: {
                        required: 'Please enter your message'
                    }
                },
                // Ajax form submition
                submitHandler: function(form) {
                    $(form).ajaxSubmit({
                        success: function() {
                            $("#contact-form").addClass('submited');
                        }
                    });
                },
                // Do not change code below
                errorPlacement: function(error, element) {
                    error.insertAfter(element.parent());
                }
            });
            var $loginForm = $("#login-form").validate({
                // Rules for form validation
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 3,
                        maxlength: 20
                    }
                },
                // Messages for form validation
                messages: {
                    email: {
                        required: 'Please enter your email address',
                        email: 'Please enter a VALID email address'
                    },
                    password: {
                        required: 'Please enter your password'
                    }
                },
                // Do not change code below
                errorPlacement: function(error, element) {
                    error.insertAfter(element.parent());
                }
            });
            var $orderForm = $("#order-form").validate({
                // Rules for form validation
                rules: {
                    name: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    phone: {
                        required: true
                    },
                    interested: {
                        required: true
                    },
                    budget: {
                        required: true
                    }
                },
                // Messages for form validation
                messages: {
                    name: {
                        required: 'Please enter your name'
                    },
                    email: {
                        required: 'Please enter your email address',
                        email: 'Please enter a VALID email address'
                    },
                    phone: {
                        required: 'Please enter your phone number'
                    },
                    interested: {
                        required: 'Please select interested service'
                    },
                    budget: {
                        required: 'Please select your budget'
                    }
                },
                // Do not change code below
                errorPlacement: function(error, element) {
                    error.insertAfter(element.parent());
                }
            });
            // START AND FINISH DATE
            $('#startdate').datepicker({
                dateFormat: 'dd.mm.yy',
                prevText: '<i class="fa fa-chevron-left"></i>',
                nextText: '<i class="fa fa-chevron-right"></i>',
                onSelect: function(selectedDate) {
                    $('#finishdate').datepicker('option', 'minDate', selectedDate);
                }
            });
            $('#finishdate').datepicker({
                dateFormat: 'dd.mm.yy',
                prevText: '<i class="fa fa-chevron-left"></i>',
                nextText: '<i class="fa fa-chevron-right"></i>',
                onSelect: function(selectedDate) {
                    $('#startdate').datepicker('option', 'maxDate', selectedDate);
                }
            });
        })

    </script>


    <script type="text/javascript">

        // DO NOT REMOVE : GLOBAL FUNCTIONS!

        $(document).ready(function() {

            pageSetUp();
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
<%}%>