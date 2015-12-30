<%@page import="pe.edu.upeu.application.web.controller.CConversion"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.Grupo_Ocupaciones"%>
<%@page import="pe.edu.upeu.application.model.Direccion"%>
<%@page import="pe.edu.upeu.application.model.Centro_Costos"%>
<%@page import="pe.edu.upeu.application.model.Regimen_Laboral"%>
<%@page import="pe.edu.upeu.application.model.Modalidad"%>
<%@page import="pe.edu.upeu.application.model.V_Det_DGP"%>
<%@page import="oracle.net.aso.p"%>
<%@page import="pe.edu.upeu.application.model.X_List_id_dgp"%>
<%@page import="pe.edu.upeu.application.model.Puesto"%>
<%@page import="pe.edu.upeu.application.model.DGP"%>
<%@page import="pe.edu.upeu.application.model.Anno"%>

<jsp:useBean id="List_Anno" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Direccion" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="LIST_ID_DGP" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="ASIGNACION_F" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_anno_max" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_modalidad" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_reg_labo" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_centro_costo" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_grup_ocu" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_dgp" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title>Registrar Contrato</title>

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
        <% HttpSession sesion_1 = request.getSession(true);
            String id_rol = (String) session.getAttribute("IDROL");%>
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
                <section id="widget-grid" class="">
                    <div class="row">
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

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

                                        <%CConversion c = new CConversion();
                                            for (int u = 0; u < LIST_ID_DGP.size(); u++) {
                                                V_Det_DGP d = new V_Det_DGP();
                                                d = (V_Det_DGP) LIST_ID_DGP.get(u);

                                                if (d.getId_dgp() == null) {
                                        %>


                                        <%} else {%>

                                        <form action="../../contrato" id="checkout-form" class="smart-form"  method="POST" novalidate="novalidate">
                                            <fieldset>
                                                <div class="row">
                                                    <section class="col col-3">
                                                        <label class="select" id="titulo">Motivo :
                                                            <select disabled=""  class="input-group-sm">
                                                                <%if (d.getLi_motivo() != null) {%>
                                                                <%if (d.getLi_motivo().trim().equals("1")) {%>
                                                                <option  selected="selected">Trabajador Nuevo</option>   
                                                                <option  >renovación</option>   
                                                                <%} else {%>
                                                                <option >Trabajador Nuevo</option>   
                                                                <option selected="selected">renovación</option>   
                                                                <%}%>
                                                                <%} else {%>
                                                                <option selected="">NINGUNO</option>
                                                                <%}%>
                                                            </select>  
                                                        </label>
                                                    </section >
                                                    <section class="col col-3" >
                                                        <label id="titulo" >MFL:</label>
                                                        <label class="toggle"  > 
                                                            <%if (d.getEs_mfl().trim().equals("1")) {%>
                                                            <input type="checkbox" name="checkbox-toggle" disabled="" checked="" >
                                                            <%} else {%>
                                                            <input type="checkbox" name="checkbox-toggle" disabled=""  >
                                                            <%}%>
                                                            <i data-swchoff-text="NO"  data-swchon-text="SI"></i>       

                                                        </label>
                                                    </section>
                                                    <section class="col col-3" >
                                                        <div class="div_input_diezmo">
                                                        </div>
                                                    </section>

                                                </div>
                                                <div class="row" >
                                                    <input type="hidden" name="id_rol_ses" id="id_rol_s" value="<%=id_rol%>">
                                                    <input type="hidden" name="TIPO_PLANILLA"  value="<%=d.getId_tipo_planilla()%>">
                                                    <input type="hidden" name="HORARIO"  value="<%=d.getId_detalle_horario()%>">
                                                    <input type="hidden" value="ANN-000004" name="AÑO_ID" />
                                                    <input type="hidden" name="IDDETALLE_DGP" value="<%=d.getId_dgp()%>" class="text-box" id="id_dgp" >                              
                                                    <input type="hidden"  value="<%=d.getId_trabajador()%>" class="idtr">                              
                                                    <section class="col col-3">
                                                        <label class="input" id="titulo">Fecha de Inicio: 
                                                            <input type="date" name="FEC_DESDE" value="<%=c.convertFecha3(d.getFe_desde())%>" class=" input-group-sm" required="">
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="input" id="titulo">Fecha de Cese: 
                                                            <input type="date" name="FEC_HASTA" value="<%=c.convertFecha3(d.getFe_hasta())%>" class="input-group-sm" required="">
                                                        </label>
                                                    </section>
                                                    <section class="col col-3" id="titulo">
                                                        <label class="select" id="titulo">Dirección:
                                                            <select name="DIRECCION" class="select_dir input-group-sm" disabled=""  id="select_dir" >
                                                                <option value="" >[SELECCIONE]</option>
                                                                <%for (int g = 0; g < Listar_Direccion.size(); g++) {
                                                                        Direccion di = new Direccion();
                                                                        di = (Direccion) Listar_Direccion.get(g);
                                                                        String id_direc = request.getParameter("id_direc");
                                                                        if (id_direc.trim().equals(di.getId_direccion().trim())) {
                                                                %>
                                                                <option value="<%=di.getId_direccion()%>" selected=""><%=di.getNo_direccion()%></option>
                                                                <%} else {%>
                                                                <option value="<%=di.getId_direccion()%>"><%=di.getNo_direccion()%></option>
                                                                <%}
                                                                    }%>
                                                            </select>  </label>
                                                    </section>
                                                    <section class="sec_dep col col-3" id="titulo">
                                                        <label class="select" id="titulo">Departamento:
                                                            <select name="DEPARTAMENTO_ID" class="selec_dep input-group-sm" disabled="" id="selec_dep">
                                                                <option value="">[SELECCIONE]</option>
                                                            </select>  
                                                        </label>
                                                    </section>
                                                    <section class="sec_are col col-3" id="titulo">
                                                        <label class="select" id="titulo">Area:
                                                            <select name="AREA_ID" class="Selec_Area input-group-sm"  disabled=""  id="Selec_Area">
                                                                <option value="">[SELECCIONE]</option>
                                                            </select>  </label>
                                                    </section>
                                                    <section class="sec_sec col col-3" id="titulo">
                                                        <label class="select" id="titulo">Sección:
                                                            <select name="SECCION_ID" class="select_sec input-group-sm" disabled=""  id="select_sec">
                                                                <option value="">[SELECCIONE]</option>
                                                            </select>  </label>
                                                    </section>
                                                    <section class="col col-3" id="titulo">
                                                        <label class="select" id="titulo">Puesto:
                                                            <select name="PUESTO_ID" required="" class="pu_id_se input-group-sm" disabled=""  id="pu_id_se">
                                                                <%  for (int j = 0; j < List_Puesto.size(); j++) {%>
                                                                <%Puesto p = new Puesto();
                                                                    p = (Puesto) List_Puesto.get(j);
                                                                    if (d.getId_puesto().equals(p.getId_puesto())) {%>

                                                                <option value="<%=p.getId_puesto()%>" selected="selected"><%=p.getNo_puesto()%></option>
                                                                <%} else {%>
                                                                <option value="<%=p.getId_puesto()%>"><%=p.getNo_puesto()%></option>

                                                                <%}
                                                                    }%>
                                                            </select>  </label>
                                                    </section>
                                                    <input name="DEPARTAMENTO_ID"  type="hidden" value="<%=d.getId_departamento()%>" />
                                                    <input name="AREA_ID"  type="hidden" value="<%=d.getId_area()%>" />
                                                    <input name="SECCION_ID"  type="hidden" value="<%=d.getId_seccion()%>" />
                                                    <input name="PUESTO_ID"  type="hidden" value="<%=d.getId_puesto()%>" />
                                                    <input name="DIRECCION"  type="hidden" value="<%=d.getId_direccion()%>" />
                                                    <section class="col col-3">
                                                        <label class="select" id="titulo">Condición:
                                                            <select name="CONDICION" class="input-group-sm" >
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="1">Contratado</option>
                                                                <option value="2">Contratado Independiente</option>
                                                                <option value="3">Enpleado</option>
                                                                <option value="4">Misionero</option>
                                                                <!--   <option value="5">MFL-Práctica Pre-Profesional</option>
                                                                   <option value="6">MFL-Práctica Profesionales</option>
                                                                   <option value="7">MFL-CLJ</option>
                                                                   <option value="8">MFL-Contrato</option>-->
                                                            </select>
                                                        </label>
                                                    </section>

                                                </div>

                                                <div class="row">

                                                    <section class="col col-3">
                                                        <label class="input" id="titulo">Remuneración:
                                                            <input type="text" name="SUELDO" value="<%=d.getCa_sueldo()%>" class="input-group-sm" id="remu" readonly="">
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="input" id="titulo">Reintegro:
                                                            <input type="text" name="REINTEGRO" value="0" class="input-group-sm" id="rein" readonly="">
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="input" id="titulo">Bono Alim.:
                                                            <input type="text" name="BONO_ALIMENTO" value="<%=d.getCa_bono_alimentario()%>" class="input-group-sm" id="bo_a" readonly="">
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="input" id="titulo">BEV:
                                                            <input type="text" name="BEV" value="<%=d.getDe_bev()%>" class="input-group-sm" id="bev" readonly="">
                                                        </label>
                                                    </section>
                                                </div>
                                                <div class="row">
                                                    <section class="col col-3">
                                                        <label class="input" id="titulo">Bono puesto:
                                                            <input type="text" name="ca_bono_puesto" value="<%=d.getCa_bonificacion_p()%>" class="input-group-sm" required="" id="ca_bono_pu" readonly="">
                                                        </label>
                                                    </section>
                                                    <%int val_asigf = Integer.parseInt(request.getParameter("num"));%>
                                                    <section class="col col-3" >
                                                        <label class="input" id="titulo">Asig. Familiar:
                                                            <input type="text" name="ASIG_FAMILIAR"  value="<%=d.getCa_asig_familiar()%>" class="input-group-sm" id="asig" readonly="">
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="input" id="titulo">Sueldo Total:
                                                            <input type="text" name="TOTAL_SUELDO" value="<%=d.getCa_bono_alimentario() + d.getCa_sueldo() + d.getCa_asig_familiar() + d.getDe_bev() + d.getCa_bonificacion_p()%>" class="input-group-sm" id="su_t" readonly="">
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="input" id="titulo">Tipo Horas Pago:
                                                            <input type="text" name="TIPO_HORA_PAGO" value="0" class="input-group-sm" readonly="">
                                                        </label>
                                                    </section>

                                                </div>
                                                <div class="row" id="fila-agregar">

                                                </div>

                                            </fieldset>

                                            <fieldset>
                                                <div class="row">
                                                    <section class="col col-3">
                                                        <label class="select" id="titulo">Regimen Laboral Mintra:
                                                            <select name="REG_LAB_MINTRA" class="input-group-sm" required="">
                                                                <option value="">[SELECCIONE]</option>
                                                                <%for (int q = 0; q < list_reg_labo.size(); q++) {
                                                                        Regimen_Laboral re = new Regimen_Laboral();
                                                                        re = (Regimen_Laboral) list_reg_labo.get(q);
                                                                %>
                                                                <option value="<%=re.getId_regimen_laboral()%>"><%=re.getDe_regimen_l()%></option>
                                                                <%}%>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="select" id="titulo">Modalidad:
                                                            <select name="MODALIDAD" class="input-group-sm" id="select_mod" required="">
                                                                <option value="">[SELECCIONE]</option>
                                                                <%for (int l = 0; l < List_modalidad.size(); l++) {
                                                                        Modalidad mo = new Modalidad();
                                                                        mo = (Modalidad) List_modalidad.get(l);

                                                                %>
                                                                <option value="<%=mo.getId_modalidad()%>"><%=mo.getDe_modalidad()%></option>
                                                                <%}%>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="select" id="titulo">SUB-Modalidad:
                                                            <select name="SUB_MODALIDAD" class="input-group-sm" id="select-sub-mod" required="">
                                                                <option value="">[SELECCIONE]</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="select" id="titulo">Tipo Contratación:
                                                            <select name="REG_LAB_MINTRA" class="input-group-sm" >
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="I">INICIO</option>
                                                                <option value="R">RENOVACION</option>
                                                            </select>
                                                        </label>
                                                    </section>


                                                </div>
                                                <div class="row">
                                                    <section class="col col-3">
                                                        <label class="select" id="titulo">Cod. Grupo de Ocupaciones:
                                                            <select name="CO_GRUPO_OCU" class="input-group-sm" required="">
                                                                <option value="">[SELECCIONE]</option>
                                                                <%for (int gr = 0; gr < List_grup_ocu.size(); gr++) {
                                                                        Grupo_Ocupaciones g = new Grupo_Ocupaciones();
                                                                        g = (Grupo_Ocupaciones) List_grup_ocu.get(gr);
                                                                %>
                                                                <option value="<%=g.getId_grupo_ocupacion()%>"><%=g.getDe_grupo_ocupacion()%></option>
                                                                <%}%>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <%String Fecha = request.getParameter("fe_subs");%>
                                                        <label class="input" id="titulo">Fecha de Suscripción: 
                                                            <input id="suscripcion" type="date" name="FECHA_SUSCRIPCION"  class="input-group-sm"  value="<%=Fecha%>" />
                                                        </label>
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="select" id="titulo">Tipo de Modeda:
                                                            <select name="TIPO_MONEDA" class="input-group-sm" required="">
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="01" selected="">SOLES</option>
                                                                <option value="02">DOLARES</option>
                                                                <option value="03">EUROS</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="select" id="titulo">Tipo Rem. Variable:
                                                            <select name="REM_VARIABLE" class="input-group-sm" required="">
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="1">DESTAJO</option>
                                                                <option value="2">COMISIONES</option>
                                                                <option value="3">NINGUNO</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="select" id="titulo">Remuneración en Especie:
                                                            <select name="REM_ESPECIE" class="input-group-sm" required="">
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="1">SI</option>
                                                                <option value="0">NO</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                </div>
                                            </fieldset>

                                            <fieldset>
                                                <h6><label id="titulo">Horas:</label></h6>
                                                <div class="row" >
                                                    <section class="col col-4">
                                                        <label class="input" id="titulo">Semanal:
                                                            <input type="text" name="HORAS_SEMANA" value="<%=d.getCa_horas_horario()%>" class="input-group-sm" required="">
                                                        </label>
                                                    </section>

                                                    <section class="col col-4">
                                                        <label class="input" id="titulo">Mensual:
                                                            <input type="text" name="NRO_HORAS_LAB" value="<%=d.getCa_horas_horario() * 4%>" class="input-group-sm" required="">
                                                        </label>
                                                    </section>

                                                    <section class="col col-4">
                                                        <label class="input" id="titulo">Dias:
                                                            <input type="text" name="DIAS" value="30" class="input-group-sm" required="">
                                                        </label>
                                                    </section>
                                                </div>
                                            </fieldset>

                                            <fieldset>
                                                <div class="row">
                                                    <section class="col col-4">
                                                        <label class="select" id="titulo">Tipo Trabajador.
                                                            <select name="TIPO_TRABAJADOR" class="input-group-sm" required="">
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="1" selected>Empleado</option>
                                                                <option value="2">Obrero</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-4">
                                                        <label class="select" id="titulo">Regimen Laboral: 
                                                            <select name="REGIMEN_LABORAL" class="input-group-sm" required="">
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="1" selected>Privado</option>
                                                                <option value="2" selected>Público</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-4">
                                                        <label class="select" id="titulo"> Discapacidad:
                                                            <select name="DISCAPACIDAD" class="input-group-sm" required="">
                                                                <option value="">[SLECCIONE]</option>
                                                                <option value="1" selected>No</option>
                                                                <option value="2">Si</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-4">
                                                        <label class="select" id="titulo">Regimen Pensionario:
                                                            <select name="REGIMEN_PENSIONARIO" class="input-group-sm" required="">
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="1" selected>Privado</option>
                                                                <option value="2">SNP</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-4">
                                                        <label class="select" id="titulo">Tipo Contrato::
                                                            <select name="TIPO_CONTRATO" class="input-group-sm" required="">
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="1">Necesidad de Mercado</option>
                                                                <option value="2">Incremento de Actividad</option>
                                                                <option value="3">Servicio Especifico</option>
                                                                <option value="4">Inicio de Actividad</option>
                                                                <option value="5">Tiempo Parcial</option>
                                                                <option value="6">Indeterminado</option>
                                                                <option value="7">Extranjero</option>
                                                                <option value="8">Suplencia</option>
                                                                <option value="9">Contrato Civil</option>
                                                                <option value="10">De Temporada</option>
                                                                <option value="11">Locacion de Servicios</option>
                                                                <option value="12">No Domiciliados</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <%
                                                        if (d.getId_tipo_planilla().trim().equals("TPL-0001")) {

                                                    %>
                                                    <section class="col col-4">
                                                        <label class="select" id="titulo">Tipo Convenio:
                                                            <select name="TIPO_CONVENIO" class="input-group-sm" >
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="1">CLJ</option>
                                                                <option value="2">PPP</option>
                                                                <option value="3">PP</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <%}%>
                                                </div>
                                            </fieldset>

                                            <fieldset>
                                                <section>
                                                    <label class="label" id="titulo">Observación:  </label>
                                                    <label class="textarea">
                                                        <textarea rows="3"  name="OBSERVACION" cols="35" rows="6" ></textarea>
                                                    </label>
                                                </section>
                                            </fieldset>
                                            <fieldset>
                                                <div class="row">
                                                    <!--<section class="col col-4">
                                                        <label class="select" id="titulo">Situación Actual:
                                                            <select name="ESTADO_CONTRATO" class="input-group-sm" required="">
                                                                <option value="">[SELECCIONE]</option>
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
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="1" selected >Lima</option>
                                                                <option value="2">Juliaca</option>
                                                                <option value="3">Tarapoto</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <!--<section class="col col-4">
                                                        <label class="input" id="titulo">Fecha Cese: 
                                                            <input type="date" name="FEC_CESE"  class="input-group-sm" required="">
                                                        </label>
                                                    </section>-->
                                                    <section class="col col-2">
                                                        <label class="input" id="titulo">RUC UPEU:
                                                            <input type="text" name="EMP_RUC" value="20138122256" maxlength="20" class="input-group-sm" required="">
                                                        </label>
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="input" id="titulo">Cod. Sucursal:
                                                            <input type="text" name="SUCURSAL" value="-1" maxlength="3" class="input-group-sm" required="">
                                                        </label>
                                                    </section>
                                                    <section class="col col-2">
                                                        <label class="input" id="titulo">MYPE:
                                                            <input type="text" name="MYPE" value="N"  maxlength="2" class="input-group-sm" required="">
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="select" id="titulo" style="color:red">Plantilla de Contrato:
                                                            <select name="id_plantilla_contractual" class="con_pl_pu input-group-sm"  required="">
                                                                <option value="">[SELECCIONE]</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                </div>
                                                <input type="hidden" name="ENTREGAR_DOC_REGLAMENTOS"  value="0" class="text-box" >
                                                <input type="hidden" name="REGISTRO_HUELLA"  value="0" class="text-box" > 
                                                <input type="hidden" name="REGISTRO_SISTEM_REMU" value="0" class="text-box" >
                                                <input type="hidden" name="ESTADO" value="1" class="text-box" > 
                                                <input type="hidden" value="<%=d.getId_trabajador()%>" name="IDDATOS_TRABAJADOR" class="text-box" >

                                            </fieldset>
                                            <input type="hidden" value="<%=d.getId_departamento()%>" class="dep_pu">
                                            <input type="hidden" value="<%=d.getId_area()%>" class="area_pu">
                                            <input type="hidden" value="<%=d.getId_direccion()%>" class="dir_pu">
                                            <input type="hidden" value="<%=d.getId_seccion()%>" class="sec_pu">
                                            <input type="hidden" value="<%=d.getId_puesto()%>" class="id_pu_dgp">
                                            <footer>
                                                <input type="hidden" name="opc"   value="REGISTRAR CONTRATO">
                                                <button type="submit" id="submit" class="btn btn-primary">
                                                    REGISTRAR CONTRATO
                                                </button>
                                                <a type="button" class="btn btn-success" href="../../horario?iddgp=<%=d.getId_dgp()%>&opc=Listar">Ver Horario</a>
                                                <a type="button" class="btn btn-success" href="../../documento?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=Ver_Documento">Ver Documentos</a>
                                            </footer>
                                        </form>
                                        <%}
                                            }%>
                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                        </article>
                    </div>   
                </section>
            </div>



        </div>

        <!--================================================== -->

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

        <!-- SPARKLINES -->

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->

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

        <!-- PAGE RELATED PLUGIN(S) -->
        <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>
        <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>

    </body>
    <script>
            function Listar_dep() {
                var s = $(".selec_dep");
                $.post("../../Direccion_Puesto", "opc=Listar&" + "id_dir=" + $(".dir_pu").val(), function (objJson) {
                    s.empty();
                    var lista = objJson.lista;
                    s.append("<option value='' > [SELECCIONE] </option>");
                    for (var j = 0; j < lista.length; j++) {
                        if ($(".dep_pu").val() == lista[j].id) {
                            s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].nombre + "</option>");

                        } else {
                            s.append("<option value='" + lista[j].id + "'> " + lista[j].nombre + "</option>");
                        }
                    }


                });
            }
            function Listar_area() {
                var s = $(".Selec_Area");

                $.post("../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + $(".dep_pu").val(), function (objJson) {
                    s.empty();
                    var lista = objJson.lista;
                    s.append("<option value='' > [SELECCIONE] </option>");
                    for (var j = 0; j < lista.length; j++) {

                        if ($(".area_pu").val() == lista[j].id) {
                            s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].nom + "</option>");
                        } else {
                            s.append("<option value='" + lista[j].id + "'> " + lista[j].nom + "</option>");
                        }
                    }

                });
            }

            function Listar_sec() {
                var s = $("#select_sec");

                $.post("../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + $(".area_pu").val(), function (objJson) {
                    s.empty();
                    var lista = objJson.lista;
                    s.append("<option value='' > [SELECCIONE] </option>");
                    for (var j = 0; j < lista.length; j++) {

                        if ($(".sec_pu").val() == lista[j].id) {
                            s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].nom + "</option>");
                        } else {
                            s.append("<option value='" + lista[j].id + "'> " + lista[j].nom + "</option>");
                        }
                    }
                });
            }
            function Listar_plantilla() {
                var s = $(".con_pl_pu");
                $.post("../../plantilla_contractual", "opc=List_planti&" + "id_pu=" + $(".id_pu_dgp").val(), function (objJson) {
                    s.empty();
                    var lista = objJson.lista;
                    s.append("<option value='' > [SELECCIONE] </option>");
                    for (var i = 0; i < lista.length; i++) {
                        s.append("<option value='" + lista[i].id + "'> " + lista[i].nom_pl + "</option>");
                    }
                });
            }
            $(document).ready(function () {
                $("#ca_bono_pu").numeric();
                $("#remu").numeric();
                $("#rein").numeric();
                $("#bo_a").numeric();
                $("#bev").numeric();
                $("#su_t").numeric();
                $("#asig").numeric();
                pageSetUp();

                $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                    $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                });
                showEsDiezmo();
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

                Listar_centro_costo();
                Listar_dep();
                Listar_sec();
                Listar_area();
                Listar_plantilla();

                var a = $("#select-sub-mod");
                var c = $("#Selec_Area");
                var d = $("#select_sec");
                var b = $("#selec_dep");
                var e = $("#pu_id_se");

                c.attr("disabled", true);
                d.attr("disabled", true);
                b.attr("disabled", true);
                e.attr("disabled", true);
                $(".select_dir").attr("disabled", true);



                $(".date").keyup(function () {
                    $(".conteni").val($(".date").val());
                });
                // $.post("../../  ")
                $("#select_mod").change(
                        function () {
                            // alert("?MODALIDAD="+$("#select_mod").val());

                            $.post("../../ajax/Ajax_Reg_Contrato/Ajax_Reg_Contrato.jsp?opc=submodalidad&" + "MODALIDAD=" + $("#select_mod").val(), function (objJson) {
                                a.empty();
                                var list = objJson.lista;
                                a.append("<option value='' > [SELECCIONE] </option>");
                                if (list.length !== 0) {
                                    for (var i = 0; i < list.length; i++) {
                                        a.append('<option value="' + list[i].id_submodalidad + '">' + list[i].de_submod + '</option>');
                                    }
                                }
                            });
                        });
                $("#selec_dep").change(
                        function () {
                            $.post("../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + $("#selec_dep").val(), function (objJson) {
                                c.empty();
                                if (objJson.rpta == -1) {
                                    alert(objJson.mensaje);
                                    return;
                                }
                                var list = objJson.lista;
                                c.append("<option value='' > [SELECCIONE] </option>");
                                if (list.length !== 0) {
                                    for (var i = 0; i < list.length; i++) {
                                        c.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                                    }
                                } else {
                                    c.append("<option value='' > [no hay] </option>");
                                }
                            });
                        });
                $("#select_dir").change(
                        function () {
                            $.post("../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + $("#select_dir").val(), function (objJson) {
                                b.empty();
                                if (objJson.rpta == -1) {
                                    alert(objJson.mensaje);
                                    return;
                                }
                                var list = objJson.lista;
                                b.append("<option value='' > [SELECCIONE] </option>");
                                if (list.length !== 0) {
                                    for (var i = 0; i < list.length; i++) {
                                        b.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                                    }
                                } else {
                                    b.append("<option value='' > [] </option>");
                                }
                            });
                        });
                $("#Selec_Area").change(
                        function () {
                            $.post("../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + $("#Selec_Area").val(), function (objJson) {
                                d.empty();

                                var list = objJson.lista;
                                d.append("<option value='' > [SELECCIONE] </option>");
                                if (list.length !== 0) {
                                    for (var i = 0; i < list.length; i++) {
                                        d.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                                    }
                                } else {
                                    d.append("<option value='' > [no hay] </option>");
                                }
                            });
                        });
                $("#select_sec").change(
                        function () {
                            $.post("../../Direccion_Puesto", "opc=Listar_pu_id&" + "id=" + $("#select_sec").val(), function (objJson) {
                                e.empty();
                                if (objJson.rpta == -1) {
                                    alert(objJson.mensaje);
                                    return;
                                }
                                var list = objJson.lista;
                                e.append("<option value='' > [SELECCIONE] </option>");
                                if (list.length !== 0) {
                                    for (var i = 0; i < list.length; i++) {
                                        e.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                                    }
                                } else {
                                    e.empty();
                                    e.append("<option value='' > [] </option>");
                                }
                            });
                        });
                $("#btn-registrar").click(
                        function () {
                            var pr = $("#select-proceso").val();
                            $.post("../../paso", $("#form-paso").serialize(), function () {
                                Listar_Paso(pr);
                            });
                            $("#btn-registrar").val("Registrar Paso");
                            $(".opc").val("Registrar");
                            $("#form-paso")[0].reset();

                            return false;
                        }
                );



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
                function Listar_centro_costo() {
                    var x = $("#fila-agregar");
                    $.post("../../centro_costo", "opc=Listar_centro_id&" + "id_dgp=" + $("#id_dgp").val(), function (objJson) {
                        var lista = objJson.lista;
                        var numero = 1;
                        x.append('<div  class="row centro-costo_' + numero + '" >');
                        for (var i = 0; i < lista.length; i++) {
                            numero = numero + i;
                            if ($("#id_rol_s").val() === 'ROL-0001') {
                                x.append('</label><section class="col col-5"><label class="select" id="titulo"> Centro costo Nº ' + numero + '<select name="select_cent_c_' + i + '" required="" class="input-group-sm"><option value="' + lista[i].id_det_ce + '">' + lista[i].nombre + '</option></select></label></section><div class="form-group"><button type="button" class="btn btn-primary" id="Seleccionar_centro" >Buscar</button></div>');
                            } else {
                                x.append('</label><section class="col col-5"><label class="select" id="titulo"> Centro costo Nº ' + numero + '<select name="select_cent_c_' + i + '" required="" class="input-group-sm"><option value="' + lista[i].id_det_ce + '">' + lista[i].nombre + '</option></select></label></section>');
                            }
                            numero = 1;
                        }
                        x.append('</div><table><tr><td><td><input type="hidden" name="can_centro_cos" value="' + lista.length + '"></td></tr></table>');

                    });

                }


            }
            );
    </script>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
