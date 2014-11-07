

<%@page import="pe.edu.upeu.application.model.Auto_Mostrar"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<jsp:useBean id="ListaridTrabajador" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Auto_mostrar" scope="application" class="java.util.ArrayList"/>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <script type="text/javascript" src="../../js/JQuery/jquery.autoheight.js"></script>
        <title>Detalle de Trabajador</title>
        <script type="text/javascript" src="../../js/Js_Alerta/alertify.js"></script>
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.core.css" />
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.default.css" />
        <script type="text/javascript"  src="../../js/Js_Alerta/Alertas.js"></script>

        <link rel="stylesheet" type="text/css" href="../../css/Css_Menu_Desplegable/default.css" />
        <link rel="stylesheet" type="text/css" href="../../css/Css_Menu_Desplegable/component.css" />
        <script src="../../js/modernizr.custom.js"></script>

        <!-- Estilos plantilla-->
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

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <style type="text/css">
            body{

                margin-left: auto;
                margin-right: auto  ;
                width: 70%;
                // margin: 0;
            }
            .titulo{

                border-radius: 10px;
                background-color:#0c9ba0 ;
                width: 100%;
                padding: 0.5%;
                margin-top: 0.5%;
                font-family: arial;
                font-size: 130%;
                text-align: center;
                color: white;

            }
            .autoHeight{
                border-style:none;            
            }

            .td{
                font-weight: bold;
                text-align: right;
            }
            .info-det{
                margin: 5%;
            }

            .table-det{
                position: static;
            }
            .submit{
                //position: relative;

                background-color: #0575f4;
                color: white;
                width: 100%;

            }
            .submit:hover{
                background-color: #643771;
            }

        </style>
        <script type="text/javascript">
            $(document).ready(
                    function() {
                        $(".item-m").click(
                                function() {
                                    $("#titulo-c").text($(this).text());
                                }
                        );
                    }
            );

        </script>
    </head>

    <%if (request.getParameter("a") != null) {
            if (request.getParameter("a").equals("t")) {
    %>

    <body onload="alerta_dt_ingresados()">

        <%
            }
        } else {
        %>
    <body >
        <%}%>
        <%

            V_Ficha_Trab_Num_C t = new V_Ficha_Trab_Num_C();
            t = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(0);

            String idtr = t.getId_trabajador().trim();
            String aut = request.getParameter("aut");
            HttpSession sesion = request.getSession(true);
            String idp = (String) sesion.getAttribute("p");
            String iddgp = request.getParameter("dgp");
            String cod = request.getParameter("c");
            String iddrp = request.getParameter("drp");
            String id_pasos = request.getParameter("pas");
            String nropaso = request.getParameter("np");
//if ($_REQUEST["CR"]=1){ %>
        <script type="text/javascript">
            // alerta_dt_ingresados();
        </script>
        <%//}%>
        <div class="container demo-2">	
            <!--<div class="main clearfix">-->
            <div class="main ">
                <div class="column ">
                    <div id="dl-menu" class="dl-menuwrapper">
                        <button class="dl-trigger">Open Menu</button>
                        <ul class="dl-menu">
                            <li class="active"><a  class="item-m" href="Datos_Generales.jsp?idtr=<?echo $idtr;?>" target="contenido">Información General  </a></li>
                            <li><a class="item-m" href="Aspecto_Academico.jsp?idtr=<?echo $idtr;?>" target="contenido">Aspecto Academico</a></li>
                            <li><a class="item-m" href="Aspecto_Social.jsp?idtr=<?echo $idtr;?>" target="contenido" >Aspecto Social</a></li>
                            <li><a class="item-m" href="../../familiar?idtr=<%=idtr%>&opc=Detalle_Familiar" target="contenido" >Familiares</a></li>
                            <li><a class="item-m" href="../../dgp?idtr=<%=idtr%>&opc=List_Dgp_Tr" target="contenido">Requerimientos</a></li>
                            <li><a class="item-m" href="../../trabajador?idtr=<%=idtr%>&opc=Documento_Trabajador" target="contenido">Documentos</a></li>
                            <li><a class="item-m" href="../../contrato?idtr=<%=idtr%>&opc=Detalle_Contractual" target="contenido">Informacion Contractual</a></li>
                        </ul>
                    </div><!-- /dl-menuwrapper -->
                </div>
            </div>
        </div>

        <!--Begin Detalle Trabajador-->
        <div   class="titulo">Detalle del Trabajador</div> 
        <table  style="background-color: white" class="table-det">


            <%

                if (t.getNo_ar_foto() == null) {
            %>
            <tr><td><img src="../../imagenes/avatar_default.jpg"  width="100"  height="100"></td>
            <a href="../Usuario/Subir_Foto.jsp?idtr=<%=idtr%>">Subir imagen</a>
            <%
            } else {%>
            <tr><td><img src="../Usuario/Fotos/<%=t.getAr_foto()%>"  width="100"  height="100"></td>
                    <%}%>
                <td>
                    <div >
                        <table class="info-det">
                            <%
                                for (int index = 0; index < ListaridTrabajador.size(); index++) {
                                    V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                                    trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);

                            %>

                            <tr><td class="td">Nombre :</td><td><%=trb.getNo_trabajador().toUpperCase()%></td></tr>
                            <tr><td class="td">Apellido Paterno :</td><td><%=trb.getAp_paterno().toUpperCase()%></td></tr>
                            <tr><td class="td">Apellido Materno :</td><td><%=trb.getAp_materno().toUpperCase()%></td></tr>
                            <tr><td class="td">Fecha de Nacimiento :</td><td><%=trb.getFe_nac()%></td></tr>

                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <!--End Detalle Trabajador-->

        <!-- Begin TABS-->
        <div  style="border:3px solid red;" class="jarviswidget well" id="wid-id-3" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false" data-widget-custombutton="false" data-widget-sortable="false">
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
                <span class="widget-icon"> <i class="fa fa-comments"></i> </span>
                <h2>Default Tabs with border </h2>

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


                    <hr class="simple">
                    <ul id="myTab1" class="nav nav-tabs bordered">
                        <li >
                            <a href="#s1" data-toggle="tab">Información General <span class="badge bg-color-blue txt-color-white">Alex</span></a>
                        </li>
                        <li>
                            <a href="#s2" data-toggle="tab"><i class="fa fa-fw fa-lg fa-gear"></i> Aspecto Académico</a>
                        </li>
                        <li >
                            <a href="#s3" data-toggle="tab">Aspecto Social <span class="badge bg-color-blue txt-color-white">Alex</span></a>
                        </li>
                        <li >
                            <a href="#s4" data-toggle="tab">Familiares </a>
                        </li>
                        <li >
                            <a href="#s5" data-toggle="tab">Requerimientos </a>
                        </li>
                        <li >
                            <a href="#s6" data-toggle="tab">Documentación </a>
                        </li>
                        <li >
                            <a href="#s7" data-toggle="tab">Información Contractual </a>
                        </li>
                    </ul>

                    <div id="myTabContent1" class="tab-content padding-10">
                        <div class="tab-pane fade in active" id="s1">
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="Datos_Generales.jsp" width="100%" height="100%" ></iframe>
                        </div>
                        <div class="tab-pane fade" id="s2">                           
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="Aspecto_Academico.jsp" width="100%" height="100%" ></iframe>                           
                        </div>
                        <div class="tab-pane fade" id="s3">                            
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="Aspecto_Social.jsp" width="100%" height="100%" ></iframe>                           
                        </div>
                        <div class="tab-pane fade" id="s4">                            
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="Familiar/Detalle_Familiar.jsp" width="100%" height="100%" ></iframe>
                        </div>
                        <div class="tab-pane fade" id="s5">                            
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="../Trabajador/List_Dgp_Trabajador.jsp" width="100%" height="100%" ></iframe>
                        </div>
                        <div class="tab-pane fade" id="s6">                            
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="../Trabajador/List_Doc_Trabajador.jsp" width="100%" height="100%" ></iframe>
                        </div>
                        <div class="tab-pane fade" id="s7">                            
                            <iframe name="contenido" id="contenido"  class="autoHeight" src="../Contrato/Detalle_Info_Contractual.jsp" width="100%" height="100%" ></iframe>
                        </div>
                    </div>

                </div>
                <!-- end widget content -->

            </div>
            <!-- end widget div -->

        </div>        
        <!-- end TABS-->


        <div class="container theme-showcase" style="border: 3px solid red">


            <!-- begin detalle trajador-->
           
            <!-- end detalle trajador-->

            <div  class="titulo" id="titulo-c">Información General</div> 

            <%
                if (List_Auto_mostrar.size() == 1 & iddgp != null) {
                    for (int r = 0; r < List_Auto_mostrar.size(); r++) {
                        Auto_Mostrar a = new Auto_Mostrar();
                        a = (Auto_Mostrar) List_Auto_mostrar.get(r);
            %>

            <iframe name="contenido" id="contenido"  class="autoHeight" src="<%=a.getDi_url() + "&iddgp=" + iddgp + "&idtr=" + trb.getIdtr()%>" width="100%" height="100%" ></iframe>
            <% }
            } else { %>
            <iframe name="contenido" id="contenido"  class="autoHeight" src="Datos_Generales.jsp" width="100%" height="100%" ></iframe>
            <%}%>
        </div> 
        <div style="border: 3px solid red">
            <%

                if (aut != null) {
                    if (aut.equals("1")) {


            %>
            <center>
                <form class="form" action="../../autorizacion" method="post" > 
                    <table > 

                        <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >           
                        <input type="hidden" name="NROPASO" value="<%=nropaso%>"  >                
                        <input type="hidden" name="COD" value="<%=cod%>"  >               
                        <input type="hidden" name="PUESTO_ID" value="<%=idp%>" >  
                        <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>"  >  
                        <input type="hidden" name="IDPASOS" value="<%=id_pasos%>"   >
                        <tr><td><input type="submit" name="opc"  class="submit" value="Aceptar"/></td></tr>
                    </table>
                </form>
                <form action="../../autorizacion" method="post">
                    <table>



                        <input type="hidden" name="IDDETALLE_DGP"  value="<%=iddgp%>"  >           
                        <input type="hidden" name="NROPASO" value="<%=nropaso%>"  >                
                        <input type="hidden" name="COD" value="<%=cod%>"  >               
                        <input type="hidden" name="PUESTO_ID" value="<%=idp%>" >  
                        <input type="hidden" name="IDDETALLE_REQ_PROCESO" value="<%=iddrp%>"  >  
                        <input type="hidden" name="IDPASOS" value="<%=id_pasos%>" 
                               <tr><td><input type="submit" name="opc"  class="submit" value="Rechazar"/></td></tr>
                    </table>
                </form>   
            </center>
            <%}
                }%>
        </div>
        <script src="../../js/JQuery/jQuery.js"></script>
        <script src="../../js/Js_dlmenu/jquery.dlmenu.js"></script>
        <script>
            $(function() {
                $('#dl-menu').dlmenu({
                    animationClasses: {classin: 'dl-animate-in-2', classout: 'dl-animate-out-2'}
                });
            });
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
        <script src="../../HTML_version/js/plugin/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!

            $(document).ready(function() {

                pageSetUp();

                /*
                 * Autostart Carousel
                 */
                $('.carousel.slide').carousel({
                    interval: 3000,
                    cycle: true
                });
                $('.carousel.fade').carousel({
                    interval: 3000,
                    cycle: true
                });

                // Fill all progress bars with animation

                $('.progress-bar').progressbar({
                    display_text: 'fill'
                });


                /*
                 * Smart Notifications
                 */
                $('#eg1').click(function(e) {

                    $.bigBox({
                        title: "Big Information box",
                        content: "This message will dissapear in 6 seconds!",
                        color: "#C46A69",
                        //timeout: 6000,
                        icon: "fa fa-warning shake animated",
                        number: "1",
                        timeout: 6000
                    });

                    e.preventDefault();

                })

                $('#eg2').click(function(e) {

                    $.bigBox({
                        title: "Big Information box",
                        content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#3276B1",
                        //timeout: 8000,
                        icon: "fa fa-bell swing animated",
                        number: "2"
                    });

                    e.preventDefault();
                })

                $('#eg3').click(function(e) {

                    $.bigBox({
                        title: "Shield is up and running!",
                        content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#C79121",
                        //timeout: 8000,
                        icon: "fa fa-shield fadeInLeft animated",
                        number: "3"
                    });

                    e.preventDefault();

                })

                $('#eg4').click(function(e) {

                    $.bigBox({
                        title: "Success Message Example",
                        content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#739E73",
                        //timeout: 8000,
                        icon: "fa fa-check",
                        number: "4"
                    }, function() {
                        closedthis();
                    });

                    e.preventDefault();

                })



                $('#eg5').click(function() {

                    $.smallBox({
                        title: "Ding Dong!",
                        content: "Someone's at the door...shall one get it sir? <p class='text-align-right'><a href='javascript:void(0);' class='btn btn-primary btn-sm'>Yes</a> <a href='javascript:void(0);' class='btn btn-danger btn-sm'>No</a></p>",
                        color: "#296191",
                        //timeout: 8000,
                        icon: "fa fa-bell swing animated"
                    });

                });



                $('#eg6').click(function() {

                    $.smallBox({
                        title: "Big Information box",
                        content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        color: "#5384AF",
                        //timeout: 8000,
                        icon: "fa fa-bell"
                    });

                })

                $('#eg7').click(function() {

                    $.smallBox({
                        title: "James Simmons liked your comment",
                        content: "<i class='fa fa-clock-o'></i> <i>2 seconds ago...</i>",
                        color: "#296191",
                        iconSmall: "fa fa-thumbs-up bounce animated",
                        timeout: 4000
                    });

                })

                function closedthis() {
                    $.smallBox({
                        title: "Great! You just closed that last alert!",
                        content: "This message will be gone in 5 seconds!",
                        color: "#739E73",
                        iconSmall: "fa fa-cloud",
                        timeout: 5000
                    });
                }

                /*
                 * SmartAlerts
                 */
                // With Callback
                $("#smart-mod-eg1").click(function(e) {
                    $.SmartMessageBox({
                        title: "Smart Alert!",
                        content: "This is a confirmation box. Can be programmed for button callback",
                        buttons: '[No][Yes]'
                    }, function(ButtonPressed) {
                        if (ButtonPressed === "Yes") {

                            $.smallBox({
                                title: "Callback function",
                                content: "<i class='fa fa-clock-o'></i> <i>You pressed Yes...</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 4000
                            });
                        }
                        if (ButtonPressed === "No") {
                            $.smallBox({
                                title: "Callback function",
                                content: "<i class='fa fa-clock-o'></i> <i>You pressed No...</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 4000
                            });
                        }

                    });
                    e.preventDefault();
                })
                // With Input
                $("#smart-mod-eg2").click(function(e) {

                    $.SmartMessageBox({
                        title: "Smart Alert: Input",
                        content: "Please enter your user name",
                        buttons: "[Accept]",
                        input: "text",
                        placeholder: "Enter your user name"
                    }, function(ButtonPress, Value) {
                        alert(ButtonPress + " " + Value);
                    });

                    e.preventDefault();
                })
                // With Buttons
                $("#smart-mod-eg3").click(function(e) {

                    $.SmartMessageBox({
                        title: "Smart Notification: Buttons",
                        content: "Lots of buttons to go...",
                        buttons: '[Need?][You][Do][Buttons][Many][How]'
                    });

                    e.preventDefault();
                })
                // With Select
                $("#smart-mod-eg4").click(function(e) {

                    $.SmartMessageBox({
                        title: "Smart Alert: Select",
                        content: "You can even create a group of options.",
                        buttons: "[Done]",
                        input: "select",
                        options: "[Costa Rica][United States][Autralia][Spain]"
                    }, function(ButtonPress, Value) {
                        alert(ButtonPress + " " + Value);
                    });

                    e.preventDefault();
                });

                // With Login
                $("#smart-mod-eg5").click(function(e) {

                    $.SmartMessageBox({
                        title: "Login form",
                        content: "Please enter your user name",
                        buttons: "[Cancel][Accept]",
                        input: "text",
                        placeholder: "Enter your user name"
                    }, function(ButtonPress, Value) {
                        if (ButtonPress == "Cancel") {
                            alert("Why did you cancel that? :(");
                            return 0;
                        }

                        Value1 = Value.toUpperCase();
                        ValueOriginal = Value;
                        $.SmartMessageBox({
                            title: "Hey! <strong>" + Value1 + ",</strong>",
                            content: "And now please provide your password:",
                            buttons: "[Login]",
                            input: "password",
                            placeholder: "Password"
                        }, function(ButtonPress, Value) {
                            alert("Username: " + ValueOriginal + " and your password is: " + Value);
                        });
                    });

                    e.preventDefault();
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
        <%}%>
    </body>
</html>
