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
        <script src=" ../../../../js1/jquery-1.11.1.min.js" type="text/javascript"></script>
        <title>Datos generales</title>
    </head>

    <body>
        <form  align="center" ethod="post" action="" >
            <table class="table table-striped table-hover table-responsive  ">

                <%for (int index = 0; index < ListaridTrabajador.size(); index++) {
                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);

                %>           
                <tr><td class="text-info">Nacionalidad:</td><td><%=trb.getNo_nacionalidad()%></td></tr>

                <tr><td  class="text-info">Distrito:</td><td><%=trb.getNo_distrito()%></td></tr>
                <tr><td  class="text-info">Tipo Documento:</td><td>
                        <%
                            InterfaceListaDAO list = new ListaDAO();
                            for (int t = 0; t < list.List_Doc().size(); t++) {
                                if ((t + 1 + "").equals(trb.getTi_doc())) {
                                    out.println(list.List_Doc().get(t));
                                }
                            }
                        %>
                    </td></tr>
                <tr><td  class="text-info">Numero Documento:</td><td><%=trb.getNu_doc()%></td></tr>
                <tr><td  class="text-info">Estado Civil:</td><td><%
                    for (int r = 0; r < list.List_Estado_Civil().size(); r++) {
                        if (trb.getEs_civil().equals(r + 1 + "")) {
                            out.println(list.List_Estado_Civil().get(r));
                        }
                    }

                        %></td></tr>

                <tr><td  class="text-info">Grupo Sanguíneo:</td><td><%                    for (int n = 0; n < list.List_Gs().size(); n++) {
                        if (trb.getLi_grupo_sanguineo().trim().equals(n + 1 + "")) {
                            out.println(list.List_Gs().get(n));
                        }
                    }
                        %></td></tr>
                <tr><td  class="text-info">Factor RH:</td><td><%
                    if (trb.getEs_factor_rh().equals("1")) {
                        out.println("Positivo");
                    }
                    if (trb.getEs_factor_rh().equals("2")) {
                        out.println("Negativo");
                    }
                        %></td></tr>

                <tr><td  class="text-info">Telefono:</td><td><%=trb.getTe_trabajador()%></td></tr>
                <tr><td  class="text-info">Celular:</td><td><%=trb.getCl_tra()%></td></tr>
                <tr><td  class="text-info">Correo:</td><td><%=trb.getDi_correo_personal()%></td></tr>



                <tr><td   class="text-info">Sistema Pensionario:</td><td><%
                    for (int d = 0; d < list.List_Sp().size(); d++) {
                        if (trb.getCo_sistema_pensionario().trim().equals(d + 1 + "")) {
                            out.println(list.List_Sp().get(d));
                        }
                    }                %></td></tr>
                <tr><td  class="text-info">Nombre AFP:</td><td><%
                    for (int w = 0; w < list.List_Nom_AFP().size(); w++) {
                        if (trb.getId_no_afp().equals(w + 1 + "")) {
                            out.println(list.List_Nom_AFP().get(w));
                        }
                    }


                        %></td></tr>
                <tr><td  class="text-info">Afiliado a EsSalud-vida:</td><td><%             
                    if (trb.getEs_afiliado_essalud().equals("1")) {
                        out.println("Si");
                    }
                    if (trb.getEs_afiliado_essalud().equals("2")) {
                        out.println("Si");
                    }
                        %></td></tr>
                <tr><td  class="text-info">Tipo Trabajador:</td><td><%
                    if (trb.getLi_tipo_trabajador().trim().equals("T")) {
                        out.println("Trabajador");
                    }
                    if (trb.getLi_tipo_trabajador().trim().equals("A")) {
                        out.println("Alumno");
                    }
                        %></td></tr>

               <!-- <tr><td colspan="2"><input class="btn btn-success" style="height: 140%; width: 30%;"  type="submit" value="Editar"></td></tr>-->
                            <tr>
                                <%String IDTR = trb.getId_trabajador(); %>
                                <td colspan="2"><a class="btn btn-success" href="../../trabajador?opc=Editar_Dat_Gen&idtr=<%=IDTR %>">EDITAR</a>
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