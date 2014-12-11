<%@page import="pe.edu.upeu.application.model.Centro_Costos"%>
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
<jsp:useBean id="List_centro_costo" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css">  
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/font-awesome.min.css">
       
        <title>Informaci�n Contractual</title>
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
        <form align="center" class="form" action="../../contrato" method="post" >
            <table class="table table-hover table-striped table-bordered table-responsive" style="border-radius: 30px ">
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
        <form >
            <table class="table table-hover table-striped table-bordered table-responsive">
                <% for (int p = 0; p < List_id_Contrato_DGP.size(); p++) {%>
                <tr><td class="text-info"><strong>Desde: <%=n.getId_contrato()%></strong></td><td colspan="2"><%=n.getFe_desde()%></td><td class="text-info" colspan="2"><strong>Hasta:</strong></td><td colspan="2"><%=n.getFe_hasta()%></td></tr>
                <tr><td class="text-info"><strong>Direcci�n:</strong></td><td colspan="6"><%=n.getNo_direccion()%> </td></tr>
                <tr><td class="text-info"><strong>Departamento:</strong></td><td colspan="6"><%=n.getNo_dep()%> </td></tr>
                <tr><td class="text-info"><strong>Area:</strong></td><td colspan="6"><%=n.getNo_area()%> </td></tr>
                <tr><td class="text-info"><strong>Secci�n:</strong></td><td colspan="6"><%=n.getNo_seccion()%> </td></tr>
                <tr><td class="text-info"><strong>Centro de Costos:</strong></td>
                    <%for(int ce=0;ce<List_centro_costo.size();ce++){
                        Centro_Costos cen=new Centro_Costos();
                        cen=(Centro_Costos)List_centro_costo.get(ce);
                    if(cen.getId_centro_costo().equals(n.getId_centro_costo())){%>
                        <td colspan="6"><%=cen.getDe_centro_costo()%><%}%> </td></tr>
                <tr><td class="text-info"><strong>Puesto:</strong></td><td colspan="6"><%=n.getNo_puesto()%></td> </tr>
                <tr><td class="text-info"><strong>Condici�n:</strong></td> <td colspan="6"><%

                    for (int h = 0; h < list_Condicion_contrato.size(); h++) {
                        if (n.getLi_condicion().trim().equals(h + 1 + "")) {
                            out.println(list_Condicion_contrato.get(h));
                        }
                    }
                        %> </td></tr>
                <!--<tr><td>Funcion:</td><td><? /*echo $list_rhc[$index][5];*/?> </td></tr>-    ->
                <tr><td class="text-info"><strong>Sueldo:</strong></td><td colspan="2"><%=n.getCa_sueldo()%></td><td class="text-info" colspan="2"><strong>Reintegro:</strong></td><td colspan="2"><%=n.getCa_reintegro()%></td></tr>
                <tr><td class="text-info"><strong>Tipo Pago Horas:</strong></td><td colspan="6"><%=n.getTi_hora_pago()%> </td></tr>
                <tr><td class="text-info"><strong>Bono Alimentario:</strong></td><td colspan="6"><%=n.getCa_bono_alimento()%> </td></tr>
                <tr><td class="text-info"><strong>Asignaci�n Familiar:</strong></td><td colspan="6"><%= "S/." + n.getCa_asig_familiar()%> </td></tr>
                <tr><td class="text-info"><strong>Horas:</strong></td><td class="text-info"><strong>Semanal:</strong></td><td><%=n.getHo_semana()%></td><td class="text-info"><strong>Mensual:</strong></td><td><%=n.getNu_horas_lab() + " h"%></td><td class="text-info"><strong>Dias:</strong></td><td> <%=n.getDia_contrato() + " d"%></td></tr>

                
                <tr><td class="text-info"><strong>Tipo de Trabajador:</strong></td><td colspan="6"><%
                    if (n.getTi_trabajador().equals("1")) {
                        out.println("Trabajador");
                    }
                    if (n.getTi_trabajador().equals("2")) {
                        out.println("Obrero");
                    }

                        %> </td></tr>   
                <tr><td class="text-info"><strong>R�gimen Laboral:</strong></td><td colspan="6"><%                    if (n.getLi_regimen_laboral().trim().equals("1")) {
                        out.println("Privado");
                    }%> </td></tr>   
                <tr><td class="text-info"><strong>Vacaciones:</strong></td><td class="text-info" colspan="2"><strong>Desde:</strong></td><td colspan="2"> <%=n.getFe_vacacio_ini()%> </td><td class="text-info" ><strong >Hasta:</strong></td><td colspan="2"> <%=n.getFe_vacacio_fin()%> </td></tr>   

                
                
                
                
                
                <tr><td class="text-info"><strong>Discapacidad:</strong></td><td colspan="6"><%

                    if (n.getEs_discapacidad().equals("1")) {
                        out.println("No");
                    }
                    if (n.getEs_discapacidad().equals("2")) {
                        out.println("Si");
                    }

                        %> 
                    </td></tr>   
                <tr><td class="text-info"><strong>Tipo de Contrato:</strong></td><td colspan="6"><%                    for (int k = 0; k < List_tipo_contrato.size(); k++) {
                        if (n.getTi_contrato().trim().equals(k + 1 + "")) {
                            out.println(List_tipo_contrato.get(k));
                        }
                    }%> 
                    </td></tr>   
                <tr><td class="text-info"><strong>Tipo de Convenio:</strong></td><td colspan="6"><%
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
                <tr><td class="text-info"><strong>�Firmo contrato?:</strong></td><td colspan="6"><%
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
                <tr><td class="text-info"><strong>Observaciones:</strong></td><td colspan="6"><%=n.getDe_observacion()%> </td></tr>   
                <tr><td class="text-info"><strong>R�gimen Pensionario:</strong></td><td colspan="6"><%
                    if (n.getLi_regimen_pensionario().trim().equals("1")) {
                        out.println("Privado");
                    }
                    if (n.getLi_regimen_pensionario().trim().equals("2")) {
                        out.println("SNP");
                    }
                        %> </td></tr>   
                <tr><td class="text-info"><strong>Situacion Actual:</strong></td><td colspan="6"><%
                    for (int t = 0; t < List_Situacion_Actual.size(); t++) {
                        if (n.getEs_contrato().trim().equals(t + 1 + "")) {
                        %><%=List_Situacion_Actual.get(0)%>
                        <%}
                            }
                        %> </td></tr>   
                <tr><td class="text-info"><strong>Filial donde Trabaja:</strong></td><td colspan="6"><%
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
                <tr><td class="text-info"><strong>Fecha de Cese:</strong></td><td colspan="6"><%=n.getFe_cese()%> </td></tr>   
                <!--   <tr><td>Nro. Documento:</td><td><? /*echo $list_rhc[$index][43];?> </td></tr>   
               <tr><td>Pares:</td><td><? echo $list_rhc[$index][36];?> </td></tr>   
                 <tr><td>Apoyo:</td><td><? echo $list_rhc[$index][41];*/?> </td></tr>   -->
                <%
                    if (List_Planilla.size() != 0) {
                        for (int a = 0; a < List_Planilla.size(); a++) {
                            X_List_Plantilla f = new X_List_Plantilla();
                            f = (X_List_Plantilla) List_Planilla.get(a);
                %>
                <tr><td class="text-info" colspan="2"></td><td ><input class="button blue"  type="submit" value="Editar"></td>
                    <td ><a class="button blue" href="<%=f.getDi_url()%>?idc=<%=f.getId_plantilla_contractual()%>" >Ver Plantilla</a></td></tr>
                    <%}
                        }
                        if (List_Planilla.size() == 0) {%>
                <tr><td class="text-info" colspan="2"></td><td><input class="button blue"  type="hidden" value="Editar"></td>
                    <td colspan="6"><a  class="button blue" href="../../contrato?opc=Ver_Plantilla&idc=<%=n.getId_contrato().trim()%>">Ver Plantilla</a></td></tr>
                    <%}%>

                <tr style="color: red;"> <%if (n.getUs_creacion() == null && n.getUs_creacion() != null) {%>
                    <td class="text-info"><strong>Modificado por:</strong></td>
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
