<%@page import="pe.edu.upeu.application.dao.DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.Datos_Hijo_Trabajador"%>
<%@page import="pe.edu.upeu.application.model.Padre_Madre_Conyugue"%>
<%@page import="pe.edu.upeu.application.model.V_Reg_Dgp_Tra"%>
<jsp:useBean id="List_Hijos" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Conyugue" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Adventista" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_doc_req_pla" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Registrar Documento </title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../../img/splash/touch-icon-ipad-retina.png">
        <script type="text/javascript" src="../../../js/shadowbox/demo.js"></script>
        <link rel="stylesheet" type="text/css" href="../../../js/shadowbox/shadowbox.css"/>
        <link rel="stylesheet" type="text/css" href="../../../js/shadowbox/style.css"/>
        <script type="text/javascript" src="../../../js/shadowbox/shadowbox.js"></script>
        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <script type="text/javascript">
            Shadowbox.init({
                // a darker overlay looks better on this particular site
                overlayOpacity: 0.8
                        // setupDemos is defined in assets/demo.js
            }, setupDemos);</script>
        <link href="../../../css/Css_Bootstrap/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    </head>
    <%  //String num = request.getParameter("num");
        // int num_doc = Integer.parseInt(num);
        if (request.getParameter("a") != null) {
            if (request.getParameter("a").trim().equals("t")) {
    %>

    <body onload="closedthis();">

        <%
            }
            if (request.getParameter("a").trim().equals("e")) {%>
    <body onload="closedthis2()">
        <%}
        } else {
        %>
    <body class="">
        <%}%>
        <%
            HttpSession sesion_1 = request.getSession(true);
            String rol = (String) sesion_1.getAttribute("IDROL");
            int n_nac = Integer.parseInt(request.getParameter("n_nac"));
            int num_ad = Integer.parseInt(request.getParameter("num_ad"));
            String id_ctr = "";
            InterfaceDocumentoDAO doc_ = new DocumentoDAO();

            //String id_dgp = "";
        %>
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->
        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">
                <!-- widget grid -->
                <section id="widget-grid" class="">
                    <!-- START ROW -->
                    <div class="row">
                        <!-- NEW COL START -->
                        <article class="col-sm-12 col-md-12 col-lg-12">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-purple" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false">
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
                                    <h2>Registrar Documentos</h2>				
                                </header>


                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding"  >



                                        <!--<form action="../../../documento" method="post" enctype="multipart/form-data" class="smart-form" novalidate="novalidate" id="checkout-form">-->
                                        <form action="../../../documento" method="post" enctype="multipart/form-data"  class="smart-form" >



                                            <table id="datatable_tabletools" class="table table-bordered table-hover table-responsive" width="100%">

                                                <thead>
                                                <center>
                                                    <tr>
                                                        <th class="cajita" style="text-align:center;">ADJUNTAR</th>   
                                                        <th class="cajita" style="text-align:center;">DETALLE</th>   
                                                        <th class="cajita" style="text-align:center;">ACCION</th>   
                                                    </tr>
                                                </center>
                                                </thead>
                                                <tbody>
                                                    <%                        int i = 0;
                                                        for (int z = 0; z < List_doc_req_pla.size(); z++) {
                                                            V_Reg_Dgp_Tra d = new V_Reg_Dgp_Tra();
                                                            d = (V_Reg_Dgp_Tra) List_doc_req_pla.get(z);
                                                    %>

                                                    <%  if (d.getTi_documento().trim().equals("DOCA")) {%>
                                                    <%  if (n_nac != 0) {%>
                                                    <tr>
                                                        <td  style="width:50%;" align="center">
                                                            <table class="table table-striped">
                                                                <tr>
                                                                    <td align="center" style="border:1px solid;border-color: #D2691E;height:30%"><strong><%=d.getDocumento()%></strong></td>
                                                                </tr><br>
                                                                <tr>
                                                                    <td class="caji<%=(i + 1)%>"  align="center">
                                                                        <% if (d.getId_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                        <div class="form-group">
                                                                            <input id="file-5" class="file" type="file" multiple=true data-preview-file-type="any" data-upload-url="#"  <%if (d.getEs_obligatorio().equals("1")) {
                                                                                    out.println(" required='required' ");
                                                                                }%> name="archivos<%=(i + 1)%>" >
                                                                        </div>
                                                                        <% } else { %>
                                                                        <% if (d.getId_documento_adjunto() == null) { %>
                                                                        <label class="null">No Registrado</label>
                                                                        <% } else {%>   
                                                                        <%
                                                                            out.print(doc_.List_files(d.getId_documento_adjunto().trim()));
                                                                        %>
                                                                        <% }
                                                                            } %>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                        <td style="text-align:center;" align="center">
                                                            <label >DESCRIPCIÓN:</label><br>
                                                            <label>
                                                                <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                <input type="text" name="lob_description<%=i + 1%>" maxlength="200" >
                                                                <% } else { %>
                                                                <% if (d.getDe_documento_adjunto() == null) { %>
                                                                <label class="null" >No Registrado</label><BR><BR>
                                                                <% } else {%>
                                                                <label> <%=d.getDe_documento_adjunto()%></label><BR><BR>

                                                                <% } %>
                                                                <% } %>
                                                            </label><br><br>
                                                            <%if (d.getEs_documento_adjunto() == null) {%>
                                                            <section class="col col-10" style="text-align:center;" align="center">
                                                                <%}%>
                                                                <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                <label class="toggle"align="center"  style="padding-left:0px;"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i>¿RECIBIDO EN FISICO?:</label>
                                                                    <% } else { %>
                                                                    <% if (d.getEs_documento_adjunto() == null) { %>

                                                                <label class="null">No Registrado</label>
                                                                <% } else { %>
                                                                <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>
                                                                    ¿RECIBIDO EN FISICO?:<br><img src="Aprobado.png" width="20" height="20">
                                                                    <%
                                                                    } else {

                                                                    %>
                                                                    ¿RECIBIDO EN FISICO?:<br><img src="Desaprobado.png" width="20" height="20">
                                                                </label>
                                                                <% }
                                                                        }
                                                                    }%>
                                                                <%if (d.getEs_documento_adjunto() == null) {%>
                                                            </section>
                                                            <%}%>
                                                        </td>
                                                        <td class="table-bordered" style="text-align:center;" align="center">
                                                            <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                            <a type="button"  class="btn btn-danger btn-sm btn_reg_doc elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getId_dgp()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
                                                            <%} else {
                                                                    out.print("");
                                                                }%>
                                                        </td>
                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                </tr>  




                                                <%}
                                                    }%>
                                                <%  if (d.getTi_documento().trim().equals("COFE")) {%>
                                                <%  if (num_ad != 0) {%>
                                                <tr>
                                                    <td  style="width:50%;" align="center">
                                                        <table class="table table-striped">
                                                            <tr><td align="center" style="border:1px solid;border-color: #D2691E;height:30%"><strong><%=d.getDocumento()%></strong></td></tr><br>
                                                            <tr><td  class="caji<%=(i + 1)%>"   align="center"><% if (d.getId_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                    <div class="form-group">
                                                                        <input id="file-5" class="file" type="file" multiple=true data-preview-file-type="any" data-upload-url="#"  <%if (d.getEs_obligatorio().equals("1")) {
                                                                                out.println(" required='required' ");
                                                                            }%> name="archivos<%=(i + 1)%>" >
                                                                    </div>
                                                                    <% } else { %>
                                                                    <% if (d.getId_documento_adjunto() == null) { %>
                                                                    <label class="null">No Registrado</label>
                                                                    <% } else {%>
                                                                    <%
                                                                        out.print(doc_.List_files(d.getId_documento_adjunto().trim()));
                                                                    %>

                                                                    <% }
                                                                        }%></td>
                                                            </tr>
                                                        </table>


                                                    </td>

                                                    <td style="text-align:center;" align="center">

                                                        <label >DESCRIPCIÓN:</label><BR>
                                                        <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <input type="text"  name="lob_description<%=i + 1%>"><BR><BR>
                                                        <% } else { %>
                                                        <% if (d.getDe_documento_adjunto() == null) { %>
                                                        <label class="null" >No Registrado</label><BR><BR>
                                                        <% } else {%>
                                                        <label style="font-weight: normal;"><%=d.getDe_documento_adjunto()%> </label><br><br>

                                                        <% } %>
                                                        <% } %>    
                                                        <%if (d.getEs_documento_adjunto() == null) {%>
                                                        <section class="col col-10" style="text-align:center;" align="center">
                                                            <%}%>
                                                            <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                            <label>¿RECIBIDO EN FISICO?:</label><br> <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                                <% } else { %>
                                                                <% if (d.getEs_documento_adjunto() == null) { %>

                                                            <label class="null">¿RECIBIDO EN FISICO?:<br>No Registrado</label>
                                                                <% } else { %>
                                                            <label ><% if (d.getEs_documento_adjunto().trim().equals("1")) {
                                                                %>

                                                                ¿RECIBIDO EN FISICO?:<br><img src="Aprobado.png" width="20" height="20">
                                                                <%
                                                                } else {

                                                                %>
                                                                ¿RECIBIDO EN FISICO?:<br><img src="Desaprobado.png" width="20" height="20">
                                                            </label>
                                                            <% }
                                                                    }
                                                                }%>
                                                            <%if (d.getEs_documento_adjunto() == null) {%>
                                                        </section>
                                                        <%}%>

                                                    </td>
                                                    <td class="table-bordered" style="text-align:center;" align="center">
                                                        <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <a type="button"  class="btn btn-danger btn-sm btn_reg_doc elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getId_dgp()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
                                                        <%} else {
                                                                out.print("");
                                                            }%>
                                                    </td>
                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                </tr>  


                                                <%}
                                                    }%>
                                                <%  if (d.getTi_documento().trim().equals("DNIC") | d.getTi_documento().trim().equals("ACMA")) {%>

                                                <%

                                                    for (int kj = 0; kj < List_Conyugue.size(); kj++) {
                                                        Padre_Madre_Conyugue co = new Padre_Madre_Conyugue();
                                                        co = (Padre_Madre_Conyugue) List_Conyugue.get(kj);
                                                %>             


                                                <tr>
                                                    <td  style="width:50%;" align="center">
                                                        <table class="table table-striped">
                                                            <tr> 
                                                                <td align="center" style="border:1px solid;border-color: #D2691E;height:30%">
                                                                    <strong><%  if (d.getTi_documento().trim().equals("ACMA")) {
                                                                            out.println("ACTA DE MATRIMONIO CON: <p style='color:red;' >" + co.getAp_nombres_conyugue() + "</p>");
                                                                        }
                                                                        if (d.getTi_documento().trim().equals("DNIC")) {
                                                                            out.println("COPIA DNI CONYUGUE : <p style='color:red;' >" + co.getAp_nombres_conyugue() + "</p>");
                                                                        }%>
                                                                    </strong>
                                                                </td>
                                                            </tr><br>
                                                            <tr> 
                                                                <td class="caji<%=(i + 1)%>"  align="center" >
                                                                    <% if (d.getId_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                    <div class="form-group">
                                                                        <input id="file-5" class="file" type="file" multiple=true data-preview-file-type="any" data-upload-url="#"  <%if (d.getEs_obligatorio().equals("1")) {
                                                                                out.println(" required='required' ");
                                                                            }%> name="archivos<%=(i + 1)%>" style="height:40px;">
                                                                    </div>
                                                                    <% } else { %>
                                                                    <% if (d.getId_documento_adjunto() == null) { %>
                                                                    <label class="null">No Registrado</label>
                                                                    <% } else {%>
                                                                    <%
                                                                        out.print(doc_.List_files(d.getId_documento_adjunto().trim()));
                                                                    %>

                                                                    <% }
                                                                        } %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>

                                                    <td  style="text-align:center;" align="center">
                                                        <label>DESCRIPCIÓN:</label><BR>
                                                        <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <input type="text"  name="lob_description<%=i + 1%>"><BR><BR>
                                                        <% } else { %>
                                                        <% if (d.getDe_documento_adjunto() == null) { %>
                                                        <label class="null" >No Registrado</label><BR><BR>
                                                        <% } else {%>
                                                        <label> <%=d.getDe_documento_adjunto()%></label><BR><BR>

                                                        <% } %>
                                                        <% } %>   

                                                        <%if (d.getEs_documento_adjunto() == null) {%>
                                                        <section class="col col-10" style="text-align:center;" align="center">
                                                            <%}%>
                                                            <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                            <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i>¿RECIBIDO EN FISICO?:</label>
                                                                <% } else { %>
                                                                <% if (d.getEs_documento_adjunto() == null) { %>

                                                            <label class="null">¿RECIBIDO EN FISICO?:<br>No Registrado</label>
                                                                <% } else { %>
                                                            <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>
                                                                ¿RECIBIDO EN FISICO?:<br><img src="Aprobado.png" width="20" height="20">
                                                                <%
                                                                } else {

                                                                %>
                                                                ¿RECIBIDO EN FISICO?:<br><img src="Desaprobado.png" width="20" height="20">
                                                            </label>
                                                            <% }
                                                                    }
                                                                }%>
                                                            <%if (d.getEs_documento_adjunto() == null) {%>
                                                        </section >
                                                        <%}%>
                                                    </td>

                                                    <td class="table-bordered" style="text-align:center;" align="center">
                                                        <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <a type="button"  class="btn btn-danger btn-sm btn_reg_doc elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getId_dgp()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
                                                        <%} else {
                                                                out.print("");
                                                            }%>
                                                    </td>

                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                </tr>  



                                                <% } %>
                                                <% } %>

                                                <%  if (d.getTi_documento().trim().equals("DNIH")) {%>
                                                <%for (int kk = 0; kk < List_Hijos.size(); kk++) {
                                                        Datos_Hijo_Trabajador h = new Datos_Hijo_Trabajador();
                                                        h = (Datos_Hijo_Trabajador) List_Hijos.get(kk);
                                                %>


                                                <tr>
                                                    <td  style="width:50%;" align="center">
                                                        <table class="table table-striped">
                                                            <tr> 
                                                                <td align="center" style="border:1px solid;border-color: #D2691E;height:30%">
                                                                    <strong>COPIA DNI DEL HIJO :  <%=h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador()%></strong>
                                                                </td>
                                                            </tr><br>
                                                            <tr> 
                                                                <td class="caji<%=(i + 1)%>"  align="center">
                                                                    <% if (d.getId_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                    <div class="form-group">
                                                                        <input id="file-5" class="file" type="file" multiple=true data-preview-file-type="any" data-upload-url="#"  <%if (d.getEs_obligatorio().equals("1")) {
                                                                                out.println(" required='required' ");
                                                                            }%> name="archivos<%=(i + 1)%>" style="height:20px;">
                                                                    </div>
                                                                    <% } else { %>
                                                                    <% if (d.getId_documento_adjunto() == null) { %>
                                                                    <label class="null">No Registrado</label>
                                                                    <% } else {%>
                                                                    <%
                                                                        out.print(doc_.List_files(d.getId_documento_adjunto().trim()));
                                                                    %>
                                                                    <% }
                                                                        } %>
                                                                </td>
                                                            </tr>
                                                        </table>

                                                    </td>

                                                    <td  style="text-align:center;" align="center">
                                                        <label>DESCRIPCIÓN</label><BR>
                                                        <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <input type="text"  name="lob_description<%=i + 1%>"><BR><BR>
                                                        <% } else { %>
                                                        <% if (d.getDe_documento_adjunto() == null) { %>
                                                        <label class="null" >No Registrado</label><BR><br>
                                                        <% } else {%>
                                                        <label> <%=d.getDe_documento_adjunto()%></label><BR><br>

                                                        <% } %>
                                                        <% } %> 
                                                        <%if (d.getEs_documento_adjunto() == null) {%>
                                                        <section class="col col-10" style="text-align:center;" align="center">
                                                            <%}%>
                                                            <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                            <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i>¿RECIBIDO EN FISICO?:</label>
                                                                <% } else { %>
                                                                <% if (d.getEs_documento_adjunto() == null) { %>

                                                            <label class="null"> ¿RECIBIDO EN FISICO?:<br>No Registrado</label>
                                                                <% } else { %>
                                                            <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>

                                                                ¿RECIBIDO EN FISICO?:<br><img src="Aprobado.png" width="20" height="20">
                                                                <%
                                                                } else {

                                                                %>
                                                                ¿RECIBIDO EN FISICO?:<br><img src="Desaprobado.png" width="20" height="20">
                                                            </label>
                                                            <% }
                                                                    }
                                                                }%>
                                                            <%if (d.getEs_documento_adjunto() == null) {%>
                                                        </section>
                                                        <%}%>
                                                    </td>
                                                    <td  style="text-align:center;" align="center">
                                                        <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <a type="button"  class="btn btn-danger btn-sm btn_reg_doc elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getId_dgp()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
                                                        <%} else {
                                                                out.print("");
                                                            }%>
                                                    </td>
                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                </tr>  

                                                <%
                                                        i++;
                                                    }
                                                %>

                                                <%} else if (!d.getTi_documento().trim().equals("DNIH") & !d.getTi_documento().trim().equals("DNIC") & !d.getTi_documento().trim().equals("ACMA") & !d.getTi_documento().trim().equals("COFE") & !d.getTi_documento().trim().equals("DOCA")) {
                                                %>
                                                <tr>
                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                <td  style="width:50%;" align="center">
                                                    <table class="table table-striped">
                                                        <tr> 
                                                            <td align="center" style="border:1px solid;border-color: #D2691E;height:30%;margin-top:0px">
                                                                <strong><%=d.getDocumento()%></strong>
                                                            </td>
                                                        </tr><br>
                                                        <tr> 
                                                            <td class="caji<%=(i + 1)%>"  align="center">
                                                                <% if (d.getId_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                <div class="form-group">
                                                                    <input id="file-5" class="file" type="file" multiple=true data-preview-file-type="any" data-upload-url="#"  <%if (d.getEs_obligatorio().equals("1")) {
                                                                            out.println(" required='required' ");
                                                                        }%> name="archivos<%=(i + 1)%>" >
                                                                </div>

                                                                <% } else { %>
                                                                <% if (d.getId_documento_adjunto() == null) { %>
                                                                <label class="null">No Registrado</label>
                                                                <% } else {%>
                                                                <%
                                                                    out.print(doc_.List_files(d.getId_documento_adjunto().trim()));
                                                                %>

                                                                <% }
                                                                    } %>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </td>



                                                <td  style="text-align:center;" align="center">
                                                    <label> DESCRIPCIÓN:</label><BR>
                                                    <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                    <input type="text"   name="lob_description<%=i + 1%>"><BR><BR>
                                                    <% } else { %>


                                                    <% if (d.getDe_documento_adjunto() == null) { %>
                                                    <label class="null" >No Registrado</label><BR><BR>
                                                    <% } else {%>
                                                    <label> <%=d.getDe_documento_adjunto()%></label><BR><BR>

                                                    <% } %>
                                                    <% } %>
                                                    <%if (d.getEs_documento_adjunto() == null) {%>
                                                    <label>¿RECIBIDO EN FISICO?:</label><br>
                                                 
                                                        <%}%>
                                                        <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                         <label class="toggle"  ><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" style="margin-left:auto; margin-right:auto;" ><i data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                            <% } else { %>
                                                            <% if (d.getEs_documento_adjunto() == null) { %>

                                                        <label class="null">¿RECIBIDO EN FISICO?:<BR>No Registrado</label>
                                                            <% } else { %>
                                                        <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>
                                                            ¿RECIBIDO EN FISICO?:<BR><img src="Aprobado.png" width="20" height="20">
                                                            <%
                                                            } else {

                                                            %>
                                                            ¿RECIBIDO EN FISICO?:<BR><img src="Desaprobado.png" width="20" height="20">
                                                        </label>
                                                        <% }
                                                                }
                                                            }%>
                                                        <%if (d.getEs_documento_adjunto() == null) {%>
                                           
                                                    <%}%>
                                                </td>
                                                <td  class="table-bordered" style="text-align:center;" align="center">
                                                    <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                    <a type="button"  class="btn btn-danger btn-sm btn_reg_doc elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getId_dgp()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
                                                    <%} else {
                                                            out.print("");
                                                        }%>
                                                </td>
                                                </tr>  
                                                <input type="hidden" name="iddgp" value="<%=d.getIddgp()%>">
                                                <input type="hidden" name="idctr" value="<%=request.getParameter("idctr")%>">
                                                <input type="hidden" name="idtr" value="<%=request.getParameter("idtr")%>">
                                                <% }
                                                        i++;
                                                        //id_dgp = d.getIddgp();

                                                    }%>




                                                <input type="hidden" name="num" value="<%=i + 1%>">
                                                <% if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001")) { %>
                                                <%if (request.getParameter("P2") != null) {%>
                                                <%} else {%>
                                                <tr><td><input type="hidden" value="Registrar" name="opc"></td></tr>
                                                        <%}%>
                                                        <%}%>
                                                </tbody>

                                            </table>
                                            <footer>





                                                <%   if (request.getParameter("pro") != null) {
                                                        if (request.getParameter("pro").equals("pr_dgp")) {
                                                            out.println("<input  type='hidden' value='enter' name='P2'/>");
                                                        }
                                                    }

                                                    if (request.getParameter("P2") != null) {
                                                        if (request.getParameter("P2").equals("TRUE")) {%>
                                                <input  type='hidden' value='enter' name='P2'/>

                                                <a class="btn btn-success btn-labeled" href="../../../dgp?iddgp=<%=request.getParameter("iddgp")%>&idtr=<%=request.getParameter("idtr")%>&opc=rd">CONTINUAR <i class="fa fa-arrow-circle-right"></i> </a>

                                                <button type="submit" class="btn btn-primary btn_reg_doc" style="display:none"> <i class="fa fa-plus-square"></i>
                                                    Registrar
                                                </button>


                                                <% }
                                                } else {%>
                                                <button type="submit" class="btn btn-primary btn_reg_doc"style="display:none" >
                                                    Registrar
                                                </button>
                                                <button type="button" onclick="history.back()"  class="btn btn-default">
                                                    Atrás
                                                </button>

                                                <%}%>

                                                <%if (request.getParameter("dce") != null) {
                                                        if (request.getParameter("dce").equals("Doc_CE")) {
                                                            out.println("<input  type='hidden' value='CE' name='P2'/>");
                                                %>
                                                <!--<a class="btn btn-success" href="../../../dgp?idctr=<%=request.getParameter("idctr")%>&idtr=<%=request.getParameter("idtr")%>&opc=rd"><i class="fa fa-check"></i> CONTINUAR</a>-->
                                                <%}
                                                    }%>


                                            </footer>


                                        </form>


                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->


                        </article>
                        <!-- END COL -->
                    </div>
                    <!-- END ROW -->
                </section>
                <!-- end widget grid -->

                <!-- Modal -->
            </div>
            <!-- END MAIN CONTENT -->
        </div>
        <!-- END MAIN PANEL -->



        <!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
        Note: These tiles are completely responsive,
        you can add as many as you like
        -->

        <!-- END SHORTCUT AREA -->

        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
                                                    if (!window.jQuery) {
                                                        document.write('<script src="../../../js/libs/jquery-2.0.2.min.js"><\/script>');
                                                    }
        </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
                                                    if (!window.jQuery.ui) {
                                                        document.write('<script src="../../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                                                    }
        </script>

        <!-- IMPORTANT: APP CONFIG -->
        <script src="../../../js/app.config.js"></script>

        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
        <script src="../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

        <!-- BOOTSTRAP JS -->
        <script src="../../../js/bootstrap/bootstrap.min.js"></script>

        <!-- CUSTOM NOTIFICATION -->

        <!-- JARVIS WIDGETS -->
        <script src="../../../js/smartwidgets/jarvis.widget.min.js"></script>

        <!-- EASY PIE CHARTS -->
        <script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!-- SPARKLINES -->
        <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

        <!-- JQUERY SELECT2 INPUT -->
        <script src="../../../js/plugin/select2/select2.min.js"></script>
        <script src="../../../js/JQuery/jQuery.js"></script>

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="../../../js/plugin/fastclick/fastclick.min.js"></script>



        <!--[if IE 8]>

        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

        <![endif]-->

        <!-- Demo purpose only -->
        <script src="../../../js/demo.min.js"></script>

        <!-- MAIN APP JS FILE -->
        <script src="../../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="../../../js/speech/voicecommand.min.js"></script>

        <!-- PAGE RELATED PLUGIN(S) -->

        <script src="../../../js/plugin/jquery-form/jquery-form.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="../../../js/bootstrap/fileinput.js" type="text/javascript"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../../js/notification/SmartNotification.min.js"></script>
        <script type="text/javascript">
                                                    function closedthis() {
                                                        $.smallBox({
                                                            title: "¡Documento registrada correctamente!",
                                                            content: "ya puede visualizar el documento",
                                                            color: "#739E73",
                                                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                            timeout: 6000
                                                        });
                                                    }
                                                    function closedthis2() {
                                                        $.smallBox({
                                                            title: "¡Documento eliminado correctamente!",
                                                            content: "ya puede ver eñ cambio",
                                                            color: "#739E73",
                                                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                            timeout: 6000
                                                        });
                                                    }
                                                    $(document).ready(function () {

                                                        pageSetUp();
                                                        $.sound_path = "../../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                                                            $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                                                        });


                                                        $.each($(".file"), function (i) {

                                                            if ((i + 1) == 0) {
                                                                $(".btn_reg_doc").hide();
                                                                alert();
                                                            } else {
                                                                $(".btn_reg_doc").show();
                                                            }

                                                        });
                                                        $(".DD").change(function () {

                                                            $(".div-holi").text($(".DD").val());
                                                        });
                                                        $(".elimi").click(function () {
                                                            var msg = confirm('¿tas seguro de eliminar?');
                                                            if (msg == true) {
                                                                return true;
                                                            } else {
                                                                return false;
                                                            }
                                                        });
                                                    })

        </script>
        <script>

            $("#file-0").fileinput({
                'allowedFileExtensions': ['jpg', 'png', 'gif'],
            });
            $(".file").fileinput({
                // initialPreview: ["<img src='Desert.jpg' class='file-preview-image'>", "<img src='Jellyfish.jpg' class='file-preview-image'>"],
                /*   initialPreviewConfig: [
                 {caption: 'Desert.jpg', width: '120px', url: '#'},
                 {caption: 'Jellyfish.jpg', width: '120px', url: '#'},
                 ],*/
                //uploadUrl: '#',

                showUpload: false,
                layoutTemplates: {
                    main1: "{preview}\n" +
                            "<div class=\'input-group {class}\'>\n" +
                            "   <div class=\'input-group-btn\' >\n" +
                            "       {browse}\n" +
                            "       {upload}\n" +
                            "       {remove}\n" +
                            "   </div>\n" +
                            "   {caption}\n" +
                            "</div>"},
                allowedFileExtensions: ['jpg', 'png', 'gif', 'pdf', 'docx', 'doc'],
                overwriteInitial: false,
                maxFileSize: 500,
                maxFilesNum: 10,
                browseClass: "btn btn-primary btn-sm",
                removeClass:"btn btn-danger btn-sm",
                //allowedFileTypes: ['image', 'video', 'flash'],
                slugCallback: function (filename) {
                    return filename.replace('(', '_').replace(']', '_');
                }
            });
            /*
             $(".file").on('fileselect', function(event, n, l) {
             alert('File Selected. Name: ' + l + ', Num: ' + n);
             });
             */
            $("#file-3").fileinput({
                showUpload: false,
                showCaption: false,
                browseClass: "btn btn-primary btn-lg",
                fileType: "any"
            });
            $("#file-4").fileinput({
                uploadExtraData: [
                    {kvId: '10'}
                ],
            });
            $(".btn-warning").on('click', function () {
                if ($('#file-4').attr('disabled')) {
                    $('#file-4').fileinput('enable');
                } else {
                    $('#file-4').fileinput('disable');
                }
            });
            $(".btn-info").on('click', function () {
                $('#file-4').fileinput('refresh', {previewClass: 'bg-info'});
            });
            /*
             $('#file-4').on('fileselectnone', function() {
             alert('Huh! You selected no files.');
             });
             $('#file-4').on('filebrowse', function() {
             alert('File browse clicked for #file-4');
             });
             */
            $(document).ready(function () {
                $("#test-upload").fileinput({
                    'showPreview': false,
                    'allowedFileExtensions': ['jpg', 'png', 'gif'],
                    'elErrorContainer': '#errorBlock'
                });
                /*
                 $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
                 alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
                 });
                 */
            });</script>
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
        <script type="text/javascript" >
            var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
            try {
                var pageTracker = _gat._getTracker("UA-998116-7");
                pageTracker._trackPageview();
            } catch (err) {
            }
        </script>
    </body>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>
