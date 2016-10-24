<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>
<%@page import="pe.edu.upeu.application.dao.AutorizacionDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceComentario_DGPDAO"%>
<%@page import="pe.edu.upeu.application.dao.Comentario_DGPDAO"%>

<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
        String ID_DEP = (String) sesion_1.getAttribute("DEPARTAMENTO_ID");
%>
<%@page import="java.util.Iterator"%>
<%@page import="pe.edu.upeu.application.dao.DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDgpDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.upeu.application.model.V_Es_Requerimiento"%>
<jsp:useBean class="java.util.ArrayList" id="Det_Autorizacion" scope="session" />
<%@page import="pe.edu.upeu.application.model.X_List_De_Autorizacion"%>
<jsp:useBean class="java.util.ArrayList" id="LIST_DGP_PROCESO" scope="session" />
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Estado de Requerimiento </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- #CSS Links -->
        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Caution! DO NOT change the order -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-rtl.min.css"> 

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">

        <!-- #FAVICONS -->
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- #GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- #APP SCREEN / ICONS -->
        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
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
        <link href="../../css/your_style.css" rel="stylesheet" type="text/css"/>
        <style type="text/css" class="styleProcess">

            /* Form Progress */
            .new-progress {
                /*   //width: 100%;*/
                margin:0px;
                text-align: center;
            }
            .new-progress .new-circle,
            .new-progress .new-bar {
                display: inline-block;
                background: #fff;
                width: 33px; height: 33px;
                border-radius: 100%;
                border: 1px solid #d5d5da;
            }
            .new-progress .new-bar {
                position: relative;
                display: inline-block;
                width: 30px;
                height: 6px;
                /*   //margin: 0 -0.01% 3% -5px;*/
                border-left: none;
                border-right: none;
                border-radius: 0;
            }

            .new-progress .new-circle .new-label {
                display: inline-block;
                width: 25px;
                height: 25px;
                /*// line-height: 32px;*/
                border-radius: 32px;
                margin-top: 3px;
                /*color: #b5b5ba;*/
                /*  // font-size: 17px;*/
            }
            .new-progress .new-circle .new-title {
                color: #b5b5ba;
                font-size: 100%;
                /* //line-height: 30px;
                 //margin-left: -5px;*/
            }

            /* Done / Active */
            .new-progress .new-bar.done,
            .new-progress .new-circle.done {
                background: #eee;
                color:black;
            }
            .new-progress .new-circle.rechazo {
                background: #a90329;
                color: #b5b5ba;
            }
            .new-progress .new-bar.active {
                background: linear-gradient(to right, #EEE 40%, #FFF 60%);
            }
            .new-progress .new-circle.done .new-label {
                color: #FFF;
               /* background: #8bc435;*/
                background: #0aa699;
                box-shadow: inset 0 0 2px rgba(0,0,0,.2);
            }
            .new-progress .new-circle.done .new-title {
                color: #b5b5ba;
            }
            .new-progress .new-circle.active .new-label {
                color: #FFF;
                background: #3276b1;
                box-shadow: inset 0 0 2px rgba(0,0,0,.2);
            }
            .new-progress .new-circle.active .new-title {
                color: black;
            }
            .new-progress .new-circle.done .new-label:hover, .new-circle:hover{

                /*//background-color:#739e73; */
            }

        </style>
    </head>
    <%
        if (request.getParameter("a") != null) {
            if (request.getParameter("a").equals("t")) {
    %>
    <body onload="closedthis();
          ">
        <%
            }
        } else {
        %>
    <body>
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
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12"  style="margin-top:2.5%;">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-white" id="wid-id-0"   data-widget-editbutton="false"

                                 data-widget-togglebutton="false"
                                 data-widget-deletebutton="false"
                                 data-widget-fullscreenbutton="false"

                                 data-widget-sortable="false"
                                 >
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
                                    <span class="widget-icon"> <i class="fa fa-user"></i> </span>
                                    <h2 class="font-md"><strong>Estado de </strong> <i>Requerimientos</i></h2>
                                    <ul id="widget-tab-1" class="nav nav-tabs pull-right">
                                        <li class="active">
                                            <a data-toggle="tab" href="#hr1"> <i class="fa fa-lg fa-arrow-circle-o-down"></i> <span class="hidden-mobile hidden-tablet"> DGP </span> </a>
                                        </li>
                                        <li>
                                            <a data-toggle="tab" href="#hr2"> <i class="fa fa-lg fa-arrow-circle-o-up"></i> <span class="hidden-mobile hidden-tablet"> Carga académica</span></a>
                                        </li>

                                    </ul>	

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

                                        <div class="tab-content padding-10">
                                            <div class="tab-pane dae in active" id="hr1">
                                                <table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th data-hide="phone">Nro</th>
                                                            <th>MES</th>
                                                            <th data-hide="phone,tablet" style="width: 5px">Accion</th>

                                                            <th data-class="expand">Nombre</th>
                                                            <th data-class="expand" style="width: 35%">Proceso</th>
                                                                <%if (ID_DEP.equals("DPT-0019")) {%>
                                                            <th data-hide="phone,tablet">Departamento</th>
                                                                <%}%>
                                                            <th >Estado</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <input type="hidden" value="<%=LIST_DGP_PROCESO.size()%>" class="tamaño"/>
                                                    <%
                                                        String dgp = "";
                                                        for (int i = 0; i < LIST_DGP_PROCESO.size(); i++) {
                                                            V_Es_Requerimiento r = new V_Es_Requerimiento();
                                                            r = (V_Es_Requerimiento) LIST_DGP_PROCESO.get(i);
                                                            dgp = r.getId_dgp();
                                                    %>

                                                    <tr>
                                                        <td><strong><%=i + 1%></strong></td>
                                                        <td><%=r.getMes_procesamiento()%></td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                                    <i class="fa fa-gear fa-lg"></i>
                                                                    <i class="fa fa-caret-down"></i>
                                                                </button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="../../dgp?iddgp=<%=r.getId_dgp().trim()%>&opc=User_Aut">Usuarios - Prox. Autorizacion</a></li>
                                                                    <li><a href="../../dgp?iddgp=<%=r.getId_dgp().trim()%>&opc=Seguimiento">Ver Historial</a> </li>
                                                                    <li><a href="../../documento?iddgp=<%=r.getId_dgp().trim()%>&idtr=<%=r.getId_trabajador().trim()%>&opc=Ver_Documento">Ver Documentos</a></li>
                                                                    <li><a data-valor="<%=r.getId_dgp().trim()%>;<%=r.getId_trabajador().trim()%>;<%=r.getAp_paterno().toUpperCase() + " " + r.getAp_materno().toUpperCase() + " " + r.getNo_trabajador().toUpperCase()%>" class="click" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false" onclick="sendAjaxComment('')" >Comentario</a></li>
                                                                    <li><a href="../../solicitud_requerimiento?iddgp=<%=r.getId_dgp().trim()%>&opc=Reg_List_Solicitud">Hacer Solicitud</a></li>
                                                                    <li class="divider"></li><li>
                                                                    <li><a href="../../dgp?iddgp=<%=r.getId_dgp().trim()%>&idtr=<%=r.getId_trabajador().trim()%>&opc=Detalle">Ver Requerimiento</a> </li>
                                                                    <li><a onclick="listHistory(<%=i%>)" data-toggle="modal" data-target="#ModalHisto">Prueba</a></li>
                                                          
                                                                    <input type="hidden" class="vHist<%=i%>" value="<%=r.getId_dgp().trim()%>">
                                                                </ul>
                                                            </div>

                                                        </td> 
                                                        <% if (r.getAr_foto() == null) {%>
                                                        <td><img class="user_avatar_<%=r.getId_trabajador()%>"  src="../../img/avatar_default.jpg"  width="30"  height="30">
                                                            <a style="margin-left: 3%;" href="../../trabajador?idtr=<%=r.getId_trabajador()%>&opc=list"> 
                                                                <strong><%=r.getAp_paterno().toUpperCase() + " " + r.getAp_materno().toUpperCase() + " " + r.getNo_trabajador().toUpperCase()%></strong></a>
                                                        </td>
                                                        <%} else {%>
                                                        <td>
                                                            <img class="user_avatar_<%=r.getId_trabajador()%>" src="<%=FactoryConnectionDB.url_archivos + "Fotos/" + r.getAr_foto()%>"  width="30"  height="30"><a href="../../trabajador?idtr=<%=r.getId_trabajador()%>&opc=list"> 
                                                                <strong><%=r.getAp_paterno().toUpperCase() + " " + r.getAp_materno().toUpperCase() + " " + r.getNo_trabajador().toUpperCase()%></strong></a> 
                                                        </td>
                                                        <%}%>
                                                        <td>
                                                            <%
                                                                String iddrp = r.getId_detalle_req_proceso();
                                                                String iddep = r.getId_departamento();
                                                            %>
                                                            <div class="new-progress prog_aut"  data-value="&dgp=<%=dgp%>&idrp=<%=iddrp%>&iddep=<%=iddep%>" >
                                                                <img src="../../img/ajax-loader/horizontal_fountain.gif" />
                                                            </div>

                                                        </td>
                                                        <%if (ID_DEP.equals("DPT-0019")) {%>
                                                        <td><%=r.getNo_dep()%></td>
                                                        <%} %>
                                                        <td>
                                                            <%if (r.getEs_dgp().equals("2")) {
                                                                    out.print(" <span class='label label-danger'>Fuera de Proceso</span>");
                                                                } else {
                                                                    out.print(" <span class='label label-primary'>En Proceso</span>");
                                                                }%>
                                                        </td>

                                                    </tr>
                                                    <% }
                                                        LIST_DGP_PROCESO.clear();
                                                    %>
                                                    </tbody>
                                                </table>


                                            </div>
                                            <div class="tab-pane fade" id="hr2">
                                                <table  class="table table-striped table-bordered table-hover tableEsCargaAcademica" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th data-hide="phone">Nro</th>
                                                            <th>MES</th>
                                                            <th style="width: 5px">Accion</th>

                                                            <th data-class="expand">Nombre</th>
                                                            <th data-class="expand" style="width: 35%">Proceso</th>
                                                                <%if (ID_DEP.equals("DPT-0019")) {%>
                                                            <th data-hide="phone,tablet">Departamento</th>
                                                                <%}%>
                                                            <th >Estado</th>
                                                        </tr>
                                                    </thead>
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
                        <!-- WIDGET END -->

                    </div>
                    <div class="row"></div>

                    <!-- end row -->

                    <!-- end row -->

                </section>
                <!-- end widget grid -->

            </div>
            <!-- END MAIN CONTENT -->

        </div>
        <!-- END MAIN PANEL -->
        <!-------------- Modal Comentarios ----------->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close-form close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="datos_trabajador text-left">
                        </div>
                        <h4 class="modal-title" id="myModalLabel">Añadir Comentario</h4>
                    </div>
                    <div class="modal-body">

                        <!--<button class="add-coment btn btn-primary btn-block">Add Comentario</button> -->
                        <div class="area-coment">
                            <form class="comentari-form" method="post">
                                <textarea class="mensaje"></textarea>
                                <p></p>
                                <input name="idDgp" class="idDgp" type="hidden" value="<%=dgp%>">
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
    <!-----Modal------------------------------------------->

    <!-------------- Modal Historial ----------->

    <%InterfaceComentario_DGPDAO cm = new Comentario_DGPDAO();
        HttpSession sesion = request.getSession();
        String rol = (String) sesion.getAttribute("IDROL");%>

    <input type="hidden" id="rolse" value="<%=rol%>">
    <div class="modal fade" id="myModalHis" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style=" width:180%;margin-left:-40%;">
                <div class="modal-header">
                    <button type="button" class="close-form close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="text-left ">
                    </div><br>
                    <div class="jarviswidget jarviswidget-color-yellow" id="wid-id-0" data-widget-editbutton="false" style="margin-bottom:-5px;">
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
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Historial de Autorizaciones</h2>
                        </header>
                    </div>  
                </div> 

                <div class="modal-body">
                    <div id="contenido">
                        <div class="widget-body no-padding">
                            <table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <td>Paso <%=Det_Autorizacion.size()%></td>
                                        <td data-hide="phone,tablet"><i class="fa fa-fw fa-calendar txt-color-blue hidden-md hidden-sm hidden-xs"></i> Detalle</td>
                                        <td data-class="expand"><i class="fa fa-fw fa-user text-muted hidden-md hidden-sm hidden-xs"></i> Estado</td>
                                        <td data-hide="phone"><i class="fa fa-fw fa-phone text-muted hidden-md hidden-sm hidden-xs"></i> Encargado</td>
                                        <td>Cargo Encargado</td>
                                        <td > Usuario</td>
                                        <td data-hide="phone,tablet"><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Area</td>
                                        <td data-hide="phone,tablet">Departamento</td>
                                        <td data-hide="phone,tablet">Fecha Autorizacion</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int i = 0; i < Det_Autorizacion.size(); i++) {
                                            X_List_De_Autorizacion a = new X_List_De_Autorizacion();
                                            a = (X_List_De_Autorizacion) Det_Autorizacion.get(i);
                                    %>
                                    <tr>
                                        <td class="caji"><%=a.getNu_pasos()%></td>
                                        <td><%=a.getDe_pasos()%></td>
                                        <% if (a.getEs_autorizacion() != null) {%>
                                        <td class="caji" >
                                            <%
                                                if (a.getEs_autorizacion() != null) {

                                                    if (a.getEs_autorizacion().equals("1")) { %>

                                            <img src="../../img/Aprobado.png" width="20" height="20">
                                            <% }
                                                if (a.getEs_autorizacion().equals("2")) {
                                            %>
                                            <img src="../../img/Desaprobado.png" width="20" height="20">
                                            <% }
                                            } else {%>
                                            No registrado
                                            <%}%><input type="hidden" class="estado-aut" value="<%=a.getEs_autorizacion()%>"></td>
                                        <td><%
                                            if (a.getUs_ap_mat() != null) {
                                                out.println(a.getUs_ap_p().toUpperCase() + " " + a.getUs_ap_mat().toUpperCase() + " " + a.getUs_no_tr().toUpperCase());
                                            } else {
                                                out.println("No Registrado");
                                            }
                                            %></td> 
                                        <td><%=a.getUs_no_puesto()%></td> 
                                        <td><%=a.getNo_usuario()%></td> 
                                        <td><%=a.getUs_no_area()%></td> 
                                        <td><%=a.getUs_no_dep()%></td> 
                                        <td><%=a.getFe_creacion()%></td>
                                        <%} else {%>
                                        <td colspan="7" style="text-align:center;">No definido</td>
                                        <%}%>

                                        <%
                                            //if () {
                                            if (a.getEs_autorizacion() != null) {

                                                if (a.getEs_autorizacion().equals("2") & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0001"))) {

                                        %>


                                <div class="alert alert-danger alert-block">
                                    <a class="close" data-dismiss="alert" href="#">×</a>
                                    <h4 class="alert-heading">DGP fuera de Proceso!</h4>
                                    <p>El DGP se ha rechazado por uno de los Usuarios... <a href="../../autorizacion?opc=HDGP&iddgp=<%=a.getId_dgp().trim()%>&ID<%=a.getId_departamento()%>" class="btn btn-primary"><strong><i class="fa fa-arrow-circle-right"></i> Habilitar</strong></a>  <a href="../../dgp?opc=MODIFICAR REQUERIMIENTO&iddgp=<%=a.getId_dgp().trim()%>" class="btn btn-primary"><strong><i class="fa fa-pencil-square-o"></i> Editar DGP</strong></a> <a data-toggle="modal" href="#myModal6" class="btn btn-primary"><i class="glyphicon glyphicon-remove"></i> Ver Motivo</a>
                                    </p>
                                    <input type="hidden" class="id-autorizacion" value="<%=a.getId_autorizacion()%>">
                                </div>

                                <div class="modal fade" id="myModal6" tabindex="-1" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content" align="center">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                    &times;
                                                </button>
                                            </div>
                                            <div class="modal-body no-padding">
                                                <fieldset>
                                                    <section align="center">
                                                        <div class="row" >
                                                            <h1 class="h1" style="color:#218FDD ; font-size:20px;"><strong>MOTIVO</strong></h1>
                                                            <div class="col col-10"  >
                                                                <label class="input">
                                                                    <% if (a.getCm_comentario() != null & a.getId_autorizacion() != null & a.getId_dgp() != null) {
                                                                            String inf = "";
                                                                            inf = cm.Comentario_dgp_aut(a.getId_dgp(), a.getId_autorizacion());
                                                                            String info[] = inf.split("/");
                                                                    %>
                                                                    <P class="list_motivo"><%=info[0]%></P>
                                                                    <P class="list_motivo"><strong>Usuario:</strong><%=info[1]%></P>
                                                                    <P class="list_motivo"><strong>Fecha:</strong><%=info[2]%></P>
                                                                        <%} else {%>
                                                                    <p>No se Comento Rechazo</p>
                                                                    <%}%>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </section>
                                                </fieldset>
                                                <footer align="center">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal" >
                                                        Cancel
                                                    </button>
                                                </footer>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}
                                        }
                                    }%>
                                </tr> 
                                </tbody>
                            </table>
                        </div>
                    </div>                         
                </div><!--cierra cuerpo modal-->


            </div>
        </div>
    </div>       



    <div class="modal fade col-lg-12 col-md-12 col-sm-12 col-xs-12" id="ModalHisto" tabindex="-1" role="dialog"  >
        <div class="modal-dialog" >
            <div class="modal-content col-lg-12 col-md-12 col-sm-12 col-xs-12" style="width:220%;margin-left: -60%;">
                <div class="modal-header">
                    <div class="contD"></div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="jarviswidget jarviswidget-color-yellow" id="wid-id-0" data-widget-editbutton="false" style="margin-bottom:-5px;">
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
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Historial de Autorizaciones</h2>
                        </header>
                    </div> 

                </div>
                <div class="modal-body">
                    <div class="contM"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>



    <!-- END MAIN CONTENT -->
    <!---------------Fin modal Historial--------------------->

    <!--================================================== -->
    <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>
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

    <!-- EASY PIE CHARTS
    <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script> -->

    <!-- SPARKLINES 
    <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>-->

    <!-- JQUERY VALIDATE -->
    <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

    <!-- JQUERY MASKED INPUT 
    <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->

    <!-- JQUERY SELECT2 INPUT
    <script src="../../js/plugin/select2/select2.min.js"></script> -->

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
    <script src="../../js/speech/voicecommand.min.js"></script> -->

    <!-- PAGE RELATED PLUGIN(S) -->
    <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
    <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
    <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
    <script src="../../js/coment/comenth.js" type="text/javascript"></script>


    <script type="text/javascript">
                            // DO NOT REMOVE : GLOBAL FUNCTIONS!
                            function listHistory(at) {
                                var id = $(".vHist" + at + "").val();
                                var url = '../../dgp?opc=SeguimientoH';
                                var data = 'iddgp=' + id;
                                var rol = $("#rolse").val();
                                $.post(url, data, function (objJson) {
                                    var lista = objJson.listar;
                                    if (lista.length > 0) {
                                        var m = '';
                                        for (var i = 0; i < lista.length; i++) {
                                            /*$(".contM").append("<td class='caji'>" + lista[i].getNu_pasos + "</td>");
                                             $(".contM").append("<td>" +lista[i].getDe_pasos+ "</td>");
                                             $(".contM").append("<td class='alert alert-danger'>" + lista[i].id_dgp + "</td>");
                                             */
                                            m += '<tr>';
                                            m += '<td>' + lista[i].nu_pasos + '</td>';
                                            m += '<td>' + lista[i].de_pasos + '</td>';
                                            if (lista[i].es_autorizacion != null) {
                                                
                                                
                                                  if (lista[i].es_autorizacion !== null) {
                                                    if (lista[i].es_autorizacion.equals("1")) {
                                                        m += '<td><img src="../../img/Aprobado.png" width="20" height="20"></td>';
                                                    }
                                                    if (lista[i].es_autorizacion.equals("2")) {
                                                        m += '<td><img src="../../img/Desaprobado.png" width="20" height="20"></td>';
                                                    }
                                                } else {
                                                    m += '<td>No Registrado</td>';
                                                }
                                                
                                                

                                                if (lista[i].us_ap_mat !== null) {
                                                    m += '<td>' + lista[i].us_ap_p + " " + lista[i].us_ap_mat + " " + lista[i].us_no_tr + '</td>';
                                                } else {
                                                    alert("No Registrado");
                                                }
                                                m += '<td>' + lista[i].us_no_puesto + '</td>';
                                                m += '<td>' + lista[i].no_usuario + '</td>';
                                                m += '<td>' + lista[i].us_no_area + '</td>';
                                                m += '<td>' + lista[i].us_no_dep + '</td>';
                                                m += '<td>' + lista[i].fe_creacion + '</td>';
                                            } else {
                                                m += '<td colspan="7" style="text-align:center;"> No definido </td>';
                                            }

                                            m += '</tr>';
                                            if (lista[i].es_autorizacion !== null) {
                                                if (lista[i].es_autorizacion === '2' & (rol === "ROL-0002" || rol === "ROL-0005" || rol === "ROL-0001")) {

                                                    function DivEspecial() {
                                                        var DivEspecial = '<div id="divEs" class="alert alert-danger alert-block">';
                                                        DivEspecial += '<a class="close" data-dismiss="alert" href="#">×</a>';
                                                        DivEspecial += ' <h4 class="alert-heading">DGP fuera de Proceso!</h4>';
                                                        DivEspecial += ' <p>El DGP se ha rechazado por uno de los Usuarios... <a href="../../autorizacion?opc=HDGP&iddgp=lista[i].id_dgp.&IDlista[i].id_departamento()" class="btn btn-primary"><strong><i class="fa fa-arrow-circle-right"></i> Habilitar</strong></a>  <a href="../../dgp?opc=MODIFICAR REQUERIMIENTO&iddgp=lista[i].id_dgp>" class="btn btn-primary"><strong><i class="fa fa-pencil-square-o"></i> Editar DGP</strong></a> <a data-toggle="modal" href="#myModal6" class="btn btn-primary"><i class="glyphicon glyphicon-remove"></i> Ver Motivo</a>';
                                                        DivEspecial += ' </p>';
                                                        DivEspecial += ' <input type="hidden" class="id-autorizacion" value="lista[i].id_autorizacion">';
                                                        DivEspecial += ' </div>';

                                                        return DivEspecial;
                                                    }
                                                }
                                            }

                                        }

                                        //var DivEspecial = DivEspecialL();
                                        var table = createTable();
                                        $(".contM").empty();
                                        $(".contM").append(table);
                                        $(".contM").append(DivEspecial);
                                        $("#dataB").empty();
                                        $("#dataB").append(m);
                                        // $("#divEs").append(DivEspecial);
                                        //  $("#dt").dataTable();
                                        //$("#divEs").dataDivEspecial();
                                        //anexar a la tabla
                                    } else {
                                        alert("vacio");
                                    }
                                });
                            }
                            function createTable() {
                                var table = '<table id="dt" class="table table-striped">';
                                table += '<thead>';
                                table += '<tr>';
                                table += '<th>Paso</th>';
                                table += '<th data-hide="phone,tablet"><i class="fa fa-fw fa-calendar txt-color-blue hidden-md hidden-sm hidden-xs"></i>Detalle</th>';
                                table += '<th data-class="expand><i class="fa fa-fw fa-user text-muted hidden-md hidden-sm hidden-xs"></i> Estado</th>';
                                table += '<th data-hide="phone"><i class="fa fa-fw fa-phone text-muted hidden-md hidden-sm hidden-xs"></i> Encargado</th>';
                                table += '<th>Cargo Encargado</th>';
                                table += '<th>Usuario</th>';
                                table += '<th data-hide="phone,tablet"> <i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Area</th>';
                                table += '<th data-hide="phone,tablet">Departamento</th>';
                                table += '<th data-hide="phone,tablet">Fecha Autorizacion</th>';
                                table += '</tr>';
                                table += '</thead>';
                                table += '<tbody id="dataB">';
                                table += '</tbody>';
                                table += '</table>';
                                return table;
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            // DO NOT REMOVE : GLOBAL FUNCTIONS!
                            function closedthis() {
                                $.smallBox({
                                    title: "¡DGP registrada correctamente!",
                                    content: "Ya puede visualizar la informacion del DGP",
                                    color: "#739E73",
                                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                    timeout: 6000
                                });
                            }
                            function closedthis2() {
                                $.smallBox({
                                    title: "¡Documentos del trabajador registrados correctamente!",
                                    content: "ya puede visualizar toda los documentos del trabajador...",
                                    color: "#739E73",
                                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                    timeout: 6000
                                });
                            }
                            function printDetProceso(objProgAut, postData) {
                                objProgAut.empty();
                                objProgAut.append('<img src="../../img/ajax-loader/horizontal_fountain.gif" />');
                                $.ajax({
                                    url: "../../dgp",
                                    data: "opc=Imprimir_det_proceso" + postData,
                                    type: 'POST',
                                    success: function (data, textStatus, jqXHR) {
                                        if (data.rpta === "1") {
                                            objProgAut.empty();
                                            objProgAut.append(data.html);
                                            objProgAut.find(".new-circle").popover({trigger: 'hover click'});
                                        }
                                    }
                                });
                            }

                            $(document).ready(function () {
                                pageSetUp();
                                $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                                    $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                                });
                                $('#coment-s1').click(function () {
                                    console.log("jalar comentario");
                                    $.get('../../comentario?iddgp=DGP-000119&opc=Comentar_Dgp', function (responseJson) {
                                        var $select = $('.comentarios');
                                        $select.find('h2').remove();
                                        $.each(responseJson, function (value) {
                                            $('<p>').text(value).appendTo($select);
                                        });
                                    });
                                });

                                var responsiveHelper_dt_basic = undefined;
                                var breakpointDefinition = {
                                    tablet: 1024,
                                    phone: 480
                                };
                                var table_req = $('#dt_basic').dataTable({
                                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                                            "t" +
                                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                                    "autoWidth": true,
                                    "preDrawCallback": function () {
                                        // Initialize the responsive datatables helper once.
                                        if (!responsiveHelper_dt_basic) {
                                            responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
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
                                var rows = table_req.fnGetNodes();
                                for (var i = 0; i < rows.length; i++) {
                                    var obj = $(rows[i]).find(".prog_aut");
                                    printDetProceso(obj, obj.data("value"));
                                }
                                var responsiveHelperCAacademico = undefined;
                                var varTableCAcademica = $(".tableEsCargaAcademica").dataTable({
                                    "ajax": {
                                        "url": "../../carga_academica",
                                        "type": "POST",
                                        "dataSrc": "list",
                                        "data": {
                                            "opc": "listEsCargaAcademica"
                                        }
                                    }, "columns": [
                                        {
                                            "orderable": false,
                                            "data": null,
                                            "defaultContent": ""
                                        },
                                        {
                                            "orderable": false,
                                            "data": null,
                                            "defaultContent": ""
                                        },
                                       
                                        {
                                            "orderable": false,
                                            "data": null,
                                            "defaultContent": ""
                                        },
                                        {"data": "ap_paterno"},
                                        {
                                            "orderable": false,
                                            "data": null,
                                            "defaultContent": ""
                                        },
                                        {"data": "no_dep"}, {
                                            "orderable": false,
                                            "data": null,
                                            "defaultContent": ""
                                        }
                                    ],
                                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>"
                                            + "t"
                                            + "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                                    "oLanguage": {
                                        "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
                                    },
                                    "autoWidth": true,
                                    "preDrawCallback": function () {
                                        // Initialize the responsive datatables helper once.
                                        if (!responsiveHelperCAacademico) {
                                            responsiveHelperCAacademico = new ResponsiveDatatablesHelper(
                                                    $('.tableEsCargaAcademica'),
                                                    breakpointDefinition);
                                        }
                                    },
                                    "rowCallback": function (row, data, index) {
                                        responsiveHelperCAacademico.createExpandIcon(row);
                                        $('td:eq(0)', row).html(index + 1);
                                        $('td:eq(0)', row).html(data.mes_procesamiento);
                                        $('td:eq(2)', row)
                                                .html(
                                                        '<div class="btn-group">'
                                                        + '   <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">'
                                                        + '   <i class="fa fa-gear fa-lg"></i>'
                                                        + '     <i class="fa fa-caret-down"></i>'
                                                        + ' </button>'
                                                        + ' <ul class="dropdown-menu">'
                                                        + '     <li><a href="../../dgp?iddgp='+data.id_dgp+'&opc=User_Aut">Usuarios - Prox. Autorizacion</a></li>'
                                                        + '<li><a href="../../dgp?iddgp='+data.id_dgp+'&opc=Seguimiento">Ver Historial</a> </li>'
                                                        + '<li><a href="../../documento?iddgp='+data.id_dgp+'&idtr='+data.id_trabajador+'&opc=Ver_Documento">Ver Documentos</a></li>'
                                                        + ' <li><a data-valor="'+data.id_dgp+';'+data.id_trabajador+';'+data.ap_paterno+' '+data.ap_materno+' '+data.no_trabajador+'" class="click" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false" onclick="sendAjaxComment()" >Comentario</a></li>'
                                                        + ' <li><a href="../../solicitud_requerimiento?iddgp='+data.id_dgp+'&opc=Reg_List_Solicitud">Hacer Solicitud</a></li>'
                                                        + ' <li class="divider"></li><li>'
                                                        + '<li><a href="../../dgp?iddgp='+data.id_dgp+'&idtr='+data.id_trabajador+'&opc=Detalle">Ver Requerimiento</a> </li>'
                                                        + ' </ul>'
                                                        + ' </div>'
                                                        );
                                        if (data.es_dgp === "2") {
                                            $('td:eq(6)', row).html('<span class="label label-danger">Fuera de Proceso</span>');
                                        } else {
                                            $('td:eq(6)', row).html('<span class="label label-primary">En Proceso</span>');
                                        }
                                         $('td:eq(3)', row).html(data.ap_paterno+' '+data.ap_materno+' '+data.no_trabajador);
                                        // var rows = varTableCAcademica.fnGetNodes();
                                        //   for (var i = 0; i < rows.length; i++) {
                                        //  var obj = $(rows[i]).find(".prog_aut");
                                        printDetProceso($('td:eq(4)', row), "&dgp=" + data.id_dgp + "&idrp=" + data.id_detalle_req_proceso + "&iddep=" + data.id_departamento);
                                        $('td:eq(4)', row).addClass("new-progress");
                                        // }

                                    },
                                });

                            });

    </script>



</body>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
