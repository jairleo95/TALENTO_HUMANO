
<%@page import="pe.edu.upeu.application.util.DateFormat"%>
<%@page import="pe.edu.upeu.application.model.Tipo_Documento"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%    HttpSession sesion_ = request.getSession();
    String id_user_ = (String) sesion_.getAttribute("IDUSER");
    if (id_user_ != null) {
%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.Padre_Madre_Conyugue"%>
<jsp:useBean id="LISTA_HIJOS" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="ListaridTrabajador" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Lista_Tipo_Doc" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
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

    </head>
    <body>
    <center>
        <%
            HttpSession sesion = request.getSession(true);
            String rol = (String) sesion.getAttribute("IDROL");
            for (int q = 0; q < ListaridTrabajador.size(); q++) {
                V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                tr = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(q);
        %>
        <form  action="../../../familiar">
            <div>
                <table class="table table-striped table-bordered table-hover" >
                    <tr><td colspan="2"><h4>Datos de Padre y Madre</h4></td></tr>

                    <tr><td class="text-info">Nombres y Apellidos del padre:</td><td class="text-info-left"><%if (tr.getAp_nombres_padre() != null) {
                            out.print(tr.getAp_nombres_padre());
                        } else {
                            out.print("No registrado");
                        }
                            %></td></tr>
                    <tr><td class="text-info">Nombres y Apellidos de la Madre :</td><td class="text-info-left"><%if (tr.getAp_nombres_madre() != null) {
                            out.print(tr.getAp_nombres_madre());
                        } else {
                            out.print("No registrado");
                        }
                            %></td></tr>
                            <%if (tr.getAp_nombres_madre() == null || tr.getAp_nombres_padre() == null) {%>
                            <%  if (rol.trim().equals("ROL-0002") || rol.trim().equals("ROL-0005") || rol.trim().equals("ROL-0001") | rol.trim().equals("ROL-0013")) {%>
                    <tr><td colspan="2"> <a class="btn btn-primary" href="Reg_Padres.jsp?idtr=<%=request.getParameter("idtr")%>">Registrar Padres</a></td></tr>
                    <%}%>
                    <%} else {%>
                    <tr><td colspan="2"> <a class="btn btn-primary" href="../../../familiar?opc=Modificar_Padres&idtr=<%=request.getParameter("idtr")%>">Modificar Padres</a></td></tr>
                    <%}%>
                </table>
            </div>



            <table  class="table table-striped table-bordered table-hover"  >
                <tr><td colspan="2"><div class="title"><h4>Datos de Cónyuge</h4></div></td></tr>
                <%if (tr.getAp_nombres_c() != null) {
                %>
                <tr><td class="text-info">Trabaja en UPeU:</td><td class="text-info-left">
                        <%
                            if (tr.getEs_trabaja_upeu_c().trim().equals("1")) {
                                out.println("Si");%>
                        <%if (tr.getId_conyugue() != null) {
                        %>
                        <%
                            }
                        %>
                        <%
                            }
                            if (tr.getEs_trabaja_upeu_c().trim().equals("0")) {
                                out.println("No");
                            }
                        %>
                    </td></tr>
                <tr><td class="text-info">Apellidos y Nombres:</td><td class="text-info-left"><%if (tr.getAp_nombres_c() != null) {
                        out.print(tr.getAp_nombres_c());
                    } else {
                        out.print("No registrado");
                    }
                        %></td></tr>
                <tr><td class="text-info">Fecha de Nacimiento:</td><td class="text-info-left"><%if (tr.getFe_nac_c() != null) {
                        out.print(DateFormat.toFormat5(tr.getFe_nac_c()));
                    } else {
                        out.print("No registrado");
                    }
                        %></td></tr>
                <tr ><td class="text-info">Tipo Documento:</td><td class="text-info-left">
                        <%if (tr.getId_tipo_doc_c() != null) {
                                for (int h = 0; h < Lista_Tipo_Doc.size(); h++) {
                                    Tipo_Documento td = new Tipo_Documento();
                                    td = (Tipo_Documento) Lista_Tipo_Doc.get(h);
                                    if (tr.getId_tipo_doc_c().trim().equals(td.getId_tipo_doc_ident().trim())) {
                                        out.print(td.getDe_tdoc_abreviada());
                                    }
                                }
                            } else {
                                out.print("no registrado");
                            }
                        %>
                    </td></tr>
                <tr><td class="text-info">Nro Documento:</td><td class="text-info-left"><%if (tr.getNu_doc_c() != null) {
                        out.println(tr.getNu_doc_c());
                    } else {
                        out.print("No registrado");
                    }
                        %></td></tr>
                <tr><td class="text-info">Inscripcion Vigente en EsSalud:</td><td class="text-info-left">
                        <%
                            if (tr.getLi_inscripcion_vig_essalud_c() != null) {

                                if (tr.getLi_inscripcion_vig_essalud_c().trim().equals("1")) {

                                    out.println("Si");
                                }
                                if (tr.getLi_inscripcion_vig_essalud_c().trim().equals("0")) {

                                    out.println("No");
                                }
                            } else {
                                out.println("No registrado");
                            }
                        %>
                    </td></tr>

                <%} else{%>
                <tr><td colspan="2"> <label>Aun no se ha registrado los datos del cónyugue</label><br></td></tr> 
                        <%  if (rol.trim().equals("ROL-0002") || rol.trim().equals("ROL-0005") || rol.trim().equals("ROL-0001") || rol.trim().equals("ROL-0013")) {%>
                <tr><td colspan="2"> <a class="btn btn-success" href=Reg_Conyugue.jsp?idtr=<%=request.getParameter("idtr")%>">Registrar Cónyugue</a></td></tr>
                <%}%>
                <%}%>
                <%//if (tr.getAp_nombres_c() != null && tr.getAp_nombres_madre() != null && tr.getAp_nombres_padre() != null) {%>
                <%if (tr.getAp_nombres_c() != null ) {%>
                <input type="hidden" name="idtra" value="<%=tr.getId_trabajador().trim()%>">
                <input type="hidden" name="opc" value="Editar_Familiar">
                <tr><td colspan="2"><input class="btn btn-primary" type="submit" value="Modificar Cónyugue"></td></tr>
                        <%}%>

            </table>
        </form>

    </center>
    <br>
    <center>

        <%        if (LISTA_HIJOS.size() != 0) {
                //        if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") || rol.trim().equals("ROL-0001") || rol.trim().equals("ROL-0013")) {
                if (true) {
        %>
        <div class="listar_hijos"></div>
        <a href="Reg_Datos_Hijo.jsp?idtr=<%=request.getParameter("idtr")%>" class="btn btn-primary">Registrar un hijo</a>
        <%}%>
        <%} else{%>

        <span>No se ha registrado ningun Hijo(a)</span><br>

        <%
            //if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") || rol.trim().equals("ROL-0001") || rol.trim().equals("ROL-0013")) {
            if (true) {
        %>
        <a href="Reg_Datos_Hijo.jsp?idtr=<%=request.getParameter("idtr")%>" class="btn btn-primary">Registrar Hijos</a>
        <%}%>
    </center>
    <%}
        }%>

</body>
<!--================================================== -->
 
<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script>
    if (!window.jQuery) {
        document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');
    }
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script>
    if (!window.jQuery.ui) {
        document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
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
<script type="text/javascript">
    $(document).ready(
            function () {
                pageSetUp();
                $.post("../../../familiar", "opc=Listar_Hijo_id_tr&idtr=<%=request.getParameter("idtr")%>", function (objJson) {
                    var texto_html = '';
                    var div = $(".listar_hijos");
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    } else {
                        var lista = objJson.lista;
                        if (lista.length == 0) {
                        } else {
                            texto_html += ' <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%" style="margin-left:0.5%;" >'
                                    + '<thead><tr><th data-hide="phone">Nro</th><th data-class="expand">Apellidos y Nombres</th><th data-hide="phone">Fecha de nacimiento</th>'
                                    + '<th data-hide="phone">Sexo</th><th data-hide="phone,tablet">Tipo de Documento</th><th data-hide="phone,tablet">Nro Documento</th>'
                                    + '<th data-hide="phone,tablet">Essalud</th><th data-hide="phone,tablet">Est.Nivel Superior</th><th data-hide="phone,tablet" colspan="2">Opciones</th> </tr></thead>';
                            texto_html += '<tbody>';
                            for (var i = 0; i < lista.length; i++) {
                                texto_html += '<tr>'
                                        + '  <td>' + (i + 1) + '</td>'
                                        + '<td >' + lista[i].ap_p + ' ' + lista[i].ap_m + ' ' + lista[i].no_hijo + '</td>'
                                        + ' <td >' + lista[i].fe_nac + '</td>'
                                        + '<td >' + lista[i].sexo + '</td>'
                                        + '<td>' + lista[i].ti_doc + '</td>'
                                        + '<td >' + lista[i].nu_doc + '</td>'
                                        + '<td >' + lista[i].essalud + '</td>'
                                        + '<td >' + lista[i].superior + '</td>'
                                        + '<td >';
    <% if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0001") | rol.trim().equals("ROL-0013")) {%>

                                texto_html += '<a href = "../../../familiar?idhijo=' + lista[i].idh + '&idtr=' + lista[i].idtr + '&opc=modificar" class="btn btn-success btn-sm">'
                                        + ' <i class="fa fa-pencil"></i></a>'
                                        + ' <button type="button" class = "btn btn-danger btn-sm eliminar" value="../../../familiar?idhijo=' + lista[i].idh + '&idtr=' + lista[i].idtr + '&opc=eliminar">'
                                        + ' <i class="fa fa-times"></i> </button>';

    <%}%>
                                texto_html += '</td></tr>';
                            }
                            texto_html += '</tbody></table>';
                            div.append(texto_html);
                        }
                    }
                    $(".eliminar").click(function () {
                        var url = $(this).val();
                        $.SmartMessageBox({
                            title: "Eliminar Hijo!",
                            content: "¿Esta seguro que desea eliminar un hijo?",
                            buttons: '[No][Yes]'
                        }, function (ButtonPressed) {
                            if (ButtonPressed === "Yes") {
                                window.location.href = url;

                            }
                            if (ButtonPressed === "No") {
                                return false;
                            }

                        });
                        return false;
                    });
                });
            }
    );
</script>
</html>

<%}

    
        else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
