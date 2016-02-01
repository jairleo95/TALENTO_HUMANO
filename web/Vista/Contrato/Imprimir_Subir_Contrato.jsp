<%@page import="pe.edu.upeu.application.model.Funciones"%>
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

<jsp:useBean id="List_contra_x_idcto" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Situacion_Actual" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Planilla" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_Condicion_contrato" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_reg_labo" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Usuario" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Lis_c_c_id_contr" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Anno_trabajador" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_x_fun_x_idpu" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css">  
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
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
        <BR>



        <form action="../../contrato" method="get">
            <%String idanno = request.getParameter("anno");
                if (List_contra_x_idcto.size() == 0) {%>
            <h3>Aun no se ha hecho Contrato.</h3>
            <%
            } else {%>

            <%
                HttpSession Sesion = request.getSession(true);
                String idrol = (String) Sesion.getAttribute("IDROL");
                X_List_Id_Contrato_DGP n1 = new X_List_Id_Contrato_DGP();
                n1 = (X_List_Id_Contrato_DGP) List_contra_x_idcto.get(0);
                if (Integer.parseInt(n1.getEs_secre_is()) == 2 && idrol.trim().equals("ROL-0002")) {
            %>

            <div class="alert alert-warning fade in">
                <button class="close" data-dismiss="alert">
                    ×
                </button>
                <i class="fa-fw fa fa-warning"></i>
                <strong>¡Advertencia!</strong> Usted no tiene acceso a imprimir ni subir el contrato...
            </div>
            <%}%>

            <div>
                <table class="table table-hover table-striped  table-responsive" style="border-radius: 30px ">
                    <tr><td align="right">

                        </td>
                        <td><input type="hidden" name="idtr" value="<%=request.getParameter("idtr")%>"></td>
                        <td><input type="hidden" name="opc" value="actualizar" ></td><button type="submit"  style="display:none" class="btn_act"   >Actualizar</button></tr>
                </table>
            </div>

            <script>$(document).ready(function () {
                    $(".anno").change(function () {
                        $(".btn_act").click();
                    });
                });</script>
        </form>
        <div>

            <%
            %>
            <%for (int b = 0; b < List_contra_x_idcto.size(); b++) {
                    X_List_Id_Contrato_DGP n = new X_List_Id_Contrato_DGP();
                    n = (X_List_Id_Contrato_DGP) List_contra_x_idcto.get(b);
            %>

            <%if (Integer.parseInt(n.getEs_secre_is()) == 2 && idrol.trim().equals("ROL-0002")) {

            %>


            <%} else {%>
            <a class="btn btn-labeled btn-primary" href="../../contrato?opc=Subir_Contrato2&idc=<%=n.getId_contrato()%>" > <span class="btn-label"><i class="fa fa-cloud-upload"></i></span>Subir Contrato Firmado</a>
                    <%}%>
                    <%if (Integer.parseInt(n.getEs_secre_is()) == 2 && idrol.trim().equals("ROL-0002")) {
                    %>
                    <%} else {%>
            <form action="../../plantilla_contractual" method="post" class="formu">
                <div class="Contenido">
                    <table>
                        <td><input type="hidden" name="id_plan_contr" value="<%=n.getId_plantilla_contractual()%>"></td>
                        <td><input type="hidden" name="idtraba" value="<%=n.getId_trabajador()%>"></td>
                        <td><input type="hidden" name="id_con" class="id_contrato" value="<%=n.getId_contrato()%>"></td>
                        <td><input type="hidden" name="puesto" class="id_pu" value="<%=n.getId_puesto()%>" ></td>
                        <tr><td class="text-info" colspan="8" style="text-align:center"><input class="button blue"  type="hidden" value="Editar"><button name="opc" value="Imprimir" class="PLANTI btn btn-labeled btn-primary"><span class="btn-label"><i class="fa fa-print"></i></span>Imprimir</button></td></tr>
                    </table>
                </div>
            </form>
            <%}%>



            <form action="">

                <% for (int p = 0; p < List_contra_x_idcto.size(); p++) {%>
                <table class="table table-hover table-striped  table-responsive">
                    <tr><td class="text-info table-bordered"><strong>Desde: </strong></td><td colspan="2"><%=n.getFe_desde()%></td><td class="text-info table-bordered" colspan="2"><strong>Hasta:</strong></td><td class="table-bordered" colspan="2"><%=n.getFe_hasta()%></td></tr>
                    <tr><td class="text-info table-bordered"><strong>Dirección:</strong></td><td colspan="6" class="table-bordered" ><p><%=n.getNo_direccion()%> </p></td></tr>
                    <tr><td class="text-info table-bordered"><strong>Departamento:</strong></td><td colspan="6" class="table-bordered" ><p><%=n.getNo_dep()%> </p></td></tr>
                    <tr><td class="text-info table-bordered"><strong>Area:</strong></td><td colspan="6" class="table-bordered" ><p><%=n.getNo_area()%> </td></p></tr>
                    <tr><td class="text-info table-bordered"><strong>Sección:</strong></td><td colspan="6" class="table-bordered" ><p><%=n.getNo_seccion()%> </p></td></tr>
                    <tr><td class="text-info table-bordered"><strong>Puesto:</strong></td><td colspan="6" class="table-bordered" ><p><%=n.getNo_puesto()%></p><input type="hidden" class="id_pu" value="<%=n.getId_puesto()%>" name="puesto"></td> </tr>
                                <%
                                    if (Lis_c_c_id_contr.size() > 0) {
                                        Double cantidad = 0.0;
                                        for (int q = 0; q < Lis_c_c_id_contr.size(); q++) {
                                            Centro_Costos cc = new Centro_Costos();
                                            cc = (Centro_Costos) Lis_c_c_id_contr.get(q);

                                            cantidad = Double.parseDouble(cc.getCa_porcentaje()) + cantidad;
                                %>
                    <tr><td class="text-info table-bordered"><strong>Sueldo:</strong></td><td>S/.<%=n.getCa_sueldo()%></td><td class="text-info table-bordered" colspan="1"><strong>Reintegro:</strong></td><td colspan="1">S/.<%=n.getCa_reintegro()%></td><td class="text-info table-bordered" colspan="2"><strong>Bono Alimentario:</strong></td><td class="table-bordered" >S/.<%=n.getCa_bono_alimento()%> </td></tr>
                    <tr><td class="text-info table-bordered"><strong>Bev:</strong></td><td class="table-bordered"  colspan="6">S/.<%if (n.getCa_bev() != null) {
                            out.print(n.getCa_bev());
                        } else {
                            out.print("0");
                        }%> </td></tr>
                    <tr><td class="text-info table-bordered"><strong>Bonificacion Puesto:</strong></td><td class="table-bordered"  colspan="6">S/.<%if (n.getCa_bonificacion_p() != null) {
                            out.print(n.getCa_bonificacion_p());
                        } else {
                            out.print("--");
                        }%> </td></tr>
                    <tr><td class="text-info table-bordered"><strong>Sueldo Total:</strong></td><td class="table-bordered" colspan="6">S/.<%if (n.getCa_sueldo_total() != null) {
                            out.print(n.getCa_sueldo_total());
                        } else {
                            out.print("0");
                        }%> </td></tr>

                    <%}%>
                </table>
            </form>
            <div>
            </div>
        </div>
        <%}
            }
        %>
    </center>

    <%}%>
    <%}%>
</body>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }


%>
