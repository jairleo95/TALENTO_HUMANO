
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.dao.AutorizacionDAO"%>
<%@page import="pe.edu.upeu.application.web.controller.CConversion"%>
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
        <script type="text/javascript" src="../../js/JQuery/jQuery.js" ></script>
        <style>
            .ui-datepicker-calendar {
                display: none;
            }
        </style>
    </head>
    <%
        CConversion c = new CConversion();
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
    <body class="body" onload="nobackbutton();"  >
        <%}%> 

        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">
                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">


                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                            <div id="alerta_dgp">

                            </div>


                            <!-- Widget ID (each widget will need unique ID)-->
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
                                <header>
                                    <span class="widget-icon"> <i class="glyphicon glyphicon-inbox"></i> </span>
                                    <h2 class="font-md"><strong>Requerimientos por </strong> <i>Autorizar</i></h2>
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


                                        <table id="dt_basic1" class="table table-striped table-bordered table-hover" width="100%">
                                            <thead>
                                                <%if (idrol.trim().equals("ROL-0007") | idrol.trim().equals("ROL-0001")) {%>
                                                <tr>
                                                    <th class='hasinput' colspan='14' style='width:95%' ></th>
                                                    <th class='hasinput'  style='' >
                                            <center>
                                                <button   rel="tooltip" data-placement="left" data-original-title="Autorizar y Procesar codigo de huella digital"  class='btn btn-warning btn-circle btn-lg  btn_cod_huella'>
                                                    <i class='glyphicon glyphicon-ok'></i></button></center></th>
                                            </tr>
                                            <%}%>
                                            <%if (idrol.trim().equals("ROL-0009")) {%>
                                            <tr>
                                                <th class='hasinput' colspan='14' style='width:95%' ></th>
                                                <th class='hasinput'  style='' >
                                            <center><button   rel="tooltip" data-placement="left" data-original-title="Autorizar y Procesar código aps"  class='btn bg-color-magenta txt-color-white btn-circle btn-lg  btn_cod_aps'>
                                                    <i class='glyphicon glyphicon-ok'></i></button></center></th>
                                            </tr>

                                            <%}%>


                                            <%if (idrol.trim().equals("ROL-0006")) {
                                            %>
                                            <tr>
                                                <th class='hasinput' colspan='15' style='width:95%' ></th>
                                                <th class='hasinput'  style='' ><center><button   rel="tooltip" data-placement="top" data-original-title="Procesar Firmas"  class='btn btn-primary btn-circle btn-lg btn_pro_firma'><i class='glyphicon glyphicon-ok'></i></button></center></th>
                                            <th class='hasinput'  style='' ><center><button  rel="tooltip" data-placement="top" data-original-title="Procesar a remuneraciones"  class='btn btn-default btn-circle btn-lg btn_pro_remuneracion'><i class='glyphicon glyphicon-ok'></i></button></center></th>
                                            <th class='hasinput'   ></th>      
                                            </tr>
                                            <%}%>
                                            <tr data-hide="phone,tablet"> <th><strong>Nro</strong></th>
                                                <th data-hide="phone,tablet"><strong>Acción</strong></th>
                                                <th ><strong>MES</strong></th>
                                                <th data-hide="phone,tablet"><strong>Foto</strong> </th>
                                                <th data-class="expand" ><strong>Apellidos Y Nombres</strong></th>
                                                <th data-hide="phone,tablet"><strong>Puesto</strong></th>
                                                <th data-hide="phone,tablet"><strong>Area</strong></th>
                                                <th data-hide="phone,tablet"><strong>Departamento</strong></th>
                                                <th data-hide="phone,tablet"><strong>Requerimiento</strong></th>
                                                <!--  <td>Departamento</td>-->
                                                <th data-hide="phone,tablet"><strong>Descripción</strong></th>
                                                <th  data-hide="phone,tablet">Fecha de Creación</th>  
                                                <th  data-hide="phone,tablet">Motivo</th>  
                                                <th  data-hide="phone,tablet">MFL</th>  
                                                    <% if (dep.equals("DPT-0019")) {%>
                                                <th  ><strong>¿Cumplio Plazos?</strong></th>
                                                    <%if (idrol.trim().equals("ROL-0006")) {
                                                    %>
                                                <th ><strong>¿Contrato Elaborado?</strong></th>
                                                <th  ><strong>¿Firmo Contrato?</strong></th>
                                                <th ><strong>Enviar a Rem.</strong></th>
                                                <th ><strong>¿Contrato Subido?</strong></th>
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
                                                %>
                                                <%%>
                                                <%for (int f = 0; f < List_id_Autorizacion.size(); f++) {
                                                        V_Autorizar_Dgp a = new V_Autorizar_Dgp();
                                                        a = (V_Autorizar_Dgp) List_id_Autorizacion.get(f);
                                                %>
                                                <tr>
                                                    <td><%=f + 1%></td>
                                                    <td>
                                                        <div class="btn-group">
                                                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                                Accion <span class="caret"></span>
                                                            </button>
                                                            <ul class="dropdown-menu">
                                                                <li><a href="../../dgp?iddgp=<%=a.getId_dgp().trim()%>&opc=Seguimiento">Ver Proceso</a></li>
                                                                <li><a href="../../documento?iddgp=<%=a.getId_dgp().trim()%>&idtr=<%=a.getId_trabajador().trim()%>&opc=Reg_Pro_Dgp">Ver Documentos</a></li>
                                                                <li><a  data-valor="<%=a.getId_dgp().trim()%>;<%=a.getId_trabajador().trim()%>;<%=a.getAp_paterno() + " " + a.getAp_materno() + " " + a.getNo_trabajador()%>" class="click" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false" onclick="sendAjax('')" >Comentario</a></li>
                                                                    <% if (Integer.parseInt(a.getElab_contrato()) > 0) {
                                                                    %>
                                                                <li><a href="../../contrato?idtr=<%=a.getId_trabajador().trim()%>&opc=Detalle_Contractual">Ver Contrato</a></li>
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
                                                    <td ><%out.print(aupl.Mes_plazo(a.getId_dgp()));%></td>   
                                                    <% if (a.getAr_foto() == null) {%>
                                                    <td><img class="user_avatar_<%=a.getId_trabajador()%>" src="../../imagenes/avatar_default.jpg"  width="30"  height="30"></td>
                                                        <% } else {%>
                                                    <td><img class="user_avatar_<%=a.getId_trabajador()%>" src="../Usuario/Fotos/<%=a.getAr_foto()%>"  width="30"  height="30"></td>
                                                        <% }%>
                                                    <td ><%=a.getAp_paterno() + " " + a.getAp_materno() + " " + a.getNo_trabajador()%></td>
                                                    <td ><%=a.getNo_puesto()%></td>
                                                    <td ><%=a.getNo_area()%></td>
                                                    <td ><%=a.getNo_dep()%></td>
                                                    <td ><%=a.getNo_req()%></td>
                                            <input type="hidden" class="val_aut<%=(f + 1)%>" value="&IDDETALLE_REQ_PROCESO=<%=a.getId_detalle_req_proceso()%>&IDDETALLE_DGP=<%=a.getId_dgp()%>&p=<%=a.getId_puesto()%>&COD=<%=a.getCo_pasos()%>&IDPASOS=<%=a.getId_pasos()%>&NROPASO=<%=a.getNu_pasos()%>&IDTR=<%=a.getId_trabajador()%>"/>
                                            <input type="hidden" class="val_firm<%=(f + 1)%>" value="&IDDETALLE_DGP=<%=a.getId_dgp()%>&IDTR=<%=a.getId_trabajador()%>"/>
                                            <input type="hidden" class="correos_<%=(f + 1)%>" value="&IDTR=<%=a.getId_trabajador()%>&co_inst=<%=a.getDi_correo_inst()%>&co_pers=<%=a.getDi_correo_personal()%>"/>
                                            <td style="color: red; font-weight: bold;"><a href="../../trabajador?idtr=<%=a.getId_trabajador()%>&IDDETALLE_REQ_PROCESO=<%=a.getId_detalle_req_proceso()%>&iddetalle_dgp=<%=a.getId_dgp()%>&p=<%=a.getId_puesto()%>&cod=<%=a.getCo_pasos()%>&idpasos=<%=a.getId_pasos()%>&autorizacion=1&opc=aut&nup=<%=a.getNu_pasos()%>"><%=a.getDe_pasos()%></a></td>
                                            <td ><%=a.getFe_creacion()%></td>
                                            <td><%if (a.getLi_motivo() != null) {
                                                    if (a.getLi_motivo().trim().equals("1")) {
                                                        out.print("Trabajdor Nuevo");
                                                    }
                                                    if (a.getLi_motivo().trim().equals("2")) {
                                                        out.print("Renovación");
                                                    }
                                                } else {
                                                    out.print("No registrado");
                                                }%></td> 
                                            <td><%if (a.getEs_mfl() != null) {
                                                    if (a.getEs_mfl().trim().equals("0")) {
                                                        out.print("No");
                                                    }
                                                    if (a.getEs_mfl().trim().equals("1")) {
                                                        out.print("Si");
                                                    }
                                                } else {
                                                    out.print("No registrado");
                                                }%></td> 
                                                <% if (dep.equals("DPT-0019")) {%>
                                            <td><%if (a.getVal_plazo() > 0) {
                                                %>
                                                <a href="../../plazo_dgp?opc=Ver_detalle_plazo&iddgp=<%=a.getId_dgp()%>" class="label label-danger" rel="popover-hover" data-placement="top" data-original-title="Record de plazos cumplidos" data-content="<%=a.getVer_list_plazo()%>" data-html="true"> <strong>No cumplio plazos</strong></a></td>
                                                <%                                                        } else if (a.getVal_plazo() == 0) {
                                                %>
                                            <a href="../../plazo_dgp?opc=Ver_detalle_plazo&iddgp=<%=a.getId_dgp()%>" class="label label-primary" rel="popover-hover" data-placement="top" data-original-title="Record de plazos cumplidos " data-content="<%=a.getVer_list_plazo()%>" data-html="true"> <strong>Cumplio plazos</strong></a></td>
                                            <%                                                                    }%>
                                            <%if (idrol.trim().equals("ROL-0006")) {

                                            %>
                                            <td ><%                                                if (Integer.parseInt(a.getElab_contrato()) == 0) {
                                                    out.println("No");
                                                } else {
                                                    out.println("Si");
                                                }
                                                %></td> 
                                            <td ><%
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
                                                %></td>
                                            <td><%
                                                if (Integer.parseInt(a.getVal_firm_contrato()) != 0 & Integer.parseInt(a.getElab_contrato()) != 0) {
                                                %>
                                                <div class="smart-form">
                                                    <label class="toggle"><input type="checkbox" value="<%=(f + 1)%>"  class="env_rem<%=(f + 1)%>"  name="estado" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                </div>
                                                <%
                                                    } else {
                                                        out.println("¡Falta Procesar!");
                                                    }
                                                %></td>
                                            <td><%                                                if (a.getVal_contrato_adjunto() == 0) {
                                                    out.print("No");
                                                } else {
                                                    out.print("Si");
                                                }
                                                %></td>
                                                <%}%>
                                                <%if (idrol.trim().equals("ROL-0009")) {%>
                                                <%if (a.getVal_cod_aps_empleado() == 0) {
                                                        num_cod_aps++;
                                                %>
                                            <td>
                                                <input type="text" name="cod_aps" maxlength="6" class="cod_aps<%=(f + 1)%> inp_cod_aps" style="width:50px"/>
                                            </td>
                                            <input type="hidden" name="idtr"  class="idtr<%=(f + 1)%>" value="<%=a.getId_trabajador()%>" />
                                            <%} else {%>
                                            <td><strong><%=a.getCo_aps()%></strong></td>
                                            <%}
                                                }%>
                                            <%if (idrol.trim().equals("ROL-0007") | idrol.trim().equals("ROL-0001")) {%>
                                            <%if (a.getVal_cod_huella() == 0) {
                                                    num_cod_huella++;
                                            %>
                                            <td><input type="text" name="cod_huella" maxlength="6" class="form-control cod_huella<%=(f + 1)%> inp_cod_huella" style="width:70px"/></td>
                                            <input type="hidden" name="idtr"  class="idtr<%=(f + 1)%>" value="<%=a.getId_trabajador()%>" />
                                            <%} else {%>
                                            <td><strong><%=a.getCo_huella_digital()%></strong></td>
                                            <%}
                                                }%>   
                                            </tr>
                                            <% }
                                                }
                                            %>
                                            </tbody>
                                        </table>
                                        <input class="num_aps" type="hidden" value="<%=num_cod_aps%>" />
                                        <input class="num_huella" type="hidden" value="<%=num_cod_huella%>" 
                                    </div>
                                    <!-- end widget content -->
                                </div>
                                <!-- end widget div -->
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
                    <div class="jarviswidget jarviswidget-color-red" id="wid-id-1"  data-widget-editbutton="false"  data-widget-deletebutton="false"                          data-widget-fullscreenbutton="false">
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

                <button class="add-coment btn btn-primary btn-block">Add Comentario</button>
                <div class="area-coment">
                    <form class="comentari-form" method="post">
                        <textarea class="txt_mensaje"></textarea>
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

<script src="../../js/coment/coment.js" type="text/javascript"></script>
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

<!-- EASY PIE CHARTS 
<script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>-->

<!-- SPARKLINES 
<script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>-->

<!-- JQUERY VALIDATE 
<script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>-->

<!-- JQUERY MASKED INPUT 
<script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->

<!-- JQUERY SELECT2 INPUT 
<script src="../../js/plugin/select2/select2.min.js"></script>-->

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

<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT
<!-- Voice command : plugin -->

<!-- PAGE RELATED PLUGIN(S) 
<script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>-->

<script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

<script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
<script>
                    $.datepicker.regional['es'] = {
                        closeText: 'Mostrar',
                        currentText: 'Hoy',
                        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                        weekHeader: 'Sm',
                        dateFormat: 'dd/mm/yy',
                        firstDay: 1,
                        isRTL: false,
                        showMonthAfterYear: false,
                        yearSuffix: ''
                    };
                    $.datepicker.setDefaults($.datepicker.regional['es']);
</script>
<script>
    function nobackbutton() {

        window.location.hash = "no-back-button";
        window.location.hash = "Again-No-back-button" //chrome

        window.onhashchange = function () {
            window.location.hash = "";
        }
    }
    function exito(titulo, mensaje) {
        $.smallBox({
            title: titulo,
            content: mensaje,
            color: "#739E73",
            iconSmall: "fa fa-cloud",
            timeout: 3000
        });
    }
    $(document).ready(function () {
        $(".btn_pro_remuneracion").click(function () {
            $.SmartMessageBox({
                title: "¡Advertencia!",
                content: "¿Esta seguro de procesar estos requerimientos?",
                buttons: '[No][Si]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Si") {
                    for (var i = 1; i <= <%=List_id_Autorizacion.size()%>; i++) {
                        if ($(".env_rem" + i).prop('checked')) {
                            $.ajax({
                                async: false,
                                url: "../../autorizacion",
                                type: "POST",
                                data: "opc=Aceptar" + $(".val_aut" + $(".env_rem" + i).val()).val()
                            }).done(function () {
                                window.location.href = "../../autorizacion";
                            });
                        }
                    }
                }
                if (ButtonPressed === "No") {
                }
            });
        });
        $(".btn_pro_firma").click(function () {
            $.SmartMessageBox({
                title: "¡Advertencia!",
                content: "¿Esta seguro de procesar firmas a estos requerimientos?",
                buttons: '[No][Si]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Si") {
                    try {
                        $.each($(".firm_contr"), function () {
                            if ($(this).prop('checked')) {
                                $.ajax({
                                    async: false,
                                    url: "../../contrato",
                                    type: "POST",
                                    data: "opc=Actualizar_Firma" + $(".val_firm" + $(this).val()).val()
                                }).done(function () {
                                });
                                $.ajax({
                                    async: false,
                                    url: "../../autorizacion",
                                    type: "POST",
                                    data: "opc=Aceptar" + $(".val_aut" + $(this).val()).val()
                                }).done(function () {
                                    window.location.href = "../../autorizacion";
                                });
                            }
                        });
                        // exito("Procesado correctamente!", "Las firmas de cada trabajador han sido procesadas con exito.");
                    }
                    catch (err) {

                    } finally {
                    }
                }
                if (ButtonPressed === "No") {
                }
            });
        });
        $(".btn_cod_aps").click(function () {
            $.SmartMessageBox({
                title: "¡Advertencia!",
                content: "¿Esta seguro de procesar codigos APS a estos requerimientos?",
                buttons: '[No][Si]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Si") {
                    for (var r = 1; r <= parseInt($(".num_aps").val()); r++) {
                        if ($(".cod_aps" + r).val() != "") {
                            $.ajax({
                                async: false,
                                url: "../../trabajador",
                                type: "POST",
                                data: "opc=reg_aps_masivo&cod=" + $(".cod_aps" + r).val() + "&idtr=" + $(".idtr" + r).val()
                            }).done(function () {
                            });
                            $.ajax({
                                async: false,
                                url: "../../autorizacion",
                                type: "POST",
                                data: "opc=Aceptar" + $(".val_aut" + r).val()
                            }).done(function () {

                            });
                        }
                    }
                    window.location.href = "../../autorizacion?opc=mens_cod_aps";
                }
                if (ButtonPressed === "No") {
                }
            });
        });
        $(".btn_cod_huella").click(function () {
            $.SmartMessageBox({
                title: "¡Advertencia!",
                content: "¿Esta seguro de procesar códigos de huella a estos requerimientos?",
                buttons: '[No][Si]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Si") {
                    for (var r = 1; r <= parseInt($(".num_huella").val()); r++) {
                        if ($(".cod_huella" + r).val() != "") {
                            $.ajax({
                                async: false,
                                url: "../../trabajador",
                                type: "POST",
                                data: "opc=reg_huella&cod=" + $(".cod_huella" + r).val() + "&idtr=" + $(".idtr" + r).val()
                            }).done(function () {
                            });
                            $.ajax({
                                async: false,
                                url: "../../autorizacion",
                                type: "POST",
                                data: "opc=Aceptar" + $(".val_aut" + r).val()
                            }).done(function () {

                            });
                       /*     $.ajax({
                              //  async: false,
                                url: "../../autorizacion",
                                type: "POST",
                                data: "opc=Enviar_Correo" + $(".correos_" + r).val()
                            }).done(function () {

                            });*/
                        }
                    }
                    window.location.href = "../../autorizacion?opc=mens_cod_huella";
                }
                if (ButtonPressed === "No") {
                }
            });
        });
    });
</script>
<script type="text/javascript">
    var año = '';
    var mes = '';
    function crear_tabla() {
        var texto_html = '';
        texto_html += '<table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">'
                + '<thead><tr><th class="hasinput"></th>'
                + '<th class="hasinput icon-addon" style="width:100px"><input   placeholder="Fecha" class="form-control filtrar_fecha">'
                + ' <label for="dateselect_filter" class="glyphicon glyphicon-calendar no-margin padding-top-15" rel="tooltip" title="" data-original-title="Filter Date"></label>'
                + '  </th> <th class="hasinput" style="width:16%"><input type="text" class="form-control" placeholder="Filtrar por nombre" /></th>'
                + '<th class="hasinput" style="width:18%"><input type="text" class="form-control" placeholder="Filtrar por puesto" /> </th>'
                + '<th class="hasinput" style="width:18%"><input type="text" class="form-control" placeholder="Filtrar por area" /> </th>'
                + '<th class="hasinput" style="width:16%"><input type="text" class="form-control" placeholder="Filtrar por departamento" /></th>'
                + '<th class="hasinput" style="width:20%" > </th>'
                + ' <th class="hasinput" ></th>'
                + '  <th class="hasinput"></th>'
                + ' <th class="hasinput" > </th>'
                + ' <th class="hasinput" ></th></tr>'
                + '  <tr data-hide="phone,tablet"> <th><strong>Nro</strong></th>'
                + '<th ><strong>MES PROCESADO</strong></th>'
                + '  <th data-class="expand" ><strong>Apellidos Y Nombres</strong></th>'
                + '  <th data-hide="phone,tablet"><strong>Puesto</strong></th>'
                + '  <th data-hide="phone,tablet"><strong>Area</strong></th>'
                + '  <th data-hide="phone,tablet"><strong>Departamento</strong></th>'
                + '  <th data-hide="phone,tablet"><strong>Requerimiento</strong></th>'
                + ' <th  data-hide="phone,tablet">Fecha de Creación</th> '
                + '<th  data-hide="phone,tablet">Fecha de Autorización</th>'
                + ' <th  data-hide="phone,tablet">Motivo</th>'
                + ' <th  data-hide="phone,tablet">MFL</th>  </tr>'
                + '</thead><tbody class="tbody_autorizado"> </tbody> </table>';
        $('.imprimir_tabla').empty();
        $('.imprimir_tabla').append(texto_html);
        $('.filtrar_fecha').datepicker({
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            dateFormat: 'MM yy',
            prevText: '<i class="fa fa-chevron-left"></i>',
            nextText: '<i class="fa fa-chevron-right"></i>',
            onClose: function (dateText, inst) {
                filtrar_mes_año()
            }
        });
        $('.filtrar_fecha').datepicker('setDate', new Date());
    }
    function filtrar_mes_año() {
        //alert(año)
        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
        $('.filtrar_fecha').datepicker('setDate', new Date(año, mes, 1));
        mes = month;
        año = year;
        listar_autorizados(mes, año);
    }
    function reload_table() {
        var responsiveHelper_datatable_fixed_column = undefined;
        var breakpointDefinition = {
            tablet: 1024,
            phone: 480
        };
        var otable = $('#dt_basic').DataTable({
            "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6 hidden-xs'f><'col-sm-6 col-xs-12 hidden-xs'<'toolbar'>>r>" +
                    "t" +
                    "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
            "autoWidth": true,
            "preDrawCallback": function () {
                // Initialize the responsive datatables helper once.
                if (!responsiveHelper_datatable_fixed_column) {
                    responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
                }
            },
            "rowCallback": function (nRow) {
                responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
            },
            "drawCallback": function (oSettings) {
                responsiveHelper_datatable_fixed_column.respond();
            }

        });
        // Apply the filter
        $("#dt_basic thead th input[type=text]").on('keyup change', function () {
            otable.column($(this).parent().index() + ':visible').search(this.value).draw();
        });
    }
    function listar_autorizados(mes, año) {
        var text_html = "";
        $.post("../../autorizacion", "opc=List_Dgp_Aut&mes=" + mes + "&año=" + año, function (objJson) {
            var lista = objJson.lista;
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var count = 0;
            for (var i = 0; i < lista.length; i++) {
                if ((i + 1) < lista.length) {
                    if (lista[i].id_dgp == lista[i + 1].id_dgp) {
                        i++;
                    }
                }
                count++;
                //alert(lista[i + 1].id_dgp)
                text_html += "<tr>";
                text_html += "<td>" + (count) + "</td>";
                text_html += "<td>" + lista[i].mes_año_aut + "</td>";
                text_html += "<td>" + lista[i].ap_p + " " + lista[i].ap_m + " " + lista[i].nombre + "</td>";
                text_html += "<td>" + lista[i].puesto + "</td>";
                text_html += "<td>" + lista[i].area + "</td>";
                text_html += "<td>" + lista[i].dep + "</td>";
                text_html += "<td>" + lista[i].req + "</td>";
                text_html += "<td>" + lista[i].fecha_c + "</td>";
                text_html += "<td>" + lista[i].fecha_aut + "</td>";
                if (lista[i].motivo == '1') {
                    text_html += "<td>Trabajador Nuevo</td>";
                } else if (lista[i].motivo == '2') {
                    text_html += "<td>Renovación</td>";
                }
                if (lista[i].mfl == '0') {
                    text_html += "<td>No</td>";
                } else if (lista[i].mfl == '1') {
                    text_html += "<td>Si</td>";
                }
                text_html += "</tr>";


            }
            crear_tabla();
            $(".tbody_autorizado").append(text_html);
            text_html = "";
            reload_table();

        });
    }
    $(document).ready(function () {
        pageSetUp();
        $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
            $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
        });

        $(".inp_cod_aps").keypress(function (event) {
            return /\d/.test(String.fromCharCode(event.keyCode));
        });
        $(".inp_cod_huella").keypress(function (event) {
            return /\d/.test(String.fromCharCode(event.keyCode));
        });
        listar_autorizados(mes, año);
        /* BASIC ;*/
        var responsiveHelper_dt_basic = undefined;
        var breakpointDefinition = {
            tablet: 1024,
            phone: 480
        };


        $('#dt_basic1').dataTable({
            "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                    "t" +
                    "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
            "autoWidth": true,
            "preDrawCallback": function () {
                // Initialize the responsive datatables helper once.
                if (!responsiveHelper_dt_basic) {
                    responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic1'), breakpointDefinition);
                }
            },
            "rowCallback": function (nRow) {
                responsiveHelper_dt_basic.createExpandIcon(nRow);
            },
            "drawCallback": function (oSettings) {
                responsiveHelper_dt_basic.respond();
            }
        });
        /* END BASIC */
    })

</script>
    </body>
</html>
<%
        List_id_Autorizacion.clear();
    } else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
