<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.dao.DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.Datos_Hijo_Trabajador"%>
<%@page import="pe.edu.upeu.application.model.Padre_Madre_Conyugue"%>
<%@page import="pe.edu.upeu.application.model.V_Reg_Dgp_Tra"%>
<jsp:useBean id="List_Hijos" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Conyugue" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Adventista" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_doc_req_pla" scope="session" class="java.util.ArrayList"/>
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
            <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production-plugins.min.css">
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


        <link rel="stylesheet" type="text/css" href="../../../js/shadowbox/shadowbox.css"/>

     <!--   <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">-->
        <link href="../../../css/Css_Bootstrap/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    </head>
    <%  
        if (request.getParameter("a") != null) {
            if (request.getParameter("a").trim().equals("t")) {
    %>

    <body onload="closedthis();
            nobackbutton();">

        <%
            }
            if (request.getParameter("a").trim().equals("e")) {%>
    <body onload="closedthis2();
            nobackbutton();">
        <%}
        } else {
        %>
    <body class="" onload="nobackbutton()">
        <%}%>
        <%
            HttpSession sesion_1 = request.getSession(true);
            String rol = (String) sesion_1.getAttribute("IDROL");
            int n_nac = Integer.parseInt(request.getParameter("n_nac"));
            int num_ad = Integer.parseInt(request.getParameter("num_ad"));
            String id_dgp = "";
            String id_hijo_faltante = "";
            InterfaceDocumentoDAO doc_ = new DocumentoDAO();
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
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false"   data-widget-deletebutton="false">
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

                                        <form action="../../../documento" method="post" enctype="multipart/form-data"  class="form_dgp_doc" >
                                         
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 "> 
                                                    
                                                        <%                        
                                                            int i = 0;
                                                            for (int z = 0; z < List_doc_req_pla.size(); z++) {
                                                                V_Reg_Dgp_Tra d = new V_Reg_Dgp_Tra();
                                                                d = (V_Reg_Dgp_Tra) List_doc_req_pla.get(z);
                                                        %>

                                                        <%  if (d.getTi_documento().trim().equals("DOCA")) {%>
                                                        <%  if (n_nac != 0) {%>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                                            <div class="well well-sm">
                                                                    <div class="row">
                                                                        <label ><%=d.getDocumento()%></label>
                                                                        
                                                                    </div>
                                                                
                                                                        <div class="row caji<%=(i + 1)%>"  >
                                                                            <% if (d.getId_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                            
                                                                                <input id="file-5" class="fileDocument" type="file" multiple=true   <%if (d.getEs_obligatorio().equals("1")) {
                                                                                        out.println(" required='required' ");
                                                                                    }%> name="archivos<%=(i + 1)%>" >
                                                                          
                                                                            <% } else { %>
                                                                            <% if (d.getId_documento_adjunto() == null) { %>
                                                                            <label class="null">No Registrado</label>
                                                                            <% } else {%>   
                                                                            <%
                                                                                out.print(doc_.List_files(d.getId_documento_adjunto().trim()));
                                                                            %>
                                                                            <% }
                                                                            } %>
                                                                        </div>
                                                                   
                                                            

                                                                        <div class="row">

                                                                    <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                    <input type="text" placeholder="Escribe una descripci�n" class="form-control" name="lob_description<%=i + 1%>">
                                                                    <% } else { %>
                                                                    <% if (d.getDe_documento_adjunto() == null) { %>
                                                                    <label class="null" >No Registrado</label>
                                                                    <% } else {%>
                                                                  <label >Descripci�n:</label>
                                                                    <label style="font-weight: normal;"><%=d.getDe_documento_adjunto()%> </label><br>

                                                                    <% } %>
                                                                    <% } %>    
                                                                      </div>
                                                                    <%if (d.getEs_documento_adjunto() == null) {%>
                                                                    <div  class="row"  >
                                                                        <%}%>
                                                                        <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                        <label>�Recibido en fisico?:</label> <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" style="margin-left:auto; margin-right:auto;" ><i style="margin-top: -5px;" data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                                            <% } else { %>
                                                                            <% if (d.getEs_documento_adjunto() == null) { %>

                                                                        <label class="null">�Recibido en fisico?:No Registrado</label>
                                                                            <% } else { %>
                                                                        <label ><% if (d.getEs_documento_adjunto().trim().equals("1")) {
                                                                            %>

                                                                            �Recibido en fisico?: Si
                                                                            <%
                                                                            } else {

                                                                            %>
                                                                            �Recibido en fisico?: No
                                                                        </label>
                                                                        <% }
                                                                                }
                                                                            }%>
                                                                        <%if (d.getEs_documento_adjunto() == null) {%>
                                                                    </div>
                                                              
                                                                    <%}%>

                                                                <div class="row">
                                                                    <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                    <a type="button"  class="btn btn-danger btn-sm  elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getIddgp()%>&idtr=<%=d.getId_trabajador()%>"><i style="margin-top: -5px;" class="fa fa-trash-o"></i></a>
                                                                    <%} else {
                                                                            out.print("");
                                                                        }%>
                                                                </div>  
                                                            </div>
                                                    <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                    </div>  
                                                    <%}
                                                    }%>
                                                    
                                                    
                                                    <%  if (d.getTi_documento().trim().equals("COFE")) {%>
                                                    <%  if (num_ad != 0) {%>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                                        <div  class="well wel-sm">
                                                            <div class="row">
                                                                    <label><%=d.getDocumento()%></label>
                                                            </div>
                                                              
                                                                    <div  class="row caji<%=(i + 1)%>"  >
                                                                        <% if (d.getId_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                            <input id="file-5" class="fileDocument" type="file" multiple=true   <%if (d.getEs_obligatorio().equals("1")) {
                                                                                    out.println(" required='required' ");
                                                                                }%> name="archivos<%=(i + 1)%>" >
                                                                        <% } else { %>
                                                                        <% if (d.getId_documento_adjunto() == null) { %>
                                                                        <label class="null">No Registrado</label>
                                                                        <% } else {%>
                                                                        <%
                                                                            out.print(doc_.List_files(d.getId_documento_adjunto().trim()));
                                                                        %>

                                                                        <% }
                                                                        }%>
                                                                    </div>
                                                          
                                                                    <div class="row">
                                                              
                                                                <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                <input type="text"  placeholder="Escribe una descripci�n" class="form-control" name="lob_description<%=i + 1%>">
                                                                <% } else { %>
                                                                <% if (d.getDe_documento_adjunto() == null) { %>
                                                                <label class="null" >No Registrado</label>
                                                                <% } else {%> <label>Descripci�n:</label> 
                                                                <label ><%=d.getDe_documento_adjunto()%> </label>

                                                                <% } %>
                                                                <% } %>    
                                                                    </div>
                                                                       <div  class="row">
                                                                <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                             
                                                                    <label>�Recibido en fisico?:</label><label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" style="margin-left:auto; margin-right:auto;" ><i style="margin-top: -5px;" data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                                        <% } else { %>
                                                                        <% if (d.getEs_documento_adjunto() == null) { %>

                                                                    <label class="null">�Recibido en fisico?:No Registrado</label>
                                                            
                                                                        <% } else { %>
                                                                <label ><% if (d.getEs_documento_adjunto().trim().equals("1")) {
                                                                    %>

                                                                    �Recibido en fisico?:Si
                                                                    <%
                                                                    } else {

                                                                    %>
                                                                    �Recibido en fisico?:No
                                                                </label>
                                                                <% }
                                                                        }
                                                                    }%>
                                                            </div>
                                                        
                                                            <div class="row" >
                                                                <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                <a type="button"  class="btn btn-danger btn-sm  elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getIddgp()%>&idtr=<%=d.getId_trabajador()%>"><i style="margin-top: -5px;" class="fa fa-trash-o"></i></a>
                                                                <%} else {
                                                                        out.print("");
                                                                    }%>
                                                            </div>
                                                        </div>
                                                    <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                    </div>  
                                                    <%}
                                                    }%>
                                                    <% 
                                                        //if(false){
                                                        if (d.getTi_documento().trim().equals("DNIC") | d.getTi_documento().trim().equals("ACMA")) {
                                                            
    %>

                                                    <%

                                                        for (int kj = 0; kj < List_Conyugue.size(); kj++) {
                                                            Padre_Madre_Conyugue co = new Padre_Madre_Conyugue();
                                                            co = (Padre_Madre_Conyugue) List_Conyugue.get(kj);
                                                    %>             
                                                    <div class="col col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                                        <div class="wel well-sm">
                                                            <div class="row"> 
                                                                    <label>
                                                                        <%  if (d.getTi_documento().trim().equals("ACMA")) {
                                                                                out.println("Acta de matrimonio con: <p class='txt-color-red' >" + co.getAp_nombres_conyugue() + "</p>");
                                                                            }
                                                                            if (d.getTi_documento().trim().equals("DNIC")) {
                                                                                out.println("Copia DNI c�nyugue : <p class='txt-color-red' >" + co.getAp_nombres_conyugue() + "</p>");
                                                                            }%>
                                                                        
                                                                    </label>
                                                                </div>
                                                                    <div class="row caji<%=(i + 1)%>" >
                                                                        <% if (d.getId_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                            <input  class="fileDocument" type="file" multiple=true  <%if (d.getEs_obligatorio().equals("1")) {
                                                                                    out.println(" required='required' ");
                                                                                }%> name="archivos<%=(i + 1)%>" >
                                                                        <% } else { %>
                                                                        <% if (d.getId_documento_adjunto() == null) { %>
                                                                        <label class="null">No Registrado</label>
                                                                        <% } else {%>
                                                                        <%
                                                                            out.print(doc_.List_files(d.getId_documento_adjunto().trim()));
                                                                        %>

                                                                        <% }
                                                                        } %>
                                                                    </div>
                                                            <div class="row">
                                                               
                                                                <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                <input type="text"  placeholder="Escribe una descripci�n"  class="form-control" name="lob_description<%=i + 1%>">
                                                                <% } else { %>
                                                                <% if (d.getDe_documento_adjunto() == null) { %>
                                                                <label class="null" >No Registrado</label>
                                                                <% } else {%>
                                                                <label>Descripci�n:</label>
                                                                <label> <%=d.getDe_documento_adjunto()%></label>

                                                                <% } %>
                                                                <% } %> 
                                                                </div>
                                                                <div class="row" >
                                                                    <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                    <label>�Recibido en fisico?:</label>
                                                                    <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle"   >
                                                                        <i  data-swchon-text="SI" data-swchoff-text="NO"></i></label>
                                                                        <% } else { %>
                                                                        <% if (d.getEs_documento_adjunto() == null) { %>

                                                                    <label class="null">�Recibido en fisico?:No Registrado</label>
                                                               
                                                                        <% } else { %>
                                                                <label ><% if (d.getEs_documento_adjunto().trim().equals("1")) {
                                                                    %>

                                                                    �Recibido en fisico?:Si
                                                                    <%
                                                                    } else {

                                                                    %>
                                                                    �Recibido en fisico?:No
                                                                </label>
                                                                <% }
                                                                        }
                                                                    }%> 
                                                                </div>
                                                            
                                                         
                                                            <div class="row">
                                                                <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                <a type="button"  style="margin-top: -15px;" class="btn btn-danger btn-sm  elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getIddgp()%>&idtr=<%=d.getId_trabajador()%>"><i style="margin-top: -5px;" class="fa fa-trash-o"></i></a>
                                                                <%} else {
                                                                        out.print("");
                                                                    }%>
                                                            </div>
                                                        </div>

                                                    <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                    </div>  

                                                    <% } %>
                                                    <% } %>

                                                    <%  if (d.getTi_documento().trim().equals("DNIH")) {%>

                                                    <%if (List_Hijos.size() > 0)
                                                            for (int kk = 0; kk < List_Hijos.size(); kk++) {
                                                                Datos_Hijo_Trabajador h = new Datos_Hijo_Trabajador();
                                                                h = (Datos_Hijo_Trabajador) List_Hijos.get(kk);
                                                                if (d.getId_datos_hijo() == null) {

                                                    %>

                                                    <div class="col col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                                        <div  class="well well-sm" >
                                                            <div class="row">
                                                                    <label>Copia DNI hijo :  <p class="txt-color-red">  <%=h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador()%></p>
                                                                    </label>
                                                                </div>
                                                                    <div  class="row caji<%=(i + 1)%>" >
                                                                        <% if (d.getId_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") /* | rol.trim().equals("ROL-0013") */)) {%>
                                                                     
                                                                            <input   class="fileDocument" type="file" multiple=true   name="archivos<%=(i + 1)%>" >
                                                                            <input type="hidden" name="idh<%=(i + 1)%>" value="<%=h.getId_datos_hijos_trabajador().trim()%>" >
                                                                       
                                                                        <% } else { %>
                                                                        <% if (d.getId_documento_adjunto() == null) { %>
                                                                        <label class="null">No Registrado</label>
                                                                        <% } else {%>
                                                                        <%
                                                                            out.print(doc_.List_file_url(d.getId_documento_adjunto().trim()));
                                                                        %>

                                                                        <% }
                                                                        } %>
                                                                    </div>
                                            
                                                                    <div class="row">
                                                               
                                                                <% if (d.getDe_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") /* | rol.trim().equals("ROL-0013") */)) {%>
                                                                <input type="text"  placeholder="Escribe una descripci�n" class="form-control" name="lob_description<%=i + 1%>">
                                                                <% } else { %>
                                                                <% if (d.getDe_documento_adjunto() == null) { %>
                                                                <label class="null" >No Registrado</label>
                                                                <% } else {%> <label>Descripci�n:</label>
                                                                <label> <%=d.getDe_documento_adjunto()%></label>

                                                                <% } %>
                                                                <% } %>    
                                                               
                                                                <%if (d.getEs_documento_adjunto() == null) {%>
                                                               
                                                                    <%}%>
                                                                     </div>
                                                                     <div class="row">
                                                                    <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") /* | rol.trim().equals("ROL-0013") */)) {%>
                                                                    <label class="toggle">
                                                                        <input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i  data-swchon-text="SI" data-swchoff-text="NO"></i> �Recibido en fisico?:</label>
                                                                        <% } else { %>
                                                                        <% if (d.getEs_documento_adjunto() == null) { %>

                                                                    <label class="null"> �Recibido en fisico?:No Registrado</label>
                                                             
                                                                        <% } else { %>
                                                                <label>
                                                                    <% if (d.getEs_documento_adjunto().trim().equals("1")) { %>

                                                                    �Recibido en fisico?:Si
                                                                    <%
                                                                    } else {

                                                                    %>
                                                                    �Recibido en fisico?:No
                                                                </label>
                                                                <% }
                                                                        }
                                                                    }%>
                                                                     
                                                                <%if (d.getEs_documento_adjunto() == null) {%>

                                                                <%}%>
                                                                  </div>
                                                         
                                                                  <div class="row">
                                                                <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") /* | rol.trim().equals("ROL-0013") */)) {%>
                                                                <a type="button"  class="btn btn-danger btn-sm elimi" href="../../../documento_trabajador?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&idtr=<%=d.getId_trabajador()%>"><i style="margin-top: -5px;" class="fa fa-trash-o"></i></a>
                                                                <%} else {
                                                                        out.print("");
                                                                    }%>
                                                                    </div>
                                                        </div>
                                                    <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                    </div>  
                                                    <%
                                                    } else {
                                                        if (h.getVal_doc() > 0 & d.getId_datos_hijo().equals(h.getId_datos_hijos_trabajador().trim())) {
                                                    %>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                                        <div  class="well well-sm">
                                                            <div class="row">
                                                                    <label>Copia DNI hijo:  <%=h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador()%></label>
                                                                </div>
                                                                    <div class="row caji<%=(i + 1)%>">
                                                                        <% if (d.getId_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") /* | rol.trim().equals("ROL-0013") */)) {%>
                                                                            <input class="fileDocument" type="file" multiple=true   name="archivos<%=(i + 1)%>" >
                                                                            <input type="hidden" name="idh<%=(i + 1)%>" value="<%=h.getId_datos_hijos_trabajador().trim()%>" >
                                                                        <% } else { %>
                                                                        <% if (d.getId_documento_adjunto() == null) { %>
                                                                        <label class="null">No Registrado</label>
                                                                        <% } else {%>
                                                                        <%
                                                                            out.print(doc_.List_file_url(d.getId_documento_adjunto().trim()));
                                                                        %>

                                                                        <% }
                                                                        } %>
                                                                    </div>
                                                                    <div class="row">
                                                              
                                                                <% if (d.getDe_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") /* | rol.trim().equals("ROL-0013") */)) {%>
                                                                <input type="text"  placeholder="Escribe una descripci�n"  class="form-control" name="lob_description<%=i + 1%>">
                                                                <% } else { %>
                                                                <% if (d.getDe_documento_adjunto() == null) { %>
                                                                <label class="null" >No Registrado</label>
                                                                <% } else {%>
                                                                  <label>Descripci�n:</label>
                                                                <label> <%=d.getDe_documento_adjunto()%></label>

                                                                <% } %>
                                                                <% } %>    
                                                               
                                                                <%if (d.getEs_documento_adjunto() == null) {%>
                                                                
                                                                    <%}%>
                                                                     </div>
                                                                    <div class="row">
                                                                        <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") /* | rol.trim().equals("ROL-0013") */)) {%>
                                                                        <label class="toggle"><input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" style="margin-left:auto; margin-right:auto;"><i style="margin-top: -5px;" data-swchon-text="SI" data-swchoff-text="NO"></i> �Recibido en fisico?:</label>
                                                                            <% } else { %>
                                                                            <% if (d.getEs_documento_adjunto() == null) { %>

                                                                        <label class="null"> �Recibido en fisico?:No Registrado</label>
                                                                            <% } else { %>
                                                                    <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>

                                                                        �Recibido en fisico?:Si
                                                                        <%
                                                                        } else {

                                                                        %>
                                                                        �Recibido en fisico?:No
                                                                    </label>
                                                                    <% }
                                                                            }
                                                                        }%>
                                                                    <%if (d.getEs_documento_adjunto() == null) {%>
                                                                </div>
                                                                <%}%>
                                                          
                                                            <div class="row">
                                                                <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") /* | rol.trim().equals("ROL-0013") */)) {%>
                                                                <a type="button"  class="btn btn-danger btn-sm elimi" href="../../../documento_trabajador?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> </a>
                                                                <%} else {
                                                                        out.print("");
                                                                    }%>
                                                            </div> 
                                                        </div>
                                                    <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                    </div>  

                                                    <%

                                                    } else if (h.getVal_doc() == 0 & !id_hijo_faltante.equals(h.getId_datos_hijos_trabajador())) {

                                                    %>
                                                    <div class="col col-lg-4 col-md-4 col-sm-6 col-xs-6" >
                                                        <div class="well wel-sm">
                                                            <div class="row">
                                                                    <label>
                                                                        Copia DNI hijo :  <%=h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador()%></label>
                                                                </div>
                                                                <div class="row caji<%=(i + 1)%>" >
                                                                        <% if ((rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") /* | rol.trim().equals("ROL-0013") */)) {%>
                                                                            <input  class="fileDocument" type="file" multiple=true     name="archivos<%=(i + 1)%>" >
                                                                            <input type="hidden" name="idh<%=(i + 1)%>" value="<%=h.getId_datos_hijos_trabajador().trim()%>" >
                                                                        
                                                                        <% } else { %>
                                                                        <label class="null">No Registrado</label>
                                                                        <% } %>
                                                                    </div>
                                                            
                                                            <div class="row">
                                                                
                                                                <% if ((rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") /* | rol.trim().equals("ROL-0013") */)) {%>
                                                                <input type="text"  placeholder="Escribe una descripci�n" class="form-control" name="lob_description<%=i + 1%>">
                                                                <% } else { %>
                                                                <label>Descripci�n:</label>
                                                                <label class="null" >No Registrado</label>
                                                                <% } %> 

                                                            </div>
                                                                <div class="row">
                                                                    <% if ((rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001") /* | rol.trim().equals("ROL-0013") */)) {%>
                                                                    <label class="toggle">
                                                                        <input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle" ><i   data-swchon-text="SI" data-swchoff-text="NO"></i> �Recibido en fisico?:</label>
                                                                        <% } else {%>
                                                                    <label class="null"> �Recibido en fisico?: No Registrado</label>
                                                                        <% }%>
                                                                </div>
                                                         
                                                        </div>
                                                        <!--  <div  style="text-align:center;" align="center">
                                                          </div>-->
                                                    <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                    </div> 
                                                    <%
                                                                        id_hijo_faltante = h.getId_datos_hijos_trabajador();
                                                                    }

                                                                }
                                                                i++;
                                                            }
                                                    %>

                                                    <%} else if (!d.getTi_documento().trim().equals("DNIH") & !d.getTi_documento().trim().equals("DNIC") & !d.getTi_documento().trim().equals("ACMA") & !d.getTi_documento().trim().equals("COFE") & !d.getTi_documento().trim().equals("DOCA")) {
                                                    %>
                                                    <div class="col col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                                        <div class="well wel-sm">
                                                           
                                                    <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                                                    <div class="row">
                                                          <div  class="text-center">
                                                                    <%=d.getDocumento()%>
                                                                </div>
                                                    </div>
                                                            
                                                                <div class="row caji<%=(i + 1)%>" >
                                                                    <% if (d.getId_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                        <input   class="fileDocument" type="file" multiple=true   <%if (d.getEs_obligatorio().equals("1")) {
                                                                                out.println(" required='required' ");
                                                                            }%> name="archivos<%=(i + 1)%>" >

                                                                    <% } else { %>
                                                                    <% if (d.getId_documento_adjunto() == null) { %>
                                                                    <label class="null">No Registrado</label>
                                                                    <% } else {%>
                                                                    <%
                                                                        out.print(doc_.List_files(d.getId_documento_adjunto().trim()));
                                                                    %>

                                                                    <% }
                                                                    } %>
                                                                </div>
                                                            
                                                        
                                                                <div class="row" >
                                                            
                                                            <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                            <input type="text"  placeholder="Escribe una descripci�n" class="form-control"   name="lob_description<%=i + 1%>">
                                                            <% } else { %>
                    <label> Descripci�n:</label>

                                                            <% if (d.getDe_documento_adjunto() == null) { %>
                                                            <label class="null" >No Registrado</label>
                                                            <% } else {%>
                                                            <label> <%=d.getDe_documento_adjunto()%></label>

                                                            <% } %>
                                                            <% } %>
                                                            </div>
                                                               <div class="row">
                                                              
                                                            <%if (d.getEs_documento_adjunto() == null) {%>
                                                            <label>�Recibido en fisico?:</label>
                                                           <%}%>
                                                                <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                                <label class="toggle"  >
                                                                    <input type="checkbox" value="1"   name="estado<%=i + 1%>" name="checkbox-toggle"  >
                                                                    <i  data-swchon-text="SI" data-swchoff-text="NO"></i>
                                                                </label>
                                                                    <% } else { %>
                                                                    <% if (d.getEs_documento_adjunto() == null) { %>

                                                                <label class="null">�Recibido en fisico?: No Registrado</label>
                                                            
                                                                    <% } else { %>
                                                            <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>
                                                                �Recibido en fisico?: Si
                                                                <%
                                                                } else {

                                                                %>
                                                                �Recibido en fisico?: No
                                                            </label>
                                                                
                                                            <% }
                                                                    }
                                                                }%>
                                                            <%if (d.getEs_documento_adjunto() == null) {%>

                                                            <%}%>
                                                            </div>
                                                   
                                                        <!-- </div>
                                                         <div  class="table-bordered" style="text-align:center;" align="center">-->
                                                        <div class="row">
                                                            <%if (d.getEs_documento_adjunto() != null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001"))) {%>
                                                            <a type="button"  class="btn btn-danger btn-sm  elimi" href="../../../documento?opc=Eliminar&id_doc=<%=d.getId_documento_adjunto()%>&iddgp=<%=d.getIddgp()%>&idtr=<%=d.getId_trabajador()%>"><i class="fa fa-trash-o"></i> </a>
                                                            <%} else {
                                                                    out.print("");
                                                                }%>
                                                        </div> 
                                                        </div>
                                                 
                                                    </div>  
                                                    <input type="hidden" name="iddgp" value="<%=d.getIddgp()%>">
                                                    <input type="hidden" name="idctr" value="<%=request.getParameter("idctr")%>">
                                                    <input type="hidden" name="idtr" value="<%=request.getParameter("idtr")%>">
                                                    <% }
                                                            i++;
                                                            id_dgp = d.getIddgp();

                                                        }%>
                                                    <input type="hidden" name="num" value="<%=i + 1%>">
                                                    <% if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001")) { %>
                                                    <%if (request.getParameter("P2") != null) {%>
                                                    <%} else {%>
                                                    <div><div><input type="hidden" value="Registrar" name="opc"></div></div>
                                                            <%}%>
                                                            <%}%>
                                                     
                                                </div>
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

                                                <button type="button" class="btn btn-primary btn_reg_doc" style="display:none"> <i class="fa fa-plus-square"></i>
                                                    Registrar
                                                </button>


                                                <% }
                                                } else {%>
                                                <a class="btn btn-success btn-labeled btn_continuar_det" style="display:none" href="../../../dgp?iddgp=<%=id_dgp%>&idtr=<%=request.getParameter("idtr")%>&opc=rd">CONTINUAR <i class="fa fa-arrow-circle-right"></i> </a>

                                                <button type="button" class="btn btn-primary btn_reg_doc"  style="display:none" >
                                                    Registrar
                                                </button>
                                                <button type="button" onclick="history.back()"  class="btn btn-default btn_atras">
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

        <!-- EASY PIE CHARTS 
        <script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>-->

        <!-- SPARKLINES 
        <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>-->

        <!-- JQUERY VALIDATE -->
        <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT 
        <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->

        <!-- JQUERY SELECT2 INPUT 
        <script src="../../../js/plugin/select2/select2.min.js"></script>-->

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="../../../js/plugin/fastclick/fastclick.min.js"></script>



        <!--[if IE 8]>

        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

        <![endif]-->

        <!-- Demo purpose only
        <script src="../../../js/demo.min.js"></script> -->

        <!-- MAIN APP JS FILE -->
        <script src="../../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin 
        <script src="../../../js/speech/voicecommand.min.js"></script>-->

        <!-- PAGE RELATED PLUGIN(S) -->

        <script src="../../../js/plugin/jquery-form/jquery-form.min.js"></script>
        
        <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>-->
        
        <script src="../../../js/bootstrap/fileinput.js" type="text/javascript"></script>
      <!--  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>-->
         <script src="../../../js/bootstrap/es.js" type="text/javascript"></script>
        <script src="../../../js/notification/SmartNotification.min.js"></script>
        <script type="text/javascript" src="../../../js/shadowbox/demo.js"></script>
        <script type="text/javascript" src="../../../js/shadowbox/shadowbox.js"></script>
        
        <script src="../../../js/businessLogic/Trabajador/RegDocumentoDGP.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
