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
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> SmartAdmin </title>
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




                        $(".doc").attr("maxlength", "8");
                        $(".doc").val("");
                        $("#nac").change(
                                function() {
                                    if ($("#nac").val() != "NAC-0044") {
                                        $("#dist").hide();
                                        $("#dist_nac").val("DST-001832");


                                    }
                                    if ($("#nac").val() == "NAC-0044") {

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
                                        // $(".doc").val("");

                                    }
                                    if ($(".select-doc").val() == 2) {

                                        $("#doc").removeNumeric();
                                        $(".doc").attr("maxlength", "10");
                                        //    $(".doc").val("");
                                    }
                                    if ($(".select-doc").val() == 3) {
                                        $("#doc").removeNumeric();
                                        $(".doc").attr("maxlength", "10");
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
            .btn-duplicar{
                margin-left: 30%;
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
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-sm-12 col-md-12 col-lg-6">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false">
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
                                            <form id="wizard-1" novalidate="novalidate">
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
                                                                <a href="#tab4" data-toggle="tab"> <span class="step">4</span> <span class="title">Save Form</span> </a>
                                                            </li>

                                                        </ul>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="tab1">
                                                            <br>
                                                            <h3><strong>Step 1 </strong> - Basic Information</h3>



                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="APELLIDO_P"  required="" id="fname" placeholder="Apellido Paterno"  class="form-control input-lg"  onkeyup="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="APELLIDO_M" required=""  id="lname" placeholder="Apellido Materno" class="form-control input-lg" onkeyup="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="NOMBRES" required=""  id="lname" placeholder="Nombres" class="form-control input-lg" onkeyup="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="SEXO" class="form-control input-lg"  required="">
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
                                                                            <span class="input-group-addon"><i class="fa fa-flag fa-lg fa-fw"></i></span>
                                                                            <input type="date" name="FECHA_NAC" required=""  id="edad" placeholder="Fecha de Nacimiento" class="form-control input-lg" >
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
                                                                            <select name="NACIONALIDAD" class="form-control input-lg"  id="nac" required="" >
                                                                                <option value="" selected="selected">Nacionalidad</option>
                                                                                <%for (int s = 0; s < List_Nacionalidad.size(); s++) {
                                                                                        Nacionalidad nac = new Nacionalidad();
                                                                                        nac = (Nacionalidad) List_Nacionalidad.get(s);
                                                                                        if (nac.getId_nacionalidad().equals("NAC-0044")) {
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
                                                                            <select  class="form-control input-lg" id="dep_nac" name="name" required="">
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
                                                                            <select class="form-control input-lg" id="pro_nac" name="" id="dist_nac" required="">
                                                                                <option value="" selected="selected">[Provincia]</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-lg" name="DISTRITO" id="dist_nac" required="">
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
                                                                            <select name="TIPO_DOC" class="form-control input-lg select-doc"  required="">
                                                                                <option value="">[Tipo Documento]</option>
                                                                                <option value="1" selected="selected" >DNI</option>
                                                                                <option value="2">Carné de Extranjeria</option>
                                                                                <option value="3">Pasaporte</option>
                                                                            </select>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="NRO_DOC" id="doc" placeholder="Numero Documento" required="" maxlength="10" class="form-control input-lg doc" >

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="ESTADO_CIVIL" class="form-control input-lg select-doc"  required="">
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

                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="GRUPO_SANGUINEO" class="form-control input-lg"  required="">
                                                                                <option value="">[Grupo Sanguineo]</option>
                                                                                <option value="1">A</option>
                                                                                <option value="2">B</option>
                                                                                <option value="3">AB</option>
                                                                                <option value="4">0</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="tab-pane" id="tab2">
                                                            <br>
                                                            <h3><strong>Step 2</strong> - Billing Information</h3>

                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-flag fa-lg fa-fw"></i></span>
                                                                            <select name="country" class="form-control input-lg">
                                                                                <option value="" selected="selected">Select Country</option>
                                                                                <option value="United States">United States</option>
                                                                                <option value="United Kingdom">United Kingdom</option>
                                                                                <option value="Afghanistan">Afghanistan</option>
                                                                                <option value="Albania">Albania</option>
                                                                                <option value="Algeria">Algeria</option>
                                                                                <option value="American Samoa">American Samoa</option>
                                                                                <option value="Andorra">Andorra</option>
                                                                                <option value="Angola">Angola</option>
                                                                                <option value="Anguilla">Anguilla</option>
                                                                                <option value="Antarctica">Antarctica</option>
                                                                                <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                                                                <option value="Argentina">Argentina</option>
                                                                                <option value="Armenia">Armenia</option>
                                                                                <option value="Aruba">Aruba</option>
                                                                                <option value="Australia">Australia</option>
                                                                                <option value="Austria">Austria</option>
                                                                                <option value="Azerbaijan">Azerbaijan</option>
                                                                                <option value="Bahamas">Bahamas</option>
                                                                                <option value="Bahrain">Bahrain</option>
                                                                                <option value="Bangladesh">Bangladesh</option>
                                                                                <option value="Barbados">Barbados</option>
                                                                                <option value="Belarus">Belarus</option>
                                                                                <option value="Belgium">Belgium</option>
                                                                                <option value="Belize">Belize</option>
                                                                                <option value="Benin">Benin</option>
                                                                                <option value="Bermuda">Bermuda</option>
                                                                                <option value="Bhutan">Bhutan</option>
                                                                                <option value="Bolivia">Bolivia</option>
                                                                                <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                                                                <option value="Botswana">Botswana</option>
                                                                                <option value="Bouvet Island">Bouvet Island</option>
                                                                                <option value="Brazil">Brazil</option>
                                                                                <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                                                                                <option value="Brunei Darussalam">Brunei Darussalam</option>
                                                                                <option value="Bulgaria">Bulgaria</option>
                                                                                <option value="Burkina Faso">Burkina Faso</option>
                                                                                <option value="Burundi">Burundi</option>
                                                                                <option value="Cambodia">Cambodia</option>
                                                                                <option value="Cameroon">Cameroon</option>
                                                                                <option value="Canada">Canada</option>
                                                                                <option value="Cape Verde">Cape Verde</option>
                                                                                <option value="Cayman Islands">Cayman Islands</option>
                                                                                <option value="Central African Republic">Central African Republic</option>
                                                                                <option value="Chad">Chad</option>
                                                                                <option value="Chile">Chile</option>
                                                                                <option value="China">China</option>
                                                                                <option value="Christmas Island">Christmas Island</option>
                                                                                <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                                                                                <option value="Colombia">Colombia</option>
                                                                                <option value="Comoros">Comoros</option>
                                                                                <option value="Congo">Congo</option>
                                                                                <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option>
                                                                                <option value="Cook Islands">Cook Islands</option>
                                                                                <option value="Costa Rica">Costa Rica</option>
                                                                                <option value="Cote D'ivoire">Cote D'ivoire</option>
                                                                                <option value="Croatia">Croatia</option>
                                                                                <option value="Cuba">Cuba</option>
                                                                                <option value="Cyprus">Cyprus</option>
                                                                                <option value="Czech Republic">Czech Republic</option>
                                                                                <option value="Denmark">Denmark</option>
                                                                                <option value="Djibouti">Djibouti</option>
                                                                                <option value="Dominica">Dominica</option>
                                                                                <option value="Dominican Republic">Dominican Republic</option>
                                                                                <option value="Ecuador">Ecuador</option>
                                                                                <option value="Egypt">Egypt</option>
                                                                                <option value="El Salvador">El Salvador</option>
                                                                                <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                                                <option value="Eritrea">Eritrea</option>
                                                                                <option value="Estonia">Estonia</option>
                                                                                <option value="Ethiopia">Ethiopia</option>
                                                                                <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                                                                                <option value="Faroe Islands">Faroe Islands</option>
                                                                                <option value="Fiji">Fiji</option>
                                                                                <option value="Finland">Finland</option>
                                                                                <option value="France">France</option>
                                                                                <option value="French Guiana">French Guiana</option>
                                                                                <option value="French Polynesia">French Polynesia</option>
                                                                                <option value="French Southern Territories">French Southern Territories</option>
                                                                                <option value="Gabon">Gabon</option>
                                                                                <option value="Gambia">Gambia</option>
                                                                                <option value="Georgia">Georgia</option>
                                                                                <option value="Germany">Germany</option>
                                                                                <option value="Ghana">Ghana</option>
                                                                                <option value="Gibraltar">Gibraltar</option>
                                                                                <option value="Greece">Greece</option>
                                                                                <option value="Greenland">Greenland</option>
                                                                                <option value="Grenada">Grenada</option>
                                                                                <option value="Guadeloupe">Guadeloupe</option>
                                                                                <option value="Guam">Guam</option>
                                                                                <option value="Guatemala">Guatemala</option>
                                                                                <option value="Guinea">Guinea</option>
                                                                                <option value="Guinea-bissau">Guinea-bissau</option>
                                                                                <option value="Guyana">Guyana</option>
                                                                                <option value="Haiti">Haiti</option>
                                                                                <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
                                                                                <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                                                                                <option value="Honduras">Honduras</option>
                                                                                <option value="Hong Kong">Hong Kong</option>
                                                                                <option value="Hungary">Hungary</option>
                                                                                <option value="Iceland">Iceland</option>
                                                                                <option value="India">India</option>
                                                                                <option value="Indonesia">Indonesia</option>
                                                                                <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
                                                                                <option value="Iraq">Iraq</option>
                                                                                <option value="Ireland">Ireland</option>
                                                                                <option value="Israel">Israel</option>
                                                                                <option value="Italy">Italy</option>
                                                                                <option value="Jamaica">Jamaica</option>
                                                                                <option value="Japan">Japan</option>
                                                                                <option value="Jordan">Jordan</option>
                                                                                <option value="Kazakhstan">Kazakhstan</option>
                                                                                <option value="Kenya">Kenya</option>
                                                                                <option value="Kiribati">Kiribati</option>
                                                                                <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
                                                                                <option value="Korea, Republic of">Korea, Republic of</option>
                                                                                <option value="Kuwait">Kuwait</option>
                                                                                <option value="Kyrgyzstan">Kyrgyzstan</option>
                                                                                <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
                                                                                <option value="Latvia">Latvia</option>
                                                                                <option value="Lebanon">Lebanon</option>
                                                                                <option value="Lesotho">Lesotho</option>
                                                                                <option value="Liberia">Liberia</option>
                                                                                <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                                                                                <option value="Liechtenstein">Liechtenstein</option>
                                                                                <option value="Lithuania">Lithuania</option>
                                                                                <option value="Luxembourg">Luxembourg</option>
                                                                                <option value="Macao">Macao</option>
                                                                                <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option>
                                                                                <option value="Madagascar">Madagascar</option>
                                                                                <option value="Malawi">Malawi</option>
                                                                                <option value="Malaysia">Malaysia</option>
                                                                                <option value="Maldives">Maldives</option>
                                                                                <option value="Mali">Mali</option>
                                                                                <option value="Malta">Malta</option>
                                                                                <option value="Marshall Islands">Marshall Islands</option>
                                                                                <option value="Martinique">Martinique</option>
                                                                                <option value="Mauritania">Mauritania</option>
                                                                                <option value="Mauritius">Mauritius</option>
                                                                                <option value="Mayotte">Mayotte</option>
                                                                                <option value="Mexico">Mexico</option>
                                                                                <option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
                                                                                <option value="Moldova, Republic of">Moldova, Republic of</option>
                                                                                <option value="Monaco">Monaco</option>
                                                                                <option value="Mongolia">Mongolia</option>
                                                                                <option value="Montserrat">Montserrat</option>
                                                                                <option value="Morocco">Morocco</option>
                                                                                <option value="Mozambique">Mozambique</option>
                                                                                <option value="Myanmar">Myanmar</option>
                                                                                <option value="Namibia">Namibia</option>
                                                                                <option value="Nauru">Nauru</option>
                                                                                <option value="Nepal">Nepal</option>
                                                                                <option value="Netherlands">Netherlands</option>
                                                                                <option value="Netherlands Antilles">Netherlands Antilles</option>
                                                                                <option value="New Caledonia">New Caledonia</option>
                                                                                <option value="New Zealand">New Zealand</option>
                                                                                <option value="Nicaragua">Nicaragua</option>
                                                                                <option value="Niger">Niger</option>
                                                                                <option value="Nigeria">Nigeria</option>
                                                                                <option value="Niue">Niue</option>
                                                                                <option value="Norfolk Island">Norfolk Island</option>
                                                                                <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                                                                <option value="Norway">Norway</option>
                                                                                <option value="Oman">Oman</option>
                                                                                <option value="Pakistan">Pakistan</option>
                                                                                <option value="Palau">Palau</option>
                                                                                <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                                                                                <option value="Panama">Panama</option>
                                                                                <option value="Papua New Guinea">Papua New Guinea</option>
                                                                                <option value="Paraguay">Paraguay</option>
                                                                                <option value="Peru">Peru</option>
                                                                                <option value="Philippines">Philippines</option>
                                                                                <option value="Pitcairn">Pitcairn</option>
                                                                                <option value="Poland">Poland</option>
                                                                                <option value="Portugal">Portugal</option>
                                                                                <option value="Puerto Rico">Puerto Rico</option>
                                                                                <option value="Qatar">Qatar</option>
                                                                                <option value="Reunion">Reunion</option>
                                                                                <option value="Romania">Romania</option>
                                                                                <option value="Russian Federation">Russian Federation</option>
                                                                                <option value="Rwanda">Rwanda</option>
                                                                                <option value="Saint Helena">Saint Helena</option>
                                                                                <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                                                                                <option value="Saint Lucia">Saint Lucia</option>
                                                                                <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                                                                                <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
                                                                                <option value="Samoa">Samoa</option>
                                                                                <option value="San Marino">San Marino</option>
                                                                                <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                                                                                <option value="Saudi Arabia">Saudi Arabia</option>
                                                                                <option value="Senegal">Senegal</option>
                                                                                <option value="Serbia and Montenegro">Serbia and Montenegro</option>
                                                                                <option value="Seychelles">Seychelles</option>
                                                                                <option value="Sierra Leone">Sierra Leone</option>
                                                                                <option value="Singapore">Singapore</option>
                                                                                <option value="Slovakia">Slovakia</option>
                                                                                <option value="Slovenia">Slovenia</option>
                                                                                <option value="Solomon Islands">Solomon Islands</option>
                                                                                <option value="Somalia">Somalia</option>
                                                                                <option value="South Africa">South Africa</option>
                                                                                <option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option>
                                                                                <option value="Spain">Spain</option>
                                                                                <option value="Sri Lanka">Sri Lanka</option>
                                                                                <option value="Sudan">Sudan</option>
                                                                                <option value="Suriname">Suriname</option>
                                                                                <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                                                                                <option value="Swaziland">Swaziland</option>
                                                                                <option value="Sweden">Sweden</option>
                                                                                <option value="Switzerland">Switzerland</option>
                                                                                <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                                                                                <option value="Taiwan, Province of China">Taiwan, Province of China</option>
                                                                                <option value="Tajikistan">Tajikistan</option>
                                                                                <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
                                                                                <option value="Thailand">Thailand</option>
                                                                                <option value="Timor-leste">Timor-leste</option>
                                                                                <option value="Togo">Togo</option>
                                                                                <option value="Tokelau">Tokelau</option>
                                                                                <option value="Tonga">Tonga</option>
                                                                                <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                                                                <option value="Tunisia">Tunisia</option>
                                                                                <option value="Turkey">Turkey</option>
                                                                                <option value="Turkmenistan">Turkmenistan</option>
                                                                                <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                                                                <option value="Tuvalu">Tuvalu</option>
                                                                                <option value="Uganda">Uganda</option>
                                                                                <option value="Ukraine">Ukraine</option>
                                                                                <option value="United Arab Emirates">United Arab Emirates</option>
                                                                                <option value="United Kingdom">United Kingdom</option>
                                                                                <option value="United States">United States</option>
                                                                                <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                                                                                <option value="Uruguay">Uruguay</option>
                                                                                <option value="Uzbekistan">Uzbekistan</option>
                                                                                <option value="Vanuatu">Vanuatu</option>
                                                                                <option value="Venezuela">Venezuela</option>
                                                                                <option value="Viet Nam">Viet Nam</option>
                                                                                <option value="Virgin Islands, British">Virgin Islands, British</option>
                                                                                <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                                                                                <option value="Wallis and Futuna">Wallis and Futuna</option>
                                                                                <option value="Western Sahara">Western Sahara</option>
                                                                                <option value="Yemen">Yemen</option>
                                                                                <option value="Zambia">Zambia</option>
                                                                                <option value="Zimbabwe">Zimbabwe</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select class="form-control input-lg" name="city">
                                                                                <option value="" selected="selected">Select City</option>
                                                                                <option>Amsterdam</option>
                                                                                <option>Atlanta</option>
                                                                                <option>Baltimore</option>
                                                                                <option>Boston</option>
                                                                                <option>Buenos Aires</option>
                                                                                <option>Calgary</option>
                                                                                <option>Chicago</option>
                                                                                <option>Denver</option>
                                                                                <option>Dubai</option>
                                                                                <option>Frankfurt</option>
                                                                                <option>Hong Kong</option>
                                                                                <option>Honolulu</option>
                                                                                <option>Houston</option>
                                                                                <option>Kuala Lumpur</option>
                                                                                <option>London</option>
                                                                                <option>Los Angeles</option>
                                                                                <option>Melbourne</option>
                                                                                <option>Mexico City</option>
                                                                                <option>Miami</option>
                                                                                <option>Minneapolis</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-envelope-o fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-lg" placeholder="Postal Code" type="text" name="postal" id="postal">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-phone fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-lg" data-mask="+99 (999) 999-9999" data-mask-placeholder= "X" placeholder="+1" type="text" name="wphone" id="wphone">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-mobile fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-lg" data-mask="+99 (999) 999-9999" data-mask-placeholder= "X" placeholder="+01" type="text" name="hphone" id="hphone">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane" id="tab3">
                                                            <br>
                                                            <h3><strong>Step 3</strong> - Domain Setup</h3>
                                                            <div class="alert alert-info fade in">
                                                                <button class="close" data-dismiss="alert">
                                                                    ×
                                                                </button>
                                                                <i class="fa-fw fa fa-info"></i>
                                                                <strong>Info!</strong> Place an info message box if you wish.
                                                            </div>
                                                            <div class="form-group">
                                                                <label>This is a label</label>
                                                                <input class="form-control input-lg" placeholder="Another input box here..." type="text" name="etc" id="etc">
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane" id="tab4">
                                                            <br>
                                                            <h3><strong>Step 4</strong> - Save Form</h3>
                                                            <br>
                                                            <h1 class="text-center text-success"><strong><i class="fa fa-check fa-lg"></i> Complete</strong></h1>
                                                            <h4 class="text-center">Click next to finish</h4>
                                                            <br>
                                                            <br>
                                                        </div>

                                                        <div class="form-actions">
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <ul class="pager wizard no-margin">
                                                                        <!--<li class="previous first disabled">
                                                                        <a href="javascript:void(0);" class="btn btn-lg btn-default"> First </a>
                                                                        </li>-->
                                                                        <li class="previous disabled">
                                                                            <a href="javascript:void(0);" class="btn btn-lg btn-default"> Previous </a>
                                                                        </li>
                                                                        <!--<li class="next last">
                                                                        <a href="javascript:void(0);" class="btn btn-lg btn-primary"> Last </a>
                                                                        </li>-->
                                                                        <li class="next">
                                                                            <a href="javascript:void(0);" class="btn btn-lg txt-color-darken"> Next </a>
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

                        <!-- NEW WIDGET START -->
                        <article class="col-sm-12 col-md-12 col-lg-6">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget" id="wid-id-2" data-widget-editbutton="false" data-widget-deletebutton="false">
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
                                    <h2>Fuel Wizard </h2>

                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body fuelux">

                                        <div class="wizard">
                                            <ul class="steps">
                                                <li data-target="#step1" class="active">
                                                    <span class="badge badge-info">1</span>Step 1<span class="chevron"></span>
                                                </li>
                                                <li data-target="#step2">
                                                    <span class="badge">2</span>Step 2<span class="chevron"></span>
                                                </li>
                                                <li data-target="#step3">
                                                    <span class="badge">3</span>Step 3<span class="chevron"></span>
                                                </li>
                                                <li data-target="#step4">
                                                    <span class="badge">4</span>Step 4<span class="chevron"></span>
                                                </li>
                                                <li data-target="#step5">
                                                    <span class="badge">5</span>Step 5<span class="chevron"></span>
                                                </li>
                                            </ul>
                                            <div class="actions">
                                                <button type="button" class="btn btn-sm btn-primary btn-prev">
                                                    <i class="fa fa-arrow-left"></i>Prev
                                                </button>
                                                <button type="button" class="btn btn-sm btn-success btn-next" data-last="Finish">
                                                    Next<i class="fa fa-arrow-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="step-content">
                                            <form class="form-horizontal" id="fuelux-wizard" method="post">

                                                <div class="step-pane active" id="step1">
                                                    <h3><strong>Step 1 </strong> - Validation states</h3>

                                                    <!-- wizard form starts here -->
                                                    <fieldset>

                                                        <div class="form-group has-warning">
                                                            <label class="col-md-2 control-label">Input warning</label>
                                                            <div class="col-md-10">
                                                                <div class="input-group">
                                                                    <input class="form-control" type="text">
                                                                    <span class="input-group-addon"><i class="fa fa-warning"></i></span>
                                                                </div>
                                                                <span class="help-block">Something may have gone wrong</span>
                                                            </div>

                                                        </div>

                                                        <div class="form-group has-error">
                                                            <label class="col-md-2 control-label">Input error</label>
                                                            <div class="col-md-10">
                                                                <div class="input-group">
                                                                    <input class="form-control" type="text">
                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-remove-circle"></i></span>
                                                                </div>
                                                                <span class="help-block"><i class="fa fa-warning"></i> Please correct the error</span>
                                                            </div>
                                                        </div>

                                                        <div class="form-group has-success">
                                                            <label class="col-md-2 control-label">Input success</label>
                                                            <div class="col-md-10">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                                                    <input class="form-control" type="text">
                                                                    <span class="input-group-addon"><i class="fa fa-check"></i></span>
                                                                </div>
                                                                <span class="help-block">Something may have gone wrong</span>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="control-label col-md-2">Input icon success</label>
                                                            <div class="col-md-10">
                                                                <div class="row">
                                                                    <div class="col-sm-12">

                                                                        <div class="input-icon-left">
                                                                            <i class="fa txt-color-green fa-check"></i>
                                                                            <input class="form-control" placeholder="Left Icon" type="text">
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </fieldset>

                                                </div>

                                                <div class="step-pane" id="step2">
                                                    <h3><strong>Step 2 </strong> - Alerts</h3>

                                                    <div class="alert alert-warning fade in">
                                                        <button class="close" data-dismiss="alert">
                                                            ×
                                                        </button>
                                                        <i class="fa-fw fa fa-warning"></i>
                                                        <strong>Warning</strong> Your monthly traffic is reaching limit.
                                                    </div>

                                                    <div class="alert alert-success fade in">
                                                        <button class="close" data-dismiss="alert">
                                                            ×
                                                        </button>
                                                        <i class="fa-fw fa fa-check"></i>
                                                        <strong>Success</strong> The page has been added.
                                                    </div>

                                                    <div class="alert alert-info fade in">
                                                        <button class="close" data-dismiss="alert">
                                                            ×
                                                        </button>
                                                        <i class="fa-fw fa fa-info"></i>
                                                        <strong>Info!</strong> You have 198 unread messages.
                                                    </div>

                                                    <div class="alert alert-danger fade in">
                                                        <button class="close" data-dismiss="alert">
                                                            ×
                                                        </button>
                                                        <i class="fa-fw fa fa-times"></i>
                                                        <strong>Error!</strong> The daily cronjob has failed.
                                                    </div>

                                                </div>

                                                <div class="step-pane" id="step3">
                                                    <h3><strong>Step 3 </strong> - Wizard continued</h3>
                                                    <br>
                                                    <br>
                                                    <h1 class="text-center text-primary"> This will be your Step 3 </h1>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                </div>

                                                <div class="step-pane" id="step4">
                                                    <h3><strong>Step 4 </strong> - Wizard continued...</h3>
                                                    <br>
                                                    <br>
                                                    <h1 class="text-center text-danger"> This will be your Step 4 </h1>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                </div>

                                                <div class="step-pane" id="step5">
                                                    <h3><strong>Step 5 </strong> - Finished!</h3>
                                                    <br>
                                                    <br>
                                                    <h1 class="text-center text-success"><i class="fa fa-check"></i> Congratulations!
                                                        <br>
                                                        <small>Click finish to end wizard</small></h1>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
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

                                                                                $(document).ready(function() {

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
            $("#docs").numeric();
            $("#doc").numeric(false, function() {
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
            /*$("#cboCuenta").change(function() {
             var cuenta = $("#cboCuenta").val();
             if (cuenta == "0") {
             return;
             }
             alert("Cuenta: " + cuenta);
             });*/
        </script>

    </body>

</html>