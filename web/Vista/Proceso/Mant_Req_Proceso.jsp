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

        <title> Mantenimiento de Requerimiento - Proceso </title>
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

        <style>

            .td{
                font-weight: bold;
            }

            #titu{
                font-weight: bold;
                color: #005cac;
                // color: blue;
            }
            p{
                font-weight: bold; 
            }

        </style>

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

                        <!-- NEW COL START -->
                        <article class="col-sm-12 col-md-12 col-lg-12" >

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false">
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
                                    <h2>Mantenimiento de Requerimiento - Proceso</h2>				
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

                                        <form id="checkout-form" class="smart-form form-pro_req" novalidate="novalidate">

                                            <fieldset>
                                                <div class="row">
                                                    <section class="col col-4">
                                                        <label class="select" id="titu">
                                                            Tipo de Planilla :<select name="ti_planilla" class="ti_planilla" required="" >
                                                                <option value="" >[SELECCIONE]</option>
                                                            </select>
                                                        </label>

                                                    </section>
                                                    <section class="col col-4">
                                                        <label class="select" id="titu">
                                                            Requerimiento :<select name="requerimiento" class="req" required="" >
                                                                <option value="" >[SELECCIONE]</option>
                                                            </select>
                                                        </label>

                                                    </section>
                                                    <section class="col col-4">
                                                        <label class="select" id="titu">
                                                            Proceso :<select name="proceso" class="proceso" required="" >
                                                                <option value="" >[SELECCIONE]</option>
                                                            </select>
                                                        </label>
                                                    </section>


                                                </div>
                                                <div class="row">
                                                    <section class="col col-4">
                                                        <label class="select" id="titu">
                                                            Dirección :<select name="direccion" class="direccion" required="" >
                                                                <option value="" >[SELECCIONE]</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-4">
                                                        <label class="select" id="titu">
                                                            Departamento :<select name="deparatamento" class="departamento" required="" >
                                                                <option value="" >[SELECCIONE]</option>

                                                            </select>
                                                        </label>
                                                    </section>
                                                    <section class="col col-4">
                                                        <label class="select" id="titu">
                                                            Area :<select name="area" class="area" required="" >
                                                                <option value="" >[SELECCIONE]</option>
                                                            </select>
                                                        </label>
                                                    </section>
                                                </div>

                                            </fieldset>



                                            <footer>
                                                <button type="button" class="btn btn-danger btn-cancelar">
                                                    Cancelar
                                                </button>
                                                <button type="button" class="btn btn-primary">
                                                    Agregar
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

                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-0" data-widget-editbutton="false">
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
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Lista</h2>

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
                                        <div class="table-responsive">

                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Tipo de Planilla</th>
                                                        <th>Requerimiento</th>
                                                        <th>Proceso</th>
                                                        <th>Dirección</th>
                                                        <th>Departamento</th>
                                                        <th>Area</th>
                                                        <th>Estado</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="tbody-pro-paso">

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
        <script src="../../js/Js_Formulario/Js_Form.js" type="text/javascript"></script>
        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!

            function list_req(objReq) {
                var req = objReq;
                var text_html = "";
                req.empty();
                req.append("<option >Cargando...</option>");
                $.post("../../requerimiento", "opc=Listar_req", function (objJson) {
                    req.empty();

                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        req.append("<option >[SELECCIONE]</option>");
                        for (var i = 0; i < lista.length; i++) {
                            text_html += "<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>";
                        }
                    } else {
                        req.append("<option >[]</option>");
                    }
                    req.append(text_html);
                    text_html = "";

                });
            }
            $(document).ready(function () {
                pageSetUp();
                $(".btn-cancelar").click(function () {
                    $(".form-pro_req")[0].reset();
                    $(".tbody-pro-paso").empty();
                });
                list_select($(".ti_planilla"), "../../requerimiento", "opc=Listar_Tipo_Planilla");
                $(".ti_planilla").change(function () {
                    list_select($(".req"), "../../requerimiento", "opc=Listar_id_req&id=" + $(this).val(), "1", $(this).val());
                });
                list_select($(".proceso"), "../../Proceso", "opc=Listar");
                list_select($(".direccion"), "../../Direccion_Puesto", "opc=Listar_direccion");
                $(".direccion").change(function () {
                    list_select($(".departamento"), "../../Direccion_Puesto", "opc=Listar_dir_dep&id=" + $(this).val(), "1", $(this).val());
                });
                $(".departamento").change(function () {
                    list_select($(".area"), "../../Direccion_Puesto", "opc=Listar_area2&id=" + $(this).val(), "1", $(this).val());
                });
                $(".proceso, .req, .direccion, .departamento, .area, .ti_planilla").change(function () {
                    var tbody = $(".tbody-pro-paso");
                    tbody.empty();
                    var text_html = "";
                    $.post("../../Proceso", "opc=Listar_Pro_Paso_Id&id_req=" + $(".req").val()+"&id_pro="+$(".proceso").val()+"&id_dir="+$(".direccion").val()+"&id_dep="+$(".departamento").val()+"&id_area="+$(".area").val()+"&id_ti_planilla="+$(".ti_planilla").val(), function (objJson) {
                        var lista = objJson.lista;
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                        for (var f = 0; f < lista.length; f++) {
                            text_html += "<tr>";
                            text_html += "<td>" + lista[f].ti_planilla + "</td>";
                            text_html += "<td>" + lista[f].req + "</td>";
                            text_html += "<td>" + lista[f].proceso + "</td>";
                            text_html += "<td>" + lista[f].dir + "</td>";
                            text_html += "<td>" + lista[f].dep + "</td>";
                            text_html += "<td>" + lista[f].area + "</td>";
                            text_html += "<td>" + lista[f].estado + "</td>";
                            text_html += "<td></td>";
                            text_html += "</tr>";
                        }
                        tbody.append(text_html);
                        text_html = "";
                    });
                });
                var $checkoutForm = $('#checkout-form').validate({
                    // Rules for form validation
                    rules: {
                        fname: {
                            required: true
                        },
                        FEC_DESDE: {
                            val_fecha: true
                        },
                        horas_totales: {
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
                        horas_totales: {
                            max: 'Porfavor digite un horario que se menor a 48 Horas de Trabajo'
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
                    errorPlacement: function (error, element) {
                        error.insertAfter(element.parent());
                    }
                });


                jQuery.validator.addMethod("val_fecha", function (value, element) {
                    var d = value.split("-");
                    return this.optional(element) || String(parseInt(d[0])).length == 4;
                }, "¡Fecha ingresada invalida!");

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
                    errorPlacement: function (error, element) {
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
                    errorPlacement: function (error, element) {
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
                    submitHandler: function (form) {
                        $(form).ajaxSubmit({
                            success: function () {
                                $("#comment-form").addClass('submited');
                            }
                        });
                    },
                    // Do not change code below
                    errorPlacement: function (error, element) {
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
                    submitHandler: function (form) {
                        $(form).ajaxSubmit({
                            success: function () {
                                $("#contact-form").addClass('submited');
                            }
                        });
                    },
                    // Do not change code below
                    errorPlacement: function (error, element) {
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
                    errorPlacement: function (error, element) {
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
                    errorPlacement: function (error, element) {
                        error.insertAfter(element.parent());
                    }
                });
                // START AND FINISH DATE
                $('#startdate').datepicker({
                    dateFormat: 'dd.mm.yy',
                    prevText: '<i class="fa fa-chevron-left"></i>',
                    nextText: '<i class="fa fa-chevron-right"></i>',
                    onSelect: function (selectedDate) {
                        $('#finishdate').datepicker('option', 'minDate', selectedDate);
                    }
                });
                $('#finishdate').datepicker({
                    dateFormat: 'dd.mm.yy',
                    prevText: '<i class="fa fa-chevron-left"></i>',
                    nextText: '<i class="fa fa-chevron-right"></i>',
                    onSelect: function (selectedDate) {
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