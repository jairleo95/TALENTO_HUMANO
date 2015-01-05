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
    HttpSession sesion = request.getSession(true);
    String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
    String iduser = (String) sesion.getAttribute("IDUSER");

%>
<jsp:useBean id="List_Nacionalidad" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Departamento" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Carrera" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Universidad" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Situacion_Educativa" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_zona" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_via" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_tipo_doc" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html lang="en-us">
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



        <script type="text/javascript" src="../../js/JQuery/jQuery.js" ></script>
        <script type="text/javascript" src="../../js/JQuery/jquery.numeric.js"></script>
        <script type="text/javascript">
            $(document).ready(
                    function () {
                        var tip = $("#pro_dir_l");
                        tip.empty();
                        var rg = $("#dep_dir_l").val();
                        var data = "id_dep=" + rg + "&opc=dep_nac";
                        tip.append('<option value="">Cargando...</option>').val('');
                        $.post("../../ubigeo", data, function (objJson) {
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
                        $.post("../../ubigeo", data, function (objJson) {
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
                        $(".doc, .doc_c").val("");

                        $("#nac").change(
                                function () {
                                    if ($("#nac").val() != "NAC-0193") {
                                        $("#dist").hide();
                                        $("#dist_nac").val("DST-001832");


                                    }
                                    if ($("#nac").val() == "NAC-0193") {

                                        $("#dist").show();
                                    }
                                }
                        );

                        $("#sit_edu").change(function () {
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

                        $("#es_inst_p").change(function () {
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
                                function () {
                                    $(".doc").val("");
                                    if ($(".select-doc").val() == 1) {
                                        $("#doc").numeric(false, function () {
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

                                }
                        );
                        $(".select-doc_c").change(
                                function () {
                                    $(".doc_c").val("");
                                    if ($(".select-doc_c").val() == 1) {
                                        $(".doc_c").numeric(false, function () {
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
                    function () {
                        $(".alerta-req").hide();
                        $("#edad").change(
                                function () {
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
//retiramos el primer cero de la izquierda
                                    if (diaCumple.substr(0, 1) == 0) {
                                        diaCumple = diaCumple.substring(1, 2);
                                    }
                                    var edad = yyyyActual - yyyyCumple;

                                    if ((mmActual < mmCumple) || (mmActual == mmCumple && diaActual < diaCumple)) {
                                        edad--;
                                    }

                                    $(".edad").text(edad + " años");
                                    if (edad < 18) {
                                        $(".alerta-req").show();
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
                                    <span class="widget-icon"> <i class="fa fa-check"></i> </span>
                                    <h2>FICHA DE TRABAJADOR</h2>

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
                                                <div id="bootstrap-wizard-1" class="col-sm-12">
                                                    <div class="form-bootstrapWizard">
                                                        <ul class="bootstrapWizard form-wizard">
                                                            <li class="active" data-target="#step1">
                                                                <a href="#tab1" data-toggle="tab"> <span class="step">1</span> <span class="title">Datos Personales</span> </a>
                                                            </li>
                                                            <li data-target="#step2">
                                                                <a href="#tab2" data-toggle="tab"> <span class="step">2</span> <span class="title">Aspecto Academico</span> </a>
                                                            </li>
                                                            <li data-target="#step3">
                                                                <a href="#tab3" data-toggle="tab"> <span class="step">3</span> <span class="title">Aspecto Social</span> </a>
                                                            </li>
                                                            <li data-target="#step4">
                                                                <a href="#tab4" data-toggle="tab"> <span class="step">4</span> <span class="title">Datos Familiares</span> </a>
                                                            </li>


                                                        </ul>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="tab1">

                                                            <h3><strong>Paso 1 </strong> - Datos del Trabajador</h3>
                                                            <div class="row">
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="APELLIDO_P"  required="" id="fname" placeholder="Apellido Paterno"  class="form-control input-group-sm"  onkeyup="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="APELLIDO_M" required=""  id="lname" placeholder="Apellido Materno" class="form-control input-group-sm" onkeyup="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="NOMBRES" required=""  id="lname" placeholder="Nombres" class="form-control input-group-sm" onkeyup="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="SEXO" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Sexo]</option>
                                                                                <option value="M">Masculino</option>
                                                                                <option value="F">Femenino</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-child fa-lg fa-fw"></i></span>
                                                                            <input type="date" name="FECHA_NAC" required=""  id="edad" placeholder="Fecha de Nacimiento" class="form-control input-group-sm" >
                                                                            <p class="edad">
                                                                            <div class="alerta-req" style="display: none;">Es un menor de edad</div>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-flag fa-lg fa-fw"></i></span>
                                                                            <select name="NACIONALIDAD" class="form-control input-group-sm"  id="nac" required="" >
                                                                                <option value="" selected="selected">Nacionalidad</option>
                                                                                <%for (int s = 0; s < List_Nacionalidad.size(); s++) {
                                                                                        Nacionalidad nac = new Nacionalidad();
                                                                                        nac = (Nacionalidad) List_Nacionalidad.get(s);
                                                                                        if (nac.getId_nacionalidad().equals("NAC-0193")) {
                                                                                %>
                                                                                <option value="<%=nac.getId_nacionalidad()%>" selected="selected" ><%=nac.getNo_nacionalidad()%></option>
                                                                                <%} else {%>
                                                                                <option value="<%=nac.getId_nacionalidad()%>" ><%=nac.getNo_nacionalidad()%></option>
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
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select  class="form-control input-group-sm" id="dep_nac" name="name" required="">
                                                                                <option value="" selected="selected">[Departamento]</option>
                                                                                <%for (int d = 0; d < List_Departamento.size(); d++) {
                                                                                        Ub_Departamento dep = new Ub_Departamento();
                                                                                        dep = (Ub_Departamento) List_Departamento.get(d);

                                                                                %>
                                                                                <option value="<%=dep.getId_departamento()%>" ><%=dep.getNo_departamento()%></option>
                                                                                <%}%>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="pro_nac" name="" id="dist_nac" required="">
                                                                                <option value="" selected="selected">[Provincia]</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" name="DISTRITO" id="dist_nac" required="">
                                                                                <option value="" selected="selected">[Distrito]</option>
                                                                                <option value="DST-001832" >EXTRANJERO</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <div class="row" >
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="TIPO_DOC" class="form-control input-group-sm select-doc"  required="">
                                                                                <option value="">[Tipo Documento]</option>

                                                                                <%
                                                                                    for (int h = 0; h < Listar_tipo_doc.size(); h++) {
                                                                                        Tipo_Documento tdoc = new Tipo_Documento();
                                                                                        tdoc = (Tipo_Documento) Listar_tipo_doc.get(h);
                                                                                        if (tdoc.getId_tipo_doc_ident().trim().equals("1")) {
                                                                                %>
                                                                                <option selected="selected" value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%} else {%>

                                                                                <option value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%}
                                                                                    }%>
                                                                            </select>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-list-alt fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="NRO_DOC" id="doc" placeholder="Numero Documento" required="" maxlength="10" class="form-control input-group-sm doc" >

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="ESTADO_CIVIL" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Estado Civil]</option>
                                                                                <option value="1">Soltero(a)</option>
                                                                                <option value="2">Casado(a)</option>
                                                                                <option value="3">Divorciado(a)</option>
                                                                                <option value="4">Viudo(a)</option>
                                                                                <option value="5">Separado(a)</option>
                                                                                <option value="6">Conviviente(a)</option>
                                                                            </select>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row" >

                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-group fa-lg fa-fw"></i></span>
                                                                            <select name="GRUPO_SANGUINEO" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Grupo Sanguineo]</option>
                                                                                <option value="1">A</option>
                                                                                <option value="2">B</option>
                                                                                <option value="3">AB</option>
                                                                                <option value="4">0</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="FACTOR_RH_ID" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Factor RH]</option>
                                                                                <option value="1">Positivo</option>
                                                                                <option value="2">Negativo</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-phone fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="TELEFONO" id="doc" placeholder="Teléfono"  data-mask="+99 (999) 999-9999" data-mask-placeholder= "X"   formnovalidate maxlength="50" class="form-control input-group-sm" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-mobile fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="CELULAR" id="doc" placeholder="Celular"  data-mask="999-999-999" data-mask-placeholder= "X" formnovalidate maxlength="38" class="form-control input-group-sm" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-envelope fa-lg fa-fw"></i></span>
                                                                            <input type="email" name="CORREO_PERSONAL" id="doc" placeholder="Correo Personal"  required=""  maxlength="100" class="form-control input-group-sm" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-envelope fa-lg fa-fw"></i></span>
                                                                            <input type="email" name="CORREO_INST" id="doc" placeholder="Correo Institucional"  required=""  maxlength="100" class="form-control input-group-sm" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <script>
                                                                $(document).ready(
                                                                        function () {
                                                                            $("#sis_pens").change(
                                                                                    function () {
                                                                                        if ($("#sis_pens").val() != "1") {
                                                                                            $(".n_afp").remove();
                                                                                            $("#nom_afp").attr("disabled", true);
                                                                                            $(".afp").append('<input name="NOMBRE_AFP_ID" type="hidden" class="n_afp" value="6"/>');
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

                                                            <div class="row">

                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="SISTEMA_PENSIONARIO" class="form-control input-group-sm"  id="sis_pens" required="">
                                                                                <option value="">[Sistema Pensionario]</option>
                                                                                <option value="1">AFP</option>
                                                                                <option value="2">ONP</option>
                                                                                <option value="3">Ninguno</option>
                                                                                <option value="4">Sin Régimen Provisional(jubilado, cesante).</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group afp" >
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="NOMBRE_AFP_ID" class="form-control input-group-sm" id="nom_afp" required=""  >
                                                                                <option value="">[Nombre AFP]</option>
                                                                                <option value="1">Integra</option>
                                                                                <option value="2">Prima</option>
                                                                                <option value="3">Profuturo</option>
                                                                                <option value="4">Horizonte</option>
                                                                                <option value="5">Habitat</option>
                                                                                <option value="6">Ninguno</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group" >
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="AFILIADO_ESSALUD_ID" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Afiliado ESSALUD-VIDA]</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="2">No</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="TIPO_TRABAJADOR_ID" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Tipo Trabajador]</option>
                                                                                <option value="T" selected >Trabajador</option>
                                                                                <option value="A">Alumno</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                        </div>

                                                        <div class="tab-pane" id="tab2">

                                                            <h3><strong>Paso 2</strong> - Aspecto Académico</h3>

                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-mortar-board fa-lg fa-fw"></i></span>
                                                                            <select name="NIVEL_EDUCATIVO" class="form-control input-group-sm" id="sit_edu" required>
                                                                                <option value="" selected="selected" >[Situación Educativa]</option>
                                                                                <%for (int s = 0; s < List_Situacion_Educativa.size(); s++) {
                                                                                        Situacion_Educativa e = new Situacion_Educativa();
                                                                                        e = (Situacion_Educativa) List_Situacion_Educativa.get(s);
                                                                                %>
                                                                                <option value="<%=e.getId_situacion_educativa()%>"><%=e.getNo_s_educativa()%></option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="es_inst_p"style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="inst_peru" name="ES_INST_PERU" required>
                                                                                <option value="" selected="selected" >[¿Estudio en una institucion educativa del Perú?]</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="2">No</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="regimen" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="rg" name="REGIMEN" required>
                                                                                <option value="" selected="selected">[Regimen de la Institución Educativa]</option>
                                                                                <option value="1">Publica</option>
                                                                                <option value="2">Privada</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-4" id="ti" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="ti_inst"  required>
                                                                                <option value="" selected="selected">[Tipo de Institución]</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="institucion" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="inst"  required>
                                                                                <option value="" selected="selected">[Institución]</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="carr" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-mortar-board fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-group-sm" id="carrera" name="CARRERA" required>
                                                                                <option value="" selected="selected">[Carrera]</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4" id="egreso" style="display: none">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-mortar-board fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"  placeholder="Año Egreso" type="text"   maxlength="4" minlength="4"   name="A_EGRESO" >
                                                                        </div>
                                                                    </div>
                                                                </div>                        
                                                                <div class="col-sm-4">   <label>Tipo Hora Pago Referencial:</label>
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-money fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm" value="0"  placeholder="Tipo Hora Pago Referencial" type="text" name="TIPO_HORA_PAGO_REFEERENCIAL" maxlength="6">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--  <input pattern=".{3,}" required title="3 characters minimum">
                                                            <input pattern=".{5,10}" required title="5 to 10 characters">-->
                                                            <div class="row">

                                                                <div class="col-sm-10">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-align-justify fa-lg fa-fw"></i></span>
                                                                            <textarea name="OTROS_ESTUDIOS"  placeholder="Otros Estudios"  class="form-control input-group-sm" class="text-box" cols="60" rows="6" maxlength="500"></textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="tab-pane" id="tab3">

                                                            <strong>Paso 3</strong>
                                                            <h3>-Domicilio Actual del Trabajador</h3>
                                                            <label>Direccion :</label>
                                                            <div class="row">

                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_A_D1_ID" id="DOM_A_D1" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Seleccione Via]</option>
                                                                                <%for (int i = 0; i < Listar_via.size(); i++) {
                                                                                        Via zo = new Via();
                                                                                        zo = (Via) Listar_via.get(i);%>    
                                                                                <option value="<%=zo.getId_via()%>"><%=zo.getDe_via()%></option>
                                                                                <%}%>
                                                                            </select>   
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                                <div class="col-sm-3">
                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_A_D2" id="DOM_A_D2" maxlength="100">

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <script>
                                                                    $(document).ready(
                                                                            function () {
                                                                                $("#DOM_A_D3").change(
                                                                                        function () {
                                                                                            if ($("#DOM_A_D3").val() == "3") {
                                                                                                $("#DOM_A_D4").val("Sin Numero");
                                                                                            } else {

                                                                                                $("#DOM_A_D4").val("");
                                                                                            }

                                                                                        }
                                                                                );
                                                                                $("#DOM_LEG_D3").change(
                                                                                        function () {
                                                                                            if ($("#DOM_LEG_D3").val() == "3") {
                                                                                                $("#DOM_LEG_D4").val("Sin Numero");
                                                                                            } else {

                                                                                                $("#DOM_LEG_D4").val("");
                                                                                            }

                                                                                        }
                                                                                );
                                                                                $("#reli").change(
                                                                                        function () {
                                                                                            if ($("#reli").val() == "1") {
                                                                                                $("#igle").attr("required", "required")
                                                                                            } else {

                                                                                                $("#igle").removeAttr("required");
                                                                                            }

                                                                                        }
                                                                                );

                                                                            });

                                                                </script>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_A_D3_ID" id="DOM_A_D3" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Seleccione]</option>
                                                                                <option value="1">Número</option>
                                                                                <option value="2">Lote</option>
                                                                                <option value="3">S/N</option>
                                                                                <option value="4">Km</option>
                                                                                <option value="5">Block</option>
                                                                                <option value="6">Etapa</option>
                                                                                <option value="7">Departamento</option>
                                                                                <option value="8">Interior</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_A_D4" id="DOM_A_D4" maxlength="100">

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
                                                                                <%for (int i = 0; i < Listar_zona.size(); i++) {
                                                                                        Zona zo = new Zona();
                                                                                        zo = (Zona) Listar_zona.get(i);%>    
                                                                                <option value="<%=zo.getId_zona()%>"><%=zo.getDe_zona()%></option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_A_D6" id="DOM_A_D6" maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Referencia" type="text" name="DIR_DOM_A_REF" id="DOM_A_REF" maxlength="200">
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select  id="dep_dir_a" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Departamento]</option>
                                                                                <%for (int d = 0; d < List_Departamento.size(); d++) {
                                                                                        Ub_Departamento dep = new Ub_Departamento();
                                                                                        dep = (Ub_Departamento) List_Departamento.get(d);

                                                                                %>
                                                                                <option value="<%=dep.getId_departamento()%>" ><%=dep.getNo_departamento()%></option>
                                                                                <%}%>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select  id="pro_dir_a" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Provincia]</option>


                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_A_DISTRITO_ID"  id="DOM_A_DISTRITO" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Distrito]</option>
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
                                                                                <%for (int i = 0; i < Listar_via.size(); i++) {
                                                                                        Via zo = new Via();
                                                                                        zo = (Via) Listar_via.get(i);%>    
                                                                                <option value="<%=zo.getId_via()%>"><%=zo.getDe_via()%></option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_LEG_D2" id="DOM_LEG_D2" maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="DIR_DOM_LEG_D3_ID"  id="DOM_LEG_D3" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Seleccione]</option>
                                                                                <option value="1">Número</option>
                                                                                <option value="2">Lote</option>
                                                                                <option value="3">S/N</option>
                                                                                <option value="4">Km</option>
                                                                                <option value="5">Block</option>
                                                                                <option value="6">Etapa</option>
                                                                                <option value="7">Departamento</option>
                                                                                <option value="8">Interior</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_LEG_D4" id="DOM_LEG_D4" maxlength="100">

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
                                                                                <%for (int i = 0; i < Listar_zona.size(); i++) {
                                                                                        Zona zo = new Zona();
                                                                                        zo = (Zona) Listar_zona.get(i);%>    
                                                                                <option value="<%=zo.getId_zona()%>"><%=zo.getDe_zona()%></option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="" type="text" name="DIR_DOM_LEG_D6" id="DOM_LEG_D6" maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>



                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select   id="dep_dir_l" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Departamento]</option>
                                                                                <%for (int d = 0; d < List_Departamento.size(); d++) {
                                                                                        Ub_Departamento dep = new Ub_Departamento();
                                                                                        dep = (Ub_Departamento) List_Departamento.get(d);

                                                                                %>
                                                                                <option value="<%=dep.getId_departamento()%>" ><%=dep.getNo_departamento()%></option>
                                                                                <%}%>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select   id="pro_dir_l" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Provincia]</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select   name="DIR_DOM_LEG_DISTRITO_ID"   id="DOM_LEG_DISTRITO" class="form-control input-group-sm"  required="">
                                                                                <option value="">[Distrito]</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <h3>- Ingresos de Quinta Categoria</h3>

                                                            <div class="row">
                                                                <div class="col-sm-6">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-suitcase fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Empresa" type="text" name="ING_QTA_CAT_EMPRESA"  maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-file-o fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="RUC" type="text" name="ING_QTA_CAT_RUC"  maxlength="20">

                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <div class="row">

                                                                <div class="col-sm-12">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-suitcase fa-lg fa-fw"></i></span>
                                                                            <textarea name="ING_QTA_CAT_OTRAS_EMPRESAS"  placeholder="Otras Empresas"  class="form-control input-group-sm"  cols="60" rows="6" maxlength="500" ></textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <h3>- Informacion Religiosa</h3>

                                                            <div class="row">
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                            <select  class="form-control input-group-sm"  id="reli" required="" name="RELIGION">
                                                                                <option value="">[Religión]</option>
                                                                                <option value="1">Adventista</option>
                                                                                <option value="2">Catolico</option>
                                                                                <option value="3">Otros</option>
                                                                            </select>   

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-institution fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Iglesia" type="text" name="IGLESIA"   maxlength="30" id="igle">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-male fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Cargo en la Iglesia" type="text" name="CARGO"  maxlength="30">

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row"> 
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-male fa-lg fa-fw"></i></span>
                                                                            <select  name="AUTORIDAD" class="form-control input-group-sm"   >
                                                                                <option value="">[Autoridad]</option>
                                                                                <option value="1">Pastor</option>
                                                                                <option value="2">Primer Anciano</option>
                                                                                <option value="3">Sacerdote</option>
                                                                            </select>   

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Nombres y Apellidos" type="text" name="AUT_APELLIDOSNOMBRES"  maxlength="90">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-mobile-phone fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm"    placeholder="Telefono/Celular" type="text" name="AUT_CELULAR"  maxlength="20">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">

                                                                <div class="col-sm-12">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-suitcase fa-lg fa-fw"></i></span>
                                                                            <textarea  name="ING_QTA_CAT_OTRAS_EMPRESAS"  placeholder="Otras Empresas"  class="form-control input-group-sm"  cols="60" rows="6" maxlength="500" ></textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="tab-pane" id="tab4">

                                                            <h3><strong>Paso 4</strong> - DATOS DE PADRE Y MADRE</h3>

                                                            <div class="row">

                                                                <div class="col-sm-6">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" class="form-control input-group-sm" name="APELLIDOS_NOMBRES_PADRE" placeholder="Apellidos y nombres del Padre" required="">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text"  class="form-control input-group-sm" name="APELLIDOS_NOMBRES_MADRE" placeholder="Apellidos y nombre del Madre" required="">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <h3><strong>Paso 5</strong> - DATOS DEL CONYUGUE</h3>

                                                            <div class="row"> 
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-male fa-lg fa-fw"></i></span>


                                                                            <select name="TRABAJA_UPEU_CONYUGUE" required="" class="form-control input-group-sm select-conyugue" >
                                                                                <option value="" selected=""  disabled="">¿Trabaja Upeu Conyugue?</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="0">No</option>

                                                                            </select> 

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>

                                                                            <input type="text" name="APELLIDO_NOMBRES_CONYUGUE" placeholder="Apellidos y Nombres" required="" class="nom_c form-control input-group-sm" maxlength="110">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-calendar fa-lg fa-fw"></i></span>

                                                                            <input type="date" name="FECHA_NAC_CONYUGUE" placeholder="Fecha de Nacimiento dd/mm/yy" class="date f_nac form-control input-group-sm" required="">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">

                                                                    <div class="form-group">

                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-file fa-lg fa-fw"></i></span>
                                                                            <select name="TIPO_DOC_ID" required="" class="ti_documento form-control input-group-sm select-doc_c">
                                                                                <option value="">[Tipo Documento]</option>

                                                                                <%
                                                                                    for (int h = 0; h < Listar_tipo_doc.size(); h++) {
                                                                                        Tipo_Documento tdoc = new Tipo_Documento();
                                                                                        tdoc = (Tipo_Documento) Listar_tipo_doc.get(h);
                                                                                        if (tdoc.getId_tipo_doc_ident().trim().equals("1")) {
                                                                                %>
                                                                                <option selected="selected" value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%} else {%>

                                                                                <option value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%}
                                                                                    }%>
                                                                            </select> 
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-file fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="NRO_DOC_C" placeholder="Nro de Documento" maxlength="10" class="num_doc form-control input-group-sm doc_c" required="">
                                                                            <input type="hidden" class="cony"  name="CONYUGUE"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-file fa-lg fa-fw"></i></span>
                                                                            <select name="INSCRIPCION_VIG_ESSALUD" required=""  class="form-control input-group-sm" >
                                                                                <option value="" selected="" >[Inscripción Vigente en Essalud]</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="0">No</option>

                                                                            </select> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <h3><strong>Paso 6</strong> - DATOS DE HIJO(S)</h3>    
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="APELLIDO_P_H" placeholder="Apellido Paterno"  maxlength="30" class="form-control input-group-sm" required="">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text"  name="APELLIDO_M_H" placeholder="Apellido Materno"  maxlength="30" class="form-control input-group-sm" required="">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text"  name="NOMBRE_H" placeholder="Nombres"  maxlength="30" class="form-control input-group-sm" required="">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="date" name="FECHA_NAC_H" placeholder="Fecha de Nacimiento dd/mm/yy"  class="form-control input-group-sm"  required="">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="SEXO_H" required="" class="form-control input-group-sm" >
                                                                                <option value="" selected=""  >[Sexo]</option>
                                                                                <option value="M">Masculino</option>
                                                                                <option value="F">Femenino</option>

                                                                            </select> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="TIPO_DOC_ID_H"  class="form-control input-group-sm"  required="">
                                                                                <option value="">[Tipo Documento]</option>
                                                                                <%
                                                                                    for (int h = 0; h < Listar_tipo_doc.size(); h++) {
                                                                                        Tipo_Documento tdoc = new Tipo_Documento();
                                                                                        tdoc = (Tipo_Documento) Listar_tipo_doc.get(h);
                                                                                        if (tdoc.getId_tipo_doc_ident().trim().equals("1")) {
                                                                                %>
                                                                                <option selected="selected" value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%} else {%>

                                                                                <option value="<%=tdoc.getId_tipo_doc_ident().trim()%>"><%=tdoc.getDe_tdoc_abreviada()%></option>
                                                                                <%}
                                                                                    }%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="NRO_DOC_H"  class="form-control input-group-sm" placeholder="Nro de Documento" maxlength="10" required="">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="INSCRIPCION_VIG_ESSALUD_H" required=""  class="form-control input-group-sm">
                                                                                <option value="" selected="" disabled="">[Inscripción Vigente en Essalud]</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="0">No</option>

                                                                            </select> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="ESTUD_NIV_SUPERIOR_H" class="form-control input-group-sm" required="">
                                                                                <option value="" selected="" disabled="">Estudio de Nivel Superior</option>
                                                                                <option value="1">Si</option>
                                                                                <option value="0">No</option>

                                                                            </select> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <input type="submit" name="opc"  class="submit btn btn-primary btn-lg" value="Registrar">

                                                        </div>


                                                        <div class="form-actions">
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <ul class="pager wizard no-margin">
                                                                        <!--<li class="previous first disabled">
                                                                        <a href="javascript:void(0);" class="btn btn-lg btn-default"> First </a>
                                                                        </li>-->
                                                                        <li class="previous disabled">
                                                                            <a href="javascript:void(0);" class="btn btn-lg btn-default"> Atras </a>
                                                                        </li>
                                                                        <!--<li class="next last">
                                                                        <a href="javascript:void(0);" class="btn btn-lg btn-primary"> Last </a>
                                                                        </li>-->
                                                                        <li class="next">
                                                                            <a href="javascript:void(0);" class="btn btn-lg txt-color-darken"> Siguiente </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
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
    <center>                                                                       <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Encontrar Conyugue</h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div id="contenido">
                                <div >

                                    <form class="form-inline" id="frm_filtro" method="post" name="formulario"  >

                                        <div class="row">
                                            <div class="form-group" >
                                                <label class="control-label" >Nombres</label><br>
                                                <input type="text"  class="form-control"  name="nom" maxlength="80" >
                                            </div>
                                            <div class="form-group" >
                                                <label class="control-label" >Apellido Paterno</label><br>
                                                <input type="text"  class="form-control"  name="ap_pa" maxlength="80">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="control-label" >Apellido Materno</label><br>
                                                <input type="text"  class="form-control"  name="ap_ma" maxlength="80" >
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label" >DNI:</label><br>
                                                <input type="text"  class="form-control"  onKeyPress="return checkIt(event)"   name="dni" maxlength="8">
                                            </div>
                                        </div>

                                        <div class="row">

                                            <div class="form-group">                            
                                                <button type="button" class="btn btn-primary" id="btnfiltrar" >Buscar</button>
                                            </div>
                                            <div class="form-group">  
                                                <a href="javascript:;"  id="btncancel" class="btn btn-primary" >Cancelar</a>
                                            </div>

                                        </div>

                                    </form>

                                </div> 

                                <hr/>

                                <table  id="data"  >
                                    <thead class="tab_cabe">
                                        <tr>
                                            <td><span title="NOMBRE_AP">Nombres y Apellidos</span></td>
                                            <td><span  >DNI</span></td>
                                            <td></td>

                                        </tr>
                                    </thead>

                                    <tbody class="tbodys">
                                    </tbody>
                                </table>

                            </div>
                        </div>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-salir-busc"  data-dismiss="modal">Salir</button>

                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
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

    <script type="text/javascript">

                                                    // DO NOT REMOVE : GLOBAL FUNCTIONS!

                                                    $(document).ready(function () {

                                                        pageSetUp();



                                                        //Bootstrap Wizard Validations

                                                        var $validator = $("#wizard-1").validate({
                                                            rules: {
                                                                email: {
                                                                    required: true,
                                                                    email: "Your email address must be in the format of name@domain.com"
                                                                },
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
                                                            highlight: function (element) {
                                                                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                                                            },
                                                            unhighlight: function (element) {
                                                                $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                                                            },
                                                            errorElement: 'span',
                                                            errorClass: 'help-block',
                                                            errorPlacement: function (error, element) {
                                                                if (element.parent('.input-group').length) {
                                                                    error.insertAfter(element.parent());
                                                                } else {
                                                                    error.insertAfter(element);
                                                                }
                                                            }
                                                        });

                                                        $('#bootstrap-wizard-1').bootstrapWizard({
                                                            'tabClass': 'form-wizard',
                                                            'onNext': function (tab, navigation, index) {
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

                                                        wizard.on('finished', function (e, data) {
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

        (function () {
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
        $("#doc, .doc_c").numeric(false, function () {
            alert("Solo Numeros Enteros");
            this.value = "";
            this.focus();
        });
        $(".positive").numeric({negative: false}, function () {
            alert("No negative values");
            this.value = "";
            this.focus();
        });
        $(".positive-integer").numeric({decimal: false, negative: false}, function () {
            alert("Positive integers only");
            this.value = "";
            this.focus();
        });

        $("#remove").click(
                function (e)
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
        $("#dep_nac").change(function () {
            var ti = $("#pro_nac");
            ti.empty();
            var rg = $("#dep_nac").val();
            var data = "id_dep=" + rg + "&opc=dep_nac";
            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../ubigeo", data, function (objJson) {
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
        $("#pro_nac").change(function () {
            var ti = $("#dist_nac");
            ti.empty();
            var rg = $("#pro_nac").val();
            var data = "id_dist=" + rg + "&opc=pro_nac";
            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../ubigeo", data, function (objJson) {
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
        $("#dep_dir_a").change(function () {
            var ti = $("#pro_dir_a");
            ti.empty();
            var rg = $("#dep_dir_a").val();
            var data = "id_dep=" + rg + "&opc=dep_nac";
            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../ubigeo", data, function (objJson) {
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
        $("#pro_dir_a").change(function () {
            var ti = $("#DOM_A_DISTRITO");
            ti.empty();
            var rg = $("#pro_dir_a").val();
            var data = "id_dist=" + rg + "&opc=pro_nac";
            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../ubigeo", data, function (objJson) {
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
        $("#dep_dir_l").change(function () {
            var ti = $("#pro_dir_l");
            ti.empty();
            var rg = $("#dep_dir_l").val();
            var data = "id_dep=" + rg + "&opc=dep_nac";
            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../ubigeo", data, function (objJson) {
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
        $("#pro_dir_l").change(function () {
            var ti = $("#DOM_LEG_DISTRITO");
            ti.empty();
            var rg = $("#pro_dir_l").val();
            var data = "id_dist=" + rg + "&opc=pro_nac";
            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../ubigeo", data, function (objJson) {
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
        $("#rg").change(function () {
            var ti = $("#ti_inst");
            ti.empty();
            var rg = $("#rg").val();
            var data = "regimen=" + rg + "&opc=ti_inst";

            ti.append('<option value="">Cargando...</option>').val('');
            $.post("../../detalle_carrera", data, function (objJson) {
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


        $("#ti_inst").change(function () {
            var inst = $("#inst");
            inst.empty();
            var ti = $("#ti_inst").val();
            /* if (sucursal == '000') {
             return;
             }*/
            var data = "ti=" + ti + "&opc=institucion";
            inst.append('<option value="">Cargando...</option>').val('');
            $.post("../../detalle_carrera", data, function (objJson) {
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
        $("#inst").change(function () {
            var carr = $("#carrera");
            carr.empty();
            var insti = $("#inst").val();
            /* if (sucursal == '000') {
             return;
             }*/
            var data = "inst=" + insti + "&opc=carrera";
            carr.append('<option value="">Cargando...</option>').val('');
            $.post("../../detalle_carrera", data, function (objJson) {
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
        $(document).ready(function () {
            var b = $(".tbodys");

            $("#btnfiltrar").click(
                    function () {


                        $.post("../../ajax/Ajax_Conyugue/Ajax_Busc_Conyug.jsp", $("#frm_filtro").serialize(), function (objJson) {
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
                                if (typeof(list[i].ID_C) === "undefined") {
                                    
                                   b.append('<td><button type="button" class="btn btn-primary btn-add-conyugue" value="' + i + '" data-dismiss="modal">Agregar</button></td>');
                                } else {
                                    b.append('<td>Tiene conyugue</td>');
                                }
                                b.append("</tr>");

                            }

                            $(".btn-add-conyugue").click(function () {
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
            $(".btn-salir-busc, .close").click(function () {

                $(".select-conyugue").val("0");
            });


            $(".select-conyugue").change(function () {
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
                    function () {
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