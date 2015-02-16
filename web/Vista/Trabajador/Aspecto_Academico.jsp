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
<jsp:useBean id="ListaridTrabajador" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/font-awesome.min.css">
        <script src=" ../../../../js1/jquery-1.11.1.min.js" type="text/javascript"></script>
        <title></title>

    </head>
    <body>


        <form align="center">
            <table class="table table-striped table-hover table-responsive">
                <%
                    InterfaceCarrera_UniversidadDAO icu = new Carrera_UniversidadDAO();
                    for (int index = 0; index < ListaridTrabajador.size(); index++) {
                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);

                %>   
                <tr><td class="text-info">Situacion Educativa:</td><td><%out.println(trb.getNo_s_educativa());%></td></tr>
                <tr><td class="text-info">I.E.Peruana:</td>
                    <td>
                        <%if (trb.getEs_inst_educ_peru() == null) {
                                out.print("no registrado");
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
                                out.print("no registrado");
                            } else {
                                if (trb.getLi_reg_inst_educativa().trim().equals("1")) {
                                    out.print("Pública");
                                } else {
                                    out.print("Privada");
                                }
                            }%>
                    </td></tr>
                <tr><td class="text-info">Tipo.I.E:</td>
                    <td>
                    </td>
                </tr>
                <tr><td class="text-info">Centro de Estudios:</td><td></td></tr>
                <!--<tr><td class="text-info">Grado Acádemico:</td><td><%%></td></tr>-->
                <tr><td class="text-info">Carrera:</td><td><%if (trb.getNo_carrera() == null) {
                        out.print("NINGUNA");
                    } else {
                        out.print(trb.getNo_carrera());
                    }%></td></tr>
                <!--<tr><td class="text-info">Titulo Profesional:</td><td><%%></td></tr>-->
                <tr><td class="text-info">Código Universitario:</td><td><%if(trb.getCo_universitario()==null){out.print("no registrado");}else{out.print(trb.getCo_universitario());}%></td></tr>
                <tr><td class="text-info">Tipo de Hora Referencial:</td><td><%=trb.getCa_tipo_hora_pago_refeerencial()%></td></tr>
                <tr><td class="text-info">Año Egreso:</td><td><%if(trb.getDe_anno_egreso()==null){out.print("no registrado");}else{out.print(trb.getDe_anno_egreso());}%></td></tr>
                <tr><td class="text-info">Otros Estudios:</td><td><%if (trb.getCm_otros_estudios() == null) {
                        out.print("NINGUNA");
                    } else {
                        out.print(trb.getCm_otros_estudios());
                    }%></td></tr>
                <tr><td class="text-info" colspan="2" >CUENTA SUELDO</td></tr>
                
                <tr><td class="text-info">Banco:</td><td></td></tr>
                <tr><td class="text-info">Nro de Cuenta:</td><td></td></tr>
                <tr><td class="text-info">Nro de Cuenta Bancaria:</td><td></td></tr>
                <tr><td class="text-info">Genero Nro de Cuenta Bancaria:</td><td></td></tr>
                <tr>
                    <%String IDTR = trb.getId_trabajador();%>
                    <td colspan="2"><a class="btn btn-success" href="../../trabajador?opc=Editar_Asp_Acad&idtr=<%=IDTR%>">EDITAR</a></td>
                </tr>
                <%}%>
                <!-- <tr><td colspan="2"><input class=""  type="submit" value="Editar"></td></tr>-->
            </table>
        </form>

    </body>
</html>
<%}

    
        else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>