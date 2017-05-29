<%@page import="pe.edu.upeu.application.model.Tipo_Institucion"%>
<%@page import="pe.edu.upeu.application.model.Universidad"%>
<%@page import="pe.edu.upeu.application.model.Cuenta_Sueldo"%>
<%@page import="pe.edu.upeu.application.dao.Carrera_UniversidadDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceCarrera_UniversidadDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<jsp:useBean id="ListaridTrabajador" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Cuenta_Sueldo" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Universidad" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_tipo_institucion" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
           <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <title></title>

    </head>
    <body class="slideInDown fast animated">
            <table class="table table-striped table-hover table-responsive">
                <%  String edit = request.getParameter("edit");
                    InterfaceCarrera_UniversidadDAO icu = new Carrera_UniversidadDAO();
                    for (int index = 0; index < ListaridTrabajador.size(); index++) {
                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);

                %>   
                <tr><td class="text-info">Situacion Educativa:</td><td><%out.println(trb.getNo_s_educativa());%></td></tr>
                <tr><td class="text-info">I.E.Peruana:</td>
                    <td>
                        <%if (trb.getEs_inst_educ_peru() == null) {
                                out.print("No registrado");
                            } else {
                                if (trb.getEs_inst_educ_peru().trim().equals("1")) {
                                    out.print("Si");
                                } else {
                                    out.print("No");
                                }
                            }%>
                    </td>
                </tr>
                <tr><td class="text-info">Regimen.I.E:</td><td>
                        <%if (trb.getLi_reg_inst_educativa() == null) {
                                out.print("No registrado");
                            } else {
                                if (trb.getLi_reg_inst_educativa().trim().equals("1")) {
                                    out.print("Pública");
                                } else {
                                    out.print("Privada");
                                }
                            }%>
                    </td></tr>
                <tr><td class="text-info">Tipo.I.E:</td>
                    <% if (trb.getNo_universidad() != null) {
                            for (int y = 0; y < List_Universidad.size(); y++) {
                                Universidad un = new Universidad();
                                un = (Universidad) List_Universidad.get(y);
                                if (trb.getNo_universidad().trim().equals(un.getNo_universidad().trim())) {

                                    for (int r = 0; r < List_tipo_institucion.size(); r++) {
                                        Tipo_Institucion ti = new Tipo_Institucion();
                                        ti = (Tipo_Institucion) List_tipo_institucion.get(r);

                                        if (un.getId_tipo_institucion().trim().equals(ti.getId_tipo_institucion().trim())) {
                    %>
                    <td><%=ti.getNo_tipo_institucion()%></td>
                    <%
                                    }
                                }
                                ;
                            }
                        }
                    } else {

                    %>
                    <td>No registrado</td>
                    <%}%>
                </tr>
                <tr><td class="text-info">Centro de Estudios:</td>
                    <%if (trb.getNo_universidad() != null) {
                            if (trb.getNo_universidad() != null) {
                                for (int w = 0; w < List_Universidad.size(); w++) {
                                    Universidad u = new Universidad();
                                    u = (Universidad) List_Universidad.get(w);
                                    if (u.getNo_universidad().trim().equals(trb.getNo_universidad().trim())) {
                    %>
                    <td><%=u.getNo_universidad()%></td>
                    <%}
                            }
                        }
                    } else {
                    %>
                    <td>No registrado</td> 
                    <%}%>
                </tr>
                <!--<tr><td class="text-info">Grado Acádemico:</td><td><%%></td></tr>-->
                <tr><td class="text-info">Carrera:</td><td><%if (trb.getNo_carrera() == null) {
                        out.print("No registrado");
                    } else {
                        out.print(trb.getNo_carrera());
                    }%></td></tr>
                <!--<tr><td class="text-info">Titulo Profesional:</td><td><%%></td></tr>-->
                <tr><td class="text-info">Código Universitario:</td><td><%if (trb.getCo_universitario() == null) {
                        out.print("No registrado");
                    } else {
                        out.print(trb.getCo_universitario());
                    }%></td></tr>
                <tr><td class="text-info">Tipo de Hora Referencial:</td><td><%if (trb.getCa_tipo_hora_pago_refeerencial() == null || trb.getCa_tipo_hora_pago_refeerencial().trim().equals("null")) {
                        out.print("No registrado");
                    } else {
                        out.print(trb.getCa_tipo_hora_pago_refeerencial());
                    }%></td></tr>
                <tr><td class="text-info">Año Egreso:</td><td><%if (trb.getDe_anno_egreso() == null) {
                        out.print("No registrado");
                    } else {
                        out.print(trb.getDe_anno_egreso());
                    }%></td></tr>
                <tr><td class="text-info">Otros Estudios:</td><td><%if (trb.getCm_otros_estudios() == null) {
                        out.print("No registrado");
                    } else {
                        out.print(trb.getCm_otros_estudios());
                    }%></td></tr>
                <tr><td class="text-info" colspan="2" >CUENTA SUELDO</td></tr>


                <%for (int k = 0; k < List_Cuenta_Sueldo.size(); k++) {
                        Cuenta_Sueldo cs = new Cuenta_Sueldo();
                        cs = (Cuenta_Sueldo) List_Cuenta_Sueldo.get(k);
                %>
                <%if (cs.getNo_banco() == null) {%>
                <tr><td class="text-info" colspan="2" style="color:black;">Cuenta Sueldo No Registrado</td></tr>
                <%}
                    if (cs.getNo_banco() != null) {%>
                <tr><td class="text-info">Banco:</td>
                    <%if (cs.getNo_banco().trim().equals("0")) {%>
                    <td>Ninguno</td>
                    <%}
                        if (cs.getNo_banco().trim().equals("1")) {%>
                    <td>BBVA</td>
                    <%}
                        if (cs.getNo_banco().trim().equals("2")) {%>
                    <td>BCP</td>
                    <%}
                        if (cs.getNo_banco().trim().equals("3")) {%>
                    <td>Otros</td>
                    <%}%>
                </tr>
                <%}%>
                <%if (cs.getNo_banco_otros() != null) {%>
                <tr><td class="text-info">Nombre Banco:</td><td><%=cs.getNo_banco_otros()%></td></tr>
                <%}%>
                <%if (cs.getNu_cuenta() != null) {%>
                <tr><td class="text-info">Nro de Cuenta:</td><td><%=cs.getNu_cuenta()%></td></tr>
                <%}%>
                <%if (cs.getNu_cuenta_banc() != null) {%>
                <tr><td class="text-info">Nro de Cuenta Bancaria:</td><td><%=cs.getNu_cuenta_banc()%></td></tr>
                <%}%>
                <%if (cs.getEs_gem_nu_cuenta().trim().equals("1")) {%>
                <tr><td class="text-info" colspan="2" style="color:black;">Nro de Cuenta Generado por RRHH</td></tr>
                <%}%>
                <%}%>
                <%String IDTR = trb.getId_trabajador();%>
                <td colspan="2">
                    <a class="btn btn-primary btn-labeled"  href="../../trabajador?opc=Editar_Asp_Acad&idtr=<%=IDTR%>&edit=<%=edit%>"> 
                        <span class="btn-label"><i class="glyphicon glyphicon-refresh"></i></span> Editar </a>

                </td>

                </tr>
                <%}%>
                <!-- <tr><td colspan="2"><input class=""  type="submit" value="Editar"></td></tr>-->
            </table>
    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>