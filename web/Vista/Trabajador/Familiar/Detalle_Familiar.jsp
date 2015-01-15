<%@page import="pe.edu.upeu.application.model.Padre_Madre_Conyugue"%>
<jsp:useBean id="List_PMC" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="LISTA_HIJOS" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link type="text/css" rel="stylesheet" href="../../../css/Css_Detalle/CSS_DETALLE.css">
        <link type="text/css" rel="stylesheet" href="../../../css/Css_Detalle/style.css"> 
        <link rel="stylesheet" type="text/css" media="screen" href="../../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../HTML_version/css/font-awesome.min.css">
        <script src=" ../../../../../js1/jquery-1.11.1.min.js" type="text/javascript"></script>
        <title>Familiares</title>

    </head>
    <body>
    <center>
        <%
            HttpSession sesion = request.getSession(true);
            String rol = (String) sesion.getAttribute("IDROL");
        %>

        <%if (List_PMC.size() != 0  ) {%>
        <form align="center" action="../../../familiar">
            <div>
                <table class="table table-striped table-bordered table-hover" >
                    <tr><td colspan="2"><div class="title">Datos de Padre y Madre</div></td></tr>
                    <%for (int i = 0; i < List_PMC.size(); i++) {
                            Padre_Madre_Conyugue pmc = new Padre_Madre_Conyugue();
                            pmc = (Padre_Madre_Conyugue) List_PMC.get(i);
                    %>
                    <tr><td class="text-info">Nombres y Apellidos del padre:</td><td class="text-info-left"><%=pmc.getAp_nombres_padre()%></td></tr>
                    <tr><td class="text-info">Nombres y Apellidos de la Madre :</td><td class="text-info-left"><%=pmc.getAp_nombres_madre()%></td></tr>
                </table>
            </div>

            <div style="display:/*none*/" >
                <table  class="table table-striped table-bordered table-hover"  >
                    <tr><td colspan="2"><div class="title">Conyugue</div></td></tr>
                    <tr><td class="text-info">Trabaja en UPeU:</td><td class="text-info-left">
                            <%
                                if (pmc.getEs_trabaja_upeu_conyugue().trim().equals("1")) {
                                    out.println("Si");
                                }
                                if (pmc.getEs_trabaja_upeu_conyugue().trim().equals("2")) {
                                    out.println("No");
                                }
                            %>
                        </td></tr>
                    <tr><td class="text-info">Apellidos y Nombres:</td><td class="text-info-left"><%=pmc.getAp_nombres_conyugue()%></td></tr>
                    <tr><td class="text-info">Fecha de Nacimiento:</td><td class="text-info-left"><%=pmc.getFe_nac_conyugue()%></td></tr>
                    <tr ><td class="text-info">Documento</td><td class="text-info-left">
                            <%
                                if (pmc.getTi_doc_id().trim().equals("1")) {
                                    out.println("DNI");
                                }
                                if (pmc.getTi_doc_id().trim().equals("2")) {
                                    out.println("Pasaporte");
                                }
                            %>
                        </td></tr>
                    <tr><td class="text-info">Numero Documento:</td><td class="text-info-left"><%=pmc.getNu_doc()%></td></tr>
                    <tr><td class="text-info">Inscripcion Vigente en EsSalud:</td><td class="text-info-left">
                            <%
                                if (pmc.getLi_inscripcion_vig_essalud().trim().equals("1")) {

                                    out.println("Si");
                                }
                                if (pmc.getLi_inscripcion_vig_essalud().trim().equals("2")) {

                                    out.println("No");
                                }
                            %>
                        </td></tr>
                </table>
            </div>
            <table class="table table-striped table-bordered table-hover">
                <input type="hidden" name="idtra" value="<%=pmc.getId_trabajador().trim()%>">
                <%}%>
                
                <tr><td colspan="2"></td><td><input class="btn btn-success" type="submit" name="opc" value="Editar"></td></tr>
            </table>
        </form>
        <%} else {%>
        <center>
            <label>Aun no se ha registrado los datos del familiar</label>
            <%  if (rol.trim().equals("ROL-0002")|rol.trim().equals("ROL-0005")) {%>
            <a href="Reg_Padre_Madre_Conyugue.jsp?idtr=<%=request.getParameter("idtr")%>">Registrar</a>
            <%}%>
        </center>
        <% } %>
    </center>
</body>
</html>
<center>
    <%@include file="List_Hijo.jsp" %>
    <%

        if (LISTA_HIJOS.size() != 0) {
    if (rol.trim().equals("ROL-0002")|rol.trim().equals("ROL-0005")) {%>
     
    <a href="Reg_Datos_Hijo.jsp?idtr=<%=request.getParameter("idtr")%>" class="button blue">Agregar un hijo</a>
    <%}%>
    <%} else {%>

    <label>No se ha registrado ningun Hijo(a)</label><br>
    
    <%  if (rol.trim().equals("ROL-0002")|rol.trim().equals("ROL-0005")) {%>
    <a href="Reg_Datos_Hijo.jsp?idtr=<%=request.getParameter("idtr")%>" class="">Registrar</a>
    <%}%>
</center>
<%}%>
