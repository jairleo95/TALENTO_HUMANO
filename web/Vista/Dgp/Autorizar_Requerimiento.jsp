
<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.dao.AutorizacionDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.dao.DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDgpDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO"%>
<%@page import="pe.edu.upeu.application.model.V_Autorizar_Dgp"%>
<jsp:useBean id="List_id_Autorizacion" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Autorización</title>
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
        <link href="../../css/your_style.css" rel="stylesheet" type="text/css"/>
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

        <link href="../../css/Css_Bootstrap/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        <link href="../../css/businessLogic/Dgp/autorizarRequerimiento.css" rel="stylesheet" type="text/css"/>
    </head>
    <%
        int t = List_id_Autorizacion.size();
    %>
    <%if (request.getParameter("r") != null) {
            if (request.getParameter("r").equals("ok")) {
    %>
    <body onload='exito("Procesado con exito!", "Usted ha realizado una autorización correctamente.");
            nobackbutton();' class="body">
        <%
                }
            }%>
        <%if (request.getParameter("m") != null) {
                if (request.getParameter("m").equals("si")) {
        %>

    <body onload='exito("Procesado con exito!", "Codigo APS ingresado correctamente");
            nobackbutton();' class="body">
        <%
                }
            }%>
        <%if (request.getParameter("h") != null) {
                if (request.getParameter("h").equals("si")) {
        %>

    <body onload='exito("Procesado con exito!", "Codigo huella ingresado correctamente");
            nobackbutton();' class="body">
        <%
            }
        } else {
        %>
    <body class="" onload="nobackbutton();">
        <%}%> 

        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">
                <!-- widget grid -->
                <section id="widget-grid" class="slideInDown fast animated" >


                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                            <div id="alerta_dgp">

                            </div>


                            <!-- Widget ID (each widget will need unique ID)->
                            <div class="jarviswidget jarviswidget-color-red" id="wid-id-2" data-widget-editbutton="false"  data-widget-deletebutton="false"                          data-widget-fullscreenbutton="false" >
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
                            <div class="jarviswidget jarviswidget-color-white" id="wid-id-2"   data-widget-editbutton="false"  data-widget-deletebutton="false"  >
                                <header class="headerReqAutorizado">
                                    <span class="widget-icon"> <i class="glyphicon glyphicon-inbox"></i> </span>
                                    <h2 class="font-md"><strong>Requerimientos por </strong> <i>Autorizar</i></h2>
                                    <div class="widget-toolbar">
                                        <span class="statusBarAut"></span>
                                        <span class="jarviswidget" ><i class="fa fa-refreshs fa-spin"></i></span>
                                    </div> 
                                    <ul id="widget-tab-1" class="nav nav-tabs pull-right">
                                        <li class="active">
                                            <a data-toggle="tab" href="#hr1"> <i class="fa fa-lg fa-arrow-circle-o-down"></i> 
                                                <span class="hidden-mobile hidden-tablet"> DGP </span> </a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#hr2"> <i class="fa fa-lg fa-arrow-circle-o-up"></i>
                                                <span class="hidden-mobile hidden-tablet"> Carga académica</span>
                                                <sup class="badge bg-color-red bounceIn animated badgeAutCAcademico" style="display: none" >0</sup></a>
                                        </li>

                                    </ul>
                                </header>
                                <!-- widget div-->
                                <div>
                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->
                                        <%
                                            InterfaceAutorizacionDAO aupl = new AutorizacionDAO();
                                            HttpSession sesion_1 = request.getSession(true);
                                            String idrol = (String) sesion_1.getAttribute("IDROL");
                                            String dep = (String) sesion_1.getAttribute("DEPARTAMENTO_ID");%>
                                    </div>
                                    <!-- end widget edit box -->
                                    <!-- widget content -->
                                    <div class="widget-body no-padding">
                                        <div class="tab-content padding-10">
                                            <div class="tab-pane fade in active" id="hr1">
                                                <table id="dt_basic1" class="table table-striped table-bordered table-hover" width="100%">
                                                    <thead>
                                                        <%if (idrol.trim().equals("ROL-0007") | idrol.trim().equals("ROL-0001")) {%>
                                                        <tr>
                                                            <th class='hasinput' colspan='14' style='width:95%' ></th>
                                                            <th class='hasinput'>
                                                    <center>
                                                        <button   rel="tooltip" data-placement="left" data-original-title="Autorizar y Procesar codigo de huella digital" 
                                                                  class='btn btn-warning btn-circle btn-sm  btn_cod_huella'>
                                                            <i class='glyphicon glyphicon-ok'></i></button></center>
                                                    </th>
                                                    </tr>
                                                    <%}%>
                                                    <%if (idrol.trim().equals("ROL-0009")) {%>
                                                    <tr>
                                                        <th class='hasinput' colspan='14' style='width:95%' ></th>
                                                        <th class='hasinput'  style='' >
                                                            <button   rel="tooltip" data-placement="left" data-original-title="Autorizar y Procesar código aps"
                                                                      class='btn bg-color-magenta txt-color-white btn-circle btn-sm  btn_cod_aps'>
                                                                <i class='glyphicon glyphicon-ok'></i></button>
                                                        </th>
                                                    </tr>

                                                    <%}%>
                                                    <%if (idrol.trim().equals("ROL-0006")) {
                                                    %>
                                                    <tr>
                                                        <th class='hasinput' colspan='15' style='width:95%' ></th>
                                                        <th class='hasinput'>
                                                            <button   disabled="" rel="tooltip" data-placement="top" data-original-title="Procesar Firmas"  class='btn btn-primary btn-circle btn-sm btn_pro_firma'>
                                                                <i class='glyphicon glyphicon-ok'></i></button>
                                                        </th>
                                                        <th class='hasinput' >
                                                            <button  disabled="" rel="tooltip" data-placement="top" data-original-title="Procesar a remuneraciones"  class='btn btn-default btn-circle btn-sm btn_pro_remuneracion'>
                                                                <i class='glyphicon glyphicon-ok'></i></button>
                                                        </th>
                                                        <th class='hasinput'  style='' >
                                                            <button  disabled=""  rel="tooltip" data-placement="top" data-original-title="Procesar a Firmas y Envio a Remuneraciones"  class='btn btn-warning btn-circle btn-sm btnProcesarFirmaAndRem'>
                                                                <i class='glyphicon glyphicon-ok'></i></button>
                                                        </th>
                                                    </tr>
                                                    <%}%>
                                                    <tr data-hide="phone,tablet">
                                                        <th><strong>Nro</strong></th>
                                                        <th data-hide="phone,tablet"><strong>Acción</strong></th>
                                                        <th>Mes</th>
                                                        <th data-hide="phone,tablet"><strong>Foto</strong> </th>
                                                        <th data-class="expand" ><strong>Apellidos Y Nombres</strong></th>
                                                        <th data-hide="phone,tablet"><strong>Puesto</strong></th>
                                                        <th data-hide="phone,tablet"><strong>Area</strong></th>
                                                        <th data-hide="phone,tablet"><strong>Departamento</strong></th>
                                                        <th data-hide="phone,tablet"><strong>Requerimiento</strong></th>
                                                        <th data-hide="phone,tablet"><strong>Descripción</strong></th>
                                                        <th  data-hide="phone,tablet">Fecha de Creación</th>  
                                                        <th  data-hide="phone,tablet">Motivo</th>  
                                                        <th  data-hide="phone,tablet">MFL</th>  
                                                            <% if (dep.equals("DPT-0019")) {%>
                                                        <th><strong>¿Cumplio Plazos?</strong></th>
                                                            <%if (idrol.trim().equals("ROL-0006")) {%>
                                                        <th><strong>¿Contrato Elaborado?</strong></th>
                                                        <th><strong>¿Firmo Contrato?</strong></th>
                                                        <th><strong>Enviar a Rem.</strong></th>
                                                        <th><strong>¿Contrato Subido?</strong></th>
                                                            <%}
                                                                }%>
                                                            <%if (idrol.trim().equals("ROL-0009")) {%>
                                                        <th><strong>Código APS</strong></th>
                                                            <%}%>
                                                            <%if (idrol.trim().equals("ROL-0007") | idrol.trim().equals("ROL-0001")) {%>
                                                        <th><strong>Código Huella</strong></th>
                                                            <%}%>
                                                    </tr>
                                                    </thead>
                                                    <tbody> 
                                                        <%
                                                            int num_cod_aps = 0;
                                                            int num_cod_huella = 0;
                                                            for (int f = 0; f < List_id_Autorizacion.size(); f++) {
                                                                V_Autorizar_Dgp a = new V_Autorizar_Dgp();
                                                                a = (V_Autorizar_Dgp) List_id_Autorizacion.get(f);
                                                        %>
                                                        <tr>
                                                            <td><%=f + 1%></td>
                                                            <td>
                                                                <div class="btn-group">
                                                                    <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                                        <i class="fa fa-gear fa-lg"></i>
                                                                    </button>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="../../dgp?iddgp=<%=a.getId_dgp().trim()%>&opc=Seguimiento">Ver Proceso</a></li>
                                                                        <li><a   class="btnHorario"  data-valor="<%=a.getId_dgp()%>"  data-toggle="modal" data-target="#exampleModal">Ver Horario</a></li>
                                                                        <li><a href="../../documento?iddgp=<%=a.getId_dgp().trim()%>&idtr=<%=a.getId_trabajador().trim()%>&opc=Reg_Pro_Dgp">Ver Documentos</a></li>
                                                                        <li><a  data-valor="<%=a.getId_dgp().trim()%>;<%=a.getId_trabajador().trim()%>;<%=a.getAp_paterno() + " " + a.getAp_materno() + " " + a.getNo_trabajador()%>" class="click" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false" onclick="sendAjax('')" >Comentario</a></li>
                                                                            <% if (Integer.parseInt(a.getElab_contrato()) > 0) {%>
                                                                        <li>
                                                                            <a href="../../contrato?idtr=<%=a.getId_trabajador().trim()%>&opc=Detalle_Contractual">Ver Contrato</a></li>
                                                                            <%}%>
                                                                        <li class="divider"></li>
                                                                        <li>
                                                                        <li>
                                                                            <%
                                                                                int num = a.getVal_dgp_cotrato();
                                                                            %>
                                                                            <a href="../../trabajador?idtr=<%=a.getId_trabajador()%>&IDDETALLE_REQ_PROCESO=<%=a.getId_detalle_req_proceso()%>&iddetalle_dgp=<%=a.getId_dgp()%>&p=<%=a.getId_puesto()%>&cod=<%=a.getCo_pasos()%>&idpasos=<%=a.getId_pasos()%>&autorizacion=1&opc=aut&nup=<%=a.getNu_pasos()%>">
                                                                                <%
                                                                                    if (idrol != null) {
                                                                                        if (idrol.trim().equals("ROL-0006")) {
                                                                                            if (num >= 1) {
                                                                                                out.println("Registrar Firma");
                                                                                            }
                                                                                            if (num == 0) {
                                                                                                out.print("Hacer Contrato");
                                                                                            } else {
                                                                                                out.print("Autorizar");
                                                                                            }
                                                                                        } else {
                                                                                            out.println("Autorizar");
                                                                                        }
                                                                                    }
                                                                                %> </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td >
                                                                <%
                                                                    out.print(a.getMesPlazo());
                                                                %>
                                                            </td>   
                                                            <% if (a.getAr_foto() == null) {%>
                                                            <td>
                                                                <img class="user_avatar_<%=a.getId_trabajador()%>" src="../../img/avatar_default.jpg"  width="30"  height="30">
                                                            </td>
                                                            <% } else {%>
                                                            <td>
                                                                <img class="user_avatar_<%=a.getId_trabajador()%>" src="../../Archivo/Fotos/<%=a.getAr_foto()%>"  width="30"  height="30">
                                                            </td>
                                                            <% }%>
                                                            <td ><%=a.getAp_paterno() + " " + a.getAp_materno() + " " + a.getNo_trabajador()%></td>
                                                            <td ><%=a.getNo_puesto()%></td>
                                                            <td ><%=a.getNo_area()%></td>
                                                            <td ><%=a.getNo_dep()%></td>
                                                            <td ><%=a.getNo_req()%></td>
                                                    <input type="hidden" class="val_aut<%=(f + 1)%> valAut" 
                                                           value="&IDDETALLE_REQ_PROCESO=<%=a.getId_detalle_req_proceso()%>&IDDETALLE_DGP=<%=a.getId_dgp()%>&p=<%=a.getId_puesto()%>&COD=<%=a.getCo_pasos()%>&IDPASOS=<%=a.getId_pasos()%>&NROPASO=<%=a.getNu_pasos()%>&IDTR=<%=a.getId_trabajador()%>"/>
                                                    <input type="hidden" class="val_firm<%=(f + 1)%>" value="&IDDETALLE_DGP=<%=a.getId_dgp()%>&IDTR=<%=a.getId_trabajador()%>"/>
                                                    <input type="hidden" class="correos_<%=(f + 1)%> correoTrabajador" value="<%=a.getDi_correo_inst()%>,<%=a.getDi_correo_personal()%>"/>
                                                    <td class="text-info">
                                                        <a href="../../trabajador?idtr=<%=a.getId_trabajador()%>&IDDETALLE_REQ_PROCESO=<%=a.getId_detalle_req_proceso()%>&iddetalle_dgp=<%=a.getId_dgp()%>&p=<%=a.getId_puesto()%>&cod=<%=a.getCo_pasos()%>&idpasos=<%=a.getId_pasos()%>&autorizacion=1&opc=aut&nup=<%=a.getNu_pasos()%>">
                                                            <strong><%=a.getDe_pasos()%></strong>
                                                        </a>
                                                    </td>
                                                    <td ><%=a.getFe_creacion()%></td>
                                                    <td>
                                                        <%if (a.getLi_motivo() != null) {

                                                                if (a.getLi_motivo().trim().equals("1")) {
                                                                    out.print("Trabajdor Nuevo");
                                                                }
                                                                if (a.getLi_motivo().trim().equals("2")) {
                                                                    out.print("Renovación");
                                                                }
                                                            } else {
                                                                out.print("No registrado");
                                                            }%>
                                                    </td> 
                                                    <td>
                                                        <%if (a.getEs_mfl() != null) {
                                                                if (a.getEs_mfl().trim().equals("0")) {
                                                                    out.print("No");
                                                                }
                                                                if (a.getEs_mfl().trim().equals("1")) {
                                                                    out.print("Si");
                                                                }
                                                            } else {
                                                                out.print("No registrado");
                                                            }%>
                                                    </td> 
                                                    <% if (dep.equals("DPT-0019")) {%>
                                                    <td>
                                                        <%if (a.getVal_plazo() > 0) {
                                                        %>
                                                        <a href="../../plazo_dgp?opc=Ver_detalle_plazo&iddgp=<%=a.getId_dgp()%>" class="label label-danger" rel="popover-hover" data-placement="top" data-original-title="Record de plazos cumplidos" data-content="<%=a.getVer_list_plazo()%>" data-html="true"> <strong>No cumplio plazos</strong></a>
                                                    </td>
                                                    <%                                                        } else if (a.getVal_plazo() == 0) {%>
                                                    <a href="../../plazo_dgp?opc=Ver_detalle_plazo&iddgp=<%=a.getId_dgp()%>" class="label label-primary" rel="popover-hover" data-placement="top" data-original-title="Record de plazos cumplidos " data-content="<%=a.getVer_list_plazo()%>" data-html="true"> <strong>Cumplio plazos</strong></a></td>
                                                    <%                                                                    }%>
                                                    <%if (idrol.trim().equals("ROL-0006")) {

                                                    %>
                                                    <td 
                                                        ><%   if (Integer.parseInt(a.getElab_contrato()) == 0) {
                                                                out.println("No");
                                                            } else {
                                                                out.println("Si");
                                                            }
                                                        %>
                                                    </td> 
                                                    <td><%
                                                        if (Integer.parseInt(a.getVal_firm_contrato()) == 0) {
                                                            if (Integer.parseInt(a.getElab_contrato()) == 0) {
                                                                out.println("!Falta procesar¡");
                                                            } else {
                                                        %>
                                                        <div class="smart-form">
                                                            <label class="toggle"><input type="checkbox" value="<%=(f + 1)%>"  class="firm_contr"  name="estado" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                        </div>
                                                        <%
                                                                }
                                                            } else {
                                                                out.println("Si");
                                                            }
                                                        %>
                                                    </td>
                                                    <td>
                                                        <% if (Integer.parseInt(a.getVal_firm_contrato()) != 0 & Integer.parseInt(a.getElab_contrato()) != 0) {
                                                        %>
                                                        <div class="smart-form">
                                                            <label class="toggle"><input type="checkbox" value="<%=(f + 1)%>"  class="env_rem<%=(f + 1)%> envioRem"  name="estado" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                        </div>
                                                        <%
                                                            } else {
                                                                out.println("¡Falta Procesar!");
                                                            }
                                                        %>
                                                    </td>
                                                    <td>
                                                        <%
                                                            if (a.getVal_contrato_adjunto() == 0) {
                                                                out.print("No");
                                                            } else {
                                                                out.print("Si");
                                                            }
                                                        %>
                                                    </td>
                                                    <%}%>
                                                    <%if (idrol.trim().equals("ROL-0009")) {
                                                            if (a.getVal_cod_aps_empleado() == 0) {
                                                                num_cod_aps++;
                                                    %>
                                                    <td>
                                                        <input type="text" name="cod_aps" maxlength="6" class="cod_aps<%=(f + 1)%> inp_cod_aps" style="width:50px"/>
                                                    </td>
                                                    <input type="hidden" name="idtr"  class="idtr<%=(f + 1)%> idTrabajador" value="<%=a.getId_trabajador()%>" />
                                                    <%} else {%>
                                                    <td>
                                                        <strong><%=a.getCo_aps()%></strong>
                                                    </td>
                                                    <%}
                                                        }%>
                                                    <%if (idrol.trim().equals("ROL-0007") | idrol.trim().equals("ROL-0001"
                                                        )) {%>
                                                    <%if (a.getVal_cod_huella() == 0) {
                                                            num_cod_huella++;
                                                    %>
                                                    <td>
                                                        <input type="text" name="cod_huella" maxlength="6" class="form-control cod_huella<%=(f + 1)%> inp_cod_huella" style="width:70px"/>
                                                    </td>
                                                    <input type="hidden" name="idtr"  class="idtr<%=(f + 1)%>" value="<%=a.getId_trabajador()%>" />
                                                    <%} else {%>
                                                    <td class="" >
                                                        <div class="input-group" >

                                                            <input class="form-control" placeholder=""  style="width: 70px;" type="text" value="<%=a.getCo_huella_digital()%>">
                                                            <span class="input-group-addon"  >
                                                                <span class="checkbox">
                                                                    <label >
                                                                        <input type="checkbox" class="checkbox style-0 cbHuellaItem" >
                                                                        <span></span>
                                                                    </label>
                                                                </span>
                                                            </span>

                                                        </div>
                                                    </td>
                                                    <%}
                                                        }%>   
                                                    </tr>
                                                    <% }
                                                        }
                                                    %>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="tab-pane fade" id="hr2">
                                                <table  class="table table-striped table-bordered table-hover tableAutCargaAcademica" width="100%">
                                                    <thead class="tHeadAutCA"></thead>
                                                    <tbody class="tBodyAutCA"></tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <input class="num_aps" type="hidden" value="<%=num_cod_aps%>" />
                                        <input class="num_huella" type="hidden" value="<%=num_cod_huella%>" 

                                    </div>
                                    <!-- end widget content -->
                                    <!-- widget content -->

                                </div>


                            </div>

                            <!-- end widget -->
                        </article>
                        <!-- WIDGET END -->
                    </div>
                    <!-- end row -->
                    <div class="row">
                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div id="alerta_dgp">
                            </div>
                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-red" id="wid-id-1"  data-widget-editbutton="false"  data-widget-deletebutton="false" data-widget-fullscreenbutton="false">
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
                                    <span class="widget-icon"> <i class="glyphicon glyphicon-saved"></i> </span>
                                    <h2 class="font-md"><strong>Requerimientos </strong> <i>Autorizados</i></h2>
                                </header>
                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding imprimir_tabla">
                                        <img src="../../img/ajax-loader.gif" class="img-responsive center-block"/> 

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
        </div>
        <!-------------- Modal  ----------->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Horarios</h4>
                        <h6 class="tipoh hidden"></h6>
                    </div>
                    <div class="modal-body" style="height:550px;">
                        <div class="conTablas"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <!--================================================== -->
        <div class="modal fade sendEmailsModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content"  style="width:150%;margin-left: -30%;">
                    <div class="modal-header">
                        <div class="col-md-6"><h1>Enviar Correos al Trabajador</h1></div>
                        <div class="col-md-3">
                            <input type="email" name="emailSubject" class="form-control emailSubject" placeholder="Email" />
                        </div>
                        <div class="col-md-3"><input type="password" name="pwdSubject" class="form-control pwdSubject" placeholder="Password"/></div>
                    </div>

                    <div class="modal-body" >
                        <div id="inbox-content" class="inbox-body">
                            <div class="animated fast fadeInRight">
                                <form  action="dummy.php" method="POST" class="form-horizontal" id="email-compose-form">

                                    <div class="inbox-info-bar">
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="control-label col-md-1"><strong>Para</strong></label>
                                                <div class="col-md-11">
                                                    <input class="emailInput"  style="width:100%;border-color: #fff!important;"  required  data-role="tagsinput" >

                                                </div>
                                            </div>
                                        </div>	
                                    </div>
                                    <div class="inbox-info-bar">
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="control-label col-md-1"><strong>Asunto</strong></label>
                                                <div class="col-md-11">
                                                    <input class="form-control asunto" value="CARPETA LABORAL - UPEU" placeholder="Ingrese un asunto del correo" type="text" required>
                                                </div>
                                            </div>
                                        </div>	
                                    </div>
                                    <div class="inbox-info-bar hidden">
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="control-label col-md-1"><strong>Attachments</strong></label>
                                                <div class="col-md-11">
                                                    <input class="form-control fileinput" type="file" multiple="multiple">
                                                </div>
                                            </div>
                                        </div>	
                                    </div>
                                    <div class="inbox-message" >
                                        <textarea class="emailbody messageEmail" >
            Estimado(a) Colaborador(a),<br>
            Compartimos la siguiente información<br><br>
             - Bienestar para el trabajador<br>
             - Reglamento de Control de Asistencia<br>
             - Reglamento de trabajo<br>
             - Boletín Informativo - sistema pensionario<br>    
                                                        <br><br><br>Gracias,<br><strong>Ing. Iván Huamán Fernández</strong><br><br><small>Área de Sistemas<br> Gerencia del Talento Humano<br>Universidad Peruana Unión<br><i class="fa fa-phone"> (+51) 989 059 491</i></small><br>		
                                        </textarea>	
                                    </div>
                                    <div class="inbox-info-bar">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <input class="form-control fileinput inputFileEmail" type="file" multiple="multiple">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="inbox-compose-footer">
                                        <button class="btn btn-danger" type="button" data-dismiss="modal">
                                            Cerrar
                                        </button>
                                        <button  class="btn btn-primary pull-right btnSendEmail" type="button">
                                            Enviar <i class="fa fa-arrow-circle-right fa-lg"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!---Modal---------------->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close-form close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="datos_trabajador text-left">
                        </div>
                        <h4 class="modal-title" id="myModalLabel">Añadir Comentario</h4>
                    </div>
                    <div class="modal-body">

                        <!-- <button class="add-coment btn btn-primary btn-block">Add Comentario</button> -->
                        <div class="area-coment">
                            <form class="comentari-form" method="post">
                                <textarea class="mensaje"></textarea>
                                <p></p>
                                <input name="idDgp" class="idDgp" type="hidden" value="">
                                <div class="contador">
                            </form>
                        </div>
                    </div>

                    <div class="comentarios">
                        <div>
                            <legend>Comentarios </legend>
                            <div class="comentario-dgp"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="close-form btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" onclick="Registrar()" class="comet btn btn-success">Comentar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--===========================Modal======================= -->

    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script>
                            if (!window.jQuery) {
                                document.write('<script src="../../js/libs/jquery-2.1.1.min.js"><\/script>');
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
    <!-- Demo purpose only 
    <script src="../../js/demo.min.js"></script>-->
    <!-- MAIN APP JS FILE -->
    <script src="../../js/app.min.js"></script>

    <script src="../../js/plugin/bootstrap-tags/bootstrap-tagsinput.min.js"></script>


    <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
    <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
    <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
    <script src="../../js/plugin/delete-table-row/delete-table-row.min.js"></script>

    <script src="../../js/plugin/summernote/summernote.min.js"></script>
    <script src="../../js/plugin/select2/select2.min.js"></script>



    <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>

    <script src="../../js/bootstrap/fileinput.js" type="text/javascript"></script>
    <script src="../../js/bootstrap/es.js" type="text/javascript"></script>

    <!--BUSINESS LOGIC PLUGINS -->
    <script src="../../js/coment/comenth.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Js_Formulario/Js_Form.js?v=<%=globalProperties.VERSION_JS%>"></script>
    <script type="text/javascript" src="../../js/businessLogic/Horario/horario.js?v=<%=globalProperties.VERSION_JS%>"></script>
    <script type="text/javascript" src="../../js/businessLogic/Autorizacion/inboxAuthorization.js?v=<%=globalProperties.VERSION_JS%>"></script>


</body>
</html>
<%
        List_id_Autorizacion.clear();
    } else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
