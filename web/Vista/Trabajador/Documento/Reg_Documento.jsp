<%@page import="pe.edu.upeu.application.model.Lis_Doc_tra"%>
<%@page import="pe.edu.upeu.application.model.Documentos"%>
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
<jsp:useBean id="List_Hijos" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Conyugue" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Adventista" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Lis_doc_trabajador" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Documentos" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
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


        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <!--        <link rel="stylesheet" type="text/css" href="../../../js/shadowbox/shadowbox.css"/>-->
    <link href="../../../css/Css_Bootstrap/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    
    </head>

    <body onload="closedthis();
            nobackbutton();">

        <%
            HttpSession sesion_1 = request.getSession(true);
            String rol = (String) sesion_1.getAttribute("IDROL");
            int n_nac = Integer.parseInt(request.getParameter("n_nac"));
            int num_ad = Integer.parseInt(request.getParameter("num_ad"));
            String id_hijo_faltante = "";
            InterfaceDocumentoDAO doc_ = new DocumentoDAO();

            boolean permissionEditDocument = false;
            if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") | rol.trim().equals("ROL-0012")) {
                permissionEditDocument = true;
            }

            //String id_dgp = "";
        %>
        <script>
            function exito(titulo, mensaje) {
                $.smallBox({
                    title: titulo,
                    content: mensaje,
                    color: "#739E73",
                    iconSmall: "fa fa-cloud",
                    timeout: 3000
                });
            }
            function closedthis() {
                $.smallBox({
                    title: "¡Ficha de trabajador registrada correctamente!",
                    content: "ya puede visualizar toda la informacion del trabajador...",
                    color: "#739E73",
                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                    timeout: 6000
                });
            }
        </script>
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
                        <article class="col-sm-12 col-md-12 col-lg-12" >

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-purple" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false"   data-widget-deletebutton="false">     <!-- widget options:
                                        usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">
                                        
                                      
                                        data-widget-editbutton="false"
                                        data-widget-togglebutton="false"
                                       
                                       
                                        data-widget-custombutton="false"
                                        data-widget-collapsed="true" 
                                        data-widget-sortable="false"
                                -->
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                    <h2>Registrar Documento</h2>				
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


                                        <form action="../../../documento_trabajador" method="post" enctype="multipart/form-data" class="smart-form formDocument"  >



                                            <table id="datatable_tabletools" class="table table-bordered table-hover " width="100%">

                                                <thead>
                                                <center>
                                                    <div class=" container-fluid cajita" style=" font: oblique bold 100%  sans-serif ; margin-top: 8px;margin-bottom: -5px;">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 cajita">
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 cajita"  style="text-align:center;" align="center">ADJUNTAR, DESCRIPCION Y ACCION </div>   
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 cajita"   style="text-align:center;" align="center">ADJUNTAR, DESCRIPCION Y ACCION</div>   
                                                         <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 cajita"   style="text-align:center;" align="center">ADJUNTAR, DESCRIPCION Y ACCION</div>   
                                                    </div>
                                                    </div>
                                                </center>
                                                </thead>
                                                
                                               <section class="col-lg-12 col-md-12 col-sm-12 col-xs-12 "> 
                                                <tbody>
                                                    <% int i = 0;
                                                        for (int z = 0; z < Lis_doc_trabajador.size(); z++) {
                                                            Lis_Doc_tra d = new Lis_Doc_tra();
                                                            d = (Lis_Doc_tra) Lis_doc_trabajador.get(z);
                                                    %>

                                                    <%  if (d.getTi_documento().trim().equals("DOCA")) {%>
                                                    <%  if (n_nac != 0) {%>
                                                                                                       
                                                    <tr class="cajita col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                                        <td    style="width: 40%;" align="center">
                                                            <table class="table table-striped ">
                                                                <tr><td align="center" style="border:1px solid;border-color: purple; height:50px;"><strong><%=d.getNo_documento()%></strong></td></tr>
                                                                <tr>
                                                                    <td class="caji<%=(i + 1)%>" align="center"><% if (d.getId_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                                        <div class="form-group">
                                                                            <input id="file-5" class="fileDocument" type="file" multiple=true data-preview-file-type="any" data-upload-url="#"  name="archivos<%=(i + 1)%>" size="500" >
                                                                        </div>
                                                                        <% } else { %>
                                                                        <% if (d.getId_documento_adjunto() == null) { %>
                                                                        <label class="null">No Registrado</label>
                                                                        <% } else {%>   
                                                                        <%
                                                                            out.print(doc_.List_file_url(d.getId_documento_adjunto().trim()));
                                                                        %>
                                                                        <% }
                                                                            } %>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                      <!--  </td>

                                                        <td  style="text-align:center;" align="center">-->
                                                          <div style="margin-top:-15px;">
                                                      <section  class="cajita col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align:center;margin-left:30px; " align="center">
                                                            <label>DESCRIPCION:</label><BR>
                                                            <% if (d.getDe_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                            <input type="text"  name="lob_description<%=i + 1%>"><BR><BR>
                                                            <% } else { %>
                                                            <% if (d.getDe_documento_adjunto() == null & d.getEs_documento_adjunto() == null) { %>
                                                            <label class="null" >No Registrado</label><BR><BR>
                                                            <% } else {%>
                                                            <label> <%=d.getDe_documento_adjunto()%></label><BR><BR>

                                                            <% }
                                                                } %> 
                                                            <%if (d.getEs_documento_adjunto() == null) {%>
                                                           
                                                            </section></div>
                                                                <%}%>
                                                                <div>
                                                                <% if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                                <a type="button"  class="btn btn-danger btn-sm btn_reg_doc elimi" href="../../../documento_trabajador?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
                                                                <%} else {
                                                                        out.print("");
                                                                    }%>
                                                                    </div</td>
                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_documentos()%>">
                                                </tr>  


                                                <%}
                                                    }%>
                                                <%  if (d.getTi_documento().trim().equals("COFE")) {%>
                                                <%  if (num_ad != 0) {%>
                                                
                                                <tr class="cajita col-lg-4 col-md-4 col-sm-6 col-xs-6 " >

                                                    <td  style="width: 40%;" align="center">
                                                        <table class="table table-striped ">
                                                            <tr><td align="center" style="border:1px solid;border-color: purple rgb(101, 89, 107);height:50px;"><strong><%=d.getNo_documento()%></strong></td></tr>
                                                            <tr>
                                                                <td class="caji<%=(i + 1)%>" align="center">
                                                                    <% if (d.getId_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                                    <div class="form-group">
                                                                        <input id="file-5" class="fileDocument" type="file" multiple=true data-preview-file-type="any" data-upload-url="any"  size="500" name="archivos<%=(i + 1)%>" size="500000" >
                                                                    </div>
                                                                    <% } else { %>
                                                                    <% if (d.getId_documento_adjunto() == null) { %>
                                                                    <label class="null">No Registrado</label>
                                                                    <% } else {%>
                                                                    <%
                                                                        out.print(doc_.List_file_url(d.getId_documento_adjunto().trim()));
                                                                    %>

                                                                    <% }
                                                                        }%>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                   <!-- </td>

                                                    <td  style="text-align:center;" align="center">-->
                                                   
                                                        <div style="margin-top:-15px;" >
                                                        <label>DESCRIPCION:</label><BR>
                                                        <% if (d.getDe_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                        <input type="text"  name="lob_description<%=i + 1%>"><BR><BR>
                                                        <% } else { %>
                                                        <% if (d.getDe_documento_adjunto() == null) { %>
                                                        <label class="null" >No Registrado</label><BR><BR>
                                                        <% } else {%>
                                                        <label> <%=d.getDe_documento_adjunto()%></label><BR><BR>

                                                        <% } %>
                                                        <% } %> 
                                                        <%if (d.getEs_documento_adjunto() == null) {%>
                                                        <section class="cajita col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align:center;margin-left:30px; " align="center">
                                                            <%}%>
                                                            <% if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                            <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i style="top:110%;text-align:center;margin-left:60px; margin-bottom: 10px;" data-swchon-text="SI" data-swchoff-text="NO"></i>¿RECIBIDO EN FISICO?:</label>
                                                                <% } else { %>
                                                                <% if (d.getEs_documento_adjunto() == null) { %>

                                                            <label class="null">¿RECIBIDO EN FISICO?:<BR>No Registrado</label>
                                                                <% } else { %>
                                                            <label><% if (d.getEs_documento_adjunto().trim().equals("1")) {
                                                                %>

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
                                                        </section></div>
                                                        <%}%>
                                                   <!-- </td>
                                                    <td  style="text-align:center;" align="center">-->
                                                   <div style="text-align:center;" align="center"> 
                                                        <%if (d.getEs_documento_adjunto() != null & (permissionEditDocument)) {%>
                                                        <a type="button"  class="btn btn-danger btn-sm elimi" href="../../../documento_trabajador?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
                                                        <%} else {
                                                                out.print("");
                                                            }%>
                                                   </div> </td>
                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_documentos()%>">
                                                </tr>  


                                                <%}
                                                    }%>
                                                <%  if (d.getTi_documento().trim().equals("DNIC") | d.getTi_documento().trim().equals("ACMA")) {%>

                                                <%if (List_Conyugue.size() > 0) {

                                                        for (int kj = 0; kj < List_Conyugue.size(); kj++) {
                                                            Padre_Madre_Conyugue co = new Padre_Madre_Conyugue();
                                                            co = (Padre_Madre_Conyugue) List_Conyugue.get(kj);
                                                %>             


                                                <tr class="cajita col-lg-4 col-md-4 col-sm-6 col-xs-6 "  >
                                                    <td  style="width: 40%;" align="center" >
                                                        <table class="table table-striped" style="margin-top: -39px;" >
                                                            <tr style="padding: 0px;">
                                                                <td align="center" style="border:1px solid;border-color:  purple rgb(101, 89, 107);">
                                                                    <strong><%  if (d.getTi_documento().trim().equals("ACMA")) {
                                                                            out.println("ACTA DE MATRIMONIO CON: <p style='color:red;' >" + co.getAp_nombres_conyugue() + "</p>");
                                                                        }
                                                                        if (d.getTi_documento().trim().equals("DNIC")) {
                                                                            out.println("COPIA DNI CONYUGUE : <p style='color:red;' >" + co.getAp_nombres_conyugue() + "</p>");
                                                                        }%>
                                                                    </strong>
                                                                </td><br>
                                                            </tr><br>
                                                            <tr>
                                                                <td class="caji<%=(i + 1)%>" align="center">
                                                                    <% if (d.getId_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                                    <div class="form-group">
                                                                        <input id="file-5" class="fileDocument" type="file" multiple=true data-preview-file-type="any" data-upload-url="#"  size="500" name="archivos<%=(i + 1)%>" >
                                                                    </div>
                                                                    <% } else { %>
                                                                    <% if (d.getId_documento_adjunto() == null) { %>
                                                                    <label clas s="null">No Registrado</label>
                                                                    <% } else {%>
                                                                    <%
                                                                        out.print(doc_.List_file_url(d.getId_documento_adjunto().trim()));
                                                                    %>
                                                                    <% }
                                                                        } %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                 <!--   </td>

                                                    <td  style="text-align:center;" align="center">-->
                                                        <div style="margin-top:-15px;">
                                                        <label>DESCRIPCION:</label><BR>
                                                        <% if (d.getDe_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                        <input type="text"  name="lob_description<%=i + 1%>"><BR><BR>
                                                        <% } else { %>
                                                        <% if (d.getDe_documento_adjunto() == null) { %>
                                                        <label class="null" >No Registrado</label><BR><BR>
                                                        <% } else {%>
                                                        <label> <%=d.getDe_documento_adjunto()%></label><BR><BR>

                                                        <% } %>
                                                        <% } %>   
                                                        <%if (d.getEs_documento_adjunto() == null) {%>
                                                        <section class="cajita col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align:center;margin-left:30px;margin-top:-4px; " align="center">
                                                            <%}%>
                                                            <% if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                            <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i style="top:110%;text-align:center;margin-left:40px;margin-bottom: 10px;" data-swchon-text="SI" data-swchoff-text="NO"></i>¿RECIBIDO EN FISICO?:</label>
                                                                <% } else { %>
                                                                <% if (d.getEs_documento_adjunto() == null) { %>

                                                            <div> <label class="null">¿RECIBIDO EN FISICO?:<BR>No Registrado</label></div></section>
                                                                <% } else { %>
                                                            <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>
                                                                ¿RECIBIDO EN FISICO?:<BR> <img  src="Aprobado.png" width="20" height="20">
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
                                                  <!--  </td>
                                                    <td  style="text-align:center;" align="center">-->
                                                    <div style="text-align:center;" align="center">  
                                                      <%if (d.getEs_documento_adjunto() != null & (permissionEditDocument)) {%>
                                                        <a type="button"  class="btn btn-danger btn-sm  elimi" href="../../../documento_trabajador?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
                                                        <%} else {
                                                                out.print("");
                                                        }%></div>
                                                             </div> </td>
                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_documentos()%>">
                                                </tr>  



                                                <% }
                                                    } %>
                                                <% } %>

                                                <%  if (d.getTi_documento().trim().equals("DNIH")) {%>
                                                <%if (List_Hijos.size() > 0)
                                                        for (int kk = 0; kk < List_Hijos.size(); kk++) {
                                                            Datos_Hijo_Trabajador h = new Datos_Hijo_Trabajador();
                                                            h = (Datos_Hijo_Trabajador) List_Hijos.get(kk);
                                                            if (d.getId_datos_hijo() == null) {
                                                %>

                                                <tr class="cajita col-lg-4 col-md-4 col-sm-6 col-xs-6 " >
                                                    <td   style="width: 40%;" align="center">
                                                        <table class="table table-striped ">
                                                            <tr><td align="center" style="border:1px solid;border-color: purple rgb(101, 89, 107);height:50px;"><strong>COPIA DNI DEL HIJO :  <%=h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador()%></strong></td></tr>
                                                            <tr><td class="caji<%=(i + 1)%>"  align="center">
                                                                    <% if (d.getId_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                                    <div class="form-group">
                                                                        <input id="file-5" class="fileDocument" type="file" multiple=true data-preview-file-type="any" data-upload-url="#" size="500"  name="archivos<%=(i + 1)%>" >
                                                                        <input type="hidden" name="idh<%=(i + 1)%>" value="<%=h.getId_datos_hijos_trabajador().trim()%>" >
                                                                    </div>
                                                                    <% } else { %>
                                                                    <% if (d.getId_documento_adjunto() == null) { %>
                                                                    <label class="null">No Registrado</label>
                                                                    <% } else {%>
                                                                    <%
                                                                        out.print(doc_.List_file_url(d.getId_documento_adjunto().trim()));
                                                                    %>

                                                                    <% }
                                                                        } %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                 <!--   </td>

                                                    <td  style="text-align:center;" align="center">-->
                                                      <div style="margin-top:-15px;" >
                                                        <label>DESCRIPCION:</label><BR>
                                                        <% if (d.getDe_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                        <input type="text"  name="lob_description<%=i + 1%>"><BR><BR>
                                                        <% } else { %>
                                                        <% if (d.getDe_documento_adjunto() == null) { %>
                                                        <label class="null" >No Registrado</label><BR><BR>
                                                        <% } else {%>
                                                        <label> <%=d.getDe_documento_adjunto()%></label><BR><BR>

                                                        <% } %>
                                                        <% } %>    
                                                        <%if (d.getEs_documento_adjunto() == null) {%>
                                                        <section class="cajita col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align:center;margin-left:30px; " align="center">
                                                            <%}%>
                                                            <% if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                            <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i style="top:110%;text-align:center;margin-left:60px;margin-bottom: 10px;" data-swchon-text="SI" data-swchoff-text="NO"></i> ¿RECIBIDO EN FISICO?:</label>
                                                                <% } else { %>
                                                                <% if (d.getEs_documento_adjunto() == null) { %>

                                                            <label class="null"> ¿RECIBIDO EN FISICO?:<BR>No Registrado</label>
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
                                                        </section></div>
                                                        <%}%>
                                                  <!--  </td>
                                                    <td  style="text-align:center;" align="center">-->
                                                  <div style="text-align:center;" align="center"> 
                                                        <%if (d.getEs_documento_adjunto() != null & (permissionEditDocument)) {%>
                                                        <a type="button" style="float: right" class="btn btn-danger btn-sm elimi" href="../../../documento_trabajador?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
                                                        <%} else {
                                                                out.print("");
                                                            }%>
                                                  </div> </td>
                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_documentos()%>">
                                                </tr>  


                                                <%

                                                } else {

                                                    if (h.getVal_doc() > 0 & d.getId_datos_hijo().equals(h.getId_datos_hijos_trabajador().trim())) {
                                                        //   i++;
%>
                                                <tr class="cajita col-lg-4 col-md-4 col-sm-6 col-xs-6 " >
                                                    <td  style="width:40%;" align="center">
                                                        <table class="table table-striped ">
                                                            <tr><td align="center" style="border:1px solid;border-color:  purple rgb(101, 89, 107); height:50px;"><strong>COPIA DNI DEL HIJO :  <%=h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador()%></strong></td></tr>
                                                            <tr><td class="caji<%=(i + 1)%>"  align="center">
                                                                    <% if (d.getId_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                                    <div class="form-group">
                                                                        <input id="file-5" class="fileDocument" type="file" multiple=true data-preview-file-type="any" data-upload-url="#"  size="500" name="archivos<%=(i + 1)%>" >
                                                                        <input type="hidden" name="idh<%=(i + 1)%>" value="<%=h.getId_datos_hijos_trabajador().trim()%>" >
                                                                    </div>
                                                                    <% } else { %>
                                                                    <% if (d.getId_documento_adjunto() == null) { %>
                                                                    <label class="null">No Registrado</label>
                                                                    <% } else {%>
                                                                    <%
                                                                        out.print(doc_.List_file_url(d.getId_documento_adjunto().trim()));
                                                                    %>

                                                                    <% }
                                                                        } %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                <!--    </td>

                                                    <td  style="text-align:center;" align="center">-->
                                                    <div style="margin-top:-15px;">
                                                        <label>DESCRIPCION:</label><BR>
                                                        <% if (d.getDe_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                        <input type="text"  name="lob_description<%=i + 1%>"><BR><BR>
                                                        <% } else { %>
                                                        <% if (d.getDe_documento_adjunto() == null) { %>
                                                        <label class="null" >No Registrado</label><BR><BR>
                                                        <% } else {%>
                                                        <label> <%=d.getDe_documento_adjunto()%></label><BR><BR>

                                                        <% } %>
                                                        <% } %>    
                                                        <%if (d.getEs_documento_adjunto() == null) {%>
                                                        <section class="cajita col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align:center;margin-left:30px; " align="center">
                                                            <%}%>
                                                            <% if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                            <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i style="top:110%;text-align:center;margin-left:60px;margin-bottom: 10px;" data-swchon-text="SI" data-swchoff-text="NO"></i> ¿RECIBIDO EN FISICO?:</label>
                                                                <% } else { %>
                                                                <% if (d.getEs_documento_adjunto() == null) { %>

                                                            <label class="null"> ¿RECIBIDO EN FISICO?:<BR>No Registrado</label>
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
                                                        </section></div>
                                                        <%}%>
                                                  <!--  </td>
                                                    <td  style="text-align:center;" align="center">-->
                                                  <div style="text-align:center;" align="center"> 
                                                        <%if (d.getEs_documento_adjunto() != null & (permissionEditDocument)) {%>
                                                        <a type="button"   class="btn btn-danger btn-sm  elimi" href="../../../documento_trabajador?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
                                                        <%} else {
                                                                out.print("");
                                                            }%>
                                                  </div> </td>
                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_documentos()%>">
                                                </tr>  

                                                <%

                                                } else if (h.getVal_doc() == 0 & !id_hijo_faltante.equals(h.getId_datos_hijos_trabajador())) {
                                                    // out.print(kk);
%>
                                                <tr class="cajita col-lg-4 col-md-4 col-sm-6 col-xs-6 " >
                                                    <td style="width: 40%;" align="center"> 
                                                        <table class="table table-striped ">
                                                            <tr><td align="center" style="border:1px solid;border-color: purple rgb(101, 89, 107); height:50px;"><strong>COPIA DNI DEL HIJO :  <%=h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador()%></strong></td></tr>
                                                            <tr><td class="caji<%=(i + 1)%>"  align="center">
                                                                    <% if ((permissionEditDocument)) {%>
                                                                    <div class="form-group">
                                                                        <input id="file-5" class="fileDocument" type="file" multiple=true data-preview-file-type="any" data-upload-url="#"  size="500" name="archivos<%=(i + 1)%>" >
                                                                        <input type="hidden" name="idh<%=(i + 1)%>" value="<%=h.getId_datos_hijos_trabajador().trim()%>" >
                                                                    </div>
                                                                    <% } else { %>
                                                                    <label class="null">No Registrado</label>
                                                                    <% } %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                  <!-- </td>

                                                    <td  style="text-align:center;" align="center">-->
                                                      <div style="margin-top:-15px;">
                                                        <label>DESCRIPCION:</label><BR>
                                                        <% if ((permissionEditDocument)) {%>
                                                        <input type="text"  name="lob_description<%=i + 1%>"><BR><BR>
                                                        <% } else { %>
                                                        <label class="null" >No Registrado</label><BR><BR>
                                                        <% } %> 


                                                        <section class="cajita col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align:center;margin-left:30px;" align="center">
                                                            <% if ((permissionEditDocument)) {%>
                                                            <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i style="top:110%;text-align:center;margin-left:60px;margin-bottom: 10px;" data-swchon-text="SI" data-swchoff-text="NO"></i> ¿RECIBIDO EN FISICO?:</label>
                                                                <% } else {%>
                                                            <label class="null"> ¿RECIBIDO EN FISICO?:<BR>No Registrado</label>
                                                                <% }%>
                                                        </section>
                                                     </div>
                                                    </td>
                                                    <td  style="text-align:center;" align="center">
                                                    </td>
                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_documentos()%>">
                                                </tr> 

                                                <%
                                                                    id_hijo_faltante = h.getId_datos_hijos_trabajador();
                                                                }

                                                            }
                                                            i++;
                                                        }
                                                %>

                                                <%} else if (!d.getTi_documento().trim().equals("DNIH") & !d.getTi_documento().trim().equals("DNIC") & !d.getTi_documento().trim().equals("ACMA") & !d.getTi_documento().trim().equals("COFE") & !d.getTi_documento().trim().equals("DOCA")) {
                                                %>
                                                <tr class="cajita col-lg-4 col-md-4 col-sm-6 col-xs-6" >
                                                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_documentos()%>">
                                                <td style="width: 36%;" align="center">
                                                    <table class="table table-striped ">
                                                        <tr><td align="center" style="border:1px solid;border-color:  purple rgb(101, 89, 107); height:50px;"><strong><%=d.getNo_documento()%></strong></td></tr>
                                                        <tr><td class="caji<%=(i + 1)%>" align="center"> <% if (d.getId_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                                <div class="form-group">
                                                                    <input id="file-5" class="fileDocument" type="file" multiple=true data-preview-file-type="any" data-upload-url="#" size="500" name="archivos<%=(i + 1)%>">
                                                                </div>

                                                                <% } else { %>
                                                                <% if (d.getId_documento_adjunto() == null) { %>
                                                                <label class="null">No Registrado</label>
                                                                <% } else {%>
                                                                <%
                                                                    out.print(doc_.List_file_url(d.getId_documento_adjunto().trim()));
                                                                %>

                                                                <% }
                                                                    } %></td></tr>
                                                    </table>
                                               <!-- </td>



                                                <td  style="text-align:center;" align="center">-->
                                               <div style="margin-top:-15px;" >
                                                    <label>DESCRIPCION:</label><BR>
                                                    <% if (d.getDe_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                    <input type="text"   name="lob_description<%=i + 1%>"><BR><BR>
                                                    <% } else { %>


                                                    <% if (d.getDe_documento_adjunto() == null) { %>
                                                    <label class="null" >No Registrado</label><BR><BR>
                                                    <% } else {%>
                                                    <label> <%=d.getDe_documento_adjunto()%></label><BR><BR>

                                                    <% } %>
                                                    <% } %>  
                                                    <%if (d.getEs_documento_adjunto() == null) {%>
                                                    <section class="cajita col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align:center;margin-left:30px; " align="center">
                                                        <%}%>
                                                        <% if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {%>
                                                        <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i style="top:110%;text-align:center;margin-left:60px;margin-bottom: 10px;" data-swchon-text="SI" data-swchoff-text="NO"></i> ¿RECIBIDO EN FISICO?:</label>
                                                            <% } else { %>
                                                            <% if (d.getEs_documento_adjunto() == null) { %>

                                                        <label class="null"> ¿RECIBIDO EN FISICO?:<BR>No Registrado</label>
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
                                                    </section></div>
                                                    <%}%>
                                             <!--   </td>
                                                <td  style="text-align:center;" align="center">-->
                                             <div style="text-align:center;" align="center"> 
                                                    <%if (d.getEs_documento_adjunto() != null & (permissionEditDocument)) {%>
                                                    <%if (request.getParameter("P2") == null & request.getParameter("pro") == null) {
                                                    %>
                                                    <a type="button"  class="btn btn-danger btn-sm  elimi" href="../../../documento_trabajador?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> Eliminar</a>
                                                    <%} else if (request.getParameter("P2") != null & request.getParameter("pro") != null) {
                                                    %>
                                                    <a type="button"  class="btn btn-danger btn-sm  elimi" href="../../../documento_trabajador?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&idtr=<%=d.getId_trabajador()%>&P2=TRUE"><i class="fa fa-trash-o"></i> Eliminar</a>

                                                    <%                                                       } %>
                                                    <%} else {
                                                            out.print("");
                                                        }%>
                                             </div>
                                             </td>
                                                </tr>  
                                                <input type="hidden" name="iddgp" value="<%=d.getId_dgp()%>">
                                                <input type="hidden" name="idctr" value="<%=request.getParameter("idctr")%>">
                                                <input type="hidden" name="idtr" value="<%=request.getParameter("idtr")%>">
                                                <%if (request.getParameter("ms") != null) {%>
                                                <input type="hidden" name="ms" value="<%=request.getParameter("ms")%>">
                                                <%}%>
                                                <%if (request.getParameter("dt") != null) {%>
                                                <input type="hidden" name="dt" value="<%=request.getParameter("dt")%>">
                                                <%}%>
                                                <% }
                                                        i++;
                                                        //id_dgp = d.getIddgp();

                                                    }%>
                                                <input type="hidden" name="num" value="<%=i + 1%>">
                                                <% if (permissionEditDocument) { %>
                                                <%if (request.getParameter("P2") != null) {%>
                                                <%} else {%>
                                                <tr><td><input  type="hidden" value="Registrar" name="opc" ></td></tr>
                                                        <%}%>
                                                        <%}%>
                                                </tbody>
                                               </section>
                                            </table>
                                            <footer>
                                                <%
                                                    if (request.getParameter("pro") != null) {
                                                        if (request.getParameter("pro").equals("pr_dgp")) {
                                                            out.println("<input  type='hidden' value='enter' name='P2'/>");
                                                        }
                                                    }

                                                    if (request.getParameter("P2") != null) {
                                                        if (request.getParameter("P2").equals("TRUE") & request.getParameter("Vol") == null) {%>
                                                <input  type='hidden' value='enter' name='P2'/>

                                                <a class="btn btn-success" href="../../../trabajador?idtr=<%=request.getParameter("idtr")%>&aa=<%=request.getParameter("ms")%>&opc=list_reg_tra&a=<%=request.getParameter("dt")%>"><i class="fa fa-check"></i> CONTINUAR</a>

                                                <button  type="button" class="btn btn-primary btn_reg_doc" style="display:none"> <i class="fa fa-plus-square"></i>
                                                    Registrar
                                                </button>

                                                <% } else {%>
                                                <a class="btn btn-primary" href="../../../trabajador?idtr=<%=request.getParameter("idtr")%>&opc=Documento_Trabajador"><i class="fa  fa-chevron-circle-left"></i> Regresar</a>

                                                <button  type="button" class="btn btn-primary btn_reg_doc" style="display:none"> <i class="fa fa-plus-square"></i>
                                                    Registrar
                                                </button>
                                                <%}%>
                                                <%} else {%>
                                                <button    type="button" class="btn btn-primary btn_reg_doc"style="display:none" >
                                                    Registrar
                                                </button>
                                                <button   type="button" onclick="history.back()"  class="btn btn-default">
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


        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
                                                    if (!window.jQuery) {
                                                        document.write('<script src="../../../js/libs/jquery-2.0.2.min.js"><\/script>');
                                                    }
        </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
                                                    if (!window.jQuery.ui) {
                                                        document.write('<script src="../../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                                                    }
        </script>

        <!-- IMPORTANT: APP CONFIG -->
        <script src="../../../js/app.config.js"></script>

        <!--         JS TOUCH : include this plugin for mobile drag / drop touch events-->
        <!--
                 BOOTSTRAP JS -->
        <script src="../../../js/bootstrap/bootstrap.min.js"></script>

        <!--         CUSTOM NOTIFICATION -->
        <script src="../../../js/notification/SmartNotification.min.js"></script>



        <script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!--         SPARKLINES-->
        <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script> 

        <!--         JQUERY VALIDATE -->
        <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!--         JQUERY MASKED INPUT -->
        <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

        <!--         JQUERY SELECT2 INPUT -->
        <script src="../../../js/plugin/select2/select2.min.js"></script>

        <!--         JQUERY UI + Bootstrap Slider -->
        <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!--         browser msie issue fix 
        
                 FastClick: For mobile devices 
        
                [if IE 8]>-->
        <!--
                <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>-->
        <!--
                <![endif]
        
                 Demo purpose only -->
        <script src="../../../js/demo.min.js"></script>

        <!--         MAIN APP JS FILE -->
        <script src="../../../js/app.min.js" ></script>

        <!-- PAGE RELATED PLUGIN(S) -->
        <script src="../../../js/plugin/jquery-form/jquery-form.min.js"></script>
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

        <script src="../../../js/bootstrap/fileinput.js" type="text/javascript"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
       
        <script src="../../../js/notification/SmartNotification.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="../../../js/shadowbox/demo.js"></script>
        <script type="text/javascript" src="../../../js/shadowbox/shadowbox.js"></script>
 
        <script type="text/javascript">
                                                    Shadowbox.init({
                                                        // a darker overlay looks better on this particular site
                                                        overlayOpacity: 0.8
                                                                // setupDemos is defined in assets/demo.js
                                                    }, setupDemos);</script>



        <script type="text/javascript">
            function nobackbutton() {
                window.location.hash = "no-back-button";
                window.location.hash = "Again-No-back-button" //chrome
                window.onhashchange = function () {
                    window.location.hash = "";
                }
            }


            function validar() {
                var x = true;
                console.log("enter to function validar")

                $.each($(".fileDocument"), function (index) {
                    var thisObject = $(this);
                    if (thisObject.val()!== "") {
                        // console.log("value input :" + thisObject.val())
                        //   console.log("tam input :" + thisObject[0].files.size)

                        //  $("#ulList").empty();
                        var fp = thisObject;
                        var lg = fp[0].files.length; // get length
                        var items = fp[0].files;
                        var fragment = "";

                        if (lg > 0) {
                            for (var i = 0; i < lg; i++) {
                                var fileName = items[i].name; // get file name
                                var fileSize = items[i].size; // get file size 
                                var fileType = items[i].type; // get file type

                                // append li to UL tag to display File info
                                fragment = "<li>" + fileName + " (<b>" + fileSize + "</b> bytes) - Type :" + fileType + "</li>";
                                console.log(fragment)


                                if (fileSize > 512000) {
                                     // $(thisObject).val(" ");
                                          //    thisObject.clik(".kv-file-remove");
                                            $(thisObject).focus();  
                                    x = false;
                                  

                                }

                            }

                            // $("#ulList").append(fragment);
                        }

                    }
                    console.log(index)
                    //   console.log(thisObject.files.length);
                });
                console.log(x)
                return x;
            }

            $(document).ready(function () {

                pageSetUp();
                $.sound_path = "../../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                    $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                });

                $(".btn_reg_doc").click(function () {
                    console.log(validar());
                    if (validar()) {
                        $(".formDocument").submit()
                    }
                });

                $(".fileDocument").fileinput({
                    'allowedFileExtensions': ['jpg', 'png', 'gif', 'pdf', 'docx', 'doc', 'txt'],
                    'initialPreviewAsData': true,
                    'overwriteInitial': false,
                    'removeFromPreviewOnError': false,
                    'maxFileSize': 500,
                    'maxFilesNum': 10,
//                    'initialCaption': "files",
//                     'browseClass': "btn btn-primary btn-sm",
//                    'removeClass': "btn btn-danger btn-sm",
//                 dropZoneTitleClass: {
//                     "holaa"
//                 },
                    layoutTemplates: {
                        main1:
                                "{preview}\n" +
                                "<div class=\'input-group {class}\'>\n" +
                                "   <div class=\'input-group-btn\'>\n" +
                                "       {browse}\n" +
                                "       {upload}\n" +
                                "       {remove}\n" +
                                "   </div>\n" +
                                "   {caption}\n" +
                                "</div>"
                    }, slugCallback:
                            function (filename) {
                                return filename.replace('(', '_').replace(']', '_');
                            }



                });


//                function validSize(objFile) {
//                    var x = true;
//                    var tamFiles = objFile.files.length;
//                    console.log("longitud:" + tamFiles);
//                    for (var i = 0; i < tamFiles; i++) {
//                        console.log("(" + i + ") iteracion")
//                        console.log("prubea mira")
//
//                        var sizeByte = objFile.files[i].size;
//                        console.log("tamaño:" + objFile.files[i].size);
//
//
//                        if (sizeByte > 512000) {
//                            console.log("tamaño superado")
//
//                            x = false;
//                        }
//                        else {
//                            console.log("agregado")
//                            x = true;
//                        }
//
////                       
//                    }
//                    return x;
//                }
//                $(".btn_reg_doc").click(function (e) {
//
//
//                    var d = validSize(e.target);
////                  
//                    if (!d) {
//
//                        return false;
//                    }
//                    return true;
//                });
//                $(".fileDocument").on("filepredelete", function (p) {
//                    var abort = true;
//                    if (confirm("esta seguro que desea eliminar?")) {
//                        abort = false;
//                    }
//                    return abort;
//                });
//                $(".file").change(function (e) {
//                 
//                    if (!validSize(e.target)) {
//                     e.preventDefault();
//        }else{
//                    
//        return true;    
//                    }


//                });

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
                $.each($(".fileDocument"), function (i) {

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
                    var msg = confirm('¿estas seguro de eliminar?');
                    if (msg == true) {
                        return true;
                    } else {
                        return false;
                    }
                });
            });


        </script>

    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
