<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%-- 
    Document   : Editor_Plantilla
    Created on : 12-oct-2014, 10:44:45
    Author     : ALFA 3
--%>
<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<%@page import="pe.edu.upeu.application.model.X_List_dat_tr_plantilla"%>
<jsp:useBean id="LIST_DAT_TR_PLANTILLA" scope="session" class="java.util.ArrayList"/>

<!DOCTYPE html>
<html lang="">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Editor de Plantillas </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

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
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

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
    <body class="">

        <!-- HEADER -->
        <header id="">


        </header>


        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">


            <!-- MAIN CONTENT -->
            <div id="content">


                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-fullscreenbutton="false" data-widget-sortable="false">
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
                                    <span class="widget-icon"> <i class="fa fa-pencil"></i> </span>
                                    <h2>CK Editor (Full version) </h2>				

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
                                        <%
                                            for (int i = 0; i < LIST_DAT_TR_PLANTILLA.size(); i++) {
                                                X_List_dat_tr_plantilla p = new X_List_dat_tr_plantilla();
                                                p = (X_List_dat_tr_plantilla) LIST_DAT_TR_PLANTILLA.get(i);
                                        %>
                                        <textarea name="ckeditor">

 <h2 style="text-align:center"><strong>CONTRATO DE TRABAJO A PLAZO FIJO Y BAJO MODALIDAD</strong></h2>
                <p>Conste por el presente documento el contrato de trabajo a plazo fijo y sujeto a modalidad por 

                    Servicio Específico, conforme lo dispone el Art. 63 del T.U.O del D. Leg. 728, Ley de Productividad y 

                    Competitividad Laboral (D.S. Nº 003-97-TR), que celebran de una parte la <strong>UNIVERSIDAD PERUANA 

                        UNIÓN</strong>, con RUC Nº 20138122256, con domicilio en Villa Unión s/n, altura del Km. 19 de la carretera 

                    central, Ñaña, Lurigancho-Chosica, a quien se le denominará <strong>"EMPLEADOR"</strong>, representada por su 

                    Apoderado Mg. Julio Cesar Rengifo Peña, con DNI No. 06690086,; y de la otra parte <strong><%=p.getAp_paterno().toUpperCase() + " " + p.getNo_trabajador().toUpperCase() + " " + p.getAp_materno().toUpperCase()%></strong> , con DNI Nº(<strong><%=p.getNu_doc()%></strong>), domiciliado(a) en (<strong>
                                                    <%                InterfaceListaDAO l = new ListaDAO();
                                                        for (int b = 0; b < l.List_Dom_D1_Id().size(); b++) {
                                                            if (p.getLi_di_dom_a_d1().trim().equals(b + 1 + "")) {
                                                                out.println(l.List_Dom_D1_Id().get(b));
                                                            }

                                                        }

                                                        if (p.getLi_di_dom_a_d3().trim().equals("1")) {
                                                            out.println(" " + p.getDi_dom_a_d2() + " Numero");
                                                        }
                                                        if (p.getLi_di_dom_a_d3().trim().equals("2")) {
                                                            out.println(" " + p.getDi_dom_a_d2() + " Lote");
                                                        }
                                                        if (p.getLi_di_dom_a_d3().trim().equals("3")) {
                                                            out.println(" " + p.getDi_dom_a_d2() + " S/N");
                                                        }

                                                        for (int c = 0; c < l.List_Dom_D5_Id().size(); c++) {
                                                            if (p.getLi_di_dom_a_d5().trim().equals(c + 1 + "")) {
                                                                out.println(" " + p.getDi_dom_a_d4() + " " + l.List_Dom_D5_Id().get(c));
                                                            }

                                                        }
                                                        out.println(" " + p.getDi_dom_a_d6());

                                                    %></strong>),<%=p.getNo_ub_distrito()%><strong> </strong>, a quien se le denominará el (la) <strong>"TRABAJADOR(A)</strong>, en los términos y condiciones 

                    siguientes:</p>

                <p><strong>PRIMERA:</strong> EL EMPLEADOR tiene por actividad principal la educación en todos sus niveles.

                    El (la)TRABAJADOR (A) conoce que la Universidad Peruana Unión es parte integrante del sistema 

                    educativo Adventista, normado y regulada bajo prácticas, costumbres, principios éticos morales, por lo 

                    que acepta respetar, observar y cumplir estos principios practicados por esta institución, dentro y fuera 

                    del Campus Universitario.</p>

                <p><strong>SEGUNDA:</strong> El EMPLEADOR requiere de personal temporal en las áreas de la <strong><%=p.getNo_dep()%></strong>, con el objeto de diseñar detalladamente los requerimientos del sistema académico, 

                    programando nuevos módulos, reportes o actualizaciones de módulos, diseñar detalladamente los 

                    requerimientos de cada proyecto asignado, programando adecuadamente los módulos del sistema, 

                    apoyar en el mantenimiento de los recursos informáticos o brindar soporte técnico especializado a 

                    los equipos y sistemas solventando problemas o requerimientos de los usuarios; en consecuencia, el 

                    EMPLEADOR ha visto por conveniente contratar al TRABAJADOR (A), bajo la modalidad de servicio 

                    específico.

                <p><strong>TERCERA:</strong> EL EMPLEADOR de acuerdo con la condición expresada en la segunda cláusula, contrata al 

                    (la) TRABAJADOR (A) para que se desempeñe como <strong><%=p.getNo_puesto()%></strong>.</p> 

                <p><strong>CUARTA:</strong> EL EMPLEAOR en virtud del presente documento, contrata, al (la) TRABAJADOR (A) desde el 

                    <strong><%=p.getFe_desde()%></strong> hasta el <strong><%=p.getFe_hasta()%></strong>.</p>

                <p><strong>QUINTA:</strong> EL (la) TRABAJADOR (A) percibirá una remuneración mensual de S/ <strong><%=p.getCa_sueldo()%></strong>. 

                    (Nuevos Soles), como retribución por las labores realizadas en la jornada y horario laboral establecido por 

                    el EMPLEADOR, la que será de 48 horas semanales.<p>

                <p><strong>SEXTA:</strong> EL (la) TRABAJADOR (A) se obliga a prestar sus servicios con eficiencia, puntualidad y bajo 

                    principio de subordinación, cumplir con las directivas de sus jefes y de su Centro de Labor y con lo que 

                    dispone El Reglamento General Interno de Trabajo, Reglamento de Trabajo en Sobretiempo, Reglamento 

                    de Seguridad y Salud en el Trabajo, Recomendaciones sobre Seguridad y Salud en el Trabajo y demás 

                    políticas, que por su función le son entregados a la suscripción del presente contrato, caso contrario se 

                    resolverá el presente contrato conforme las normas laborales vigentes.</p>

                <p><strong>SÉPTIMA:</strong> EL (LA) TRABAJADOR (A) conoce y acepta que al término del plazo fijado en la cláusula 

                    CUARTA del presente contrato, éste quedará extinguido automáticamente sin obligación de aviso previo 

                    o comunicación alguna. EL EMPLEADOR sin perjuicio de lo indicado en las cláusulas anteriores, podrá 

                    dar por terminado el presente contrato si EL (la) TRABAJADOR (A) incurre en alguna de las causales de 

                    despido conforme a las leyes vigentes.</p>

                <p><strong>OCTAVA:</strong> EL (LA) TRABAJADOR (A), en cualquier momento, podrá dar por terminada la relación laboral 

                    en forma expresa, con la sola limitación de presentar su carta de renuncia con 30 días de anticipación.</p>

                <p><strong>NOVENA:</strong> En todo lo no previsto en el presente contrato se aplicará la Ley vigente de nuestro país.

                    Estando de acuerdo en todo el contenido del presente contrato, firmamos en señal de conformidad, en 

                    Ñaña, Chosica, Lima, al <strong><%=p.getFecha_actual()%></strong>.

                </p>
                <br>	
    </script>
<table id="letra" style="margin: 0;"><tr><td></td></tr></table>
 <div  ><table  style="width: 100%;  height: 50px; text-align:center; "id="asdglñhsdkgohk" ><tr><td align="center">______________________________<br><br>EMPLEADOR</td>
                        <td align="center">_______________________________<br><br>TRABAJADOR(A)</td></tr></table></div>

	
                                        </textarea>						
                                        <%
                                            }%>
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
        <script>
            $(document).ready(function () {
                $("#letra").click(function () {
                    alert("alknaklsdn");
                });

            });

        </script>
        <table id="letra" style="margin: 0;"><tr><td></td></tr></table>
        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
            if (!window.jQuery) {
                document.write('<script src="../../../js/libs/jquery-2.0.2.min.js"><\/script>');
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
        <script src="../../../js/plugin/ckeditor/ckeditor.js"></script>



        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!

            $(document).ready(function () {

                CKEDITOR.replace('ckeditor', {height: '380px', startupFocus: true});

            })

        </script>

    </body>

</html>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
