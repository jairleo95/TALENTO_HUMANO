
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

            });


        </script>


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
                                    $("#suel_total").text(v);
                                }
                        );
                        $("#bono_al").keyup(
                                function () {
                                    var x = parseFloat($("#sueldo").val());
                                    var y = parseFloat($("#bono_al").val());
                                    var z = parseFloat($("#bev").val());
                                    var v = x + y + z;
                                    $("#suel_total").text(v);
                                }
                        );
                        $("#bev").keyup(
                                function () {
                                    var x = parseFloat($("#sueldo").val());
                                    var y = parseFloat($("#bono_al").val());
                                    var z = parseFloat($("#bev").val());
                                    var v = x + y + z;
                                    $("#suel_total").text(v);
                                }
                        );

                    }
            );
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
        <div id="main" role="main" style="margin: 0px;">

            <div id="content">
                <section id="widget-grid" class="">
                    <div class="row">

                        <!-- NEW COL START -->
                        <article class="col-sm-12 col-md-12 col-lg-6">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget" id="wid-id-0" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false">
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

                                        <form class="smart-form" action="../../dgp">
                                            <header class="titulo_req">

                                                <div class="spacing">
                                                    <center><h1 class="spacing" style="font-weight: bold; margin: 0px;  color: #005cac;"> Documento de Gestión de Personal</h1></center>
                                                    <br>

                                                </div>
                                            </header>

                                            <fieldset>
                                                <%
                                                    /*Temporal*/
                                                    String idreq = request.getParameter("idreq");

                                                    for (int i = 0; i < Listar_Trabajador_id.size(); i++) {
                                                        V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                                                        tr = (V_Ficha_Trab_Num_C) Listar_Trabajador_id.get(i);
                                                %>

                                                <section>
                                                    <label class="label" id="titu">Trabajador :</label>
                                                    <label class="input">
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
                                                    <label class="input">
                                                        <select name="IDREQUERIMIENTO"    disabled="" onchange="mostrar()" class="text-box"  id="nom_req"  > 
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
                                                <section>
                                                    <label class="label" id="titu">Fecha de Inicio :</label>
                                                    <label class="input">
                                                        <input type="date" name="FEC_DESDE"  required="" id="datepicker" class="input-xs" >
                                                    </label>
                                                </section>
                                                <section>
                                                    <label class="label" id="titu">Fecha de Cese :</label>
                                                    <label class="input">
                                                        <input type="date" required="" required="" name="FEC_HASTA" class="input-xs" >
                                                    </label>
                                                </section>
                                                <section>
                                                    <label class="label" id="titu">Sueldo :</label>
                                                    <label class="input">
                                                        <input type="text"  name="SUELDO" required="" value="0.0"  id="sueldo" class="input-xs" >
                                                    </label>
                                                </section>
                                                <section>
                                                    <label class="label" id="titu">Bono de Alimentos :</label>
                                                    <label class="input">
                                                        <input  type="text"  required="" value="0.0" name="BONO_ALIMENTARIO"  id="bono_al" class="input-xs" >

                                                    </label>
                                                </section>
                                                <section>
                                                    <label class="label" id="titu">BEV :</label>
                                                    <label class="input">
                                                        <input type="text" name="BEV" class="input-xs" value="0.0" id="bev" >
                                                    </label>
                                                </section>
                                                <section>
                                                    <label class="label" id="titu">Sueldo Total :</label>
                                                    <label class="input">
                                                        <div id="suel_total" style="color: red;">0.0</div>
                                                    </label>
                                                </section>
                                                <section>
                                                    <label class="label" id="titu">Centro de Costos :</label>
                                                    <label class="input">
                                                        <select name="CENTRO_COSTOS">
                                                            <option value="0">----</option>
                                                        </select>
                                                    </label>
                                                </section>
                                                <section>
                                                    <label class="label" id="titu">Antecedentes Policiales :</label>
                                                    <label class="input">
                                                        <select name="ANTECEDENTES_POLICIALES" >
                                                            <option value="1" selected="">No</option>
                                                            <option value="2">Si</option>
                                                        </select>
                                                    </label>
                                                </section>
                                                <section>
                                                    <label class="label" id="titu">Certificado de Salud :</label>
                                                    <label class="input">
                                                        <input type="text" name="CERTIFICADO_SALUD" class="input-xs"  required=""e>
                                                    </label>
                                                </section>
                                                <input type="hidden" name="IDREQUERIMIENTO"  id="combito"  value="<%=idreq%>">
                                                <div id="div_2" class="contenido" style="display: none">
                                                    <table  class="table">
                                                        <tr><td class="td">Subvencion:</td><td><input type="text" name="SUBVENCION" class="text-box" ></td></tr>   
                                                        <tr><td class="td">Horario de Capacitacion:</td><td><input type="text" name="HORARIO_CAPACITACION" class="text-box" ></td></tr>   
                                                        <tr><td class="td">Horario de Refrigerio:</td><td><input type="text" name="HORARIO_REFRIGERIO" class="text-box" ></td></tr>  
                                                        <tr><td class="td">Dias de Capacitacion:</td><td><input type="text" name="DIAS_CAPACITACION" class="text-box" ></td></tr>  


                                                    </table>
                                                </div  >

                                                <div id="div_3" class="contenido" style="display:none ">
                                                    <table class="table">
                                                        <tr><td class="td">Ruc:</td><td><input type="text" name="RUC" class="text-box" ></td></tr>    
                                                        <tr><td class="td">Lugar de Servicio:</td><td><input type="text" name="LUGAR_SERVICIO" class="text-box" ></td></tr>   
                                                        <tr><td class="td">Descripcion de Servicio:</td><td><input type="text" name="DESCRIPCION_SERVICIO" class="text-box" ></td></tr> 
                                                        <tr><td class="td">Monto del Honorario:</td><td><input type="text" name="MONTO_HONORARIO" class="text-box" ></td></tr>   
                                                        <tr><td class="td">Periodo Pago:</td><td><input type="text" name="PERIODO_PAGO" class="text-box" ></td></tr>    
                                                        <tr><td class="td">Domicilio Fiscal:</td><td><input type="text" name="DOMICILIO_FISCAL" class="text-box" ></td></tr>    
                                                    </table>
                                                </div>
                                                <input type="hidden" name="opc"  class="submit" value="Registrar">


                                            </fieldset>

                                            <footer>
                                                <button type="submit" class="btn btn-primary">
                                                    Enviar
                                                </button>
                                                <button type="button" class="btn btn-default" onclick="window.history.back();">
                                                    Atras
                                                </button>
                                            </footer>
                                        </form>


                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->

                        </article>
                        <!-- END COL -->

                    </div>

                </section>
            </div>
        </div>

    </body>
    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>
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

    <!-- PAGE RELATED PLUGIN(S) 
    <script src="..."></script>-->



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
