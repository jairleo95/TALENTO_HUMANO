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

<jsp:useBean id="List_Anno" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Direccion" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="LIST_ID_DGP" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="ASIGNACION_F" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_anno_max" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_modalidad" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="list_reg_labo" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_centro_costo" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_grup_ocu" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title>Registrar Contrato</title>

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/font-awesome.min.css">
        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../HTML_version/img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../HTML_version/img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../HTML_version/img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../HTML_version/img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../HTML_version/img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../HTML_version/img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../HTML_version/img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../HTML_version/img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../HTML_version/img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <% HttpSession sesion = request.getSession(true);
            String iduser = (String) sesion.getAttribute("IDUSER");
            String id_rol = (String) session.getAttribute("IDROL");%>
        <link rel="stylesheet" type="text/css"  href="../../css/Css_Formulario/form.css">
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

                    <%
                        for (int u = 0; u < LIST_ID_DGP.size(); u++) {
                            V_Det_DGP d = new V_Det_DGP();
                            d = (V_Det_DGP) LIST_ID_DGP.get(u);

                            if (d.getId_dgp() == null) {
                    %>

                    <label>Todavia no se ha almacenado El DGP,¿desea contratar sin  antes elaborar un DGP?</label>  
                    <br>
                    <a href="Reg_Contrato.php?hac_cont=1&idtr=<? echo $idtr;?>">Hacer Contrato de Todas Maneras</a>

                    <%} else {%>

                    <form action="../../contrato" id="Reg_con" class="smart-form" >
                        <fieldset id="fila-agregar">
                            <div class="row" >
                                <input type="hidden" name="id_rol_ses" id="id_rol_s" value="<%=id_rol%>">
                                <input type="hidden" name="TIPO_PLANILLA"  value="<%=d.getId_tipo_planilla()%>">
                                <input type="hidden" name="HORARIO"  value="<%=d.getId_detalle_horario()%>">
                                <section class="col col-2">
                                    <label class="select" id="titulo">Año:
                                        <select name="AÑO_ID" required="" class="input-group-sm">
                                            <%  for (int i = 0; i < List_Anno.size(); i++) {
                                                    Anno a = new Anno();
                                                    for (int e = 0; e < List_anno_max.size(); e++) {
                                                        Anno w = new Anno();
                                                        w = (Anno) List_anno_max.get(e);
                                                        a = (Anno) List_Anno.get(i);%>
                                            <%if (a.getId_anno().trim() != w.getId_anno().trim() && a.getId_anno().equals("")) {%>
                                            <option value="<%=a.getId_anno()%>" selected="selected"><%=a.getNo_anno()%></option>
                                            <%} else {%>
                                            <option value="<%=w.getId_anno()%>"><%=w.getNo_anno()%></option>
                                            <%}
                                                    }
                                                }%>
                                        </select>  </label>
                                </section  >
                                <input type="hidden" name="IDDETALLE_DGP" value="<%=d.getId_dgp()%>" class="text-box" id="id_dgp" >
                                <section class="col col-2">
                                    <label class="input" id="titulo">Desde: 
                                        <input type="date" name="FEC_DESDE" value="<%=d.getFe_desde()%>" class="date input-group-sm" required="">
                                    </label>
                                </section>
                                <section class="col col-2">
                                    <label class="input" id="titulo">Hasta: 
                                        <input type="date" name="FEC_HASTA" value="<%=d.getFe_hasta()%>" class="input-group-sm" required="">
                                    </label>
                                </section>
                                <section class="col col-3" id="titulo">
                                    <label class="select" id="titulo">Dirección:
                                        <select name="DIRECCION" class="input-group-sm" id="select_dir">


                                            <option value="">[SELECCIONE]</option>
                                            <%for (int g = 0; g < Listar_Direccion.size(); g++) {
                                                    Direccion di = new Direccion();
                                                    di = (Direccion) Listar_Direccion.get(g);
                                            %>
                                            <option value="<%=di.getId_direccion()%>"><%=di.getNo_direccion()%></option>

                                            <%}%>
                                        </select>  </label>
                                </section>
                                <section class="col col-3" id="titulo">
                                    <label class="select" id="titulo">Departamento:
                                        <select name="DEPARTAMENTO_ID" class="input-group-sm" id="selec_dep">
                                            <option value="">[SELECCIONE]</option>
                                        </select>  </label>
                                </section>
                                <section class="col col-3" id="titulo">
                                    <label class="select" id="titulo">Area:
                                        <select name="AREA_ID" class="input-group-sm" id="Selec_Area">
                                            <option value="">[SELECCIONE]</option>
                                        </select>  </label>
                                </section>
                                <section class="col col-3" id="titulo">
                                    <label class="select" id="titulo">Sección:
                                        <select name="SECCION_ID" class="input-group-sm" id="select_sec">
                                            <option value="">[SELECCIONE]</option>
                                        </select>  </label>
                                </section>
                                <section class="col col-3" id="titulo">
                                    <label class="select" id="titulo">Puesto:
                                        <select name="PUESTO_ID" required="" class="input-group-sm" id="pu_id_se">
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
                                <section class="col col-3">
                                    <label class="select" id="titulo">Condición:
                                        <select name="CONDICION" class="input-group-sm" required="">
                                            <option value="">[SELECCIONE]</option>
                                            <option value="1">Contratado</option>
                                            <option value="2">Contratado Independiente</option>
                                            <option value="3">Enpleado</option>
                                            <option value="4">Misionero</option>
                                            <option value="5">MFL-Práctica Pre-Profesional</option>
                                            <option value="6">MFL-Práctica Profesionales</option>
                                            <option value="7">MFL-CLJ</option>
                                            <option value="8">MFL-Contrato</option>
                                        </select>
                                    </label>
                                </section>

                            </div>

                            <div class="row">

                                <section class="col col-2">
                                    <label class="input" id="titulo">Remuneración:
                                        <input type="text" name="SUELDO" value="<%=d.getCa_sueldo()%>" class="input-group-sm">
                                    </label>
                                </section>
                                <section class="col col-1">
                                    <label class="input" id="titulo">Reintegro:
                                        <input type="text" name="REINTEGRO" value="0" class="input-group-sm">
                                    </label>
                                </section>
                                <section class="col col-2">
                                    <label class="input" id="titulo">Bono Alimentario:
                                        <input type="text" name="BONO_ALIMENTO" value="<%=d.getCa_bono_alimentario()%>" class="input-group-sm">
                                    </label>
                                </section>
                                <section class="col col-1">
                                    <label class="input" id="titulo">BEV:
                                        <input type="text" name="BEV" value="<%=d.getDe_bev()%>" class="input-group-sm">
                                    </label>
                                </section>

                                <section class="col col-2">
                                    <label class="input" id="titulo">Sueldo Total:
                                        <input type="text" name="TOTAL_SUELDO" value="<%=d.getCa_bono_alimentario() + d.getCa_sueldo() + d.getDe_bev()%>" class="input-group-sm">
                                    </label>
                                </section>
                                <section class="col col-2">
                                    <label class="input" id="titulo">Tipo Horas Pago:
                                        <input type="text" name="TIPO_HORA_PAGO" value="0" class="input-group-sm">
                                    </label>
                                </section>
                                <%int total = Integer.parseInt(request.getParameter("num")); %>
                                <section class="col col-2" >
                                    <label class="input" id="titulo">Asignanción Familiar:
                                        <input type="text" name="ASIG_FAMILIAR" <%if (total == 0) {%>value="0" <%} else {%> value="75.0" <%}%> class="input-group-sm">
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

                        <fieldset>
                            <div class="row">
                                <section class="col col-4">
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
                                <section class="col col-4">
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
                                <section class="col col-4">
                                    <label class="select" id="titulo">SUB-Modalidad:
                                        <select name="SUB_MODALIDAD" class="input-group-sm" id="select-sub-mod" required="">
                                            <option value="">[SELECCIONE]</option>
                                        </select>
                                    </label>
                                </section>
                                <section class="col col-4">
                                    <label class="select" id="titulo">Tipo Contratación:
                                        <select name="REG_LAB_MINTRA" class="input-group-sm" required="">
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
                                            %>
                                            <option value="<%=g.getId_grupo_ocupacion()%>"><%=g.getDe_grupo_ocupacion()%></option>
                                            <%}%>
                                        </select>
                                    </label>
                                </section>
                                <section class="col col-4">
                                    <label class="input" id="titulo">Fecha de Suscripción: 
                                        <input type="date" name="FECHA_SUSCRIPCION" placeholder="" class="input-group-sm" required="">
                                    </label>
                                </section>
                                <section class="col col-4">
                                    <label class="select" id="titulo">Tipo de Modeda:
                                        <select name="TIPO_MONEDA" class="input-group-sm" required="">
                                            <option value="">[SELECCIONE]</option>
                                            <option value="01">SOLES</option>
                                            <option value="02">DOLARES</option>
                                            <option value="03">EUROS</option>
                                        </select>
                                    </label>
                                </section>
                                <section class="col col-4">
                                    <label class="select" id="titulo">Tipo Remuneracion Variable:
                                        <select name="REM_VARIABLE" class="input-group-sm" required="">
                                            <option value="">[SELECCIONE]</option>
                                            <option value="1">DESTAJO</option>
                                            <option value="2">COMISIONES</option>
                                            <option value="3">NINGUNO</option>
                                        </select>
                                    </label>
                                </section>
                                <section class="col col-4">
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
                                        <select name="TIPO_CONVENIO" class="input-group-sm" required="">
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
                            <div class="">
                                <section class="col col-12">
                                    <label class="textarea" id="titulo">Observación:  </label>
                                    <textarea  name="OBSERVACION"  class="input-group-sm " cols="35" rows="6"></textarea>
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
                            </div>
                            <input type="hidden" name="ENTREGAR_DOC_REGLAMENTOS"  value="0" class="text-box" >
                            <input type="hidden" name="REGISTRO_HUELLA"  value="0" class="text-box" > 
                            <input type="hidden" name="REGISTRO_SISTEM_REMU" value="0" class="text-box" >
                            <input type="hidden" name="ESTADO" value="1" class="text-box" > 
                            <input type="hidden" value="<%=d.getId_trabajador()%>" name="IDDATOS_TRABAJADOR" class="text-box" >
                            <input type="hidden" value="ARE-0022" name="AREA_ID" class="text-box" >

                        </fieldset>




                        <footer>

                            <input type="hidden" name="opc"   value="REGISTRAR CONTRATO">
                            <button type="submit" id="submit" class="btn btn-primary">
                                REGISTRAR CONTRATO
                            </button>
                            <a type="button" class="btn btn-success" href="../../horario?iddgp=<%=d.getId_dgp()%>&opc=Listar">Ver Horario</a>
                            <a type="button" class="btn btn-success" href="../../documento?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=Ver_Documento">Ver Documentos</a>
                        </footer>


                    </form>
                    <table>
                        <tbody class="tbodys">
                        </tbody>
                    </table>
                    <%}
                        }%>
                </div>
                <!-- end widget content -->

            </div>
            <!-- end widget div -->

        </div>
        <button  data-toggle="modal" data-target="#myModal" id="btn-mostrar" hidden="">
            Launch demo modal
        </button>

        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../HTML_version/js/plugin/pace/pace.min.js"></script>

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
        <script src="../../HTML_version/js/app.config.js"></script>

        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
        <script src="../../HTML_version/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

        <!-- BOOTSTRAP JS -->
        <script src="../../HTML_version/js/bootstrap/bootstrap.min.js"></script>

        <!-- CUSTOM NOTIFICATION -->
        <script src="../../HTML_version/js/notification/SmartNotification.min.js"></script>

        <!-- JARVIS WIDGETS -->
        <script src="../../HTML_version/js/smartwidgets/jarvis.widget.min.js"></script>

        <!-- EASY PIE CHARTS -->
        <script src="../../HTML_version/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!-- SPARKLINES -->
        <script src="../../HTML_version/js/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="../../HTML_version/js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="../../HTML_version/js/plugin/masked-input/jquery.maskedinput.min.js"></script>

        <!-- JQUERY SELECT2 INPUT -->
        <script src="../../HTML_version/js/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="../../HTML_version/js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="../../HTML_version/js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="../../HTML_version/js/plugin/fastclick/fastclick.min.js"></script>

        <!--[if IE 8]>

        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

        <![endif]-->

        <!-- Demo purpose only -->
        <script src="../../HTML_version/js/demo.min.js"></script>

        <!-- MAIN APP JS FILE -->
        <script src="../../HTML_version/js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="../../HTML_version/js/speech/voicecommand.min.js"></script>

        <!-- PAGE RELATED PLUGIN(S) -->
        <script src="../../HTML_version/js/plugin/jquery-form/jquery-form.min.js"></script>


        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!

            $(document).ready(function () {

                pageSetUp();

                var $checkoutForm = $('#checkout-form').validate({
                    // Rules for form validation
                    rules: {
                        fname: {
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
                    errorPlacement: function (error, element) {
                        error.insertAfter(element.parent());
                    }
                });

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
                    errorPlacement: function (error, element) {
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
                    errorPlacement: function (error, element) {
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
                    submitHandler: function (form) {
                        $(form).ajaxSubmit({
                            success: function () {
                                $("#comment-form").addClass('submited');
                            }
                        });
                    },
                    // Do not change code below
                    errorPlacement: function (error, element) {
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
                    submitHandler: function (form) {
                        $(form).ajaxSubmit({
                            success: function () {
                                $("#contact-form").addClass('submited');
                            }
                        });
                    },
                    // Do not change code below
                    errorPlacement: function (error, element) {
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
                    errorPlacement: function (error, element) {
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
                    errorPlacement: function (error, element) {
                        error.insertAfter(element.parent());
                    }
                });

                // START AND FINISH DATE
                $('#startdate').datepicker({
                    dateFormat: 'dd.mm.yy',
                    prevText: '<i class="fa fa-chevron-left"></i>',
                    nextText: '<i class="fa fa-chevron-right"></i>',
                    onSelect: function (selectedDate) {
                        $('#finishdate').datepicker('option', 'minDate', selectedDate);
                    }
                });

                $('#finishdate').datepicker({
                    dateFormat: 'dd.mm.yy',
                    prevText: '<i class="fa fa-chevron-left"></i>',
                    nextText: '<i class="fa fa-chevron-right"></i>',
                    onSelect: function (selectedDate) {
                        $('#startdate').datepicker('option', 'maxDate', selectedDate);
                    }
                });



            });

        </script>

        <!-- Your GOOGLE ANALYTICS CODE Below -->
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
            _gaq.push(['_trackPageview']);

            (function () {
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
            $(document).ready(function () {
                Listar_dep();
                Listar_centro_costo();
                var a = $("#select-sub-mod");
                var c = $("#Selec_Area");
                var d = $("#select_sec");
                var b = $("#selec_dep");
                var e = $("#pu_id_se");
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
                function Listar_dep() {
                    var s = $("#selec_dep");

                    $.post("../../Direccion_Puesto", "opc=Listar", function (objJson) {
                        s.empty();
                        var lista = objJson.lista;
                        s.append("<option value='' > [SELECCIONE] </option>");
                        for (var j = 0; j < lista.length; j++) {
                            s.append("<option value='" + lista[j].id + "' > " + lista[j].nom + "</option>");
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
                            if ($("#id_rol_s").val() == 'ROL-0001') {
                                x.append('</label><section class="col col-5"><label class="select" id="titulo"> Centro costo Nº ' + numero + '<select name="select_cent_c_' + i + '" required="" class="input-group-sm"><option value="' + lista[i].id_det_ce + '">' + lista[i].nombre + '</option></select></label></section><div class="form-group"><button type="button" class="btn btn-primary" id="Seleccionar_centro" >Buscar</button></div>');
                            } else {
                                x.append('</label><section class="col col-5"><label class="select" id="titulo"> Centro costo Nº ' + numero + '<select name="select_cent_c_' + i + '" required="" class="input-group-sm"><option value="' + lista[i].id_det_ce + '">' + lista[i].nombre + '</option></select></label></section>');
                            }
                        }
                        x.append('</div><table><tr><td><td><input type="hidden" name="can_centro_cos" value="' + lista.length + '"></td></tr></table>');

                    });

                }

            });
    </script>
</html>
