
<!DOCTYPE html>
<html>
    <head>
        <title>Detalle Historial</title>
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
            <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">
        <!-- #FAVICONS -->
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <!-- #GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
    </head>
    <body>
        <div id="main" role="main" style="margin: 0px;">
            <div id="content" >
                <section id="widget-grid" class="">
                    <div class="row">
                        <div class="well slideInDown fast animated">
                            <h1 class="text-center"><strong>Cambiar Contraseña  </strong> <small>  </small></h1><br>
                            <form class="smart-form form_cambiar_clave" >
                                <div class="row">

                                    <div class="col col-lg-12">
                                        <section class="col col-sm-4">Contraseña actual:
                                            <label class="input"> <i class="icon-append fa fa-lock"></i>
                                                <input type="password" name="password1" placeholder="Clave Actual"  required="">
                                                <b class="tooltip tooltip-bottom-right">Ingrese su contraseña actual</b> </label>
                                        </section>
                                        <section class="col col-sm-4">Escribir nueva contraseña:
                                            <label class="input"> <i class="icon-append fa fa-lock"></i>
                                                <input type="password" name="password2" placeholder="Clave Nueva" id="password" required="">
                                                <b class="tooltip tooltip-bottom-right">No olvides tu contraseña</b> </label>
                                        </section>
                                        <section class="col col-sm-4">Confirmar Contraseña:
                                            <label class="input"> <i class="icon-append fa fa-lock"></i>
                                                <input type="password" name="passwordConfirm" placeholder="Repetir Clave Nueva" required="">
                                                <b class="tooltip tooltip-bottom-right">No olvides tu contraseña</b> </label>
                                        </section>
                                    </div>
                                </div>
                                <footer>
                                    <button type="button" class="btn_validar_form btn btn-primary">
                                        Cambiar Contraseña 
                                    </button>
                                </footer>
                            </form>
                        </div>
                    </div>

                </section>

            </div>
        </div>

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

        <!-- Demo purpose only
        <script src="../../js/demo.min.js"></script> -->

        <!-- MAIN APP JS FILE -->
        <script src="../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="../../js/speech/voicecommand.min.js"></script>

        <!-- PAGE RELATED PLUGIN(S) 
        <script src="..."></script>-->
        <script src="../../js/notification/SmartNotification.min.js"></script>
        <script type="text/javascript">
            // DO NOT REMOVE : GLOBAL FUNCTIONS!
            $(document).ready(function () {
                pageSetUp();
                $(".btn_validar_form ").click(function () {
                    if ($(".form_cambiar_clave").valid()) {
                        $.ajax({
                            url: "../../Usuario",
                            type: "post",
                            data: $(".form_cambiar_clave").serialize() + "&opc=Cambiar_clave"
                        }).done(function (e) {
                            $(".form_cambiar_clave")[0].reset();
                            var $p = $(this).parent().parent();
                            $p.removeClass('has-success');
                            $("section > label").removeClass('state-success');
                            if (e == '0') {
                                $.smallBox({
                                    title: "Error de validación",
                                    content: "<i class='fa fa-clock-o'></i> <i>Contraseña actual incorrecta, intente de nuevo...</i>",
                                    color: "#C46A69",
                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                    timeout: 4000
                                });
                            } else if (e == '1') {
                                $.smallBox({
                                    title: "Cambio de contraseña",
                                    content: "<i class='fa fa-clock-o'></i> <i>Se ha modificado la contraseña correctamente...</i>",
                                    color: "#659265",
                                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                    timeout: 4000
                                });
                            }

                        });
                    }

                });

                $(".form_cambiar_clave").validate({
                    // Rules for form validation
                    rules: {
                        password: {
                            required: true,
                            minlength: 6,
                            maxlength: 20
                        },
                        passwordConfirm: {
                            required: true,
                            minlength: 6,
                            maxlength: 20,
                            equalTo: '#password'
                        }
                    },
                    // Messages for form validation
                    messages: {
                        clave: {
                            required: 'Ingrese su contraseña'
                        },
                        password: {
                            required: 'Ingrese una contraseña nueva'
                        },
                        passwordConfirm: {
                            required: 'Please enter your password one more time',
                            equalTo: 'La contraseñas no son iguales'
                        }
                    },
                    // Do not change code below
                    errorPlacement: function (error, element) {
                        error.insertAfter(element.parent());
                    }
                });

            })

        </script>
    </body>
</html>
