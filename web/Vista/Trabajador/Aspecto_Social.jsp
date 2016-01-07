<%@page import="pe.edu.upeu.application.model.Zona"%>
<%@page import="pe.edu.upeu.application.model.Via"%>
<%@page import="pe.edu.upeu.application.model.V_Ubigeo"%>
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
<jsp:useBean id="List_Ubigeo" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Dom_D1_Id" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Dom_D5_Id" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Dom_D3_Id" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="windows-1252">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css">  
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">

        <title>Aspecto Social</title>

    </head>
    <body>

        <form align="center" action="../../trabajador"  >
            <table class="table table-hover table-striped table-bordered table-responsive" style="border-radius: 30px ">
                <%for (int index = 0; index < ListaridTrabajador.size(); index++) {
                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);
                %>   

                <tr>
                    <td >
                        <div class="title">Direccion Domicilio Actual</div>
                    </td>

                    <%String IDTR = trb.getId_trabajador();%>
                    <td>
                        <a class="btn btn-success btn-labeled" href="../../trabajador?opc=Editar_Asp_Soc&idtr=<%=IDTR%>"> <span class="btn-label"><i class="glyphicon glyphicon-refresh"></i></span> Editar </a>
                    </td>

                </tr> 
                <tr><td class="text-info">Dirección :</td><td>
                        <%
                            if (trb.getLi_di_dom_a_d1() != null) {
                                for (int i = 0; i < List_Dom_D1_Id.size(); i++) {
                                    Via v = new Via();
                                    v = (Via)List_Dom_D1_Id.get(i);
                                    if (v.getId_via().trim().equals(trb.getLi_di_dom_a_d1().trim())) {
                                        out.println(v.getDe_via());
                                    }
                                    
                                }
                            }
                            //out.print(List_Dom_D1_Id.size());
                            if (trb.getDi_dom_a_d2() != null) {
                                out.print(" " + trb.getDi_dom_a_d2());
                            } else {
                                out.print(" -- ");
                            }
                             //out.print(List_Dom_D3_Id.size());
                            if (trb.getLi_di_dom_a_d3() != null) {
                                for (int j = 0; j < List_Dom_D3_Id.size(); j++) {
                                    String num = Integer.toString(j + 1);
                                    if (trb.getLi_di_dom_a_d3().trim().equals(num.trim())) {
                                        out.print(List_Dom_D3_Id.get(j));
                                    }
                                }
                            }
                            
                            if (trb.getDi_dom_a_d4() != null) {
                                out.print(" " + trb.getDi_dom_a_d4());
                            } else {
                                out.print(" -- ");
                            }
                            
                            if (trb.getLi_di_dom_a_d5() != null) {
                                for (int p = 0; p < List_Dom_D5_Id.size(); p++) {
                                    Zona z = new Zona();
                                    z = (Zona)List_Dom_D5_Id.get(p);
                                    if (trb.getLi_di_dom_a_d5().trim().equals(z.getId_zona().trim())) {
                                        out.println(z.getDe_zona());
                                    }
                                }
                            }
                            
                            if (trb.getDi_dom_a_d6() != null) {
                                out.print(" " + trb.getDi_dom_a_d6());
                            } else {
                                out.print(" -- ");
                            }
                            
                        %></td></tr>

                <tr><td class="text-info">Referencia:</td><td><%if (trb.getDi_dom_a_ref() != null) {
                        out.print(trb.getDi_dom_a_ref());
                    } else {
                        out.print("NO REGISTRADO");
                    }%></td></tr>
                <tr><td class="text-info">Dpto / Prov / Dtto:</td>
                    <%
                        for (int h = 0; h < List_Ubigeo.size(); h++) {
                            V_Ubigeo vu = new V_Ubigeo();
                            vu = (V_Ubigeo) List_Ubigeo.get(h);
                            
        if (trb.getId_di_dom_a_distrito().trim().equals(vu.getId_distrito().trim())) {%>
                    <td><%=vu.getNo_departamento() + " / " + vu.getNo_provincia() + " / " + vu.getNo_distrito()%></td> 
                    <%}
                        }%>
                </tr>
                <tr><td colspan="2"><div class="title">Direccion Segun Dni</div></td></tr>
                <tr><td class="text-info">Dirección :</td><td>
                        <%
                            if (trb.getLi_di_dom_leg_d1() != null) {
                                for (int i = 0; i < List_Dom_D1_Id.size(); i++) {
                                    Via v = new Via();
                                    v = (Via)List_Dom_D1_Id.get(i);
                                    if (v.getId_via().trim().equals(trb.getLi_di_dom_leg_d1().trim())) {
                                        out.println(v.getDe_via());
                                    }
                                    
                                }
                            }
                            if (trb.getDi_dom_leg_d2() != null) {
                                out.print(" " + trb.getDi_dom_leg_d2());
                            } else {
                                out.print(" -- ");
                            }
                            
                            if (trb.getLi_di_dom_leg_d3() != null) {
                                for (int j = 0; j < List_Dom_D3_Id.size(); j++) {
                                    String num = Integer.toString(j + 1);
                                    if (trb.getLi_di_dom_leg_d3().trim().equals(num.trim())) {
                                        out.print(List_Dom_D3_Id.get(j));
                                    }
                                }
                            }
                            
                            if (trb.getDi_dom_leg_d4() != null) {
                                out.print(" " + trb.getDi_dom_leg_d4());
                            } else {
                                out.print(" -- ");
                            }
                            
                            if (trb.getLi_di_dom_leg_d5() != null) {
                                for (int c = 0; c < List_Dom_D5_Id.size(); c++) {
                                    Zona z = new Zona();
                                    z = (Zona)List_Dom_D5_Id.get(c);
                                    if (trb.getLi_di_dom_leg_d5().trim().equals(z.getId_zona().trim())) {
                                        out.println(z.getDe_zona());
                                    }
                                }
                            } else {
                                out.print("--");
                            }
                            
                            if (trb.getDi_dom_leg_d6() != null) {
                                out.print(" " + trb.getDi_dom_leg_d6());
                            } else {
                                out.print(" -- ");
                            }
                            

                        %></td></tr>
                <tr><td class="text-info">Dpto / Prov / Dtto</td>
                    <% if(trb.getId_di_dom_leg_distrito()!=null){
                            for (int h = 0; h < List_Ubigeo.size(); h++) {
                            V_Ubigeo vu = new V_Ubigeo();
                            vu = (V_Ubigeo) List_Ubigeo.get(h);
                            if (trb.getId_di_dom_leg_distrito().trim().equals(vu.getId_distrito().trim())) {%>
                    <td><%=vu.getNo_departamento() + " / " + vu.getNo_provincia() + " / " + vu.getNo_distrito()%></td> 
                    <%}
                        }}
                    %>

                </tr>

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
                        out.print("NO REGISTRADO");
                    } else {
                        out.print(trb.getCa_ing_qta_cat_otras_empresas());
                    }%></td></tr>

                <tr>
                    <td >
                        <div class="title">Información Religiosa</div>
                    </td>
                    <td >
                        <input type="hidden" name="idtr" value="<%=IDTR%>">  
                        <input type="hidden" type="submit" name="opc" value="Editar_Asp_Rel">  
                        <input  type="hidden"  value="EDITAR">  
                        <button class="btn btn-success btn-labeled" href="../../trabajador?opc=Editar_Asp_Soc&idtr=<%=IDTR%>"> <span class="btn-label"><i class="glyphicon glyphicon-refresh"></i></span> Editar </button>
                    </td>
                </tr>
                <tr><td class="text-info">Religión:</td><td><%
                    if (trb.getLi_autoridad() != null) {
                        if (trb.getLi_religion().equals("1")) {
                            out.println("Adventista");
                        }
                        if (trb.getLi_religion().equals("2")) {
                            out.println("Catolico");
                        }
                        if (trb.getLi_religion().equals("3")) {
                            out.println("Otros");
                        }
                    } else {
                        out.print("NO REGISTRADO");
                    }%></td></tr>
                <tr><td class="text-info">Iglesia:</td><td><%if (trb.getNo_iglesia() != null) {
                        out.print(trb.getNo_iglesia());
                    } else {
                        out.print("NO REGISTRADO");
                    }%></td></tr>
                <tr><td class="text-info">Cargo en la Iglesia:</td><td><%if (trb.getDe_cargo() == null) {
                        out.print("NO REGISTRADO");
                    } else {
                        out.print(trb.getDe_cargo());
                    }%></td></tr>
                <tr><td class="text-info">Autoridad:</td><td><%
                    if (trb.getLi_autoridad() != null) {
                        if (trb.getLi_autoridad().trim().equals("1")) {
                            out.println("Pastor");
                        }
                        if (trb.getLi_autoridad().trim().equals("2")) {
                            out.println("Pastor");
                        }
                        if (trb.getLi_autoridad().trim().equals("3")) {
                            out.println("Sacerdote");
                        }
                    } else {
                        out.print("NO REGISTRADO");
                    }
                    
                        %></td></tr>
                <tr><td class="text-info">Nombres y Apellidos:</td><td><%if (trb.getNo_ap_autoridad() == null) {
                        out.print("NO REGISTRADO");
                    } else {
                        out.print(trb.getNo_ap_autoridad());
                    }%></td></tr>
                <tr><td class="text-info">Telefono/Celular:</td><td><%if (trb.getCl_autoridad() == null) {
                        out.print("NO REGISTRADO");
                    } else {
                        out.print(trb.getCl_autoridad());
                    }%></td></tr>
                <!-- <td colspan="2"><input class="btn btn-success"  type="submit" value="Editar"></td>-->
                <%}
                %>
                <tr></tr>
            </table>
        </form>

    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
