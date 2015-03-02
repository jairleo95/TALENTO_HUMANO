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
            }, setupDemos);
        </script>
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../../css/Css_Bootstrap/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    </head>
    <body class="">
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
                                    <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                    <h2>REGISTRAR DOCUMENTO ADJUNTO </h2>				
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



                                            <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%">

                                                <thead>
                                                <center>
                                                    <tr>
                                                        <th class="cajita" style="width:25%;text-align:center;">DOCUMENTO</th>   
                                                        <th class="cajita" style="text-align:center;">ADJUNTAR</th>   
                                                        <th class="cajita" style="text-align:center;">DESCRIPCION</th>   
                                                        <th class="cajita" style="text-align:center;">�RECIBIDO EN FISICO?</th>   
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

                                                        <td style="width:25%;"><strong><%=d.getDocumento()%></strong></td>

                                                        <td class="caji<%=(i + 1)%>" align="center">
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

                                                        <td style="text-align:center;">
                                                            <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                            <input type="text"  name="lob_description<%=i + 1%>">
                                                            <% } else { %>
                                                            <% if (d.getDe_documento_adjunto() == null) { %>
                                                            <label class="null" >No Registrado</label>
                                                            <% } else {%>
                                                            <label> <%=d.getDe_documento_adjunto()%></label>

                                                            <% } %>
                                                            <% } %>


                                                        </td>
                                                        <td style="text-align:center;" align="center">
                                                            <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                            <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                                <% } else { %>
                                                                <% if (d.getEs_documento_adjunto() == null) { %>

                                                            <label class="null">No Registrado</label>
                                                            <% } else { %>
                                                            <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>


                                                                <%
                                                                } else {

                                                                %>
                                                                <img src="Desaprobado.png" width="20" height="20">
                                                            </label>
                                                            <% }
                                                                    }
                                                                }%>
                                                        </td>
                                                        <td style="text-align:center;" align="center">
                                                            <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                            <a type="button"  class="btn btn-file btn_reg_doc elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getId_dgp()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
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
                                                    <td style="width:25%;" style="text-align:center;" align="center"><strong><%=d.getDocumento()%></strong></td>

                                                    <td class="caji<%=(i + 1)%>" style="text-align:center;" align="center">
                                                        <% if (d.getId_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
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
                                                            }%>

                                                    </td>

                                                    <td style="text-align:center;" align="center">
                                                        <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <input type="text"  name="lob_description<%=i + 1%>">
                                                        <% } else { %>
                                                        <% if (d.getDe_documento_adjunto() == null) { %>
                                                        <label class="null" >No Registrado</label>
                                                        <% } else {%>
                                                        <label> <%=d.getDe_documento_adjunto()%></label>

                                                        <% } %>
                                                        <% } %>    
                                                    </td>
                                                    <td style="text-align:center;" align="center">
                                                        <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                            <% } else { %>
                                                            <% if (d.getEs_documento_adjunto() == null) { %>

                                                        <label class="null">No Registrado</label>
                                                        <% } else { %>
                                                        <label><% if (d.getEs_documento_adjunto().trim().equals("1")) {
                                                            %>

                                                            <img src="Aprobado.png" width="20" height="20">
                                                            <%
                                                            } else {

                                                            %>
                                                            <img src="Desaprobado.png" width="20" height="20">
                                                        </label>
                                                        <% }
                                                                }
                                                            }%>
                                                    </td>
                                                    <td style="text-align:center;" align="center">
                                                        <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <a type="button"  class="btn btn-file btn_reg_doc elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getId_dgp()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
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
                                                    <td style="width:25%;text-align:center;" align="center"><strong><%  if (d.getTi_documento().trim().equals("ACMA")) {
                                                            out.println("ACTA DE MATRIMONIO CON: <p style='color:red;' >" + co.getAp_nombres_conyugue() + "</p>");
                                                        }
                                                        if (d.getTi_documento().trim().equals("DNIC")) {
                                                            out.println("COPIA DNI CONYUGUE : <p style='color:red;' >" + co.getAp_nombres_conyugue() + "</p>");
                                                        }%>
                                                        </strong></td>

                                                    <td class="caji<%=(i + 1)%>"  style="text-align:center;" align="center">
                                                        <% if (d.getId_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
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

                                                    <td  style="text-align:center;" align="center">
                                                        <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <input type="text"  name="lob_description<%=i + 1%>">
                                                        <% } else { %>
                                                        <% if (d.getDe_documento_adjunto() == null) { %>
                                                        <label class="null" >No Registrado</label>
                                                        <% } else {%>
                                                        <label> <%=d.getDe_documento_adjunto()%></label>

                                                        <% } %>
                                                        <% } %>   

                                                    </td>
                                                    <td  style="text-align:center;" align="center" >
                                                        <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                            <% } else { %>
                                                            <% if (d.getEs_documento_adjunto() == null) { %>

                                                        <label class="null">No Registrado</label>
                                                        <% } else { %>
                                                        <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>
                                                            <img src="Aprobado.png" width="20" height="20">
                                                            <%
                                                            } else {

                                                            %>
                                                            <img src="Desaprobado.png" width="20" height="20">
                                                        </label>
                                                        <% }
                                                                }
                                                            }%>
                                                    </td>
                                                    <td  style="text-align:center;" align="center">
                                                        <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <a type="button"  class="btn btn-file btn_reg_doc elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getId_dgp()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
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
                                                    <td style="width:25%;text-align:center;"align="center"><strong>COPIA DNI DEL HIJO :  <%=h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador()%></strong></td>


                                                    <td class="caji<%=(i + 1)%>"  style="text-align:center;" align="center">
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

                                                    <td  style="text-align:center;" align="center">
                                                        <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <input type="text"  name="lob_description<%=i + 1%>">
                                                        <% } else { %>
                                                        <% if (d.getDe_documento_adjunto() == null) { %>
                                                        <label class="null" >No Registrado</label>
                                                        <% } else {%>
                                                        <label> <%=d.getDe_documento_adjunto()%></label>

                                                        <% } %>
                                                        <% } %>    
                                                    </td>
                                                    <td  style="text-align:center;" align="center">
                                                        <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                            <% } else { %>
                                                            <% if (d.getEs_documento_adjunto() == null) { %>

                                                        <label class="null">No Registrado</label>
                                                        <% } else { %>
                                                        <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>

                                                            <img src="Aprobado.png" width="20" height="20">
                                                            <%
                                                            } else {

                                                            %>
                                                            <img src="Desaprobado.png" width="20" height="20">
                                                        </label>
                                                        <% }
                                                                }
                                                            }%>
                                                    </td>
                                                    <td  style="text-align:center;" align="center">
                                                        <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                        <a type="button"  class="btn btn-file btn_reg_doc elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getId_dgp()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
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
                                                <td style="width:25%;text-align:center;"  align="center"><strong><%=d.getDocumento()%></strong></td>


                                                <td class="caji<%=(i + 1)%>"  style="text-align:center;" align="center">
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



                                                <td  style="text-align:center;" align="center">
                                                    <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                    <input type="text"   name="lob_description<%=i + 1%>">
                                                    <% } else { %>


                                                    <% if (d.getDe_documento_adjunto() == null) { %>
                                                    <label class="null" >No Registrado</label>
                                                    <% } else {%>
                                                    <label> <%=d.getDe_documento_adjunto()%></label>

                                                    <% } %>
                                                    <% } %>    
                                                </td>
                                                <td  style="text-align:center;" align="center">
                                                    <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                    <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                        <% } else { %>
                                                        <% if (d.getEs_documento_adjunto() == null) { %>

                                                    <label class="null">No Registrado</label>
                                                    <% } else { %>
                                                    <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>
                                                        <img src="Aprobado.png" width="20" height="20">
                                                        <%
                                                        } else {

                                                        %>
                                                        <img src="Desaprobado.png" width="20" height="20">
                                                    </label>
                                                    <% }
                                                            }
                                                        }%>
                                                </td>
                                                <td  style="text-align:center;" align="center">
                                                    <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                    <a type="button"  class="btn btn-file btn_reg_doc elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getId_dgp()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
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

                                                <a class="btn btn-success" href="../../../dgp?iddgp=<%=request.getParameter("iddgp")%>&idtr=<%=request.getParameter("idtr")%>&opc=rd"><i class="fa fa-check"></i> CONTINUAR</a>

                                                <button type="submit" class="btn btn-primary btn_reg_doc" style="display:none"> <i class="fa fa-plus-square"></i>
                                                    Registrar
                                                </button>

                                                <% }
                                                } else {%>
                                                <button type="submit" class="btn btn-primary btn_reg_doc"style="display:none" >
                                                    Registrar
                                                </button>
                                                <button type="button" onclick="history.back()"  class="btn btn-default">
                                                    Atr�s
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
        <script src="../../../js/notification/SmartNotification.min.js"></script>

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


        <script type="text/javascript">

                                                    // DO NOT REMOVE : GLOBAL FUNCTIONS!

                                                    $(document).ready(function () {

                                                        pageSetUp();

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
                                                            var msg = confirm('�tas seguro de eliminar?');
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
                allowedFileExtensions: ['jpg', 'png', 'gif','pdf'],
                overwriteInitial: false,
                maxFileSize: 500,
                maxFilesNum: 10,
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
