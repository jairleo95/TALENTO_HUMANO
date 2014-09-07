<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<%@page import="pe.edu.upeu.application.dao.ContratoDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceContratoDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.X_List_Plantilla"%>
<%@page import="pe.edu.upeu.application.dao.PlantillaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfacePlantillaDAO"%>
<%@page import="pe.edu.upeu.application.web.controller.CConversion"%>
<%@page import="pe.edu.upeu.application.model.X_List_Id_Contrato_DGP"%>
<%@page import="pe.edu.upeu.application.model.X_List_Anno_Id_Tr_DGP"%>

<jsp:useBean id="List_id_Contrato_DGP" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Anno_Id_Tr_DGP" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Jefe" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Situacion_Actual" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Planilla" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_ID_User" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="list_Condicion_contrato" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_tipo_contrato" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" href="../Vistas/sort/style.css" />

        <title>Información Contractual</title>
        <style type="text/css">
            .tables{
                // margin-top: 0px;
                // margin-left: 40px;
                //  font-family: cursive;
                //  font-size:18px;
                border-radius: 3%;
                padding: 0.5%;
                background-color: white;
                width: 60%;
            }
            td {
                padding: 0.5%;
                padding-left: 2%;
            } 
            tr:hover{
                background-color:#c6dcde;     
            }



        </style>
    </head>
    <body>
    <center>

        <%  if (List_id_Contrato_DGP.size() == 0) {%>
        <h3>Aun no se ha hecho Contrato.</h3>
        <%} else {%>
        
        <%
            CConversion c = new CConversion();

            HttpSession Sesion = request.getSession(true);
            String idrol = (String) Sesion.getAttribute("IDROL");

        %>
        <%for (int b = 0; b < List_id_Contrato_DGP.size(); b++) {
                X_List_Id_Contrato_DGP n = new X_List_Id_Contrato_DGP();
                n = (X_List_Id_Contrato_DGP) List_id_Contrato_DGP.get(b);
        %>
        <form class="form"action="../../contrato" method="post">
            <table>
                <tr><td><select name="ida">
                            <%  for (int o = 0; o < List_Anno_Id_Tr_DGP.size(); o++) {%>
                            <%X_List_Anno_Id_Tr_DGP x = new X_List_Anno_Id_Tr_DGP();
                                x = (X_List_Anno_Id_Tr_DGP) List_Anno_Id_Tr_DGP.get(o);%>
                            <%  if (request.getParameter("ida1").trim().equals(x.getId_anno().trim())) {%>
                            <option value="<%=x.getId_anno()%>" selected="selected"><%=x.getNo_anno()%></option>
                            <%} else {%>
                            <option value="<%=x.getId_anno()%>"><%=x.getNo_anno()%></option>
                            <%}
                                }%>
                        </select> </td><td><input type="hidden" name="idtr" value="<%=n.getId_trabajador()%>"></td>
                    <td><input name="opc" value="actualizar" type="submit"></td></tr>
            </table>
        </form>
        <form>
            <table class="tables">
                <% for (int p = 0; p < List_id_Contrato_DGP.size(); p++) {%>
                <tr><td><strong>Desde:</strong></td><td><%=n.getFe_desde()%></td><td><strong>Hasta:</strong></td><td><%=n.getFe_hasta()%></td></tr>
                <tr><td><strong>Dirección:</strong></td><td><%=n.getNo_direccion()%> </td></tr>
                <tr><td><strong>Departamento:</strong></td><td><%=n.getNo_dep()%> </td></tr>
                <tr><td><strong>Area:</strong></td><td><%=n.getNo_area()%> </td></tr>
                <tr><td><strong>Sección:</strong></td><td><%=n.getNo_seccion()%> </td></tr>
                <tr><td><strong>Puesto:</strong></td><td><%=n.getNo_puesto()%></td> </tr>
                <tr><td><strong>¿Es Jefe?:</strong></td><%for (int e = 0; e < List_Jefe.size(); e++) {
                        if (n.getEs_jefe().equals(e + 1 + "")) {%>
                    <td><%=List_Jefe.get(e)%>
                        <%}
                            }%></td> </tr>
                <tr><td><strong>Condición:</strong></td> <td><%

                    for (int h = 0; h < list_Condicion_contrato.size(); h++) {
                        if (n.getLi_condicion().trim().equals(h + 1 + "")) {
                            out.println(list_Condicion_contrato.get(h));
                        }
                    }
                        %> </td></tr>
                <!--<tr><td>Funcion:</td><td><? /*echo $list_rhc[$index][5];*/?> </td></tr>-->
                <tr><td><strong>Sueldo:</strong></td><td><%=n.getCa_sueldo()%></td><td><strong>Reintegro:</strong></td><td><%=n.getCa_reintegro()%></td></tr>
                <tr><td><strong>Tipo Pago Horas:</strong></td><td><%=n.getTi_hora_pago()%> </td></tr>
                <tr><td><strong>Bono Alimentario:</strong></td><td><%=n.getCa_bono_alimento()%> </td></tr>
                <tr><td><strong>Asignación Familiar:</strong></td><td><%= "S/." + n.getCa_asig_familiar()%> </td></tr>
                <tr><td><strong>Horas:</strong></td><td><strong>Semanal:</strong> <%=n.getHo_semana()%></td><td><strong>Mensual:</strong> <%=n.getNu_horas_lab() + " h"%></td><td><strong>Dias:</strong> <%=n.getDia_contrato() + " d"%></td></tr>

                <tr><td><strong>Tipo de Trabajador:</strong></td><td><%
                    if (n.getTi_trabajador().equals("1")) {
                        out.println("Trabajador");
                    }
                    if (n.getTi_trabajador().equals("2")) {
                        out.println("Obrero");
                    }

                        %> </td></tr>   
                <tr><td><strong>Régimen Laboral:</strong></td><td><%                    if (n.getLi_regimen_laboral().trim().equals("1")) {
                        out.println("Privado");
                    }%> </td></tr>   
                <tr><td><strong>Vacaciones:</strong></td><td><strong>Desde:</strong> <%=n.getFe_vacacio_ini()%> </td><td><strong>Hasta:</strong> <%=n.getFe_vacacio_fin()%> </td></tr>   

                
                
                
                
                
                <tr><td><strong>Discapacidad:</strong></td><td><%

                    if (n.getEs_discapacidad().equals("1")) {
                        out.println("No");
                    }
                    if (n.getEs_discapacidad().equals("2")) {
                        out.println("Si");
                    }

                        %> 
                    </td></tr>   
                <tr><td><strong>Tipo de Contrato:</strong></td><td><%                    for (int k = 0; k < List_tipo_contrato.size(); k++) {
                        if (n.getTi_contrato().trim().equals(k + 1 + "")) {
                            out.println(List_tipo_contrato.get(k));
                        }
                    }%> 
                    </td></tr>   
                <tr><td><strong>Tipo de Convenio:</strong></td><td><%
                    if (n.getLi_tipo_convenio().trim().equals("1")) {
                        out.println("CLJ");
                    }
                    if (n.getLi_tipo_convenio().trim().equals("2")) {
                        out.println("PPP");
                    }
                    if (n.getLi_tipo_convenio().trim().equals("3")) {
                        out.println("PP");
                    }
                        %> </td></tr>   
                <tr><td><strong>¿Firmo contrato?:</strong></td><td><%
                    if (idrol.trim().equals("ROL-0006") && n.getEs_firmo_contrato() == null) {%>
                        <a href="../../contrato?fc=s&idc=<%=n.getId_trabajador()%>"  class="boton">SI</a>o<a href="../Control/ControlContrato.php?fc=n&idc=<?echo $list_rhc[$index][0];?>" class="boton">NO</a>
                        <%} else {

                                if (n.getEs_firmo_contrato() != null) {
                                    if (n.getEs_firmo_contrato().equals("1")) {
                                        out.println("Si");
                                    }
                                    if (n.getEs_firmo_contrato().equals("2")) {
                                        out.println("No");
                                    }
                                } else {
                                    out.println("aun no se firma");
                                }

                            }%></td></tr>

                <!--  <tr><td>Nro. de Contrato:</td><td><?/* echo $list_rhc[$index][39];*/?> </td></tr>   -->
                <tr><td><strong>Observaciones:</strong></td><td><%=n.getDe_observacion()%> </td></tr>   
                <tr><td><strong>Régimen Pensionario:</strong></td><td><%
                    if (n.getLi_regimen_pensionario().trim().equals("1")) {
                        out.println("Privado");
                    }
                    if (n.getLi_regimen_pensionario().trim().equals("2")) {
                        out.println("SNP");
                    }
                        %> </td></tr>   
                <tr><td><strong>Situacion Actual:</strong></td><td><%
                    for (int t = 0; t < List_Situacion_Actual.size(); t++) {
                        if (n.getEs_contrato().trim().equals(t + 1 + "")) {
                        %><%=List_Situacion_Actual.get(0)%>
                        <%}
                            }
                        %> </td></tr>   
                <tr><td><strong>Filial donde Trabaja:</strong></td><td><%
                    if (n.getId_filial().trim().equals(1 + "")) {
                        out.println("Lima");%>
                        <% }
                            if (n.getId_filial().trim().equals(2 + "")) {
                                out.println("Juliaca");%>
                        <%}
                            if (n.getId_filial().trim().equals(3 + "")) {
                                out.println("Tarapoto");%>
                        <%}
                        %> </td></tr>   
                <tr><td><strong>Fecha de Cese:</strong></td><td><%=n.getFe_cese()%> </td></tr>   
                <!--   <tr><td>Nro. Documento:</td><td><? /*echo $list_rhc[$index][43];?> </td></tr>   
               <tr><td>Pares:</td><td><? echo $list_rhc[$index][36];?> </td></tr>   
                 <tr><td>Apoyo:</td><td><? echo $list_rhc[$index][41];*/?> </td></tr>   -->
                <%
                    if (List_Planilla.size() != 0) {
                        for (int a = 0; a < List_Planilla.size(); a++) {
                            X_List_Plantilla f = new X_List_Plantilla();
                            f = (X_List_Plantilla) List_Planilla.get(a);
                %>
                <tr><td colspan="2"></td><td><input class="button blue"  type="submit" value="Editar"></td>
                    <td ><a class="button blue" href="<%=f.getDi_url()%>?idc=<%=f.getId_plantilla_contractual()%>" >Ver Plantilla</a></td></tr>
                    <%}
                        }
                        if (List_Planilla.size() == 0) {%>
                <tr><td colspan="2"></td><td><input class="button blue"  type="submit" value="Editar"></td>
                    <td><a  class="button blue" href="../../contrato?opc=Ver_Plantilla&idc=<%=n.getId_contrato().trim()%>">Ver Plantilla</a></td></tr>
                    <%}%>

                <tr style="color: red;"> <%if (n.getUs_creacion() == null && n.getUs_creacion() != null) {%>
                    <td><strong>Modificado por:</strong></td>
                    <td><%for (int f = 0; f < List_ID_User.size(); f++) {
                            Usuario u = new Usuario();
                            u = (Usuario) List_ID_User.get(f);
                         /*   out.println(u.getNo_usuario());*/%>
                        <%}%>
                    </td>
                    <%}%>
                    <% if (n.getFe_modif() == null && n.getFe_creacion() != null) {%>
                    <td><strong>Creado por:</strong></td><td>
                        <%
                            for (int f = 0; f < List_ID_User.size(); f++) {
                                Usuario u = new Usuario();
                                u = (Usuario) List_ID_User.get(f);%>
                        <%/*=u.getNo_usuario()*/%>
                        <%}%></td>
                        <%}%>
                </tr>

                <%}%>
            </table>
        </form>
        <%}
            }%>
    </center>
</body>
</html>
