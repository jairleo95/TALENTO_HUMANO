<%@page import="pe.edu.upeu.application.dao_imp.InterfaceTipo_DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.dao.Tipo_DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.model.Tipo_Documento"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<jsp:useBean id="ListaridTrabajador" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <script src=" ../../../../js1/jquery-1.11.1.min.js" type="text/javascript"></script>
        <title>Datos generales</title>
    </head>

    <body>
        <form  align="center" ethod="post" action="" >
            <table class="table table-striped table-hover table-responsive  ">

                <%String edit = request.getParameter("edit");
                        for (int index = 0; index < ListaridTrabajador.size(); index++) {
                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);

                %>           
                <tr><td class="text-info">Nacionalidad:</td><td><%=trb.getNo_nacionalidad()%></td></tr>

                <tr><td  class="text-info">Dpto / Prov / Dtto</td><td><%=trb.getNo_departamento() + " / " + trb.getNo_provincia() + " / " + trb.getNo_distrito()%></td></tr>
                <tr><td  class="text-info">Tipo Documento:</td><td>
                        <%
                            InterfaceListaDAO list = new ListaDAO();
                            InterfaceTipo_DocumentoDAO itd = new Tipo_DocumentoDAO();
                            
                            for (int k = 0; k < itd.Listar_tipo_doc().size(); k++) {
                                Tipo_Documento td = new Tipo_Documento();
                                td = (Tipo_Documento) itd.Listar_tipo_doc().get(k);
                                if (trb.getTi_doc() != null) {
                                    if (td.getId_tipo_doc_ident().trim().equals(trb.getTi_doc().trim())) {
                                        out.print(td.getDe_tdoc_abreviada());
                                    }
                                } else {
                                    out.print("NO REGISTRADO");
                                }
                            }
                        %>

                    </td></tr>
                <tr><td  class="text-info">Numero Documento:</td><td><%
                    if (trb.getNu_doc() != null) {
                        out.print(trb.getNu_doc());
                    } else {
                        out.print("NO REGISTRADO");
                    }%></td></tr>
                <tr><td  class="text-info">Estado Civil:</td><td><%
                    for (int r = 0; r < list.List_Estado_Civil().size(); r++) {
                        if (trb.getEs_civil() != null) {
                            if (trb.getEs_civil().equals(r + 1 + "")) {
                                out.println(list.List_Estado_Civil().get(r));
                            }
                        } else {
                            out.print("NO DEFINIDO");
                        }
                    }
                        %></td></tr>

                <tr>
                    <td  class="text-info">Grupo Sanguíneo:</td>
                    <td>
                        <%   if (trb.getLi_grupo_sanguineo() != null) {
                                for (int n = 0; n < list.List_Gs().size(); n++) {
                                    if (trb.getLi_grupo_sanguineo().trim().equals(n + 1 + "")) {
                                        out.println(list.List_Gs().get(n));
                                    }
                                    
                                }
                            } else {
                                out.print("NO DEFINIDO");
                            }
                        %>
                    </td>
                </tr>
                <tr><td  class="text-info">Factor RH:</td><td><%
                    if (trb.getEs_factor_rh() != null) {
                        if (trb.getEs_factor_rh().equals("1")) {
                            out.println("Positivo");
                        }
                        if (trb.getEs_factor_rh().equals("2")) {
                            out.println("Negativo");
                        }
                    } else {
                        out.print("NO DEFINIDO");
                    }
                        %></td></tr>

                <tr><td  class="text-info">Telefono:</td>
                    <%if (trb.getTe_trabajador() == null) {%>
                    <td>NO REGISTRADO</td>
                    <% } else {%>
                    <td><%=trb.getTe_trabajador()%></td>
                    <%}%>
                </tr>
                <tr><td  class="text-info">Celular:</td><td><%
                    if (trb.getCl_tra() != null) {
                        out.print(trb.getCl_tra());
                    } else {
                        out.print("NO REGISTRADO");
                    }%></td></tr>
                <tr><td  class="text-info">Correo Personal:</td><td><%
                    if (trb.getDi_correo_personal() != null) {
                        out.print(trb.getDi_correo_personal());
                    } else {
                        out.print("NO REGISTRADO");
                    }%></td></tr>
                <tr>
                    <td  class="text-info">Correo Institucional:</td>
                    <%if (trb.getDi_correo_inst() == null) {%>
                    <td>NO REGISTRADO</td>
                    <%} else {%>
                    <td><%=trb.getDi_correo_inst()%></td>
                    <%}%>
                </tr>

                <tr><td   class="text-info">Sistema Pensionario:</td><td><%
                    if (trb.getCo_sistema_pensionario() != null) {
                        for (int d = 0; d < list.List_Sp().size(); d++) {
                            if (trb.getCo_sistema_pensionario().trim().equals(d + 1 + "")) {
                                out.println(list.List_Sp().get(d));
                            }
                        }
                    } else {
                        out.print("NO REGISTRADO");
                    }%></td></tr>
                <tr><td  class="text-info">Nombre AFP:</td><td><%
                    if (trb.getCo_sistema_pensionario() != null) {
                        for (int w = 0; w < list.List_Nom_AFP().size(); w++) {
                            if (trb.getId_no_afp().equals(w + 1 + "")) {
                                out.println(list.List_Nom_AFP().get(w));
                            }
                        }
                    } else {
                        out.print("NO REGISTRADO");
                    }
                    
                        %></td></tr>
                <tr><td  class="text-info">Afiliado a EsSalud-vida:</td>
                    <td><%if (trb.getEs_afiliado_essalud() != null) {
                            if (trb.getEs_afiliado_essalud().equals("1")) {
                                out.println("Si");
                            }
                            if (trb.getEs_afiliado_essalud().equals("0")) {
                                out.println("No");
                                
                            }
                        } else {
                            out.print("NO REGISTRADO");
                        }
                        %></td>
                </tr>
                <tr><td  class="text-info">Tipo Trabajador:</td><td><%
                    if (trb.getLi_tipo_trabajador().trim().equals("T")) {
                        out.println("Trabajador");
                    }
                    if (trb.getLi_tipo_trabajador().trim().equals("A")) {
                        out.println("Alumno");
                    }
                    if (trb.getLi_tipo_trabajador() == null) {
                        out.print("NO REGISTRADO");
                    }
                        %></td></tr>

                <!-- <tr><td colspan="2"><input class="btn btn-success" style="height: 140%; width: 30%;"  type="submit" value="Editar"></td></tr>-->
                <tr>
                    <%String IDTR = trb.getId_trabajador();%>
                    <td colspan="2"></td>
                    <%=edit%>
                        <a class="btn btn-success btn-labeled"  href="../../trabajador?opc=Editar_Dat_Gen&idtr=<%=IDTR%>&edit=<%=edit%>"> <span class="btn-label"><i class="glyphicon glyphicon-refresh"></i></span> Editar </a>
                    </td>
                </tr>
                <%}%>
            </table>
        </form>

    </body>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>
