
<%@page import="pe.edu.upeu.application.model.Detalle_Centro_Costo"%>
<%@page import="pe.edu.upeu.application.model.Centro_Costos"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.dao.UsuarioDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.V_Det_DGP"%>
<%@page import="pe.edu.upeu.application.model.X_List_id_dgp"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.upeu.application.dao.DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDgpDAO"%>
<jsp:useBean id="LIST_ID_DGP" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="LIST_ID_USER" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Cargar_dcc_dgp" scope="application" class="java.util.ArrayList"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link href="../../css/Css_Bootstrap/bootstrap-theme.min.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css">  
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <title>Detalle DGP</title>


        <style type="text/css">
            table{
                //font-weight:bold ;
                width: 50px;
                font-size: 130%;
                font-color: black;
            }

            .text-info{
                text-align: left;

            }
            body{

                margin-left: auto;
                margin-right: auto  ;
                width: 45%;
                // margin: 0;
            }

            .ct{
                text-align: center;   
            }

            #header{
                padding: 0%;
                font-family: verdana;
                font-size: 130%;
                text-align: center;
                color:#474747;

            }


            @media screen and (max-width: 1100px) {
                body {
                    width: 60%;
                }
            }
            @media screen and (max-width: 800px) {
                body {
                    width: auto;
                }


            </style>
        </head>
        <body onload="closedthis();">
            <script >
                $(document).ready(function() {
                    function exito(titulo, mensaje) {
                        $.smallBox({
                            title: titulo,
                            content: mensaje,
                            color: "#739E73",
                            iconSmall: "fa fa-cloud",
                            timeout: 3000
                        });
                    }
                    function closedthis() {
                        $.smallBox({
                            title: "�Ficha de trabajador registrada correctamente!",
                            content: "ya puede visualizar toda la informacion del trabajador...",
                            color: "#739E73",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 6000
                        });
                    }
                });
            </script>
        <center>
            <div >

                <form action="../../dgp">



                    <table class="table table-hover table-striped  table-responsive">
                        <%
                            String iddgp = "";
                            HttpSession sesion = request.getSession(true);
                            String idrol = (String) sesion.getAttribute("IDROL");%>

                        <% if (LIST_ID_DGP.size() > 0) {
                                for (int i = 0; i < LIST_ID_DGP.size(); i++) {
                                    V_Det_DGP d = new V_Det_DGP();
                                    d = (V_Det_DGP) LIST_ID_DGP.get(i);
                                    iddgp = d.getId_dgp();
                        %>
                        <tr><td colspan="2" class="text-info table-bordered"><i class="fa fa-file"></i> REQUERIMIENTO : <%=d.getNo_req()%> </td></tr>
                        <!--<label style="color: black; //font-family: cursive;"><h2><%=d.getNo_req()%></h2></label>
                        --><tr><td  class="text-info table-bordered" style="text-align:align;">Fecha Desde:</td><td class="text-info table-bordered"><%=d.getFe_desde()%></td></tr>
                        <tr ><td class="text-info table-bordered">Fecha Hasta:</td><td class="text-info table-bordered"><%=d.getFe_hasta()%></td></tr>
                        <tr><td class="text-info table-bordered">Sueldo : S/.</td><td class="text-info table-bordered"><%=d.getCa_sueldo()%></td></tr>
                        <tr><td class="text-info table-bordered">BEV: </td><td class="text-info table-bordered"><%=d.getDe_bev()%></td></tr>
                        <tr><td class="text-info table-bordered">Bono Alimentario : S/.</td><td  class="text-info table-bordered"><%=d.getCa_bono_alimentario()%></td></tr>
                        <tr><td class="text-info table-bordered">Bono Puesto : S/.</td><td  class="text-info table-bordered"><%=d.getCa_bonificacion_p()%></td></tr>
                        <tr style="color: red;"><td class="text-info table-bordered" >Sueldo Total : S/.</td><td class=" table-bordered" style="color-text:red; "><%=(d.getCa_sueldo() + d.getCa_bono_alimentario() + d.getDe_bev() + d.getCa_bonificacion_p())%></td></tr>
                        <tr><td  Class="text-info table-bordered">Departamento:</td><td class="text-info table-bordered"><%=d.getNo_dep()%></td></tr>
                        <tr><td  Class="text-info table-bordered">Puesto:</td><td class="text-info table-bordered"><%=d.getNo_puesto()%></td></tr>
                        <input type="hidden" name="iddgp" value="<%=d.getId_dgp().trim()%>">
                        <input type="hidden" name="idreq" value="<%=d.getId_requerimiento().trim()%>">


                        <!--<td><table class="table table-hover table-striped  table-responsive"><tbody><td class="text-info table-bordered">Centro de Costos: </td><td><a href="" >Ver Horario</a></td></tbody></table></td>-->
                        <%if (d.getDe_antecedentes_policiales().equals("1")) {%>
                        <tr><td class="text-info table-bordered">Antecedentes Policiales: </td><td class="text-info table-bordered">No</td></tr>
                        <%} else {%>
                        <tr><td class="text-info table-bordered">Antecedentes Policiales: </td><td class="text-info table-bordered">Si</td></tr>
                        <%}%> 
                        <tr><td class="text-info table-bordered">Certificado de Salud: </td><td class="text-info table-bordered" ><%if (d.getEs_certificado_salud() != null) {
                                if (d.getEs_certificado_salud().trim().equals("1")) {
                                    out.print("Si");
                                }
                                if (d.getEs_certificado_salud().trim().equals("0")) {
                                    out.print("No");
                                }
                            } else {
                                out.print("No ingresado");
                            }%></td></tr>


                        <!--<tr><td class="td-det">Ruc:</td><td><?echo $list[$index][9];?></td></tr>
                        <tr><td class="td-det">Lugar de Servicio:</td><td><?echo $list[$index][10];?></td></tr>
                        <tr><td class="td-det">Periodo de Pago:</td><td><?echo $list[$index][12];?></td></tr>
                        <tr><td class="td-det">Horario de Capacitaci�n:</td><td><?echo $list[$index][15];?></td></tr>
                        <tr><td class="td-det">Horario de Refrigerio:</td><td><?echo $list[$index][16];?></td></tr>
                        <tr><td class="td-det">Dias Capacitaci�n:</td><td><?echo $list[$index][17];?></td></tr>
                        <tr><td class="td-det">Subvenci�n:</td><td><?echo $list[$index][14];?></td></tr>
                        ->
           
                        <!--<tr><td colspan="2"></td><td><input class="btn btn-success" style="width: 100px" type="submit" value="Editar"></td>
                        -->               




                        <%
                            String num = request.getParameter("num");

                            if (d.getEs_dgp() != null) {
                                if (num.equals("0") & d.getEs_dgp().equals("0") & idrol.trim().equals("ROL-0006")) {

                        %>

                        <tr> <td  colspan="3" class="ct"><a href="../../contrato?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=enviar">Hacer Contrato</a></td></tr>
                        <%}
                            if (d.getEs_dgp().equals("1") & num.equals("0") & !"ROL-0006".equals(idrol.trim())) {%>
                        <tr><td colspan="3" class="ct"><a href="">Ver Contrato</a></td></tr>
                        <%}
                            }%>

                        <% if (d.getUs_creacion() != null) {%>
                        <tr style="color: red;"><td class="text-info table-bordered">Creado por:</td><td colspan="2" class="text-info table-bordered"><%=d.getNo_usuario_crea()%></td></tr>
                            <%} else {%>
                        <tr style="color: red;"><td class="text-info table-bordered">Usuario Creador:</td><td colspan="2" class="text-info table-bordered">No Registrado</td></tr>
                        <%}%>
                        <%if (d.getUs_modif() != null) {%>
                        <tr style="color: red;"><td class="text-info table-bordered">Ultima Modificacion por:</td><td class="table-bordered" colspan="2"><%=d.getNo_usuario_mod()%></td></tr>
                            <%} else {%>
                        <tr style="color: red;"><td class="text-info table-bordered">Modificaciones</td><td class=" table-bordered">Sin Modificaciones</td></tr>
                        <%}%>


                        <%if (d.getFe_modif() == null) {%>
                        <tr><td class="text-info table-bordered">Fecha Modificacion</td><td colspan="2" class="text-info table-bordered">Sin Modificaciones</td></tr>
                        <%} else {%>
                        <tr><td class="text-info table-bordered">Fecha de Modificacion:</td><td colspan="2" class="text-info table-bordered"><%=d.getFe_modif()%></td></tr>
                            <%}%>
                            <%if (d.getFe_creacion() == null) {%>
                        <tr><td class="text-info table-bordered">fecha Creacion:</td><td colspan="2" class="text-info table-bordered">Sin Modificaciones</td></tr>
                        <%} else {%>
                        <tr><td class="text-info table-bordered">Fecha de Creacion:</td><td colspan="2" class="text-info table-bordered"><%=d.getFe_creacion()%></td></tr>
                            <%}%>

                        <%if (Cargar_dcc_dgp.size() > 0) {
                                for (int p = 0; p < Cargar_dcc_dgp.size(); p++) {
                                    Detalle_Centro_Costo dcc = new Detalle_Centro_Costo();
                                    dcc = (Detalle_Centro_Costo) Cargar_dcc_dgp.get(p);
                        %>
                        <tr><td class="text-info table-bordered">Centro de costo Nro <%=p + 1%></td><td class="text-info table-bordered"><%=dcc.getDe_centro_costo()%></td></tr>
                            <%}
                            } else {%>
                        <tr><td class="text-info table-bordered">Centro de costo </td><td class="text-info table-bordered">No tiene Centro de costo </td></tr>
                        <%}%>

                        <%if (d.getLi_motivo().equals("1")) {%>
                        <tr><td class="text-info table-bordered">Motivo :</td><td colspan="2" class="text-info table-bordered">Trabajador Nuevo</td></tr>
                        <%}
                            if (d.getLi_motivo().equals("2")) {%>
                        <tr><td class="text-info table-bordered">Motivo:</td><td colspan="2" class="text-info table-bordered">Renovaci�n</td></tr>
                        <%}
                            if (d.getEs_mfl().equals("1")) {%>
                        <tr><td class="text-info table-bordered">MFL:</td><td colspan="2" class="text-info table-bordered">Si</td></tr>
                        <%}
                            if (d.getEs_mfl().equals("0")) {%>
                        <tr><td class="text-info table-bordered">MFL:</td><td colspan="2" class="text-info table-bordered">No</td></tr>
                        <%}%>

                        <input type="hidden" name="idtr" value="<%=request.getParameter("idtr")%>">
                        <input type="hidden" name="opc" value="MODIFICAR REQUERIMIENTO">   
                        <% if (idrol.trim().equals("ROL-0002") | idrol.trim().equals("ROL-0005") | idrol.trim().equals("ROL-0003")) {%>
                    </table>
                    <table>
                        <tr><td> </td><td><a class="btn btn-primary btn-labeled" href="../../documento?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=Ver_Documento"><span class="btn-label"><i class="glyphicon glyphicon-info-sign"></i></span>Ver Documentos</a></td><td><a class="btn btn-primary btn-labeled" href="../../horario?iddgp=<%=d.getId_dgp()%>&opc=Listar"><span class="btn-label"><i class="glyphicon glyphicon-info-sign"></i></span>Ver Horario</a></td></tr><%}%>
                    </table>
                    <%}
                        }%> 
                </form>

                <% if (request.getParameter("opc") != null) {
                        if (request.getParameter("opc").equals("reg_doc")) {

                %>

                <tr><td colspan="2"><h3 style="text-align: center;">Enviar Requerimiento</h3> 
                        <form action="../../dgp" method="get">
                            <input  type="hidden" value="<%=iddgp%>" name="iddgp">
                            <input type="hidden" value="Terminar" name="opc">
                            <footer>
                                <button type="submit" class="btn btn-success">
                                    TERMINAR
                                </button>
                            </footer>
                        </form></td></tr>

                <%}
                    }%>
            </div>
        </center>
    </body>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>
