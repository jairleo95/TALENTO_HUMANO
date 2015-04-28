 <%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.Grupo_Ocupaciones"%>
<%@page import="pe.edu.upeu.application.model.Sub_Modalidad"%>
<%@page import="pe.edu.upeu.application.model.Modalidad"%>
<%@page import="pe.edu.upeu.application.model.Regimen_Laboral"%>
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
<jsp:useBean id="list_reg_labo" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_modalidad" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Sub_mo" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_grup_ocu" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Usuario" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Lis_c_c_id_contr" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css">  
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <style type="text/css">
            body{

                margin-left: auto;
                margin-right: auto  ;
                width: 95%;
                // margin: 0;
            }
            .titulo{


                background-color: #474747;
                padding: 0.5%;

                font-family: arial;
                font-size: 130%;
                text-align: center;
                color: white;

            }
            .autoHeight{
                border-style:none;            
            }

            .td{
                font-weight: bold;
                text-align: center;
            }
            .td1{
                text-align: center;
            }
            .td2{
                width: 8%;
            }
            .info-det{

                width: 25%;
            }

            .table-det{
                width: 100%;
            }
            .submit{
                //position: relative;

                background-color: #0575f4;
                color: white;
                width: 100%;

            }
            .submit:hover{
                background-color: #643771;
            }

            table, th, td {

                padding: 4px;
            }
            img{
                position: absolute;

            }


        </style>
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
        <%}/* else {*/%>

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
            <table class="table table-hover table-striped  table-responsive" style="border-radius: 30px ">
                <tr><td><select name="ida">
                            <%  for (int o = 0; o < List_Anno_Id_Tr_DGP.size(); o++) {%>
                            <%X_List_Anno_Id_Tr_DGP x = new X_List_Anno_Id_Tr_DGP();
                                x = (X_List_Anno_Id_Tr_DGP) List_Anno_Id_Tr_DGP.get(o);%>
                            <%  if (request.getParameter("ida1").trim().equals(x.getId_anno().trim())) {%>
                            <option value="<%=x.getId_anno()%>" selected="selected"><%=x.getNo_anno()%></option>
                            <%} else {%>
                            <option value="<%=x.getId_anno()%>"><%=x.getNo_anno()%></option>
                            <%}
                                }
                                List_Anno_Id_Tr_DGP.clear();%>
                        </select> </td><td><input type="hidden" name="idtr" value="<%=n.getId_trabajador()%>"></td>
                    <td><input name="opc" value="actualizar" type="submit"></td></tr>
            </table>
        </form>
        <form>

            <% for (int p = 0; p < List_id_Contrato_DGP.size(); p++) {%>
            <table class="table table-hover table-striped  table-responsive">
                <tr><td class="text-info table-bordered"><strong>Desde: </strong></td><td colspan="2"><%=n.getFe_desde()%></td><td class="text-info table-bordered" colspan="2"><strong>Hasta:</strong></td><td colspan="2"><%=n.getFe_hasta()%></td></tr>
                <tr><td class="text-info table-bordered"><strong>Dirección:</strong></td><td colspan="6"><p><%=n.getNo_direccion()%> </p></td></tr>
                <tr><td class="text-info table-bordered"><strong>Departamento:</strong></td><td colspan="6"><p><%=n.getNo_dep()%> </p></td></tr>
                <tr><td class="text-info table-bordered"><strong>Area:</strong></td><td colspan="6"><p><%=n.getNo_area()%> </td></p></tr>
                <tr><td class="text-info table-bordered"><strong>Sección:</strong></td><td colspan="6"><p><%=n.getNo_seccion()%> </p></td></tr>
                <%
                    if (Lis_c_c_id_contr.size() > 0) {
                        Double cantidad = 0.0;
                        for (int q = 0; q < Lis_c_c_id_contr.size(); q++) {
                            Centro_Costos cc = new Centro_Costos();
                            cc = (Centro_Costos) Lis_c_c_id_contr.get(q);

                            cantidad = Double.parseDouble(cc.getCa_porcentaje()) + cantidad;
                %>
                <tr><td class="text-info table-bordered"><strong>Centro conto Nº <%=q + 1%>:</strong></td><td colspan="2"><p><%=cc.getDe_centro_costo()%></p></td><td class="text-info table-bordered" colspan="2"><strong>Porcentaje</strong></td><td colspan="2"><p><%=cc.getCa_porcentaje()%> %</p> </td></tr><%}%>
                <tr><td class="text-info table-bordered"><strong>Total Porcentaje:</strong></td><td colspan="6"><p><%=cantidad%> %</p></td></tr><%} else {%>
                <tr><td class="text-info table-bordered"><strong>Centro conto </strong></td><td colspan="6"><p>No tiene</p></td></tr><%}
                    Lis_c_c_id_contr.clear();%>
                <tr><td class="text-info table-bordered"><strong>Puesto:</strong></td><td colspan="6"><p><%=n.getNo_puesto()%></p></td> </tr>
                <tr><td class="text-info table-bordered"><strong>Condición:</strong></td> <td colspan="6"><p><%
                    if (!n.getLi_condicion().equals(null)) {
                        for (int h = 0; h < list_Condicion_contrato.size(); h++) {

                            if (n.getLi_condicion().trim().equals(h + 1 + "")) {
                                out.println(list_Condicion_contrato.get(h));
                            }
                        }
                    } else {
                        out.print("No tiene");
                    }%> </p></td></tr>
                <!--<tr><td>Funcion:</td><td><? /*echo $list_rhc[$index][5];*/?> </td></tr>-->
                <tr><td class="text-info table-bordered"><strong>Sueldo:</strong></td><td><%=n.getCa_sueldo()%></td><td class="text-info table-bordered" colspan="1"><strong>Reintegro:</strong></td><td colspan="1"><%=n.getCa_reintegro()%></td><td class="text-info table-bordered" colspan="2"><strong>Bono Alimentario:</strong></td><td><%=n.getCa_bono_alimento()%> </td></tr>
                <tr><td class="text-info table-bordered"><strong>Asignación Familiar:</strong></td><td colspan="6"><%= "S/." + n.getCa_asig_familiar()%> </td></tr>
                <tr><td class="text-info table-bordered"><strong>Bev:</strong></td><td colspan="6"><%if (n.getCa_bev() != null) {
                        out.print(n.getCa_bev());
                    } else {
                        out.print("0");
                    }%> </td></tr>
                <tr><td class="text-info table-bordered"><strong>Sueldo Total:</strong></td><td colspan="6"><%if (n.getCa_sueldo_total() != null) {
                        out.print(n.getCa_sueldo_total());
                    } else {
                        out.print("0");
                    }%> </td></tr>
                <tr><td class="text-info table-bordered"><strong>Tipo Pago Horas:</strong></td><td colspan="6"><%=n.getTi_hora_pago()%> </td></tr>
                
                <tr><td class="text-info table-bordered"><strong>Regimen Laboral Mintra:</strong></td>
                    <% if (n.getId_regimen_laboral() != null) {
                            for (int q = 0; q < list_reg_labo.size(); q++) {
                                Regimen_Laboral re = new Regimen_Laboral();
                                re = (Regimen_Laboral) list_reg_labo.get(q);
                                if (n.getId_regimen_laboral().equals(re.getId_regimen_laboral())) {%>
                    <td colspan="6"><%=re.getDe_regimen_l()%> </td>
                    <%}
                        }
                    } else {%>
                    <td colspan="6">NO DEFINIDO</td> 
                    <%}%>
                </tr>
                <tr><td class="text-info table-bordered"><strong>Modalidad:</strong></td>

                    <td colspan="6"><%=n.getDe_modalidad()%> </td>

                </tr>
                <tr><td class="text-info table-bordered"><strong>Sub_Modalidad:</strong></td>

                    <td colspan="6"><%=n.getDe_sub_modalidad()%> </td>

                </tr>
                <tr><td class="text-info table-bordered"><strong>Tipo de Contratacion:</strong></td><td colspan="6"><%
                    if (n.getEs_ti_contratacion() != null) {
                        if (n.getEs_ti_contratacion().trim().equals("I")) {
                            out.println("INICIO");
                        }
                        if (n.getEs_ti_contratacion().trim().equals("R")) {
                            out.println("RENOVACION");
                        }
                    } else {
                        out.print("NO DEFINIDO");
                    }%> </td></tr> 
                <tr><td class="text-info table-bordered"><strong>Codigo de Grupo de Ocupaciones:</strong></td>

                    <td colspan="6"><%=n.getDe_grupo_ocupacion()%> </td>

                </tr>
                <tr><td class="text-info table-bordered"> Fecha de Suscripcion:</td><td colspan="6"><%if (n.getFe_suscripcion() != null) {
                        out.print(n.getFe_suscripcion());
                    } else {
                        out.print("NO DEFINIDO");
                    }%> </td></tr>
                <tr><td class="text-info table-bordered"><strong>Tipo moneda de pago:</strong></td><td colspan="6"><%
                    if (n.getCo_ti_moneda() != null) {
                        if (n.getCo_ti_moneda().trim().equals("01")) {
                            out.println("SOLES");
                        }
                        if (n.getCo_ti_moneda().trim().equals("02")) {
                            out.println("DOLARES");
                        }
                        if (n.getCo_ti_moneda().trim().equals("03")) {
                            out.println("EUROS");
                        }
                    } else {
                        out.print("NO DEFINIDO");
                    }%> </td></tr> 
                <tr><td class="text-info table-bordered"><strong>Horas:</strong></td><td class="text-info"><strong>Semanal:</strong></td><td><%=n.getHo_semana()%></td><td class="text-info"><strong>Mensual:</strong></td><td><%=n.getNu_horas_lab() + " h"%></td><td class="text-info"><strong>Dias:</strong></td><td> <%=n.getDia_contrato() + " d"%></td></tr>
                <tr><td class="text-info table-bordered"><strong>Tipo de Trabajador:</strong></td><td colspan="6"><%
                    if (n.getCo_ti_moneda() != null) {
                        if (n.getTi_trabajador().equals("1")) {
                            out.println("Trabajador");
                        }
                        if (n.getTi_trabajador().equals("2")) {
                            out.println("Obrero");
                        }
                    } else {
                        out.print("NO DEFINIDO");
                    }%> </td></tr>   
                <tr><td class="text-info table-bordered"><strong>Régimen Laboral:</strong></td><td colspan="6">
                        <%if (n.getLi_regimen_laboral().trim().equals("1")) {
                                out.println("Privado");
                            } else if (n.getLi_regimen_laboral().trim().equals("1")) {
                                out.println("Publico");
                            } else if (n.getLi_regimen_laboral() == null) {
                                out.println("NO DEFINIDO");
                            }%> </td></tr>   
                <!--<tr><td class="text-info table-bordered"><strong>Vacaciones:</strong></td><td class="text-info" colspan="2"><strong>Desde:</strong></td><td colspan="2"> <%=n.getFe_vacacio_ini()%> </td><td class="text-info" ><strong >Hasta:</strong></td><td colspan="2"> <%=n.getFe_vacacio_fin()%> </td></tr>   -->
                <tr><td class="text-info table-bordered"><strong>Discapacidad:</strong></td><td colspan="6"><%
                    if (n.getEs_discapacidad() != null) {
                        if (n.getEs_discapacidad().equals("1")) {
                            out.println("No");
                        }
                        if (n.getEs_discapacidad().equals("2")) {
                            out.println("Si");
                        }
                    } else {
                        out.println("DATO NO INGRESADO ");
                    }%> 
                    </td></tr>   
                <tr><td class="text-info table-bordered"><strong>Tipo de Contrato:</strong></td><td colspan="6">
                        <%for (int k = 0; k < List_tipo_contrato.size(); k++) {

                                if (n.getTi_contrato().trim().equals(k + 1 + "")) {
                                    out.println(List_tipo_contrato.get(k));
                                }
                            }%> 
                    </td></tr>   
                <tr><td class="text-info table-bordered"><strong>Tipo de Convenio:</strong></td><td colspan="6"><%
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
                <tr><td class="text-info table-bordered"><strong>¿Firmo contrato?:</strong></td><td colspan="6"><%
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
                <tr><td class="text-info table-bordered"><strong>Observaciones:</strong></td><td colspan="6"><%if (n.getDe_observacion() != null) {
                        out.print(n.getDe_observacion());
                    } else {
                        out.print("SIN OBSERVACIONES");
                    }%> </td></tr>   
                <tr><td class="text-info table-bordered"><strong>Régimen Pensionario:</strong></td><td colspan="6"><%
                    if (n.getLi_regimen_pensionario().trim().equals("1")) {
                        out.println("Privado");
                    }
                    if (n.getLi_regimen_pensionario().trim().equals("2")) {
                        out.println("SNP");
                    }
                        %> </td></tr>   
                <tr><td class="text-info table-bordered"><strong>Situacion Actual:</strong></td><td colspan="6"><%
                    for (int t = 0; t < List_Situacion_Actual.size(); t++) {
                        if (n.getEs_contrato().trim().equals(t + 1 + "")) {
                        %><%=List_Situacion_Actual.get(0)%>
                        <%}
                            }
                        %> </td></tr>   
                <tr><td class="text-info table-bordered"><strong>Filial donde Trabaja:</strong></td><td colspan="6"><%
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
                <tr><td class="text-info table-bordered"><strong>Fecha de Cese:</strong></td><td class="table-bordered  " colspan="6">
                        <% if (n.getFe_cese() != null) {
                                out.print(n.getFe_cese());
                            } else {
                                out.print("NO DEFINIDO");
                            }%> </td></tr>   
                <!--   <tr><td>Nro. Documento:</td><td><? /*echo $list_rhc[$index][43];?> </td></tr>   
               <tr><td>Pares:</td><td><? echo $list_rhc[$index][36];?> </td></tr>   
                 <tr><td>Apoyo:</td><td><? echo $list_rhc[$index][41];*/?> </td></tr>   -->
                <%/*
                     if (List_Planilla.size() != 0) {
                     for (int a = 0; a < List_Planilla.size(); a++) {
                     X_List_Plantilla f = new X_List_Plantilla();
                     f = (X_List_Plantilla) List_Planilla.get(a);*/

                    /* <tr><td class="text-info table-bordered" colspan="2"></td><td ><input class="button blue"  type="submit" value="Editar"></td>*/

                    /*}
                     }*/
                    if (List_Planilla.size() == 0) {%>
                <tr><td class="text-info" colspan="8" style="text-align:center"><input class="button blue"  type="hidden" value="Editar"><button  class=" PLANTI button blue">Ver Plantilla</button></td></tr>
                        <%}%>

                <tr> <%if (n.getUs_modif() != null && n.getFe_modif() != null) {%>
                    <td class="text-info table-bordered"><strong>Modificado por:</strong></td>
                    <td><%for (int f = 0; f < List_Usuario.size(); f++) {
                            Usuario u = new Usuario();
                            u = (Usuario) List_Usuario.get(f);
                            if (n.getUs_modif().equals(u.getId_usuario())) {
                                out.println(u.getNo_usuario());%>
                        <%}%>
                    </td>
                    <%}%>
                    <% if (n.getFe_modif() == null && n.getFe_creacion() != null) {%>
                    <td class="text-danger text-info text-center "><strong>Creado por:</strong></td>
                    <%if (n.getUs_creacion() != null) {
                            for (int f = 0; f < List_Usuario.size(); f++) {
                                Usuario u = new Usuario();
                                u = (Usuario) List_Usuario.get(f);
                                if (n.getUs_creacion().equals(u.getId_usuario())) {%>
                    <td class="text-info text-center"><%=u.getNo_usuario()%></td>
                    <%}
                        }
                    } else {%>
                    <td>NO INGRESADO</td>
                    <%}%>
                    <%}%>
                </tr>

                <%}%>
            </table>
        </form>
        <div>
            <table>
                <thead class="tab_cabe">
                    <tr class="tr" >
                        <td>Nro</td>
                        <td style="width: 230px;"><span title="">NOMBRE PLANTILLA</span></td>
                        <td><span >Opcion</span></td>
                    </tr>
                </thead>
                <tbody class="tbodys" id="gg">

                </tbody>
            </table>
        </div>
        <%}
            }
            //}
            List_id_Contrato_DGP.clear();%>
    </center>
    <script>
        $(document).ready(function() {
            $(".PLANTI").click(function() {

            });
        });
    </script>
</body>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }


%>