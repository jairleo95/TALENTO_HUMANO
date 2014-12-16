

<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.V_Puesto_Direccion"%>
<%@page import="pe.edu.upeu.application.model.Puesto"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<jsp:useBean id="Listar_Trabajador_id" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Det_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Requerimiento" scope="application" class="java.util.ArrayList"/>

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
        <script language="javascript" type="text/javascript">
            $(document).ready(function () {
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


        <style>

            .td{
                font-weight: bold;
            }
        </style>


        <script>
            $(document).ready(
                    function () {
                        $("#sueldo").keyup(
                                function () {
                                    var x = parseFloat($("#sueldo").val());
                                    var y = parseFloat($("#bono_al").val());
                                    var z = parseFloat($("#bev").val());
                                    var v = x + y + z;
                                    $("#suel_total").text(Math.round(v*100)/100);

                                }
                        );
                        $("#bono_al").keyup(
                                function () {
                                    var x = parseFloat($("#sueldo").val());
                                    var y = parseFloat($("#bono_al").val());
                                    var z = parseFloat($("#bev").val());
                                    var v = x + y + z;
                                    $("#suel_total").text(Math.round(v*100)/100);
                                }
                        );
                        $("#bev").keyup(
                                function () {
                                    var x = parseFloat($("#sueldo").val());
                                    var y = parseFloat($("#bono_al").val());
                                    var z = parseFloat($("#bev").val());
                                    var v =  x + y + z;
                                    $("#suel_total").text(Math.round(v*100)/100);
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
        <style type="text/css">

            #titu{

                font-weight: bold;
                color: #005cac;
                // color: blue;
            }
        </style>

    </head>
    <body>   
        <script>
            $(document).ready(function () {
                var b = $("#alerta_dgp");
                // $("#alerta_dgp").hide();
                function listar() {
                    $.post("../../plazo_dgp", "opc=Listar", function (objJson) {
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
            });</script>

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
                                                </header>

                                                <fieldset id="fila-agregar">

                                                    <%
                                                        /*Temporal*/
                                                        String idreq = request.getParameter("idreq");

                                                        for (int i = 0; i < Listar_Trabajador_id.size(); i++) {
                                                            V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                                                            tr = (V_Ficha_Trab_Num_C) Listar_Trabajador_id.get(i);
                                                    %>
                                                    <section>
                                                        <label class="label" id="titu">Trabajador :</label>
                                                        <label class="input" style="color: red; font-weight: bold;">
                                                            <%=tr.getAp_paterno() + " " + tr.getAp_materno() + " " + tr.getNo_trabajador()%>
                                                            <input type="hidden" value="<%=tr.getId_trabajador()%>" name="IDDATOS_TRABAJADOR" class="input-xs">
                                                            <% }
                                                                if (Listar_Trabajador_id.size() == 0) { %>   
                                                            <%}%>
                                                        </label>
                                                    </section>
                                                    <section>
                                                        <label class="label" id="titu">Puesto | Seccion | Area:</label>
                                                        <label class="select">
                                                            <select name="IDPUESTO"  required="" >
                                                                <option value="">[Seleccionar]</option>

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
                                                                <input type="text" name="SUELDO" required="" value="0.0"  id="sueldo" >
                                                            </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label class="input"  id="titu"> 
                                                                Bono de Alimentos :<input type="text" required="" value="0.0" name="BONO_ALIMENTARIO"  id="bono_al">
                                                            </label>
                                                        </section>
                                                        <section class="col col-3">
                                                            <label class="input"  id="titu"> 
                                                                BEV :<input type="text" name="BEV"  value="0.0" id="bev">
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
                                                                Antecedentes Policiales :<select name="ANTECEDENTES_POLICIALES" >
                                                                    <option value="1" selected="">No</option>
                                                                    <option value="2">Si</option>
                                                                </select>
                                                            </label>

                                                        </section>
                                                        <section class="col col-4">

                                                            <label class="input" id="titu">
                                                                Certificado de Salud : <input type="text" name="CERTIFICADO_SALUD" required="">
                                                            </label>
                                                        </section>


                                                    </div>
                                                    <div class="row">
                                                        <section class="col col-3" name="">
                                                            <label class="select" id="titu">Banco:
                                                                <select name="BANCO" id="banco" required="">
                                                                    <option value="" selected="" >[Selecione]</option>
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
                                                        <section class="col col-3" id="no_cuen">

                                                            <label class="input" id="titu">Nro Cuenta :
                                                                <input type="text" name="CUENTA"  id="nu_cuen" maxlength="30"   />
                                                            </label>

                                                        </section>
                                                        <section class="col col-3"  id="no_cuen_ban">

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
                                                    <div  class="row" id="centro-costo_1" >
                                                        <section class="col col-4"><label class="select" id="titu">Centro de Costo N1:<select name="CENTRO_COSTOS_1" ><option value="0">----</option></select></label></section>
                                                        <section class="col col-4"><label class="input" id="titu">%<input name="por_cen_costo_1" max="100" maxlength="3" type="text" value="100"  id="porcentaje_cc"/></label></section>
                                                        <section class="col col-4"><label class="btn"><button type="button" class="btn btn-default" id="btn-agregar-cc" >Agregar</button></label></section>
                                                    </div>
                                                    <code class="ver"></code>
                                                    <script type="text/javascript">
                                                        $(document).ready(
                                                                function () {
                                                                    $("#no_cuen").hide();
                                                                    $("#no_cuen_ban").hide();
                                                                    $("#generar").hide();
                                                                    $("#no_cuen_otros").hide();


                                                                    var agregar = $('#fila-agregar');
                                                                    var ag = $('#fila-agregar #porcentaje_cc').size() + 1;
                                                                    var texto = "";
                                                                    var r = "";

                                                                    $('#btn-agregar-cc').click(function () {
                                                                        texto += '<div  class="row" id="centro-costo_' + ag + '" >';
                                                                        texto += '<section class="col col-4"><label class="select" id="titu">Centro de Costo N' + ag + ':<select name="CENTRO_COSTOS_' + ag + '" ><option value="0">----</option></select></label></section>';
                                                                        texto += '<section class="col col-4"><label class="input" id="titu">%<input name="por_cen_costo" type="text" value=""  id="porcentaje_cc"/></label></section>';
                                                                        texto += '<section class="col col-4"><label class="btn"><button type="button" class="btn btn-default"  onclick=" $(\'#centro-costo_' + ag + '\').remove()"  >Remover</button></label></section>';
                                                                        texto += '</div>';
                                                                        agregar.append(texto);
                                                                        alert($("#por_cen_costo").val());
                                                                        // $(".ver").text(texto);
                                                                        texto = "";
                                                                        ag++;
                                                                    });

                                                                    $("#banco").change(function () {
                                                                        if ($("#banco").val() == '1') {
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
                                                                        if ($("#banco").val() == '2') {
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
                                                                        if ($("#banco").val() == '3') {
                                                                            $("#no_cuen").show();
                                                                            $("#no_cuen").val("");
                                                                            $("#no_cuen").attr("required", "required");
                                                                            $("#no_cuen_ban").show();
                                                                            $("#no_cuen_ban").val("");
                                                                            $("#no_cuen_ban").attr("required", "required");
                                                                            $("#no_cuen_otros").show();
                                                                            $("#nu_cuen_otros").val("");
                                                                            $("#nu_cuen_otros").attr("required", "required");
                                                                            $("#generar").hide();
                                                                            $("#subscription").attr('checked', false);
                                                                        }
                                                                        if ($("#banco").val() == '0') {
                                                                            $("#no_cuen").hide();
                                                                            $("#nu_cuen").val("");
                                                                            $("#no_cuen_ban").hide();
                                                                            $("#nu_cuen_ban").val("");
                                                                            $("#generar").show();
                                                                            $("#subscription").attr("required", "required");
                                                                        }




                                                                    });
                                                                }
                                                        );</script>



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
                                                            <tr><td class="td">Ruc:</td><td><input type="text" name="RUC" ></td></tr>    
                                                            <tr><td class="td">Lugar de Servicio:</td><td><input type="text" name="LUGAR_SERVICIO"></td></tr>   
                                                            <tr><td class="td">Descripcion de Servicio:</td><td><input type="text" name="DESCRIPCION_SERVICIO" ></td></tr> 
                                                            <tr><td class="td">Monto del Honorario:</td><td><input type="text" name="MONTO_HONORARIO" ></td></tr>   
                                                            <tr><td class="td">Periodo Pago:</td><td><input type="text" name="PERIODO_PAGO"  ></td></tr>    
                                                            <tr><td class="td">Domicilio Fiscal:</td><td><input type="text" name="DOMICILIO_FISCAL"  ></td></tr>    
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
                                                        <label class="label" id="titu">Opcion :</label>
                                                        <label class="select">

                                                            <select id="horario" required="" >
                                                                <option value="">[SELECCIONE]</option>
                                                                <option value="0">Editable</option>
                                                                <option value="1">Horario Tiempo Completo</option>
                                                            </select>

                                                        </label>
                                                    </section>
                                                    <div class="row">
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">LUNES
                                                                <select id="lunes" >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">MARTES
                                                                <select id="martes" >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2" >
                                                            <label class="select" id="titu">MIERCOLES
                                                                <select id="miercoles"  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">JUEVES
                                                                <select id="jueves"  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select> 
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">VIERNES
                                                                <select id="viernes"  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                        <section class="col col-2">
                                                            <label class="select" id="titu">SABADO
                                                                <select id="sabado"  >
                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>

                                                        <section class="col col-2">
                                                            <label class="select" id="titu">DOMINGO
                                                                <select id="domingo" >

                                                                    <option value="1">Habilitado</option>
                                                                    <option value="2" selected="">Deshabilitado</option>
                                                                </select>
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <div class="input-desp">
                                                        <table style="" id="show_1" class="cont_lunes"> 
                                                            <tr><td align="center" colspan="2">Lunes</td></tr>
                                                            <tr class="tr-count"><td>T1 :</td><td><input type="text" name="HORA_DESDE_lun1" id="HORA_DESDE_lun1" class="texto-h" ></td>      
                                                                <td><input type="text" name="HORA_HASTA_lun1" id="HORA_HASTA_lun1" class="texto-h" ></td></tr>         
                                                            <input type="hidden" name="DIA_lun1" value="lun" >                    

                                                            <tr class="tr-count"><td>T2 :</td><td><input type="text" name="HORA_DESDE_lun2" id="HORA_DESDE_lun2" class="texto-h" ></td>           
                                                                <td ><input type="text" name="HORA_HASTA_lun2" id="HORA_HASTA_lun2" class="texto-h" ><a  id="remScnt" >-</a></td></tr>      
                                                            <input type="hidden" name="DIA_lun2" value="lun">                    
                                                            <tr><td colspan="2"><a href="#" id="addScnt">+</a></td></tr>

                                                        </table>

                                                        <table id="show_2" class="cont_martes">     
                                                            <tr><td align="center" colspan="2">Martes</td></tr>
                                                            <tr class="tr-count_2"><td>T1 :</td><td><input type="text" name="HORA_DESDE_mar1" id="HORA_DESDE_mar1" class="texto-h" ></td>             
                                                                <td><input type="text" name="HORA_HASTA_mar1" id="HORA_HASTA_mar1" class="texto-h" ></td></tr>         
                                                            <input type="hidden" name="DIA_mar1" value="mar" >                    

                                                            <tr class="tr-count_2"><td>T2 :</td><td><input type="text" name="HORA_DESDE_mar2" id="HORA_DESDE_mar2" class="texto-h" ></td>             
                                                                <td><input type="text" name="HORA_HASTA_mar2"  id="HORA_HASTA_mar2" class="texto-h" ><a href="#" id="remove_2">-</a></td></tr>         
                                                            <input type="hidden" name="DIA_mar2" value="mar" >    

                                                            <tr><td colspan="2"><a href="#" id="add_2">+</a></td></tr>





                                                        </table>




                                                        <table id="show_3" class="cont_miercoles">     
                                                            <tr ><td align="center" colspan="2">Miercoles</td></tr>
                                                            <tr class="tr-count_3"><td>T1 :</td><td><input type="text" name="HORA_DESDE_mie1" id="HORA_DESDE_mier1" class="texto-h" ></td>           
                                                                <td><input type="text" name="HORA_HASTA_mie1" id="HORA_HASTA_mier1" ></td></tr>         
                                                            <input type="hidden" name="DIA_mie1" value="mie">                    



                                                            <tr class="tr-count_3"><td>T2 :</td><td><input type="text" name="HORA_DESDE_mie2" id="HORA_DESDE_mier2" class="texto-h" ></td>           
                                                                <td><input type="text" name="HORA_HASTA_mie2" id="HORA_HASTA_mier2" class="texto-h" ><a href="#" id="remove_3">-</a></td></tr>         
                                                            <input type="hidden" name="DIA_mie2" value="mie"  >                    

                                                            <tr><td colspan="2"><a href="#" id="add_3">+</a></td></tr>
                                                        </table>


                                                        <table id="show_4" class="cont_jueves">     
                                                            <tr><td align="center" colspan="2">Jueves</td></tr>
                                                            <tr class="tr-count_4"><td>T1 :</td><td><input type="text" name="HORA_DESDE_jue1" id="HORA_DESDE_jue1" class="texto-h" ></td>            
                                                                <td><input type="text" name="HORA_HASTA_jue1" id="HORA_HASTA_jue1" class="texto-h" ></td></tr>         
                                                            <input type="hidden" name="DIA_jue1" value="jue"  >           


                                                            <tr class="tr-count_4"><td>T2 :</td><td><input type="text" name="HORA_DESDE_jue2" id="HORA_DESDE_jue2" class="texto-h" ></td>          
                                                                <td><input type="text" name="HORA_HASTA_jue2" id="HORA_HASTA_jue2" class="texto-h" ><a href="#" id="remove_4">-</a></td></tr>         
                                                            <input type="hidden" name="DIA_jue2" value="jue"  >                    
                                                            <tr><td colspan="2"><a href="#" id="add_4">+</a></td></tr>
                                                        </table>
                                                        <table id="show_5" class="cont_viernes">     
                                                            <tr><td align="center" colspan="2">Viernes</td></tr>
                                                            <tr class="tr-count_5"><td>T1 :</td><td><input type="text" name="HORA_DESDE_vie1"  id="HORA_DESDE_vie1" class="texto-h" ></td>
                                                                <td><input type="text" name="HORA_HASTA_vie1" id="HORA_HASTA_vie1" class="texto-h" ></td></tr>         
                                                            <input type="hidden" name="DIA_vie1" value="vie"  >                    
                                                            <tr><td colspan="2"><a href="#" id="add_5">+</a></td></tr>
                                                        </table>
                                                        <table id="show_6" class="cont_sabado">     
                                                            <tr><td align="center" colspan="2">Sábado</td></tr>
                                                            <tr class="tr-count_6"><td>T1 :</td><td><input type="text" name="HORA_DESDE_sab1"  id="HORA_DESDE_sab1" class="texto-h" ></td>
                                                                <td><input type="text" name="HORA_HASTA_sab1" id="HORA_HASTA_sab1" class="texto-h" ></td></tr>         
                                                            <input type="hidden" name="DIA_sab1" value="sab"  />                    
                                                            <tr><td colspan="2"><a href="#" id="add_6">+</a></td></tr>
                                                        </table>
                                                        <table id="show_7" class="cont_domingo" >
                                                            <tr><td align="center" colspan="2">Domingo</td></tr>
                                                            <tr class="tr-count_7"><td>T1 :</td><td><input type="text" name="HORA_DESDE_dom1"  id="HORA_DESDE_dom1" class="texto-h" ></td>
                                                                <td><input type="text" name="HORA_HASTA_dom1"  id="HORA_HASTA_dom1" class="texto-h" ></td></tr>         
                                                            <input type="hidden" name="DIA_dom1" value="dom" >                    

                                                            <tr class="tr-count_7"><td>T2 :</td><td><input type="text" name="HORA_DESDE_dom2"  id="HORA_DESDE_dom2" class="texto-h" ></td>
                                                                <td><input type="text" name="HORA_HASTA_dom2"  id="HORA_HASTA_dom2" class="texto-h" ><a href="#" id="remove_7">-</a></td></tr>         
                                                            <input type="hidden" name="DIA_dom2" value="dom"  >                    
                                                            <tr><td colspan="2"><a href="#" id="add_7">+</a></td></tr>
                                                        </table>
                                                        <div class="h_total" style="color: red; font-weight: bold;">Horas Totales : 00:00 horas</div>
                                                        <input  readonly="" type="text" name="horas_totales" class="h_total" required="" max="48"/>
                                                    </div>
                                                </fieldset>
                                                <footer>
                                                    <button type="submit" class="btn btn-primary">
                                                        Siguiente
                                                    </button>
                                                    <button type="button" class="btn btn-default" onclick="window.history.back();">
                                                        Regresar
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
    <script language="javascript" type="text/javascript">
        $(document).ready(
                function mostrar() {
                    $(".texto-h").mask("99:99", {placeholder: "X"});
                    $(".cont_lunes").hide();
                    $(".cont_martes").hide();
                    $(".cont_miercoles").hide();
                    $(".cont_jueves").hide();
                    $(".cont_viernes").hide();
                    $(".cont_sabado").hide();
                    $(".cont_domingo").hide();
                    $("#lunes").change(
                            function () {
                                if ($(this).val() == 1) {
                                    $("#show_1").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_lunes").hide();
                                    $("#show_1 input").val("");
                                }
                            }
                    );
                    $("#martes").change(
                            function () {
                                if ($(this).val() == 1) {
                                    $("#show_2").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_martes").hide();
                                    $("#show_2 input").val("");
                                }
                            }
                    );
                    $("#miercoles").change(
                            function () {
                                if ($(this).val() == 1) {
                                    $("#show_3").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_miercoles").hide();
                                    $("#show_3 input").val("00:00");
                                }
                            }
                    );
                    $("#jueves").change(
                            function () {
                                if ($(this).val() == 1) {
                                    $("#show_4").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_jueves").hide();
                                    $("#show_4 input").val("");
                                }
                            }
                    );
                    $("#viernes").change(
                            function () {
                                if ($(this).val() == 1) {
                                    $("#show_5").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_viernes").hide();
                                    $("#show_5 input").val("");
                                }
                            }
                    );
                    $("#sabado").change(
                            function () {
                                if ($(this).val() == 1) {
                                    $("#show_6").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_sabado").hide();
                                    $("#show_6 input").val("");
                                }
                            }
                    );
                    $("#domingo").change(
                            function () {
                                if ($(this).val() == 1) {
                                    $("#show_7").show();
                                }
                                if ($(this).val() == 2) {
                                    $(".cont_domingo").hide();
                                    $("#show_7 input").val("");
                                }
                            }
                    );
                }

        );</script>
    <script  language="javascript" type="text/javascript">

        function calcularHoras() {
            var dias_semana = new Array("lun", "mar", "mier", "jue", "vie", "sab", "dom");
            var acum = 0;
            for (var i = 0; i < dias_semana.length; i++) {

                for (var j = 0, max = 5; j < max; j++) {
                    var horaTurno = 0;
                    //var str = $("#HORA_DESDE_" + dias_semana[i] + j).val();

                    var Desde = $("#HORA_DESDE_" + dias_semana[i] + j).val();
                    var Hasta = $("#HORA_HASTA_" + dias_semana[i] + j).val();
                    if ($("#HORA_DESDE_" + dias_semana[i] + j).val() == null) {
                        Desde = "00:00";
                        Hasta = "00:00";
                    }
                    //  var arrDesde = $(str).val().split(":");
                    //if (typeof Desde !== 'undefined' && typeof Hasta !== 'undefined') {
                    var arrDesde = Desde.split(":");
                    var arrHasta = Hasta.split(":");
                    horaTurno = (((parseInt(arrHasta[0]) * 60) + (parseInt(arrHasta[1]))) - ((parseInt(arrDesde[0]) * 60) + (parseInt(arrDesde[1]))));
                    //alert(horaTurno);

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
        $(document).ready(function () {


            $(".texto-h").keyup(
                    function () {
                        calcularHoras();
                    }
            );
            $("#horario").change(
                    function () {
                        if ($(this).val() == 0) {
                            $(".cont_lunes").hide();
                            $(".cont_martes").hide();
                            $(".cont_miercoles").hide();
                            $(".cont_jueves").hide();
                            $(".cont_viernes").hide();
                            $(".cont_sabado").hide();
                            $(".cont_domingo").hide();
                            $("#lunes").val(2);
                            $("#martes").val(2);
                            $("#miercoles").val(2);
                            $("#jueves").val(2);
                            $("#viernes").val(2);
                            $("#sabado").val(2);
                            $("#domingo").val(2);
                        }
                        if ($(this).val() == 1) {
                            $("#show_1").show();
                            $("#show_2").show();
                            $("#show_3").show();
                            $("#show_4").show();
                            $("#show_5").show();
                            //    $("#show_6").show();
                            $("#show_7").show();
                            $("#lunes").val(1);
                            $("#martes").val(1);
                            $("#miercoles").val(1);
                            $("#jueves").val(1);
                            $("#viernes").val(1);
                            //$("#sabado").val(1);
                            $("#domingo").val(1);
                            document.getElementById("HORA_DESDE_lun1").value = "7:50";
                            document.getElementById("HORA_HASTA_lun1").value = "12:30";
                            document.getElementById("HORA_DESDE_lun2").value = "13:30";
                            document.getElementById("HORA_HASTA_lun2").value = "17:30";
                            document.getElementById("HORA_DESDE_mar1").value = "7:50";
                            document.getElementById("HORA_HASTA_mar1").value = "12:30";
                            document.getElementById("HORA_DESDE_mar2").value = "13:30";
                            document.getElementById("HORA_HASTA_mar2").value = "17:30";
                            document.getElementById("HORA_DESDE_mier1").value = "7:50";
                            document.getElementById("HORA_HASTA_mier1").value = "12:30";
                            document.getElementById("HORA_DESDE_mier2").value = "13:30";
                            document.getElementById("HORA_HASTA_mier2").value = "17:30";
                            document.getElementById("HORA_DESDE_jue1").value = "7:50";
                            document.getElementById("HORA_HASTA_jue1").value = "12:30";
                            document.getElementById("HORA_DESDE_jue2").value = "13:30";
                            document.getElementById("HORA_HASTA_jue2").value = "17:30";
                            document.getElementById("HORA_DESDE_vie1").value = "7:50";
                            document.getElementById("HORA_HASTA_vie1").value = "12:30";
                            document.getElementById("HORA_DESDE_sab1").value = "00:00";
                            document.getElementById("HORA_HASTA_sab1").value = "00:00";
                            document.getElementById("HORA_DESDE_dom1").value = "7:50";
                            document.getElementById("HORA_HASTA_dom1").value = "12:30";
                            document.getElementById("HORA_DESDE_dom2").value = "13:30";
                            document.getElementById("HORA_HASTA_dom2").value = "17:30";
                        }
                        calcularHoras();
                    }
            );
        });</script>
    <script type="text/javascript">
        $(document).ready(function () {

            //$("#sueldo").numeric();
            $("#sueldo").mask("99999.99", {placeholder: "0"});
            $("#bono_al").mask("99999.99", {placeholder: "0"});
            $("#bev").mask("99999.99", {placeholder: "0"});
            var scntDiv = $('#show_1');
            var i = $('#show_1 .texto-h').size() + 1;
            var s = $('#show_1 .tr-count').size() + 1;
            $('#addScnt').click(function () {
                $('<tr><td>T' + s + ' :</td><td><input type="text"   name="HORA_DESDE_lun' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_lun' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_lun' + i + '" value="lun" ><input type="hidden" name="USER_CREACION_lun' + i + '"> <a href="#" id="remScnt">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('#remScnt').click(function () {
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
        $(function () {
            var scntDiv = $('#show_2');
            var i = $('#show_2 .texto-h').size() + 1;
            var s = $('#show_2 .tr-count_2').size() + 1;
            $('#add_2').click(function () {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mar' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mar' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mar' + i + '" value="mar" ><input type="hidden" name="USER_CREACION_mar' + i + '"> <a href="#" id="remove_2">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('#remove_2').click(function () {
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
        $(function () {
            var scntDiv = $('#show_3');
            var i = $('#show_3 .texto-h').size() + 1;
            var s = $('#show_3 .tr-count_3').size() + 1;
            $('#add_3').click(function () {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mie' + i + '" value="mie" ><input type="hidden" name="USER_CREACION_mie' + i + '"> <a href="#" id="remove_3">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('#remove_3').click(function () {
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
        $(function () {
            var scntDiv = $('#show_4');
            var i = $('#show_4 .texto-h').size() + 1;
            var s = $('#show_4 .tr-count_4').size() + 1;
            $('#add_4').click(function () {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_jue' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_jue' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_jue' + i + '" value="jue" ><input type="hidden" name="USER_CREACION_jue' + i + '"> <a href="#" id="remove_4">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('#remove_4').click(function () {
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
        $(function () {
            var scntDiv = $('#show_5');
            var i = $('#show_5 .texto-h').size() + 1;
            var s = $('#show_5 .tr-count_5').size() + 1;
            $('#add_5').click(function () {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_vie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_vie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_vie' + i + '" value="vie" ><input type="hidden" name="USER_CREACION_vie' + i + '"> <a href="#" id="remove_5">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('#remove_5').click(function () {
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
        $(function () {
            var scntDiv = $('#show_6');
            var i = $('#show_6 .texto-h').size() + 1;
            var s = $('#show_6 .tr-count_6').size() + 1;
            $('#add_6').click(function () {

                $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_dom' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_dom' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_dom' + i + '" value="dom" ><input type="hidden" name="USER_CREACION_dom' + i + '"> <a href="#" id="remove_6">-</a></td></tr>').appendTo(scntDiv);
                i++;
                s++;
                return false;
            });
            $('#remove_6').click(function () {
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

        $(document).ready(function () {

            pageSetUp();
            var $checkoutForm = $('#checkout-form').validate({
                // Rules for form validation
                rules: {
                    fname: {
                        required: true
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
                errorPlacement: function (error, element) {
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
                errorPlacement: function (error, element) {
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
                errorPlacement: function (error, element) {
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
                submitHandler: function (form) {
                    $(form).ajaxSubmit({
                        success: function () {
                            $("#comment-form").addClass('submited');
                        }
                    });
                },
                // Do not change code below
                errorPlacement: function (error, element) {
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
                submitHandler: function (form) {
                    $(form).ajaxSubmit({
                        success: function () {
                            $("#contact-form").addClass('submited');
                        }
                    });
                },
                // Do not change code below
                errorPlacement: function (error, element) {
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
                errorPlacement: function (error, element) {
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
                errorPlacement: function (error, element) {
                    error.insertAfter(element.parent());
                }
            });
            // START AND FINISH DATE
            $('#startdate').datepicker({
                dateFormat: 'dd.mm.yy',
                prevText: '<i class="fa fa-chevron-left"></i>',
                nextText: '<i class="fa fa-chevron-right"></i>',
                onSelect: function (selectedDate) {
                    $('#finishdate').datepicker('option', 'minDate', selectedDate);
                }
            });
            $('#finishdate').datepicker({
                dateFormat: 'dd.mm.yy',
                prevText: '<i class="fa fa-chevron-left"></i>',
                nextText: '<i class="fa fa-chevron-right"></i>',
                onSelect: function (selectedDate) {
                    $('#startdate').datepicker('option', 'maxDate', selectedDate);
                }
            });
        })

    </script>


    <script type="text/javascript">

        // DO NOT REMOVE : GLOBAL FUNCTIONS!

        $(document).ready(function () {

            pageSetUp();
        })

    </script>

    <!-- Your GOOGLE ANALYTICS CODE Below -->
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
        _gaq.push(['_trackPageview']);
        (function () {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();

    </script>

</html>
