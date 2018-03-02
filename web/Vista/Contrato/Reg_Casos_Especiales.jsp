<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%-- 
    Document   : Reg_Casos_Especiales
    Created on : 21/01/2015, 09:46:47 AM
    Author     : Alex
--%>
<%@page import="pe.edu.upeu.application.model.Grupo_Ocupaciones"%>
<%@page import="pe.edu.upeu.application.model.Modalidad"%>
<%@page import="pe.edu.upeu.application.model.Regimen_Laboral"%>
<%@page import="pe.edu.upeu.application.model.Direccion"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.When"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.V_Puesto_Direccion"%>
<%@page import="pe.edu.upeu.application.model.Puesto"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<!--CONTRATO-->
<jsp:useBean id="LISTAR_ANNO" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Direccion" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="LIST_ID_DGP" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="ASIGNACION_F" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_modalidad" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_reg_labo" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_centro_costo" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_grup_ocu" scope="session" class="java.util.ArrayList"/>
<!--DGP-->
<jsp:useBean id="Listar_Trabajador_id" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Det_Puesto" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Requerimiento" scope="session" class="java.util.ArrayList"/>

<!DOCTYPE html >
<html>
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->
        <title> Registrar Casos Especiales </title>
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

        <link rel="stylesheet" href="../../css/Css_Formulario/form.css"  type="text/css" > 
        <link href="../../js/plugin/pfnotify/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .td{
                font-weight: bold;
            }
            #titu{
                font-weight: bold;
                color: #005cac;
                /*  // color: blue;*/
            }
        </style>
    </head>
    <body>   
        <div id="main" role="main" style="margin: 0px;">
            <form id="checkout-form" action="../../contrato"  novalidate="novalidate">
                <div id="content">
                    <section id="widget-grid" class="">
                        <div class="row">
                            <article class="col-sm-12 col-md-12 col-lg">

                                <!-- Widget ID (each widget will need unique ID)-->
                                <div class="jarviswidget" id="wid-id-0" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false" data-widget-deletebutton="false">
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
                                        <h2>Registrar Contrato</h2>

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
                                                        <center><h1 class="spacing" style="font-weight: bold; margin: 0px;  color: #005cac;"> Ficha Contractual</h1></center>
                                                            <%String nom = request.getParameter("nom");%>
                                                        <label style="font-weight: bold; color:#0F0F0F; ">Trabajador: <%=nom%> </label>
                                                        <br>

                                                    </div>
                                                </header>

                                                <fieldset id="fila-agregar">

                                                    <div class="row" >
                                                        <section class="col col-2 ">
                                                            <label class="input" id="titu">Desde: 
                                                                <input type="text" name="FEC_DESDE"  class="input-group-sm simple-field-data-mask frompicker"  data-mask="99/99/9999" data-mask-placeholder= "_" required="">
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="input" id="titu">Hasta: 
                                                                <input type="text" name="FEC_HASTA"  class="input-group-sm simple-field-data-mask topicker" data-mask="99/99/9999" data-mask-placeholder= "_" >
                                                            </label>
                                                        </section>
                                                        <section class="col col-2" id="titu">
                                                            <label class="select" id="titu">Dirección:
                                                                <select name="DIRECCION" class="input-group-sm select_dir" required="">

                                                                    <option value="">[Seleccione]</option>
                                                                    <%for (int g = 0; g < Listar_Direccion.size(); g++) {
                                                                            Direccion di = new Direccion();
                                                                            di = (Direccion) Listar_Direccion.get(g);
                                                                    %>
                                                                    <option value="<%=di.getId_direccion()%>"><%=di.getNo_direccion()%></option>

                                                                    <%}%>

                                                                </select>  </label>
                                                        </section> 
                                                        <section class="col col-2" id="titulo">
                                                            <label class="select" id="titu">Departamento:
                                                                <select name="DEPARTAMENTO_ID" class="input-group-sm" id="selec_dep" required="">
                                                                    <option value="">[Seleccione]</option>
                                                                </select>  </label>
                                                        </section>
                                                        <section class="col col-3" id="titulo">
                                                            <label class="select" id="titu">Area:
                                                                <select name="AREA_ID" class="input-group-sm" required="" id="Selec_Area">
                                                                    <option value="">[Seleccione]</option>
                                                                </select>  </label>
                                                        </section>
                                                        <section class="col col-3" id="titulo">
                                                            <label class="select" id="titu">Sección:
                                                                <select name="SECCION_ID" class="input-group-sm" id="select_sec" required="">
                                                                    <option value="">[Seleccione]</option>
                                                                </select>  </label>
                                                        </section>
                                                        <section class="col col-3" id="titulo">
                                                            <label class="select" id="titu">Puesto:

                                                                <select name="PUESTO_ID"class="input-group-sm" id="pu_id_se" required="" required="">
                                                                    <option value="">[Seleccione]</option>
                                                                </select>  </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label class="select" id="titu">Requerimiento:
                                                                <select name="CONDICION" id="nom_req" class="input-group-sm" required="">
                                                                    <option value="0" disabled selected>[Seleccione]</option>
                                                                    <option value="REQ-0001">Contrato Personal : Tiempo Completo</option>
                                                                    <option value="REQ-0002">Contrato Personal : Medio Tiempo (24 Horas Semanal)</option>
                                                                    <option value="REQ-0003">Contrato Personal : Tiempo Parcial</option>
                                                                    <option value="REQ-0004">Renovacion de Contrato</option>
                                                                    <option value="REQ-0005">Contrato Personal : Extranjero</option>
                                                                    <option value="REQ-0007">Practicas Preprofesionales (Tope 6hrs diarias / 30 hrs  semanales.)</option>
                                                                    <option value="REQ-0008">Practicas Profesionales</option>
                                                                    <option value="REQ-0009">Convenio Laboral Juvenil (Hasta 22 a?os, no matriculados)</option>
                                                                    <option value="REQ-0010">Locacion de Servicios</option>
                                                                    <option value="REQ-0011">No domiciliado (Expositores Extranjeros)</option>
                                                                    <option value="REQ-0018">Contrato Personal : Tiempo Parcial (Trabajador Docente)</option>
                                                                    <option value="REQ-0019">Contratacion Casos Especiales</option>
                                                                    <option value="REQ-0020">Contrato Personal : MFL - Medio Tiempo</option>
                                                                    <option value="REQ-0021">Contrato Personal : MFL - Tiempo Completo</option>
                                                                    <option value="REQ-0022">Empleado</option>
                                                                    <option value="REQ-0023">Misionero</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <div class="row">
                                                        <section class="col col-2">
                                                            <label class="input" id="titu">Remuneración:
                                                                <input type="text" name="SUELDO" id="remu" value="0"  class="input-group-sm">
                                                            </label>
                                                        </section>
                                                        <section class="col col-1">
                                                            <label class="input" id="titu">Reintegro:
                                                                <input type="text" name="REINTEGRO"  value="0" id="rein" class="input-group-sm">
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="input" id="titu">Bono Alimentario:
                                                                <input type="text" name="BONO_ALIMENTO" id="bono_al" value="0" class="input-group-sm">
                                                            </label>
                                                        </section>
                                                        <section class="col col-1">
                                                            <label class="input" id="titu">BEV:
                                                                <input type="text" name="BEV"  id="bev" value="0" class="input-group-sm">
                                                            </label>
                                                        </section>
                                                        <section class="col col-1">
                                                            <label class="input" id="titu">Bono puesto:
                                                                <input type="text" name="ca_bono_puesto" value="0" id="bo_puesto" required="" class="input-group-sm">
                                                            </label>
                                                        </section>
                                                        <section class="col col-1">
                                                            <label class="input" id="titu">Sueldo Total:
                                                                <input type="text" name="TOTAL_SUELDO" value="0" id="sueldo_total"class="input-group-sm"  >
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="input" id="titu">Tipo Horas Pago:
                                                                <input type="text" name="TIPO_HORA_PAGO" value="0" class="input-group-sm">
                                                            </label>
                                                        </section>
                                                        <section class="col col-2" >
                                                            <%int cant_hijos = Integer.parseInt(request.getParameter("cant_hijos"));%>
                                                            <label class="input" id="titu">Asignanción Familiar:
                                                                <input type="text" name="ASIG_FAMILIAR" <%if (cant_hijos == 0) {%> value="0.0" <%} else {%> value="75.0" <%}%> id="asig_fa" class="input-group-sm">
                                                            </label>
                                                        </section>

                                                    </div>

                                                    <div class="row">
                                                        <section class="col col-1 ">
                                                            <label class="input" id="titu">Codigo APS: 
                                                                <%String co_aps = request.getParameter("co_ap");
                                                                    String co_hue = request.getParameter("co_hu");%>
                                                                <input type="text" maxlength="6" name="cod_aps" id="cod_ap" class="input-group-sm" <%if (!co_aps.equals("--")) {
                                                                        out.print("value='" + co_aps + "'");
                                                                    } else {
                                                                    }%> onblur="VAL_COD_APS()">
                                                            </label>
                                                        </section>
                                                        <section class="col col-1 ">
                                                            <label class="input" id="titu">Codigo Huella: 
                                                                <input type="text" maxlength="6" name="cod_hue" id="cod_hu" class="input-group-sm" <%if (!co_hue.equals("--")) {
                                                                        out.print("value='" + co_hue + "'");
                                                                    } else {
                                                                    }%> onblur="VAL_COD_HUELLA()">
                                                            </label>
                                                        </section>
                                                        <section class="col col-2" style=" margin-top:0.8%;">
                                                            <label class="toggle" id="titu" > MFL:
                                                                <input type="checkbox" value="0"   name="MFL" name="checkbox-toggle" onchange="mflcheck(this)" id="cb">
                                                                <i data-swchon-text="SI" data-swchoff-text="NO"></i>
                                                            </label>
                                                        </section>

                                                    </div>

                                                    <div class="row centro-costo_1" >
                                                        <!--<code class="ver"></code>-->
                                                        <section class="col col-3">
                                                            <label id="titu" class="centro-costo_1" >Centro de Costo Nº 1:</label>
                                                            <label class="select" id="titu">Dirección :
                                                                <select required="" class="cc-dir">
                                                                    <option value="">[DIRECCION]</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label></label>
                                                            <label class="select" id="titu"> Departamento :
                                                                <select required="" name="DEP" class="cc-dep">
                                                                    <option value="">[DEPARTAMENTO]</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label></label>
                                                            <label class="select" id="titu"> Centro de Costo :
                                                                <select name="CENTRO_COSTOS_1" class="centro_costo" required="">
                                                                    <option value="">[CENTRO COSTO]</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-1">
                                                            <label></label>
                                                            <label class="input" id="titu">%
                                                                <input name="PORCENTAJE_1"  type="text" value="100"  class="porcentaje_cc"/>
                                                            </label>
                                                        </section>
                                                        <section class="col col-1">
                                                            <label></label>
                                                            <label class="input" style="font-weight: bold;color:red;">% Total :
                                                                <input  readonly="" name="TOTAL_PORCENTAJE" max="100" min="100" maxlength="3" type="text" class="total_porcentaje"  />
                                                            </label>
                                                        </section>
                                                        <section class="col col-1">
                                                            <br>
                                                            <label  id="titu">Agregar:</label>
                                                            <br>
                                                            <label class="btn">
                                                                <!--<button type="button" class="btn btn-default btn-agregar-cc" id="btn-agregar-cc" >Agregar</button>-->
                                                                <a type="button" style="padding:9%; padding-right:20%; padding-left:20%;" id="btn-agregar-cc" class=" btn btn-default txt-color-green btn-agregar-cc"><i class="fa fa-plus fa-2x"></i></a>
                                                            </label>
                                                        </section>
                                                        <ul class="demo-btns">

                                                            <li>

                                                            </li>

                                                        </ul>
                                                        <input name="CANT" value="1" type="hidden" class="cant"/>
                                                    </div>
                                                </fieldset>
                                                <fieldset>
                                                    <div class="row">
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Regimen Laboral Mintra:
                                                                <select name="REG_LAB_MINTRA" class="input-group-sm" >
                                                                    <option value="">[Seleccione]</option>
                                                                    <%for (int q = 0; q < list_reg_labo.size(); q++) {
                                                                            Regimen_Laboral re = new Regimen_Laboral();
                                                                            re = (Regimen_Laboral) list_reg_labo.get(q);
                                                                    %>
                                                                    <option value="<%=re.getId_regimen_laboral()%>"><%=re.getDe_regimen_l()%></option>
                                                                    <%}%>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Modalidad:
                                                                <select name="MODALIDAD" class="input-group-sm" id="select_mod" >
                                                                    <option value="">[Seleccione]</option>
                                                                    <%for (int l = 0; l < List_modalidad.size(); l++) {
                                                                            Modalidad mo = new Modalidad();
                                                                            mo = (Modalidad) List_modalidad.get(l);

                                                                    %>
                                                                    <option value="<%=mo.getId_modalidad()%>"><%=mo.getDe_modalidad()%></option>
                                                                    <%}%>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">SUB-Modalidad:
                                                                <select name="SUB_MODALIDAD" class="input-group-sm" id="select-sub-mod" >
                                                                    <option value="">[Seleccione]</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Tipo Contratación:
                                                                <select name="REG_LAB_MINTRA" class="input-group-sm" >
                                                                    <option value="">[Seleccione]</option>
                                                                    <option value="I">INICIO</option>
                                                                    <option value="R">RENOVACION</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Codigo Grupo de Ocupaciones:
                                                                <select name="CO_GRUPO_OCU" class="input-group-sm" >
                                                                    <option value="">[Seleccione]</option>
                                                                    <%for (int gr = 0; gr < List_grup_ocu.size(); gr++) {
                                                                            Grupo_Ocupaciones g = new Grupo_Ocupaciones();
                                                                            g = (Grupo_Ocupaciones) List_grup_ocu.get(gr);
                                                                    %>
                                                                    <option value="<%=g.getId_grupo_ocupacion()%>"><%=g.getDe_grupo_ocupacion()%></option>
                                                                    <%}%>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <%String Fecha = request.getParameter("fe_subs");%>
                                                            <label class="input" id="titu">Fecha de Suscripción: 
                                                                <input id="suscripcion" type="date" name="FECHA_SUSCRIPCION"  class="input-group-sm"  value="<%=Fecha%>">
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Tipo de Moneda:
                                                                <select name="TIPO_MONEDA" class="input-group-sm" >
                                                                    <option value="">[Seleccione]</option>
                                                                    <option value="01" selected="">SOLES</option>
                                                                    <option value="02">DOLARES</option>
                                                                    <option value="03">EUROS</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Tipo Remuneracion Variable:
                                                                <select name="REM_VARIABLE" class="input-group-sm" >
                                                                    <option value="">[Seleccione]</option>
                                                                    <option value="1">DESTAJO</option>
                                                                    <option value="2">COMISIONES</option>
                                                                    <option value="3">NINGUNO</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Remuneración en Especie:
                                                                <select name="REM_ESPECIE" class="input-group-sm" >
                                                                    <option value="">[Seleccione]</option>
                                                                    <option value="1">SI</option>
                                                                    <option value="0">NO</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                    </div>
                                                </fieldset> 
                                                <fieldset>
                                                    <h6><label id="titu">Horas:</label></h6><br>
                                                    <div class="row" >
                                                        <section class="col col-2">
                                                            <label class="input" id="titu">Semanal:
                                                                <input type="text" name="HORAS_SEMANA" value="48" class="input-group-sm horasSemanales" required="">
                                                            </label>
                                                        </section>

                                                        <section class="col col-2">
                                                            <label class="input" id="titu">Mensual:
                                                                <input type="text" name="NRO_HORAS_LAB" value="192" class="input-group-sm horasMensuales" required="">
                                                            </label>
                                                        </section>

                                                        <section class="col col-2">
                                                            <label class="input" id="titu">Dias:
                                                                <input type="text" name="DIAS" value="8" class="input-group-sm" required="">
                                                            </label>
                                                        </section>
                                                    </div>
                                                </fieldset>
                                                <fieldset>
                                                    <div class="row">
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Tipo Trabajador.
                                                                <select name="TIPO_TRABAJADOR" class="input-group-sm" required="">
                                                                    <option value="">[Seleccione]</option>
                                                                    <option value="1" selected>Empleado</option>
                                                                    <option value="2">Obrero</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Regimen Laboral: 
                                                                <select name="REGIMEN_LABORAL" class="input-group-sm" required="">
                                                                    <option value="">[Seleccione]</option>
                                                                    <option value="1" selected>Privado</option>
                                                                    <option value="2" selected>Público</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu"> Discapacidad:
                                                                <select name="DISCAPACIDAD" class="input-group-sm" required="">
                                                                    <option value="">[SLECCIONE]</option>
                                                                    <option value="1" selected>No</option>
                                                                    <option value="2">Si</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Regimen Pensionario:
                                                                <select name="REGIMEN_PENSIONARIO" class="input-group-sm" required="">
                                                                    <option value="">[Seleccione]</option>
                                                                    <option value="1" selected>Privado</option>
                                                                    <option value="2">SNP</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Tipo Contrato:
                                                                <select name="TIPO_CONTRATO" class="input-group-sm ti_contrato" required="">
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">Tipo Convenio:
                                                                <select name="TIPO_CONVENIO" class="input-group-sm">
                                                                    <option value="">[Seleccione]</option>
                                                                    <option value="1">CLJ</option>
                                                                    <option value="2">PPP</option>
                                                                    <option value="3">PP</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                    </div>
                                                </fieldset>
                                                <fieldset>
                                                    <div class="">
                                                        <section class="col col-12">
                                                            <label class="textarea" id="titu">Observación:  </label>
                                                            <textarea  name="OBSERVACION"  class="input-group-sm " cols="35" rows="6"></textarea>
                                                        </section>
                                                    </div>
                                                </fieldset>
                                                <fieldset>
                                                    <div class="row">
                                                        <section class="col col-3">
                                                            <label class="select" id="titu">Filial donde Trabaja:
                                                                <select name="FILIAL" class="input-group-sm" required="">
                                                                    <option value="">[Seleccione]</option>
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
                                                            <label class="input" id="titu">RUC UPEU:
                                                                <input type="text" name="EMP_RUC" value="20138122256" maxlength="20" class="input-group-sm" required="">
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="input" id="titu">Cod. Sucursal:
                                                                <input type="text" name="SUCURSAL" value="-1" maxlength="3" class="input-group-sm" required="">
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="input" id="titu">MYPE:
                                                                <input type="text" name="MYPE" value="N"  maxlength="2" class="input-group-sm" required="">
                                                            </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label class="select" id="titu">Plantilla de Contrato:
                                                                <select name="id_plantilla_contractual" class="con_pl_pu input-group-sm" >
                                                                    <option value="">[Seleccione]</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <%String idtr = request.getParameter("idtr");%>
                                                    <input type="hidden" value="<%=idtr%>" name="IDDATOS_TRABAJADOR" class="text-box" >
                                                    <input type="hidden" name="ENTREGAR_DOC_REGLAMENTOS"  value="0" class="text-box" >
                                                    <input type="hidden" name="REGISTRO_HUELLA"  value="0" class="text-box" > 
                                                    <input type="hidden" name="REGISTRO_SISTEM_REMU" value="0" class="text-box" >
                                                    <input type="hidden" name="ESTADO" value="1" class="text-box" > 
                                                    <input type="hidden" value="ARE-0022" name="AREA_ID" class="text-box" >

                                                </fieldset>


                                            </div>


                                        </div>
                                        <!-- end widget content -->

                                    </div>
                                    <!-- end widget div -->

                                </div>
                                <!-- end widget -->

                            </article>
                            <!-- END COL -->




                            <article class="col-sm-12 col-md-12 col-lg-12 row">
                                <div id="presC" class="col-sm-12 col-md-12 col-lg-6">
                                </div>

                                <!-- Widget ID (each widget will need unique ID)-->
                                <div class="jarviswidget col-sm-12 col-md-12 col-lg-6" id="wid-id-1" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false" data-widget-deletebutton="false">
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

                                                            <select id="horario" required="" name="ID_TIPO_HORARIO">
                                                                <!-- function listar_tipo_horario-->
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
                                                                <select id=select_mier  >
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
                                                    <div class="input-desp">
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
                                                        <div class="h_total" style="color: red; font-weight: bold;">Horas Totales : 00:00 horas</div>
                                                        <input  readonly="" type="text" name="horas_totales" class="h_total horasTotales" required="" max="48"/>
                                                       <!-- <input  type="hidden" name="dep_actual" value="<%//=id_dep%>" class="dep_actual" />-->
                                                    </div>
                                                </fieldset>
                                                <footer>
                                                    <input  type="hidden" name="opc" value="REG_CASOS_ESP">
                                                    <button type="submit" id="submit" class="btn btn-primary" >
                                                        Siguiente
                                                    </button>
                                                    <button type="button" class="btn btn-default" onclick="window.history.back();">
                                                        Regresar
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

                        </div>

                </div>

            </form>

        </div>                                      
        <!-- Modal -->
        <div class="modal fade" id="solPresModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="solPresModalLabel">Solicitud de ampliación del presupuesto</h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-md-12">
                                <table  class="table table-striped">
                                    <tr><td class="td">Departamento:</td><td><label id="spdep">Mi mamà</label></td></tr>   
                                    <tr><td class="td">Àrea:</td><td><label id="spare">me mima</label></td></tr>   
                                    <tr><td class="td">Puesto:</td><td><label id="sppto">Mi mamà</label></td></tr>  
                                    <tr><td class="td">Temporada:</td><td><label id="sptem">me ama</label></td></tr>  
                                    <tr><td class="td">Requerimiento:</td><td><label id="spreq">Hola</label></td></tr>  
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="sntra"> Presupuesto por:</label>
                                        <div class="col-md-9">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <input class="form-control" type="text" min="1" id="sntra">
                                                        <span class="input-group-addon">trabajador(es)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="well well-sm well-primary">
                                    <div class="form-group">
                                        <textarea id="scom" class="form-control" placeholder="Motivo (Justificaciòn)" rows="5" required></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            Cancelar
                        </button>
                        <button type="button" id="spbtn" class="btn btn-primary">
                            Solicitar
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->



    </body>


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
    <!-- Voice command : plugin 
    <script src="../../js/speech/voicecommand.min.js"></script>-->

    <!-- PAGE RELATED PLUGIN(S) 
    <script src="..."></script>-->
    <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>
    <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
    <script src="../../js/Js_Formulario/Js_Form.js" type="text/javascript"></script>
    <script src="../../js/plugin/pfnotify/pnotify.custom.min.js" type="text/javascript"></script>
    <script src="../../js/businessLogic/Contrato/casosEspeciales.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
