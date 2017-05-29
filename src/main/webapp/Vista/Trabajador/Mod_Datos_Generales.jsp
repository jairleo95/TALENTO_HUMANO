
<%@page import="pe.edu.upeu.application.util.DateFormat"%>
<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>
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
    String rol = (String) sesion_1.getAttribute("IDROL");

%>
<jsp:useBean id="List_Carrera" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Universidad" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Situacion_Educativa" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_zona" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_via" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="list_año" scope="session" class="java.util.ArrayList"/>

<jsp:useBean id="ListaridTrabajador" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Nacionalidad" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Departamento" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Provincia" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Distrito" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_tipo_doc" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title>Modificar Trabajador</title>
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

        <link href="../../css/jquery-ui.css" rel="stylesheet" type="text/css"/>

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
                        if ($("#nac").val() != "NAC-0193") {
                            $("#dist").hide();
                        }

                        $("#nac").change(
                                function() {
                                    if ($("#nac").val() != "NAC-0193") {
                                        $("#dist").hide();
                                        $("#dist_nac").val("DST-001835");

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
                                        <h2>MODIFICAR INFORMACIÓN GENERAL</h2>
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
                                                %>

                                                <div id="bootstrap-wizard-1" class="col-sm-12">

                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="tab1">


                                                            <div class="row">
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">
                                                                        <label >Apellido Paterno:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="APELLIDO_P" value="<%=t.getAp_paterno().trim()%>" required="" id="fname"  class="form-control input-group-sm"  onblur="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label >Apellido Materno:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="APELLIDO_M" value="<%=t.getAp_materno().trim()%>" required=""  id="lname"  class="form-control input-group-sm" onblur="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Nombre(s):</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="NOMBRES" value="<%=t.getNo_trabajador().trim()%>" required=""  id="lname1"  class="form-control input-group-sm" onblur="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Sexo:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="SEXO" class="form-control input-group-sm"  required="">
                                                                                <option value="">[SELLECCIONE]</option>
                                                                                <%if (t.getEs_sexo().trim().equals("M")) {%>
                                                                                <option value="M" selected="">Masculino</option>
                                                                                <option value="F">Femenino</option>
                                                                                <%}
                                                                                    if (t.getEs_sexo().trim().equals("F")) {%>
                                                                                <option value="M">Masculino</option>
                                                                                <option value="F" selected="">Femenino</option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Fecha Nacimiento:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-child fa-lg fa-fw"></i><label class="edad"></label></span>
                                                                            
                                                                            <input type="text" name="FECHA_NAC" <%if (!rol.equals("ROL-0001")) out.print("readonly=''");   %> required="" value="<%=DateFormat.toFormat4(t.getFe_nac())%>" id="edad"  class=" form-control input-group-sm fecha fechapicker"  data-mask="00/00/0000" autocomplete="off" required="">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Nacionalidad:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-flag fa-lg fa-fw"></i></span>
                                                                            <select name="NACIONALIDAD" class="form-control input-group-sm"  id="nac" required="" >
                                                                                <option value="" selected="">[SELECCIONE]</option>
                                                                                <%for (int s = 0; s < List_Nacionalidad.size(); s++) {
                                                                                        Nacionalidad nac = new Nacionalidad();
                                                                                        nac = (Nacionalidad) List_Nacionalidad.get(s);
                                                                                        if (nac.getNo_nacionalidad().equals(t.getNo_nacionalidad())) {
                                                                                %>
                                                                                <option value="<%=nac.getId_nacionalidad().trim()%>" selected="" ><%=nac.getNo_nacionalidad().trim()%></option>
                                                                                <%} else {%>
                                                                                <option value="<%=nac.getId_nacionalidad().trim()%>" ><%=nac.getNo_nacionalidad().trim()%></option>
                                                                                <%}
                                                                                    }%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>



                                                            </div>
                                                            <div class="row" id="dist">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Departamemto:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select  class="form-control input-group-sm" id="dep_nac" name="name" required="">
                                                                                <option value="" selected="selected">[SELECCIONE]</option>
                                                                                <%for (int d = 0; d < List_Departamento.size(); d++) {
                                                                                        Ub_Departamento dep = new Ub_Departamento();
                                                                                        dep = (Ub_Departamento) List_Departamento.get(d);
                                                                                        if (dep.getNo_departamento().equals(t.getNo_departamento())) {
                                                                                %>
                                                                                <option value="<%=dep.getId_departamento().trim()%>" selected=""><%=dep.getNo_departamento().trim()%></option>
                                                                                <%} else {%>
                                                                                <option value="<%=dep.getId_departamento().trim()%>" ><%=dep.getNo_departamento().trim()%></option>
                                                                                <%}
                                                                                    }%>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Provincia:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="pro_nac" name=""  required="">
                                                                                <option value="" selected="">[SELECCIONE]</option>
                                                                                <%for (int j = 0; j < List_Provincia.size(); j++) {
                                                                                        Ub_Provincia pro = new Ub_Provincia();
                                                                                        pro = (Ub_Provincia) List_Provincia.get(j);
                                                                                        if (pro.getNo_provincia().trim().equals(t.getNo_provincia())) {%>
                                                                                <option value="<%=pro.getId_provincia().trim()%>" selected=""><%=pro.getNo_provincia().trim()%></option>
                                                                                <%} else {%>
                                                                                <option value="<%=pro.getId_provincia().trim()%>" ><%=pro.getNo_provincia().trim()%></option>
                                                                                <%}
                                                                                    }%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Distrito:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" name="DISTRITO" id="dist_nac" required="">
                                                                                <option value="" selected="">[SELECCIONE]</option>
                                                                                <option value="DST-001832" >EXTRANJERO</option>
                                                                                <%for (int q = 0; q < List_Distrito.size(); q++) {
                                                                                        Ub_Distrito dis = new Ub_Distrito();
                                                                                        dis = (Ub_Distrito) List_Distrito.get(q);
                                                                                        if (dis.getNo_distrito().trim().equals(t.getNo_distrito())) {
                                                                                %>
                                                                                <option value="<%=dis.getId_distrito().trim()%>" selected=""><%=dis.getNo_distrito().trim()%></option>
                                                                                <%} else {%>      
                                                                                <option value="<%=dis.getId_distrito().trim()%>" ><%=dis.getNo_distrito().trim()%></option>
                                                                                <%}
                                                                                    }%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Tipo de Documento:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="TIPO_DOC" class="form-control input-group-sm select-doc" id="select-doc"  required="">
                                                                                <option value="">[SELECCIONE]</option>

                                                                                <%
                                                                                    for (int h = 0; h < Listar_tipo_doc.size(); h++) {
                                                                                        Tipo_Documento tdoc = new Tipo_Documento();
                                                                                        tdoc = (Tipo_Documento) Listar_tipo_doc.get(h);
                                                                                        if (t.getTi_doc().trim().equals(tdoc.getId_tipo_doc_ident().trim())) {
                                                                                %>
                                                                                <option value="<%=tdoc.getId_tipo_doc_ident().trim()%>" selected="" ><%=tdoc.getDe_tdoc_abreviada().trim()%></option>
                                                                                <%} else {%>
                                                                                <option value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada().trim()%></option>
                                                                                <%}
                                                                                    }%>
                                                                            </select>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Nro de Documento:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-list-alt fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="NRO_DOC" value="<%=t.getNu_doc().trim()%>" id="doc"  required="" maxlength="10" class="form-control input-group-sm doc" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Estado Civil:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select id="es_civil" name="ESTADO_CIVIL" class="form-control input-group-sm"  required="">
                                                                                <option value="">[SELECCIONE]</option>
                                                                                <%if (t.getEs_civil().equals("1")) {%>
                                                                                <option value="1" selected="">Soltero(a)</option>
                                                                                <option value="2">Casado(a)</option>
                                                                                <option value="3">Divorciado(a)</option>
                                                                                <option value="4">Viudo(a)</option>
                                                                                <option value="5">Separado(a)</option>
                                                                                <option value="6">Conviviente(a)</option>
                                                                                <%}
                                                                                    if (t.getEs_civil().trim().equals("2")) {%>
                                                                                <option value="1">Soltero(a)</option>
                                                                                <option value="2" selected="">Casado(a)</option>
                                                                                <option value="3">Divorciado(a)</option>
                                                                                <option value="4">Viudo(a)</option>
                                                                                <option value="5">Separado(a)</option>
                                                                                <option value="6">Conviviente(a)</option>
                                                                                <%}
                                                                                    if (t.getEs_civil().trim().equals("3")) {%>
                                                                                <option value="1">Soltero(a)</option>
                                                                                <option value="2">Casado(a)</option>
                                                                                <option value="3" selected="">Divorciado(a)</option>
                                                                                <option value="4">Viudo(a)</option>
                                                                                <option value="5">Separado(a)</option>
                                                                                <option value="6">Conviviente(a)</option>
                                                                                <%}
                                                                                    if (t.getEs_civil().trim().equals("4")) {%>
                                                                                <option value="1">Soltero(a)</option>
                                                                                <option value="2">Casado(a)</option>
                                                                                <option value="3">Divorciado(a)</option>
                                                                                <option value="4" selected="">Viudo(a)</option>
                                                                                <option value="5">Separado(a)</option>
                                                                                <option value="6">Conviviente(a)</option>
                                                                                <%}
                                                                                    if (t.getEs_civil().trim().equals("5")) {%>
                                                                                <option value="1">Soltero(a)</option>
                                                                                <option value="2">Casado(a)</option>
                                                                                <option value="3">Divorciado(a)</option>
                                                                                <option value="4">Viudo(a)</option>
                                                                                <option value="5" selected="">Separado(a)</option>
                                                                                <option value="6">Conviviente(a)</option>
                                                                                <%}
                                                                                    if (t.getEs_civil().trim().equals("6")) {%>
                                                                                <option value="1">Soltero(a)</option>
                                                                                <option value="2">Casado(a)</option>
                                                                                <option value="3">Divorciado(a)</option>
                                                                                <option value="4">Viudo(a)</option>
                                                                                <option value="5">Separado(a)</option>
                                                                                <option value="6" selected="">Conviviente(a)</option>
                                                                                <%}else{%>
                                                                                 <option value="1">Soltero(a)</option>
                                                                                <option value="2">Casado(a)</option>
                                                                                <option value="3" >Divorciado(a)</option>
                                                                                <option value="4">Viudo(a)</option>
                                                                                <option value="5">Separado(a)</option>
                                                                                <option value="6">Conviviente(a)</option>
                                                                                <%}%>
                                                                            </select>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row" >

                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <label>Grupo Sanguineo:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-group fa-lg fa-fw"></i></span>
                                                                            <select name="GRUPO_SANGUINEO" class="form-control input-group-sm"  required="">
                                                                                <option value="">[SELECCIONE]</option>

                                                                                <% if (t.getLi_grupo_sanguineo() != null) {
                                                                                        if (t.getLi_grupo_sanguineo().trim().equals("1")) {%>
                                                                                <option value="1" selected="">A</option>
                                                                                <option value="2">B</option>
                                                                                <option value="3">AB</option>
                                                                                <option value="4">0</option>
                                                                                <%}
                                                                                    if (t.getLi_grupo_sanguineo().trim().equals("2")) {%>
                                                                                <option value="1">A</option>
                                                                                <option value="2" selected="">B</option>
                                                                                <option value="3">AB</option>
                                                                                <option value="4">0</option>
                                                                                <%}
                                                                                    if (t.getLi_grupo_sanguineo().trim().equals("3")) {%>
                                                                                <option value="1">A</option>
                                                                                <option value="2">B</option>
                                                                                <option value="3" selected="">AB</option>
                                                                                <option value="4">0</option>
                                                                                <%}
                                                                                    if (t.getLi_grupo_sanguineo().trim().equals("4")) {%>
                                                                                <option value="1">A</option>
                                                                                <option value="2">B</option>
                                                                                <option value="3">AB</option>
                                                                                <option value="4" selected="">0</option>
                                                                                <%}
                                                                                } else {%>
                                                                                <<option value="1">A</option>
                                                                                <option value="2">B</option>
                                                                                <option value="3">AB</option>
                                                                                <option value="4">0</option>
                                                                                <% }%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <label>Factro RH:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="FACTOR_RH_ID" class="form-control input-group-sm"  required="">
                                                                                <option value="">[SELECCIONE]</option>
                                                                                <% if (t.getEs_factor_rh() != null) {
                                                                                        if (t.getEs_factor_rh().trim().equals("1")) {%>
                                                                                <option value="1" selected="">Positivo</option>
                                                                                <option value="2">Negativo</option>
                                                                                <%}
                                                                                    if (t.getEs_factor_rh().trim().equals("2")) {%>
                                                                                <option value="1">Positivo</option>
                                                                                <option value="2" selected="">Negativo</option>
                                                                                <%}
                                                                                } else {%>
                                                                                <option value="1">Positivo</option>
                                                                                <option value="2" >Negativo</option> 
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <label>Telefono:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-phone fa-lg fa-fw"></i></span>
                                                                                <%if (t.getTe_trabajador() != null) {%>
                                                                            <input type="text" name="TELEFONO"  value="<%=t.getTe_trabajador().trim()%>"  data-mask="(99) 999-9999" data-mask-placeholder= "X"   maxlength="50"  class="form-control input-group-sm telefono" >
                                                                            <%} else {%>
                                                                            <input type="text" name="TELEFONO"  value=""  data-mask="(99) 999-9999" data-mask-placeholder= "X"   maxlength="50"  class="form-control input-group-sm telefono" >
                                                                            <%}%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <label>Celular:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-mobile fa-lg fa-fw"></i></span>
                                                                                <%if (t.getCl_tra() != null) {%>
                                                                            <input type="text" name="CELULAR" value="<%=t.getCl_tra().trim()%>"  data-mask="999-999-999" data-mask-placeholder= "X" formnovalidate maxlength="38" class="form-control input-group-sm" >
                                                                            <%} else {%>
                                                                            <input type="text" name="CELULAR" value=""  data-mask="999-999-999" data-mask-placeholder= "X" formnovalidate maxlength="38" class="form-control input-group-sm" >
                                                                            <%}%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">    
                                                                        <label>Correo Personal:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-envelope fa-lg fa-fw"></i></span>
                                                                            <input type="email" name="CORREO_PERSONAL"  value="<%=t.getDi_correo_personal().trim()%>" required=""  maxlength="100" class="form-control input-group-sm" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label>Correo Institucional:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-envelope fa-lg fa-fw"></i></span>
                                                                                <%if (t.getDi_correo_inst() != null) {%>
                                                                            <input type="email" name="CORREO_INST" value="<%=t.getDi_correo_inst().trim().trim()%>" required=""  maxlength="100" class="form-control input-group-sm" >
                                                                            <%} else {%>
                                                                            <input type="email" name="CORREO_INST" value="" required=""  maxlength="100" class="form-control input-group-sm" >
                                                                            <%}%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <label>Sistema Pensionario:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="SISTEMA_PENSIONARIO" class="form-control input-group-sm"  id="sis_pens" required="">
                                                                                <option value="">[SELECCIONE]</option>
                                                                                <% if (t.getCo_sistema_pensionario() != null) {
                                                                                        if (t.getCo_sistema_pensionario().trim().equals("1")) {%>
                                                                                <option value="1" selected="">AFP</option>
                                                                                <option value="2">ONP</option>
                                                                                <option value="3">Sin Régimen Provisional(jubilado, cesante).</option>
                                                                                <option value="4">Fuera de Planilla</option>
                                                                                <%}
                                                                                    if (t.getCo_sistema_pensionario().trim().equals("2")) {%>
                                                                                <option value="1">AFP</option>
                                                                                <option value="2" selected="">ONP</option>
                                                                                <option value="3">Sin Régimen Provisional(jubilado, cesante).</option>
                                                                                <option value="4">Fuera de Planilla</option>
                                                                                <%}
                                                                                    if (t.getCo_sistema_pensionario().trim().equals("3")) {%>
                                                                                <option value="1">AFP</option>
                                                                                <option value="2">ONP</option>
                                                                                <option value="3" selected="">Sin Régimen Provisional(jubilado, cesante).</option>
                                                                                <option value="4">Fuera de Planilla</option>
                                                                                <%}
                                                                                    if (t.getCo_sistema_pensionario().trim().equals("4")) {%>
                                                                                <option value="1">AFP</option>
                                                                                <option value="2">ONP</option>
                                                                                <option value="3" >Sin Régimen Provisional(jubilado, cesante).</option>
                                                                                <option value="4" selected="">Fuera de Planilla</option>
                                                                                <%}
                                                                                } else {%>
                                                                                <option value="1">AFP</option>
                                                                                <option value="2">ONP</option>
                                                                                <option value="3">Sin Régimen Provisional(jubilado, cesante).</option>
                                                                                <option value="4">Fuera de Planilla</option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <label>Nombre AFP:</label>
                                                                        <div class="input-group afp" >
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="NOMBRE_AFP_ID" class="form-control input-group-sm" id="nom_afp" required=""  >
                                                                                <option value="">[SELECCIONE]</option>
                                                                                <% if (t.getId_no_afp() != null) {
                                                                                        if (t.getId_no_afp().trim().equals("1")) {%>
                                                                                <option value="1" selected="">Integra</option>
                                                                                <option value="2">Prima</option>
                                                                                <option value="3">Profuturo</option>
                                                                                <option value="4">Horizonte</option>
                                                                                <option value="5">Habitat</option>
                                                                                <option value="6">Ninguno</option>
                                                                                <%}
                                                                                    if (t.getId_no_afp().trim().equals("2")) {%>
                                                                                <option value="1">Integra</option>
                                                                                <option value="2" selected="">Prima</option>
                                                                                <option value="3">Profuturo</option>
                                                                                <option value="4">Horizonte</option>
                                                                                <option value="5">Habitat</option>
                                                                                <option value="6">Ninguno</option>
                                                                                <%}
                                                                                    if (t.getId_no_afp().trim().equals("3")) {%>
                                                                                <option value="1">Integra</option>
                                                                                <option value="2">Prima</option>
                                                                                <option value="3" selected="">Profuturo</option>
                                                                                <option value="4">Horizonte</option>
                                                                                <option value="5">Habitat</option>
                                                                                <option value="6">Ninguno</option>
                                                                                <%}
                                                                                    if (t.getId_no_afp().trim().equals("4")) {%>
                                                                                <option value="1">Integra</option>
                                                                                <option value="2">Prima</option>
                                                                                <option value="3">Profuturo</option>
                                                                                <option value="4" selected="">Horizonte</option>
                                                                                <option value="5">Habitat</option>
                                                                                <option value="6">Ninguno</option>
                                                                                <%}
                                                                                    if (t.getId_no_afp().trim().equals("5")) {%>
                                                                                <option value="1">Integra</option>
                                                                                <option value="2">Prima</option>
                                                                                <option value="3">Profuturo</option>
                                                                                <option value="4">Horizonte</option>
                                                                                <option value="5" selected="">Habitat</option>
                                                                                <option value="6">Ninguno</option>
                                                                                <%}
                                                                                    if (t.getId_no_afp().trim().equals("6")) {%>
                                                                                <option value="1">Integra</option>
                                                                                <option value="2">Prima</option>
                                                                                <option value="3">Profuturo</option>
                                                                                <option value="4">Horizonte</option>
                                                                                <option value="5">Habitat</option>
                                                                                <option value="6" selected="">Ninguno</option>
                                                                                <%}
                                                                                } else {%>
                                                                                <option value="1">Integra</option>
                                                                                <option value="2">Prima</option>
                                                                                <option value="3">Profuturo</option>
                                                                                <option value="4">Horizonte</option>
                                                                                <option value="5">Habitat</option>
                                                                                <option value="6">Ninguno</option> 
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <label>Afiliado ESSALUD-VIDA:<%out.print(t.getEs_afiliado_essalud());%></label>
                                                                        <div class="input-group" >
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="AFILIADO_ESSALUD_ID" class="form-control input-group-sm"  required="">
                                                                                <option value="">[SELECCIONE]</option>
                                                                                <%if (t.getEs_afiliado_essalud() != null) {
                                                                                        if (t.getEs_afiliado_essalud().trim().equals("1")) {%>
                                                                                <option value="1" selected="">Si</option>
                                                                                <option value="0">No</option>
                                                                                <%}
                                                                                    if (t.getEs_afiliado_essalud().trim().equals("0")) {%>
                                                                                <option value="1">Si</option>
                                                                                <option value="0" selected="">No</option>
                                                                                <%}
                                                                                } else {%>
                                                                                <option value="1">Si</option>
                                                                                <option value="0" selected="">No</option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <label>Tipo Trabajador:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="TIPO_TRABAJADOR_ID" class="form-control input-group-sm"  required="">
                                                                                <option value="">[SELECCIONE]</option>

                                                                                <% if (t.getLi_tipo_trabajador() != null) {
                                                                                        if (t.getLi_tipo_trabajador().trim().equals("T")) {%>
                                                                                <option value="T" selected >Trabajador</option>
                                                                                <option value="A">Alumno</option>
                                                                                <%}
                                                                                    if (t.getLi_tipo_trabajador().trim().equals("A")) {%>
                                                                                <option value="T">Trabajador</option>
                                                                                <option value="A" selected="">Alumno</option>
                                                                                <%}
                                                                                } else {%>
                                                                                <option value="T">Trabajador</option>
                                                                                <option value="A">Alumno</option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%
                                                                String edit = request.getParameter("edit");
                                                            %>
                                                            <!--<input type="text" value="<%=t.getFe_nac()%>"> -->               
                                                            <%String idtr = request.getParameter("idtr");%>
                                                            <input type="hidden" name="editar" id="editar" value="<%=edit%>"/>
                                                            <input type="hidden" name="idtr" value="<%=idtr.trim()%>"/>
                                                            <input type="hidden" name="opc" value="Modificar_Dat_Gen">
                                                            <input type="hidden" name="TI_DOC" value="<%=t.getTi_doc()%>">
                                                            <input type="hidden" name="NU_DOC" value="<%=t.getNu_doc()%>">
                                                            <input type="hidden" name="IDTR" value="<%=t.getId_trabajador()%>">
                                                            <input type="hidden" name="ES_CIVIL_A" value="<%=t.getEs_civil()%>">
                                                            <input type="hidden" name="ES_REGISTRO" value="0">

                                                            <center>
                                                                <!-- <button type="submit" value="" name="opc"> MODIFICAR</button>-->
                                                                <button type="submit" class="btn btn-labeled btn-info" name="opc">
                                                                    <span class="btn-label">
                                                                        <i class="glyphicon glyphicon-pencil"></i>
                                                                    </span>Modificar
                                                                </button>
                                                            </center>

                                                        </div>
                                                    </div>
                                                </div>
                                                <%}%>
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
    <script src="../../js/jquery-ui.js" type="text/javascript"></script>
    <script src="../../js/jquery.mask.js" type="text/javascript"></script>
    <script src="../../js/Js_Formulario/Js_Form.js" type="text/javascript"></script>
    <script>$(document).ready(function() {
                                                                                    $('#doc').click(function() {
                                                                                        // $('#doc').val("");
                                                                                    });
                                                                                    if ($(".select-doc").val() == 1) {
                                                                                        $("#doc").numeric(false, function() {
                                                                                        });
                                                                                        $(".doc").attr("maxlength", "8");
                                                                                        $(".doc").attr("minlength", "8");

                                                                                    } else {
                                                                                        $("#doc").removeNumeric();
                                                                                        $(".doc").attr("maxlength", "10");
                                                                                        $(".doc").removeAttr("minlength");
                                                                                        //    $(".doc").val("");
                                                                                    }
                                                                                    $(".doc").focus();

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
                                                                                    $(".select-doc").change(
                                                                                            function() {

                                                                                                $(".doc").val("");
                                                                                                if ($(".select-doc").val() == 1) {
                                                                                                    $("#doc").numeric(false, function() {
                                                                                                    });
                                                                                                    $(".doc").attr("maxlength", "8");
                                                                                                    $(".doc").attr("minlength", "8");

                                                                                                } else {
                                                                                                    $("#doc").removeNumeric();
                                                                                                    $(".doc").attr("maxlength", "10");
                                                                                                    $(".doc").removeAttr("minlength");
                                                                                                    //    $(".doc").val("");
                                                                                                }
                                                                                                $(".doc").focus();
                                                                                            }
                                                                                    );
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
                    if ($("#editar").val() === 'ok') {
                        document.getElementById("select-doc").disabled = true;
                        document.getElementById("doc").disabled = true;
                        document.getElementById("fname").readOnly = true;
                        document.getElementById("lname").readOnly = true;
                        document.getElementById("lname1").readOnly = true;

                    }
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
        function editarusuario(editar) {
            if (editar)
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

    </script> 
    <script>
        $(document).ready(
                function() {
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
                    lname1: {
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
                    fname: "Por Favor Ingrese su Apellido Paterno",
                    lname: "Por Favor Ingrese ",
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
           /* jQuery.validator.addMethod("val_fecha", function(value, element) {
                var d = value.split("-");
                return this.optional(element) || String(parseInt(d[0])).length == 4;
            }, "¡Fecha ingresada invalida!");*/

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


            var DADIS = $("#DOM_A_DISTRITO").val();
            var PRO_ACT = $("#pro_dir_a").val();

            $("#DOM_LEG_D1").val(DAD1);
            $("#DOM_LEG_D2").val(DAD2);
            $("#DOM_LEG_D3").val(DAD3);
            $("#DOM_LEG_D4").val(DAD4);
            $("#DOM_LEG_D5").val(DAD5);
            $("#DOM_LEG_D6").val(DAD6);
            $("#DOM_LEG_DISTRITO").val(DADIS);
            $("#dep_dir_l").val(DEP_A);
            $("#pro_dir_l").val(PRO_ACT);

        }


    </script>
    <!--Select dinamicos-->
    <script type="text/javascript">
        /*Ubigeo*/
        $("#dep_nac").change(function() {
            var ti = $("#pro_nac");
            ti.empty();
            var rg = $("#dep_nac").val();
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
        $("#pro_nac").change(function() {
            var ti = $("#dist_nac");
            ti.empty();
            var rg = $("#pro_nac").val();
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
        $("#dep_dir_l").change(function() {
            var ti = $("#pro_dir_l");
            ti.empty();
            var rg = $("#dep_dir_l").val();
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
        $("#pro_dir_l").change(function() {
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
        });




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
