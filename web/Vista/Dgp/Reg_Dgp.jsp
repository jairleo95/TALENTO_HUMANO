<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
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
<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>
<jsp:useBean id="Listar_Trabajador_id" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Requerimiento" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_Cuenta_Sueldo" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html >
<html>
    <head>


        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->
        <title> Registrar DGP </title>
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
        <link rel="stylesheet" media="screen" href="../../css/chosen.css"  type="text/css" > 
        <link href="../../css/jquery-ui.css" media="screen" rel="stylesheet" type="text/css"/>
        <style>
            .td{
                font-weight: bold;
            }
            #titu{
                font-weight: bold;
                color: #005cac;
                /* color: blue;*/
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
        </style>

        <%            HttpSession sesion = request.getSession(true);
            String id_dep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        %>
    </head>
    <body>   
        <div id="main" role="main" style="margin: 0px;">
            <div id="content">
                <section id="widget-grid" class="">
                    <div class="row">
                        <form id="checkout-form" class="formDGP" action="../../dgp"  novalidate="novalidate">
                            <!-- NEW COL START -->
                            <article class="col-sm-12 col-md-12 col-lg-6">
                                <div id="alerta_dgp">
                                </div>
                                <div class="alert_1">
                                </div>

                                <!-- Widget ID (each widget will need unique ID)-->
                                <div class="jarviswidget jarviswidget-color-white" id="wid-id-2"  data-widget-editbutton="false"
                                     data-widget-deletebutton="false" data-widget-custombutton="false">
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
                                        <h2 class="font-md"><strong>Registrar </strong> <i>Requerimientos</i></h2>
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

                                                <fieldset >

                                                    <%                                                        /*Temporal*/
                                                        String idreq = request.getParameter("idreq");
                                                        String id = "";
                                                        for (int i = 0; i < Listar_Trabajador_id.size(); i++) {
                                                            V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                                                            tr = (V_Ficha_Trab_Num_C) Listar_Trabajador_id.get(i);
                                                            id = tr.getId_trabajador();
                                                    %>
                                                    <input  type="hidden" class="idtr" value="<%=id%>"/>
                                                    <div class="row">

                                                        <input value= "<%=tr.getId_trabajador()%>"  type="hidden" id="" />
                                                        <section class="col col-6">
                                                            <label class="label" id="titu">Trabajador :</label>
                                                            <label class="input" style="color: red; font-weight: bold;">
                                                                <%=tr.getAp_paterno() + " " + tr.getAp_materno() + " " + tr.getNo_trabajador()%>
                                                                <input type="hidden" value="<%=tr.getId_trabajador()%>" name="IDDATOS_TRABAJADOR" class="id_tr input-xs">
                                                                <% }
                                                                    if (Listar_Trabajador_id.size() == 0) { %>   
                                                                <%}%>
                                                            </label>
                                                        </section>
                                                        <section  class="col col-6" style="display: none;">
                                                            <label class="select" id="titu">CARGAR DATOS
                                                                <select  class="btn-list-req" >
                                                                    <option value="" selected=""  >[Seleccione]</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <div class="row" >
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">
                                                                Motivo :<select name="MOTIVO" class="ant_policiales" required="" >
                                                                    <option value="" >[Seleccione]</option>
                                                                    <option value="1" selected="">Trabajador Nuevo</option>
                                                                    <option value="2">Renovación</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2" id="titu">MFL:
                                                            <label class="toggle"  > 
                                                                <input type="checkbox" value="1"   name="MFL"   >
                                                                <i data-swchon-text="SI" data-swchoff-text="NO"></i>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2" id="titu">Presupuestado:
                                                            <label class="toggle"  > 
                                                                <input type="checkbox" value="1"   name="ES_PRESUPUESTADO"   >
                                                                <i data-swchon-text="SI" data-swchoff-text="NO"></i>
                                                            </label>
                                                        </section>
                                                        <div class="div_input_diezmo col col-4">
                                                        </div>
                                                    </div>

                                                    <section style="display: none">
                                                        <label class="label" id="titu">Puesto | Seccion | Area:</label>
                                                        <label class="select">
                                                            <select name="PUESTO"   required="" class="chosen-select select-puesto1" >
                                                                <option value="">[Seleccione]</option>
                                                                <%
                                                                    for (int j = 0; j < List_Puesto.size(); j++) {
                                                                        V_Puesto_Direccion p = new V_Puesto_Direccion();
                                                                        p = (V_Puesto_Direccion) List_Puesto.get(j);
                                                                %>
                                                                <option value="<%=p.getId_puesto()%>">
                                                                    <% out.println(p.getNo_puesto() + " | " + p.getNo_seccion() + " | " + p.getNo_area());%>
                                                                </option>
                                                                <%} %>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <div class="aditionalFilters">
                                                    </div>
                                                    <div class="row">

                                                        <section class="col col-4" >
                                                            <label class="label" id="titu"> Area:</label>
                                                            <label class="select">
                                                                <select data-placeholder="Seleccionar Area"  class="select-area" required="" >
                                                                    <option value="">[Seleccione]</option>  
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-4">
                                                            <label class="label" id="titu"> Sección:</label>
                                                            <label class="select">
                                                                <select data-placeholder="Seleccionar Sección"  class="select-seccion" required="" >
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
                                                    <%if (idreq.equals("REQ-0007") || idreq.equals("REQ-0008") || idreq.equals("REQ-0009") || idreq.equals("REQ-0001") || idreq.equals("REQ-0002") || idreq.equals("REQ-0003") || idreq.equals("REQ-0005")) {%>
                                                    <div id="fila-agregar"> 
                                                        <div  class="row" id="centro-costo_1" >
                                                            <section class="col col-4">
                                                                <label class="select" id="titu">Centro de Costo Nº 1:
                                                                    <select name="CENTRO_COSTOS_1" class="select-cc centro_costo1" required="">
                                                                        <option value="">[Seleccione]</option>
                                                                    </select>
                                                                </label>
                                                            </section>
                                                            <section class="col col-2">
                                                                <label class="input" id="titu">%
                                                                    <input name="PORCENTAJE_1"  type="text" value="100"  class="porcentaje_cc"/>
                                                                </label>
                                                            </section>
                                                            <section class="col col-2">
                                                                <label class="input" style="font-weight: bold;color:red;">% Total :
                                                                    <input  readonly="" name="TOTAL_PORCENTAJE" max="100" min="100" maxlength="3" value="100" type="text" class="total_porcentaje"  />
                                                                </label>
                                                            </section>
                                                            <section class="col col-2">
                                                                <label class="btn">
                                                                    <button type="button"  class="btn btn-primary btn-circle btn-lg btn-agregar-cc" id="btn-agregar-cc">
                                                                        <i class="glyphicon glyphicon-plus"></i></button>
                                                                </label>
                                                            </section>

                                                        </div>
                                                        <input type="hidden" value="1" name="numero" class="cant-input" />
                                                    </div>
                                                    <%}%>
                                                    <section>
                                                        <label class="label" id="titu">Requerimiento :</label>
                                                        <label class="select">
                                                            <select name="IDREQUERIMIENTO"    disabled="" onchange="mostrar()"  id="nom_req"  > 
                                                                <option value=""></option>

                                                                <%
                                                                    for (int index = 0; index < Listar_Requerimiento.size(); index++) {
                                                                        Requerimiento r = new Requerimiento();
                                                                        r = (Requerimiento) Listar_Requerimiento.get(index);
                                                                        if (idreq.equals(r.getId_requerimiento())) {
                                                                %>
                                                                <option value="<%=r.getId_requerimiento()%>" selected=""  ><%=r.getNo_req()%></option>
                                                                <%} else {%>
                                                                <option value="<%=r.getId_requerimiento()%>"><%=r.getNo_req()%></option>                      
                                                                <%                          }
                                                                    }%>
                                                            </select> 
                                                        </label>
                                                    </section>

                                                    <div class="info_1">
                                                    </div>
                                                    <div class="row">
                                                        <section class="col col-6" >
                                                            <label class="input" id="titu">Fecha de Inicio :
                                                                <input type="text" name="FEC_DESDE"  required="" class="feInicioDgp frompicker" data-mask="99/99/9999" data-mask-placeholder= "_"  >
                                                            </label>
                                                        </section>
                                                        <section class="col col-6">
                                                            <label class="input"  id="titu">Fecha de Cese :

                                                                <input type="text" name="FEC_HASTA"  required=""  value="" class="topicker" data-mask="99/99/9999" data-mask-placeholder= "_">

                                                            </label>
                                                        </section>
                                                    </div>
                                                    <%if (idreq.equals("REQ-0008")) {
                                                    %>
                                                    <%String es_cue_sue = request.getParameter("es_cs");%>
                                                    <input type="hidden" name="ESTADO" value="<%=es_cue_sue%>">
                                                    <%if (es_cue_sue.equals("0")) {%>
                                                    <input type="hidden" name="ES_CUENTA_SUELDO" value="1" >
                                                    <section class="col col-3" >
                                                        <label class="select" id="titu">Cta Sueldo - Banco:
                                                            <select name="BANCO" id="banco" required="">
                                                                <option value="" selected="" disabled="" >[Seleccione]</option>
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
                                            <%

                                                for (int i = 0; i < list_Cuenta_Sueldo.size(); i++) {
                                                    Cuenta_Sueldo cs = new Cuenta_Sueldo();
                                                    cs = (Cuenta_Sueldo) list_Cuenta_Sueldo.get(i);
                                            %>

                                            <div class="row"> 
                                                <section class="col col-3">
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
                                                <%}
                                                    if (cs.getNu_cuenta() != null) {%>
                                                <section class="col col-4">
                                                    <label class="input" id="titu">Nro Cuenta :
                                                        <input type="text" disabled="" value="<%=cs.getNu_cuenta()%>"   />
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
                                                    if (cs.getNo_banco().trim().equals("0")) {%>
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
                                                <%}
                                                %>
                                            </div>
                                            <%}
                                                }%>
                                            <%}%>
                                            <div class="row">
                                                <section class="col col-3" >
                                                    <label class="input" id="titu">Sueldo :
                                                        <input type="text" name="SUELDO" required="" maxlength="13" value=""  id="sueldo" >
                                                    </label>
                                                </section>
                                                <%if (idreq.equals("REQ-0001") || idreq.equals("REQ-0002") || idreq.equals("REQ-0003") || idreq.equals("REQ-0005")) {

                                                %> 
                                                <section class="col col-3">
                                                    <label class="input"  id="titu"> 
                                                        Bono de Alimentos :<input type="text" maxlength="13"  value="0.0" name="BONO_ALIMENTARIO"  id="bono_al">
                                                    </label>
                                                </section>
                                                <section class="col col-3">
                                                    <label class="input"  id="titu"> 
                                                        Bono por Funci&oacute;n :<input type="text" maxlength="13"  value="0.0" name="BONO_PUESTO"  id="bono_pu">
                                                    </label>
                                                </section>
                                                <section class="col col-3">
                                                    <label class="input"  id="titu"> 
                                                        BEV :<input type="text" name="BEV" maxlength="13" value="0.0" id="bev">
                                                    </label>
                                                </section>

                                            </div>
                                            <div  class="row" >
                                                <%if (Integer.parseInt(request.getParameter("as_f")) > 0) {%>
                                                <section class="col col-3">
                                                    <label class="input"  id="titu"> 
                                                        Asig Familiar :<input readonly="readonly" type="text" name="ASIGNACION_FAMILIAR" maxlength="13" value="85.0" id="asigf">
                                                    </label>
                                                </section>
                                                <%}%>
                                                <section class="col col-3">
                                                    <div class="input"  id="titu"> 
                                                        <label>Total Remunerativo :</label><br><label id="suel_total" style="color: red;">0.0</label>
                                                    </div>
                                                </section>
                                                <section class="col col-3">
                                                    <label class="select" id="titu">
                                                        Antecedentes Policiales :<select name="ANTECEDENTES_POLICIALES" class="ant_policiales" >
                                                            <option value="" >[Seleccione]</option>
                                                            <option value="1" selected="">No</option>
                                                            <option value="2">Si</option>
                                                        </select>
                                                    </label>

                                                </section>
                                                <section class="col col-3">

                                                    <label class="select" id="titu">
                                                        Certificado de Salud: 
                                                        <select name="CERTIFICADO_SALUD" required=""  class="essalud">
                                                            <option value="">[Seleccione]</option>
                                                            <option value="1">Si</option>
                                                            <option selected="" value="0">No</option>
                                                        </select>
                                                    </label>
                                                </section>


                                            </div>
                                            <%String es_cue_sue = request.getParameter("es_cs");%>
                                            <input type="hidden" name="ESTADO" value="<%=es_cue_sue%>">
                                            <%if (es_cue_sue.equals("0")) {%>

                                            <input type="hidden" name="ES_CUENTA_SUELDO" value="1" />
                                            <div class="row"> 
                                                <section class="col col-3" >
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

                                            <%
                                                for (int i = 0; i < list_Cuenta_Sueldo.size(); i++) {
                                                    Cuenta_Sueldo cs = new Cuenta_Sueldo();
                                                    cs = (Cuenta_Sueldo) list_Cuenta_Sueldo.get(i);

                                            %>
                                            <div class="row"> 

                                                <section class="col col-3"  >
                                                    <label class="select" id="titu" >Cta Sueldo - Banco:

                                                        <select name="BANCO"  required="" disabled="">
                                                            <%if (cs.getNo_banco() != null) {%>
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
                                                            <%} else {%>
                                                            <option>Ninguno</option>
                                                            <%}%>
                                                        </select>

                                                    </label>
                                                </section>
                                                <%if (cs.getNo_banco_otros() != null) {%>
                                                <section class="col col-3">
                                                    <label class="input" id="titu">Nombre Banco :
                                                        <input type="text" disabled="" value="<%=cs.getNo_banco_otros()%>"   />
                                                    </label>
                                                </section>
                                                <%}
                                                    if (cs.getNu_cuenta() != null) {%>
                                                <section class="col col-4">
                                                    <label class="input" id="titu">Nro Cuenta :
                                                        <input type="text" disabled="" value="<%=cs.getNu_cuenta()%>"   />
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
                                                    if (cs.getNo_banco().trim().equals("0")) {%>
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
                                                <%}
                                                %>
                                            </div>
                                            <%}
                                                }%>
                                            <%}%>
                                            <%if (idreq.equals("REQ-0010")) {%>  

                                            <section class="col col-4" >
                                                <label class="input" id="titu"> RUC:
                                                    <input type="text" name="RUC"  maxlength="20" required="" >
                                                </label>

                                            </section>

                                            <section class="col col-4" >
                                                <label class="input" id="titu"> Domicilio Fiscal:
                                                    <input type="text" name="DOMICILIO_FISCAL"  required="" >
                                                </label>
                                            </section>

                                            <%}%>
                                            <%if (idreq.equals("REQ-0010") || idreq.equals("REQ-0011")) {%>
                                            <section class="col col-4" >
                                                <label class="input" id="titu"> Lugar de Servicio:
                                                    <input type="text" name="LUGAR_SERVICIO"  required="" maxlength="50" >
                                                </label>
                                            </section>

                                        </div>
                                        <div class="row" >
                                            <section class="col col-lg-12" >
                                                <label class="textarea" id="titu" >Descripcion del Servicio 										
                                                    <textarea rows=4 name="DESCRIPCION_SERVICIO" maxlength="300"></textarea> 
                                                </label>
                                            </section>
                                        </div>
                                        <div class="agregar_cuota">
                                            <div class="row pago_cuotas_1">
                                                <section class="col col-3" >
                                                    <label class="input" id="titu"> CUOTA:
                                                        <input type="number" name="CUOTA_1" id="cuota" required="" value="1"  min="1"  >
                                                    </label>
                                                </section>
                                                <section class="col col-3" >
                                                    <label class="input" id="titu">Fecha a Pagar :
                                                        <input type="date" name="FEC_PAGAR_1" id="datepicker" required="" >
                                                    </label>
                                                </section>
                                                <section class="col col-3" >
                                                    <label class="input" id="titu">Monto :
                                                        <input type="text" name="MONTO_1" required=""  value="0.0"  class="monto" >
                                                    </label>
                                                </section>
                                                <input type="hidden" value="1" name="ES_PERIODO" />
                                                <input type="hidden" value="1" name="CANT" class="cant" />
                                                <section class="col col-3">
                                                    <button type="button" class="btn btn-primary btn-circle btn-lg" id="btn_add"><i class="glyphicon glyphicon-plus"></i></button>
                                                </section>

                                            </div>

                                        </div>
                                        <%}%>
                                        <input type="hidden" name="IDREQUERIMIENTO"  id="combito"  value="<%=idreq%>">
                                        <div id="div_2" class="contenido" style="display: none">
                                            <table  class="table1">
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
                                <div class="jarviswidget jarviswidget-color-white" id="wid-id-1" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false" data-widget-deletebutton="false">
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
                                        <h2 class="font-md"><strong>Registrar </strong> <i>Horario</i></h2>
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
                                            <div class="contheader"></div>
                                            <div class="contDias"></div>
                                            <div><fieldset class="cDia"></fieldset></div>
                                            <div class="hTotal" id="htotal"></div>
                                            <br>
                                            <div id="myModalEdit" class="modal fade" role="document">
                                                <input  type="hidden" name="dep_actual" value="<%=id_dep%>" class="dep_actual" />
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Guardar Horario</h4>
                                                        </div>

                                                        <div class="modal-body">

                                                            <div class="row">
                                                                <section class="col col-xs-12 smart-form">
                                                                    <label class="label">Nombre</label>
                                                                    <label class=" input">
                                                                        <input type="text" name="NOMBRE" class="form-control modNombre" placeholder="Nombre de Horario" >
                                                                    </label>
                                                                </section> 
                                                            </div>

                                                        </div>

                                                        <div class="modal-footer">
                                                            <input type="hidden" id="modId" value="">
                                                            <button type="button" class="btn btn-primary modAceptar" data-dismiss="modal">Aceptar</button>
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                            <div class="logs"></div>

                                            <div class="smart-form" >

                                                <footer>
                                                    <div class="div_info">

                                                    </div>
                                                    <button type="button" class="btn btn-primary btn-labeled btnSig">
                                                        Siguiente  <i class="fa fa-arrow-circle-right"></i>
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
                            <input type="hidden" name="opc"  class="submit" value="Registrar">
                        </form>
                    </div>
                </section>

            </div>
        </div>
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
    <!-- JS TOUCH : include this plugin for mobile drag / drop touch events
    <script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->
    <!-- BOOTSTRAP JS -->
    <script src="../../js/bootstrap/bootstrap.min.js"></script>
    <!-- CUSTOM NOTIFICATION -->
    <script src="../../js/notification/SmartNotification.min.js"></script>

    <!-- JARVIS WIDGETS 
    <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>-->

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

    <!-- JQUERY UI -->
    <script src="../../js/jquery-ui.js" type="text/javascript"></script>
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
    <!-- Voice command : plugin 
    <script src="../../js/speech/voicecommand.min.js"></script>-->
    <!-- PAGE RELATED PLUGIN(S) -->
    <script src="../../js/plugin/bootstrap-timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
    <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>
    <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
    <script src="../../js/chosen.jquery.js" type="text/javascript"></script>

    <!-- BUSINESS LOGIC PLUGINS-->
    <script src="../../js/Js_Formulario/Js_Form.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    <script src="../../js/Js_DGP/Registrar/Reg_Dgps.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript" ></script>
    <script src="../../js/Js_Horario/horario.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    <script src="../../js/Js_Plazo/Js_plazo_advertencia.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>    
    <script src="../../js/Js_Centro_Costo/Functions/Js_centro_costo.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>


</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
