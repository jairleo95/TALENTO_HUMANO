<%@page import="pe.edu.upeu.application.util.DateFormat"%>
<%@page import="pe.edu.upeu.application.model.Tipo_Documento"%>
<%@page import="pe.edu.upeu.application.dao.Tipo_DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceTipo_DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.model.Datos_Hijo_Trabajador"%>
<jsp:useBean id="LISTA_HIJO" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

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

    </head>
    <body>
        <%
            HttpSession sesion2 = request.getSession(true);
            String rol1 = (String) sesion2.getAttribute("IDROL");
        %>





        <!-- widget div-->
        <div>

            <!-- widget edit box -->
            <div class="jarviswidget-editbox">
                <!-- This area used as dropdown edit box -->

            </div>
            <!-- end widget edit box -->

            <!-- widget content -->
            <div class="widget-body no-padding">

                <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%" style="margin-left:0.5%;" >
                    <thead>
                        <tr>
                            <th data-hide="phone">Nro</th>
                            <th data-class="expand">Apellidos y Nombres</th>
                            <th data-hide="phone">Fecha de nacimiento</th>
                            <th data-hide="phone">Sexo</th>
                            <th data-hide="phone,tablet">Tipo de Documento</th>
                            <th data-hide="phone,tablet">Nro Documento</th>
                            <th data-hide="phone,tablet">Essalud</th>
                            <th data-hide="phone,tablet">Est.Nivel Superior</th>
                            <th data-hide="phone,tablet" colspan="2">Opciones</th>
                        </tr>

                    </thead>
                    <tbody>
                        <%
                            InterfaceTipo_DocumentoDAO itd = new Tipo_DocumentoDAO();
                            for (int i = 0; i < LISTA_HIJO.size(); i++) {
                                Datos_Hijo_Trabajador h = new Datos_Hijo_Trabajador();
                                h = (Datos_Hijo_Trabajador) LISTA_HIJO.get(i);
                                if (h.getEs_datos_hijo_trabajador().trim().equals("1")) {
                        %>
                        <tr>
                            <td><%out.print(i + 1);%></td>
                            <td><%=h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador()%></td>
                            <td><%=DateFormat.toFormat5(h.getFe_nacimiento())%></td>
                            <td>
                                <%
                                    if (h.getEs_sexo().trim().equals("M")) {
                                        out.println("Masculino");
                                    }
                                    if (h.getEs_sexo().trim().equals("F")) {
                                        out.println("Femenino");
                                    }
                                %>
                            </td>
                            <td>
                                <%
                                    for (int j = 0; j < itd.Listar_tipo_doc().size(); j++) {
                                        Tipo_Documento td = new Tipo_Documento();
                                        td = (Tipo_Documento) itd.Listar_tipo_doc().get(j);
                                        if (h.getEs_tipo_doc().trim().equals(td.getId_tipo_doc_ident().trim())) {
                                            out.print(td.getDe_tdoc_abreviada());
                                        }
                                    }

                                %>
                            </td>
                            <td><%=h.getNu_doc()%></td>


                            <td>
                                <%
                                    if (h.getEs_inscripcion_vig_essalud().trim().equals("1")) {
                                        out.println("Si");
                                    }
                                    if (h.getEs_inscripcion_vig_essalud().trim().equals("0")) {
                                        out.println("No");
                                    }
                                %>
                            </td>
                            <td>
                                <%if (h.getEs_estudio_niv_superior() != null) {
                                        if (h.getEs_estudio_niv_superior().trim().equals("1")) {
                                            out.println("Si");
                                        }
                                        if (h.getEs_estudio_niv_superior().trim().equals("0")) {
                                            out.println("No");
                                        }
                                    } else {
                                        out.print("No");
                                    }
                                %>
                            </td>
                            <td> 

                                <% if (rol1.trim().equals("ROL-0002") | rol1.trim().equals("ROL-0005") | rol1.trim().equals("ROL-0001") | rol1.trim().equals("ROL-0013")) {%>

                                <a href="../../../familiar?idhijo=<%=h.getId_datos_hijos_trabajador()%>&idtr=<%=h.getId_trabajador()%>&opc=modificar" >
                                    <img src="../../../img/lapiz.png" alt="" width="25px" height="25px"/></a>

                            </td>
                            <td>
                    
                        <a href="../../../familiar?idhijo=<%=h.getId_datos_hijos_trabajador()%>&idtr=<%=h.getId_trabajador()%>&opc=eliminar"
                           class="eliminar" >
                            <img src="../../../img/eliminar.png" alt=""   width="25px" height="25px"/></a>
                   
                    <%}%>
                    </tr>
                     <input type="hidden" class="idhijo" value="<%=h.getId_datos_hijos_trabajador()%>">
                    <input type="hidden" class="idtr" value="<%=h.getId_trabajador()%>">
                        <% }
                            }
                        %>
                    

                    </tbody>
                </table>
                   

            </div>
            <!-- end widget content -->

        </div>
        <!-- end widget div -->








        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>-->

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


        <script type="text/javascript">
            $(document).ready(function() {

                pageSetUp();
               
                /* TABLETOOLS */
                $('#datatable_tabletools').dataTable({
                    // Tabletools options: 
                    //   https://datatables.net/extensions/tabletools/button_options
                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'T>r>" +
                            "t" +
                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
                    "oTableTools": {
                        "aButtons": [
                            "copy",
                            "csv",
                            "xls",
                            {
                                "sExtends": "pdf",
                                "sTitle": "Requerimientos_PDF",
                                "sPdfMessage": "Requeriemintos PDF Export",
                                "sPdfSize": "letter"
                            },
                            {
                                "sExtends": "print",
                                "sMessage": "Generado por AlfaTeam <i>(presiona Esc para cerrar)</i>"
                            }
                        ],
                        "sSwfPath": "../../js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
                    },
                    "autoWidth": true,
                    "preDrawCallback": function() {
                        // Initialize the responsive datatables helper once.
                        if (!responsiveHelper_datatable_tabletools) {
                            responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper($('#datatable_tabletools'), breakpointDefinition);
                        }
                    },
                    "rowCallback": function(nRow) {
                        responsiveHelper_datatable_tabletools.createExpandIcon(nRow);
                    },
                    "drawCallback": function(oSettings) {
                        responsiveHelper_datatable_tabletools.respond();
                    }
                });

                /* END TABLETOOLS */
            })
        </script>
    </body>
</html>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>