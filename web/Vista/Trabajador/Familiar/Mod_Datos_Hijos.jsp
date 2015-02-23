<%    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.web.controller.CConversion"%>
<%@page import="pe.edu.upeu.application.model.Datos_Hijo_Trabajador"%>

<jsp:useBean id="Lista_hijo_individual" scope="application" class="java.util.ArrayList"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title>Registrar Trabajador</title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../../img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">

        <style>

        </style>

        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
        <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>
        <link rel="stylesheet" href="../../../css/Css_Formulario/form.css"  type="text/css" > 
    </head>
    <body>



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

                                        <div class="row" >
                                            <form id="wizard-1" novalidate="novalidate" action="../../../familiar">
                                                <%
                                                    for (int i = 0; i < Lista_hijo_individual.size(); i++) {
                                                        Datos_Hijo_Trabajador d = new Datos_Hijo_Trabajador();
                                                        d = (Datos_Hijo_Trabajador) Lista_hijo_individual.get(i);
                                                %>

                                                <div id="bootstrap-wizard-1" class="col-sm-12">
                                                    <div class="tab-content">
                                                        <div class="row">

                                                            <div class="" >
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">
                                                                        <label >Apellido Paterno:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="APELLIDO_P" value="<%=d.getAp_paterno()%>" required="" id="fname"   class="form-control input-group-sm"  required="" onblur="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label >Apellido Materno:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="APELLIDO_M" value="<%=d.getAp_materno()%>" required=""  id="lname"  class="form-control input-group-sm" required="" onblur="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Nombre(s):</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input type="text" name="NOMBRE" value="<%=d.getNo_hijo_trabajador()%>" required=""  id="lname"  class="form-control input-group-sm" required="" onblur="this.value = this.value.toUpperCase()" maxlength="50" >

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label>Fecha de Nacimiento:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-child fa-lg fa-fw"></i><label class="edad"></label></span>
                                                                        <input type="date" name="FECHA_NAC" required="" value="<%=d.getFe_nacimiento()%>"   class="form-control input-group-sm fecha" >
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label>Sexo:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-flag fa-lg fa-fw"></i></span>
                                                                        <select name="SEXO" class="form-control input-group-sm"   required="" >
                                                                            <%
                                                                                if (d.getEs_sexo().equals("M")) {
                                                                            %>
                                                                            <option value="M" selected="">Masculino</option>
                                                                            <option value="F" >Femennino</option>
                                                                            <%}
                                                                            %>
                                                                            <%
                                                                                if (d.getEs_sexo().equals("F")) {
                                                                            %>
                                                                            <option value="M" >Masculino</option>     
                                                                            <option value="F" selected="">Femennino</option>
                                                                            <%}
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label>Tipo Documento:</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-flag fa-lg fa-fw"></i></span>
                                                                        <select  name="TIPO_DOC_ID" class="form-control input-group-sm"   required="" >
                                                                            <option value=""></option>
                                                                            <%
                                                                                if (d.getEs_tipo_doc().equals("1")) {
                                                                            %>
                                                                            <option value="1" selected="">DNI</option>
                                                                            <option value="2">Partida</option>
                                                                            <%}
                                                                            %>
                                                                            <%
                                                                                if (d.getEs_tipo_doc().equals("2")) {
                                                                            %>
                                                                            <option value="1">DNI</option>
                                                                            <option value="2" selected="">Partida</option>
                                                                            <%}
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label>Numero de Documento: </label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-child fa-lg fa-fw"></i><label class="edad"></label></span>
                                                                        <input  name="NRO_DOC"  required="" value="<%= d.getNu_doc()%>"  class="form-control input-group-sm fecha" >
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label>Inscripción Vigiente Essalud: </label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-flag fa-lg fa-fw"></i></span>
                                                                        <select  name="INSCRIPCION_VIG_ESSALUD" class="form-control input-group-sm"   required="" >
                                                                            <option value=""></option>
                                                                            <%
                                                                                if (d.getEs_inscripcion_vig_essalud().equals("1")) {
                                                                            %>
                                                                            <option value="1" selected="">Si</option>
                                                                            <option value="0">No</option>
                                                                            <%}
                                                                            %>
                                                                            <%
                                                                                if (d.getEs_inscripcion_vig_essalud().equals("0")) {
                                                                            %>
                                                                            <option value="1">Si</option>
                                                                            <option value="0" selected="">No</option>
                                                                            <%}
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label>Estudiante de Nivel Superior: </label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-addon"><i class="fa fa-flag fa-lg fa-fw"></i></span>
                                                                        <select  name="ESTUD_NIV_SUPERIOR" class="form-control input-group-sm"   required="" >
                                                                            <option  value="">[SLECCIONE]</option>
                                                                            <%if (d.getEs_estudio_niv_superior() != null) {
                                                                                    if (d.getEs_estudio_niv_superior().equals("1")) {
                                                                            %>
                                                                            <option  value="1" selected="">Si</option>
                                                                            <option  value="0">No</option>
                                                                            <%}
                                                                            %>
                                                                            <%
                                                                                if (d.getEs_estudio_niv_superior().equals("0")) {
                                                                            %>
                                                                            <option  value="1" selected="">Si</option>
                                                                            <option  value="0">No</option>
                                                                            <%}
                                                                            } else {
                                                                            %>
                                                                            <option  value="1" >Si</option>
                                                                            <option  value="0">No</option
                                                                            <%}%>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <input type="hidden" name="idhijo" value="<%= d.getId_datos_hijos_trabajador()%>">
                                                        <input type="hidden" name="idtr" value="<%= d.getId_trabajador()%>">
                                                        <input type="hidden" name="opc" value="MODIFICAR HIJO">
                                                        <footer>
                                                            <center>
                                                                <button type="submit" value="" name="opc"> MODIFICAR</button>
                                                            </center>
                                                        </footer>
                                                        <%}%>

                                                    </div>


                                                </div>
                                                <!-- end widget content -->
                                            </form>

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


                    <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
                    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>

                    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
                    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
                    <script>
                                                                                if (!window.jQuery) {
                                                                                    document.write('<script src="../../../.js/libs/jquery-2.0.2.min.js"><\/script>');
                                                                                }
                    </script>

                    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
                    <script>
                                                                                if (!window.jQuery.ui) {
                                                                                    document.write('<script src="../../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                                                                                }
                    </script>

                    <!-- IMPORTANT: APP CONFIG -->
                    <script src="../../../js/app.config.js"></script>

                    <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
                    <script src="../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

                    <!-- BOOTSTRAP JS -->
                    <script src="../../../js/bootstrap/bootstrap.min.js"></script>

                    <!-- CUSTOM NOTIFICATION -->
                    <script src="../../../js/notification/SmartNotification.min.js"></script>

                    <!-- JARVIS WIDGETS -->
                    <script src="../../../js/smartwidgets/jarvis.widget.min.js"></script>

                    <!-- EASY PIE CHARTS -->
                    <script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

                    <!-- SPARKLINES -->
                    <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

                    <!-- JQUERY VALIDATE -->
                    <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

                    <!-- JQUERY MASKED INPUT -->
                    <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

                    <!-- JQUERY SELECT2 INPUT -->
                    <script src="../../../js/plugin/select2/select2.min.js"></script>

                    <!-- JQUERY UI + Bootstrap Slider -->
                    <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

                    <!-- browser msie issue fix -->
                    <script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

                    <!-- FastClick: For mobile devices -->
                    <script src="../../../js/plugin/fastclick/fastclick.min.js"></script>

                    <!--[if IE 8]>
                    
                    <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
                    
                    <![endif]-->

                    <!-- Demo purpose only -->
                    <script src="../../../js/demo.min.js"></script>

                    <!-- MAIN APP JS FILE -->
                    <script src="../../../js/app.min.js"></script>

                    <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
                    <!-- Voice command : plugin -->
                    <script src="../../../js/speech/voicecommand.min.js"></script>

                    <!-- PAGE RELATED PLUGIN(S) -->
                    <script src="../../../js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
                    <script src="../../../js/plugin/fuelux/wizard/wizard.min.js"></script>
                    <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>

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
                                                                                            fname: "Por Favor Ingrese su Apellido Paterno",
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
                    </body>
                    </html>
                    <%@include  file="List_Hijo.jsp"%>
                    <%} else {
                            response.sendRedirect("/TALENTO_HUMANO/");
                        }
                    %>