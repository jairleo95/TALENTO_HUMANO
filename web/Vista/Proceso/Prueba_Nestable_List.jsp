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

                        <!-- NEW WIDGET START -->
                        <article class="col-sm-12">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget well" id="wid-id-0">
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

                                <!-- widget div-->
                                <div>

                                    <div class="row">

                                        <h1>Mantenimiento de Pasos</h1>

                                        <form  method="post" id="form-paso" >
                                            <table>
                                                <tr ><td >Descripción :<td><textarea type="text" name="desc" required="" maxlength="300" rows="5" cols="50" class="desc_paso" ></textarea></td></tr>
                                                <tr><td>Numero :<td><input name="num" required="" class="num_paso" maxlength="6"> </td></tr>
                                                <tr><td>Código:<td><input type="text" name="cod" class="co_paso" required=""maxlength="6"  /></td></tr>
                                                <tr><td>Proceso:<td>
                                                        <select name="proceso" required=""  id="select-proceso">
                                                            <option value="">[SELECCIONE]</option>
                                                        </select></td></tr>
                                                <input type="hidden" name="opc" value="Registrar"  class="opc"/>
                                                <input type="hidden" name="id" value=""  class="id_p"/>
                                                <tr><td><input type="submit" id="btn-registrar" name="Enviar" value="Registrar Paso" /></td></tr>
                                            </table>
                                        </form>

                                        <table border='1'>
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

                                            <tbody  class="tbodys" style=" display: none;">

                                            </tbody>

                                        </table>

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body">

                                        <div id="nestable-menu">

                                            <button type="button" class="btn btn-default Generar" data-action="collapse-all">
                                                Generar Pasos
                                            </button>
                                        </div>
                                        <div class="row">


                                            <div class="col-sm-6 col-lg-12">

                                                <h6>Lista de pasos</h6>
                                                <style>
                                                    .div{
                                                        border-style: solid;
                                                        border-color: #ff0000 #0000ff;
                                                    }
                                                    label{
                                                        margin-left: 10px;
                                                    }
                                                </style>

                                                <div class="dd" id="nestable" >
                                                    <ol class="dd-list" style="width: 1024px;" >



                                                    </ol>
                                                </div>

                                            </div>

                                        </div>
                                        <div class="row" >
                                            <table border="1">
                                                <thead>
                                                    <tr>
                                                        <th>Usuario</th>
                                                        <th>Puesto</th>
                                                        <th>Area</th>
                                                        <th>Departamento</th>
                                                        <th>Dirección</th>
                                                    </tr></thead>
                                                <tbody class="tbody-puesto">

                                                </tbody>
                                            </table>


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

                    <!-- row -->



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


        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!

            $(document).ready(function () {
                var num = 1;
                $(".Generar").click(function () {

                    $.each($(".item_req"), function () {
                        $(this).text("P" + num);


                        num++;
                    });
                    num = 1;

                    for (var f = 0; f < 3; f++) {
                        //alert($(".id_paso" + f).val() + " - " + $(".item_"+f).text());
                        $.post("../../paso", "opc=Update_nu_paso&nu_paso=" + $(".item_" + f).text() + "&paso=" + $(".id_paso" + f).val(), function () {

                        });
                    }

                    Listar_Paso($("#select-proceso").val());
                });

                listar_Proceso();
                Listar_Paso($("#select-proceso").val());


                $("#btn-registrar").click(
                        function () {
                            var pr = $("#select-proceso").val();
                            $.post("../../paso", $("#form-paso").serialize(), function () {
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
                        s.append("<option value='' > </option>");
                        for (var j = 0; j < lista.length; j++) {
                            s.append("<option value='" + lista[j].id + "' > " + lista[j].nom + "</option>");
                        }
                    });
                }
                $("#select-proceso").change(
                        function () {
                            Listar_Paso($(this).val());
                            // alert($(this).val());
                        });
                var b = $(".tbodys");
                var c = $(".dd-list");
                function Listar_Paso(proceso) {

                    $.post("../../paso", "opc=Listar&proceso=" + proceso, function (objJson) {
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
                            b.append("<input type='text' name='id' value='" + lista[i].id + "'  class='id_paso" + i + "'/>");
                            b.append("</tr>");
                        }
                        for (var i = 0; i < lista.length; i++) {
                            c.append('<li class="dd-item dd3-item"  ><div class="dd-handle dd3-handle">Drag</div><div class="dd3-content"><label class="item_req item_' + i + '">' + lista[i].num + ' </label> ' +
                                    '<div class="pull-right"><button class="btn btn-success btn-cargar-puesto" value="' + i + '" > Ver Puestos</button></div>' +
                                    '<div class="pull-right"><button class="btn btn-primary btn-editar" value="' + i + '" > Editar</button></div>' +
                                    '<div class="pull-right"><button class="btn btn-primary btn-eliminar" value="' + i + '" > Eliminar</button></div>' +
                                    '<div class="pull-right"><label >' + lista[i].det + '</label></div>' +
                                    '<div class="pull-right"><label >' + lista[i].co + '</label></div>' +
                                    '<input type="hidden" name="id" value="' + lista[i].id + '"  class="id_paso' + i + '"/>' +
                                    '</div> </li>');

                        }
                        $(".Generar").click(function () {
                            var num = $(".tbodys tr").size();

                            for (var f = 0; f < num; f++) {
                                $(".td_num" + f).text("P" + (f + 1));

                            }



                        });

                        $(".btn-cargar-puesto").click(function () {


                            var tbody_p = $(".tbody-puesto");
                            var texto = "";
                            $.post("../../paso", "opc=Paso_Puesto&id=" + $(".id_paso" + $(this).val()).val(), function (objJson) {
                                if (objJson.rpta == -1) {
                                    alert(objJson.mensaje);
                                    return;
                                }
                                tbody_p.empty();
                                var lista = objJson.lista;
                                for (var h = 0; h < lista.length; h++) {
                                    texto += "<tr>";
                                    texto += "<td>" + lista[h].usuario + "</td>";
                                    texto += "<td>" + lista[h].puesto + "</td>";
                                    texto += "<td>" + lista[h].area + "</td>";
                                    texto += "<td>" + lista[h].dep + "</td>";
                                    texto += "<td>" + lista[h].direccion + "</td>";
                                    texto += "</tr>";
                                }
                                tbody_p.append(texto);
                                
                                texto = "";

                            });

                        });
                        $(".btn-editar").click(function () {
                            $(".desc_paso").val($(".td_det" + $(this).val()).text());
                            $(".num_paso").val($(".td_num" + $(this).val()).text());
                            $(".co_paso").val($(".td_co" + $(this).val()).text());
                            $("#select-proceso").val($(".td_id_pro" + $(this).val()).text());
                            $(".id_p").val($(".id_paso" + $(this).val()));


                            $("#btn-registrar").val("Modificar");
                            $(".opc").val("Modificar");
                        });
                        $(".btn-eliminar").click(
                                function () {
                                    var pr_e = $("#select-proceso").val();
                                    if (confirm("Esta Seguro de Eliminar?")) {
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