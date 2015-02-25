
<%@page import="pe.edu.upeu.application.model.Cuenta_Sueldo"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {

%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.When"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.V_Puesto_Direccion"%>
<%@page import="pe.edu.upeu.application.model.Puesto"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<jsp:useBean id="Listar_Trabajador_id" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Det_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Requerimiento" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="list_Cuenta_Sueldo" scope="application" class="java.util.ArrayList"/>

<!DOCTYPE html >
<html>
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Registrar DGP </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
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

        <link rel="stylesheet" href="../../css/Css_Formulario/form.css"  type="text/css" > 
        <script language="javascript" type="text/javascript" src="../../js/JQuery/jQuery.js"></script>


        <style>

            .td{
                font-weight: bold;
            }

            #titu{
                font-weight: bold;
                color: #005cac;
                // color: blue;
            }
            p{
               font-weight: bold; 
            }

        </style>

        <%            HttpSession sesion = request.getSession(true);
            String id_dep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        %>

    </head>
    <body>   


        <div id="main" role="main" style="margin: 0px;">


            <div id="content">
                <section id="widget-grid" class="">
                    <div class="row">
                        <form id="checkout-form" action="../../dgp"  novalidate="novalidate">
                            <!-- NEW COL START -->
                            <article class="col-sm-12 col-md-12 col-lg-6">

                                <div id="alerta_dgp">

                                </div>

                                <!-- Widget ID (each widget will need unique ID)-->
                                <div class="jarviswidget" id="wid-id-2" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-custombutton="false">
                                    <!-- widget options:
                                    usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">
    
                                    data-widget-colorbutton="false"
                                    data-widget-editbutton="false"
                                    data-widget-togglebutton="false"
                                    data-widget-deletebutton="false"
                                    data-widget-fullscreenbutton="false"
                                    data-widget-custombutton="false"
                                    data-widget-collapsed="true"
                                    data-widget-sortable="false"
    
                                    -->
                                    <header>
                                        <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                        <h2>Registrar Requerimiento</h2>

                                    </header>

                                    <!-- widget div-->
                                    <div>

                                        <!-- widget edit box -->
                                        <div class="jarviswidget-editbox">
                                            <!-- This area used as dropdown edit box -->

                                        </div>
                                        <!-- end widget edit box -->

                                        <!-- widget content -->
                                        <div class="widget-body no-padding">

                                            <div class="smart-form" id="form_dgp"  method="post" action="../../dgp">
                                                <header class="titulo_req">

                                                    <div class="spacing">
                                                        <center><h1 class="spacing" style="font-weight: bold; margin: 0px;  color: #005cac;"> Documento de Gestión de Personal</h1></center>
                                                        <br>

                                                    </div>
                                                    <br>

                                                </header>

                                                <fieldset id="fila-agregar">

                                                    <%
                                                        /*Temporal*/
                                                        String idreq = request.getParameter("idreq");

                                                        for (int i = 0; i < Listar_Trabajador_id.size(); i++) {
                                                            V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                                                            tr = (V_Ficha_Trab_Num_C) Listar_Trabajador_id.get(i);
                                                    %>
                                                    <div class="row">
                                                        <input value= "<%=tr.getId_trabajador()%>"  type="hidden" id="" />
                                                        <section class="col col-6">
                                                            <label class="label" id="titu">Trabajador :</label>
                                                            <label class="input" style="color: red; font-weight: bold;">
                                                                <%=tr.getAp_paterno() + " " + tr.getAp_materno() + " " + tr.getNo_trabajador()%>
                                                                <input type="hidden" value="<%=tr.getId_trabajador()%>" name="IDDATOS_TRABAJADOR" class="id_tr input-xs">
                                                                <% }
                                                                    if (Listar_Trabajador_id.size() == 0) { %>   
                                                                <%}%>
                                                            </label>
                                                        </section>
                                                        <section  class="col col-6">
                                                            <label class="select" id="titu">CARGAR DATOS
                                                                <select  class="btn-list-req" >
                                                                    <option value="" selected=""  >[SELECCIONE]</option>

                                                                </select>
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <script>$(document).ready(function() {
                                                            var lista_dgp = $(".btn-list-req");
                                                            $.post("../../dgp", "opc=Listar_Req&idtr=" + $(".id_tr").val(), function(objJson) {
                                                                if (objJson.rpta == -1) {
                                                                    alert(objJson.mensaje);
                                                                    return;
                                                                }
                                                                var lista = objJson.lista;
                                                                if (lista.length == 0) {
                                                                    lista_dgp.empty();
                                                                    lista_dgp.append('<option value="">[NO TIENE]</option>');
                                                                } else {
                                                                    for (var t = 0; t < lista.length; t++) {
                                                                        lista_dgp.append('<option value="' + lista[t].id + '">' + lista[t].desc + '</option>');
                                                                    }
                                                                }


                                                            });

                                                            lista_dgp.change(function() {
                                                                $.post("../../dgp", "opc=Listar_Datos&idc=" + $(this).val(), function(objJson) {

                                                                    if (objJson.rpta == -1) {
                                                                        alert(objJson.mensaje);
                                                                        return;
                                                                    }
                                                                    var lis_datos = objJson.lista;
                                                                    for (var v = 0; v < lis_datos.length; v++) {
                                                                        $("#sueldo").val(lis_datos[v].sueldo);
                                                                        $("#bono_al").val(lis_datos[v].bono_alimentario);
                                                                        $("#bev").val(lis_datos[v].bev);
                                                                        calcular_sueldo_total();
                                                                        $(".ant_policiales").val(lis_datos[v].ant_pol);
                                                                        $(".essalud").val(lis_datos[v].essalud);
                                                                        $("#banco").val(lis_datos[v].banco);
                                                                        cuenta_bancaria($("#banco").val());
                                                                        $("#nu_cuen_otros").val(lis_datos[v].banco_otros);
                                                                        $("#nu_cuen").val(lis_datos[v].cuenta);
                                                                        $("#nu_cuen_ban").val(lis_datos[v].cuenta_bancaria);
                                                                        $("#subscription").val(lis_datos[v].gen_cuenta);
                                                                    }



                                                                });
                                                                $.post("../../centro_costo", "opc=Cargar_cc_DGP&id_c=" + $(this).val(), function(objJson) {
                                                                    var lista = objJson.lista;

                                                                    for (var i = 0; i < lista.length; i++) {
                                                                        var dep_actual = $(".dep_actual").val();
                                                                        if (lista[i].id_dep == dep_actual) {
                                                                            $(".centro_costo1").val(lista[i].id_cc);
                                                                            $(".porcentaje_cc").val(lista[i].porcent_cc);
                                                                        } else {
                                                                            var arr_cc = [lista[i].id_dir, lista[i].id_dep, "0", lista[i].porcent_cc, lista[i].id_cc];
                                                                            agregar_centro_costo("1", arr_cc);
                                                                            //alert();

                                                                        }


                                                                    }


                                                                });
                                                                $("#horario").val("2");
                                                                list_horario($("#horario").val());
                                                            });

                                                            $(".cl").click(function() {

                                                            });
                                                        });
                                                    </script>

                                                    <section>
                                                        <label class="label" id="titu">Puesto | Seccion | Area:</label>
                                                        <label class="select">
                                                            <select name="IDPUESTO"  required="" >
                                                                <option value="">[SELECCIONE]</option>

                                                                <%
                                                                    for (int j = 0; j < List_Puesto.size(); j++) {
                                                                        V_Puesto_Direccion p = new V_Puesto_Direccion();
                                                                        p = (V_Puesto_Direccion) List_Puesto.get(j);
                                                                %>
                                                                <option value="<%=p.getId_puesto()%>"><% out.println(p.getNo_puesto() + " | " + p.getNo_seccion() + " | " + p.getNo_area());%></option> <%} %>
                                                            </select>
                                                        </label>
                                                    </section>

                                                    <section>
                                                        <label class="label" id="titu">Requerimiento :</label>
                                                        <label class="select">
                                                            <select name="IDREQUERIMIENTO"    disabled="" onchange="mostrar()"  id="nom_req"  > 
                                                                <option value=""></option>

                                                                <%
                                                                    for (int index = 0; index < Listar_Requerimiento.size(); index++) {
                                                                        Requerimiento r = new Requerimiento();
                                                                        r = (Requerimiento) Listar_Requerimiento.get(index);
                                                                        if (idreq.equals(r.getId_requerimiento())) {
                                                                %>
                                                                <option value="<%=r.getId_requerimiento()%>" selected=""  ><%=r.getNo_req()%></option>
                                                                <%} else {%>
                                                                <option value="<%=r.getId_requerimiento()%>"><%=r.getNo_req()%></option>                      
                                                                <%                          }
                                                                    }%>
                                                            </select> 
                                                        </label>
                                                    </section>
                                                    <div class="row" >
                                                        <section class="col col-6">
                                                            <label class="select" id="titu">
                                                                Motivo :<select name="MOTIVO" class="ant_policiales" required="" >
                                                                    <option value="" >[SELECCIONE]</option>
                                                                    <option value="1" selected="">Trabajdor Nuevo</option>
                                                                    <option value="2">Renovación</option>
                                                                </select>
                                                            </label>

                                                        </section>
                                                        <section class="col col-2" style=" margin-top:2%;">
                                                            <label class="toggle" id="titu" > MFL:
                                                                <input type="checkbox" value="1"   name="MFL" name="checkbox-toggle" >
                                                                <i data-swchon-text="SI" data-swchoff-text="NO"></i>
                                                            </label>
                                                        </section>
                                                    </div>

                                                    <div class="row">
                                                        <section class="col col-6" >
                                                            <label class="input" id="titu">Fecha de Inicio :
                                                                <input type="date" name="FEC_DESDE" id="datepicker" required="" >
                                                            </label>
                                                        </section>
                                                        <section class="col col-6">
                                                            <label class="input"  id="titu"> 
                                                                Fecha de Cese :<input type="date" name="FEC_HASTA"  required="" id="datepicker">
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <div class="row">
                                                        <section class="col col-3" >
                                                            <label class="input" id="titu">Sueldo :
                                                                <input type="text" name="SUELDO" required="" maxlength="13" value=""  id="sueldo" >
                                                            </label>
                                                        </section>
                                                        <%if (idreq.equals("REQ-0001") || idreq.equals("REQ-0002") || idreq.equals("REQ-0003") || idreq.equals("REQ-0005")) {

                                                        %> 
                                                        <section class="col col-3">
                                                            <label class="input"  id="titu"> 
                                                                Bono de Alimentos :<input type="text" maxlength="13"  value="0.0" name="BONO_ALIMENTARIO"  id="bono_al">
                                                            </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label class="input"  id="titu"> 
                                                                Bonoificaion Puesto :<input type="text" maxlength="13"  value="0.0" name="BONO_PUESTO"  id="bono_pu">
                                                            </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label class="input"  id="titu"> 
                                                                BEV :<input type="text" name="BEV" maxlength="13" value="0.0" id="bev">
                                                            </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label class="input"  id="titu"> 
                                                                Sueldo Total :<div id="suel_total" style="color: red;">0.0</div>
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <div  class="row" >
                                                        <section class="col col-4">
                                                            <label class="select" id="titu">
                                                                Antecedentes Policiales :<select name="ANTECEDENTES_POLICIALES" class="ant_policiales" >
                                                                    <option value="" >[SELECCIONE]</option>
                                                                    <option value="1" selected="">No</option>
                                                                    <option value="2">Si</option>
                                                                </select>
                                                            </label>

                                                        </section>
                                                        <section class="col col-4">

                                                            <label class="select" id="titu">
                                                                Certificado de Salud: 
                                                                <select name="CERTIFICADO_SALUD" required=""  class="essalud">
                                                                    <option value="">[SELECCIONE]</option>
                                                                    <option value="1">Si</option>
                                                                    <option selected="" value="0">No</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                    </div>

                                                    <%String es_cue_sue = request.getParameter("es_cs");%>
                                                    <input type="hidden" name="ESTADO" value="<%=es_cue_sue%>">
                                                    <%if (es_cue_sue.equals("0")) {%>

                                                    <input type="hidden" name="ES_CUENTA_SUELDO" value="1" />
                                                    <div class="row"> 
                                                        <section class="col col-3" name="">
                                                            <label class="select" id="titu">Cta Sueldo - Banco:
                                                                <select name="BANCO" id="banco" required="">
                                                                    <option value="" selected="" disabled="" >[Selecione]</option>
                                                                    <option value="0" >Ninguno</option>
                                                                    <option value="1" >BBVA</option>
                                                                    <option value="2" >BCP</option>
                                                                    <option value="3" >Otros</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-3" id="no_cuen_otros">

                                                            <label class="input" id="titu">Nombre Banco :
                                                                <input type="text" name="BANCO_OTROS"  id="nu_cuen_otros" maxlength="30"   />
                                                            </label>

                                                        </section>
                                                        <section class="col col-4" id="no_cuen">

                                                            <label class="input" id="titu">Nro Cuenta :
                                                                <input type="text" name="CUENTA"  id="nu_cuen" maxlength="30"   />
                                                            </label>

                                                        </section>
                                                        <section class="col col-4"  id="no_cuen_ban">

                                                            <label class="input" id="titu">Nro Cuenta Bancaria:
                                                                <input type="text" name="CUENTA_BANC" id="nu_cuen_ban">
                                                            </label>

                                                        </section>

                                                        <section class="col col-3" id="generar">
                                                            <label class="checkbox" >
                                                                <input type="checkbox" name="GEN_NU_CUEN" id="subscription"  value="1">
                                                                <i></i>Generar Nro de Cuenta Bancaria</label>
                                                        </section>

                                                    </div>
                                                    <%} else { %>
                                                    <%for (int i = 0; i < list_Cuenta_Sueldo.size(); i++) {
                                                            Cuenta_Sueldo cs = new Cuenta_Sueldo();
                                                            cs = (Cuenta_Sueldo) list_Cuenta_Sueldo.get(i);

                                                    %>
                                                    <div class="row"> 

                                                        <section class="col col-3" name="">
                                                            <label class="select" id="titu" >Cta Sueldo - Banco:
                                                                <select name="BANCO"  required="" disabled="">
                                                                    <%if (cs.getNo_banco().equals("0")) { %>
                                                                    <option >Ninguno</option>
                                                                    <%}
                                                                        if (cs.getNo_banco().equals("1")) {%>
                                                                    <option >BBVA</option>
                                                                    <%}
                                                                        if (cs.getNo_banco().equals("2")) { %>
                                                                    <option >BCP</option>
                                                                    <%}
                                                                        if (cs.getNo_banco().equals("3")) { %>
                                                                    <option >Otros</option>
                                                                    <% }%>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <%if (cs.getNo_banco_otros() != null) {%>
                                                        <section class="col col-3">
                                                            <label class="input" id="titu">Nombre Banco :
                                                                <input type="text" disabled="" value="<%=cs.getNo_banco_otros()%>"   />
                                                            </label>
                                                        </section>
                                                        <%}
                                                            if (cs.getNu_cuenta() != null) {%>
                                                        <section class="col col-4">
                                                            <label class="input" id="titu">Nro Cuenta :
                                                                <input type="text" disabled="" value="<%=cs.getNu_cuenta()%>"   />
                                                            </label>
                                                        </section>
                                                        <%}
                                                            if (cs.getNu_cuenta_banc() != null) {%>
                                                        <section class="col col-4">
                                                            <label class="input" id="titu">Nro Cuenta Bancaria:
                                                                <input type="text" disabled="" value="<%=cs.getNu_cuenta_banc()%>">
                                                            </label>
                                                        </section>
                                                        <%}
                                                        %>
                                                        <section class="col col-5" >

                                                            <p >Autorizo a la UPeU gestionar mi cuenta de sueldo en el BBVA Banco Continental, para tal efecto adjunto copia legible y vigente de mi DNI   </p>
                                                            <label class="checkbox" >
                                                                <%if (cs.getEs_gem_nu_cuenta().equals("1")) {%>
                                                                <input type="checkbox" name="GEN_NU_CUEN" checked="" id="subscription"  value="1">
                                                                <%} else {%>
                                                                <input type="checkbox" name="GEN_NU_CUEN" id="subscription"  value="1">
                                                                <%}%>
                                                                <i></i>Generar Nro de Cuenta Bancaria</label>
                                                        </section>
                                                        <%
                                                        %>
                                                    </div>

                                                    <%          }
                                                            }
                                                        }
                                                        if (idreq.equals("REQ-0010")) {%>  
                                                    <div class="">
                                                        <section class="col col-4" >
                                                            <label class="input" id="titu"> RUC:
                                                                <input type="text" name="RUC" id="" maxlength="20" required="" >
                                                            </label>

                                                        </section>
                                                    </div>
                                                    <div class="">
                                                        <section class="col col-6" >
                                                            <label class="input" id="titu"> Domicilio Fiscal:
                                                                <input type="text" name="DOMICILIO_FISCAL" id="" required="" >
                                                            </label>
                                                        </section>
                                                        <%}%>
                                                        <%if (idreq.equals("REQ-0010") || idreq.equals("REQ-0011")) {%>
                                                        <section class="col col-6" >
                                                            <label class="input" id="titu"> Lugar de Servicio:
                                                                <input type="text" name="LUGAR_SERVICIO" id="" required="" >
                                                            </label>
                                                        </section>
                                                        <section class="col col-lg-12" >
                                                            <label class="textarea" id="titu" >Descripcion del Servicio 										
                                                                <textarea rows=4 name="DESCRIPCION_SERVICIO"></textarea> 
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="btn">
                                                                <button type="button" class="btn btn-default" id="btn_add" >Agregar</button>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2" >
                                                            <label class="input" id="titu"> CUOTA:
                                                                <input type="text" name="CUOTA_1" id="cuota" required="" value="1" >
                                                            </label>
                                                        </section>
                                                        <section class="col col-4" >
                                                            <label class="input" id="titu">Fecha a Pagar :
                                                                <input type="date" name="FEC_PAGAR_1" id="datepicker" required="" >
                                                            </label>
                                                        </section>
                                                        <section class="col col-4" >
                                                            <label class="input" id="titu">Monto :
                                                                <input type="text" name="MONTO_1" required=""  value="0.0"  class="monto" >
                                                            </label>
                                                        </section>
                                                        <input type="hidden" value="1" name="ES_PERIODO" />
                                                        <input type="hidden" value="1" name="CANT" class="cant" />

                                                    </div>

                                                    <%}%>
                                                    <%if (idreq.equals("REQ-0007") || idreq.equals("REQ-0008") || idreq.equals("REQ-0009") || idreq.equals("REQ-0001") || idreq.equals("REQ-0002") || idreq.equals("REQ-0003") || idreq.equals("REQ-0005")) {%>
                                                    <div  class="row" id="centro-costo_1" >
                                                        <section class="col col-4"><label class="select" id="titu">Centro de Costo Nº 1:<select name="CENTRO_COSTOS_1" class="select-cc centro_costo1" required=""><option value="">[SELECCIONE]</option></select></label></section>
                                                        <section class="col col-2"><label class="input" id="titu">%<input name="PORCENTAJE_1"  type="text" value="100"  class="porcentaje_cc"/></label></section>


                                                        <section class="col col-2"><label class="btn"><button type="button" class="btn btn-default btn-agregar-cc" id="btn-agregar-cc" >Agregar</button></label></section>
                                                        <section class="col col-2"><label class="input" style="font-weight: bold;color:red;">% Total :<input  readonly="" name="TOTAL_PORCENTAJE" max="100" min="100" maxlength="3" type="text" class="total_porcentaje"  /></label></section>
                                                    </div>
                                                    <input type="hidden" value="1" name="numero" class="cant-input" />
                                                    <%}%>
                                                    <code class="ver"></code>
                                                    <input type="hidden" name="IDREQUERIMIENTO"  id="combito"  value="<%=idreq%>">
                                                    <div id="div_2" class="contenido" style="display: none">
                                                        <table  class="table">
                                                            <tr><td class="td">Subvencion:</td><td><input type="text" name="SUBVENCION"  ></td></tr>   
                                                            <tr><td class="td">Horario de Capacitacion:</td><td><input type="text" name="HORARIO_CAPACITACION"  ></td></tr>   
                                                            <tr><td class="td">Horario de Refrigerio:</td><td><input type="text" name="HORARIO_REFRIGERIO"  ></td></tr>  
                                                            <tr><td class="td">Dias de Capacitacion:</td><td><input type="text" name="DIAS_CAPACITACION" ></td></tr>  
                                                        </table>
                                                    </div  >

                                                    <div id="div_3" class="contenido" style="display:none ">
                                                        <table class="table">
                                                            <tr><td class="td">Monto del Honorario:</td><td><input type="text" name="MONTO_HONORARIO" ></td></tr>   
                                                        </table>
                                                    </div>

                                                </fieldset>
                                            </div>

                                        </div>
                                        <!-- end widget content -->

                                    </div>
                                    <!-- end widget div -->

                                </div>
                                <!-- end widget -->

                            </article>


                            <article class="col-sm-12 col-md-12 col-lg-6">

                                <!-- Widget ID (each widget will need unique ID)-->
                                <div class="jarviswidget" id="wid-id-1" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false" data-widget-deletebutton="false">
                                    <!-- widget options:
                                    usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">
    
                                    data-widget-colorbutton="false"
                                    data-widget-editbutton="false"
                                    data-widget-togglebutton="false"
                                    data-widget-deletebutton="false"
                                    data-widget-fullscreenbutton="false"
                                    data-widget-custombutton="false"
                                    data-widget-collapsed="true"
                                    data-widget-sortable="false"
                                    -->
                                    <header>
                                        <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                        <h2>Registrar Horario</h2>

                                    </header>

                                    <!-- widget div-->
                                    <div>

                                        <!-- widget edit box -->
                                        <div class="jarviswidget-editbox">
                                            <!-- This area used as dropdown edit box -->

                                        </div>
                                        <!-- end widget edit box -->

                                        <!-- widget content -->
                                        <div class="widget-body no-padding">

                                            <div class="smart-form" >
                                                <header class="titulo_req">

                                                    <div class="spacing">
                                                        <center><h1 class="spacing" style="font-weight: bold; margin: 0px;  color: #005cac;"> Horario</h1></center>
                                                        <br>

                                                    </div>
                                                </header>

                                                <fieldset>

                                                    <section>
                                                        <label class="label" id="titu">Tipo de Horario :</label>
                                                        <label class="select">

                                                            <select id="horario" required="" name="HORARIO" >
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="0">Editable</option>

                                                            </select>

                                                        </label>
                                                    </section>
                                                    <div class="row">
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">LUNES
                                                                <select id=select_lun >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">MARTES
                                                                <select id=select_mar >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2" >
                                                            <label class="select" id="titu">MIERCOLES
                                                                <select id=select_mier  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">JUEVES
                                                                <select id=select_jue  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select> 
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">VIERNES
                                                                <select id=select_vie  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">SABADO
                                                                <select id=select_sab  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>

                                                        <section class="col col-2">
                                                            <label class="select" id="titu">DOMINGO
                                                                <select id=select_dom >

                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <div class="input-desp">
                                                        <table style="" id="show_lun" class="cont_lun"> 
                                                            <tr><td align="center" colspan="2">Lunes</td></tr>


                                                        </table>

                                                        <table id="show_mar" class="cont_mar">     
                                                            <tr><td align="center" colspan="2">Martes</td></tr>

                                                        </table>
                                                        <table id="show_mie" class="cont_mie">     
                                                            <tr ><td align="center" colspan="2">Miercoles</td></tr>

                                                        </table>


                                                        <table id="show_jue" class="cont_jue">     
                                                            <tr><td align="center" colspan="2">Jueves</td></tr>

                                                        </table>
                                                        <table id="show_vie" class="cont_vie">     
                                                            <tr><td align="center" colspan="2">Viernes</td></tr>

                                                        </table>
                                                        <table id="show_sab" class="cont_sab">     
                                                            <tr><td align="center" colspan="2">Sábado</td></tr>

                                                        </table>
                                                        <table id="show_dom" class="cont_dom" >
                                                            <tr><td align="center" colspan="2">Domingo</td></tr>

                                                        </table>
                                                        <div class="h_total" style="color: red; font-weight: bold;">Horas Totales : 00:00 horas</div>
                                                        <input  readonly="" type="text" name="horas_totales" class="h_total" required="" max="48"/>
                                                        <input  type="hidden" name="dep_actual" value="<%=id_dep%>" class="dep_actual" />
                                                    </div>
                                                </fieldset>
                                                <footer>
                                                    <button type="submit" class="btn btn-primary btn-labeled">
                                                        Siguiente  <i class="fa fa-arrow-circle-right"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-default" onclick="window.history.back();">
                                                        <i class="fa fa-arrow-circle-left"></i>  Regresar
                                                    </button>
                                                </footer>
                                            </div>


                                        </div>
                                        <!-- end widget content -->

                                    </div>
                                    <!-- end widget div -->

                                </div>
                                <!-- end widget -->

                            </article>
                            <!-- END COL -->


                            <input type="hidden" name="opc"  class="submit" value="Registrar">
                        </form>


                    </div>

                </section>
            </div>
        </div>

    </body>
    <script>
        $(document).ready(function() {
            var b = $("#alerta_dgp");
            // $("#alerta_dgp").hide();
            function listar() {
                $.post("../../plazo_dgp", "opc=Listar", function(objJson) {
                    b.empty();
                    var lista = objJson.lista;
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    for (var i = 0; i < lista.length; i++) {
                        b.append("<div class='alert alert-danger alert-block' ><a class='close' data-dismiss='alert' href='#'>×</a><h4 class='alert-heading'>" + lista[i].nom + "</h4>" + lista[i].det + " , Fecha Plazo " + lista[i].desde + " al " + lista[i].hasta + "</div>");
                    }
                });
            }
            listar();
        });
        var cantidad = 1;

        $("#btn_add").click(function() {
            var agregar = $('#fila-agregar');
            var texto = "";
            cantidad++;
            texto += '<section class="col col-2"><label class="btn">';
            texto += '<button type="button" class="btn btn-default" id="less_add" >Eliminar</button>';
            texto += '</label></section>';
            texto += '<section class="col col-2" ><label class="input" id="titu">';
            texto += '<input type="text" name="CUOTA_' + cantidad + '" id="cuota" required="" value="' + cantidad + '" >';
            texto += '</label></section>';
            texto += '<section class="col col-4" ><label class="input" id="titu">';
            texto += '<input type="date" name="FEC_PAGAR_' + cantidad + '" id="datepicker" required="" >';
            texto += '</label></section>';
            texto += '<section class="col col-4" ><label class="input" id="titu">';
            texto += '<input type="text" name="MONTO_' + cantidad + '" required="" class="monto" >';
            texto += '</label></section>';

            agregar.append(texto);
            periodo_pago(cantidad);
            $(".cant").val(cantidad);
            //alert($(".cant").val())
        });

        $(document).ready(
                function() {
                    $("#sueldo").keyup(
                            function() {
                                var sueldo = parseFloat($("#sueldo").val());
                                $(".monto").val(Math.round(sueldo));
                            });
                }
        );
        function periodo_pago(cantidad) {
            var sueldo = parseFloat($("#sueldo").val());
            var p_p = sueldo / cantidad;
            $.each($(".monto"), function() {
                $(".monto").val(p_p);
            });
        }
        function calcular_sueldo_total() {
            var x = parseFloat($("#sueldo").val());
            var y = parseFloat($("#bono_al").val());
            var w = parseFloat($("#bono_pu").val());
            var z = parseFloat($("#bev").val());
            var v = x + y + z + w;
            $("#suel_total").text(Math.round(v * 100) / 100);
        }
        $(document).ready(
                function() {
                    $("#sueldo").keyup(
                            function() {
                                calcular_sueldo_total();
                            }
                    );
                    $("#bono_al").keyup(
                            function() {
                                calcular_sueldo_total();
                            }
                    );
                    $("#bev").keyup(
                            function() {
                                calcular_sueldo_total();
                            }
                    );
                    $("#bono_pu").keyup(
                            function() {
                                calcular_sueldo_total();
                            }
                    );
                }
        );</script>
    <script>
        /*$(".texto-h").setMask("29:59").keypress(
         function () {
         var currentMask = $(this).data('mask').mask;*/
        //var newMask = $(this).val().match(/^2.*/) ? "23:59" : "29:59";
        /*  if (newMask != currentMask) {
         $(this).setMask(newMask);
         }
         });
         $(".texto-h").attr("data-mask", "29:59");*/

    </script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function() {
            $(".contenido").hide();
            /*TEMPORAL*/
            //Planilla
            //if ($("#combito").val()=="REQ-0001" | $("#combito").val() == "REQ-0002" | $("#combito").val() == "REQ-0003" | $(this).val() == "REQ-0004" | $(this).val() == "REQ-0005" | $(this).val() == "REQ-0006") {
            if (true) {
                $(".contenido").hide();
                $("#div_1").show();
            }
            //Fuera PLanilla
            if ($("#combito").val() == 7 | $(this).val() == 8 | $(this).val() == 9) {
                $(".contenido").hide();
                $("#div_2").show();
            }
            //Otros
            if ($("#combito").val() == 10 | $(this).val() == 11 | $(this).val() == 12) {
                $(".contenido").hide();
                $("#div_3").show();
            }

        });</script>
    <script language="javascript" type="text/javascript">
        $(document).ready(
                function mostrar() {
                    $(".texto-h").mask("99:99", {placeholder: "X"});
                    $(".cont_lun").hide();
                    $(".cont_mar").hide();
                    $(".cont_mie").hide();
                    $(".cont_jue").hide();
                    $(".cont_vie").hide();
                    $(".cont_sab").hide();
                    $(".cont_dom").hide();


                    $("#select_lun").change(
                            function() {
                                if ($(this).val() == 1) {
                                    $("#show_lun").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_lun").hide();
                                    $("#show_lun input").val("");
                                }
                            }
                    );
                    $("#select_mar").change(
                            function() {
                                if ($(this).val() == 1) {
                                    $("#show_mar").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_mar").hide();
                                    $("#show_mar input").val("");
                                }
                            }
                    );
                    $("#select_mie").change(
                            function() {
                                if ($(this).val() == 1) {
                                    $("#show_mie").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_mie").hide();
                                    $("#show_mie input").val("00:00");
                                }
                            }
                    );
                    $("#select_jue").change(
                            function() {
                                if ($(this).val() == 1) {
                                    $("#show_jue").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_jue").hide();
                                    $("#show_jue input").val("");
                                }
                            }
                    );
                    $("#select_vie").change(
                            function() {
                                if ($(this).val() == 1) {
                                    $("#show_vie").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_vie").hide();
                                    $("#show_vie input").val("");
                                }
                            }
                    );
                    $("#select_sab").change(
                            function() {
                                if ($(this).val() == 1) {
                                    $("#show_sab").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_sab").hide();
                                    $("#show_sab input").val("");
                                }
                            }
                    );
                    $("#select_dom").change(
                            function() {
                                if ($(this).val() == 1) {
                                    $("#show_dom").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_dom").hide();
                                    $("#show_dom input").val("");
                                }
                            }
                    );
                }

        );</script>
    <script  language="javascript" type="text/javascript">
        function calcularHoras() {
            var dias_semana = new Array("lun", "mar", "mie", "jue", "vie", "sab", "dom");
            var acum = 0;
            for (var i = 0; i < dias_semana.length; i++) {

                for (var j = 0, max = 5; j < max; j++) {
                    var horaTurno = 0;
                    //var str = $("#HORA_DESDE_" + dias_semana[i] + j).val();

                    var Desde = $(".HORA_DESDE_" + dias_semana[i] + (j + 1)).val();
                    var Hasta = $(".HORA_HASTA_" + dias_semana[i] + (j + 1)).val();
                    if ($(".HORA_DESDE_" + dias_semana[i] + (j + 1)).val() == null) {
                        Desde = "00:00";
                        Hasta = "00:00";
                    }
                    //  var arrDesde = $(str).val().split(":");
                    //if (typeof Desde !== 'undefined' && typeof Hasta !== 'undefined') {
                    var arrDesde = Desde.split(":");
                    var arrHasta = Hasta.split(":");
                    horaTurno = (((parseInt(arrHasta[0]) * 60) + (parseInt(arrHasta[1]))) - ((parseInt(arrDesde[0]) * 60) + (parseInt(arrDesde[1]))));
                    // alert(horaTurno + Desde + ".HORA_DESDE_" + dias_semana[i] + (j + 1));

                    acum = acum + horaTurno;
                    // }
                }
            }
            var minutos_totales = acum;
            acum = acum / 60;
            var min = ((acum - parseInt(acum)) * 60);
            min = parseInt(min.toPrecision(2));
            $(".h_total").text("Hora Semanal Total : " + parseInt(acum) + ":" + min + " Horas.");
            $(".h_total").val(acum);
            if (minutos_totales > 2880) {

            }
        }
        function listar_dep_cc(x, opc, arr_cc) {

            var cc_dep = $(".cc-dep" + x);
            $.post("../../centro_costo?opc=Listar_dep", "&id_dir=" + $(".cc-dir" + x).val(), function(objJson) {

                cc_dep.empty();
                cc_dep.append("<option value=''>[DEPARTAMENTO]</option>");
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                for (var i = 0; i < lista.length; i++) {
                    if (opc == "1") {
                        if (arr_cc[1] == lista[i].id) {
                            cc_dep.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                            listar_centro_costo(x, opc, arr_cc);


                        } else {
                            cc_dep.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                        }
                    } else {
                        cc_dep.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                    }

                }
            });

        }
        function listar_centro_costo(x, opc, arr_cc) {

            var centro_costo = $(".centro_costo" + x);
            $.post("../../centro_costo?opc=Listar_CC", "&id_dep=" + $(".cc-dep" + x).val(), function(objJson) {
                centro_costo.empty();
                centro_costo.append("<option value=''>[CENTRO COSTO]</option>");
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                for (var i = 0; i < lista.length; i++) {


                    if (opc == "1") {
                        if (arr_cc[4] == lista[i].id) {
                            centro_costo.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");



                        } else {
                            centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                        }
                    } else {
                        centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                    }

                }
            });

        }
        function listar_cc(num, opc, arr_cc) {
            var select_cc = $(".select-cc");
            $.post("../../centro_costo?opc=Listar_cc", function(objJson) {
                //  select_cc.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                for (var i = 0; i < lista.length; i++) {
                    select_cc.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                }

            });
            var cc_dir = $(".cc-dir" + num);
            $.post("../../centro_costo?opc=Listar_dir", function(objJson) {
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                for (var i = 0; i < lista.length; i++) {
                    if (opc == "1") {
                        if (arr_cc[0] == lista[i].id) {
                            cc_dir.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                            listar_dep_cc(num, opc, arr_cc);

                        } else {
                            cc_dir.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                        }
                    } else {
                        cc_dir.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                    }
                }
            });
            $(".cc-dir" + num).change(function() {

                listar_dep_cc(num, "0", arr_cc);
            });
            $(".cc-dep" + num).change(function() {

                listar_centro_costo(num, "0", arr_cc);
            });
            $(".remover" + num).click(function() {
                $(".centro-costo_" + num).remove();
                sumn_porcen_total();

            });
        }
        function sumn_porcen_total() {

            var acum = 0;
            $.each($(".porcentaje_cc"), function() {
                acum = acum + parseFloat($(this).val());
            });
            $(".total_porcentaje").val(acum);
        }

        function list_horario(valor) {


            if (valor == 0) {
                $(".cont_lun").hide();
                $(".cont_mar").hide();
                $(".cont_mie").hide();
                $(".cont_jue").hide();
                $(".cont_vie").hide();
                $(".cont_sab").hide();
                $(".cont_dom").hide();
                $("#select_lun").val(2);
                $("#select_mar").val(2);
                $("#select_mie").val(2);
                $("#select_jue").val(2);
                $("#select_vie").val(2);
                $("#select_sab").val(2);
                $("#select_dom").val(2);
            } else {


                var dias_semana = new Array("lun", "mar", "mie", "jue", "vie", "sab", "dom");
                $(".tr-dia").remove();
                $.post("../../formato_horario", "opc=Listar_Horario&id=" + valor, function(objJson) {
                    var lista = objJson.lista;
                    for (var f = 0; f < dias_semana.length; f++) {

                        var d = 0;
                        for (var i = 0; i < lista.length; i++) {

                            if (dias_semana[f] == lista[i].dia) {
                                var scntDiv = $('#show_' + dias_semana[f]);

                                $(".cont_" + dias_semana[f]).show();

                                $("#select_" + dias_semana[f]).val(1);

                                $('<tr class="tr-dia" ><td>T' + (d + 1) + ' :</td><td><input type="text"   class="texto-h HORA_DESDE_' + dias_semana[f] + (d + 1) + '"   name="HORA_DESDE_' + dias_semana[f] + (d + 1)
                                        + '" value="' + lista[i].desde + '"  /></td><td><input type="text"  class="texto-h HORA_HASTA_' + dias_semana[f] + (d + 1) + '"  value="' + lista[i].hasta + '" name="HORA_HASTA_' + dias_semana[f] + (d + 1)
                                        + '" /><input type="hidden" name="DIA_' + dias_semana[f] + (d + 1)
                                        + '" value="' + dias_semana[f] + '" ><a href="#" class="remove_' + (d + 1) + '">-</a></td></tr>').appendTo(scntDiv);



                                d++;
                            }
                            // alert(dias_semana[f]);

                        }
                    }
                    calcularHoras();
                    $(".texto-h").keyup(
                            function() {
                                calcularHoras();
                            }
                    );

                });

            }


        }

        function cuenta_bancaria(banco) {


            if (banco == '1') {
                $("#generar").hide();
                $("#no_cuen").show();
                $("#nu_cuen").val("");
                $("#nu_cuen").attr("required", "required");
                $("#no_cuen_ban").hide();
                $("#nu_cuen_ban").val("");
                $("#subscription").attr('checked', false);
                $("#nu_cuen").attr("maxlength", "21");
                $("#nu_cuen").mask("0011-9999999999999999", {placeholder: "X"});
                $("#no_cuen_otros").hide();
                $("#nu_cuen_otros").val("");
            }
            if (banco == '2') {
                $("#generar").hide();
                $("#subscription").attr('checked', false);
                $("#no_cuen_ban").hide();
                $("#nu_cuen_ban").val("");
                $("#no_cuen").show();
                $("#nu_cuen").val("");
                $("#nu_cuen").attr("required", "required");
                $("#nu_cuen").attr("maxlength", "14");
                $("#nu_cuen").mask("99999999999999", {placeholder: "X"});
                $("#no_cuen_otros").hide();
                $("#nu_cuen_otros").val("");
            }
            if (banco == '3') {
                $("#no_cuen").show();
                $("#no_cuen").val("");
                $("#nu_cuen").attr("required", "required");
                $("#no_cuen_ban").show();
                $("#no_cuen_ban").val("");
                $("#nu_cuen_ban").attr("required", "required");
                $("#no_cuen_otros").show();
                $("#nu_cuen_otros").val("");
                $("#nu_cuen_otros").attr("required", "required");
                $("#generar").hide();
                $("#subscription").attr('checked', false);
            }
            if (banco == '0') {
                $("#no_cuen").hide();
                $("#nu_cuen").val("");
                $("#no_cuen_ban").hide();
                $("#nu_cuen_ban").val("");
                $("#no_cuen_otros").show();
                $("#nu_cuen_otros").val("BBVA");
                $("#generar").show();
                $("#subscription").attr("required", "required");
                $("#nu_cuen_otros").attr("required", "required");
            }

        }
        var agregar = $('#fila-agregar');
        var ag = $('#fila-agregar .porcentaje_cc').size() + 1;
        var texto = "";

        function agregar_centro_costo(opc, arr_cc) {

            if (opc == "1") {
                texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + ag + ':</label>';
                texto += '<div  class="row centro-costo_' + ag + '" >';
                texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '"><option value="">[DIRECCION]</option></select></label></section>';
                texto += '<section class="col col-3"><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
                texto += '<section class="col col-3"><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ag + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';
                texto += '<section class="col col-2"><label class="input" id="titu">%<input name="PORCENTAJE_' + ag + '"  min="0"   type="text" required="" value="' + arr_cc[3] + '" class="porcentaje_cc"/><button type="button" class="remover' + ag + '">Remover</button></label></section>';
                texto += '</div>';

                agregar.append(texto);
                listar_cc(ag, opc, arr_cc);

                sumn_porcen_total();
            } else {
                texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + ag + ':</label>';
                texto += '<div  class="row centro-costo_' + ag + '" >';
                texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '"><option value="">[DIRECCION]</option></select></label></section>';
                texto += '<section class="col col-3"><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
                texto += '<section class="col col-3"><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ag + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';
                texto += '<section class="col col-2"><label class="input" id="titu">%<input name="PORCENTAJE_' + ag + '"  min="0"   type="text" required="" class="porcentaje_cc"/><button type="button" class="remover' + ag + '">Remover</button></label></section>';
                texto += '</div>';
                agregar.append(texto);
                listar_cc(ag);
                var c_porcentaje = $(".porcentaje_cc").size();
                $(".porcentaje_cc").val(Math.round((100 / c_porcentaje) * 100) / 100);
                sumn_porcen_total();
            }


            texto = "";
            $(".cant-input").val(ag);
            ag++;
            $(".porcentaje_cc").keyup(function() {
                sumn_porcen_total();
            });
        }

        function listar_tipo_horario() {
            $.post("../../formato_horario", "opc=Listar_Tip_Horario", function(objJson) {

                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                var horario = $("#horario");
                horario.empty();
                horario.append('<option value="" >[SELECCIONE]</option>');
                for (var i = 0; i < lista.length; i++) {
                    horario.append('<option value="' + lista[i].id + '" >' + lista[i].nombre + '</option>');
                }

            });
        }
        $(document).ready(function() {

            listar_tipo_horario();
            sumn_porcen_total();
            $("#no_cuen").hide();
            $("#no_cuen_ban").hide();
            $("#generar").hide();
            $("#no_cuen_otros").hide();



            //  var r = "";
            $('#btn-agregar-cc').click(function() {
                agregar_centro_costo();


            });
            $("#banco").change(function() {
                cuenta_bancaria($(this).val());

            });

            listar_cc();

            $("#horario").change(
                    function() {
                        list_horario($(this).val());
                    }
            );
        }
        )
                ;</script>
    <script type="text/javascript">
        $(document).ready(function() {

            $("#sueldo").numeric();
            $("#bono_al").numeric();
            $("#bev").numeric();
            /* $("#sueldo").mask("99999.99", {placeholder: "0"});
             $("#bono_al").mask("99999.99", {placeholder: "0"});
             $("#bev").mask("99999.99", {placeholder: "0"});*/
            var scntDiv = $('#show_lun');
            var i = $('#show_lun .texto-h').size() + 1;
            var s = $('#show_lun .tr-count').size() + 1;
            $('#addScnt').click(function() {
                $('<tr><td>T' + s + ' :</td><td><input type="text"   name="HORA_DESDE_lun' + i
                        + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_lun' + i
                        + '" value="" placeholder=" " /><input type="hidden" name="DIA_lun' + i
                        + '" value="lun" ><input type="hidden" name="USER_CREACION_lun' + i
                        + '"> <a href="#" id="remScnt">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('#remScnt').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });
        //MARTES
        $(function() {
            var scntDiv = $('#show_mar');
            var i = $('#show_mar .texto-h').size() + 1;
            var s = $('#show_mar .tr-count_2').size() + 1;
            $('#add_2').click(function() {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mar' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mar' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mar' + i + '" value="mar" ><input type="hidden" name="USER_CREACION_mar' + i + '"> <a href="#" id="remove_2">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_2').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });
        //MIERCOLES
        $(function() {
            var scntDiv = $('#show_mie');
            var i = $('#show_mie .texto-h').size() + 1;
            var s = $('#show_mie .tr-count_3').size() + 1;
            $('#add_3').click(function() {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mie' + i + '" value="mie" ><input type="hidden" name="USER_CREACION_mie' + i + '"> <a href="#" id="remove_3">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_3').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });
        //JUEVES
        $(function() {
            var scntDiv = $('#show_jue');
            var i = $('#show_jue .texto-h').size() + 1;
            var s = $('#show_jue .tr-count_4').size() + 1;
            $('#add_4').click(function() {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_jue' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_jue' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_jue' + i + '" value="jue" ><input type="hidden" name="USER_CREACION_jue' + i + '"> <a href="#" id="remove_4">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_4').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });
        //VIERNES
        $(function() {
            var scntDiv = $('#show_vie');
            var i = $('#show_vie .texto-h').size() + 1;
            var s = $('#show_vie .tr-count_5').size() + 1;
            $('#add_5').click(function() {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_vie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_vie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_vie' + i + '" value="vie" ><input type="hidden" name="USER_CREACION_vie' + i + '"> <a href="#" id="remove_5">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_5').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });
        //DOMINGO
        $(function() {
            var scntDiv = $('#show_sab');
            var i = $('#show_sab .texto-h').size() + 1;
            var s = $('#show_sab .tr-count_6').size() + 1;
            $('#add_6').click(function() {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_dom' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_dom' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_dom' + i + '" value="dom" ><input type="hidden" name="USER_CREACION_dom' + i + '"> <a href="#" id="remove_6">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('.remove_6').click(function() {
                if (i > 2) {
                    $(this).parents('tr').remove();
                    //  $("#tr-d").remove();           
                    i--;
                    s--;
                }
                return false;
            });
        });</script>

    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
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

    <!-- PAGE RELATED PLUGIN(S) 
    <script src="..."></script>-->
    <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>
    <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
    <script src="../../js/JQuery/jquery.maskMoney.js" type="text/javascript"></script>

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
                    FEC_DESDE: {
                        val_fecha: true
                    },
                    horas_totales: {
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
                    horas_totales: {
                        max: 'Porfavor digite un horario que se menor a 48 Horas de Trabajo'
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


            jQuery.validator.addMethod("val_fecha", function(value, element) {
                var d = value.split("-");
                return this.optional(element) || String(parseInt(d[0])).length == 4;
            }, "¡Fecha ingresada invalida!");

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


    <script type="text/javascript">

        // DO NOT REMOVE : GLOBAL FUNCTIONS!

        $(document).ready(function() {

            pageSetUp();
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
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>
