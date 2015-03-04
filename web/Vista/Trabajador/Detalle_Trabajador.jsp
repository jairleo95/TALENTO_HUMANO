<%@page import="pe.edu.upeu.application.web.controller.CCriptografiar"%>
<%@page import="pe.edu.upeu.application.web.controller.CConversion"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>

<%@page import="pe.edu.upeu.application.model.Empleado"%>
<%@page import="javax.print.DocFlavor.STRING"%>
<%@page import="pe.edu.upeu.application.model.Auto_Mostrar"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<jsp:useBean id="ListaridTrabajador" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Auto_mostrar" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="id_empleadox_ide" scope="application" class="java.util.ArrayList"/>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <script type="text/javascript" src="../../js/JQuery/jquery.autoheight.js"></script>
        <title>Detalle de Trabajador</title>
        <script type="text/javascript" src="../../js/Js_Alerta/alertify.js"></script>
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.core.css" />
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.default.css" />
        <script type="text/javascript"  src="../../js/Js_Alerta/Alertas.js"></script>

        <link rel="stylesheet" type="text/css" href="../../css/Css_Menu_Desplegable/default.css" />
        <link rel="stylesheet" type="text/css" href="../../css/Css_Menu_Desplegable/component.css" />
        <script src="../../js/modernizr.custom.js"></script>

        <!-- Estilos plantilla-->
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
            body{

                margin-left: auto;
                margin-right: auto  ;
                width: 95%;
                // margin: 0;
            }
            .titulo{


                background-color: #474747;
                padding: 0.5%;

                font-family: arial;
                font-size: 130%;
                text-align: center;
                color: white;

            }
            .autoHeight{
                border-style:none;            
            }

            .td{
                font-weight: bold;
                text-align: center;
            }
            .td1{
                text-align: center;
            }
            .td2{
                width: 8%;
            }
            .info-det{

                width: 25%;
            }

            .table-det{
                width: 100%;
            }
            .submit{
                //position: relative;

                background-color: #0575f4;
                color: white;
                width: 100%;

            }
            .submit:hover{
                background-color: #643771;
            }

            table, th, td {

                padding: 4px;
            }
            img{
                position: absolute;

            }


        </style>

    </head>

    <%  //String num = request.getParameter("num");
       // int num_doc = Integer.parseInt(num);
        if (request.getParameter("a") != null) {
            if (request.getParameter("a").equals("t")) {
    %>

    <body onload="closedthis();">

        <%
            }
        } else {
        %>
    <body >
        <%}%>
        <%

            V_Ficha_Trab_Num_C t = new V_Ficha_Trab_Num_C();
            t = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(0);

            String idtr = t.getId_trabajador().trim();
            String aut = request.getParameter("aut");
            String idtra = request.getParameter("idtr");
            HttpSession sesion = request.getSession(true);
            String idp = (String) sesion.getAttribute("p");
            String idrol = (String) sesion.getAttribute("IDROL");
            String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
            String iddgp = request.getParameter("dgp");
            String cod = request.getParameter("c");
            String iddrp = request.getParameter("drp");
            String id_pasos = request.getParameter("pas");
            String nropaso = request.getParameter("np");
            CCriptografiar cripto = new CCriptografiar();

        %>


        <!--Begin Detalle Trabajador-->
        <div   class="titulo" style=" width:100%;">Datos del Trabajador</div> 
        <div  class="jarviswidget well" id="wid-id-3" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-sortable="false">

            <%                String hl = "";
                String academico = request.getParameter("academico");
                if (academico != null) {
                    if (Boolean.valueOf(academico) == true) {
                        hl = request.getParameter("hl");

            %>
            <div>
                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
                    Trabajador Nuevo
                    <%/*
                         String id =  request.getParameter("id");
                         out.print(cripto.Desencriptar(id));*/%>
                </button>
                <button class="btn btn-default btn-sm btn_procesar" type="button" style="display:none">
                    Procesar Carga Academica
                </button>
            </div>
            <%}
                }%>

            <table  style="background-color: white " class="table-det" cellpadding="0">
                <%                    if (t.getNo_ar_foto() == null) {
                %>
                <tr><td class="td2" >
                       <!-- <a class="btn btn-primary" href="../Usuario/Subir_Foto.jsp?idtr=<%=idtr%>" style="position: relative; margin: 0px; " >Subir foto</a>-->
                        <img style=" border: 3px solid grey ; position:relative;  margin: 0px; cursor: pointer"  class="ver_foto"  src="../../imagenes/avatar_default.jpg"  width="100"  height="100"> 
                        <form action="../../foto" method="POST" enctype="multipart/form-data" class="form-subir-foto">
                            <input type="hidden" name="idtr" class="idtr" id="input-file" value="<%=t.getId_trabajador()%>">
                            <input style="display:none" class="file-foto" type="file" name="archivo" required="">
                        </form>
                    </td>
                    <%
                    } else {%>
                <tr><td class="td2"><img style="border: 3px solid grey ; position:absolute; left:0.5%; top: 6%;" src="../Usuario/Fotos/<%=t.getAr_foto()%>" width="100" height="100" ></td>
                        <%}%>
                    <td>
                        <div>
                            <form action="../../trabajador" method="post">
                                <table   class="info-det">
                                    <%
                                        CConversion c = new CConversion();
                                        for (int index = 0; index < ListaridTrabajador.size(); index++) {
                                            V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                                            trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);

                                    %>
                                    <td>
                                        <table>
                                            <tr><td class="td">Nombre :</td><td class="td1"><%=trb.getNo_trabajador().toUpperCase()%></td></tr>
                                            <tr><td class="td">Apellido Paterno :</td><td class="td1"><%=trb.getAp_paterno().toUpperCase()%></td></tr>
                                            <tr><td class="td">Apellido Materno :</td><td class="td1"><%=trb.getAp_materno().toUpperCase()%></td></tr>
                                            <tr><td class="td">Fecha de Nacimiento :</td><td class="td1"><%=c.convertFecha5(trb.getFe_nac())%></td></tr>
                                        </table>
                                    </td>
                                    <%String ID_ROL = (String) sesion.getAttribute("IDROL");
                                        for (int e = 0; e < id_empleadox_ide.size(); e++) {
                                            Empleado emp = new Empleado();
                                            emp = (Empleado) id_empleadox_ide.get(e);
                                            if (ID_ROL.trim().equals("ROL-0009")) {
                                                int val_aps = Integer.parseInt(request.getParameter("val_aps"));
                                                if (val_aps > 0) {%>

                                    <td>
                                        <table class="info-det">
                                            <tr><td class="td" colspan="3">Codigo APS:</td></tr>
                                            <tr><td class="td" colspan="2"><%=emp.getCo_aps()%></td></tr>
                                        </table>
                                    </td>
                                    <%} else {%>
                                    <td>
                                        <table class="info-det">
                                            <input type="hidden" name="iddetalle_dgp" value="<%=iddgp%>">
                                            <input type="hidden" name="puesto_id" value="<%=idp%>">
                                            <input type="hidden" name="cod" value="<%=cod%>">
                                            <input type="hidden" name="idpasos" value="<%=id_pasos%>">
                                            <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>">
                                            <input type="hidden"name="nup" value="<%=nropaso%>">
                                            <input type="hidden" name="idtr" value="<%=idtra%>">
                                            <tr><td class="td" colspan="2">Registrar codigo APS</td></tr>
                                            <tr><td><input type="text" id="cod_ap" name="cod_aps" maxlength="6"></td></tr>
                                            <tr><td><button value="registrar_aps" name="opc">Registrar</button></td></tr>
                                        </table>
                                    </td>
                                    <%}
                                        }
                                        if (ID_ROL.trim().equals("ROL-0007") || ID_ROL.trim().equals("ROL-0001")) {
                                            int val_huella = Integer.parseInt(request.getParameter("val_huella"));
                                            if (val_huella > 0) {%>
                                    <td>
                                        <table class="info-det">
                                            <tr><td class="td" 
                                                    >Codigo huella digital:</td></tr>
                                            <tr><td class="td" ><%=emp.getCo_huella_digital()%></td></tr>
                                        </table>
                                    </td>
                                    <%} else {%>
                                    <td>
                                        <table class="info-det">
                                            <input type="hidden" name="iddetalle_dgp" value="<%=iddgp%>">
                                            <input type="hidden" name="puesto_id" value="<%=idp%>">
                                            <input type="hidden" name="cod" value="<%=cod%>">
                                            <input type="hidden" name="idpasos" value="<%=id_pasos%>">
                                            <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>">
                                            <input type="hidden"name="nup" value="<%=nropaso%>">
                                            <input type="hidden" name="idtr" value="<%=idtra%>">
                                            <tr><td class="td" colspan="3">Registrar Codigo de huella digital</td></tr>
                                            <tr><td><input type="text" id="cod_ap" name="cod_huella" maxlength="6"></td></tr>
                                            <tr><td><button value="registrar_huella" name="opc">Registrar</button></td></tr>
                                        </table>
                                    </td>
                                    <%}
                                        }%>
                                    <%}%>
                                </table>
                            </form>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

        <!--End Detalle Trabajador-->

        <!-- Begin TABS-->
        <div class="jarviswidget well" id="wid-id-3" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-sortable="false">
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
                <span class="widget-icon"> <i class="fa fa-comments"></i> </span>
                <h2>Default Tabs with border </h2>

            </header>

            <!-- widget div-->
            <div>

                <!-- widget edit box -->
                <div class="jarviswidget-editbox">
                    <!-- This area used as dropdown edit box -->

                </div>
                <!-- end widget edit box -->

                <!-- widget content -->
                <div class="widget-body">


                    <hr class="simple">
                    <ul id="myTab1" class="nav nav-tabs bordered">
                        <%if (iddep.equals("DPT-0019") || idrol.trim().equals("ROL-0012") || idrol.trim().equals("ROL-0002") || idrol.trim().equals("ROL-0005")) {
                        %>
                        <li >
                            <a href="../../contrato?idtr=<%=idtr%>&opc=Detalle_Contractual" target="myframe2"  ><i class="fa fa-file-text fa-gear"></i> Información Contractual </a>
                        </li>
                        <%}%>
                        <li >
                            <a href="Datos_Generales.jsp" target="myframe2"  ><i class="fa fa-male fa-gear"></i> Información General </a>
                        </li>
                        <li>
                            <a href="Aspecto_Academico.jsp" target="myframe2"><i class="fa fa-graduation-cap fa-gear"></i> Aspecto Académico</a>
                        </li>
                        <li >
                            <a href="Aspecto_Social.jsp" target="myframe2"><i class="fa fa-home fa-gear"></i> Aspecto Social </a>
                        </li>
                        <li >
                            <a href="../../familiar?idtr=<%=idtr%>&opc=Detalle_Familiar" target="myframe2"><i class="fa fa-group fa-gear"></i> Familiares </a>
                        </li>
                        <li >
                            <a href="../../dgp?idtr=<%=idtr%>&opc=List_Dgp_Tr" target="myframe2"><i class="fa fa-file-o fa-gear"></i> Historial de Requerimientos </a>
                        </li>
                        <li >
                            <a href="../../trabajador?idtr=<%=idtr%>&opc=Documento_Trabajador" target="myframe2"><i class="fa fa-file fa-gear"></i> Documentación </a>
                        </li>

                        <%if (idrol.trim().equals("ROL-0007") | ID_ROL.trim().equals("ROL-0001")) {
                        %>
                        <li >
                            <a href="../../empleado?opc=Eva_Emp&idtr=<%=idtr%>" target="myframe2"><i class="fa fa-file-text fa-gear"></i> Evaluación de Empleado</a>
                        </li>
                        <%}%>
                        <%  if (List_Auto_mostrar.size() == 1 && aut != null) {
                                for (int r = 0; r < List_Auto_mostrar.size(); r++) {
                                    Auto_Mostrar a = new Auto_Mostrar();
                                    a = (Auto_Mostrar) List_Auto_mostrar.get(r);
                        %>
                        <li >
                            <a href="<%=a.getDi_url() + "&iddgp=" + iddgp + "&idtr=" + trb.getId_trabajador()%>" target="myframe2"><i class="fa fa-file-text fa-gear"></i> Datos de Requerimientos</a>
                        </li>
                        <%}

                            }%>
                    </ul>
                    <div id="myTabContent1" class="tab-content padding-10">
                        <%  if (List_Auto_mostrar.size() == 1 && aut != null) {
                                for (int r = 0; r < List_Auto_mostrar.size(); r++) {
                                    Auto_Mostrar a = new Auto_Mostrar();
                                    a = (Auto_Mostrar) List_Auto_mostrar.get(r);
                        %>
                        <iframe id="myframe2" name="myframe2" class="autoHeight" src="<%=a.getDi_url() + "&iddgp=" + iddgp + "&idtr=" + trb.getId_trabajador()%>" width="100%" height="100%" ></iframe>
                        <%}
                            List_Auto_mostrar.clear();
                        } else {%>
                        <iframe id="myframe2" name="myframe2" width="100%" height="800" scrolling="si" frameborder="0" src="Datos_Generales.jsp"></iframe>
                        <%}%>
                    </div>
                </div>

                <!-- end widget content -->

            </div>
            <!-- end widget div -->

        </div>        
        <!-- end TABS-->
        <div >
            <%

                if (aut != null) {
                    if (aut.equals("1")) {


            %>
            <center>
                <%                    if (idrol.trim().equals("ROL-0006")) {
                        int vnc = Integer.parseInt(request.getParameter("vnc"));
                        if (vnc > 0) {

                %>
                <form class="form-aut" action="../../autorizacion" method="post" > 
                    <table > 
                        <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >           
                        <input type="hidden" name="NROPASO" value="<%=nropaso%>"  >                
                        <input type="hidden" name="COD" value="<%=cod%>"  >               
                        <input type="hidden" name="PUESTO_ID" value="<%=idp%>" >  
                        <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>"  >  
                        <input type="hidden" name="IDPASOS" value="<%=id_pasos%>"   >
                        <tr><td><input type="hidden" name="opc"  class="submit" value="Aceptar"/></td></tr>
                        <button class="btn btn-labeled btn-success btn-autor" type="submit">
                            <span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span>PROCESAR 
                        </button>
                    </table>
                </form>
                <%
                    }
                } else {

                    if (idrol.trim().equals("ROL-0009")) {
                        int val_aps = Integer.parseInt(request.getParameter("val_aps"));
                        if (val_aps > 0) {

                %>

                <form class="form-aut" action="../../autorizacion" method="post" > 
                    <table > 
                        <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >           
                        <input type="hidden" name="NROPASO" value="<%=nropaso%>"  >                
                        <input type="hidden" name="COD" value="<%=cod%>"  >               
                        <input type="hidden" name="PUESTO_ID" value="<%=idp%>" >  
                        <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>"  >  
                        <input type="hidden" name="IDPASOS" value="<%=id_pasos%>"   >
                        <tr><td><input type="hidden" name="opc"  class="submit" value="Aceptar"/></td></tr>
                        <button class="btn btn-labeled btn-success btn-autor" type="submit">
                            <span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span>ENVIAR 
                        </button>
                    </table>
                </form>
                <%}
                } else {%>
                <% if (idrol.trim().equals("ROL-0007") | ID_ROL.trim().equals("ROL-0001")) {
                        int val_huella = Integer.parseInt(request.getParameter("val_huella"));
                        if (val_huella > 0) {%>
                <form class="form-aut" action="../../autorizacion" method="post" > 
                    <table > 
                        <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >           
                        <input type="hidden" name="NROPASO" value="<%=nropaso%>"  >                
                        <input type="hidden" name="COD" value="<%=cod%>"  >               
                        <input type="hidden" name="PUESTO_ID" value="<%=idp%>" >  
                        <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>"  >  
                        <input type="hidden" name="IDPASOS" value="<%=id_pasos%>"   >
                        <tr><td><input type="hidden" name="opc"  class="submit" value="Aceptar"/></td></tr>
                        <button class="btn btn-labeled btn-success btn-autor" type="submit">
                            <span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span>AUTORIZAR REQUERIMIENTO 
                        </button>

                    </table>
                </form>
                <%}
                } else {%>
                <form class="form-aut" action="../../autorizacion" method="post" > 
                    <table > 
                        <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >           
                        <input type="hidden" name="NROPASO" value="<%=nropaso%>"  >                
                        <input type="hidden" name="COD" value="<%=cod%>"  >               
                        <input type="hidden" name="PUESTO_ID" value="<%=idp%>" >  
                        <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>"  >  
                        <input type="hidden" name="IDPASOS" value="<%=id_pasos%>"   >
                        <tr><td><input type="hidden" name="opc"  class="submit" value="Aceptar"/></td></tr>
                        <button class="btn btn-labeled btn-success btn-autor" type="submit">
                            <span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span>AUTORIZAR REQUERIMIENTO 
                        </button>

                    </table>
                </form>
                <%}%>

                <%}
                    }%>
                <form class="form-rech" action="../../autorizacion" method="post">
                    <table>
                        <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >           
                        <input type="hidden" name="NROPASO" value="<%=nropaso%>"  >                
                        <input type="hidden" name="COD" value="<%=cod%>"  >               
                        <input type="hidden" name="PUESTO_ID" value="<%=idp%>" >  
                        <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>"  >  
                        <input type="hidden" name="IDPASOS" value="<%=id_pasos%>" 
                               <tr><td><input type="hidden" name="opc"  class="submit" value="Rechazar"/></td></tr>
                        <button class="btn btn-labeled btn-danger btn-rech" type="submit">
                            <span class="btn-label"><i class="glyphicon glyphicon-remove"></i></span>RECHAZAR 
                        </button>
                    </table>
                </form>   
            </center>
            <%}
                }
            %>
        </div>

        <%    if (academico != null) {%>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Carga Academica</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form_carga_academica">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="category"> Fecha de Inicio:</label>
                                        <input type="date" class="form-control" value="" name="DESDE" required />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="category"> Fecha de Cese:</label>
                                        <input type="date" class="form-control" value="" name="HASTA" required />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="category"> Tipo de Hora Pago:</label>
                                        <input type="text" class="form-control" value="25" placeholder="0.0"  name="TI_HORA_PAGO" required />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="category"> Horas Laborables:</label>
                                        <%
                                            if (hl != null) {
                                                 if (Boolean.valueOf(academico) == true) {
                                        %>
                                        <input type="text" class="form-control" value="<%=hl%>" name="HL" placeholder="0" required />
                                        <%} else {%>
                                        <input type="text" class="form-control"  name="HL" placeholder="0" required />
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                            <label for="category" > <strong>CUOTAS</strong></label>
                            <br>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="category"> MES 1 :</label>
                                        <input type="text" class="form-control" name="MES1" value="700" placeholder="0" required />
                                        <label for="category"> MES 2 :</label>
                                        <input type="text" class="form-control" name="MES2" value="700" placeholder="0" required />
                                        <label for="category"> MES 3 :</label>
                                        <input type="text" class="form-control" name="MES3" value="700" placeholder="0" required />
                                        <label for="category"> MES 4 :</label>
                                        <input type="text" class="form-control" name="MES4" value="700" placeholder="0" required />
                                        <input type="hidden" name="num_itera" value="4" >
                                        <input type="text" name="PUESTO" value="PUT-000482" >
                                        <input type="text" name="REQ" value="REQ-0018">
                                        <input type="hidden" name="IDTR" value="<%=idtr%>" >
                                        <input type="hidden" name="eap" value="<%=request.getParameter("eap")%>" >
                                        <input type="hidden" name="facultad" value="<%=request.getParameter("facultad")%>" >

                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                    Cancelar
                                </button>
                                <button type="button" class="btn btn-primary btn_guardar_ca"  data-dismiss="modal">
                                    Guardar
                                </button>
                            </div>
                        </form>

                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <%}%>
        <%}%>

        <script>
            $(document).ready(function () {

                $(".btn_guardar_ca").click(function () {
                    $.ajax({
                        url: "../../carga_academica",
                        type: "POST",
                        data: "opc=Registrar_CA&" + $(".form_carga_academica").serialize()
                    }).done(function () {
                        alert("Registrado con exito!...");
                        $(".btn_procesar").show();
                    }).fail(function (e) {
                        alert("Error: " + e);
                    });
                });

                $(".btn-autor").click(function (e) {
                    $.SmartMessageBox({
                        title: "Alerta de Confirmación!",
                        content: "¿Esta totalmente seguro de autorizar este requerimiento?",
                        buttons: '[No][Si]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Si") {
                            // return true;
                            $(".form-aut").submit();
                        }
                        if (ButtonPressed === "No") {
                            return false;
                        }
                    });
                    e.preventDefault();
                });
                $(".btn-rech").click(function (e) {
                    $.SmartMessageBox({
                        title: "Alerta de Confirmación!",
                        content: "¿Esta totalmente seguro de rechazar este requerimiento?",
                        buttons: '[No][Si]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Si") {
                            $(".form-rech").submit();
                        }
                        if (ButtonPressed === "No") {
                            return false;
                        }

                    });
                    e.preventDefault();
                });
            });</script>

        <script src="../../js/JQuery/jQuery.js"></script>
        <script src="../../js/Js_dlmenu/jquery.dlmenu.js"></script>
        <script>
            $(function () {
                $('#dl-menu').dlmenu({
                    animationClasses: {classin: 'dl-animate-in-2', classout: 'dl-animate-out-2'}
                });
            });</script>

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
        <script src="../../js/plugin/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!
            function closedthis() {
                $.smallBox({
                    title: "¡Ficha de trabajador registrada correctamente!",
                    content: "ya puede visualizar toda la informacion del trabajador...",
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
            $(document).ready(function () {

                pageSetUp();

                $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                    $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                });
                $("#cod_ap").numeric();
                /*
                 * Autostart Carousel
                 */
                $('.carousel.slide').carousel({
                    interval: 3000,
                    cycle: true
                });
                $('.carousel.fade').carousel({
                    interval: 3000,
                    cycle: true
                });
                // Fill all progress bars with animation

                $('.progress-bar').progressbar({
                    display_text: 'fill'
                });
                /*
                 * Smart Notifications
                 */
                $('#eg1').click(function (e) {

                    $.bigBox({
                        title: "Big Information box",
                        content: "This message will dissapear in 6 seconds!",
                        color: "#C46A69",
                        //timeout: 6000,
                        icon: "fa fa-warning shake animated",
                        number: "1",
                        timeout: 6000
                    });
                    e.preventDefault();
                })

                $('#eg2').click(function (e) {

                    $.bigBox({
                        title: "Big Information box",
                        content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#3276B1",
                        //timeout: 8000,
                        icon: "fa fa-bell swing animated",
                        number: "2"
                    });
                    e.preventDefault();
                })

                $('#eg3').click(function (e) {

                    $.bigBox({
                        title: "Shield is up and running!",
                        content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#C79121",
                        //timeout: 8000,
                        icon: "fa fa-shield fadeInLeft animated",
                        number: "3"
                    });
                    e.preventDefault();
                })

                $('#eg4').click(function (e) {

                    $.bigBox({
                        title: "Success Message Example",
                        content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#739E73",
                        //timeout: 8000,
                        icon: "fa fa-check",
                        number: "4"
                    }, function () {
                        closedthis();
                    });
                    e.preventDefault();
                })



                $('#eg5').click(function () {

                    $.smallBox({
                        title: "Ding Dong!",
                        content: "Someone's at the door...shall one get it sir? <p class='text-align-right'><a href='javascript:void(0);' class='btn btn-primary btn-sm'>Yes</a> <a href='javascript:void(0);' class='btn btn-danger btn-sm'>No</a></p>",
                        color: "#296191",
                        //timeout: 8000,
                        icon: "fa fa-bell swing animated"
                    });
                });
                $('#eg6').click(function () {

                    $.smallBox({
                        title: "Big Information box",
                        content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#5384AF",
                        //timeout: 8000,
                        icon: "fa fa-bell"
                    });
                })

                $('#eg7').click(function () {

                    $.smallBox({
                        title: "James Simmons liked your comment",
                        content: "<i class='fa fa-clock-o'></i> <i>2 seconds ago...</i>",
                        color: "#296191",
                        iconSmall: "fa fa-thumbs-up bounce animated",
                        timeout: 4000
                    });
                })


                /*
                 * SmartAlerts
                 */
                // With Callback
                $("#smart-mod-eg1").click(function (e) {
                    $.SmartMessageBox({
                        title: "Smart Alert!",
                        content: "This is a confirmation box. Can be programmed for button callback",
                        buttons: '[No][Yes]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Yes") {

                            $.smallBox({
                                title: "Callback function",
                                content: "<i class='fa fa-clock-o'></i> <i>You pressed Yes...</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 4000
                            });
                        }
                        if (ButtonPressed === "No") {
                            $.smallBox({
                                title: "Callback function",
                                content: "<i class='fa fa-clock-o'></i> <i>You pressed No...</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 4000
                            });
                        }

                    });
                    e.preventDefault();
                })
                // With Input
                $("#smart-mod-eg2").click(function (e) {

                    $.SmartMessageBox({
                        title: "Smart Alert: Input",
                        content: "Please enter your user name",
                        buttons: "[Accept]",
                        input: "text",
                        placeholder: "Enter your user name"
                    }, function (ButtonPress, Value) {
                        alert(ButtonPress + " " + Value);
                    });
                    e.preventDefault();
                })
                // With Buttons
                $("#smart-mod-eg3").click(function (e) {

                    $.SmartMessageBox({
                        title: "Smart Notification: Buttons",
                        content: "Lots of buttons to go...",
                        buttons: '[Need?][You][Do][Buttons][Many][How]'
                    });
                    e.preventDefault();
                })
                // With Select
                $("#smart-mod-eg4").click(function (e) {

                    $.SmartMessageBox({
                        title: "Smart Alert: Select",
                        content: "You can even create a group of options.",
                        buttons: "[Done]",
                        input: "select",
                        options: "[Costa Rica][United States][Autralia][Spain]"
                    }, function (ButtonPress, Value) {
                        alert(ButtonPress + " " + Value);
                    });
                    e.preventDefault();
                });
                // With Login
                $("#smart-mod-eg5").click(function (e) {

                    $.SmartMessageBox({
                        title: "Login form",
                        content: "Please enter your user name",
                        buttons: "[Cancel][Accept]",
                        input: "text",
                        placeholder: "Enter your user name"
                    }, function (ButtonPress, Value) {
                        if (ButtonPress == "Cancel") {
                            alert("Why did you cancel that? :(");
                            return 0;
                        }

                        Value1 = Value.toUpperCase();
                        ValueOriginal = Value;
                        $.SmartMessageBox({
                            title: "Hey! <strong>" + Value1 + ",</strong>",
                            content: "And now please provide your password:",
                            buttons: "[Login]",
                            input: "password",
                            placeholder: "Password"
                        }, function (ButtonPress, Value) {
                            alert("Username: " + ValueOriginal + " and your password is: " + Value);
                        });
                    });
                    e.preventDefault();
                });
            })

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
            })();</script>
        <script type="text/javascript">
            $(document).ready(
                    function () {


                    });</script>
        <script type="text/javascript" language="javascript">
            $('.ver_foto').click(function () {
                $(".file-foto").click();
            });
            $(window).load(function () {

                $(function () {
                    $('.file-foto').change(function (e) {

                        if (this.files[0].size <= 500000) {
                            var jForm = new FormData();
                            jForm.append("idtr", $('.idtr').val());
                            jForm.append("archivo", $('.file-foto').get(0).files[0]);
                            $.ajax({
                                type: "POST",
                                url: "../../foto",
                                cache: false,
                                processData: false,
                                contentType: false,
                                data: jForm
                            }).done(function (f) {
                                $(".mensaje").text(f);
                            });
                            addImage(e);
                            // alert("Archivo permitido");
                        } else {
                            alert("Archivo no permitido, su tamaño debe ser menor a 500 KB");
                            $(this).val('');
                        }


                    });
                    function addImage(e) {
                        var file = e.target.files[0],
                                imageType = /image.*/;
                        if (!file.type.match(imageType))
                            return;
                        var reader = new FileReader();
                        reader.onload = fileOnload;
                        reader.readAsDataURL(file);
                    }
                    function fileOnload(e) {
                        var result = e.target.result;
                        $('.ver_foto').attr("src", result);
                    }
                });
            });
        </script>
        <%}%>
    </body>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>
