<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<jsp:useBean class="java.util.ArrayList" id="Det_Autorizacion" scope="application" />
<%@page import="pe.edu.upeu.application.model.X_List_De_Autorizacion"%>
<!DOCTYPE html >

<html>

    <head>
        <meta charset="windows-1252">
        <title>Autorizaciones DGP</title>
        <link href="../../css/Css_Lista/listas.css" rel="stylesheet"> 
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
    
        <%HttpSession sesion = request.getSession();
            String rol = (String) sesion.getAttribute("IDROL");%>

    </head>
    <body>
    <center>
        <br>

        <br>

        <div class="spacing">
            <center><h1 class="spacing">HISTORIAL DE AUTORIZACIONES POR  TRABAJADOR</h1></center>
        </div>

        <%
            if (Det_Autorizacion.size() != 0) {
                X_List_De_Autorizacion s = new X_List_De_Autorizacion();
                s = (X_List_De_Autorizacion) Det_Autorizacion.get(0);
        %>


        <table class="table">
            <tr><td ><strong>Nombre:</strong></td><td><label><%=s.getAP_PATERNO().toUpperCase() + " " + s.getAP_MATERNO().toUpperCase() + " " + s.getNO_TRABAJADOR().toUpperCase()%></label></td></tr>
            <tr><td ><strong>Sueldo:</strong></td><td><label><%=s.getCA_SUELDO()%> </label></td></tr>
            <tr><td ><strong>Puesto:</strong></td><td><label><%=s.getNo_puesto()%></label></td></tr>
            <tr><td ><strong>Tipo Proceso:</strong></td><td><label><%=s.getNo_proceso()%> </label></td></tr>
        </table>
        <%}%>

        <table >

            <thead>
                
            </thead>
            <tbody>
               
               
            </tbody>
        </table>
    </center>
</body>
</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>