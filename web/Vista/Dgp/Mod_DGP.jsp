
<%@page import="pe.edu.upeu.application.model.V_Det_DGP"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.V_Puesto_Direccion"%>
<%@page import="pe.edu.upeu.application.model.Puesto"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<%@page import="pe.edu.upeu.application.model.X_List_id_dgp"%>
<jsp:useBean id="LIST_ID_DGP" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Trabajador_id" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Det_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Requerimiento" scope="application" class="java.util.ArrayList"/>

<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>
        <link rel="stylesheet" href="../../css/Css_Formulario/form.css"  type="text/css" > 

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../HTML_version/img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../HTML_version/img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../HTML_version/img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../HTML_version/img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../HTML_version/img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../HTML_version/img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../HTML_version/img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../HTML_version/img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../HTML_version/img/splash/iphone.png" media="screen and (max-device-width: 320px)">

        <style>

            .td{
                //  font-weight: bold;
            }
        </style>





    </head>
    <body>    

    <center>



        <form class="form" action="../../dgp" method="post" > 
            <div>
                <table class="table"  >       


                    <%
                        /*Temporal*/
                        String idreq = request.getParameter("idreq");

                        for (int i = 0; i < Listar_Trabajador_id.size(); i++) {
                            V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                            tr = (V_Ficha_Trab_Num_C) Listar_Trabajador_id.get(i);
                    %>
                    <tr><td>Trabajador:</td><td><%=tr.getAp_paterno() + " " + tr.getAp_materno() + " " + tr.getNo_trabajador()%>
                            <input type="hidden" value="<%=tr.getId_trabajador()%>" name="IDDATOS_TRABAJADOR" class="text-box" ></td></tr>   
                            <% }
                                if (Listar_Trabajador_id.size() == 0) { %>   

                    <%}%>

                    <tr><td class="td">Puesto | Seccion | Area:</td><td>
                            <select name="IDPUESTO"  required="" >
                                <%
                                    for (int r = 0; r < LIST_ID_DGP.size(); r++) {
                                        V_Det_DGP w = new V_Det_DGP();
                                        w = (V_Det_DGP) LIST_ID_DGP.get(r);
                                        for (int f = 0; f < List_Puesto.size(); f++) {
                                            V_Puesto_Direccion p = new V_Puesto_Direccion();
                                            p = (V_Puesto_Direccion) List_Puesto.get(f);

                                            if (p.getId_puesto().equals(w.getId_puesto())) {
                                %>
                                <option value="<%=p.getId_puesto()%>" selected=""><% out.println(p.getNo_puesto() + " | " + p.getNo_seccion() + " | " + p.getNo_area());%></option> 
                                <%}%>
                                <option value="<%=p.getId_puesto()%>"><% out.println(p.getNo_puesto() + " | " + p.getNo_seccion() + " | " + p.getNo_area());%></option> 
                                <%}%>
                            </select></td></tr>

                    <tr style="display: "><td class="td">Requermiento:</td><td>
                            <select name="IDREQUERIMIENTO"  class="text-box"   > 
                                <option value=""></option>

                                <% for (int index = 0; index < Listar_Requerimiento.size(); index++) {
                                        Requerimiento t = new Requerimiento();
                                        t = (Requerimiento) Listar_Requerimiento.get(index);
                                        if (idreq.equals(t.getId_requerimiento())) {
                                %>
                                <option value="<%=t.getId_requerimiento()%>" selected="" ><%=t.getNo_req()%></option>
                                <%} else {%>
                                <option value="<%=t.getId_requerimiento()%>"><%=t.getNo_req()%></option>                      
                                <%                          }
                                    }%>
                            </select> 
                        </td></tr>   
                    <input type="hidden" name="IDREQUERIMIENTO"  id="combito"  value="<%=idreq%>" >


                    <tr><td class="td">Fecha Desde:</td><td><input type="date" name="FEC_DESDE" min="<%%>" required="" id="datepicker" class="text-box" value="<%=w.getFe_desde()%>"></td></tr>     
                    <tr><td class="td">Fecha Hasta:</td><td><input type="date" required="" min="<%%>" name="FEC_HASTA" class="text-box" value="<%=w.getFe_hasta()%>"></td></tr>   
                    <tr><td class="td">Sueldo:</td><td><input type="number"  name="SUELDO" required="" class="text-box" value="<%=w.getCa_sueldo()%>"></td></tr>       
                    <tr><td class="td">Bono Alimentario:</td><td><input  type="text"  required="" name="BONO_ALIMENTARIO" class="text-box" value="<%=w.getCa_bono_alimentario()%>" ></td></tr>       

                </table>
            </div>
                    <div id="div_1" class="contenido" style="display:none " >
                <table class="table" style="border: 3px solid red;">
                    <tr><td class="td">BEV:</td><td><input type="text" name="BEV" class="text-box" value="<%=w.getDe_bev()%>"></td></tr>    
                    <tr><td class="td">Centro de Costos:</td><td>
                            <select name="CENTRO_COSTOS">
                                <option value="0">----</option>
                            </select>
                        </td></tr>    
                    <tr><td class="td">Antecedentes Policiales:</td><td><input type="text" name="ANTECEDENTES_POLICIALES" class="text-box" value="<%=w.getDe_antecedentes_policiales()%>"></td></tr>     
                    <tr><td class="td">Certificado de Salud:</td><td><input type="text" name="CERTIFICADO_SALUD" class="text-box" value="<%=w.getDe_certificado_salud()%>"></td></tr>   

                </table>
            </div>   

            <div id="div_2" class="contenido" style="display: none">
                <table  class="table">
                    <tr><td class="td">Subvencion:</td><td><input type="text" name="SUBVENCION" class="text-box" ></td></tr>   
                    <tr><td class="td">Horario de Capacitacion:</td><td><input type="text" name="HORARIO_CAPACITACION" class="text-box" ></td></tr>   
                    <tr><td class="td">Horario de Refrigerio:</td><td><input type="text" name="HORARIO_REFRIGERIO" class="text-box" ></td></tr>  
                    <tr><td class="td">Dias de Capacitacion:</td><td><input type="text" name="DIAS_CAPACITACION
                                                                            " class="text-box" ></td></tr>  


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
                    <input type="hidden"  name="ID_DGP" value="<%=w.getId_dgp()%>">
                </table>
            </div>
            <%}%>

            <table><tr><td><input type="submit" name="opc"  class="submit" value="MODIFICAR"></td></tr>
            </table>
        </form>
            
         
            
    </center>
    <br><br>



</body>

<script language="javascript" type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
<script src="../../js/Js_DGP/abc.js"></script>
<script src="../../js/Js_DGP/organictabs.jquery.js"></script>

<script src="../../js/Js_DGP/prism.js" type="text/javascript" charset="utf-8"></script>
<script src="../../js/Js_DGP/chosen.jquery.js" type="text/javascript"></script>
<script src="../JS/prism.js" type="text/javascript" charset="utf-8"></script>


<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
<script data-pace-options='{ "restartOnRequestAfter": true }' src="../../HTML_version/js/plugin/pace/pace.min.js"></script>

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
        <script src="../../HTML_version/js/app.config.js"></script>

        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
        <script src="../../HTML_version/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

        <!-- BOOTSTRAP JS -->
        <script src="../../HTML_version/js/bootstrap/bootstrap.min.js"></script>

        <!-- CUSTOM NOTIFICATION -->
        <script src="../../HTML_version/js/notification/SmartNotification.min.js"></script>

        <!-- JARVIS WIDGETS -->
        <script src="../../HTML_version/js/smartwidgets/jarvis.widget.min.js"></script>

        <!-- EASY PIE CHARTS -->
        <script src="../../HTML_version/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!-- SPARKLINES -->
        <script src="../../HTML_version/js/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="../../HTML_version/js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="../../HTML_version/js/plugin/masked-input/jquery.maskedinput.min.js"></script>

        <!-- JQUERY SELECT2 INPUT -->
        <script src="../../HTML_version/js/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="../../HTML_version/js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="../../HTML_version/js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="../../HTML_version/js/plugin/fastclick/fastclick.min.js"></script>

        <!--[if IE 8]>

        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

        <![endif]-->

        <!-- Demo purpose only -->
        <script src="../../HTML_version/js/demo.min.js"></script>

        <!-- MAIN APP JS FILE -->
        <script src="../../HTML_version/js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="../../HTML_version/js/speech/voicecommand.min.js"></script>

        <!-- PAGE RELATED PLUGIN(S) -->
        <script src="../../HTML_version/js/plugin/jquery-form/jquery-form.min.js"></script>
        
        
        
<script type="text/javascript">
            var config = {
                '.chosen-select': {},
                '.chosen-select-deselect': {allow_single_deselect: true},
                '.chosen-select-no-single': {disable_search_threshold: 10},
                '.chosen-select-no-results': {no_results_text: 'Oops, nothing found!'},
                '.chosen-select-width': {width: "95%"}
            }
            for (var selector in config) {
                $(selector).chosen(config[selector]);
            }
</script>

<SCRIPT LANGUAGE="JavaScript">
            function checkIt(evt) {
                evt = (evt) ? evt : window.event
                var charCode = (evt.which) ? evt.which : evt.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    status = "This field accepts numbers only."
                    return false
                }
                status = ""
                return true
            }
        </SCRIPT>


        <script language="javascript" type="text/javascript">
            $(document).ready(function() {
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

</html>
