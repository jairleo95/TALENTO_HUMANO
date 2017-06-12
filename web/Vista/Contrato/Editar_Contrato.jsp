<%@page import="pe.edu.upeu.application.util.DateFormat"%>
<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upeu.application.model.Grupo_Ocupaciones"%>
<%@page import="pe.edu.upeu.application.model.Modalidad"%>
<%@page import="pe.edu.upeu.application.model.Regimen_Laboral"%>
<%@page import="pe.edu.upeu.application.model.Direccion"%>
<%@page import="pe.edu.upeu.application.model.V_Contrato_dgp"%>
<%@page import="pe.edu.upeu.application.model.X_List_Id_Contrato_DGP"%>
<%@page import="pe.edu.upeu.application.model.X_List_Id_Contrato_DGP"%>
<jsp:useBean id="List_contrato" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Direccion" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_reg_labo" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_modalidad" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_grup_ocu" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_cc_x_con" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title>Editar Contrato</title>

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
        <style type="text/css">
            #titulo{
                font-weight: bold;
                color: #005cac;
            }
            #titu{
                font-weight: bold;
                color: #005cac;
            }
        </style>
    </head>


    <body>
        <!-- Widget ID (each widget will need unique ID)-->
        <div id="main" role="main" style="margin:0px;">
            <div id="content" >
                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false" 
                     data-widget-togglebutton="false"
                     data-widget-deletebutton="false"
                     data-widget-fullscreenbutton="false">
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
                        <span class="widget-icon"> <i class="glyphicon glyphicon-edit"></i> </span>
                        <h2 class="font-md"><strong>Ficha </strong> <i>Contractual</i></h2>
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
                            <%
                                HttpSession sesion = request.getSession(true);
                                String idrol = (String) sesion.getAttribute("IDROL");
                            %>
                            <%for (int i = 0; i < List_contrato.size(); i++) {
                                    V_Contrato_dgp a = new V_Contrato_dgp();
                                    a = (V_Contrato_dgp) List_contrato.get(i);
                            %>

                            <form action="../../contrato"  class="smart-form formEditawrContrato"  method="POST" >
                                <fieldset >
                                    <%if (a.getId_dgp() != null) {%>
                                    <div class="row">
                                        <section class="col col-3">
                                            <label class="select" id="titulo">Motivo :
                                                <select class="input-group-sm" disabled="">
                                                    <%if (a.getLi_motivo() != null) {%>
                                                    <%if (a.getLi_motivo().trim().equals("1")) {%>
                                                    <option value="1" selected="">Trabajador Nuevo</option>   
                                                    <option value="2" >renovación</option>   
                                                    <%} else {%>
                                                    <option value="1" >Trabajador Nuevo</option>   
                                                    <option value="2" selected="">renovación</option>
                                                    <%}%>
                                                    <%} else {%>
                                                    <option value="1" >Trabajador Nuevo</option>   
                                                    <option value="2" >renovación</option>
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section >
                                        <section class="col col-3" >
                                            <label id="titulo" >MFL:</label>
                                            <label class="toggle" id="titulo" > 
                                                <input type="checkbox" name="checkbox-toggle"  >
                                                <%if (a.getEs_mfl() != null) {%>
                                                <%if (a.getEs_mfl().trim().equals("1")) {%>
                                                <input type="checkbox" name="checkbox-toggle" checked="" disabled="">
                                                <%} else {%>
                                                <input type="checkbox" name="checkbox-toggle"  disabled="">
                                                <%}
                                                } else {%>
                                                <%}%>
                                                <i data-swchoff-text="NO"  data-swchon-text="SI"></i>
                                            </label>
                                        </section>
                                        <section class="col col-3" >
                                            <div class="div_input_diezmo">
                                            </div>
                                        </section>
                                        <input type="hidden" value="<%=a.getId_dgp()%>" id="id_dgp">

                                    </div>
                                    <%}%>
                                    <input type="hidden"  value="<%=a.getId_trabajador()%>" class="idtr">
                                    <div class="row" >
                                        <input type="hidden" name="id_rol_ses" id="id_rol_s" value="<%=idrol%>">
                                        <input type="hidden" name="TIPO_PLANILLA"  value="<%%>">
                                        <input type="hidden" name="HORARIO"  value="">

                                        <input type="hidden" name="IDDETALLE_DGP" value="<%=a.getId_dgp()%>" class="text-box id_dg" id="id_dg" >                              
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Desde:
                                                <%if (a.getFe_desde() != null) {%>
                                                <input type="text" name="FEC_DESDE" value="<%=(a.getFe_desde())%>" class="input-group-sm frompicker" data-mask="99/99/9999" data-mask-placeholder= "_" required="">
                                                <%} else {%>
                                                <input type="text" name="FEC_DESDE" class="input-group-sm frompicker" data-mask="99/99/9999" data-mask-placeholder= "_" required="">
                                                <%}%>
                                            </label>
                                        </section>
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Hasta: 
                                                <%if (a.getFe_hasta() != null) {
                                                        if (a.getId_dgp() == null) {%>
                                                <input type="text" name="FEC_HASTA" value="<%=(a.getFe_hasta())%>" class="input-group-sm topicker" data-mask="99/99/9999" data-mask-placeholder= "_">
                                                <%} else {%>
                                                <input type="text" name="FEC_HASTA" value="<%=(a.getFe_hasta())%>" class="input-group-sm topicker" data-mask="99/99/9999" data-mask-placeholder= "_" required="">
                                                <%}
                                                } else{%>
                                                <% if (a.getId_dgp() == null) {%>
                                                <input type="text" name="FEC_HASTA" value="" class="input-group-sm topicker" data-mask="99/99/9999" data-mask-placeholder= "_">
                                                <%} else {%>
                                                <input type="text" name="FEC_HASTA" value="" class="input-group-sm topicker" data-mask="99/99/9999" data-mask-placeholder= "_" required="">
                                                <%}
                                                    }%>
                                            </label>
                                        </section>
                                        <%
                                            boolean permissionEditContract = false;
                                            String disabledEdit = "";
                                            if (idrol.equals("ROL-0001")) {
                                                permissionEditContract = true;
                                            }
                                            disabledEdit = (permissionEditContract) ? "" : "disabled";
                                        %>
                                        <section class="col col-3" id="titulo">
                                            <label class="select" id="titulo">Dirección:
                                                <select name="DIRECCION" <%=disabledEdit%> class="select_dir input-group-sm" id="select_dir">
                                                    <%
                                                        for (int c = 0; c < Listar_Direccion.size(); c++) {
                                                            Direccion dir = new Direccion();
                                                            dir = (Direccion) Listar_Direccion.get(c);
                                                            if (a.getId_direccion() != null) {
                                                                if (a.getId_direccion().trim().equals(dir.getId_direccion().trim())) {
                                                    %>
                                                    <option value="<%=dir.getId_direccion()%>" selected=""><%=dir.getNo_direccion()%></option>
                                                    <%} else {%>
                                                    <option value="<%=dir.getId_direccion()%>"><%=dir.getNo_direccion()%></option> 
                                                    <%}
                                                    } else {%>
                                                    <%}
                                                        }%>
                                                </select>  </label>
                                        </section>
                                        <section class="sec_dep col col-3" id="titulo">
                                            <label class="select" id="titulo">Departamento:
                                                <select name="DEPARTAMENTO_ID" <%=disabledEdit%> class="selec_dep input-group-sm"  id="selec_dep">
                                                    <option value="">[Seleccione]</option>
                                                </select>  </label>
                                        </section>
                                        <section class="sec_are col col-3" id="titulo">
                                            <label class="select" id="titulo">Area:
                                                <select name="AREA_ID" <%=disabledEdit%> class="Selec_Area input-group-sm" id="Selec_Area">
                                                    <option value="">[Seleccione]</option>
                                                </select>  
                                            </label>
                                        </section>
                                        <section class="sec_sec col col-3" id="titulo">
                                            <label class="select" id="titulo">Sección:
                                                <select name="SECCION_ID" <%=disabledEdit%> class="select_sec input-group-sm" id="select_sec">
                                                    <option value="">[Seleccione]</option>
                                                </select>  </label>
                                        </section>
                                        <section class="col col-3" id="titulo">
                                            <label class="select" id="titulo">Puesto:
                                                <select name="PUESTO_ID" required="" <%=disabledEdit%> class="pu_id_se input-group-sm" id="pu_id_se">
                                                    <option value="" selected="selected"></option>
                                                    <option value=""></option>
                                                </select>  </label>
                                        </section>
                                        <input name="DEPARTAMENTO_ID"  type="hidden" value="<%=a.getId_departamento()%>" />
                                        <input name="AREA_ID"  type="hidden" value="<%=a.getId_area()%>" />
                                        <input name="SECCION_ID"  type="hidden" value="<%=a.getId_seccion()%>" />
                                        <input name="PUESTO_ID"  type="hidden" value="<%=a.getId_puesto()%>" />
                                        <input name="DIRECCION"  type="hidden" value="<%=a.getId_direccion()%>" />
                                        <section class="col col-3">
                                            <label class="select" id="titulo">Condición:
                                                <select name="CONDICION" class="input-group-sm" required="">
                                                    <%if (a.getLi_condicion() != null) {%>
                                                    <option value="1" <%if (a.getLi_condicion().trim().equals("1")) {%>selected=""<% }%>>Contratado</option>
                                                    <option value="2" <%if (a.getLi_condicion().trim().equals("2")) {%>selected=""<%}%>>Contratado Independiente</option>
                                                    <option value="3" <%if (a.getLi_condicion().trim().equals("3")) {%>selected=""<%}%>> Enpleado</option>
                                                    <option value="4" <%if (a.getLi_condicion().trim().equals("4")) {%>selected=""<%}%>>Misionero</option>
                                                    <option value="5" <%if (a.getLi_condicion().trim().equals("5")) {%>selected=""<%}%>>Práctica Profesional</option>
                                                    <option value="6" <%if (a.getLi_condicion().trim().equals("6")) {%>selected=""<%}%>>Práctica Pre Profesionales</option>
                                                    <option value="7" <%if (a.getLi_condicion().trim().equals("7")) {%>selected=""<%}%>>Convenio Laboral Juvenil</option>
                                                    <option value="8" <%if (a.getLi_condicion().trim().equals("8")) {%>selected=""<%}%>>MFL-Contrato</option>
                                                    <%} else {%>
                                                    <option value="">[Seleccione]</option>
                                                    <option value="1">Contratado</option>
                                                    <option value="2">Contratado Independiente</option>
                                                    <option value="3">Enpleado</option>
                                                    <option value="4">Misionero</option>
                                                    <option value="5">Práctica Profesional</option>
                                                    <option value="6">Práctica Pre Profesionales</option>
                                                    <option value="7">Convenio Laboral Juvenil</option>
                                                    <option value="8">MFL-Contrato</option>
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section>
                                    </div>
                                    <div class="row">
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Remuneración:
                                                <input type="text" name="SUELDO" value="<%=a.getCa_sueldo()%>" class="input-group-sm" id="remu" <%if (a.getId_dgp() == null) {
                                                    } else {%>readonly=""<%}%>>
                                            </label>
                                        </section>
                                        <section class="col col-1">
                                            <label class="input" id="titulo">Reintegro:
                                                <input type="text" name="REINTEGRO" value="<%=a.getCa_reintegro()%>" class="input-group-sm" id="rein" <%if (a.getId_dgp() == null) {
                                                    } else {%>readonly=""<%}%> >
                                            </label>
                                        </section>
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Bono Alimentario:
                                                <input type="text" name="BONO_ALIMENTO" value="<%=a.getCa_bono_alimento()%>" class="input-group-sm" id="bo_a" <%if (a.getId_dgp() == null) {
                                                    } else {%>readonly=""<%}%>>
                                            </label>
                                        </section>
                                        <section class="col col-1">
                                            <label class="input" id="titulo">BEV:
                                                <input type="text" name="BEV" value="<%=a.getCa_bev()%>" class="input-group-sm" id="bev" <%if (a.getId_dgp() == null) {
                                                    } else {%>readonly=""<%}%>>
                                            </label>
                                        </section>
                                        <section class="col col-1">
                                            <label class="input" id="titulo">Bono puesto:
                                                <input type="text" name="ca_bono_puesto" value="<%=a.getCa_bonificacion_p()%>" class="input-group-sm" required="" id="ca_bono_pu" <%if (a.getId_dgp() == null) {
                                                    } else {%>readonly=""<%}%>>
                                            </label>
                                        </section>
                                        <section class="col col-2" >
                                            <label class="input" id="titulo">Asignanción Familiar:
                                                <input type="text" name="ASIG_FAMILIAR" value="<%=a.getCa_asig_familiar()%>"  class="input-group-sm" id="asig" <%if (a.getId_dgp() == null) {
                                                    } else {%>readonly=""<%}%>>
                                            </label>
                                        </section>
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Sueldo Total:
                                                <input type="text" name="TOTAL_SUELDO" value="<%=a.getCa_sueldo_total()%>" class="input-group-sm" id="su_t" <%if (a.getId_dgp() == null) {
                                                    } else {%>readonly=""<%}%>>
                                            </label>
                                        </section>
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Tipo Horas Pago:
                                                <input type="text" name="TIPO_HORA_PAGO" value="<%if (a.getTi_hora_pago() == null) {
                                                        out.print("0");
                                                    } else {
                                                        out.print(a.getTi_hora_pago());
                                                    }%>" class="input-group-sm" <%if (a.getId_dgp() == null) {
                                                        } else {%>readonly=""<%}%>>
                                            </label>
                                        </section>

                                    </div>

                                </fieldset>
                                <fieldset >
                                    <%if (Integer.parseInt(request.getParameter("num_cc")) == 0) {%>
                                    <div class="row" >
                                        <section class="col col-1">
                                            <br>
                                            <label  id="titu">Agregar:</label>
                                            <br>
                                            <label class="btn">
                                                <!--<button type="button" class="btn btn-default btn-agregar-cc" id="btn-agregar-cc" >Agregar</button>-->
                                                <a type="button" style="padding:9%; padding-right:20%; padding-left:20%;" id="btn-agregar-cc" class=" btn btn-default txt-color-green btn-agregar-cc"><i class="fa fa-plus fa-2x"></i></a>
                                            </label>
                                            <label class="input" id="titulo">%:<input type="text" name="PORCENTAJE_TOTAL" max="100" min="100" maxlength="3" value="" class="input-group-sm por_sum_to" id="bo_a" readonly=""></label>
                                        </section>
                                    </div>
                                    <%}%>
                                    <section  id="centros-costos-relleno"></section> 
                                </fieldset>
                                <fieldset>
                                    <div class="row">
                                        <section class="col col-2">
                                            <label class="select" id="titulo">Situación Especial:
                                                <select name="situacionEspecial" class="input-group-sm situacionEspecial" data-valor="<%=a.getIdSituacionEspecial()%>">
                                                    <option value="">[Seleccione]</option>

                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Regimen Laboral Mintra:
                                                <select name="REG_LAB_MINTRA" class="input-group-sm" required="">
                                                    <option value="">[Seleccione]</option> 
                                                    <%for (int d = 0; d < list_reg_labo.size(); d++) {
                                                            Regimen_Laboral re = new Regimen_Laboral();
                                                            re = (Regimen_Laboral) list_reg_labo.get(d);
                                                            if (a.getId_regimen_laboral() != null) {
                                                                if (a.getId_regimen_laboral().trim().equals(re.getId_regimen_laboral().trim())) {
                                                    %>
                                                    <option value="<%=re.getId_regimen_laboral()%>" selected=""><%=re.getDe_regimen_l()%></option>
                                                    <%} else {%>
                                                    <option value="<%=re.getId_regimen_laboral()%>"><%=re.getDe_regimen_l()%></option>
                                                    <%}
                                                    } else {%>
                                                    <option value="<%=re.getId_regimen_laboral()%>"><%=re.getDe_regimen_l()%></option>
                                                    <%}
                                                        }%>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-2">
                                            <label class="select" id="titulo">Modalidad:
                                                <select name="MODALIDAD" class="input-group-sm select_mod" id="select_mod" required="">
                                                    <option value="">[Seleccione]</option>
                                                    <%for (int l = 0; l < List_modalidad.size(); l++) {
                                                            Modalidad mo = new Modalidad();
                                                            mo = (Modalidad) List_modalidad.get(l);
                                                            if (request.getParameter("id_mod") != null) {
                                                                if (request.getParameter("id_mod").trim().equals(mo.getId_modalidad().trim())) {
                                                    %>
                                                    <option value="<%=mo.getId_modalidad()%>" selected=""><%=mo.getDe_modalidad()%></option>
                                                    <%} else {%>
                                                    <option value="<%=mo.getId_modalidad()%>" ><%=mo.getDe_modalidad()%></option>
                                                    <%}
                                                    } else {%>
                                                    <option value="<%=mo.getId_modalidad()%>"><%=mo.getDe_modalidad()%></option>
                                                    <%}
                                                        }%>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">SUB-Modalidad:
                                                <select name="SUB_MODALIDAD" class="input-group-sm" id="select-sub-mod" required="">
                                                    <option value="">[Seleccione]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Tipo Contratación:
                                                <select name="REG_LAB_MINTRA" class="input-group-sm" >
                                                    <option value="">[Seleccione]</option>
                                                    <option value="I">INICIO</option>
                                                    <option value="R">RENOVACION</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Codigo Grupo de Ocupaciones:
                                                <select name="CO_GRUPO_OCU" class="input-group-sm" required="">
                                                    <option value="">[Seleccione]</option>
                                                    <%for (int gr = 0; gr < List_grup_ocu.size(); gr++) {
                                                            Grupo_Ocupaciones g = new Grupo_Ocupaciones();
                                                            g = (Grupo_Ocupaciones) List_grup_ocu.get(gr);
                                                            if (a.getId_grupo_ocupacion() != null) {
                                                                if (a.getId_grupo_ocupacion().trim().equals(g.getId_grupo_ocupacion().trim())) {
                                                    %>    
                                                    <option value="<%=g.getId_grupo_ocupacion()%>" selected=""><%=g.getDe_grupo_ocupacion()%></option>
                                                    <%} else {%>
                                                    <option value="<%=g.getId_grupo_ocupacion()%>"><%=g.getDe_grupo_ocupacion()%></option>
                                                    <%}
                                                    } else {%>
                                                    <option value="<%=g.getId_grupo_ocupacion()%>"><%=g.getDe_grupo_ocupacion()%></option>
                                                    <%}
                                                        }%>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="input" id="titulo">Fecha de Suscripción: 
                                                <%if (a.getFe_suscripcion() != null) {%>
                                                <input id="suscripcion" type="date" name="FECHA_SUSCRIPCION"  class="input-group-sm"  value="<%=DateFormat.toFormat3(a.getFe_suscripcion())%>">
                                                <%} else {%>
                                                <input id="suscripcion" type="date" name="FECHA_SUSCRIPCION"  class="input-group-sm"  value="">
                                                <%}%>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Tipo de Moneda:
                                                <select name="TIPO_MONEDA" class="input-group-sm" required="">
                                                    <%if (a.getCo_ti_moneda() != null) {%>
                                                    <option value="">[Seleccione]</option>
                                                    <option value="01" <%if (a.getCo_ti_moneda().trim().equals("01")) {%> selected=""<%}%> >SOLES</option>
                                                    <option value="02" <%if (a.getCo_ti_moneda().trim().equals("02")) {%> selected=""<%}%>>DOLARES</option>
                                                    <option value="03" <%if (a.getCo_ti_moneda().trim().equals("03")) {%> selected=""<%}%>>EUROS</option>
                                                    <%} else {%>
                                                    <option value="">[Seleccione]</option>
                                                    <option value="01" selected="">SOLES</option>
                                                    <option value="02">DOLARES</option>
                                                    <option value="03">EUROS</option>
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Tipo Remuneracion Variable:
                                                <select name="REM_VARIABLE" class="input-group-sm" required="">
                                                    <%if (a.getCo_ti_rem_variab() != null) {%>
                                                    <option value=""  >[Seleccione]</option>
                                                    <option value="1" <%if (a.getCo_ti_rem_variab().trim().equals("1")) {%> selected=""<%}%> >DESTAJO</option>
                                                    <option value="2" <%if (a.getCo_ti_rem_variab().trim().equals("2")) {%> selected=""<%}%> >COMISIONES</option>
                                                    <option value="3" <%if (a.getCo_ti_rem_variab().trim().equals("3")) {%> selected=""<%}%> >NINGUNO</option>
                                                    <%} else {%>
                                                    <option value="">[Seleccione]</option>
                                                    <option value="1">DESTAJO</option>
                                                    <option value="2">COMISIONES</option>
                                                    <option value="3">NINGUNO</option>
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Remuneración en Especie:
                                                <select name="REM_ESPECIE" class="input-group-sm" required="">
                                                    <option value="">[Seleccione]</option>
                                                    <%if (a.getDe_remu_especie() != null) {%>
                                                    <option value="1" <%if (a.getDe_remu_especie().trim().equals("1")) {%> selected=""<%}%> >SI</option>
                                                    <option value="0" <%if (a.getDe_remu_especie().trim().equals("0")) {%> selected=""<%}%> >NO</option>
                                                    <%} else {%>
                                                    <option value="1">SI</option>
                                                    <option value="0">NO</option>
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section>

                                    </div>
                                </fieldset>
                                <fieldset id="fila-agregar">
                                </fieldset>
                              
                                                
                                                <fieldset>
                                    <legend >Horario</legend>
                                    <div class="row" >
                                        <section class="col col-3">
                                            <label class="input" id="titulo">Semanal:
                                                <input type="text" name="HORAS_SEMANA" value="48" class="input-group-sm" required="">
                                            </label>
                                        </section>
                                        <section class="col col-3">
                                            <label class="input" id="titulo">Mensual:
                                                <input type="text" name="NRO_HORAS_LAB" value="192" class="input-group-sm" required="">
                                            </label>
                                        </section>
                                        <section class="col col-3">
                                            <label class="input" id="titulo">Dias:
                                                <input type="text" name="DIAS" value="30" class="input-group-sm" required="">
                                            </label>
                                        </section>
                                        <section class="col col-3">
                                            ver horario
                                        </section>
                                    </div>
                                </fieldset>

                                <fieldset>
                                    <div class="row">
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Tipo Trabajador.
                                                <select name="TIPO_TRABAJADOR" class="input-group-sm" required="">
                                                    <option value="">[Seleccione]</option>
                                                    <%if (a.getTi_trabajador() != null) {%>
                                                    <option value="1" <%if (a.getTi_trabajador().trim().equals("1")) {%> selected=""<%}%> >Empleado</option>
                                                    <option value="2" <%if (a.getTi_trabajador().trim().equals("2")) {%> selected=""<%}%> >Obrero</option>
                                                    <%} else {%>
                                                    <option value="1" selected>Empleado</option>
                                                    <option value="2">Obrero</option>
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Regimen Laboral: 
                                                <select name="REGIMEN_LABORAL" class="input-group-sm" required="">
                                                    <option value="">[Seleccione]</option>
                                                    <%if (a.getLi_regimen_laboral() != null) {%>
                                                    <option value="1" <%if (a.getLi_regimen_laboral().trim().equals("1")) {%> selected=""<%}%> >Privado</option>
                                                    <option value="2" <%if (a.getLi_regimen_laboral().trim().equals("2")) {%> selected=""<%}%> >Público</option>
                                                    <%} else {%>
                                                    <option value="1">Privado</option>
                                                    <option value="2" selected="">Público</option>
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo"> Discapacidad:
                                                <select name="DISCAPACIDAD" class="input-group-sm" required="">
                                                    <option value="">[SLECCIONE]</option>
                                                    <%if (a.getEs_discapacidad() != null) {%>
                                                    <option value="1" <%if (a.getEs_discapacidad().trim().equals("1")) {%> selected=""<%}%> >No</option>
                                                    <option value="2" <%if (a.getEs_discapacidad().trim().equals("2")) {%> selected=""<%}%> >Si</option>
                                                    <%} else {%>
                                                    <option value="1" selected>No</option>
                                                    <option value="2">Si</option>
                                                    <%}%>

                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Regimen Pensionario:
                                                <select name="REGIMEN_PENSIONARIO" class="input-group-sm">
                                                    <option value="">[Seleccione]</option>
                                                    <%if (a.getLi_regimen_pensionario() != null) {%>
                                                    <option value="1" <%if (a.getLi_regimen_pensionario().trim().equals("1")) {%> selected=""<%}%>>Privado</option>
                                                    <option value="2" <%if (a.getLi_regimen_pensionario().trim().equals("2")) {%> selected=""<%}%>>SNP</option>
                                                    <%} else {%>
                                                    <option value="1" selected>Privado</option>
                                                    <option value="2">SNP</option>
                                                    <%}%>

                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Tipo Contrato:
                                                <select name="TIPO_CONTRATO" class="input-group-sm ti_contrato" required="">
                                                    <option value="">[Seleccione]</option>

                                                </select>
                                                <input type="hidden" class="id_ti_contrato" value="<%=a.getTi_contrato()%>" />
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Tipo Convenio:
                                                <select name="TIPO_CONVENIO" class="input-group-sm" >
                                                    <option value="">[Seleccione]</option>
                                                    <%if (a.getLi_tipo_convenio() != null) {%>
                                                    <option value="1" <%if (a.getLi_tipo_convenio().trim().equals("1")) {%> selected=""<%}%> >CLJ</option>
                                                    <option value="2" <%if (a.getLi_tipo_convenio().trim().equals("2")) {%> selected=""<%}%>>PPP</option>
                                                    <option value="3" <%if (a.getLi_tipo_convenio().trim().equals("3")) {%> selected=""<%}%>>PP</option>
                                                    <%} else {%>
                                                    <option value="1">CLJ</option>
                                                    <option value="2">PPP</option>
                                                    <option value="3">PP</option>
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <section>
                                        <label class="label" id="titulo">Observación:  </label>
                                        <label class="textarea">
                                            <textarea rows="3"  name="OBSERVACION" cols="35" rows="6" value="<%=a.getDe_observacion()%>" ></textarea>
                                        </label>
                                    </section>
                                </fieldset>
                                <fieldset>
                                    <div class="row">
                                        <!--<section class="col col-4">
                                            <label class="select" id="titulo">Situación Actual:
                                                <select name="ESTADO_CONTRATO" class="input-group-sm" required="">
                                                    <option value="">[Seleccione]</option>
                                                    <option value="1" selected="" >Activo</option>
                                                    <option value="2">Término de Contrato</option>
                                                    <option value="3">Renuncia Voluntaria</option>
                                                    <option value="4">Traslado a otra Filial/Institucion</option>
                                                    <option value="5">No Inicio Relación Laboral</option>
                                                    <option value="6">Cambio de Modalidad Contractual</option>
                                                    <option value="7">Abandono de Trabajo</option>
                                                </select>
                                            </label>
                                        </section>-->
                                        <section class="col col-3">
                                            <label class="select" id="titulo">Filial donde Trabaja:
                                                <select name="FILIAL" class="input-group-sm" required="">
                                                    <option value="">[Seleccione]</option>
                                                    <%if (a.getId_filial() != null) {%>
                                                    <option value="1" <%if (a.getId_filial().trim().equals("1")) {%> selected=""<%}%>>Lima</option>
                                                    <option value="2" <%if (a.getId_filial().trim().equals("2")) {%> selected=""<%}%>>Juliaca</option>
                                                    <option value="3" <%if (a.getId_filial().trim().equals("3")) {%> selected=""<%}%>>Tarapoto</option>
                                                    <%} else {%>
                                                    <option value="1" selected >Lima</option>
                                                    <option value="2">Juliaca</option>
                                                    <option value="3">Tarapoto</option>
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section>
                                        <!--<section class="col col-4">
                                            <label class="input" id="titulo">Fecha Cese: 
                                                <input type="date" name="FEC_CESE"  class="input-group-sm" required="">
                                            </label>
                                        </section>-->
                                        <section class="col col-3">
                                            <label class="input" id="titulo">RUC UPEU:
                                                <input type="text" name="EMP_RUC" value="20138122256" maxlength="20" class="input-group-sm" required="">
                                            </label>
                                        </section>
                                        <section class="col col-3">
                                            <label class="input" id="titulo">Cod. Sucursal:
                                                <input type="text" name="SUCURSAL" value="-1" maxlength="3" class="input-group-sm" required="">
                                            </label>
                                        </section>
                                        <section class="col col-3">
                                            <label class="input" id="titulo">MYPE:
                                                <input type="text" name="MYPE" value="N"  maxlength="2" class="input-group-sm" required="">
                                            </label>
                                        </section>
                                        <section class="col col-3">
                                            <label class="select" id="titulo" style="color:red">Plantilla de Contrato:
                                                <select name="id_plantilla_contractual" class="con_pl_pu input-group-sm" >
                                                    <option value="">[Seleccione]</option>
                                                </select>
                                            </label>
                                        </section>
                                    </div>
                                    <input type="hidden" name="ENTREGAR_DOC_REGLAMENTOS"  value="0" class="text-box" >
                                    <input type="hidden" name="REGISTRO_HUELLA"  value="0" class="text-box" > 
                                    <input type="hidden" name="REGISTRO_SISTEM_REMU" value="0" class="text-box" >
                                    <input type="hidden" name="ESTADO" value="1" class="text-box" > 
                                    <input type="hidden" value="<%=a.getId_trabajador()%>" name="IDDATOS_TRABAJADOR" class="text-box" >

                                </fieldset>
                                <input type="hidden" name="id_contrato" value="<%=a.getId_contrato()%>" class="id_contrato">
                                <input type="hidden" name="cant_actual_anti" class="can_centro_cos" value="<%=request.getParameter("num_cc")%>">
                                <input type="hidden" name="cant_inicial" class="conteo" value="<%=request.getParameter("num_cc")%>">
                                <input type="hidden" name="cant_eliminada" class="cant-elimi" value="0">
                                <input type="hidden" name="cant_ingresada" class="cant-ing" value="0">
                                <input type="hidden" value="<%=a.getId_departamento()%>" class="dep_pu">
                                <input type="hidden" value="<%=a.getId_area()%>" class="area_pu">
                                <input type="hidden" value="<%=a.getId_direccion()%>" class="dir_pu">
                                <input type="hidden" value="<%=a.getId_seccion()%>" class="sec_pu">
                                <input type="hidden" value="<%=a.getId_puesto()%>" class="id_pu_dgp">
                                <input type="hidden" value="<%=request.getParameter("id_mod")%>" class="id_mod_con">
                                <input type="hidden" value="<%=a.getId_sub_modalidad()%>" class="id_sub_mod">
                                <input type="hidden" value="<%=a.getId_plantilla_contractual()%>" class="id_pl_con">
                                <footer>

                                    <input type="hidden" name="opc"   value="MODIFICAR CONTRATO">
                                    <button type="button" class="btn btn-primary pull-left" onclick="window.history.back()"><i class="fa fa-backward"></i>&nbsp;&nbsp;Regresar</button>
                                    <button type="submit"  class="btn btn-primary btnModificarContrato" >
                                        Modificar Contrato
                                    </button>
                                    <!--<a type="button" class="btn btn-success" href="../../horario?iddgp=&opc=Listar">Ver Horario</a>
                                    <a type="button" class="btn btn-success" href="../../documento?iddgp=&idtr=&opc=Ver_Documento">Ver Documentos</a>-->
                                </footer>

                            </form>
                            <%}%>
                            <table>
                                <tbody class="tbodys">
                                </tbody>
                            </table>
                        </div>
                        <!-- end widget content -->

                    </div>
                    <!-- end widget div -->

                </div>
            </div>

        </div>

        <!--================================================== -->


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

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>
        <!-- JQUERY SELECT2 INPUT -->
        <script src="../../js/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider -->

        <!-- browser msie issue fix -->

        <!-- FastClick: For mobile devices -->
        <script src="../../js/plugin/fastclick/fastclick.min.js"></script>
        <script type="text/javascript"  src="../../js/plugin/knob/jquery.knob.min.js"></script>
        <script type="text/javascript"  src="../../js/plugin/jquery-form/jquery-form.min.js"></script>

        <!--[if IE 8]>

        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

        <![endif]-->

        <!-- Demo purpose only 
        <script src="../../js/demo.min.js"></script>-->

        <!-- MAIN APP JS FILE -->
        <script src="../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->

        <!-- PAGE RELATED PLUGIN(S) -->
        <script type="text/javascript"  src="../../js/plugin/knob/jquery.knob.min.js"></script>
        <script type="text/javascript"  src="../../js/plugin/jquery-form/jquery-form.min.js"></script>
        <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>

        <!--BUSINESS LOGIC PLUGINS-->        
        <script type="text/javascript" src="../../js/Js_Formulario/Js_Form.js?v=<%=globalProperties.VERSION_JS%>"></script>
        <script type="text/javascript" src="../../js/businessLogic/CentroCosto/Js_centro_costo.js?v=<%=globalProperties.VERSION_JS%>" ></script>
        <script type="text/javascript" src="../../js/businessLogic/Contrato/editContrato.js?v=<%=globalProperties.VERSION_JS%>" ></script>

    </body>

</html>
