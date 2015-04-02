<%@page import="pe.edu.upeu.application.web.controller.CConversion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upeu.application.model.Grupo_Ocupaciones"%>
<%@page import="pe.edu.upeu.application.model.Modalidad"%>
<%@page import="pe.edu.upeu.application.model.Regimen_Laboral"%>
<%@page import="pe.edu.upeu.application.model.Direccion"%>
<%@page import="pe.edu.upeu.application.model.Anno"%>
<%@page import="pe.edu.upeu.application.model.V_Contrato_dgp"%>
<%@page import="pe.edu.upeu.application.model.X_List_Id_Contrato_DGP"%>
<%@page import="pe.edu.upeu.application.model.X_List_Id_Contrato_DGP"%>
<jsp:useBean id="List_contrato" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Anno" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Direccion" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="list_reg_labo" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_modalidad" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_grup_ocu" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="list_cc_x_con" scope="application" class="java.util.ArrayList"/>
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
        <style type="text/css">

            #titulo{

                font-weight: bold;
                color: #005cac;
            }

            .header{


                background-color: #474747;
                padding: 0%;

                font-family: arial;
                font-size: 130%;
                text-align: center;
                color: white;

            }
            #submit{
                font-weight:bold;
                padding-left: 4%;
                padding-right: 4%;
            }

        </style>
    </head>


    <body>
        <!-- Widget ID (each widget will need unique ID)-->


        <div id="main" role="main" style="margin:0px;">
            <div id="content" >
                <div class="jarviswidget" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false">

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
                        <!--<div   class="header" style=" width:100%; border:2px solid red">Detalle del Trabajador</div> -->
                        <div class="header">
                            <span class="widget-icon"> <i class="fa fa-edit"></i> Ficha Contractual</span>
                        </div>
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
                            <% CConversion con = new CConversion();
                                HttpSession sesion = request.getSession(true);
                                String idrol = (String) sesion.getAttribute("IDROL");
                            %>
                            <%for (int i = 0; i < List_contrato.size(); i++) {
                                    V_Contrato_dgp a = new V_Contrato_dgp();
                                    a = (V_Contrato_dgp) List_contrato.get(i);
                            %>

                            <form action="../../contrato" id="checkout-form" class="smart-form"  method="POST" >
                                <fieldset id="fila-agregar">
                                    <%if (a.getId_dgp() != null) {%>
                                    <div class="row">
                                        <section class="col col-2">
                                            <label class="select" id="titulo">Motivo :
                                                <select class="input-group-sm" disabled="">
                                                    <%if (a.getLi_motivo().trim().equals("1")) {%>
                                                    <option value="1" selected="">Trabajador Nuevo</option>   
                                                    <option value="2" >renovación</option>   
                                                    <%} else {%>
                                                    <option value="1" >Trabajador Nuevo</option>   
                                                    <option value="2" selected="">renovación</option>
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section >
                                        <section class="col col-1" style=" margin-top:2%;">
                                            <label class="toggle" id="titulo" > MFL:
                                                <%if (a.getEs_mfl().trim().equals("1")) {%>
                                                <input type="checkbox" name="checkbox-toggle" checked="" disabled="">
                                                <%} else {%>
                                                <input type="checkbox" name="checkbox-toggle"  disabled="">
                                                <%}%>
                                                <i data-swchoff-text="NO"  data-swchon-text="SI"></i>
                                            </label>
                                        </section>
                                        <input type="hidden" value="<%=a.getId_dgp()%>" id="id_dgp">
                                    </div>
                                    <%}%>
                                    <div class="row" >
                                        <input type="hidden" name="id_rol_ses" id="id_rol_s" value="<%=idrol%>">
                                        <input type="hidden" name="TIPO_PLANILLA"  value="<%%>">
                                        <input type="hidden" name="HORARIO"  value="">
                                        <section class="col col-2">
                                            <label class="select" id="titulo">Año:
                                                <select name="AÑO_ID" required="" class="input-group-sm">
                                                    <%for (int b = 0; b < List_Anno.size(); b++) {
                                                            Anno an = new Anno();
                                                            an = (Anno) List_Anno.get(b);
                                                            if (a.getId_anno().trim().equals(an.getId_anno().trim())) {
                                                    %>
                                                    <option value="<%=an.getId_anno()%>" selected=""><%=an.getNo_anno()%></option>
                                                    <%} else {%>
                                                    <option value="<%=an.getId_anno()%>"><%=an.getNo_anno()%></option>
                                                    <%}
                                                        }%>
                                                </select>  
                                            </label>
                                        </section>
                                        <input type="hidden" name="IDDETALLE_DGP" value="<%=a.getId_dgp()%>" class="text-box id_dg" id="id_dg" >                              
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Desde:
                                                <%if (a.getFe_desde() != null) {%>
                                                <input type="date" name="FEC_DESDE" value="<%=con.convertFecha3(a.getFe_desde())%>" class=" input-group-sm" required="">
                                                <%} else {%>
                                                <input type="date" name="FEC_DESDE" class=" input-group-sm" required="">
                                                <%}%>
                                            </label>
                                        </section>
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Hasta: 
                                                <%if (a.getFe_hasta() != null) {%>
                                                <input type="date" name="FEC_HASTA" value="<%=con.convertFecha3(a.getFe_hasta())%>" class="input-group-sm" required="">
                                                <%} else {%>
                                                <input type="date" name="FEC_DESDE" class=" input-group-sm" required="">
                                                <%}%>
                                            </label>
                                        </section>
                                        <section class="col col-3" id="titulo">
                                            <label class="select" id="titulo">Dirección:
                                                <select name="DIRECCION" class="select_dir input-group-sm" id="select_dir">
                                                    <%for (int c = 0; c < Listar_Direccion.size(); c++) {
                                                            Direccion dir = new Direccion();
                                                            dir = (Direccion) Listar_Direccion.get(c);
                                                            if (a.getId_direccion().trim().equals(dir.getId_direccion().trim())) {
                                                    %>
                                                    <option value="<%=dir.getId_direccion()%>" selected=""><%=dir.getNo_direccion()%></option>
                                                    <%} else {%>
                                                    <option value="<%=dir.getId_direccion()%>"><%=dir.getNo_direccion()%></option>
                                                    <%}
                                                        }%>
                                                </select>  </label>
                                        </section>
                                        <section class="sec_dep col col-3" id="titulo">
                                            <label class="select" id="titulo">Departamento:
                                                <select name="DEPARTAMENTO_ID" class="selec_dep input-group-sm"  id="selec_dep">
                                                    <option value="">[SELECCIONE]</option>
                                                </select>  </label>
                                        </section>
                                        <section class="sec_are col col-3" id="titulo">
                                            <label class="select" id="titulo">Area:
                                                <select name="AREA_ID" class="Selec_Area input-group-sm" id="Selec_Area">
                                                    <option value="">[SELECCIONE]</option>
                                                </select>  </label>
                                        </section>
                                        <section class="sec_sec col col-3" id="titulo">
                                            <label class="select" id="titulo">Sección:
                                                <select name="SECCION_ID" class="select_sec input-group-sm" id="select_sec">
                                                    <option value="">[SELECCIONE]</option>
                                                </select>  </label>
                                        </section>
                                        <section class="col col-3" id="titulo">
                                            <label class="select" id="titulo">Puesto:
                                                <select name="PUESTO_ID" required="" class="pu_id_se input-group-sm" id="pu_id_se">
                                                    <option value="" selected="selected"></option>
                                                    <option value=""></option>
                                                </select>  </label>
                                        </section>
                                        <section class="col col-3">
                                            <label class="select" id="titulo">Condición:
                                                <select name="CONDICION" class="input-group-sm" required="">
                                                    <%if (a.getLi_condicion() != null) {%>
                                                    <option value="1" <%if (a.getLi_condicion().trim().equals("1")) {%>selected=""<% }%>>Contratado</option>
                                                    <option value="2" <%if (a.getLi_condicion().trim().equals("2")) {%>selected=""<%}%>>Contratado Independiente</option>
                                                    <option value="3" <%if (a.getLi_condicion().trim().equals("3")) {%>selected=""<%}%>> Enpleado</option>
                                                    <option value="4" <%if (a.getLi_condicion().trim().equals("4")) {%>selected=""<%}%>>Misionero</option>
                                                    <option value="5" <%if (a.getLi_condicion().trim().equals("5")) {%>selected=""<%}%>>MFL-Práctica Pre-Profesional</option>
                                                    <option value="6" <%if (a.getLi_condicion().trim().equals("6")) {%>selected=""<%}%>>MFL-Práctica Profesionales</option>
                                                    <option value="7" <%if (a.getLi_condicion().trim().equals("7")) {%>selected=""<%}%>>MFL-CLJ</option>
                                                    <option value="8" <%if (a.getLi_condicion().trim().equals("8")) {%>selected=""<%}%>>MFL-Contrato</option>
                                                    <%} else {%>
                                                    <option value="">[SELECCIONE]</option>
                                                    <option value="1">Contratado</option>
                                                    <option value="2">Contratado Independiente</option>
                                                    <option value="3">Enpleado</option>
                                                    <option value="4">Misionero</option>
                                                    <option value="5">MFL-Práctica Pre-Profesional</option>
                                                    <option value="6">MFL-Práctica Profesionales</option>
                                                    <option value="7">MFL-CLJ</option>
                                                    <option value="8">MFL-Contrato</option>
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section>
                                    </div>
                                    <div class="row">
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Remuneración:
                                                <input type="text" name="SUELDO" value="<%=a.getCa_sueldo()%>" class="input-group-sm" id="remu" readonly="" >
                                            </label>
                                        </section>
                                        <section class="col col-1">
                                            <label class="input" id="titulo">Reintegro:
                                                <input type="text" name="REINTEGRO" value="<%=a.getCa_reintegro()%>" class="input-group-sm" id="rein" readonly="" >
                                            </label>
                                        </section>
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Bono Alimentario:
                                                <input type="text" name="BONO_ALIMENTO" value="<%=a.getCa_bono_alimento()%>" class="input-group-sm" id="bo_a" readonly="">
                                            </label>
                                        </section>
                                        <section class="col col-1">
                                            <label class="input" id="titulo">BEV:
                                                <input type="text" name="BEV" value="<%=a.getCa_bev()%>" class="input-group-sm" id="bev" readonly="">
                                            </label>
                                        </section>
                                        <section class="col col-1">
                                            <label class="input" id="titulo">Bono puesto:
                                                <input type="text" name="ca_bono_puesto" value="<%=a.getCa_bonificacion_p()%>" class="input-group-sm" required="" id="ca_bono_pu" readonly="">
                                            </label>
                                        </section>

                                        <section class="col col-2">
                                            <label class="input" id="titulo">Sueldo Total:
                                                <input type="text" name="TOTAL_SUELDO" value="<%=a.getCa_sueldo_total()%>" class="input-group-sm" id="su_t" readonly="">
                                            </label>
                                        </section>
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Tipo Horas Pago:
                                                <input type="text" name="TIPO_HORA_PAGO" value="<%=a.getTi_hora_pago()%>" class="input-group-sm" readonly="">
                                            </label>
                                        </section>
                                        <section class="col col-2" >
                                            <label class="input" id="titulo">Asignanción Familiar:
                                                <input type="text" name="ASIG_FAMILIAR" value="<%=a.getCa_asig_familiar()%>"  class="input-group-sm" id="asig" readonly="">
                                            </label>
                                        </section>
                                    </div>
                                    <!--<div class="modal-body">
        
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
        
        
        
                                    </div>-->

                                </fieldset>
                                <fieldset id="fila-agregar-cc">
                                    <section  id="centros-costos-relleno"></section> 
                                </fieldset>
                                <fieldset>
                                    <div class="row">
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Regimen Laboral Mintra:
                                                <select name="REG_LAB_MINTRA" class="input-group-sm" required="">
                                                    <option value="">[SELECCIONE]</option> 
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
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Modalidad:
                                                <select name="MODALIDAD" class="input-group-sm" id="select_mod" required="">
                                                    <option value="">[SELECCIONE]</option>
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
                                                    <option value="">[SELECCIONE]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Tipo Contratación:
                                                <select name="REG_LAB_MINTRA" class="input-group-sm" >
                                                    <option value="">[SELECCIONE]</option>
                                                    <option value="I">INICIO</option>
                                                    <option value="R">RENOVACION</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Codigo Grupo de Ocupaciones:
                                                <select name="CO_GRUPO_OCU" class="input-group-sm" required="">
                                                    <option value="">[SELECCIONE]</option>
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
                                                            }
                                                        }%>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="input" id="titulo">Fecha de Suscripción: 
                                                <input id="suscripcion" type="date" name="FECHA_SUSCRIPCION"  class="input-group-sm"  value="<%=con.convertFecha3(a.getFe_suscripcion())%>">
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Tipo de Modeda:
                                                <select name="TIPO_MONEDA" class="input-group-sm" required="">
                                                    <%if (a.getCo_ti_moneda() != null) {%>
                                                    <option value="">[SELECCIONE]</option>
                                                    <option value="01" <%if (a.getCo_ti_moneda().trim().equals("01")) {%> selected=""<%}%> >SOLES</option>
                                                    <option value="02" <%if (a.getCo_ti_moneda().trim().equals("02")) {%> selected=""<%}%>>DOLARES</option>
                                                    <option value="03" <%if (a.getCo_ti_moneda().trim().equals("03")) {%> selected=""<%}%>>EUROS</option>
                                                    <%} else {%>
                                                    <option value="">[SELECCIONE]</option>
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
                                                    <option value=""  >[SELECCIONE]</option>
                                                    <option value="1" <%if (a.getCo_ti_rem_variab().trim().equals("1")) {%> selected=""<%}%> >DESTAJO</option>
                                                    <option value="2" <%if (a.getCo_ti_rem_variab().trim().equals("2")) {%> selected=""<%}%> >COMISIONES</option>
                                                    <option value="3" <%if (a.getCo_ti_rem_variab().trim().equals("3")) {%> selected=""<%}%> >NINGUNO</option>
                                                    <%} else {%>
                                                    <option value="">[SELECCIONE]</option>
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
                                                    <option value="">[SELECCIONE]</option>
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

                                <fieldset>
                                    <h6><label id="titulo">Horas:</label></h6>
                                    <div class="row" >

                                        </section>
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Semanal:
                                                <input type="text" name="HORAS_SEMANA" value="48" class="input-group-sm" required="">
                                            </label>
                                        </section>
                                        </section>
                                        <section class="col col-2">
                                            <label class="input" id="titulo">Mensual:
                                                <input type="text" name="NRO_HORAS_LAB" value="192" class="input-group-sm" required="">
                                            </label>
                                        </section>
                                        </section>
                                        <section class="col col-2">
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
                                                    <%if (a.getTi_trabajador() != null) {%>
                                                    <option value="1" <%if (a.getTi_trabajador().trim().equals("1")) {%> selected=""<%}%> >Empleado</option>
                                                    <option value="2" <%if (a.getTi_trabajador().trim().equals("2")) {%> selected=""<%}%> >Obrero</option>
                                                    <%} else {%>
                                                    <option value="1" selected>Empleado</option>
                                                    <option value="2">Obrero</option>F
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Regimen Laboral: 
                                                <select name="REGIMEN_LABORAL" class="input-group-sm" required="">
                                                    <option value="">[SELECCIONE]</option>
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
                                                <select name="REGIMEN_PENSIONARIO" class="input-group-sm" required="">
                                                    <option value="">[SELECCIONE]</option>
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
                                            <label class="select" id="titulo">Tipo Contrato::
                                                <select name="TIPO_CONTRATO" class="input-group-sm" required="">
                                                    <option value="">[SELECCIONE]</option>
                                                    <%if (a.getTi_contrato() != null) {%>
                                                    <option value="1" <%if (a.getTi_contrato().trim().equals("1")) {%> selected=""<%}%>>Necesidad de Mercado</option>
                                                    <option value="2" <%if (a.getTi_contrato().trim().equals("2")) {%> selected=""<%}%>>Incremento de Actividad</option>
                                                    <option value="3" <%if (a.getTi_contrato().trim().equals("3")) {%> selected=""<%}%>>Servicio Especifico</option>
                                                    <option value="4" <%if (a.getTi_contrato().trim().equals("4")) {%> selected=""<%}%>>Inicio de Actividad</option>
                                                    <option value="5" <%if (a.getTi_contrato().trim().equals("5")) {%> selected=""<%}%>>Tiempo Parcial</option>
                                                    <option value="6" <%if (a.getTi_contrato().trim().equals("6")) {%> selected=""<%}%>>Indeterminado</option>
                                                    <option value="7" <%if (a.getTi_contrato().trim().equals("7")) {%> selected=""<%}%>>Extranjero</option>
                                                    <option value="8" <%if (a.getTi_contrato().trim().equals("8")) {%> selected=""<%}%>>Suplencia</option>
                                                    <option value="9" <%if (a.getTi_contrato().trim().equals("9")) {%> selected=""<%}%>>Contrato Civil</option>
                                                    <option value="10" <%if (a.getTi_contrato().trim().equals("10")) {%> selected=""<%}%>>De Temporada</option>
                                                    <option value="11" <%if (a.getTi_contrato().trim().equals("11")) {%> selected=""<%}%>>Locacion de Servicios</option>
                                                    <option value="12" <%if (a.getTi_contrato().trim().equals("12")) {%> selected=""<%}%>>No Domiciliados</option>
                                                    <%} else {%>
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
                                                    <%}%>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="select" id="titulo">Tipo Convenio:
                                                <select name="TIPO_CONVENIO" class="input-group-sm" >
                                                    <option value="">[SELECCIONE]</option>
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
                                    <div class="">
                                        <section class="col col-12">
                                            <label class="textarea" id="titulo">Observación:  </label>
                                            <textarea  name="OBSERVACION"  class="input-group-sm " cols="35" rows="6" value="<%=a.getDe_observacion()%>" ></textarea>
                                        </section>

                                    </div>

                                    <!--<div>
                                      <section>
                                        <label class="textarea" id="titulo">Observación2:</label>										
                                        <textarea rows="5" rows="6" name="comment" placeholder=""></textarea> 
                                    </section>
                                    </div>-->

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
                                                    <option value="">[SELECCIONE]</option>
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
                                    <button type="submit" id="submit" class="btn btn-primary" >
                                        MODIFICAR CONTRATO
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
        <button  data-toggle="modal" data-target="#myModal" id="btn-mostrar" hidden="">
            Launch demo modal
        </button>
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
        <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>
        <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!

            $(document).ready(function() {
                $("#ca_bono_pu").numeric();
                $("#remu").numeric();
                $("#rein").numeric();
                $("#bo_a").numeric();
                $("#bev").numeric();
                $("#su_t").numeric();
                $("#asig").numeric();
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
    </body>
    <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
    <script>
            function Listar_dep() {
                var s = $(".selec_dep");
                $.post("../../Direccion_Puesto", "opc=Listar&" + "id_dir=" + $(".dir_pu").val(), function(objJson) {
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

                $.post("../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + $(".dep_pu").val(), function(objJson) {
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

                $.post("../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + $(".area_pu").val(), function(objJson) {
                    s.empty();
                    var lista = objJson.lista;
                    s.append("<option value='' > [SELECCIONE] </option>");
                    for (var j = 0; j < lista.length; j++) {

                        if ($(".sec_pu").val().trim() == lista[j].id.trim()) {
                            s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].nom + "</option>");
                        } else {
                            s.append("<option value='" + lista[j].id + "'> " + lista[j].nom + "</option>");
                        }
                    }
                });
            }
            function Listar_pue() {
                var s = $("#pu_id_se");
                $.post("../../Direccion_Puesto", "opc=Listar_pu_id&" + "id=" + $(".sec_pu").val(), function(objJson) {
                    s.empty();
                    var lista = objJson.lista;
                    s.append("<option value='' > [SELECCIONE] </option>");
                    for (var j = 0; j < lista.length; j++) {

                        if ($(".id_pu_dgp").val() == lista[j].id) {
                            s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].nombre + "</option>");
                        } else {
                            s.append("<option value='" + lista[j].id + "'> " + lista[j].nombre + "</option>");
                        }
                    }
                });
            }

            function Listar_plantilla() {
                var s = $(".con_pl_pu");

                $.post("../../plantilla_contractual", "opc=List_planti&" + "id_pu=" + $(".id_pu_dgp").val(), function(objJson) {
                    s.empty();
                    var lista = objJson.lista;
                    s.append("<option value='' > [SELECCIONE] </option>");
                    for (var i = 0; i < lista.length; i++) {
                        if ($(".id_pl_con").val() == lista[i].id) {
                            s.append("<option value='" + lista[i].id + "' selected=''> " + lista[i].nom_pl + "</option>");
                        } else {
                            s.append("<option value='" + lista[i].id + "'> " + lista[i].nom_pl + "</option>");
                        }
                    }
                });
            }
            function listar_sub_mod() {
                var s = $("#select-sub-mod");

                $.post("../../Direccion_Puesto", "opc=Listar_SUB_MO&" + "id=" + $(".id_mod_con").val(), function(objJson) {
                    s.empty();
                    var lista = objJson.lista;
                    s.append("<option value='' > [SELECCIONE] </option>");
                    for (var i = 0; i < lista.length; i++) {
                        if ($(".id_sub_mod").val() == lista[i].id.trim()) {
                            s.append("<option value='" + lista[i].id + "' selected=''> " + lista[i].nombre + "</option>");
                        } else {
                            s.append("<option value='" + lista[i].id + "'> " + lista[i].nombre + "</option>");
                        }
                    }
                });
            }
            function Listar_Direccion() {
                var cc_dir = $(".cc-dir");
                $.post("../../centro_costo?opc=Listar_dir", function(objJson) {
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    for (var i = 0; i < lista.length; i++) {
                        if (lista[i].id == $(".id_dire").val()) {
                            cc_dir.append("<option value='" + lista[i].id + "' selected=''>" + lista[i].nombre + "</option>");
                        } else {
                            cc_dir.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                        }
                    }
                });
            }
            function Listar_centro_costo() {
                var x = $("#centros-costos-relleno");
                $.post("../../centro_costo", "opc=Listar_centro_id_con&" + "id_con=" + $(".id_contrato").val(), function(objJson) {
                    var lista = objJson.lista;
                    x.empty();
                    var numero = 1;
                    var texto = "";
                    if ($("#id_dgp").val() == null) {
                        texto += '<div class="row" ><section class="col col-1"><br><label  id="titu">Agregar:</label><br><label class="btn"><a type="button" style="padding:9%; padding-right:20%; padding-left:20%;" id="btn-agregar-cc2" class=" btn btn-default txt-color-green btn-agregar-cc"><i class="fa fa-plus fa-2x"></i></a></label></section><section class="col col-2"><label class="input" id="titulo">%:<input type="text" name="PORCENTAJE_TOTAL" max="100" min="100" maxlength="3" value="" class="input-group-sm por_sum_to" id="bo_a" readonly=""></label></section></div>';
                    }
                    for (var i = 0; i < lista.length; i++) {
                        numero = numero + i;
                        if ($("#id_dgp").val() != null) {
                            texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + (i + 1) + ':</label>';
                            texto += '<div  class="row centro-costo_' + ag + '" >';
                            texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '" id="cc-dir' + ag + '" readonly=""  disabled><option value="">[DIRECCION]</option></select></label></section>';
                            texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '" disabled readonly="readonly" disabled><option value=""  >[DEPARTAMENTO]</option></select></label></section>';
                            texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required="" readonly="readonly" disabled><option value="">[CENTRO COSTO]</option></select></label></section>';
                            texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ingr + '"  min="0" value="' + lista[i].ca_por_cc + '"  type="text" required="" class="porcentaje_cc" readonly="readonly" disabled/></label></section>';
                            texto += '</div>';
                            var dir, dep, cc;
                            dir = lista[i].id_dir_cc;
                            dep = lista[i].id_dep_cc;
                            cc = lista[i].id;
                            listar_cc2(ag, dir, dep, cc);
                        } else {
                            if ($(".can_centro_cos ").val() == "1") {
                                texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + (i + 1) + ':</label>';
                                texto += '<div  class="row centro-costo_' + ag + '" >';
                                texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '" id="cc-dir' + ag + '" readonly="readonly"  disabled><option value="">[DIRECCION]</option></select></label></section>';
                                texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '" readonly="readonly"  disabled><option value="">[DEPARTAMENTO]</option></select></label></section>';
                                texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required="" readonly="readonly"  disabled><option value="">[CENTRO COSTO]</option></select></label></section>';
                                texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ingr + '"  min="0" value="' + lista[i].ca_por_cc + '"  type="text" required="" class="porcentaje_cc"/></label></section>';
                                texto += '<section class="col col-1" ><br><label class="btn"><button type="button" style="padding:9%; padding-right:20%; padding-left:20%;" value="' + ag + '" class=" btn btn-default txt-color-red remover' + ag + '" onclick="Eliminar($(this).val());" disabled ><i class="fa fa-minus fa-2x"></i></button></label></section>';
                                texto += '<input type="hidden" value="' + lista[i].id_det_ce + '" class="id_dcc' + ag + '" ><input type="hidden" name="id_d_cen_cos" value="' + lista[i].id_det_ce + '" ></div>';
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
                                texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required="" readonly="readonly"  disabled><option value="">[CENTRO COSTO]</option></select></label></section>';
                                texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ingr + '"  min="0" value="' + lista[i].ca_por_cc + '"  type="text" required="" class="porcentaje_cc"/></label></section>';
                                texto += '<section class="col col-1" ><br><label class="btn"><button type="button" style="padding:9%; padding-right:20%; padding-left:20%;" value="' + ag + '" class=" btn btn-default txt-color-red remover' + ag + '" onclick="Eliminar($(this).val());" ><i class="fa fa-minus fa-2x"></i></button></label></section>';
                                texto += '<input type="hidden" value="' + lista[i].id_det_ce + '" class="id_dcc' + ag + '" ></div>';
                                var dir, dep, cc;
                                dir = lista[i].id_dir_cc;
                                dep = lista[i].id_dep_cc;
                                cc = lista[i].id;
                                listar_cc2(ag, dir, dep, cc);
                                // texto += ('<section class="col col-4 cen-co-im' + i + '"><br><label class="select" id="titulo"> Centro costo Nº ' + numero + '<select name="select_cent_c_' + i + '" required="" class="input-group-sm selec' + i + '"><option value="' + lista[i].id_det_ce + '">' + lista[i].nombre + '</option></select></section><section class="col col-1 cen-co-im' + i + '" ><br><label class="btn"><button type="button" style="padding:9%; padding-right:20%; padding-left:20%;"value="' + i + '" class=" btn btn-default txt-color-red rem' + i + '" onclick="Eliminar($(this).val());"><i class="fa fa-minus fa-2x"></i></button></label></section>');
                            }
                            //listar_cc2(ag, lista[i].id_dir_cc, lista[i].id_dep_cc, lista[i].id);
                        }
                        numero = 1;
                        ag++;
                    }
                    x.append(texto);
                    $('#btn-agregar-cc2').click(function() {
                        agregar_centro_costo();
                    });
                });
            }
            var agregar = $('#fila-agregar-cc');
            var ag = 1;
            var ingr = 0;
            var texto = ""
            var estable = 0;
            var can_eliminada = 0;
            function agregar_centro_costo(opc, arr_cc) {
                if ($(".can_centro_cos").val().trim() == "1") {
                    ingr++;
                    texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + ag + ':</label>';
                    texto += '<div  class="row centro-costo_' + ag + '" >';
                    texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '" ><option value="">[DIRECCION]</option></select></label></section>';
                    texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
                    texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';
                    texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ingr + '"  min="0" value="' + (ingr + ag - 1) + '"  type="text" required="" class="porcentaje_cc"/></label></section>';
                    texto += '<section class="col col-1" ><br><label class="btn"><a type="button" style="padding:9%; padding-right:20%; padding-left:20%;"  class=" btn btn-default txt-color-red remover' + ag + '"><i class="fa fa-minus fa-2x"></i></a></label></section>';
                    texto += '</div>';
                    agregar.append(texto);
                    remover_atrib(ag - 1);
                    listar_cc(ag);
                    var c_porcentaje = $(".porcentaje_cc").size();
                    $(".porcentaje_cc").val(Math.round((100 / (ingr + ag - 1 - estable)) * 100) / 100);
                    estable++;
                    sumn_porcen_total();
                    $(".can_centro_cos").val("a");

                    $(".cant-ing").val(ingr);
                } else {
                    ingr++;
                    texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + ag + ':</label>';
                    texto += '<div  class="row centro-costo_' + ag + '" >';
                    texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '"><option value="">[DIRECCION]</option></select></label></section>';
                    texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
                    texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';
                    texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ingr + '"  min="0" value="' + (ingr + ag - 1) + '"  type="text" required="" class="porcentaje_cc"/></label></section>';
                    texto += '<section class="col col-1" ><br><label class="btn"><a type="button" style="padding:9%; padding-right:20%; padding-left:20%;"  class=" btn btn-default txt-color-red remover' + ag + '"><i class="fa fa-minus fa-2x"></i></a></label></section>';
                    texto += '</div>';
                    agregar.append(texto);
                    // remover_atrib(ag - 1);
                    //remover_atrib(ag-1);
                    agrgar_atrib(ag - 1)
                    listar_cc(ag);
                    var c_porcentaje = $(".porcentaje_cc").size();

                    $(".cant-ing").val(ingr);
                    $(".porcentaje_cc").val(Math.round((100 / (ingr + ag - 1 - estable)) * 100) / 100);
                    estable++;
                    sumn_porcen_total();

                }
                //$(".ver").text(texto); 
                texto = "";
                $(".cant").val(ag);
                ag++;


                $(".porcentaje_cc").keyup(function() {
                    sumn_porcen_total();
                });
            }
            function remover_atrib(num) {
                $(".remover" + num).removeAttr("disabled");
            }
            function agrgar_atrib(num) {
                if ((num) == $(".can_centro_cos").val()) {
                } else {
                    $(".remover" + num).attr("disabled", "disabled");
                }
            }
            function sumn_porcen_total() {

                var acum = 0;
                $.each($(".porcentaje_cc"), function() {
                    acum = acum + parseFloat($(this).val());
                });
                $(".por_sum_to").val(acum);
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
                $(".remover" + num).click(function() {
                    $(".remover" + (num - 1)).removeAttr("disabled");
                    remover(num);
                    sumn_porcen_total();
                    ag--;
                    ingr--;
                    estable--;
                    $(".cant-ing").val(ingr);
                    actualizar_porcentaje();
                    sumn_porcen_total();
                });
            }
            function actualizar_porcentaje(){
                 $(".porcentaje_cc").val(Math.round((100 / (ingr + ag - 1 - estable)) * 100) / 100);
            }
            function remover(rem) {
                $(".centro-costo_" + rem).remove();
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
                $(".remover" + num).click(function() {
                    $(".remover" + (num - 1)).removeAttr("disabled");
                    remover(num);
                    sumn_porcen_total();
                    ag--;
                });
            }
            function remover2(rem) {

                $(".centro-costo_" + rem).remove();
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
                        if (dep == lista[i].id.trim()) {
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
                        if (cc == lista[i].id.trim()) {
                            centro_costo.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                        } else {
                            centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                        }

                    }
                });
            }
            function Eliminar(i) {
                alert();
                var x = $("#fila-agregar-cc");
                ag--;
                var msg = confirm('Si aceptas se eliminara la informacion totalmente ¿aceptas?');
                if (msg == true) {
                    $.post("../../centro_costo", "opc=Eliminar_det_cc&" + "id_dcc=" + $(".id_dcc" + i).val(), function() {
                        $(".remover" + i + 1).attr("disabled", "disabled");
                        remov(i);
                        can_eliminada++;
                        $(".cant-elimi").val(can_eliminada);
                        var can = $(".can_centro_cos ").val();
                        can--;
                        Listar_centro_costo();
                        $(".can_centro_cos ").val(can);
                        ag = 1;
                    });
                } else {
                    return false;
                }
            }
            function remov(i) {
                $(".centro-costo_" + i).remove();
            }
            $(document).ready(function() {

                Listar_pue();
                Listar_dep();
                Listar_sec();
                Listar_area();
                //
                Listar_plantilla();
                listar_sub_mod();
                Listar_Direccion();
                Listar_centro_costo();
                var a = $("#select-sub-mod");
                var c = $("#Selec_Area");
                var d = $("#select_sec");
                var b = $("#selec_dep");
                var e = $("#pu_id_se");
                $('#btn-agregar-cc').click(function() {

                    agregar_centro_costo();
                });
                $(".date").keyup(function() {
                    $(".conteni").val($(".date").val());
                });
                $(".")
                // $.post("../../  ")
                $("#select_mod").change(
                        function() {
                            // alert("?MODALIDAD="+$("#select_mod").val());
                            $.post("../../ajax/Ajax_Reg_Contrato/Ajax_Reg_Contrato.jsp?opc=submodalidad&" + "MODALIDAD=" + $("#select_mod").val(), function(objJson) {
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
                        function() {
                            $.post("../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + $("#selec_dep").val(), function(objJson) {
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
                        function() {
                            $.post("../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + $("#select_dir").val(), function(objJson) {
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
                        function() {
                            $.post("../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + $("#Selec_Area").val(), function(objJson) {
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
                        function() {
                            $.post("../../Direccion_Puesto", "opc=Listar_pu_id&" + "id=" + $("#select_sec").val(), function(objJson) {
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
                        function() {
                            var pr = $("#select-proceso").val();
                            $.post("../../paso", $("#form-paso").serialize(), function() {
                                Listar_Paso(pr);
                            });
                            $("#btn-registrar").val("Registrar Paso");
                            $(".opc").val("Registrar");
                            $("#form-paso")[0].reset();
                            return false;
                        }
                );
            }
            );
    </script>
</html>
