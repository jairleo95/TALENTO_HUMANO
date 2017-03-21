<%-- 
    Document   : Mod_Asp_Religioso
    Created on : 28/01/2015, 02:18:06 PM
    Author     : Alex
--%>

<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>

<jsp:useBean id="ListaridTrabajador" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
            <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production-plugins.min.css">
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
        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
        <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>

        <style>
            label{
                font-weight: bold;
            }
        </style>

    </head>
    <body>
        <form align="center" action="../../../trabajador"  >

            <%for (int index = 0; index < ListaridTrabajador.size(); index++) {
                    V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                    trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);
            %>   

            <%}%>
        </form>

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
                                        <h2>MODIFICAR ASPECTO RELIGIOSO</h2>
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
                                            <form action="../../../trabajador"  >
                                                <%for (int index = 0; index < ListaridTrabajador.size(); index++) {
                                                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                                                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);
                                                %>  

                                                <div id="bootstrap-wizard-1" class="col-sm-12">

                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="tab1">
                                                            <div class="row" >

                                                                <div class="col-sm-4">

                                                                    <div class="form-group">
                                                                        <label>Religión:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="RELIGION"   required=""   class="form-control input-group-sm" id="reli">
                                                                                <option value="" disabled="" selected="">[SELECCIONE]</option> 
                                                                                <%if (trb.getLi_religion() != null) {
                                                                                        if (trb.getLi_religion().equals("1")) {%>
                                                                                <option value="1" selected="">Adventista</option> 
                                                                                <option value="2" >Catolico</option> 
                                                                                <option value="3" >Ótros</option> 
                                                                                <%}
                                                                                    if (trb.getLi_religion().equals("2")) {%>
                                                                                <option value="1" >Adventida</option> 
                                                                                <option value="2" selected="">Catolico</option> 
                                                                                <option value="3" >Ótros</option> 
                                                                                <%}
                                                                                    if (trb.getLi_religion().equals("3")) {%>
                                                                                <option value="1" >Adventida</option> 
                                                                                <option value="2" >Catolico</option> 
                                                                                <option value="3" selected="">Ótros</option> 
                                                                                <%}
                                                                                } else {%>
                                                                                <option value="1" >Adventida</option> 
                                                                                <option value="2" >Catolico</option> 
                                                                                <option value="3" >Ótros</option> 
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Nombre de la Iglesia:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm" value="<%if (trb.getNo_iglesia() != null) {
                                                                                    out.print(trb.getNo_iglesia());
                                                                                } else {
                                                                                    out.print("");
                                                                                }%>" type="text" name="IGLESIA" id="igle" >

                                                                        </div>
                                                                    </div>
                                                                </div>     
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Cargo en la Iglesia:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm" value="<%if (trb.getDe_cargo() != null) {
                                                                                    out.print(trb.getDe_cargo());
                                                                                } else {
                                                                                    out.print("");
                                                                            }%>" type="text" name="CARGO"  id="ca_igle" maxlength="100">

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Autoridad:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <select name="AUTORIDAD"   required=""   class="form-control input-group-sm">
                                                                                <option value=""  selected="">[SELECCIONE]</option> 
                                                                                <% if (trb.getLi_autoridad() != null) {
                                                                                        if (trb.getLi_autoridad().trim().equals("1")) {%>
                                                                                <option value="1" selected="">Pastor</option> 
                                                                                <option value="2" >Primer Anciano</option> 
                                                                                <option value="3" >Sacerdote</option> 
                                                                                <%}
                                                                                    if (trb.getLi_autoridad().trim().equals("2")) {%>
                                                                                <option value="1" >Pastor</option> 
                                                                                <option value="2" selected="">Primer Anciano</option> 
                                                                                <option value="3" >Sacerdote</option> 
                                                                                <%}
                                                                                    if (trb.getLi_autoridad().trim().equals("3")) {%>
                                                                                <option value="1" >Pastor</option> 
                                                                                <option value="2" >Primer Anciano</option> 
                                                                                <option value="3" selected="">Sacerdote</option> 
                                                                                <%}
                                                                                } else {%>
                                                                                <option value="" selected="" >[SELECCIONE]</option>
                                                                                <option value="1" >Pastor</option> 
                                                                                <option value="2" >Primer Anciano</option> 
                                                                                <option value="3" >Sacerdote</option> 
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Nombre y Apellidos (Autoridad):</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm" value="<%if (trb.getNo_ap_autoridad() != null) {
                                                                                    out.print(trb.getNo_ap_autoridad());
                                                                                } else {
                                                                                    out.print("");
                                                                                }%>" type="text" name="AUT_APELLIDOSNOMBRES"  required="" id="no_ape" >

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Telefono/Celular:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm" value="<%if (trb.getCl_autoridad() != null) {
                                                                                    out.print(trb.getCl_autoridad());
                                                                                } else {
                                                                                    out.print("");
                                                                                }%>" type="text" name="AUT_CELULAR" id="te_ce" >

                                                                        </div>
                                                                    </div>
                                                                </div>



                                                            </div>

                                                        </div>
                                                        <%String idtr = request.getParameter("idtr");%>
                                                        <input type="hidden" value="<%=idtr%>" name="idtr">
                                                        <input type="hidden" value="Modificar_Asp_Rel" name="opc">
                                                        <center>
                                                            <button type="submit" class="btn btn-labeled btn-info" name="opc">
                                                                <span class="btn-label">
                                                                    <i class="glyphicon glyphicon-pencil"></i>
                                                                </span>Modificar
                                                            </button>
                                                        </center>
                                                    </div>
                                                </div>

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

        <script>
            $(document).ready(
                    function() {
                        $("#reli").change(
                                function() {
                                    iglesia($(this).val());
                                }
                        );
                    });
            function iglesia(igle) {
                if (igle == '1') {
                    $("#igle").attr("required", "required")
                    $("#igle").val("");
                    $("#ca_igle").val("");
                    $("#no_ape").val("");
                    $("#no_ape").attr("required","re")
                    $("#te_ce").val("");
                }
                if (banco == '2') {
                    $("#igle").removeAttr("required", "required")
                    $("#igle").val("");
                    $("#ca_igle").val("");
                    $("#no_ape").val("");
                    $("#no_ape").removeAttr("required","re")
                    $("#te_ce").val("");
                }
                if (banco == '3') {
                    $("#igle").removeAttr("required", "required")
                    $("#no_ape").removeAttr()("required","re")
                    
                }
            }



        </script>
    </body>
</html>
