<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : Prueba_Nestable_List
    Created on : 07-ene-2015, 15:23:08
    Author     : ALFA 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Mantenimiento de Proceso </title>
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

    </head>
    <body class="">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->

        <!-- HEADER -->
        <header>

        </header>
        <!-- END HEADER -->

        <!-- Left panel : Navigation area -->
        <!-- Note: This width of the aside area can be adjusted through LESS variables -->

        <!-- END NAVIGATION -->

        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin: 0px;">

            <!-- MAIN CONTENT -->
            <div id="content" >



                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-editbutton="false">
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Mantenimiento de Pasos</h2>
                                </header>
                                <div>
                                    <div class="widget-body no-padding">
                                        <form class="smart-form">
                                            <fieldset>
                                                <section class="col col-lg-4">
                                                    <div class="row">
                                                        <section class="col col-6">
                                                            <label class="input">
                                                                <input name="num" required=""  maxlength="3" class="num_paso" maxlength="6" placeholder="Numero de Paso">
                                                            </label>
                                                        </section>
                                                        <section class="col col-6">
                                                            <label class="input">
                                                                <input type="text" name="cod" class="co_paso" required=""maxlength="6" placeholder="Codigo" />
                                                            </label>
                                                        </section>
                                                    </div>
                                                    <div class="row">
                                                        <section class="col col-xs-12">
                                                            <label>Proceso</label>
                                                            <label class="select">
                                                                <select name="proceso" required=""  id="select-proceso">
                                                                    <option value="">[Seleccione]</option>
                                                                </select>
                                                                <i></i></label>
                                                        </section>
                                                    </div>
                                                </section>
                                                <section class="col col-lg-8">
                                                    <label class="textarea textarea-resizable">
                                                        <textarea type="text" name="desc" required="" maxlength="300" rows="5" cols="50" class="desc_paso custom-scroll" placeholder="Descripcion"></textarea>
                                                    </label>
                                                </section>
                                            </fieldset>
                                            <footer>
                                                <button class="btn btn-primary"type="submit" id="btn-registrar" name="Enviar" value="Registrar Paso" /> Registrar Paso</button>
                                                <button class="btn btn-default" type="button" class="btn_cancel_edit">Cancelar</button>
                                            </footer>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                    <div class="row">
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-5">
                            <div class="jarviswidget jarviswidget-color-greenDark" id="wid-id-2" data-widget-editbutton="false">
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Lista de pasos Habilitados :<strong><label class="lb-list_pasos"></label></strong> </h2>
                                </header>
                                <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body">
                                        <div class="row">
                                            <button type="button" class="btn btn-default Generar" data-action="collapse-all">
                                                Generar Pasos
                                            </button>
                                        </div> 
                                        <div>
                                            <div class="dd" id="nestable"  >
                                                <ol class="dd-list" >
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-7">
                            <div class="jarviswidget jarviswidget-color-red" id="wid-id-3" data-widget-editbutton="false">
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Lista de puestos :<strong><label class="lb-list_puesto"></label></strong> </h2>
                                </header>
                                <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body no-padding">
                                        <form action="" method="post" class="smart-form form_puesto">
                                            <fieldset>
                                                <div class="row">
                                                    <section class="col col-4">
                                                        <label>Dirección</label>
                                                        <label class="select">
                                                            <select class=" input-sm sl_dir" required="" ></select> 
                                                            <i></i></label>      
                                                    </section>
                                                    <section class="col col-4">
                                                        <label>Departamento:</label>
                                                        <label class="select">
                                                            <select class="input-sm sl_dep" required=""></select> 
                                                            <i></i></label>                                                    
                                                    </section>
                                                    <section class="col col-4">
                                                        <label>Area:</label>
                                                        <label class="select">
                                                            <select class="input-sm sl_area" required=""></select>  
                                                            <i></i></label>
                                                    </section>
                                                </div>
                                                <div class="row">
                                                    <section class="col col-3">
                                                        <label>Sección:</label>
                                                        <label class="select">
                                                            <select class="input-sm sl_sec" required=""></select> 
                                                            <i></i></label>
                                                    </section>

                                                    <section class="col col-3">
                                                        <label>Puesto:</label>
                                                        <label class="select">
                                                            <select name="id_pu" class="input-sm sl_puesto" required=""></select>
                                                            <i></i></label>
                                                    </section>                                          
                                                    <input type="hidden" value="" name="idpasos" class="id_pasos"  />
                                                    <input type="hidden" value="" name="nun" class="num_p"  />
                                                    <section class="col col-3" >
                                                        <label>Código Puesto</label>
                                                        <label class="select">
                                                            <select class="input-sm co_puesto" name="co_pasos">
                                                                <option value=""></option>
                                                                <option value="SECR">Secretaria de Area</option>
                                                                <option value="JEFE">Jefe de Area</option>
                                                            </select> 
                                                            <i></i></label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <div style="margin-top: 15px; width: 98%; " >
                                                            <button class="form-control btn btn-primary btn-agregar-p" style="margin: auto;">Agregar Puesto</button> 
                                                        </div>                                                            
                                                    </section>
                                                </div>
                                            </fieldset>
                                        </form>
                                        <div class="custom-scroll table-responsive"style="height:320px; overflow-y: scroll;">
                                            <table class="table table-striped table-bordered table-hover" style="width: 98%;margin: auto; ">
                                                <thead>
                                                    <tr>
                                                        <th data-class="expand">Puesto</th>
                                                        <th data-hide="phone,tablet">Area</th>
                                                        <th data-hide="phone,tablet">Departamento</th>
                                                        <th data-hide="phone,tablet">Dirección</th>
                                                        <th>Estado</th>
                                                        <th colspan="2">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="tbody-puesto">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                    <div class="row">
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="jarviswidget jarviswidget-color-yellow" id="wid-id-4" data-widget-editbutton="false">
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Lista de pasos Deshabilitados :<strong><label class="lb-list_pasos"></label></strong> </h2>
                                </header>
                                <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <td>Nro</td>
                                                        <td>Descripción</td>
                                                        <td>Número</td>
                                                        <td>Codigo</td>
                                                        <td>Proceso</td>
                                                        <td>Editar</td>
                                                    </tr>
                                                </thead>
                                                <tbody class="tbodys" style=" display: none;">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>

                    <!-- end row -->


                </section>
                <!-- end widget grid -->

            </div>
            <!-- END MAIN CONTENT -->

        </div>
        <!-- END MAIN PANEL -->



        <!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
        Note: These tiles are completely responsive,
        you can add as many as you like
        -->

        <!-- END SHORTCUT AREA -->

        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
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
                document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
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
        <script src="../../js/plugin/jquery-nestable/jquery.nestable.min.js"></script>
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!
            function  list_put_id(d, valor) {


                $.post("../../Direccion_Puesto", "opc=" + "Listar_pu_id" + "&" + "id=" + valor, function (objJson) {
                    d.empty();
                    d.append("<option value='' > [SELECCIONE] </option>");
                    var list = objJson.lista;
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            d.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                        }
                    } else {
                        d.append("<option value='0' > [] </option>");
                    }
                });
            }

            function  lis_dir_id(d, valor) {


                $.post("../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + valor, function (objJson) {
                    d.empty();
                    d.append("<option value='' > [SELECCIONE] </option>");
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            d.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                        }
                    } else {
                        d.append("<option value='' > [] </option>");
                    }
                });
            }
            function list_area_id(c, valor) {


                $.post("../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + valor, function (objJson) {
                    c.empty();
                    c.append("<option value='' > [SELECCIONE] </option>");
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            c.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                        }
                    } else {
                        c.append("<option value='' > [] </option>");
                    }
                });
            }
            function list_sec_id(d, valor) {
                $.post("../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + valor, function (objJson) {
                    d.empty();
                    d.append("<option value='' > [SELECCIONE] </option>");
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            d.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                        }
                    } else {
                        d.append("<option value='' > [no hay] </option>");
                    }
                });
            }
            function list_dir(c) {
                $.post("../../Direccion_Puesto", "opc=Listar_direccion", function (objJson) {
                    c.empty();
                    c.append("<option value='' > [SELECCIONE] </option>");
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            c.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                        }
                    } else {
                        c.append("<option value='0' > [] </option>");
                    }
                });
            }

            function list_puesto(num) {
                $(".lb-list_puesto").text($(".det_p_" + num).val());
                var tbody_p = $(".tbody-puesto");
                var texto = "";
                $(".id_pasos").val($(".id_paso" + num).val());
                $.post("../../paso", "opc=Paso_Puesto&id=" + $(".id_paso" + num).val(), function (objJson) {
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    tbody_p.empty();
                    var lista = objJson.lista;
                    for (var h = 0; h < lista.length; h++) {
                        if (lista[h].estado == '0') {
                            texto += "<tr class='danger' >";
                        } else if (lista[h].estado == '1') {
                            texto += "<tr class='success' >";
                        }

                        texto += "<td>" + lista[h].puesto + "</td>";
                        texto += "<td>" + lista[h].area + "</td>";
                        texto += "<td>" + lista[h].dep + "</td>";
                        texto += "<td>" + lista[h].direccion + "</td>";
                        if (lista[h].estado == '0') {
                            texto += "<td>Deshabilitado</td>";
                        } else if (lista[h].estado == '1') {
                            texto += "<td>Habilitado</td>";
                        }
                        texto += "<td><input type='hidden' class='iddp" + h + "' value='" + lista[h].idpp + "' />";
                        if (lista[h].estado == '1') {
                            texto += "<button class='btn btn-warning btn_deshabilitar_p' value='" + h + "'>Deshabilitar</button></td>";
                        } else {
                            texto += "<button class='btn btn-success btn_habilitar_p' value='" + h + "' style='width: 98%'>Habilitar</button></td>";
                        }
                        texto += "<td><button type='button' value='" + h + "' class='btn btn-danger btn-eliminar_puesto'><i class='fa fa-times'></i></button></td>";
                        texto += "</tr>";
                    }
                    tbody_p.append(texto);
                    texto = "";
                    $(".form_puesto").show();
                    $(".btn-eliminar_puesto").click(
                            function () {
                                if (confirm("¿Esta Seguro de Eliminar?")) {
                                    alert("opc=Eliminar_PP&id=" + $(".iddp" + $(this).val()).val());
                                    $.post("../../paso", "opc=Eliminar_PP&id=" + $(".iddp" + $(this).val()).val(), function (objJson) {

                                    });
                                } else {

                                }
                            }
                    );
                    $(".btn_deshabilitar_p").click(function () {
                        $.post("../../paso", "opc=actualizar_estado&id=" + $(".iddp" + $(this).val()).val() + "&estado=0", function (objJson) {
                            if (objJson.rpta == -1) {
                                alert(objJson.mensaje);
                                return;
                            } else {

                                alert("El puesto para este paso se ha deshabilitado correctamente...");
                                list_puesto($(".num_p").val());
                            }
                        }
                        );

                    });
                    $(".btn_habilitar_p").click(function () {
                        $.post("../../paso", "opc=actualizar_estado&id=" + $(".iddp" + $(this).val()).val() + "&estado=1", function (objJson) {
                            if (objJson.rpta == -1) {
                                alert(objJson.mensaje);
                                return;
                            } else {

                                alert("El puesto para este paso se ha habilitado correctamente...");
                                list_puesto($(".num_p").val());
                            }
                        });
                    });

                });
            }
            $(document).ready(function () {
                $(".btn_cancel_edit").click(function () {
                    $("#btn-registrar").val("Registrar Paso");
                    $(".opc").val("Registrar");
                    $(".form_paso")[0].reset();
                    $(this).hide();
                });
                $(".form_puesto").hide();
                list_dir($(".sl_dir"));
                $(".sl_dir").change(function () {
                    lis_dir_id($(".sl_dep"), $(this).val());
                });
                $(".sl_dep").change(function () {
                    list_area_id($(".sl_area"), $(this).val());
                });
                $(".sl_area").change(function () {
                    list_sec_id($(".sl_sec"), $(this).val());
                });
                $(".sl_sec").change(function () {
                    list_put_id($(".sl_puesto"), $(this).val());
                });
                var num = 1;
                listar_Proceso();
                Listar_Paso($("#select-proceso").val());
                $("#btn-registrar").click(
                        function () {
                            var pr = $("#select-proceso").val();
                            $.post("../../paso", $("#form-paso").serialize(), function (objJson) {
                                if (objJson.rpta == -1) {
                                    alert(objJson.mensaje);
                                    return;
                                }
                                Listar_Paso(pr);
                            });
                            $("#btn-registrar").val("Registrar Paso");
                            $(".opc").val("Registrar");
                            $("#form-paso")[0].reset();
                            return false;
                        }
                );
                function listar_Proceso() {
                    var s = $("#select-proceso");
                    $.post("../../Proceso", "opc=Listar", function (objJson) {
                        s.empty();
                        var lista = objJson.lista;
                        s.append("<option value='' selected >[SELECCIONE]</option>");
                        for (var j = 0; j < lista.length; j++) {
                            s.append("<option value='" + lista[j].id + "' > " + lista[j].nombre + "</option>");
                        }
                    });
                }
                $("#select-proceso").change(
                        function () {
                            $(".lb-list_pasos").text($(this).find(":selected").text());
                            Listar_Paso($(this).val());
                            $(".form_puesto").hide();
                            $(".tbody-puesto").empty();
                            // alert($(this).val());
                        });
                $(".btn-agregar-p").click(function () {
                    if ($(".form_puesto").valid()) {
                        $.ajax({
                            url: "../../Direccion_Puesto",
                            data: $(".form_puesto").serialize() + "&opc=Reg_puesto_paso"
                        }).done(function () {
                            list_puesto($(".num_p").val());
                            alert("¡Registrado Exitosamente!");
                        }).fail(function (objJson) {
                            alert(objJson.mensaje);
                        });
                    } else {
                        alert("Completar campos requeridos...");
                    }

                    ///alert($(".sl_puesto").val());
                });
                var b = $(".tbodys");
                var c = $(".dd-list");
                function Listar_Paso(proceso) {
                    var txt_append = "";
                    $.post("../../paso", "opc=Listar_habilitados&proceso=" + proceso, function (objJson) {
                        b.empty();
                        c.empty();
                        var lista = objJson.lista;
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                        for (var i = 0; i < lista.length; i++) {
                            b.append("<tr class='editar-tr" + i + "' >");
                            b.append("<td >" + (i + 1) + "</td>");
                            b.append("<td class='td_det" + i + "'>" + lista[i].det + "</td>");
                            b.append("<td class='td_num" + i + "'><label>" + lista[i].num + "</label></td>");
                            b.append("<td  class='td_co" + i + "'><label>" + lista[i].co + "</label></td>");
                            b.append("<td class='td_id_pro" + i + "' >" + lista[i].proceso_id + "</td>");
                            //b.append("<input type='text' name='id' value='" + lista[i].id + "'  class='id_paso" + i + "'/>");
                            b.append("</tr>");
                        }
                        for (var i = 0; i < lista.length; i++) {
                            txt_append += '<li class="dd-item dd3-item" ><div class="dd-handle dd3-handle">Drag</div><div class="dd3-content"><label class="item_req item_' + (i + 1) + '" style="font-size: 12px;">' + lista[i].num + ' </label> ' +
                                    '<div class="pull-right"><button class="btn btn-primary btn-sm btn-cargar-puesto" value="' + i + '" ><i class="fa fa-eye" ></i></button></div>' +
                                    '<div class="pull-right"><button class="btn btn-success btn-sm btn-editar" value="' + i + '" ><i class="fa fa-pencil" ></i></button></div>' +
                                    '<div class="pull-right"><button class="btn btn-danger btn-sm btn-eliminar" value="' + i + '" ><i class="fa fa-times"></i></button></div>';
                            if (typeof (lista[i].det) === "undefined") {
                                txt_append += '<div class="pull-right"><label ></label></div>';
                            } else {

                                txt_append += '<div class="pull-right"><label style="font-size: 12px;">' + lista[i].det +'&nbsp;&nbsp;</label></div>';
                            }

                            // '<div class="pull-right"><label >' + lista[i].co + '</label></div>' +
                            txt_append += '<input type="hidden"  value="' + lista[i].det + '"  class="det_p_' + i + '"/>' +
                                    '<input type="hidden" name="id" value="' + lista[i].id + '"  class="id_paso' + i + '"/>' + '</div> </li>';
                            txt_append += '<input  type="hidden" value="' + lista[i].det + '" class="inp_det_' + i + '" />';
                            txt_append += '<input type="hidden" value="' + lista[i].num + '" class="inp_num_' + i + '" />';
                            txt_append += '<input type="hidden" value="' + lista[i].co + '" class="inp_co_' + i + '" />';
                            txt_append += '<input type="hidden" value="' + lista[i].proceso_id + '" class="inp_pro_id_' + i + '" />';
                        }
                        c.append(txt_append);
                        txt_append = "";
                        $(".btn-cargar-puesto").click(function () {
                            var num = $(this).val();
                            $(".id_pasos_puesto").val($(".id_paso" + num).val());
                            list_puesto(num);
                            $(".num_p").val($(this).val());
                        });
                        $(".btn-editar").click(function () {
                            $(".btn_cancel_edit").show();
                            $(".desc_paso").val($(".td_det" + $(this).val()).text());
                            $(".num_paso").val($(".td_num" + $(this).val()).text());
                            $(".co_paso").val($(".td_co" + $(this).val()).text());
                            $("#select-proceso").val($(".td_id_pro" + $(this).val()).text());
                            $(".id_p").val($(".id_paso" + $(this).val()).val());
                            $("#btn-registrar").val("Modificar");
                            $(".opc").val("Modificar");
                        });
                        $(".btn-eliminar").click(
                                function () {
                                    var pr_e = $("#select-proceso").val();
                                    if (confirm("¿Esta Seguro de Eliminar?")) {
                                        $.post("../../paso", "opc=Eliminar&paso=" + $(".id_paso" + $(this).val()).val(), function () {
                                            Listar_Paso(pr_e);
                                        });
                                        //alert($(".id_paso" + $(this).val()).val());
                                    } else {

                                    }
                                }
                        );

                    });
                }
                $(".Generar").click(function () {
                    //var num = $(".tbodys tr").size();
                    var num = 1;
                    var url = "";

                    $.each($(".item_req"), function () {
                        $(this).text("P" + num);
                        num++;
                    });
                    for (var s = 1; s <= $(".tbodys tr").size(); s++) {
                        url += "id" + s + "=" + $(".id_paso" + (s - 1)).val() + "&numero" + s + "=" + $(".item_" + s).text() + "&";
                    }
                    url = url.substring(0, url.length - 1);
                    $.post("../../paso", "opc=Update_nu_paso&num=" + num + "&" + url, function (objJson) {
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                    });
                    alert(url);
                    url = "";
                    num = 1;

                    /* for (var f = 0; f < num; f++) {
                     //alert($(".id_paso" + f).val() + " - " + $(".item_"+f).text());
                     
                     $.ajax({
                     url:"../../paso",
                     data: "opc=Update_nu_paso&nu_paso=" + "P" + (f + 1) + "&paso=" + $(".id_paso" + f).val()
                     
                     }).done(function(){
                     alert( "opc=Update_nu_paso&nu_paso=" + "P" + (f + 1) + "&paso=" + $(".id_paso" + f).val());   
                     });
                     /* $.post("../../paso", "opc=Update_nu_paso&nu_paso=" + "P" + (f + 1) + "&paso=" + $(".id_paso" + f).val(), function (objJson) {
                     
                     });*/
                    // }*/

                    Listar_Paso($("#select-proceso").val());
                });
                pageSetUp();
                // PAGE RELATED SCRIPTS
                var updateOutput = function (e) {
                    var list = e.length ? e : $(e.target), output = list.data('output');
                    if (window.JSON) {
                        output.val(window.JSON.stringify(list.nestable('serialize')));
                        //, null, 2));
                    } else {
                        output.val('JSON browser support required for this demo.');
                    }
                };
                // activate Nestable for list 1
                $('#nestable').nestable({
                    group: 1
                }).on('change', updateOutput);
                // activate Nestable for list 2
                $('#nestable2').nestable({
                    group: 1
                }).on('change', updateOutput);
                // output initial serialised data
                updateOutput($('#nestable').data('output', $('#nestable-output')));
                updateOutput($('#nestable2').data('output', $('#nestable2-output')));
                $('#nestable-menu').on('click', function (e) {
                    var target = $(e.target), action = target.data('action');
                    if (action === 'expand-all') {
                        $('.dd').nestable('expandAll');
                    }
                    if (action === 'collapse-all') {
                        $('.dd').nestable('collapseAll');
                    }
                });
                $('#nestable3').nestable();
            })

        </script>
        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!

            $(document).ready(function () {

                pageSetUp();

                /* // DOM Position key index //
                 
                 l - Length changing (dropdown)
                 f - Filtering input (search)
                 t - The Table! (datatable)
                 i - Information (records)
                 p - Pagination (paging)
                 r - pRocessing 
                 < and > - div elements
                 <"#id" and > - div with an id
                 <"class" and > - div with a class
                 <"#id.class" and > - div with an id and class
                 
                 Also see: http://legacy.datatables.net/usage/features
                 */

                /* BASIC ;*/
                var responsiveHelper_dt_basic = undefined;
                var responsiveHelper_datatable_fixed_column = undefined;
                var responsiveHelper_datatable_col_reorder = undefined;
                var responsiveHelper_datatable_tabletools = undefined;

                var breakpointDefinition = {
                    tablet: 1024,
                    phone: 480
                };

                $('#dt_basic').dataTable({
                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                            "t" +
                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                    "autoWidth": true,
                    "preDrawCallback": function () {
                        // Initialize the responsive datatables helper once.
                        if (!responsiveHelper_dt_basic) {
                            responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
                        }
                    },
                    "rowCallback": function (nRow) {
                        responsiveHelper_dt_basic.createExpandIcon(nRow);
                    },
                    "drawCallback": function (oSettings) {
                        responsiveHelper_dt_basic.respond();
                    }
                });

                /* END BASIC */

                /* COLUMN FILTER  */
                var otable = $('#datatable_fixed_column').DataTable({
                    //"bFilter": false,
                    //"bInfo": false,
                    //"bLengthChange": false
                    //"bAutoWidth": false,
                    //"bPaginate": false,
                    //"bStateSave": true // saves sort state using localStorage
                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6 hidden-xs'f><'col-sm-6 col-xs-12 hidden-xs'<'toolbar'>>r>" +
                            "t" +
                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                    "autoWidth": true,
                    "preDrawCallback": function () {
                        // Initialize the responsive datatables helper once.
                        if (!responsiveHelper_datatable_fixed_column) {
                            responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper($('#datatable_fixed_column'), breakpointDefinition);
                        }
                    },
                    "rowCallback": function (nRow) {
                        responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
                    },
                    "drawCallback": function (oSettings) {
                        responsiveHelper_datatable_fixed_column.respond();
                    }

                });

                // custom toolbar
                $("div.toolbar").html('<div class="text-right"><img src="img/logo.png" alt="SmartAdmin" style="width: 111px; margin-top: 3px; margin-right: 10px;"></div>');

                // Apply the filter
                $("#datatable_fixed_column thead th input[type=text]").on('keyup change', function () {

                    otable
                            .column($(this).parent().index() + ':visible')
                            .search(this.value)
                            .draw();

                });
                /* END COLUMN FILTER */

                /* COLUMN SHOW - HIDE */
                $('#datatable_col_reorder').dataTable({
                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'C>r>" +
                            "t" +
                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
                    "autoWidth": true,
                    "preDrawCallback": function () {
                        // Initialize the responsive datatables helper once.
                        if (!responsiveHelper_datatable_col_reorder) {
                            responsiveHelper_datatable_col_reorder = new ResponsiveDatatablesHelper($('#datatable_col_reorder'), breakpointDefinition);
                        }
                    },
                    "rowCallback": function (nRow) {
                        responsiveHelper_datatable_col_reorder.createExpandIcon(nRow);
                    },
                    "drawCallback": function (oSettings) {
                        responsiveHelper_datatable_col_reorder.respond();
                    }
                });

                /* END COLUMN SHOW - HIDE */

                /* TABLETOOLS */
                $('#datatable_tabletools').dataTable({
                    // Tabletools options: 
                    //   https://datatables.net/extensions/tabletools/button_options
                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'T>r>" +
                            "t" +
                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
                    "oTableTools": {
                        "aButtons": [
                            "copy",
                            "csv",
                            "xls",
                            {
                                "sExtends": "pdf",
                                "sTitle": "Empleados_PDF",
                                "sPdfMessage": "Empleados PDF Export",
                                "sPdfSize": "letter"
                            },
                            {
                                "sExtends": "print",
                                "sMessage": "Generado por AlfaTeam <i>(presiona Esc para cerrar)</i>"
                            }
                        ],
                        "sSwfPath": "../../js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
                    },
                    "autoWidth": true,
                    "preDrawCallback": function () {
                        // Initialize the responsive datatables helper once.
                        if (!responsiveHelper_datatable_tabletools) {
                            responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper($('#datatable_tabletools'), breakpointDefinition);
                        }
                    },
                    "rowCallback": function (nRow) {
                        responsiveHelper_datatable_tabletools.createExpandIcon(nRow);
                    },
                    "drawCallback": function (oSettings) {
                        responsiveHelper_datatable_tabletools.respond();
                    }
                });

                /* END TABLETOOLS */

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

    </body>

</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>