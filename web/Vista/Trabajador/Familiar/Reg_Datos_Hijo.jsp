<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="pe.edu.upeu.application.model.Tipo_Documento"%>
<%@page import="pe.edu.upeu.application.dao.Tipo_DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceTipo_DocumentoDAO"%>
<%    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>

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

    </head>
    <body>
        <%InterfaceTipo_DocumentoDAO idoc = new Tipo_DocumentoDAO();
            String rol = (String) sesion.getAttribute("IDROL");
        %>
    <center>
        <!--begin widget-->
        <div class="jarviswidget" id="wid-id-1" data-widget-editbutton="false" data-widget-custombutton="false">

            <header>
                <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                <h2><b>HIJOS</b></h2>				

            </header>

            <!-- widget div-->
            <div >

                <!-- widget edit box -->
                <div class="jarviswidget-editbox">
                    <!-- This area used as dropdown edit box -->

                </div>
                <!-- end widget edit box -->

                <!-- widget content -->
                <div class="widget-body no-padding">

                    <form action="../../../familiar" id="formRegDatosHijos" class="smart-form"  >

                        <header>
                            <b>HIJOS</b>
                        </header>

                        <fieldset>
                            <div class="row">
                                <section class="col col-4">
                                    <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                        <input type="text" name="APELLIDO_P" placeholder="Apellido Paterno" required="">
                                    </label>
                                </section>
                                <section class="col col-4">
                                    <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                        <input type="text" name="APELLIDO_M" placeholder="Apellido Materno" required="">
                                    </label>
                                </section>
                                <section class="col col-4">
                                    <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                        <input type="text" name="NOMBRE" placeholder="Nombres" required="">
                                    </label>
                                </section>
                                <section class="col col-4">
                                    <label class="input"> <i class="icon-append fa fa-calendar"></i>
                                        <input type="text" name="FECHA_NAC"  class="datePickerInput" required="" data-mask="99/99/9999" data-mask-placeholder= "_">
                                    </label>
                                </section>
                                <section class="col col-4">
                                    <label class="select">
                                        <select name="SEXO" required="" >
                                            <option value="" selected="" >[Sexo]</option>
                                            <option value="M">Masculino</option>
                                            <option value="F">Femenino</option>

                                        </select> 
                                        <i></i> </label>
                                </section>
                                <section class="col col-4">
                                    <label class="select">
                                        <select name="TIPO_DOC_ID" required="" class="ti_doc">
                                            <option value="" selected="">[Tipo de Documento]</option>
                                            <%for (int i = 0; i < idoc.Listar_tipo_doc().size(); i++) {
                                                    Tipo_Documento t = new Tipo_Documento();
                                                    t = (Tipo_Documento) idoc.Listar_tipo_doc().get(i);
                                            %>
                                            <option value="<%=t.getId_tipo_doc_ident().trim()%>"><%=t.getDe_tdoc_abreviada()%></option>    
                                            <%
                                                }
                                            %>
                                        </select> 
                                        <i></i> </label>
                                </section>
                                <section class="col col-4">
                                    <label class="input">
                                        <input type="text" name="NRO_DOC" placeholder="Nro de Documento" maxlength="10" required="" class="nu_doc">
                                    </label>
                                </section>
                                <section class="col col-4">
                                    <label class="select">
                                        <select name="INSCRIPCION_VIG_ESSALUD" required="">
                                            <option value="" selected="" >[Inscripción Vigente en Essalud]</option>
                                            <option value="1">Si</option>
                                            <option value="0">No</option>
                                        </select> 
                                        <i></i> </label>
                                </section>
                                <section class="col col-4">
                                    <label class="select">
                                        <select name="ESTUD_NIV_SUPERIOR" required="">
                                            <option value="" selected="" >[Estudio de Nivel Superior]</option>
                                            <option value="1">Si</option>
                                            <option value="0">No</option>
                                        </select> 
                                        <i></i> </label>
                                </section>
                            </div>                        
                        </fieldset>
                        <input type="hidden" name="opc"  value="REGISTRAR HIJO">
                        <input type="hidden" name="idtr" class="idtr" value="<%=request.getParameter("idtr")%>"  >
                        <% Boolean accesToEditDataHijos = false;
                            accesToEditDataHijos = (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0001") | rol.trim().equals("ROL-0013"));%>
                        <input type="hidden" class="accesToEditDataHijos" value="<%=accesToEditDataHijos%>"/>
                        <footer>
                            <button type="submit" class="btn btn-primary" >
                                Registrar
                            </button>
                        </footer>
                    </form>

                </div>
                <!-- end widget content -->

            </div>
            <!-- end widget div -->

        </div>
        <!-- end widget -->
        <div class="listar_hijos"></div>


        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>-->

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

        <!-- Demo purpose only 
        <script src="../../../js/demo.min.js"></script>-->

        <!-- MAIN APP JS FILE -->
        <script src="../../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="../../../js/speech/voicecommand.min.js"></script>
        <!-- PAGE RELATED PLUGIN(S) -->
        <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>
        <script src="../../../js/plugin/jquery-form/jquery-form.min.js"></script>
        <script src="../../../js/Js_Formulario/Js_Form.js"></script>
        <script src="../../../js/businessLogic/Hijos/regDatosHijos.js?v=<%=globalProperties.VERSION_JS%>"></script>
        
    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
