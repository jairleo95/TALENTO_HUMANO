
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%
    HttpSession sesion_ = request.getSession();
    String id_user_ = (String) sesion_.getAttribute("IDUSER");
    if (id_user_ != null) {
%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.Padre_Madre_Conyugue"%>
<jsp:useBean id="List_PMC" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="LISTA_HIJOS" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="ListaridTrabajador" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link type="text/css" rel="stylesheet" href="../../../css/Css_Detalle/CSS_DETALLE.css">

        <link rel="stylesheet" type="text/css" media="screen" href="../../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../HTML_version/css/font-awesome.min.css">
        <!-- <script type="text/javascript" src="../../../js-steps/jquery-1.11.1.js" "></script>-->
        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
        <title>Familiares</title>

    </head>
    <body>
    <center>
        <%
            HttpSession sesion = request.getSession(true);
            String rol = (String) sesion.getAttribute("IDROL");
        %>

        <%
            V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
            tr = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(0);
        %>
        <form align="center" action="../../../familiar">
            <div>
                <table class="table table-striped table-bordered table-hover" >
                    <tr><td colspan="2"><div class="title"><h4>DATOS DE PADRE Y MADRE</h4></div></td></tr>

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
                </table>
            </div>


            <table  class="table table-striped table-bordered table-hover"  >
                <tr><td colspan="2"><div class="title"><h4>DATOS DE CONYUGUE</h4></div></td></tr>
                <%if (tr.getAp_nombres_c() != null) {
                %>
                <tr><td class="text-info">Trabaja en UPeU:</td><td class="text-info-left">
                        <%
                            if (tr.getEs_trabaja_upeu_c().trim().equals("1")) {
                                out.println("Si");%>
                        <%if (tr.getId_conyugue() != null) {
                        %>
                        <a class="btn btn-success" href="../../../trabajador?idtr=<%=tr.getId_trabajador()%>&opc=list">VER DETALLE</a>
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
                        out.print(tr.getFe_nac_c());
                    } else {
                        out.print("No registrado");
                    }
                        %></td></tr>
                <tr ><td class="text-info">Documento (cambiar)</td><td class="text-info-left">
                        <%if (tr.getId_tipo_doc_c() != null) {

                                if (tr.getId_tipo_doc_c().trim().equals("1")) {
                                    out.println("DNI");
                                }
                                if (tr.getId_tipo_doc_c().trim().equals("2")) {
                                    out.println("Pasaporte");
                                }
                            } else {

                                out.println("No registrado");
                            }
                        %>
                    </td></tr>
                <tr><td class="text-info">Numero Documento:</td><td class="text-info-left"><%if (tr.getNu_doc_c() != null) {
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
                <input type="hidden" name="idtra" value="<%=tr.getId_trabajador().trim()%>">
                <tr><td colspan="2"><input class="btn btn-success" type="submit" name="opc" value="Editar"></td></tr>
                        <%} else {%>



                <tr><td colspan="2"> <label>Aun no se ha registrado los datos del cónyugue</label><br></td></tr> 
                        <%  if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005")) {%>
                <tr><td colspan="2"> <a class="btn btn-success" href=Reg_Padre_Madre_Conyugue.jsp?idtr=<%=request.getParameter("idtr")%>">Agregar Cónyugue</a></td></tr>
                <%}%>
                <%}%>
            </table>
        </form>

    </center>
    <br>
    <center>

        <%        if (LISTA_HIJOS.size() != 0) {
                if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005")) {%>

        <a href="Reg_Datos_Hijo.jsp?idtr=<%=request.getParameter("idtr")%>" class="btn btn-primary">Agregar un hijo</a>
        <%}%>
        <%} else {%>

        <label>No se ha registrado ningun Hijo(a)</label><br>

        <%  if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005")) {%>
        <a href="Reg_Datos_Hijo.jsp?idtr=<%=request.getParameter("idtr")%>" class="btn btn-primary">Registrar Hijos</a>
        <%}%>
    </center>
    <%}%>

</body>
</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>