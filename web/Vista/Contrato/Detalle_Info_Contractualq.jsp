<%@page import="pe.edu.upeu.application.model.Funciones"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.Anno"%>
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

<jsp:useBean id="List_contra_x_idcto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Situacion_Actual" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Planilla" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="list_Condicion_contrato" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_tipo_contrato" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="list_reg_labo" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Usuario" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Lis_c_c_id_contr" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Anno_trabajador" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_x_fun_x_idpu" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css">  
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
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

        <form action="../../contrato" method="get"class="smart-form">
            <%String idanno = request.getParameter("anno");
                if (List_contra_x_idcto.size() == 0) {%>
            <h3>Aun no se ha hecho Contrato.</h3>
            <%
            } else {%>

            <div>
                <div class="row" align="center">
                    <section class="col col-lg-12 ">
                        <label><strong>Contratos:</strong></label>
                        <label class="select ">
                            <select name="ida" class="select anno " >
                                <%
                                    String ID_CTO = request.getParameter("id_cto");
                                    for (int cv = 0; cv < List_Anno_trabajador.size(); cv++) {
                                        Anno an = new Anno();
                                        an = (Anno) List_Anno_trabajador.get(cv);
                                        if (an.getId_contrato().equals(ID_CTO.trim())) {
                                %><option value="<%=an.getId_contrato()%>" selected=""><%= (cv + 1) + ") De " + an.getFe_desde()%><%if (an.getFe_hasta() != null) {
                                        out.print(" Al " + an.getFe_hasta());
                                    } else {
                                        out.print(" hasta indefinidamente");
                                    }%></option><%
                                    } else {
                                    %><option value="<%=an.getId_contrato()%>"><%= (cv + 1) + ") De " + an.getFe_desde()%><%if (an.getFe_hasta() != null) {
                                            out.print(" Al " + an.getFe_hasta());
                                        } else {
                                            out.print(" hasta indefinidamente");
                                        }%></option><%
                                                }
                                            }%>
                            </select> 
                        </label>
                    </section>
                    <input type="hidden" name="idtr" value="<%=request.getParameter("idtr")%>">
                    <input type="hidden" name="opc" value="actualizar" ><button type="submit"  style="display:none" class="btn_act"   >Actualizar</button>
                </div>
            </div>

            <script>$(document).ready(function() {
                    $(".anno").change(function() {
                        $(".btn_act").click();
                    });
                });</script>
        </form>
        <div>
            <form action="">
                <%

                    CConversion c = new CConversion();

                    HttpSession Sesion = request.getSession(true);
                    String idrol = (String) Sesion.getAttribute("IDROL");

                %>
                <%for (int b = 0; b < List_contra_x_idcto.size(); b++) {
                        X_List_Id_Contrato_DGP n = new X_List_Id_Contrato_DGP();
                        n = (X_List_Id_Contrato_DGP) List_contra_x_idcto.get(b);
                %>

                <%if (idrol.trim().equals("ROL-0006") || idrol.trim().equals("ROL-0001")) {
                %>
                <div class="smart-form">¿Decidir la secretaria de departamento o area lo suba e imprima el contrato?<label class='toggle'><input type='checkbox' value='1'  class='ck_habilitar_is'  name='estado' name='checkbox-toggle' <%
                    if (Integer.parseInt(n.getEs_secre_is()) == 1) {
                        out.print("checked");
                    }
                                                                                                                                                 %> ><i data-swchon-text='SI' data-swchoff-text='NO'></i></label></div><br><br>
                        <%}%>
                        <%if (idrol.trim().equals("ROL-0006") || idrol.trim().equals("ROL-0002") || idrol.trim().equals("ROL-0001")) {
                        %> 

                <%if (Integer.parseInt(n.getEs_secre_is()) == 2 && idrol.trim().equals("ROL-0002")) {
                %>
                <%} else {%>
                <a class="btn btn-labeled btn-primary" href="../../contrato?opc=Subir_Contrato2&idc=<%=n.getId_contrato()%>" > <span class="btn-label"><i class="fa fa-cloud-upload"></i></span>Subir Contrato Firmado</a>
                        <%}%>
                        <%}
                            if (idrol.trim().equals("ROL-0006") || idrol.trim().equals("ROL-0007") || idrol.trim().equals("ROL-0009") || idrol.trim().equals("ROL-0001")) {%>
                <a class="btn btn-labeled btn-primary" href="../../contrato?opc=Editar&idc=<%=n.getId_contrato()%>&idtr=<%=request.getParameter("idtr")%>&id_dg=<%=request.getParameter("id_dg")%>" > <span class="btn-label"><i class="fa fa-pencil-square-o"></i></span>Editar Contrato</a>
                        <%}%>
                        <% for (int p = 0; p < List_contra_x_idcto.size(); p++) {%>
                <table class="table table-hover table-striped  table-responsive">
                    <tr><td class="text-info table-bordered"><strong>Desde: </strong></td><td colspan="2"><%=n.getFe_desde()%></td><td class="text-info table-bordered" colspan="2"><strong>Hasta:</strong></td><td class="table-bordered" colspan="2"><%if (n.getFe_hasta() != null) {
                            out.print(n.getFe_hasta());
                        } else {
                            out.print("No definido");
                        }%></td></tr>
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
                    <tr><td class="text-info table-bordered"><strong>Centro costo Nº <%=q + 1%>:</strong></td><td colspan="2" class="table-bordered" ><p><%=cc.getDe_centro_costo()%></p></td><td class="text-info table-bordered" colspan="2"><strong>Porcentaje</strong></td><td colspan="2"><p><%=cc.getCa_porcentaje()%> %</p> </td></tr><%}%>
                    <tr><td class="text-info table-bordered"><strong>Total Porcentaje:</strong></td><td colspan="6" class="table-bordered" ><p><%=cantidad%> %</p></td></tr><%} else {%>
                    <tr><td class="text-info table-bordered"><strong>Centro costo </strong></td><td colspan="6" class="table-bordered" ><p>No tiene</p></td></tr><%}%>

                    <tr><td class="text-info table-bordered"><strong>Condición:</strong></td> <td colspan="6" class="table-bordered" ><p><%
                        if (n.getLi_condicion() != null) {
                            for (int h = 0; h < list_Condicion_contrato.size(); h++) {

                                if (n.getLi_condicion().trim().equals(h + 1 + "")) {
                                    out.println(list_Condicion_contrato.get(h));
                                }
                            }
                        } else {
                            out.print("No tiene");
                        }%> </p></td></tr>
                    <!--<tr><td>Funcion:</td><td><? /*echo $list_rhc[$index][5];*/?> </td></tr>-->
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
                    <!-- <tr><td class="text-info table-bordered"><strong>Bonificacion Puesto:</strong></td><td class="table-bordered"  colspan="6">S/.<%/*if (n.getCa_bonificacion_p()!= null) {
                         out.print(n.getCa_bonificacion_p());
                         } else {
                         out.print("0");
                         }*/%> </td></tr>-->
                    <tr><td class="text-info table-bordered"><strong>Sueldo Total:</strong></td><td class="table-bordered" colspan="6">S/.<%if (n.getCa_sueldo_total() != null) {
                            out.print(n.getCa_sueldo_total());
                        } else {
                            out.print("0");
                        }%> </td></tr>
                    <tr><td class="text-info table-bordered"><strong>Tipo Pago Horas:</strong></td><td class="table-bordered"  colspan="6"><%
                        if (n.getTi_hora_pago() != null) {
                            out.print(n.getTi_hora_pago());
                        } else {
                            out.print("--");
                        }

                            %> </td></tr>
                    <tr><td class="text-info table-bordered"><strong>Asignación Familiar:</strong></td><td class="table-bordered"  class="table-bordered" colspan="6"><%= "S/." + n.getCa_asig_familiar()%> </td></tr>
                    <tr><td class="text-info table-bordered"><strong>Regimen Laboral Mintra:</strong></td>
                        <% if (n.getId_regimen_laboral() != null) {
                                for (int q = 0; q < list_reg_labo.size(); q++) {
                                    Regimen_Laboral re = new Regimen_Laboral();
                                    re = (Regimen_Laboral) list_reg_labo.get(q);
                                    if (n.getId_regimen_laboral().equals(re.getId_regimen_laboral())) {%>
                        <td class="table-bordered"  class="table-bordered"  colspan="6"><%=re.getDe_regimen_l()%> </td>
                        <%}
                            }
                        } else {%>
                        <td class="table-bordered"  colspan="6">No definido</td> 
                        <%}%>
                    </tr>
                    <tr><td class="text-info table-bordered"><strong>Modalidad:</strong></td>

                        <td class="table-bordered"  colspan="6"><%=n.getDe_modalidad()%> </td>

                    </tr>
                    <tr><td class="text-info table-bordered"><strong>Sub_Modalidad:</strong></td>

                        <td class="table-bordered"  colspan="6"><%=n.getDe_sub_modalidad()%> </td>

                    </tr>
                    <tr><td class="text-info table-bordered"><strong>Tipo de Contratacion:</strong></td><td class="table-bordered"  colspan="6"><%
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

                        <td class="table-bordered"  colspan="6"><%=n.getDe_grupo_ocupacion()%> </td>

                    </tr>
                    <tr><td class="text-info table-bordered"> Fecha de Suscripcion:</td><td class="table-bordered"  colspan="6"><%if (n.getFe_suscripcion() != null) {
                            out.print(n.getFe_suscripcion());
                        } else {
                            out.print("NO DEFINIDO");
                        }%> </td></tr>
                    <tr><td class="text-info table-bordered"><strong>Tipo moneda de pago:</strong></td><td class="table-bordered"  colspan="6"><%
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
                    <tr><td class="text-info table-bordered"><strong>Horas:</strong></td><td class="text-info"><strong>Semanal:</strong></td><td><%=n.getHo_semana()%></td><td class="text-info"><strong>Mensual:</strong></td><td><%=n.getNu_horas_lab() + " h"%></td><td class="text-info"><strong>Dias:</strong></td><td class="table-bordered" > <%=n.getDia_contrato() + " d"%></td></tr>
                    <tr><td class="text-info table-bordered"><strong>Tipo de Trabajador:</strong></td><td class="table-bordered"  colspan="6"><%
                        if (n.getTi_trabajador() != null) {
                            if (n.getTi_trabajador().trim().equals("1")) {
                                out.println("Trabajador");
                            }
                            if (n.getTi_trabajador().trim().equals("2")) {
                                out.println("Obrero");
                            }
                        } else {
                            out.print("NO DEFINIDO");
                        }%> </td></tr>   
                    <tr><td class="text-info table-bordered"><strong>Régimen Laboral:</strong></td><td class="table-bordered"  colspan="6">
                            <%if (n.getLi_regimen_laboral() != null) {
                                    if (n.getLi_regimen_laboral().trim().equals("1")) {
                                        out.println("Privado");
                                    } else if (n.getLi_regimen_laboral().trim().equals("2")) {
                                        out.println("Publico");
                                    }
                                } else {
                                    out.print("NO DEFINIDO");
                                }%> </td></tr>   
                    <!--<tr><td class="text-info table-bordered"><strong>Vacaciones:</strong></td><td class="text-info" colspan="2"><strong>Desde:</strong></td><td colspan="2"> <%=n.getFe_vacacio_ini()%> </td><td class="text-info" ><strong >Hasta:</strong></td><td colspan="2"> <%=n.getFe_vacacio_fin()%> </td></tr>   -->
                    <tr><td class="text-info table-bordered"><strong>Discapacidad:</strong></td><td class="table-bordered" colspan="6"><%
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
                    <tr><td class="text-info table-bordered"><strong>Tipo de Contrato:</strong></td><td class="table-bordered" colspan="6">
                            <%if (n.getTi_contrato() != null) {
                                    for (int k = 0; k < List_tipo_contrato.size(); k++) {
                                        if (n.getTi_contrato().trim().equals(k + 1 + "")) {
                                            out.print(List_tipo_contrato.get(k));
                                        }
                                    }
                                } else {
                                    out.print("NO DEFINIDO");
                                }%> 
                        </td></tr>   
                    <tr><td class="text-info table-bordered"><strong>Tipo de Convenio:</strong></td><td class="table-bordered" colspan="6"><%
                        if (n.getLi_tipo_convenio() != null) {
                            if (n.getLi_tipo_convenio().trim().equals("1")) {
                                out.println("CLJ");
                            }
                            if (n.getLi_tipo_convenio().trim().equals("2")) {
                                out.println("PPP");
                            }
                            if (n.getLi_tipo_convenio().trim().equals("3")) {
                                out.println("PP");
                            }
                        } else {
                            out.println("NO DEFINIDO");

                        }
                            %> </td></tr>   
                    <tr><td class="text-info table-bordered"><strong>¿Firmo contrato?:</strong></td><td class="table-bordered" colspan="6"><%
                        if (idrol.trim().equals("ROL-0006") && n.getEs_firmo_contrato() == null) {%>
                            <a href="../../contrato?fc=s&idc=<%=n.getId_trabajador()%>"  class="boton">SI</a>o<a href="" class="boton">NO</a>
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
                    <tr><td class="text-info table-bordered"><strong>Observaciones:</strong></td><td class="table-bordered" colspan="6"><%if (n.getDe_observacion() != null) {
                            out.print(n.getDe_observacion());
                        } else {
                            out.print("SIN OBSERVACIONES");
                        }%> </td></tr>   
                    <tr><td class="text-info table-bordered"><strong>Régimen Pensionario:</strong></td><td class="table-bordered" colspan="6"><%
                        if (n.getLi_regimen_pensionario() != null) {
                            if (n.getLi_regimen_pensionario().trim().equals("1")) {
                                out.println("Privado");
                            }
                            if (n.getLi_regimen_pensionario().trim().equals("2")) {
                                out.println("SNP");
                            }
                        } else {
                            out.println("NO DEFINIDO");
                        }
                            %> </td></tr>   
                    <tr><td class="text-info table-bordered"><strong>Situacion Actual:</strong></td><td class="table-bordered" colspan="6"><%
                        // for (int t = 0; t < List_Situacion_Actual.size(); t++) {
                        if (n.getEs_contrato() != null) {
                            if (n.getEs_contrato().trim().equals("1")) {
                                out.print("Activo");
                            } else {
                                out.print("Termino Contrato");
                            }
                        }
                            %> </td></tr>   
                    <tr><td class="text-info table-bordered"><strong>Filial donde Trabaja:</strong></td><td class="table-bordered" colspan="6"><%
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
                    <%if (List_x_fun_x_idpu.size() > 0) {%>
                    <tr><td class="text-info table-bordered" colspan="8" style="text-align:center;">FUNCIONES</td></tr>
                    <%for (int fu = 0; fu < List_x_fun_x_idpu.size(); fu++) {
                            Funciones fun = new Funciones();
                            fun = (Funciones) List_x_fun_x_idpu.get(fu);
                    %>
                    <tr><td class="text-info table-bordered"><strong>Funcion Nº<%=fu + 1%>:</strong></td><td class="table-bordered" colspan="6"><%=fun.getDe_funcion()%></td></tr>   <%}%>
                        <%}%>


                    <tr><%if (n.getUs_modif() != null && n.getFe_modif() != null) {%>
                        <td class="text-info table-bordered"><strong>Modificado por:</strong></td>
                        <td><%for (int f = 0; f < List_Usuario.size(); f++) {
                                Usuario u = new Usuario();
                                u = (Usuario) List_Usuario.get(f);
                                if (n.getUs_modif().trim().equals(u.getId_usuario().trim())) {
                                    out.println(u.getNo_usuario());%>
                            <%}%>
                        </td>
                        <%}
                        } else {%>
                        <% if (n.getUs_creacion() != null && n.getFe_creacion() != null) {%>
                        <td class="text-danger text-info text-center "><strong>Creado por:</strong></td>
                        <%if (n.getUs_creacion() != null) {
                                for (int f = 0; f < List_Usuario.size(); f++) {
                                    Usuario u = new Usuario();
                                    u = (Usuario) List_Usuario.get(f);
                                    if (n.getUs_creacion().equals(u.getId_usuario())) {%>
                        <td class="text-info text-center" colspan="6"><%=u.getNo_usuario()%></td>
                        <%}
                            }
                        } else {%>
                        <td>NO INGRESADO</td>
                        <%}%>
                        <%}%>
                    </tr>
                    <tr></tr>

                    <%}%>






                </table>
            </form>
            <div>
                <table>
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
                         }*/%>

                </table>
            </div>
        </div>
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
        <%}
            }
        %>
    </center>

    <%}%>
</body>
<script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>

<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script>
                if (!window.jQuery) {
                    document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');
                }
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script>
                if (!window.jQuery.ui) {
                    document.write('<script src="../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                }
</script>

<!-- IMPORTANT: APP CONFIG -->
<script src="../../js/app.config.js"></script>

<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
<script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

<!-- BOOTSTRAP JS -->
<script src="../../js/bootstrap/bootstrap.min.js"></script>

<!-- CUSTOM NOTIFICATION -->
<script src="../../js/notification/SmartNotification.min.js"></script>

<!-- JARVIS WIDGETS -->
<script src="../../js/smartwidgets/jarvis.widget.min.js"></script>

<!-- EASY PIE CHARTS -->
<script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

<!-- SPARKLINES -->
<script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

<!-- JQUERY VALIDATE -->
<script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

<!-- JQUERY MASKED INPUT -->
<script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

<!-- JQUERY SELECT2 INPUT -->
<script src="../../js/plugin/select2/select2.min.js"></script>

<!-- JQUERY UI + Bootstrap Slider -->
<script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

<!-- browser msie issue fix -->
<script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

<!-- FastClick: For mobile devices -->
<script src="../../js/plugin/fastclick/fastclick.min.js"></script>

<!--[if IE 8]>

<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

<![endif]-->

<!-- Demo purpose only -->
<script src="../../js/demo.min.js"></script>

<!-- MAIN APP JS FILE -->
<script src="../../js/app.min.js"></script>

<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
<!-- Voice command : plugin -->
<script src="../../js/speech/voicecommand.min.js"></script>

<!-- PAGE RELATED PLUGIN(S) -->
<script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>


<script type="text/javascript">

// DO NOT REMOVE : GLOBAL FUNCTIONS!

                $(document).ready(function() {

                    pageSetUp();

                    var $checkoutForm = $('#checkout-form').validate({
                        // Rules for form validation
                        rules: {
                            fname: {
                                required: true
                            },
                            lname: {
                                required: true
                            },
                            email: {
                                required: true,
                                email: true
                            },
                            phone: {
                                required: true
                            },
                            country: {
                                required: true
                            },
                            city: {
                                required: true
                            },
                            code: {
                                required: true,
                                digits: true
                            },
                            address: {
                                required: true
                            },
                            name: {
                                required: true
                            },
                            card: {
                                required: true,
                                creditcard: true
                            },
                            cvv: {
                                required: true,
                                digits: true
                            },
                            month: {
                                required: true
                            },
                            year: {
                                required: true,
                                digits: true
                            }
                        },
                        // Messages for form validation
                        messages: {
                            fname: {
                                required: 'Please enter your first name'
                            },
                            lname: {
                                required: 'Please enter your last name'
                            },
                            email: {
                                required: 'Please enter your email address',
                                email: 'Please enter a VALID email address'
                            },
                            phone: {
                                required: 'Please enter your phone number'
                            },
                            country: {
                                required: 'Please select your country'
                            },
                            city: {
                                required: 'Please enter your city'
                            },
                            code: {
                                required: 'Please enter code',
                                digits: 'Digits only please'
                            },
                            address: {
                                required: 'Please enter your full address'
                            },
                            name: {
                                required: 'Please enter name on your card'
                            },
                            card: {
                                required: 'Please enter your card number'
                            },
                            cvv: {
                                required: 'Enter CVV2',
                                digits: 'Digits only'
                            },
                            month: {
                                required: 'Select month'
                            },
                            year: {
                                required: 'Enter year',
                                digits: 'Digits only please'
                            }
                        },
                        // Do not change code below
                        errorPlacement: function(error, element) {
                            error.insertAfter(element.parent());
                        }
                    });

                    var $registerForm = $("#smart-form-register").validate({
                        // Rules for form validation
                        rules: {
                            username: {
                                required: true
                            },
                            email: {
                                required: true,
                                email: true
                            },
                            password: {
                                required: true,
                                minlength: 3,
                                maxlength: 20
                            },
                            passwordConfirm: {
                                required: true,
                                minlength: 3,
                                maxlength: 20,
                                equalTo: '#password'
                            },
                            firstname: {
                                required: true
                            },
                            lastname: {
                                required: true
                            },
                            gender: {
                                required: true
                            },
                            terms: {
                                required: true
                            }
                        },
                        // Messages for form validation
                        messages: {
                            login: {
                                required: 'Please enter your login'
                            },
                            email: {
                                required: 'Please enter your email address',
                                email: 'Please enter a VALID email address'
                            },
                            password: {
                                required: 'Please enter your password'
                            },
                            passwordConfirm: {
                                required: 'Please enter your password one more time',
                                equalTo: 'Please enter the same password as above'
                            },
                            firstname: {
                                required: 'Please select your first name'
                            },
                            lastname: {
                                required: 'Please select your last name'
                            },
                            gender: {
                                required: 'Please select your gender'
                            },
                            terms: {
                                required: 'You must agree with Terms and Conditions'
                            }
                        },
                        // Do not change code below
                        errorPlacement: function(error, element) {
                            error.insertAfter(element.parent());
                        }
                    });

                    var $reviewForm = $("#review-form").validate({
                        // Rules for form validation
                        rules: {
                            name: {
                                required: true
                            },
                            email: {
                                required: true,
                                email: true
                            },
                            review: {
                                required: true,
                                minlength: 20
                            },
                            quality: {
                                required: true
                            },
                            reliability: {
                                required: true
                            },
                            overall: {
                                required: true
                            }
                        },
                        // Messages for form validation
                        messages: {
                            name: {
                                required: 'Please enter your name'
                            },
                            email: {
                                required: 'Please enter your email address',
                                email: '<i class="fa fa-warning"></i><strong>Please enter a VALID email addres</strong>'
                            },
                            review: {
                                required: 'Please enter your review'
                            },
                            quality: {
                                required: 'Please rate quality of the product'
                            },
                            reliability: {
                                required: 'Please rate reliability of the product'
                            },
                            overall: {
                                required: 'Please rate the product'
                            }
                        },
                        // Do not change code below
                        errorPlacement: function(error, element) {
                            error.insertAfter(element.parent());
                        }
                    });

                    var $commentForm = $("#comment-form").validate({
                        // Rules for form validation
                        rules: {
                            name: {
                                required: true
                            },
                            email: {
                                required: true,
                                email: true
                            },
                            url: {
                                url: true
                            },
                            comment: {
                                required: true
                            }
                        },
                        // Messages for form validation
                        messages: {
                            name: {
                                required: 'Enter your name',
                            },
                            email: {
                                required: 'Enter your email address',
                                email: 'Enter a VALID email'
                            },
                            url: {
                                email: 'Enter a VALID url'
                            },
                            comment: {
                                required: 'Please enter your comment'
                            }
                        },
                        // Ajax form submition
                        submitHandler: function(form) {
                            $(form).ajaxSubmit({
                                success: function() {
                                    $("#comment-form").addClass('submited');
                                }
                            });
                        },
                        // Do not change code below
                        errorPlacement: function(error, element) {
                            error.insertAfter(element.parent());
                        }
                    });

                    var $contactForm = $("#contact-form").validate({
                        // Rules for form validation
                        rules: {
                            name: {
                                required: true
                            },
                            email: {
                                required: true,
                                email: true
                            },
                            message: {
                                required: true,
                                minlength: 10
                            }
                        },
                        // Messages for form validation
                        messages: {
                            name: {
                                required: 'Please enter your name',
                            },
                            email: {
                                required: 'Please enter your email address',
                                email: 'Please enter a VALID email address'
                            },
                            message: {
                                required: 'Please enter your message'
                            }
                        },
                        // Ajax form submition
                        submitHandler: function(form) {
                            $(form).ajaxSubmit({
                                success: function() {
                                    $("#contact-form").addClass('submited');
                                }
                            });
                        },
                        // Do not change code below
                        errorPlacement: function(error, element) {
                            error.insertAfter(element.parent());
                        }
                    });

                    var $loginForm = $("#login-form").validate({
                        // Rules for form validation
                        rules: {
                            email: {
                                required: true,
                                email: true
                            },
                            password: {
                                required: true,
                                minlength: 3,
                                maxlength: 20
                            }
                        },
                        // Messages for form validation
                        messages: {
                            email: {
                                required: 'Please enter your email address',
                                email: 'Please enter a VALID email address'
                            },
                            password: {
                                required: 'Please enter your password'
                            }
                        },
                        // Do not change code below
                        errorPlacement: function(error, element) {
                            error.insertAfter(element.parent());
                        }
                    });

                    var $orderForm = $("#order-form").validate({
                        // Rules for form validation
                        rules: {
                            name: {
                                required: true
                            },
                            email: {
                                required: true,
                                email: true
                            },
                            phone: {
                                required: true
                            },
                            interested: {
                                required: true
                            },
                            budget: {
                                required: true
                            }
                        },
                        // Messages for form validation
                        messages: {
                            name: {
                                required: 'Please enter your name'
                            },
                            email: {
                                required: 'Please enter your email address',
                                email: 'Please enter a VALID email address'
                            },
                            phone: {
                                required: 'Please enter your phone number'
                            },
                            interested: {
                                required: 'Please select interested service'
                            },
                            budget: {
                                required: 'Please select your budget'
                            }
                        },
                        // Do not change code below
                        errorPlacement: function(error, element) {
                            error.insertAfter(element.parent());
                        }
                    });

                    // START AND FINISH DATE
                    $('#startdate').datepicker({
                        dateFormat: 'dd.mm.yy',
                        prevText: '<i class="fa fa-chevron-left"></i>',
                        nextText: '<i class="fa fa-chevron-right"></i>',
                        onSelect: function(selectedDate) {
                            $('#finishdate').datepicker('option', 'minDate', selectedDate);
                        }
                    });

                    $('#finishdate').datepicker({
                        dateFormat: 'dd.mm.yy',
                        prevText: '<i class="fa fa-chevron-left"></i>',
                        nextText: '<i class="fa fa-chevron-right"></i>',
                        onSelect: function(selectedDate) {
                            $('#startdate').datepicker('option', 'maxDate', selectedDate);
                        }
                    });



                })

</script>

<!-- Your GOOGLE ANALYTICS CODE Below -->
<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();

</script>
<!-- IMPORTANT: APP CONFIG -->
<script src="../../js/app.config.js"></script>

<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
<script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

<!-- BOOTSTRAP JS -->
<script src="../../js/bootstrap/bootstrap.min.js"></script>

<!-- CUSTOM NOTIFICATION -->
<script src="../../js/notification/SmartNotification.min.js"></script>
<script>


    $(document).ready(function() {
        //pageSetup();
        $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function() {
            $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
        });
        $(".ck_habilitar_is").click(function() {
            if ($(".ck_habilitar_is").prop('checked')) {
                $.ajax({
                    url: "../../contrato",
                    data: "opc=Habilitar_is&id=" + $(".id_contrato").val() + "&estado=1"
                }).done(function() {
                    $.smallBox({
                        title: "¡Alerta!",
                        content: "Se ha autortizado que la secretaria pueda subir e imprimir el contrato.",
                        color: "#296191",
                        iconSmall: "fa fa-cloud",
                        timeout: 4000
                    });

                }).fail(function(jqXHR, textStatus, errorThrown) {
                    $.smallBox({
                        title: "¡Error!",
                        // content: "<i class='fa fa-clock-o'></i> <i>" +jqXHR.responseText+" - "+ textStatus + " - "+errorThrown+" : Se ha producido un error que causo que no se realice la accion...</i>",
                        content: "<i class='fa fa-clock-o'></i> <i>  " + textStatus + " - " + errorThrown + " : Se ha producido un error que causo que no se realice la accion...</i>",
                        color: "#C46A69",
                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                        timeout: 6000
                    });
                });
            } else {
                $.ajax({
                    url: "../../contrato",
                    data: "opc=Habilitar_is&id=" + $(".id_contrato").val() + "&estado=2"
                }).done(function() {
                    $.smallBox({
                        title: "¡Alerta!",
                        content: "Se ha autortizado que la secretaria <strong>NO</strong> pueda subir e imprimir el contrato.",
                        color: "#C79121",
                        iconSmall: "fa fa-cloud",
                        timeout: 4000
                    });
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    $.smallBox({
                        title: "¡Error!",
                        // content: "<i class='fa fa-clock-o'></i> <i>" +jqXHR.responseText+" - "+ textStatus + " - "+errorThrown+" : Se ha producido un error que causo que no se realice la accion...</i>",
                        content: "<i class='fa fa-clock-o'></i> <i>  " + textStatus + " - " + errorThrown + " : Se ha producido un error que causo que no se realice la accion...</i>",
                        color: "#C46A69",
                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                        timeout: 6000
                    });
                });
            }
        });


    });
</script>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }


%>
