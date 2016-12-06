<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.Tipo_Contrato"%>
<%@page import="pe.edu.upeu.application.model.Funciones"%>
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
<%@page import="pe.edu.upeu.application.model.X_List_Id_Contrato_DGP"%>

<jsp:useBean id="List_contra_x_idcto" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Situacion_Actual" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Planilla" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_Condicion_contrato" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_tipo_contrato" scope="session" class="java.util.ArrayList"/>
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
        <style type="text/css">
            body{
                margin-left: auto;
                margin-right: auto  ;
                width: 95%;
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
            .tables{
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
        <title>Información Contractual</title>
       
    </head>
    <body class="slideInDown fast animated">

        <%
            String ID_CTO = request.getParameter("id_cto");
            if (List_contra_x_idcto.size() == 0) {%>
        <h3>Aun no se ha hecho Contrato.</h3>
        <%
        } else {%>

        <div>
            <%
                HttpSession Sesion = request.getSession(true);
                String idrol = (String) Sesion.getAttribute("IDROL");
                InterfaceContratoDAO oContrato = new ContratoDAO();
            %>
            <%for (int b = 0; b < List_contra_x_idcto.size(); b++) {
                    X_List_Id_Contrato_DGP n = new X_List_Id_Contrato_DGP();
                    n = (X_List_Id_Contrato_DGP) List_contra_x_idcto.get(b);
            %>
            <input type="hidden" name="id_con" class="id_contrato" value="<%=n.getId_contrato()%>"> 
            <input type="hidden"  class="idc" value="<%=n.getId_contrato()%>">

            <%if (idrol.trim().equals("ROL-0006") || idrol.trim().equals("ROL-0001")) {
            %>
            <div class="well">
                <div class="row">
                    <div class="col col-md-4">
                        <div class="col col-md-4"> <label class="txt-color-darken">Contratos:</label></div>
                        <div class="col col-md-8"> <div class="SelectorListaContrato">
                            </div></div>
                        <input type="hidden" name="idtr" class="idtr"  value="<%=request.getParameter("idtr")%>">
                    </div>
                    <div class="col col-md-4">
                        <div class="col col-md-8"><div class="smart-form txt-color-darken">¿Decidir la secretaria de departamento o area lo suba e imprima el contrato?</div></div>
                        <div class="col col-md-4 smart-form"><label class='toggle'><input type='checkbox' value='1'  class='ck_habilitar_is'  name='estado' name='checkbox-toggle' <%
                            if (Integer.parseInt(n.getEs_secre_is()) == 1) {
                                out.print("checked");
                            } %> ><i data-swchon-text='SI' data-swchoff-text='NO'></i></label></div>



                        <%}%> 
                    </div>

                    <div class="col col-md-4">

                        <div class="pull-right">
                            <%if (Integer.parseInt(n.getEs_secre_is()) == 2 && idrol.trim().equals("ROL-0002")) {%>

                            <%} else if (!idrol.trim().equals("ROL-0009")) {%>
                            <a class="btn btn-labeled btn-primary" href="../../plantilla_contractual?opc=Imprimir&id_plan_contr=<%=n.getId_plantilla_contractual()%>&idtraba=<%=n.getId_trabajador()%>&id_con=<%=n.getId_contrato()%>&puesto=<%=n.getId_puesto()%>"><span class="btn-label"><i class="fa fa-print"></i></span>Imprimir</a>

                            <%}%>

                            <%if (idrol.trim().equals("ROL-0006") || idrol.trim().equals("ROL-0002") || idrol.trim().equals("ROL-0001")) {
                            %> 

                            <%if (Integer.parseInt(n.getEs_secre_is()) == 2 && idrol.trim().equals("ROL-0002")) {
                            %>
                            <%} else {%>
                            <a class="btn btn-labeled btn-primary " href="../../contrato?opc=Subir_Contrato2&idc=<%=n.getId_contrato()%>" > <span class="btn-label"><i class="fa fa-cloud-upload"></i></span>Subir</a>
                                    <%}%>

                            <%}
                                if (/*idrol.trim().equals("ROL-0006") || */idrol.trim().equals("ROL-0007") || /*idrol.trim().equals("ROL-0009") || */ idrol.trim().equals("ROL-0001")) {%>
                            <%if (idrol.trim().equals("ROL-0006")) {
                                    //validar si puede editar contrato
                                    if (oContrato.validar_editar_contrato(id_user, ID_CTO)) {
                            %>
                            <a class="btn btn-labeled btn-primary" href="../../contrato?opc=Editar&idc=<%=n.getId_contrato()%>&idtr=<%=request.getParameter("idtr")%>&id_dg=<%=n.getId_dgp()%>" > <span class="btn-label"><i class="fa fa-pencil-square-o"></i></span>Editar</a>

                            <%
                                }
                            } else {%>
                            <a class="btn btn-labeled btn-primary" href="../../contrato?opc=Editar&idc=<%=n.getId_contrato()%>&idtr=<%=request.getParameter("idtr")%>&id_dg=<%=n.getId_dgp()%>" > <span class="btn-label"><i class="fa fa-pencil-square-o"></i></span>Editar</a>
                                    <%}
                                        }%>


                        </div>
                    </div>

                </div>
                <br>
                <p class="alert alert-info"><i class="fa fa-info"></i> ¡Una vez procesado la informacion usted ya no podra <strong>editar</strong> este contrato!</p>
            </div>
            <% for (int p = 0; p < List_contra_x_idcto.size(); p++) {%>
            <table class="table table-bordered table-hover table-striped  table-responsive">
                <tr><td class="text-info"><strong>Fecha de Inicio: </strong></td><td colspan="2"><%=n.getFe_desde()%></td><td class="text-info" colspan="2"><strong>Fecha de Cese:</strong></td><td class="" colspan="2"><%if (n.getFe_hasta() != null) {
                        out.print(n.getFe_hasta());
                    } else {
                        out.print("No definido");
                    }%></td></tr>
                <tr><td class="text-info"><strong>Dirección:</strong></td><td colspan="6" class="" ><p><%=n.getNo_direccion()%> </p></td></tr>
                <tr><td class="text-info"><strong>Departamento:</strong></td><td colspan="6" class="" ><p><%=n.getNo_dep()%> </p></td></tr>
                <tr><td class="text-info"><strong>Area:</strong></td><td colspan="6" class="" ><p><%=n.getNo_area()%> </td></tr>
                <tr><td class="text-info"><strong>Sección:</strong></td><td colspan="6" class="" ><p><%=n.getNo_seccion()%> </p></td></tr>
                <tr><td class="text-info"><strong>Puesto:</strong></td><td colspan="6" class="" ><p><%=n.getNo_puesto()%></p><input type="hidden" class="id_pu" value="<%=n.getId_puesto()%>" name="puesto"></td> </tr>
                            <%
                                if (Lis_c_c_id_contr.size() > 0) {
                                    double cantidad = 0.0;
                                    for (int q = 0; q < Lis_c_c_id_contr.size(); q++) {
                                        Centro_Costos cc = new Centro_Costos();
                                        cc = (Centro_Costos) Lis_c_c_id_contr.get(q);

                                        cantidad = Double.parseDouble(cc.getCa_porcentaje()) + cantidad;
                            %>
                <tr>
                    <td class="text-info "><strong>Centro costo Nº<%=q + 1%>:</strong></td>
                    <td colspan="2" class="" ><p><%=cc.getDe_centro_costo() + " - " + cc.getCo_centro_costo()%></p></td>
                    <td class="text-info " colspan="2"><strong>Porcentaje</strong></td>
                    <td colspan="2"><p><%=cc.getCa_porcentaje()%> %</p> </td></tr><%}%>
                <tr><td class="text-info "><strong>Total Porcentaje:</strong></td>
                    <td colspan="6" class="" ><p><%=cantidad%> %</p></td>
                </tr><%} else {%>
                <tr><td class="text-info "><strong>Centro costo </strong></td><td colspan="6" class="" ><p>No tiene</p></td>
                </tr><%}%>

                <tr><td class="text-info "><strong>Condición:</strong></td> <td colspan="6" class="" ><strong style="color:#b71c1c;"><%
                    if (n.getLi_condicion() != null) {
                        for (int h = 0; h < list_Condicion_contrato.size(); h++) {

                            if (n.getLi_condicion().trim().equals(h + 1 + "")) {
                                out.println(list_Condicion_contrato.get(h));
                            }
                        }
                    } else {
                        out.print("No tiene");
                    }%> </strong></td></tr>
                <tr><td class="text-info "><strong>Sueldo:</strong></td><td>S/.<%=n.getCa_sueldo()%></td><td class="text-info " colspan="1"><strong>Reintegro:</strong></td><td colspan="1">S/.<%=n.getCa_reintegro()%></td><td class="text-info " colspan="2"><strong>Bono Alimentario:</strong></td><td class="" >S/.<%=n.getCa_bono_alimento()%> </td></tr>
                <tr><td class="text-info "><strong>Bev:</strong></td><td class=""  colspan="6">S/.<%if (n.getCa_bev() != null) {
                        out.print(n.getCa_bev());
                    } else {
                        out.print("0");
                    }%> </td></tr>
                <tr><td class="text-info "><strong>Bonificacion Puesto:</strong></td><td class=""  colspan="6">S/.<%if (n.getCa_bonificacion_p() != null) {
                        out.print(n.getCa_bonificacion_p());
                    } else {
                        out.print("--");
                    }%> </td></tr>
                <tr><td class="text-info "><strong>Asignación Familiar:</strong></td><td class=""  class="" colspan="6"><%= "S/." + n.getCa_asig_familiar()%> </td></tr>

                <tr><td class="text-info "><strong>Sueldo Total:</strong></td><td class="" colspan="6">S/.<%if (n.getCa_sueldo_total() != null) {
                        out.print(n.getCa_sueldo_total());
                    } else {
                        out.print("0");
                    }%> </td></tr>
                <tr>
                    <td class="text-info "><strong>Religion:</strong></td><td class="" colspan="6"><strong class="text-danger"><%if (n.getLi_religion().equals("1")) {
                            out.print("Adventista");
                        } else if (n.getLi_religion().equals("2")) {
                            out.print("Católico");
                        } else if (n.getLi_religion().equals("3")) {
                            out.print("Otro");
                        } else if (n.getLi_religion() == null) {
                            out.print("Ninguna");
                        }%></strong></td>
                </tr>
                <tr><td class="text-info "><strong>Tipo Pago Horas:</strong></td><td class=""  colspan="6"><%
                    if (n.getTi_hora_pago() != null) {
                        out.print(n.getTi_hora_pago());
                    } else {
                        out.print("--");
                    }

                        %> </td></tr>

                <tr><td class="text-info "><strong>Regimen Laboral Mintra:</strong></td>
                    <%                        if (n.getId_regimen_laboral() != null) {
                            for (int q = 0; q < list_reg_labo.size(); q++) {
                                Regimen_Laboral re = new Regimen_Laboral();
                                re = (Regimen_Laboral) list_reg_labo.get(q);
                                if (n.getId_regimen_laboral().equals(re.getId_regimen_laboral())) {%>
                    <td class=""  class=""  colspan="6"><%=re.getDe_regimen_l()%> </td>
                    <%}
                        }
                    } else {%>
                    <td class=""  colspan="6">No definido</td> 
                    <%}%>
                </tr>
                <tr><td class="text-info "><strong>Modalidad:</strong></td>

                    <td class=""  colspan="6"><%
                        if (n.getDe_modalidad() != null) {
                            out.print(n.getDe_modalidad());
                        } else {
                            out.print("No registrado");
                        }
                        %> </td>

                </tr>
                <tr><td class="text-info "><strong>Sub_Modalidad:</strong></td>

                    <td class=""  colspan="6"><%
                        if (n.getDe_sub_modalidad() != null) {
                            out.print(n.getDe_sub_modalidad());
                        } else {
                            out.print("No registrado");
                        }
                        %> </td>

                </tr>
                <tr><td class="text-info "><strong>Tipo de Contratacion:</strong></td><td class=""  colspan="6"><%
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
                <tr><td class="text-info "><strong>Codigo de Grupo de Ocupaciones:</strong></td>

                    <td class=""  colspan="6"><%
                        if (n.getDe_grupo_ocupacion() != null) {
                            out.print(n.getDe_grupo_ocupacion());
                        } else {
                            out.print("No registrado");
                        }
                        %> </td>

                </tr>
                <tr><td class="text-info "> Fecha de Suscripcion:</td><td class=""  colspan="6"><%
                    if (n.getFe_suscripcion() != null) {
                        out.print(n.getFe_suscripcion());
                    } else {
                        out.print("No Registrado");
                    }%> </td></tr>
                <tr><td class="text-info "><strong>Tipo moneda de pago:</strong></td><td class=""  colspan="6"><%
                    if (n.getCo_ti_moneda() != null) {
                        if (n.getCo_ti_moneda().trim().equals("01")) {
                            out.println("Soles");
                        }
                        if (n.getCo_ti_moneda().trim().equals("02")) {
                            out.println("Dolares");
                        }
                        if (n.getCo_ti_moneda().trim().equals("03")) {
                            out.println("Euros");
                        }
                    } else {
                        out.print("No registrado");
                    }%> </td></tr> 
                <tr><td class="text-info"> Situacion Especial:</td><td colspan="6"><%=n.getDeSituacionEspecial()%></td></tr>
                <tr><td class="text-info"> Tipo de Remuneración Variable:</td><td colspan="6">
                        <%
                            if (n.getCo_ti_rem_variab() != null) {
                                if (n.getCo_ti_rem_variab().trim().equals("1")) {
                                    out.print("Destajo");
                                }
                                if (n.getCo_ti_rem_variab().trim().equals("2")) {
                                    out.print("Comisiones");
                                }
                                if (n.getCo_ti_rem_variab().trim().equals("3")) {
                                    out.print("Ninguno");
                                }

                            } else {
                                out.print("No registrado");
                            }
                        %> </td></tr>
                
                <tr><td class="text-info"><strong>Horas:</strong></td><td class="text-info"><strong>Semanal:</strong></td><td><%=n.getHo_semana()%></td><td class="text-info"><strong>Mensual:</strong></td><td><%=n.getNu_horas_lab() + " h"%></td><td class="text-info"><strong>Dias:</strong></td><td class="" > <%=n.getDia_contrato() + " d"%></td></tr>
                <tr><td class="text-info"><strong>Tipo de Trabajador:</strong></td><td class=""  colspan="6"><%
                    if (n.getTi_trabajador() != null) {
                        if (n.getTi_trabajador().trim().equals("1")) {
                            out.println("Empleado");
                        }
                        if (n.getTi_trabajador().trim().equals("2")) {
                            out.println("Obrero");
                        }
                    } else {
                        out.print("No registrado");
                    }%> </td></tr>   
                <tr><td class="text-info"><strong>Régimen Laboral:</strong></td><td class=""  colspan="6">
                        <%if (n.getLi_regimen_laboral() != null) {
                                if (n.getLi_regimen_laboral().trim().equals("1")) {
                                    out.println("Privado");
                                }
                                if (n.getLi_regimen_laboral().trim().equals("2")) {
                                    out.println("Publico");
                                }
                            } else {
                                out.print("No registrado");
                            }%> </td></tr>   
                <tr><td class="text-info"><strong>Discapacidad:</strong></td><td class="" colspan="6"><%
                    if (n.getEs_discapacidad() != null) {
                        if (n.getEs_discapacidad().equals("1")) {
                            out.println("No");
                        }
                        if (n.getEs_discapacidad().equals("2")) {
                            out.println("Si");
                        }
                    } else {
                        out.println("No Ingresado ");
                    }%> 
                    </td></tr>   
                <tr><td class="text-info"><strong>Tipo de Contrato:</strong></td><td class="" colspan="6">
                        <%if (n.getTi_contrato() != null) {
                                for (int k = 0; k < List_tipo_contrato.size(); k++) {
                                    Tipo_Contrato tc = new Tipo_Contrato();
                                    tc = (Tipo_Contrato) List_tipo_contrato.get(k);
                                    if (n.getTi_contrato().trim().equals(tc.getId_tipo_contrato())) {
                                        out.print(tc.getDe_ti_contrato());
                                    }
                                }
                            } else {
                                out.print("No definido");
                            }%> 
                    </td></tr>   
                <tr><td class="text-info"><strong>Tipo de Convenio:</strong></td><td class="" colspan="6"><%
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
                <tr><td class="text-info"><strong>¿Firmo contrato?:</strong></td><td class="" colspan="6"><%
                    if (idrol.trim().equals("ROL-0006") & n.getEs_firmo_contrato() == null) {%>
                        <a href="../../contrato?fc=s&idc=<%=n.getId_trabajador()%>"  class="boton">SI</a>o<a href="" class="boton">NO</a>
                        <%} else if (n.getEs_firmo_contrato() != null) {
                                if (n.getEs_firmo_contrato().equals("1")) {
                                    out.println("Si");
                                }
                                if (n.getEs_firmo_contrato().equals("2")) {
                                    out.println("No");
                                }
                                if (n.getEs_firmo_contrato().equals("0")) {
                                    out.println("Por confirmar");
                                }
                            } else {
                                out.println("Por confirmar");
                            }
                        %></td></tr>

                <!--  <tr><td>Nro. de Contrato:</td><td><?/* echo $list_rhc[$index][39];*/?> </td></tr>   -->
                <tr><td class="text-info"><strong>Observaciones:</strong></td><td class="" colspan="6"><%
                    if (n.getDe_observacion() != null) {
                        out.print(n.getDe_observacion());
                    } else {
                        out.print("No registrado");
                    }%> </td></tr>   
                <tr><td class="text-info"><strong>Régimen Pensionario:</strong></td><td class="" colspan="6"><%
                    if (n.getLi_regimen_pensionario() != null) {
                        if (n.getLi_regimen_pensionario().trim().equals("1")) {
                            out.println("Privado");
                        }
                        if (n.getLi_regimen_pensionario().trim().equals("2")) {
                            out.println("SNP");
                        }
                    } else {
                        out.println("No registrado");
                    }
                        %> </td></tr>   

                <%if (false) {
                %>
                <tr><td class="text-info"><strong>Situacion Actual:</strong></td><td class="" colspan="6"><%
                    if (n.getEs_contrato() != null) {
                        if (n.getEs_contrato().trim().equals("1")) {
                            out.print("Activo");
                        } else {
                            out.print("Termino Contrato");
                        }
                    }
                        %> </td></tr>   
                        <%}%>
                <tr><td class="text-info"><strong>Filial donde Trabaja:</strong></td><td class="" colspan="6"><%
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
                        <%if (false) {
                        %>
                <tr><td class="text-info"><strong>Fecha de Cese:</strong></td><td class="  " colspan="6">
                        <% if (n.getFe_cese() != null) {
                                out.print(n.getFe_cese());
                            } else {
                                out.print("NO DEFINIDO");
                            }%> </td></tr> 
                        <%}%>
                        <%if (List_x_fun_x_idpu.size() > 0) {%>
                <tr><td class="text-info" colspan="8" style="text-align:center;">Funciones</td></tr>
                <%for (int fu = 0; fu < List_x_fun_x_idpu.size(); fu++) {
                        Funciones fun = new Funciones();
                        fun = (Funciones) List_x_fun_x_idpu.get(fu);
                %>
                <tr><td class="text-info"><strong>Funcion Nº<%=fu + 1%>:</strong></td><td class="" colspan="6"><%=fun.getDe_funcion()%></td></tr>   <%}%>
                    <%}%>


                <tr><%if (n.getUs_modif() != null && n.getFe_modif() != null) {%>
                    <td class="text-info "><strong>Modificado por:</strong></td>
                    <td><%for (int f = 0; f < List_Usuario.size(); f++) {
                            Usuario u = new Usuario();
                            u = (Usuario) List_Usuario.get(f);
                            if (n.getUs_modif().trim().equals(u.getId_usuario().trim())) {
                                out.println(u.getNo_usuario());%>
                        <%}%>
                    </td>
                    <%}
                    } else if (n.getUs_creacion() != null && n.getFe_creacion() != null) {%>
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
                    <td>No Ingresado</td>
                    <%}%>
                    <%}%>

                    <%}%>
                </tr>
            </table>

        </div>



        <%}

        %>


        <%}%>
    </body>
    <script>
        if (!window.jQuery) {
            document.write('<script src="../../js/libs/jquery-2.0.2.min.js"><\/script>');
        }
    </script>

    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script>
        if (!window.jQuery.ui) {
            document.write('<script src="../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
        }
    </script>
    <!-- CUSTOM NOTIFICATION -->
    <script src="../../js/notification/SmartNotification.min.js"></script>
    <script>
        function SelectorListaContrato(objSelector, idtr, idc) {
            $.ajax({
                url: "../../contrato", type: 'POST', data: "opc=SelectorListaContrato&idtr=" + idtr + "&idc=" + idc,
                success: function (data, textStatus, jqXHR) {
                    if (data.rpta) {
                        objSelector.append(data.html);
                        $(".anno").change(function () {
                            window.location.href = '../../contrato?opc=actualizar&idtr=' + $(".idtr").val() + '&idc=' + $(this).val();
                        });
                    }
                }
            });
        }
        $(document).ready(function () {
            $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>");
            });
            SelectorListaContrato($(".SelectorListaContrato"), $(".idtr").val(), $(".idc").val());

            $(".ck_habilitar_is").click(function () {
                if ($(".ck_habilitar_is").prop('checked')) {
                    $.ajax({
                        url: "../../contrato",
                        data: "opc=Habilitar_is&id=" + $(".id_contrato").val() + "&estado=1"
                    }).done(function () {
                        $.smallBox({
                            title: "¡Alerta!",
                            content: "Se ha autortizado que la secretaria pueda subir e imprimir el contrato.",
                            color: "#296191",
                            iconSmall: "fa fa-cloud",
                            timeout: 4000
                        });

                    }).fail(function (jqXHR, textStatus, errorThrown) {
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
                    }).done(function () {
                        $.smallBox({
                            title: "¡Alerta!",
                            content: "Se ha autortizado que la secretaria <strong>NO</strong> pueda subir e imprimir el contrato.",
                            color: "#C79121",
                            iconSmall: "fa fa-cloud",
                            timeout: 4000
                        });
                    }).fail(function (jqXHR, textStatus, errorThrown) {
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
            out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
        }%>
