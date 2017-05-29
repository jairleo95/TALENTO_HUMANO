
<%@page import="pe.edu.upeu.application.model.Ub_Distrito"%>
<%@page import="pe.edu.upeu.application.model.Ub_Provincia"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.Tipo_Documento"%>
<%@page import="pe.edu.upeu.application.model.Via"%>
<%@page import="pe.edu.upeu.application.model.Zona"%>
<%@page import="pe.edu.upeu.application.model.Ub_Departamento"%>
<%@page import="pe.edu.upeu.application.model.Situacion_Educativa"%>
<%@page import="pe.edu.upeu.application.model.Universidad"%>
<%@page import="pe.edu.upeu.application.model.Carrera"%>
<%@page import="pe.edu.upeu.application.model.V_Ubigeo"%>
<%@page import="pe.edu.upeu.application.model.Nacionalidad"%>

<%
    HttpSession sesion_1 = request.getSession(true);
    String iddep = (String) sesion_1.getAttribute("DEPARTAMENTO_ID");
    String iduser = (String) sesion_1.getAttribute("IDUSER");

%>
<jsp:useBean id="List_Carrera" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Universidad" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Situacion_Educativa" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_zona" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_via" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="ListarDir_Dom" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_año" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Ubigeo" scope="session" class="java.util.ArrayList"/>

<jsp:useBean id="ListaridTrabajador" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Nacionalidad" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Departamento" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Provincia" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Distrito" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_tipo_doc" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title>Registrar Trabajador</title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
            <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
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

        <style>

        </style>

        <script type="text/javascript" src="../../js/JQuery/jQuery.js" ></script>
        <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
        <script type="text/javascript">
            $(document).ready(
                    function() {
                        var tip = $("#pro_dir_l");
                        tip.empty();
                        var rg = $("#dep_dir_l").val();
                        var data = "id_dep=" + rg + "&opc=dep_nac";
                        tip.append('<option value="">Cargando...</option>').val('');
                        $.post("../../ubigeo", data, function(objJson) {
                            tip.empty();
                            if (objJson.rpta == -1) {
                                alert(objJson.mensaje);
                                return;
                            }
                            var lista = objJson.lista;
                            if (lista.length > 0) {
                                tip.append("<option value=''>[Seleccione]</option>");
                            } else {
                                tip.append("<option value=''>[]</option>");
                            }
                            for (var i = 0; i < lista.length; i++) {
                                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                                tip.append(item);
                            }
                        });
                        var ti = $("#DOM_LEG_DISTRITO");
                        ti.empty();
                        var rg = $("#pro_dir_l").val();
                        var data = "id_dist=" + rg + "&opc=pro_nac";
                        ti.append('<option value="">Cargando...</option>').val('');
                        $.post("../../ubigeo", data, function(objJson) {
                            ti.empty();
                            if (objJson.rpta == -1) {
                                alert(objJson.mensaje);
                                return;
                            }
                            var lista = objJson.lista;
                            if (lista.length > 0) {
                                ti.append("<option value=''>[Seleccione]</option>");
                            } else {
                                ti.append("<option value=''>[]</option>");
                            }
                            for (var i = 0; i < lista.length; i++) {
                                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                                ti.append(item);
                            }
                        });

                        $(".doc, .doc_c").attr("maxlength", "8");
                        $(".doc, .doc_c").attr("minlength", "8");
                        //$(".doc, .doc_c").val("");

                        $("#nac").change(
                                function() {
                                    if ($("#nac").val() != "NAC-0193") {
                                        $("#dist").hide();
                                        $("#dist_nac").val("DST-001832");


                                    }
                                    if ($("#nac").val() == "NAC-0193") {

                                        $("#dist").show();
                                    }
                                }
                        );

                        $("#sit_edu").change(function() {
                            if ($("#sit_edu").val() == 'SED-0011' | $("#sit_edu").val() == 'SED-0013' | $("#sit_edu").val() == 'SED-0014'
                                    | $("#sit_edu").val() == 'SED-0015'
                                    | $("#sit_edu").val() == 'SED-0016' | $("#sit_edu").val() == 'SED-0017'
                                    | $("#sit_edu").val() == 'SED-0017' | $("#sit_edu").val() == 'SED-0018'
                                    | $("#sit_edu").val() == 'SED-0019' | $("#sit_edu").val() == 'SED-0020'
                                    | $("#sit_edu").val() == 'SED-0021') {

                                $("#es_inst_p").show();

                            }
                            else {
                                $("#es_inst_p").hide();
                                $("#regimen").hide();
                                $("#egreso").hide();
                                $("#ti").hide();
                                $("#institucion").hide();
                                $("#carr").hide();

                            }

                        });

                        $("#es_inst_p").change(function() {
                            if ($("#inst_peru").val() == "1") {
                                $("#regimen").show();
                                $("#egreso").show();
                                $("#ti").show();
                                $("#institucion").show();
                                $("#carr").show();
                            } else {
                                $("#regimen").hide();
                                $("#egreso").hide();
                                $("#ti").hide();
                                $("#institucion").hide();
                                $("#carr").hide();

                            }

                        });

                        $(".select-doc").change(
                                function() {
                                    $(".doc").val("");
                                    if ($(".select-doc").val() == 1) {
                                        $("#doc").numeric(false, function() {
                                        });
                                        $(".doc").attr("maxlength", "8");
                                        $(".doc").attr("minlength", "8");

                                    }
                                    else {

                                        $("#doc").removeNumeric();
                                        $(".doc").attr("maxlength", "10");
                                        $(".doc").removeAttr("minlength");
                                        //    $(".doc").val("");
                                    }
                                    $(".doc").focus();

                                }
                        );
                        $(".select-doc_c").change(
                                function() {
                                    $(".doc_c").val("");
                                    if ($(".select-doc_c").val() == 1) {
                                        $(".doc_c").numeric(false, function() {
                                        });
                                        $(".doc_c").attr("maxlength", "8");
                                        $(".doc_c").attr("minlength", "8");

                                    }
                                    else {

                                        $(".doc_c").removeNumeric();
                                        $(".doc_c").attr("maxlength", "10");
                                        $(".doc_c").removeAttr("minlength");
                                        //    $(".doc").val("");
                                    }

                                }
                        );
                    }
            );
        </script>
        <!--Alerta para la edad -->
        <script type="text/javascript">
            $(document).ready(
                    function() {
                        $(".alerta-req").hide();
                        $("#edad").change(
                                function() {
                                    $(".alerta-req").hide();
                                    var fecha = $("#edad").val();
                                    var fechaActual = new Date();
                                    var diaActual = fechaActual.getDate();
                                    var mmActual = fechaActual.getMonth() + 1;
                                    var yyyyActual = fechaActual.getFullYear();
                                    FechaNac = fecha.split("-");
                                    var diaCumple = FechaNac[2];
                                    var mmCumple = FechaNac[1];
                                    var yyyyCumple = FechaNac[0];
                                    //retiramos el primer cero de la izquierda
                                    if (mmCumple.substr(0, 1) == 0) {
                                        mmCumple = mmCumple.substring(1, 2);
                                    }
                                    if (diaCumple.substr(0, 1) == 0) {
                                        diaCumple = diaCumple.substring(1, 2);
                                    }
                                    var edad = yyyyActual - yyyyCumple;

                                    if ((mmActual < mmCumple) || (mmActual == mmCumple && diaActual < diaCumple)) {
                                        edad--;
                                    }
                                    $(".edad").text(edad + " años");
                                    if (edad < 18) {

                                    }

                                }
                        );

                    }

            );

        </script>
        <style>
            #btn-duplicar{
                margin: 1%;
                margin-left:  6%;
            }
            label{
                font-weight: bold;
            }
        </style>


    </head>
    <body class="">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->

        <!-- HEADER -->
        <header >

        </header>
        <!-- END HEADER -->

        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">



            <!-- MAIN CONTENT -->
            <div id="content">


                <!-- widget grid -->
                <section id="widget-grid" class="" >

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-sm-12 col-md-12 col-lg-6" style="width: 95%">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false"  >
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
                                    <center>
                                        <span class="widget-icon"> <i class="fa fa-male"></i> </span>
                                        <h2>MODIFICAR ASPECTO SOCIAL</h2>
                                    </center>

                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body">

                                        <div class="row">
                                            <form id="wizard-1" novalidate="novalidate" action="../../trabajador">
                                                <%for (int i = 0; i < ListaridTrabajador.size(); i++) {
                                                        V_Ficha_Trab_Num_C t = new V_Ficha_Trab_Num_C();
                                                        t = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(i);

                                                        for (int j = 0; j < List_Ubigeo.size(); j++) {
                                                            V_Ubigeo vu = new V_Ubigeo();
                                                            vu = (V_Ubigeo) List_Ubigeo.get(j);%>
                                                <%if (t.getId_di_dom_a_distrito().trim().equals(vu.getId_distrito())) {%>
                                                <input type="hidden" value="<%=vu.getId_departamento()%>" class="dep_a">                   
                                                <input type="hidden" value="<%=vu.getId_provincia()%>" class="pro_a">                   
                                                <input type="hidden" value="<%=vu.getId_distrito()%>" class="dis_a">                   
                                                <%}
                                                    if (t.getId_di_dom_leg_distrito().trim().equals(vu.getId_distrito())) {%>
                                                <input type="hidden" value="<%=vu.getId_departamento()%>" class="dep_leg">                   
                                                <input type="hidden" value="<%=vu.getId_provincia()%>" class="pro_leg">                   
                                                <input type="hidden" value="<%=vu.getId_distrito()%>" class="dis_leg">                   
                                                <%}
                                                    }%>



                                                <div id="bootstrap-wizard-1" class="col-sm-12">

                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="tab1">


                                                            <h3>-Domicilio Actual del Trabajador</h3>
                                                            <label>Direccion :</label>
                                                            <div class="row">

                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_A_D1_ID" id="DOM_A_D1" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Seleccione Via]</option>
                                                                                <%
                                                                                    for (int w = 0; w < Listar_via.size(); w++) {
                                                                                        Via zo = new Via();
                                                                                        zo = (Via) Listar_via.get(w);
                                                                                        if (t.getLi_di_dom_a_d1() != null) {
                                                                                            if (t.getLi_di_dom_a_d1().trim().equals(zo.getId_via().trim())) {%>    
                                                                                <option value="<%=zo.getId_via()%>" selected="" ><%=zo.getDe_via()%></option>
                                                                                <%}
                                                                                        }%>
                                                                                <option value="<%=zo.getId_via()%>"><%=zo.getDe_via()%></option>
                                                                                <%
                                                                                        
                                                                                    }%>
                                                                            </select>   
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                                <div class="col-sm-3">
                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"  value="<%if (t.getDi_dom_a_d2() != null) {
                                                                                    out.print(t.getDi_dom_a_d2());
                                                                                } else {
                                                                                    out.print("");
                                                                                }%>" type="text" name="DIR_DOM_A_D2" id="DOM_A_D2" maxlength="100">

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_A_D3_ID" id="DOM_A_D3" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Seleccione]</option>
                                                                                <%for (int w = 0; w < ListarDir_Dom.size(); w++) {
                                                                                        String num = Integer.toString(w + 1);
                                                                                        if (t.getLi_di_dom_a_d3() != null) {
                                                                                            if (t.getLi_di_dom_a_d3().trim().equals(num)) {
                                                                                %>    
                                                                                <option value="<%=num%>" selected=""><%=ListarDir_Dom.get(w)%></option>
                                                                                <%}
                                                                                        }%>
                                                                                <option value="<%=num%>"><%=ListarDir_Dom.get(w)%></option>
                                                                                <%
                                                                                        
                                                                                    }%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm" value="<%if (t.getDi_dom_a_d4() != null) {
                                                                                    out.print(t.getDi_dom_a_d4());
                                                                                } else {
                                                                                    out.print("");
                                                                                }%>" type="text" name="DIR_DOM_A_D4" id="DOM_A_D4" maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_A_D5_ID" id="DOM_A_D5" class="form-control input-group-sm"  required="">

                                                                                <option value="">[Seleccione Zona]</option>
                                                                                <%for (int e = 0; e < Listar_zona.size(); e++) {
                                                                                        Zona zo = new Zona();
                                                                                        zo = (Zona) Listar_zona.get(e);
                                                                                        if (t.getLi_di_dom_a_d5() != null) {
                                                                                            if (t.getLi_di_dom_a_d5().trim().equals(zo.getId_zona().trim())) {%>    
                                                                                <option value="<%=zo.getId_zona()%>" selected=""><%=zo.getDe_zona()%></option>
                                                                                <%} 
                                                                                        }%>
                                                                                <option value="<%=zo.getId_zona()%>"><%=zo.getDe_zona()%></option>
                                                                                <%
                                                                                       
                                                                                    }%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"   value="<%if (t.getDi_dom_a_d6() != null) {
                                                                                    out.print(t.getDi_dom_a_d6());
                                                                                } else {
                                                                                    out.print("");
                                                                                }%>" type="text" name="DIR_DOM_A_D6" id="DOM_A_D6" maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Referencia:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"   value="<%if (t.getDi_dom_a_ref() != null) {
                                                                                    out.print(t.getDi_dom_a_ref());
                                                                                } else {
                                                                                    out.print("");
                                                                                }%>" type="text" name="DIR_DOM_A_REF" id="DOM_A_REF" maxlength="200">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="row">
                                                            <div class="col-sm-3">

                                                                <div class="form-group">
                                                                    <label>Departamento:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <select  id="dep_dir_a" class="dep_dir_a form-control input-group-sm"  required="">

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="form-group">
                                                                    <label>Provincia:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <select   id="pro_dir_a" class="pro_dir_a form-control input-group-sm"  required="">

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="form-group">
                                                                    <label>Distrito:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <select name="DIR_DOM_A_DISTRITO_ID"  id="DOM_A_DISTRITO" class="dis_dir_a form-control input-group-sm"  required="">

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <button onclick="duplicar();
                                                                        return false;"  class="btn btn-primary" id="btn-duplicar">Duplicar</button>

                                                        </div>

                                                        <h3>- Domicilio Legal (segun DNI)</h3>
                                                        <label>Direccion :</label>
                                                        <div class="row">
                                                            <div class="col-sm-3">

                                                                <div class="form-group">

                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <select name="DIR_DOM_LEG_D1_ID"  id="DOM_LEG_D1" class="form-control input-group-sm"  required="">
                                                                            <option value="">[Seleccione Via]</option>
                                                                            <%for (int k = 0; k < Listar_via.size(); k++) {
                                                                                    Via zo = new Via();
                                                                                    zo = (Via) Listar_via.get(k);
                                                                                    if (t.getLi_di_dom_leg_d1() != null) {
                                                                                            if (t.getLi_di_dom_leg_d1().trim().equals(zo.getId_via().trim())) {%>    
                                                                            <option value="<%=zo.getId_via()%>" selected=""><%=zo.getDe_via()%></option>
                                                                            <%} 
                                                                                    }%>
                                                                            <option value="<%=zo.getId_via()%>"><%=zo.getDe_via()%></option>
                                                                            <%
                                                                                        
                                                                                    }%>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">

                                                                <div class="form-group">

                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <input class="form-control input-group-sm"  value="<%if (t.getDi_dom_leg_d2() != null) {
                                                                                out.print(t.getDi_dom_leg_d2());
                                                                            } else {
                                                                                out.print("");
                                                                            }%>"  type="text" name="DIR_DOM_LEG_D2" id="DOM_LEG_D2" maxlength="100">

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">

                                                                <div class="form-group">

                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <select name="DIR_DOM_LEG_D3_ID"  id="DOM_LEG_D3" class="form-control input-group-sm"  required="">
                                                                            <option value="">[Seleccione]</option>
                                                                            <%for (int x = 0; x < ListarDir_Dom.size(); x++) {
                                                                                    String num = Integer.toString(x + 1);
                                                                                    if (t.getLi_di_dom_leg_d3() != null) {
                                                                                        if (t.getLi_di_dom_leg_d3().trim().equals(num)) {
                                                                            %>
                                                                            <option value="<%=num%>" selected ><%=ListarDir_Dom.get(x)%></option>
                                                                            <%}
                                                                                } %>
                                                                            <option value="<%=num%>" ><%=ListarDir_Dom.get(x)%></option>
                                                                            <% 
                                                                                        
                                                                                    }%>

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">

                                                                <div class="form-group">

                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <input class="form-control input-group-sm"  value="<%if (t.getDi_dom_leg_d4() != null) {
                                                                                out.print(t.getDi_dom_leg_d4());
                                                                            } else {
                                                                                out.print("");
                                                                            }%>"   type="text" name="DIR_DOM_LEG_D4" id="DOM_LEG_D4" maxlength="100">

                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <select name="DIR_DOM_LEG_D5_ID"  id="DOM_LEG_D5" class="form-control input-group-sm"  required="">
                                                                            <option value="">[Seleccione Zona]</option>
                                                                            <%for (int q = 0; q < Listar_zona.size(); q++) {
                                                                                    Zona zo = new Zona();
                                                                                    zo = (Zona) Listar_zona.get(q);
                                                                                        if (t.getLi_di_dom_leg_d5() != null) {
                                                                                            if (t.getLi_di_dom_leg_d5().trim().equals(zo.getId_zona().trim())) {%>
                                                                            <option value="<%=zo.getId_zona()%>" selected=""><%=zo.getDe_zona()%></option>
                                                                            <%} 
                                                                                        }%>
                                                                            <option value="<%=zo.getId_zona()%>"><%=zo.getDe_zona()%></option> 
                                                                            <%}
                                                                                        
                                                                                    %> 
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="col-sm-6">

                                                                <div class="form-group">

                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <input class="form-control input-group-sm"   value="<%if (t.getDi_dom_leg_d6() != null) {
                                                                                out.print(t.getDi_dom_leg_d6());
                                                                            } else {
                                                                                out.print("");
                                                                            }%>"   type="text" name="DIR_DOM_LEG_D6" id="DOM_LEG_D6" maxlength="100">

                                                                    </div>
                                                                </div>
                                                            </div>



                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label>Departamento:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <select   id="dep_dir_l" class="dep_dir_l form-control input-group-sm"  required="">

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label>Provincia:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <select   id="pro_dir_l" class="pro_dir_l form-control input-group-sm"  required="">

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label>Distrito:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                        <select   name="DIR_DOM_LEG_DISTRITO_ID"   id="DOM_LEG_DISTRITO" class="dis_dir_l form-control input-group-sm"  required="">

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <h3>- Ingresos de Quinta Categoria</h3>

                                                        <div class="row">
                                                            <div class="col-sm-6">

                                                                <div class="form-group">
                                                                    <label>Empresa:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-suitcase fa-lg fa-fw"></i></span>
                                                                        <input class="form-control input-group-sm" value="<%if (t.getCa_ing_qta_cat_empresa() != null) {
                                                                                out.print(t.getCa_ing_qta_cat_empresa());
                                                                            } else {
                                                                                out.print("");
                                                                            }%>"  type="text" name="ING_QTA_CAT_EMPRESA"  maxlength="100">

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">

                                                                <div class="form-group">
                                                                    <label>RUC:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-file-o fa-lg fa-fw"></i></span>
                                                                        <input class="form-control input-group-sm" value="<%if (t.getCa_ing_qta_cat_ruc() != null) {
                                                                                out.print(t.getCa_ing_qta_cat_ruc());
                                                                            } else {
                                                                                out.print("");
                                                                            }%>"  type="text" name="ING_QTA_CAT_RUC"  maxlength="20">

                                                                    </div>
                                                                </div>
                                                            </div>


                                                        </div>
                                                        <div class="row">

                                                            <div class="col-sm-12">

                                                                <div class="form-group">
                                                                    <label>Otras Empresas:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-suitcase fa-lg fa-fw"></i></span>
                                                                        <textarea name="ING_QTA_CAT_OTRAS_EMPRESAS"   class="form-control input-group-sm"  cols="60" rows="6" maxlength="500" ><%if (t.getCa_ing_qta_cat_otras_empresas() != null) {
                                                                                out.print(t.getCa_ing_qta_cat_otras_empresas());
                                                                            } else {
                                                                                out.print("");
                                                                            }%></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                        </div>
                                                    </div>
                                                </div>

                                                <%String idtr = request.getParameter("idtr");%>
                                                <input type="hidden" name="idtr" value="<%=idtr%>"/>
                                                <input type="hidden" name="opc" value="Modificar_Asp_Soc">
                                                <footer>
                                                    <center>
                                                               <!-- <button type="submit" value="" name="opc"> MODIFICAR</button>-->
                                                                <button type="submit" class="btn btn-labeled btn-info" name="opc">
                                                                    <span class="btn-label">
                                                                        <i class="glyphicon glyphicon-pencil"></i>
                                                                    </span>Modificar
                                                                </button>
                                                            </center>
                                                </footer>
                                                <%
                                                        }%>
                                                         </form>
                                        </div>
                                       




                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->

                        </article>
                        <!-- WIDGET END -->


                    </div>

                    <!-- end row -->

                </section>
                <!-- end widget grid -->


            </div>
            <!-- END MAIN CONTENT -->

        </div>
    <center>                                                                     

        <button  data-toggle="modal" data-target="#myModal" id="btn-mostrar" hidden="">
            Launch demo modal
        </button>
    </center>
    <!-- END MAIN PANEL -->


    <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>

    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
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

    <!-- PAGE RELATED PLUGIN(S) -->
    <script src="../../js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="../../js/plugin/fuelux/wizard/wizard.min.js"></script>
    <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>

    <script>
                                                                    $(document).ready(function() {
                                                                        var p = 1;
                                                                        var texto_h = "";
                                                                        $(".btn-reg-hijo").click(function() {

                                                                            var tabla_hijo = $(".tabla-hijo");
                                                                            var ap_pat = $(".i_app_h");
                                                                            var ap_mat = $(".i_apm_h");
                                                                            var nombre = $(".i_no_h");
                                                                            var fe_nac = $(".i_fnac_h");
                                                                            var sexo = $(".i_sexo_h");
                                                                            var t_doc = $(".i_tdoc_h");
                                                                            var ndoc = $(".i_ndoc_h");
                                                                            var essalud = $(".i_essalud_h");
                                                                            var es_sup = $(".i_es_sup_h");

                                                                            texto_h += ("<tr class='tr-hijo_" + p + "'>");
                                                                            texto_h += ('<td ><label class="td-ap_pat' + p + '">' + ap_pat.val() + '</label><input type="hidden" value="' + ap_pat.val() + '" name="APELLIDO_P_H' + p + '" class="ap_p_h_' + p + '"/></td>');
                                                                            texto_h += ('<td ><label class="td-ap_mat' + p + '">' + ap_mat.val() + '</label><input type="hidden" value="' + ap_mat.val() + '" name="APELLIDO_M_H' + p + '" class="ap_m_h_' + p + '"/></td>');
                                                                            texto_h += ('<td ><label class="td-nom' + p + '">' + nombre.val() + '</label><input type="hidden" value="' + nombre.val() + '" name="NOMBRE_H' + p + '" class="no_h_' + p + '"/></td>');
                                                                            texto_h += ('<td ><label class="td-fe_nac' + p + '">' + fe_nac.val() + '</label><input type="hidden" value="' + fe_nac.val() + '" name="FECHA_NAC_H' + p + '" class="fe_n_h_' + p + '"/></td>');
                                                                            texto_h += (' <td ><label class="td-sex' + p + '">' + sexo.val() + '</label><input type="hidden" value="' + sexo.val() + '" name="SEXO_H' + p + '" class="sex_h_' + p + '"/></td>');
                                                                            texto_h += ('<td ><label class="td-tdoc' + p + '">' + t_doc.val() + '</label><input type="hidden" value="' + t_doc.val() + '" name="TIPO_DOC_ID_H' + p + '" class="ti_doc_h_' + p + '"/></td>');
                                                                            texto_h += ('<td ><label class="td-ndoc' + p + '">' + ndoc.val() + '</label><input type="hidden" value="' + ndoc.val() + '" name="NRO_DOC_H' + p + '" class="nu_doc_h_' + p + '"/></td>');
                                                                            texto_h += ('<td ><label class="td-essalud' + p + '">' + essalud.val() + '</label><input type="hidden" value="' + essalud.val() + '" name="ESSALUD_H' + p + '" class="essalud_h_' + p + '"/></td>');
                                                                            texto_h += ('<td ><label class="td-es_sup' + p + '">' + es_sup.val() + '</label><input type="hidden" value="' + es_sup.val() + '" name="EST_SUP_H' + p + '" class="es_sup_h_' + p + '"/></td>');
                                                                            texto_h += ('<td><a href="javascript:void(0);" class="btn btn-danger" onclick="$(\'.tr-hijo_' + p + '\').remove();">Quitar</a> <button class="btn btn-success btn-modificar_' + p + '" href="javascript:void(0);" type="button" value="' + p + '">Modificar</button></td>');
                                                                            texto_h += ("</tr>");
                                                                            tabla_hijo.append(texto_h);
                                                                            // $(".codigo").text(texto_h);


                                                                            ap_pat.val("");
                                                                            ap_mat.val("");
                                                                            nombre.val("");
                                                                            fe_nac.val("");
                                                                            sexo.val("");
                                                                            t_doc.val("");
                                                                            ndoc.val("");
                                                                            essalud.val("");
                                                                            es_sup.val("");

                                                                            $(".btn-modificar_" + p).click(function() {
                                                                                ap_pat.val($(".ap_p_h_" + $(this).val()).val());
                                                                                ap_mat.val($(".ap_m_h_" + $(this).val()).val());
                                                                                nombre.val($(".no_h_" + $(this).val()).val());
                                                                                fe_nac.val($(".fe_n_h_" + $(this).val()).val());
                                                                                sexo.val($(".sex_h_" + $(this).val()).val());
                                                                                t_doc.val($(".ti_doc_h_" + $(this).val()).val());
                                                                                ndoc.val($(".nu_doc_h_" + $(this).val()).val());
                                                                                essalud.val($(".essalud_h_" + $(this).val()).val());
                                                                                es_sup.val($(".es_sup_h_" + $(this).val()).val());

                                                                                $(".btn-reg-hijo").hide();
                                                                                $(".btn-mant").append('<button type="button" value="' + $(this).val() + '" class="btn-mod-hijo btn btn-info">Modificar Hijo</button>');
                                                                                $(".btn-mod-hijo").click(function() {

                                                                                    $(".ap_p_h_" + $(this).val()).val(ap_pat.val());
                                                                                    $(".ap_m_h_" + $(this).val()).val(ap_mat.val());
                                                                                    $(".no_h_" + $(this).val()).val(nombre.val());
                                                                                    $(".fe_n_h_" + $(this).val()).val(fe_nac.val());
                                                                                    $(".sex_h_" + $(this).val()).val(sexo.val());
                                                                                    $(".ti_doc_h_" + $(this).val()).val(t_doc.val());
                                                                                    $(".nu_doc_h_" + $(this).val()).val(ndoc.val());
                                                                                    $(".essalud_h_" + $(this).val()).val(essalud.val());
                                                                                    $(".es_sup_h_" + $(this).val()).val(es_sup.val());

                                                                                    $(".td-ap_pat" + $(this).val()).text(ap_pat.val());
                                                                                    $(".td-ap_mat" + $(this).val()).text(ap_mat.val());
                                                                                    $(".td-nom" + $(this).val()).text(nombre.val());
                                                                                    $(".td-fe_nac" + $(this).val()).text(fe_nac.val());
                                                                                    $(".td-sex" + $(this).val()).text(sexo.val());
                                                                                    $(".td-tdoc" + $(this).val()).text(t_doc.val());
                                                                                    $(".td-ndoc" + $(this).val()).text(ndoc.val());
                                                                                    $(".td-essalud" + $(this).val()).text(essalud.val());
                                                                                    $(".td-es_sup" + $(this).val()).text(es_sup.val());

                                                                                    ap_pat.val("");
                                                                                    ap_mat.val("");
                                                                                    nombre.val("");
                                                                                    fe_nac.val("");
                                                                                    sexo.val("");
                                                                                    t_doc.val("");
                                                                                    ndoc.val("");
                                                                                    essalud.val("");
                                                                                    es_sup.val("");
                                                                                    $(".btn-reg-hijo").show();
                                                                                    $(".btn-mod-hijo").remove();



                                                                                });
                                                                            });
                                                                            $(".num_hijo").val(p);
                                                                            p++;
                                                                            texto_h = "";

                                                                        });
                                                                    });</script>
    <script>
        $(document).ready(
                function() {

                    $("#no_cuen").hide();
                    $("#no_cuen_ban").hide();
                    $("#generar").hide();
                    $("#no_cuen_otros").hide();
                    //alert($("#es_cuenta").val());

                    $(".fecha").keyup(function() {

                        /*var arr_date = $(this).val().split("-");
                         if (arr_date[0].length > 4) {
                         //return false;
                         $(this).val("");
                         $(".edad").val("");
                         alert("fecha no valida");
                         
                         }*/

                    });

                    $("#banco").change(function() {
                        cuenta_bancaria($(this).val());
                        $("#es_cuenta").val(1);
                        //  alert($("#es_cuenta").val());
                    });

                    $("#es_civil").change(function() {
                        estado_civil($(this).val());
                    });
                    $("#DOM_A_D3").change(
                            function() {
                                if ($("#DOM_A_D3").val() == "3") {
                                    $("#DOM_A_D4").val("Sin Numero");
                                } else {

                                    $("#DOM_A_D4").val("");
                                }

                            }
                    );
                    $("#DOM_LEG_D3").change(
                            function() {
                                if ($("#DOM_LEG_D3").val() == "3") {
                                    $("#DOM_LEG_D4").val("Sin Numero");
                                } else {

                                    $("#DOM_LEG_D4").val("");
                                }

                            }
                    );
                    $("#reli").change(
                            function() {
                                if ($("#reli").val() == "1") {
                                    $("#igle").attr("required", "required")
                                } else {

                                    $("#igle").removeAttr("required");
                                }

                            }
                    );

                });

    </script>
    <script>
        function estado_civil(es_civil) {
            if (es_civil == '1' || es_civil == '3' || es_civil == '4' || es_civil == '5') {
                // alert("estado civil");

                //REMOVE REQUIRED
                $("#tra_upeu_con").removeAttr('required');
                $("#nom_ape_con").removeAttr('required');
                $("#nac_con").removeAttr('required');
                $("#doc_con").removeAttr('required');
                $("#num_con").removeAttr('required');
                $("#ins_vig_con").removeAttr('required');

                //ADD DISABLED
                document.getElementById("tra_upeu_con").disabled = true;
                document.getElementById("nom_ape_con").disabled = true;
                document.getElementById("nac_con").disabled = true;
                document.getElementById("doc_con").disabled = true;
                document.getElementById("num_con").disabled = true;
                document.getElementById("ins_vig_con").disabled = true;
            }
            if (es_civil == '2' || es_civil == '6') {
                // alert("estado civil");

                //REMOVE REQUIRED
                $("#tra_upeu_con").attr("required", "required");
                $("#nom_ape_con").attr("required", "required");
                $("#nac_con").attr("required", "required");
                $("#doc_con").attr("required", "required");
                $("#num_con").attr("required", "required");
                $("#ins_vig_con").removeAttr("required", "required");

                //ADD DISABLED
                document.getElementById("tra_upeu_con").disabled = false;
                document.getElementById("nom_ape_con").disabled = false;
                document.getElementById("nac_con").disabled = false;
                document.getElementById("doc_con").disabled = false;
                document.getElementById("num_con").disabled = false;
                document.getElementById("ins_vig_con").disabled = false;
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
        function Listar_Departamento_A() {
            var s = $(".dep_dir_a");
            $.post("../../ubigeo", "opc=Listar_D", function(objJson) {
                s.empty();
                var lista = objJson.lista;
                s.append("<option value='' > [SELECCIONE] </option>");
                for (var j = 0; j < lista.length; j++) {
                    if ($(".dep_a").val() == lista[j].id) {
                        s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].descripcion + "</option>");

                    } else {
                        s.append("<option value='" + lista[j].id + "'> " + lista[j].descripcion + "</option>");
                    }
                }

            });
        }
        function Listar_Provincia_A() {

            var s = $(".pro_dir_a");
            $.post("../../ubigeo", "opc=Listar_P&" + "id_dep=" + $(".dep_a").val(), function(objJson) {
                s.empty();
                var lista = objJson.lista;
                s.append("<option value='' > [SELECCIONE] </option>");
                for (var j = 0; j < lista.length; j++) {
                    if ($(".pro_a").val() == lista[j].id) {
                        s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].descripcion + "</option>");

                    } else {
                        s.append("<option value='" + lista[j].id + "'> " + lista[j].descripcion + "</option>");
                    }
                }

            });
        }
        function Listar_Distrito_A() {
            var s = $(".dis_dir_a");
            $.post("../../ubigeo", "opc=Listar_Di&" + "id_pro=" + $(".pro_a").val(), function(objJson) {
                s.empty();
                var lista = objJson.lista;
                s.append("<option value='' > [SELECCIONE] </option>");
                for (var j = 0; j < lista.length; j++) {
                    if ($(".dis_a").val() == lista[j].id) {
                        s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].descripcion + "</option>");

                    } else {
                        s.append("<option value='" + lista[j].id + "'> " + lista[j].descripcion + "</option>");
                    }
                }

            });
        }
        function Listar_Departamento_Leg() {
            var s = $(".dep_dir_l");
            $.post("../../ubigeo", "opc=Listar_D", function(objJson) {
                s.empty();
                var lista = objJson.lista;
                s.append("<option value='' > [SELECCIONE] </option>");
                for (var j = 0; j < lista.length; j++) {
                    if ($(".dep_leg").val() == lista[j].id) {
                        s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].descripcion + "</option>");

                    } else {
                        s.append("<option value='" + lista[j].id + "'> " + lista[j].descripcion + "</option>");
                    }
                }

            });
        }
        function Listar_Provincia_Leg() {

            var s = $(".pro_dir_l");
            $.post("../../ubigeo", "opc=Listar_P&" + "id_dep=" + $(".dep_leg").val(), function(objJson) {
                s.empty();
                var lista = objJson.lista;
                s.append("<option value='' > [SELECCIONE] </option>");
                for (var j = 0; j < lista.length; j++) {
                    if ($(".pro_leg").val() == lista[j].id) {
                        s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].descripcion + "</option>");

                    } else {
                        s.append("<option value='" + lista[j].id + "'> " + lista[j].descripcion + "</option>");
                    }
                }

            });
        }
        function Listar_Distrito_Leg() {
            var s = $(".dis_dir_l");
            $.post("../../ubigeo", "opc=Listar_Di&" + "id_pro=" + $(".pro_leg").val(), function(objJson) {
                s.empty();
                var lista = objJson.lista;
                s.append("<option value='' > [SELECCIONE] </option>");
                for (var j = 0; j < lista.length; j++) {
                    if ($(".dis_leg").val() == lista[j].id) {
                        s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].descripcion + "</option>");

                    } else {
                        s.append("<option value='" + lista[j].id + "'> " + lista[j].descripcion + "</option>");
                    }
                }

            });
        }

    </script> 
    <script>
        $(document).ready(
                function() {
                    Listar_Departamento_A();
                    Listar_Provincia_A();
                    Listar_Distrito_A();
                    Listar_Departamento_Leg();
                    Listar_Provincia_Leg();
                    Listar_Distrito_Leg();
                    $("#sis_pens").change(
                            function() {
                                if ($("#sis_pens").val() != "1") {
                                    $(".n_afp").remove();
                                    $("#nom_afp").attr("disabled", true);
                                    $(".afp").append('<input name="NOMBRE_AFP_ID" type="hidden" class="n_afp" value="6"/>');
                                    $("#nom_afp").val("6");
                                }
                                if ($("#sis_pens").val() == "1") {

                                    $("#nom_afp").val("");
                                    $("#nom_afp").removeAttr("disabled");
                                    $(".n_afp").remove();
                                }
                            }
                    );

                });


    </script>
    <script type="text/javascript">

        // DO NOT REMOVE : GLOBAL FUNCTIONS!

        $(document).ready(function() {

            pageSetUp();




            var $validator = $("#wizard-1").validate({
                rules: {
                    email: {
                        required: true,
                        email: "Your email address must be in the format of name@domain.com"
                    },
                    FECHA_NAC: {
                        required: true,
                        val_fecha: true
                    }
                    ,
                    FECHA_NAC_H: {
                        val_fecha: true
                    }
                    ,
                    fname: {
                        required: true
                    },
                    lname: {
                        required: true
                    },
                    country: {
                        required: true
                    },
                    city: {
                        required: true
                    },
                    postal: {
                        required: true,
                        minlength: 4
                    },
                    wphone: {
                        required: true,
                        minlength: 10
                    },
                    hphone: {
                        required: true,
                        minlength: 10
                    }
                },
                messages: {
                    fname: "Please specify your First name",
                    lname: "Please specify your Last name",
                    email: {
                        required: "We need your email address to contact you",
                        email: "Your email address must be in the format of name@domain.com"
                    }
                },
                highlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                },
                unhighlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                },
                errorElement: 'span',
                errorClass: 'help-block',
                errorPlacement: function(error, element) {
                    if (element.parent('.input-group').length) {
                        error.insertAfter(element.parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
            jQuery.validator.addMethod("val_fecha", function(value, element) {
                var d = value.split("-");
                return this.optional(element) || String(parseInt(d[0])).length == 4;
            }, "¡Fecha ingresada invalida!");

            $('#bootstrap-wizard-1').bootstrapWizard({
                'tabClass': 'form-wizard',
                'onNext': function(tab, navigation, index) {
                    var $valid = $("#wizard-1").valid();
                    if (!$valid) {
                        $validator.focusInvalid();
                        return false;
                    } else {
                        $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).addClass(
                                'complete');
                        $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).find('.step')
                                .html('<i class="fa fa-check"></i>');
                    }
                }
            });


            // fuelux wizard
            var wizard = $('.wizard').wizard();

            wizard.on('finished', function(e, data) {
                //$("#fuelux-wizard").submit();
                //console.log("submitted!");
                $.smallBox({
                    title: "Congratulations! Your form was submitted",
                    content: "<i class='fa fa-clock-o'></i> <i>1 seconds ago...</i>",
                    color: "#5F895F",
                    iconSmall: "fa fa-check bounce animated",
                    timeout: 4000
                });

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

    <!--Solo numeros -->
    <script type="text/javascript">
        $("#docs, .doc_c").numeric();
        $("#doc, .doc_c").numeric(false, function() {
            alert("Solo Numeros Enteros");
            this.value = "";
            this.focus();
        });
        $(".positive").numeric({negative: false}, function() {
            alert("No negative values");
            this.value = "";
            this.focus();
        });
        $(".positive-integer").numeric({decimal: false, negative: false}, function() {
            alert("Positive integers only");
            this.value = "";
            this.focus();
        });

        $("#remove").click(
                function(e)
                {
                    e.preventDefault();
                    $(".numeric,.integer,.positive").removeNumeric();
                }
        );
    </script>

    <!--boton duplicar-->
    <script>
        function  duplicar() {

            var DAD1 = $("#DOM_A_D1").val();
            var DAD2 = $("#DOM_A_D2").val();
            var DAD3 = $("#DOM_A_D3").val();
            var DAD4 = $("#DOM_A_D4").val();
            var DAD5 = $("#DOM_A_D5").val();
            var DAD6 = $("#DOM_A_D6").val();

            var DEP_A = $("#dep_dir_a").val();
            var PRO_ACT = $("#pro_dir_a").val();
            var DADIS = $("#DOM_A_DISTRITO").val();

            $("#DOM_LEG_D1").val(DAD1);
            $("#DOM_LEG_D2").val(DAD2);
            $("#DOM_LEG_D3").val(DAD3);
            $("#DOM_LEG_D4").val(DAD4);
            $("#DOM_LEG_D5").val(DAD5);
            $("#DOM_LEG_D6").val(DAD6);

            list_prov_id_dep(DEP_A,$("#pro_dir_l"),"1",PRO_ACT)
            list_dist_id_prov(PRO_ACT, $("#DOM_LEG_DISTRITO"), "1", DADIS);
            //  $("#DOM_LEG_DISTRITO").val(DADIS);
             $("#dep_dir_l").val(DEP_A);
            

        }


    </script>
    <!--Select dinamicos-->
    <script type="text/javascript">
    
        //============ Direccion ==============
        $("#dep_dir_a").change(function() {
            var ti = $("#pro_dir_a");
            ti.empty();
            var rg = $("#dep_dir_a").val();
            var data = "id_dep=" + rg + "&opc=dep_nac";
            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../ubigeo", data, function(objJson) {
                ti.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                if (lista.length > 0) {
                    ti.append("<option value=''>[Seleccione]</option>");
                } else {
                    ti.append("<option value=''>[]</option>");
                }
                for (var i = 0; i < lista.length; i++) {
                    var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                    ti.append(item);
                }
            });
        });
        $("#pro_dir_a").change(function() {
            var ti = $("#DOM_A_DISTRITO");
            ti.empty();
            var rg = $("#pro_dir_a").val();
            var data = "id_dist=" + rg + "&opc=pro_nac";
            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../ubigeo", data, function(objJson) {
                ti.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                if (lista.length > 0) {
                    ti.append("<option value=''>[Seleccione]</option>");
                } else {
                    ti.append("<option value=''>[]</option>");
                }
                for (var i = 0; i < lista.length; i++) {
                    var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                    ti.append(item);
                }
            });
        });
        //PROVINCIA
        $("#dep_dir_l").change(function() {
            var ti = $("#pro_dir_l");
            var rg = $("#dep_dir_l").val();
           list_prov_id_dep (rg,ti,"0","")
           
        });
        
        function list_prov_id_dep (rg,ti,selected,id_select){
             var data = "id_dep=" + rg + "&opc=dep_nac";
            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../ubigeo", data, function(objJson) {
                ti.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                if (lista.length > 0) {
                     if (selected == "0") {
                        ti.append("<option value=''>[Seleccione]</option>");
                        for (var i = 0; i < lista.length; i++) {
                            var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                            ti.append(item);
                        }

                    } else if (selected == "1") {

                        ti.append("<option value=''>[Seleccione]</option>");
                        for (var i = 0; i < lista.length; i++) {
                            if (id_select === lista[i].id) {
                                var item = "<option value='" + lista[i].id + "' selected>" + lista[i].descripcion + "</option>";
                                ti.append(item);
                            } else {
                                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                                ti.append(item);
                            }

                        }

                    }
                 
                } else {
                    ti.append("<option value=''>[]</option>");
                }
                
            });
            
        }
        
        
        //DISTRITO
        $("#pro_dir_l").change(function() {
            var ti = $("#DOM_LEG_DISTRITO");
            var rg = $("#pro_dir_l").val();
            list_dist_id_prov(rg, ti, "0", "");
         
         

        });

        function list_dist_id_prov(rg,ti,selected,id_select){
            var data = "id_dist=" + rg + "&opc=pro_nac";
            
            ti.append('<option value="">Cargando...</option>').val('');
            ti.empty();
            $.post("../../ubigeo", data, function(objJson) {
                ti.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                 if (lista.length > 0) {
                    if (selected == "0") {
                        ti.append("<option value=''>[Seleccione]</option>");
                        for (var i = 0; i < lista.length; i++) {
                            var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                            ti.append(item);
                        }

                    } else if (selected == "1") {

                        ti.append("<option value=''>[Seleccione]</option>");
                        for (var i = 0; i < lista.length; i++) {
                            if (id_select === lista[i].id) {
                                var item = "<option value='" + lista[i].id + "' selected>" + lista[i].descripcion + "</option>";
                                ti.append(item);
                            } else {
                                var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                                ti.append(item);
                            }

                        }

                    }


                } else {
                    ti.append("<option value=''>[]</option>");
                }
            });
        }

        /*Datos Academicos*/
        $("#rg").change(function() {
            var ti = $("#ti_inst");
            ti.empty();
            var rg = $("#rg").val();
            var data = "regimen=" + rg + "&opc=ti_inst";

            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../detalle_carrera", data, function(objJson) {
                ti.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                if (lista.length > 0) {
                    ti.append("<option value=''>[Seleccione]</option>");
                } else {
                    ti.append("<option value=''>[]</option>");
                }
                for (var i = 0; i < lista.length; i++) {
                    var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                    ti.append(item);
                }
            });
        });


        $("#ti_inst").change(function() {
            var inst = $("#inst");
            inst.empty();
            var ti = $("#ti_inst").val();
            /* if (sucursal == '000') {
             return;
             }*/
            var data = "ti=" + ti + "&opc=institucion";
            inst.append('<option value="">Cargando...</option>').val('');
            $.post("../../detalle_carrera", data, function(objJson) {
                inst.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                if (lista.length > 0) {
                    inst.append("<option value='0'>[Seleccione]</option>");
                } else {
                    inst.append("<option value='0'>[]</option>");
                }
                for (var i = 0; i < lista.length; i++) {
                    var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                    inst.append(item);
                }
            });
        });
        $("#inst").change(function() {
            var carr = $("#carrera");
            carr.empty();
            var insti = $("#inst").val();
            /* if (sucursal == '000') {
             return;
             }*/
            var data = "inst=" + insti + "&opc=carrera";
            carr.append('<option value="">Cargando...</option>').val('');
            $.post("../../detalle_carrera", data, function(objJson) {
                carr.empty();
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                if (lista.length > 0) {
                    carr.append("<option value='0'>[Seleccione]</option>");
                } else {
                    carr.append("<option value='0'>[]</option>");
                }
                for (var i = 0; i < lista.length; i++) {
                    var item = "<option value='" + lista[i].id + "'>" + lista[i].descripcion + "</option>";
                    carr.append(item);
                }
            });
        });
        /*$("#cboCuenta").change(function() {
         var cuenta = $("#cboCuenta").val();
         if (cuenta == "0") {
         return;
         }
         alert("Cuenta: " + cuenta);
         });*/
    </script>
    <script>
        $(document).ready(function() {
            var b = $(".tbodys");

            $("#btnfiltrar").click(
                    function() {


                        $.post("../../ajax/Ajax_Conyugue/Ajax_Busc_Conyug.jsp", $("#frm_filtro").serialize(), function(objJson) {
                            b.empty();
                            var list = objJson.lista;
                            for (var i = 0; i < list.length; i++) {
                                b.append("<tr>");
                                b.append("<td>" + list[i].NOM + " " + list[i].AP_PA + " " + list[i].AP_MA + "</td>");
                                b.append("<td>" + list[i].NU_DOC + "</td>");
                                b.append("<input type ='hidden' class='trab_" + i + "' value='" + list[i].ID_TRAB + "' />");
                                b.append("<input type ='hidden' class='nac_" + i + "' value='" + list[i].NAC + "' />");
                                b.append("<input type ='hidden' class='dni_" + i + "' value='" + list[i].NU_DOC + "' />");
                                b.append("<input type ='hidden' class='tipo_" + i + "' value='" + list[i].TIPO + "' />");
                                b.append("<input type ='hidden' class='nom_ape_" + i + "' value='" + list[i].NOM + " " + list[i].AP_PA + " " + list[i].AP_MA + "' />");
                                if (typeof (list[i].ID_C) === "undefined") {

                                    b.append('<td><button type="button" class="btn btn-primary btn-add-conyugue" value="' + i + '" data-dismiss="modal">Agregar</button></td>');
                                } else {
                                    b.append('<td>Tiene conyugue</td>');
                                }
                                b.append("</tr>");

                            }

                            $(".btn-add-conyugue").click(function() {
                                var v = $(this).val();
                                $(".nom_c").val($(".nom_ape_" + v).val());
                                $(".f_nac").val($(".nac_" + v).val());
                                $(".ti_documento").val($(".tipo_" + v).val());
                                $(".num_doc").val($(".dni_" + v).val());
                                $(".cony").val($(".trab_" + v).val());




                                //$(".select-conyugue").val("1");
                            });
                        }
                        );



                    });
            $(".btn-salir-busc, .close").click(function() {

                $(".select-conyugue").val("0");
            });


            $(".select-conyugue").change(function() {
                if ($(this).val() == "1") {
                    $("#btn-mostrar").click();
                }
                if ($(this).val() == "0") {
                    $(".nom_c").val("");
                    $(".f_nac").val("");
                    $(".ti_documento").val("");
                    $(".num_doc").val("");
                    $(".cony").val("");

                }

            }
            );
            $("#btncancel").click(
                    function() {
                        document.formulario.reset();
                        b.empty();
                        html = '<tr><td colspan="8" align="center">Haga la busqueda por algunos de los filtros...</td></tr>'
                        $(".tbodys").html(html);
                    }
            );

        }
        );


    </script>

</body>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }


%>