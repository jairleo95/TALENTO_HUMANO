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
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css">  
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/font-awesome.min.css">
        <script src=" ../../../../js1/jquery-1.11.1.min.js" type="text/javascript"></script>

        <title>Aspecto Social</title>

    </head>
    <body>

        <form align="center">
            <table class="table table-hover table-striped table-bordered table-responsive" style="border-radius: 30px ">
                <%for (int index = 0; index < ListaridTrabajador.size(); index++) {
                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);


                %>   

                <tr><td colspan="2"><div class="title">Direccion Domicilio Actual</div></td></tr> 
                <tr><td class="text-info">Dirección :</td><td><% InterfaceListaDAO l = new ListaDAO();
                    for (int b = 0; b < l.List_Dom_D1_Id().size(); b++) {
                        if (trb.getLi_di_dom_a_d1().trim().equals(b + 1 + "")) {
                            out.println(l.List_Dom_D1_Id().get(b));
                        }

                    }

                    if (trb.getLi_di_dom_a_d3().trim().equals("1")) {
                        out.println(" " + trb.getDi_dom_a_d2() + " Numero");
                    }
                    if (trb.getLi_di_dom_a_d3().trim().equals("2")) {
                        out.println(" " + trb.getDi_dom_a_d2() + " Lote");
                    }
                    if (trb.getLi_di_dom_a_d3().trim().equals("3")) {
                        out.println(" " + trb.getDi_dom_a_d2() + " S/N");
                    }

                    for (int c = 0; c < l.List_Dom_D5_Id().size(); c++) {
                        if (trb.getLi_di_dom_a_d5().trim().equals(c + 1 + "")) {
                            out.println(" " + trb.getDi_dom_a_d4() + " " + l.List_Dom_D5_Id().get(c));
                        }

                    }
                    out.println(" " + trb.getDi_dom_a_d6());

                        %></td></tr>

                <tr><td class="text-info">Referencia:</td><td><%if (trb.getDe_referencia() == null) {
                        out.print("NINGUNA");
                    } else {
                        out.print(trb.getDe_referencia());
                    }%></td></tr>
                <tr><td class="text-info">Distrito:</td><td><%=trb.getDi_dom_a_distrito()%></td></tr>


                <tr><td colspan="2"><div class="title">Direccion Segun Dni</div></td></tr>

                <tr><td class="text-info">Dirección :</td><td><%
                    for (int b = 0; b < l.List_Dom_D1_Id().size(); b++) {
                        if (trb.getLi_di_dom_leg_d1().trim().equals(b + 1 + "")) {
                            out.println(l.List_Dom_D1_Id().get(b));
                        }

                    }

                    if (trb.getLi_di_dom_leg_d3().trim().equals("1")) {
                        out.println(" " + trb.getDi_dom_leg_d2() + " Numero");
                    }
                    if (trb.getLi_di_dom_leg_d3().trim().equals("2")) {
                        out.println(" " + trb.getDi_dom_leg_d2() + " Lote");
                    }
                    if (trb.getLi_di_dom_leg_d3().trim().equals("3")) {
                        out.println(" " + trb.getDi_dom_leg_d2() + " S/N");
                    }

                    for (int c = 0; c < l.List_Dom_D5_Id().size(); c++) {
                        if (trb.getLi_di_dom_leg_d5().trim().equals(c + 1 + "")) {
                            out.println(" " + trb.getDi_dom_leg_d4() + " " + l.List_Dom_D5_Id().get(c));
                        }

                    }
                    
                    out.println(" " + trb.getDi_dom_leg_d6());

                        %></td></tr>
                <tr><td class="text-info">Distrito:</td><td><%=trb.getDi_dom_leg_distrito()%></td></tr>

                <tr><td colspan="2"><div class="title">Ingresos de Quinta Categoria</div></td></tr> 
                <tr><td class="text-info">Empresa:</td><td><%if (trb.getCa_ing_qta_cat_empresa() == null) {
                        out.print("NO TIENE");
                    } else {
                        out.print(trb.getCa_ing_qta_cat_empresa());
                    }%></td></tr>
                <tr><td class="text-info">RUC:</td><td><%if (trb.getCa_ing_qta_cat_ruc() == null) {
                        out.print("NO TIENE");
                    } else {
                        out.print(trb.getCa_ing_qta_cat_ruc());
                    }%></td></tr>
                <tr><td class="text-info">Otras Empresas:</td><td><%if (trb.getCa_ing_qta_cat_otras_empresas() == null) {
                        out.print("NINGUNA");
                    } else {
                        out.print(trb.getCa_ing_qta_cat_otras_empresas());
                    }%></td></tr>

                <tr><td colspan="2"><div class="title">Información Religiosa</div></td></tr>
                <tr><td class="text-info">Religión:</td><td><%

                    if (trb.getLi_religion().equals("1")) {
                        out.println("Adventista");
                    }
                    if (trb.getLi_religion().equals("2")) {
                        out.println("Catolico");
                    }
                    if (trb.getLi_religion().equals("3")) {
                        out.println("Otros");
                    }%></td></tr>
                <tr><td class="text-info">Iglesia:</td><td><%if(trb.getNo_iglesia()==null){out.print("SIN REGISTRAR");}else{out.print(trb.getNo_iglesia());}%></td></tr>
                <tr><td class="text-info">Cargo en la Iglesia:</td><td><%if(trb.getDe_cargo()==null){out.print("SIN REGISTRAR");}else{out.print(trb.getDe_cargo());}%></td></tr>
                <tr><td class="text-info">Autoridad:</td><td><%
                    if (trb.getLi_autoridad() != null) {
                        if (trb.getLi_autoridad().equals("1")) {
                            out.println("Pastor");
                        }
                        if (trb.getLi_autoridad().equals("2")) {
                            out.println("Pastor");
                        }
                        if (trb.getLi_autoridad().equals("3")) {
                            out.println("Sacerdote");
                        }
                    }else{
                    out.print("SIN REGISTRAR");}

                        %></td></tr>
                <tr><td class="text-info">Nombres y Apellidos:</td><td><%if(trb.getNo_ap_autoridad()==null){out.print("SIN REGISTRAR");}else{out.print(trb.getNo_ap_autoridad());}%></td></tr>
                <tr><td class="text-info">Telefono/Celular:</td><td><%if(trb.getCl_autoridad()==null){out.print("SIN REGISTRAR");}else{out.print(trb.getCl_autoridad());}%></td></tr>
               <!-- <td colspan="2"><input class="btn btn-success"  type="submit" value="Editar"></td>-->
                    <%}%>
                <tr></tr>
            </table>
        </form>

    </body>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>