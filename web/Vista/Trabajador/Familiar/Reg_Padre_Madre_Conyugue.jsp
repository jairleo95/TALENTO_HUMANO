<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>

        <link rel="stylesheet" href="../../../css/Css_Formulario/form.css"  type="text/css" > 

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

        <script language="javascript" type="text/javascript" src="../../../js/JQuery/jQuery.js"></script>

        <script type="text/javascript">
            $(document).ready(
                    function() {
                        $("#as").focus();
                    }
            );
        </script>
    </head>
    <body>
    <center>
        <label class="title">DATOS DEL PADRE, MADRE Y CONYUGUE</label>

        <form class="form" action="../../../familiar"> 
            <div >
                <table class="table" >  
                    <tr><td colspan="4"><div class="sub_title"><label class="label">Datos del Padre y Madre</label></div></td></tr>

                    <tr><td>Apellidos y Nombres del Padre:</td><td><input type="text" name="APELLIDOS_NOMBRES_PADRE"    class="text-box"  id="as" required="" maxlength="50"></td></tr>         
                    <tr><td>Apellidos  y Nombres de la Madre:</td><td><input type="text" name="APELLIDOS_NOMBRES_MADRE"  class="text-box" required="" maxlength="50"></td></tr>        
                </table>  
            </div>
            <div style="display: //none;" >
                <table  class="table">
                    <tr><td colspan="4"><div class="sub_title"><label class="label">Datos del Cónyugue</label></div></td></tr>
                    <tr><td>¿Trabaja Upeu Conyugue?</td><td>
                            <select name="TRABAJA_UPEU_CONYUGUE"  required=""  class="text-box">
                                <option value="1">Si</option>
                                <option value="0">No</option>
                            </select>
                        </td></tr>  

                    <tr><td>Apellidos y Nombres :</td><td><input type="text" name="APELLIDO_NOMBRES_CONYUGUE" class="text-box" required="" maxlength="50"></td></tr>    
                    <tr><td>Fecha de Nacimiento:</td><td><input type="date" name="FECHA_NAC_CONYUGUE"  class="text-box" required=""></td></tr>               

                    <tr><td>Tipo Documento:</td><td>
                            <select name="TIPO_DOC_ID"  class="text-box" required="">
                                <option value=""></option>
                                <option value="1">DNI</option>
                                <option value="2">Pasaporte</option>
                            </select>
                    <tr><td>Nro de Documento:</td><td><input type="text" name="NRO_DOC" class="text-box" required="" maxlength="10"></td></tr>           
                    <tr><td>Inscripcion Vigente en Essalud:</td><td>
                            <select name="INSCRIPCION_VIG_ESSALUD"   class="text-box" required="">
                                <option value=""></option>
                                <option value="1">Si</option>
                                <option value="0">No</option>
                            </select>
                        </td></tr>
                </table>
            </div>
            <div>
                <table class="table">
                    <input type="hidden" name="IDDATOS_TRABAJADOR"  value="<%=request.getParameter("idtr")%>" class="text-box" >  

                    <tr><td><input type="submit" name="opc"  class="submit" value="REGISTRAR"></td></tr>

                </table>
            </div>
                    </form>
                        
            <div class="jarviswidget" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false">
          
                <header>
                    <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                    <h2>DATOS DEL PADRE, MADRE Y CONYUGUE </h2>				

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

                        <form action="../../../familiar" id="checkout-form" class="smart-form" novalidate="novalidate">

                            <fieldset>
                                <div class="row">
                                    <section class="col col-6">
                                        <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                            <input type="text" name="fname" placeholder="First name">
                                        </label>
                                    </section>
                                    <section class="col col-6">
                                        <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                            <input type="text" name="lname" placeholder="Last name">
                                        </label>
                                    </section>
                                </div>

                                <div class="row">
                                    <section class="col col-6">
                                        <label class="input"> <i class="icon-prepend fa fa-envelope-o"></i>
                                            <input type="email" name="email" placeholder="E-mail">
                                        </label>
                                    </section>
                                    <section class="col col-6">
                                        <label class="input"> <i class="icon-prepend fa fa-phone"></i>
                                            <input type="tel" name="phone" placeholder="Phone" data-mask="(999) 999-9999">
                                        </label>
                                    </section>
                                </div>
                            </fieldset>

                            <fieldset>
                                <div class="row">
                                    <section class="col col-5">
                                        <label class="select">
                                            <select name="country">
                                                <option value="0" selected="" disabled="">Country</option>
                                                <option value="244">Aaland Islands</option>
                                                <option value="1">Afghanistan</option>
                                                <option value="239">Zimbabwe</option>
                                            </select> <i></i> </label>
                                    </section>

                                    <section class="col col-4">
                                        <label class="input">
                                            <input type="text" name="city" placeholder="City">
                                        </label>
                                    </section>

                                    <section class="col col-3">
                                        <label class="input">
                                            <input type="text" name="code" placeholder="Post code">
                                        </label>
                                    </section>
                                </div>

                                <section>
                                    <label for="address2" class="input">
                                        <input type="text" name="address2" id="address2" placeholder="Address">
                                    </label>
                                </section>

                                <section>
                                    <label class="textarea"> 										
                                        <textarea rows="3" name="info" placeholder="Additional info"></textarea> 
                                    </label>
                                </section>
                            </fieldset>

                            <fieldset>
                                <section>
                                    <div class="inline-group">
                                        <label class="radio">
                                            <input type="radio" name="radio-inline" checked="">
                                            <i></i>Visa</label>
                                        <label class="radio">
                                            <input type="radio" name="radio-inline">
                                            <i></i>MasterCard</label>
                                        <label class="radio">
                                            <input type="radio" name="radio-inline">
                                            <i></i>American Express</label>
                                    </div>
                                </section>

                                <section>
                                    <label class="input">
                                        <input type="text" name="name" placeholder="Name on card">
                                    </label>
                                </section>

                                <div class="row">
                                    <section class="col col-10">
                                        <label class="input">
                                            <input type="text" name="card" placeholder="Card number" data-mask="9999-9999-9999-9999">
                                        </label>
                                    </section>
                                    <section class="col col-2">
                                        <label class="input">
                                            <input type="text" name="cvv" placeholder="CVV2" data-mask="999">
                                        </label>
                                    </section>
                                </div>

                                <div class="row">
                                    <label class="label col col-4">Expiration date</label>
                                    <section class="col col-5">
                                        <label class="select">
                                            <select name="month">
                                                <option value="0" selected="" disabled="">Month</option>
                                                <option value="1">January</option>
                                                <option value="1">February</option>
                                                <option value="3">March</option>
                                                <option value="4">April</option>
                                                <option value="5">May</option>
                                                <option value="6">June</option>
                                                <option value="7">July</option>
                                                <option value="8">August</option>
                                                <option value="9">September</option>
                                                <option value="10">October</option>
                                                <option value="11">November</option>
                                                <option value="12">December</option>
                                            </select> <i></i> </label>
                                    </section>
                                    <section class="col col-3">
                                        <label class="input">
                                            <input type="text" name="year" placeholder="Year" data-mask="2099">
                                        </label>
                                    </section>
                                </div>
                            </fieldset>

                            <footer>
                                <button type="submit" class="btn btn-primary">
                                    Validate Form
                                </button>
                            </footer>
                        </form>

                    </div>
                    <!-- end widget content -->

                </div>
                <!-- end widget div -->

            </div>
            <!-- end widget -->
        </form></center><br><br>

    <!--================================================== -->

    <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>

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
    <script src="../../../js/plugin/jquery-form/jquery-form.min.js"></script>


    <script type="text/javascript">

// DO NOT REMOVE : GLOBAL FUNCTIONS!

$(document).ready(function() {

    pageSetUp();

    var $checkoutForm = $('#checkout-form').validate({
        // Rules for form validation
        rules: {
            fname: {
                required: true
            },
            lname: {
                required: true
            },
            email: {
                required: true,
                email: true
            },
            phone: {
                required: true
            },
            country: {
                required: true
            },
            city: {
                required: true
            },
            code: {
                required: true,
                digits: true
            },
            address: {
                required: true
            },
            name: {
                required: true
            },
            card: {
                required: true,
                creditcard: true
            },
            cvv: {
                required: true,
                digits: true
            },
            month: {
                required: true
            },
            year: {
                required: true,
                digits: true
            }
        },
        // Messages for form validation
        messages: {
            fname: {
                required: 'Please enter your first name'
            },
            lname: {
                required: 'Please enter your last name'
            },
            email: {
                required: 'Please enter your email address',
                email: 'Please enter a VALID email address'
            },
            phone: {
                required: 'Please enter your phone number'
            },
            country: {
                required: 'Please select your country'
            },
            city: {
                required: 'Please enter your city'
            },
            code: {
                required: 'Please enter code',
                digits: 'Digits only please'
            },
            address: {
                required: 'Please enter your full address'
            },
            name: {
                required: 'Please enter name on your card'
            },
            card: {
                required: 'Please enter your card number'
            },
            cvv: {
                required: 'Enter CVV2',
                digits: 'Digits only'
            },
            month: {
                required: 'Select month'
            },
            year: {
                required: 'Enter year',
                digits: 'Digits only please'
            }
        },
        // Do not change code below
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });

    var $registerForm = $("#smart-form-register").validate({
        // Rules for form validation
        rules: {
            username: {
                required: true
            },
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 3,
                maxlength: 20
            },
            passwordConfirm: {
                required: true,
                minlength: 3,
                maxlength: 20,
                equalTo: '#password'
            },
            firstname: {
                required: true
            },
            lastname: {
                required: true
            },
            gender: {
                required: true
            },
            terms: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            login: {
                required: 'Please enter your login'
            },
            email: {
                required: 'Please enter your email address',
                email: 'Please enter a VALID email address'
            },
            password: {
                required: 'Please enter your password'
            },
            passwordConfirm: {
                required: 'Please enter your password one more time',
                equalTo: 'Please enter the same password as above'
            },
            firstname: {
                required: 'Please select your first name'
            },
            lastname: {
                required: 'Please select your last name'
            },
            gender: {
                required: 'Please select your gender'
            },
            terms: {
                required: 'You must agree with Terms and Conditions'
            }
        },
        // Do not change code below
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });

    var $reviewForm = $("#review-form").validate({
        // Rules for form validation
        rules: {
            name: {
                required: true
            },
            email: {
                required: true,
                email: true
            },
            review: {
                required: true,
                minlength: 20
            },
            quality: {
                required: true
            },
            reliability: {
                required: true
            },
            overall: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            name: {
                required: 'Please enter your name'
            },
            email: {
                required: 'Please enter your email address',
                email: '<i class="fa fa-warning"></i><strong>Please enter a VALID email addres</strong>'
            },
            review: {
                required: 'Please enter your review'
            },
            quality: {
                required: 'Please rate quality of the product'
            },
            reliability: {
                required: 'Please rate reliability of the product'
            },
            overall: {
                required: 'Please rate the product'
            }
        },
        // Do not change code below
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });

    var $commentForm = $("#comment-form").validate({
        // Rules for form validation
        rules: {
            name: {
                required: true
            },
            email: {
                required: true,
                email: true
            },
            url: {
                url: true
            },
            comment: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            name: {
                required: 'Enter your name',
            },
            email: {
                required: 'Enter your email address',
                email: 'Enter a VALID email'
            },
            url: {
                email: 'Enter a VALID url'
            },
            comment: {
                required: 'Please enter your comment'
            }
        },
        // Ajax form submition
        submitHandler: function(form) {
            $(form).ajaxSubmit({
                success: function() {
                    $("#comment-form").addClass('submited');
                }
            });
        },
        // Do not change code below
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });

    var $contactForm = $("#contact-form").validate({
        // Rules for form validation
        rules: {
            name: {
                required: true
            },
            email: {
                required: true,
                email: true
            },
            message: {
                required: true,
                minlength: 10
            }
        },
        // Messages for form validation
        messages: {
            name: {
                required: 'Please enter your name',
            },
            email: {
                required: 'Please enter your email address',
                email: 'Please enter a VALID email address'
            },
            message: {
                required: 'Please enter your message'
            }
        },
        // Ajax form submition
        submitHandler: function(form) {
            $(form).ajaxSubmit({
                success: function() {
                    $("#contact-form").addClass('submited');
                }
            });
        },
        // Do not change code below
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });

    var $loginForm = $("#login-form").validate({
        // Rules for form validation
        rules: {
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 3,
                maxlength: 20
            }
        },
        // Messages for form validation
        messages: {
            email: {
                required: 'Please enter your email address',
                email: 'Please enter a VALID email address'
            },
            password: {
                required: 'Please enter your password'
            }
        },
        // Do not change code below
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });

    var $orderForm = $("#order-form").validate({
        // Rules for form validation
        rules: {
            name: {
                required: true
            },
            email: {
                required: true,
                email: true
            },
            phone: {
                required: true
            },
            interested: {
                required: true
            },
            budget: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            name: {
                required: 'Please enter your name'
            },
            email: {
                required: 'Please enter your email address',
                email: 'Please enter a VALID email address'
            },
            phone: {
                required: 'Please enter your phone number'
            },
            interested: {
                required: 'Please select interested service'
            },
            budget: {
                required: 'Please select your budget'
            }
        },
        // Do not change code below
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });

    // START AND FINISH DATE
    $('#startdate').datepicker({
        dateFormat: 'dd.mm.yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onSelect: function(selectedDate) {
            $('#finishdate').datepicker('option', 'minDate', selectedDate);
        }
    });

    $('#finishdate').datepicker({
        dateFormat: 'dd.mm.yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onSelect: function(selectedDate) {
            $('#startdate').datepicker('option', 'maxDate', selectedDate);
        }
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



</body>
</html>
