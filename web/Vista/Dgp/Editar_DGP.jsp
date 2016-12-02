
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
<jsp:useBean id="Listar_Trabajador_id" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="LIST_ID_DGP" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Det_Puesto" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Requerimiento" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_Cuenta_Sueldo" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="fecha_maxima_plazo" scope="session" class="java.lang.String"/>

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

        <script language="javascript" type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <link rel="stylesheet" href="../../css/chosen.css"  type="text/css" > 
        <link href="../../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <style>
            .td{
                font-weight: bold;
            }
            #titu{
                font-weight: bold;
                color: #005cac;
              /*  // color: blue;*/
            }
            .cont{
                margin: 0 auto;
            }
            .caja{
                box-shadow: 2px 2px 5px #cccccc;
                background-color: #ffffff;
            }
            .c_header{
                color: #ffffff;
                background-color: #3276b1;
                border-color: #3276b1;
            }
            table{
                border: 0px;
            }
            .texto-h{
                width:40px;
            }
        </style>
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
                                                <fieldset>
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
                                                    <div class="row" >
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">
                                                                Motivo :<select name="MOTIVO" class="ant_policiales" required="" >
                                                                    <option value="" >[Seleccione]</option>
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
                                                        <section class="col col-2" id="titu">MFL:
                                                            <label class="toggle" >
                                                                <%if (dg.getEs_mfl().trim().equals("0")) {%>
                                                                <input type="checkbox" value="1"  name="MFL" name="checkbox-toggle" >
                                                                <%}
                                                                    if (dg.getEs_mfl().trim().equals("1")) {%>
                                                                <input type="checkbox" value="1"  name="MFL" name="checkbox-toggle" checked="">
                                                                <%}%>
                                                                <i data-swchon-text="SI" data-swchoff-text="NO"></i>
                                                            </label>
                                                        </section>

                                                        <section class="col col-2" id="titu">Presupuestado:
                                                            <label class="toggle"  > 
                                                                <%if (dg.getEs_presupuestado().trim().equals("0")) {%>
                                                                <input type="checkbox" value="1"  name="ES_PRESUPUESTADO" name="checkbox-toggle" >
                                                                <%}
                                                                    if (dg.getEs_presupuestado().trim().equals("1")) {%>
                                                                <input type="checkbox" value="1"  name="ES_PRESUPUESTADO" name="checkbox-toggle" checked="">
                                                                <%}%>
                                                                <i data-swchon-text="SI" data-swchoff-text="NO"></i>
                                                            </label>
                                                        </section>
                                                        <div class="div_input_diezmo col col-4">    
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <section class="col col-4" >
                                                            <label class="label" id="titu"> Area:</label>
                                                            <label class="select">
                                                                <select data-placeholder="Seleccionar Area"  class="select-area"required="" >
                                                                    <option value="">[Seleccione]</option>  
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="label" id="titu"> Sección:</label>
                                                            <label class="select">
                                                                <select data-placeholder="Seleccionar Sección"  class="select-seccion"required="" >
                                                                    <option value="">[Seleccione]</option>  
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="label" id="titu"> Puesto:</label>
                                                            <label class="select">
                                                                <select data-placeholder="Seleccionar Puesto"  class="select-puesto" required="" name="IDPUESTO" >
                                                                    <option value="">[Seleccione]</option>  
                                                                </select>
                                                            </label>
                                                        </section>
                                                    </div>
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
                                                    <div class="info_1">
                                                    </div>

                                                    <div class="row">
                                                        <section class="col col-6" >
                                                            <label class="input" id="titu">Fecha de Inicio :
                                                                <input type="text" name="FEC_DESDE"  required="" class="simple-field-data-mask frompicker val_fe" min="<%=fecha_maxima_plazo%>"  data-mask="00/00/0000" autocomplete="off">
                                                            </label>
                                                        </section>
                                                        <section class="col col-6">
                                                            <label class="input"  id="titu">Fecha de Cese :
                                                                <input type="date" name="FEC_HASTA"  required=""  class="simple-field-data-mask topicker val_fe" min="<%=fecha_maxima_plazo%>"  data-mask="00/00/0000" autocomplete="off">
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
                                                                    <option value="" >[Seleccione]</option>
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
                                                                    <option value="">[Seleccione]</option>
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
                                                        <input type="text" value="1" name="CANT" class="cant" />
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
                                                    <input type="hidden" name="cant_ingresada" class="cant-ing" value="0">
                                                </fieldset>

                                                <fieldset id="fila-agregar">
                                                </fieldset>    
                                                <input type="hidden" class="dep_id" value="<%=dg.getId_departamento().trim()%>" />
                                                <input type="hidden" class="area_id" value="<%=dg.getId_area().trim()%>" />
                                                <input type="hidden" class="seccion_id" value="<%=dg.getId_seccion().trim()%>" />
                                                <input type="hidden" class="puesto_id" value="<%=dg.getId_puesto().trim()%>" />
                                                <input type="hidden" name="redirect" value="<%=request.getParameter("redirect")%>" />
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
                                                                <option value="">[Seleccione]</option>
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
                                                        <div class="cont">
                                                            <section class="col col-sm-4 col-md-4">
                                                                <div class="caja">
                                                                    <table  id="show_lun" class="cont_lun table table-condensed table-bordered"> 
                                                                        <tr class="c_header"><td style="text-align: center;" colspan="3">Lunes</td></tr>

                                                                    </table>
                                                                </div>
                                                            </section>
                                                        </div>
                                                        <div class="cont">
                                                            <section class="col col-sm-4 col-md-4">
                                                                <div class="caja">
                                                                    <table id="show_mar" class="cont_mar table table-condensed table-bordered">     
                                                                        <tr class="c_header" ><td style="text-align: center;"  colspan="3">Martes</td></tr>
                                                                    </table>
                                                                </div>
                                                            </section>
                                                        </div>
                                                        <div class="cont">
                                                            <section class="col col-sm-4 col-md-4">
                                                                <div class="caja">
                                                                    <table id="show_mie" class="cont_mie table table-condensed table-bordered">     
                                                                        <tr class="c_header"><td style="text-align: center;" colspan="3">Miercoles</td></tr>
                                                                    </table>
                                                                </div>
                                                            </section>
                                                        </div>
                                                        <div class="cont">
                                                            <section class="col col-sm-4 col-md-4">
                                                                <div class="caja">
                                                                    <table id="show_jue" class="cont_jue table table-condensed table-bordered">     
                                                                        <tr class="c_header"><td style="text-align: center;" colspan="3">Jueves</td></tr>
                                                                    </table>
                                                                </div>
                                                            </section>
                                                        </div>
                                                        <div class="cont">
                                                            <section class="col col-sm-4 col-md-4">
                                                                <div class="caja">
                                                                    <table id="show_vie" class="cont_vie table table-condensed table-bordered">     
                                                                        <tr class="c_header"><td style="text-align: center;" colspan="3">Viernes</td></tr>
                                                                    </table>
                                                                </div>
                                                            </section>
                                                        </div>
                                                        <div class="cont">
                                                            <section class="col col-sm-4 col-md-4">
                                                                <div class="caja">
                                                                    <table id="show_sab" class="cont_sab table table-condensed table-bordered">     
                                                                        <tr class="c_header"><td style="text-align: center;"  colspan="3">Sábado</td></tr>
                                                                    </table>
                                                                </div>
                                                            </section>
                                                        </div>
                                                        <div class="cont">
                                                            <section class="col col-sm-4 col-md-4">
                                                                <div class="caja">
                                                                    <table id="show_dom" class="cont_dom table table-condensed table-bordered" >
                                                                        <tr class="c_header"><td  style="text-align: center;" colspan="3">Domingo</td></tr>
                                                                    </table>
                                                                </div>
                                                            </section>
                                                        </div>


                                                    </div>
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

                                                </fieldset>
                                                <footer>
                                                    <div class="div_info">

                                                    </div>
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


    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script>         if (!window.jQuery) {
                                                            document.write('<script src="../../js/libs/jquery-2.0.2.min.js"><\/script>');
                                                        }
    </script>

    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script>         if (!window.jQuery.ui) {
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

    <!-- JARVIS WIDGETS 
    <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>-->

    <!-- EASY PIE CHARTS 
    <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>-->

    <!-- SPARKLINES -
    <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>->

    <!-- JQUERY VALIDATE -->
    <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

    <!-- JQUERY MASKED INPUT -->
    <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->

    <!-- JQUERY SELECT2 INPUT -->
    <script src="../../js/plugin/select2/select2.min.js"></script>

    <!-- JQUERY UI + Bootstrap Slider 
    <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>-->

    <!-- browser msie issue fix
    <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script> -->

    <!-- FastClick: For mobile devices -->
    <script src="../../js/plugin/fastclick/fastclick.min.js"></script>

    <!--[if IE 8]>
    
    <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
    
    <![endif]-->

    <!-- Demo purpose only -->
    <script src="../../js/demo.min.js"></script>

    <!-- MAIN APP JS FILE -->
    <script src="../../js/app.min.js"></script>

    <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT
    <!-- Voice command : plugin 
    <script src="../../js/speech/voicecommand.min.js"></script> -->

    <!-- PAGE RELATED PLUGIN(S) 
    <script src="..."></script>-->
    <script src="../../js/plugin/knob/jquery.knob.min.js"></script>
    <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>
    <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
    <script src="../../js/chosen.jquery.js" type="text/javascript"></script>
    <script src="../../js/Js_Formulario/Js_Form.js" type="text/javascript"></script>
    <!--Funciones globales-->
    <script src="../../js/Js_Centro_Costo/Functions/Js_centro_costo.js" type="text/javascript"></script>
    <script src="../../js/Js_Plazo/Js_plazo_advertencia.js" type="text/javascript"></script>
    <script src="../../js/jquery.mask.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui.js" type="text/javascript"></script>
    <script>
                                                        function periodo_pago(cantidad) {
                                                            var sueldo = parseFloat($("#sueldo").val());
                                                            var p_p = sueldo / cantidad;
                                                            $.each($(".monto"), function () {
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
                                                        function showEsDiezmo() {
                                                            var obj = $(".div_input_diezmo");
                                                            obj.hide(100);
                                                            obj.empty();
                                                            $.ajax({
                                                                url: "../../trabajador", data: "opc=ShowEsDiezmoTrabajador&id=" + $(".idtr").val(), type: 'POST', success: function (data, textStatus, jqXHR) {
                                                                    if (data.rpta) {
                                                                        obj.append(data.html);
                                                                        obj.show(100);
                                                                        $(".cbkDiezmo").click(function () {
                                                                            $.SmartMessageBox({
                                                                                title: "&iexcl;Alerta!",
                                                                                content: "Esta seguro de modificar la autorizaci&oacute;n de descuento diezmo?",
                                                                                buttons: '[No][Si]'
                                                                            }, function (ButtonPressed) {
                                                                                if (ButtonPressed === "Si") {
                                                                                    if ($(".cbkDiezmo").prop("checked")) {
                                                                                        $.ajax({
                                                                                            url: "../../trabajador", data: "opc=UpdateEsDiezmo&id=" + $(".idtr").val() + "&estado=0", type: 'POST', success: function (data, textStatus, jqXHR) {
                                                                                                if (data.status) {
                                                                                                    $(".cbkDiezmo").prop("checked", false);
                                                                                                    $.smallBox({
                                                                                                        title: "&iexcl;Atenci&oacute;n!",
                                                                                                        content: "<i class='fa fa-clock-o'></i> <i>Se neg&oacute; el descuento de diezmo...</i>",
                                                                                                        color: "#C46A69",
                                                                                                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                                                                        timeout: 6000
                                                                                                    });
                                                                                                }

                                                                                            }
                                                                                        });
                                                                                    } else {
                                                                                        $.ajax({
                                                                                            url: "../../trabajador", data: "opc=UpdateEsDiezmo&id=" + $(".idtr").val() + "&estado=1", type: 'POST', success: function (data, textStatus, jqXHR) {
                                                                                                if (data.status) {
                                                                                                    $(".cbkDiezmo").prop("checked", true);
                                                                                                    $.smallBox({
                                                                                                        title: "&iexcl;Atenci&oacute;n!",
                                                                                                        content: "<i class='fa fa-clock-o'></i> <i>Se autoriz&oacute; el descuento de diezmo...</i>",
                                                                                                        color: "#659265",
                                                                                                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                                                                        timeout: 6000
                                                                                                    });
                                                                                                }
                                                                                            }
                                                                                        });
                                                                                    }
                                                                                    showEsDiezmo();


                                                                                }
                                                                            });
                                                                            return false;


                                                                        });
                                                                    }
                                                                }
                                                            });
                                                        }
                                                        var cantidad = 1;
                                                        $("#btn_add").click(function () {
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
                                                            $(".eliminar" + cantidad).click(function () {
                                                                $(".pago_cuotas_" + cantidad).remove();
                                                                periodo_pago(cantidad);
                                                                cantidad--;
                                                                periodo_pago(cantidad);
                                                                //alert(cantidad)
                                                            });
                                                        });



    </script>

    <script language="javascript" type="text/javascript">
        $(document).ready(function mostrar() {

            $(".cont_lun").hide();
            $(".cont_mar").hide();
            $(".cont_mie").hide();
            $(".cont_jue").hide();
            $(".cont_vie").hide();
            $(".cont_sab").hide();
            $(".cont_dom").hide();
            $("#select_lun").change(
                    function () {
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
                    function () {
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
                    function () {
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
                    function () {
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
                    function () {
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
                    function () {
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
            $("#select_dom").change(function () {
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
        function dar_valor(caracter, num) {
            $(".porc" + num).val(caracter);
            var acum = 0;
            $.each($(".porcentaje_cc"), function () {
                acum = acum + parseFloat($(this).val());
            });
            $(".por_sum_to").val(acum);
        }
        function Eliminar(id, num, dia) {
            var dia_string = "";
            var msg = confirm('Si aceptas se eliminara la informacion totalmente ¿estas seguro de realizar esta operacion?');
            if (msg == true) {
                $.post("../../formato_horario", "opc=Eliminar_turno&id_horario=" + id, function (objJson) {
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
                $("#texto").show();
                $("#generar").show();
                $("#subscription").attr("required", "required");
                $("#nu_cuen_otros").attr("required", "required");
                $("#nu_cuen_otros").removeAttr('maxlength');
                $("#nu_cuen_otros").removeAttr('minlength');
            }
            if (banco === '1') {
                $("#generar").hide();
                $("#no_cuen").show();
                $("#nu_cuen").val("");
                $("#nu_cuen").attr("required", "required");
                $("#no_cuen_ban").hide();
                $("#nu_cuen_ban").val("");
                $("#subscription").attr('checked', false);
                $("#nu_cuen").attr("maxlength", "21");
                $("#nu_cuen").attr("minlength", "19");
                $("#no_cuen_otros").hide();
                $("#nu_cuen_otros").val("");
                $("#texto").hide();
            }
            if (banco === '2') {

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
            if (banco === '3') {
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

        function listar_tipo_horario() {
            $.post("../../formato_horario", "opc=Listar_Tip_Horario", function (objJson) {

                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                var horario = $("#horario");
                horario.empty();
                horario.append('<option value="" >[Seleccione]</option>');
                for (var i = 0; i < lista.length; i++) {
                    if ($(".id_det_hor").val().trim() === lista[i].id) {
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
                $.post("../../formato_horario", "opc=Listar_Horario&id=" + valor, function (objJson) {
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
                            function () {
                                calcularHoras();
                            }
                    );
                    $(".remover_turno").click(function () {
                        //alert($(this).val());                         $(".turno_" + $(this).val()).remove();
                        calcularHoras();
                    });
                    $(".agregar_turno").click(function () {
                        var turno = $('#show_' + $(".nombre_dia_" + $(this).val()).val() + ' .tr-dia').size() + 1;
                        var dia = $(".nombre_dia_" + $(this).val()).val();
                        var agregar_turno = $('#show_' + dia);
                        var i = $(".dias_semana .tr-dia").size();
                        text_html += '<tr class="tr-dia turno_' + (i + 1) + '" ><td>T' + turno;
                        text_html += ' :</td><td><input type="text"   class="texto-h HORA_DESDE_' + dia + turno + '"   name="HORA_DESDE_' + dia + turno;
                        text_html += '" value="00:00"  /></td><td><input type="text"  class="texto-h HORA_HASTA_' + dia + turno + '"  value="00:00" name="HORA_HASTA_' + dia + turno + '" /><input type="hidden" name="DIA_' + dia + turno + '" class="nombre_dia_' + (i + 1) + '" value="' + dia + '" >';
                        text_html += '<button type="button" class="btn btn-danger remover_turno" value="' + (i + 1) + '"><i class="fa  fa-minus-circle"></i></button></td></tr>';
                        agregar_turno.append(text_html);
                        //$(".texto-h").mask("99:99", {placeholder: "X"});
                        $(".remover_turno").click(function () {
                            //alert($(this).val());
                            $(".turno_" + $(this).val()).remove();
                            calcularHoras();
                        });
                        $(".texto-h").keypress(
                                function () {
                                    calcularHoras();
                                }
                        );
                    });
                });
            }

        }
        function listar_horas() {
            $.post("../../formato_horario", "opc=Listar_Horas_horario&iddgp=" + $(".iddgp").val(), function (objJson) {
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
                            function () {
                                calcularHoras();
                            }
                    );
                    /* $(".remover_turno" + (turno + 1)).click(function() {
                     //alert($(this).val());
                     //$(".turno_" + $(this).val()).remove();
                     Eliminar();
                     });*/
                    $(".agregar_turno").click(function () {
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
                        $(".remover_turno").click(function () {
                            //alert($(this).val());
                            $(".turno_" + $(this).val()).remove();
                            calcularHoras();
                        });
                        $(".texto-h").keypress(
                                function () {
                                    calcularHoras();
                                }
                        );
                    });
                }
            });
        }

    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var scntDiv = $('#show_lun');
            var i = $('#show_lun .texto-h').size() + 1;
            var s = $('#show_lun .tr-count').size() + 1;
            $('#addScnt').click(function () {
                $('<tr><td>T' + s + ' :</td><td><input type="text"   name="HORA_DESDE_lun' + i
                        + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_lun' + i
                        + '" value="" placeholder=" " /><input type="hidden" name="DIA_lun' + i
                        + '" value="lun" ><input type="hidden" name="USER_CREACION_lun' + i
                        + '"> <a href="#" id="remScnt">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('#remScnt').click(function () {
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
        $(function () {
            var scntDiv = $('#show_mar');
            var i = $('#show_mar .texto-h').size() + 1;
            var s = $('#show_mar .tr-count_2').size() + 1;
            $('#add_2').click(function () {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mar' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mar' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mar' + i + '" value="mar" ><input type="hidden" name="USER_CREACION_mar' + i + '"> <a href="#" id="remove_2">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_2').click(function () {
                if (i > 2) {
                    $(this).parents('tr').remove(); //  $("#tr-d").remove();                                i--;                     s--;
                }
                return false;
            });
        });
        //MIERCOLES
        $(function () {
            var scntDiv = $('#show_mie');
            var i = $('#show_mie .texto-h').size() + 1;
            var s = $('#show_mie .tr-count_3').size() + 1;
            $('#add_3').click(function () {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mie' + i + '" value="mie" ><input type="hidden" name="USER_CREACION_mie' + i + '"> <a href="#" id="remove_3">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_3').click(function () {
                if (i > 2) {
                    $(this).parents('tr').remove(); //  $("#tr-d").remove();                                i--;                     s--;
                }
                return false;
            });
        });
        //JUEVES
        $(function () {
            var scntDiv = $('#show_jue');
            var i = $('#show_jue .texto-h').size() + 1;
            var s = $('#show_jue .tr-count_4').size() + 1;
            $('#add_4').click(function () {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_jue' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_jue' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_jue' + i + '" value="jue" ><input type="hidden" name="USER_CREACION_jue' + i + '"> <a href="#" id="remove_4">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_4').click(function () {
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
        $(function () {
            var scntDiv = $('#show_vie');
            var i = $('#show_vie .texto-h').size() + 1;
            var s = $('#show_vie .tr-count_5').size() + 1;
            $('#add_5').click(function () {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_vie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_vie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_vie' + i + '" value="vie" ><input type="hidden" name="USER_CREACION_vie' + i + '"> <a href="#" id="remove_5">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_5').click(function () {
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
        $(function () {
            var scntDiv = $('#show_sab');
            var i = $('#show_sab .texto-h').size() + 1;
            var s = $('#show_sab .tr-count_6').size() + 1;
            $('#add_6').click(function () {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_dom' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_dom' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_dom' + i + '" value="dom" ><input type="hidden" name="USER_CREACION_dom' + i + '"> <a href="#" id="remove_6">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_6').click(function () {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });</script>
    <script type="text/javascript">
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        $(document).ready(function () {
            pageSetUp();
            $(".val_fe").change(function () {
                var fecha = $(this).val().split("-");
                if (fecha[0].length > 4) {
                    $(this).val("");
                }
            });
            $("#sueldo").numeric();
            $("#bono_al").numeric();
            $("#bev").numeric();
            $("#nu_cuen").numeric();
            $("#nu_cuen_ban").numeric();
            showEsDiezmo();
            ListCentroCostoDGP($(".iddgp").val());
            listar_tipo_horario();
            listar_horas();
            $("#banco").change(function () {
                $("#no_cuen").hide();
                $("#no_cuen_ban").hide();
                $("#generar").hide();
                $("#no_cuen_otros").hide();
                cuenta_bancaria($(this).val());
                $("#nu_cuen").focus();
                $("#es_cuenta").val(1);
            });
            listar_cc();
            $("#horario").change(function () {
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

            list_select($(".select-area"), "../../Direccion_Puesto", "opc=Listar_area2&id=" + $(".dep_id").val(), "4", $(".area_id").val());
            list_select($(".select-seccion"), "../../Direccion_Puesto", "opc=Listar_sec2&id=" + $(".area_id").val(), "4", $(".seccion_id").val());
            list_select($(".select-puesto"), "../../Direccion_Puesto", "opc=Listar_pu_id&id=" + $(".seccion_id").val(), "4", $(".puesto_id").val());
            $(".select-area").change(function () {
                list_select($(".select-seccion"), "../../Direccion_Puesto", "opc=Listar_sec2&id=" + $(".select-area").val(), "3");
                $(".select-seccion,.select-puesto").val("");
                $(".chosen-select").trigger("chosen:updated");
            });
            $(".select-seccion").change(function () {
                list_select($(".select-puesto"), "../../Direccion_Puesto", "opc=Listar_pu_id&id=" + $(".select-seccion").val(), "3");
                $(".chosen-select").trigger("chosen:updated");
            });


            $("#sueldo").keyup(function () {
                var sueldo = parseFloat($("#sueldo").val());
                $(".monto").val(Math.round(sueldo));
            });
            /*Advertencias de Plazo*/
            var b = $("#alerta_dgp");
            var info = $(".div_info");
            listar_mensaje_plazo("2", b, info);
            var s = $(".info_1");
            var t = $(".alert_1");
            listar_mensaje_plazo("1", t, s);


            $("#sueldo").keyup(function () {
                calcular_sueldo_total();
            });
            $("#bono_al").keyup(function () {
                calcular_sueldo_total();
            });
            $("#bev").keyup(function () {
                calcular_sueldo_total();
            });
            $("#bono_pu").keyup(function () {
                calcular_sueldo_total();
            });
            $(".contenido").hide();
            /*TEMPORAL*/             //Planilla
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
            $('#checkout-form').validate({
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
                        required: true, digits: true
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
                }, // Messages for form validation           
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
                    name: {required: 'Please enter name on your card'
                    },
                    card: {required: 'Please enter your card number'
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
                errorPlacement: function (error, element) {
                    error.insertAfter(element.parent());
                }
            });
            jQuery.validator.addMethod("val_fecha", function (value, element) {
                var d = value.split("-");
                return this.optional(element) || String(parseInt(d[0])).length == 4;
            }, "¡Fecha ingresada invalida!");
        })
 
    </script>
    
</html>
<%}%>
