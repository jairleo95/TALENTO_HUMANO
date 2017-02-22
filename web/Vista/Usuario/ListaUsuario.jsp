<%-- 
    Document   : ListaUsuario
    Created on : 19/07/2015, 02:32:17 PM
    Author     : Andres
--%>

<%@page import="pe.edu.upeu.application.model.V_Var_Usuario"%>

<%@page import="pe.edu.upeu.application.model.V_List_Empleado"%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="Listar_Emp" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Usuario_var" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
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

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <title>Usuarios</title>
    </head>
    <body>
        <div class="row">
            <center>
                <h1>Mantenimiento a Usuarios de  Personal</h1>
                <hr>
            </center>
        </div>
        <!-- Button trigger modal -->
        <div class="row">
            <center>
                <a class="btn btn-primary btn-lg btn-block" style="width: 50%" data-toggle="modal" data-target="#myModalNuevo">
                    <span class="fa fa-user"></span>
                    <span>Nuevo Usuario</span>
                </a> 
            </center>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModalNuevo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Asignar nuevo Usuario</h4>
                    </div>
                    <form class="smart-form" action="../../Usuario">
                        <div class="modal-body">

                            <fieldset>
                                <section class="col col-md-12">
                                    <label class="label">Empleado:</label>
                                    <label class="select">
                                        <select class="form-control" name="IDEMPLEADO">
                                            <option value="">[Seleccione]</option>
                                            <%for (int i = 0; i < Listar_Emp.size(); i++) {
                                                    V_List_Empleado ve = new V_List_Empleado();
                                                    ve = (V_List_Empleado) Listar_Emp.get(i);
                                            %>
                                            <option value="<%=ve.getId_empleado()%>">
                                                <%=ve.getNo_trabajador()%>
                                                <%=ve.getAp_paterno()%>
                                                <%=ve.getAp_materno()%>
                                            </option>
                                            <%}%>
                                        </select>
                                        <i></i> </label>
                                </section>
                            </fieldset>
                            <fieldset>
                                <section class="col col-md-12">
                                    <label class="label">Rol:</label>
                                    <label class="select">
                                        <select class="form-control selectRol" name="IDROLES" >
                                            <option value="">[Seleccione]</option>

                                        </select>
                                        <i></i> 
                                    </label>
                                </section>
                            </fieldset>
                            <fieldset>

                                <section class="col col-md-6">
                                    <label class="label">Usuario:</label>
                                    <label class="input">
                                        <input type="text" required="" name="USUARIO"  >
                                        <i></i> </label>                                
                                </section>
                                <section class="col col-md-6">
                                    <label class="label">Clave:</label>
                                    <label class="input">
                                        <input type="password"  required="" name="CLAVE" > 
                                        <i></i> </label>
                                </section>
                            </fieldset>

                        </div>
                        <div class="modal-footer">
                            <footer>
                                <input type="hidden" name="opc" value="Registrar Usuario">
                                <button type="submit" class="btn btn-primary" >Registar</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </footer>

                        </div>
                    </form>               
                </div>
            </div>
        </div>
        <div class="row">
            <div class="well-lg">
                <div class=" col col-md-12">
                    <table class="table table-striped table-bordered table-hover tTabla" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombres y Apellidos</th>
                                <th>Rol</th>
                                <th>Puesto</th>
                                <th>Seccion</th>
                                <th>Area</th>
                                <th>Departamento</th>
                                <th>Usuario</th>
                                <th>Clave</th>
                                <th style="width:  10%;">Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (int i = 0; i < List_Usuario_var.size(); i++) {
                                    V_Var_Usuario v = new V_Var_Usuario();
                                    v = (V_Var_Usuario) List_Usuario_var.get(i);
                            %>
                            <tr>
                                <td>
                                    <input id="idTrabajador<%=i + 1%>" type="hidden" name="idTrabajador" value="<%=v.getId_trabajador()%>">
                                    <input id="idUsuario<%=i + 1%>" type="hidden" name="idUsuario" value="<%=v.getId_usuario()%>">
                                    <%=i + 1%>
                                </td>
                                <%--<!--<td>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                            Accion <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a class="modificar" href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Mod_Usuario_con"  >Editar</a></li>                                                                
                                            <li><a class="eliminar" id="<%=i%>">Eliminar<input class="btnId<%=i%>" type="hidden" value="<%=v.getId_usuario()%>"></a></li>
                                        </ul>
                                    </div>
                                </td>-->--%>
                                <td class="name"><a href="../../trabajador?idtr=<%=v.getId_trabajador()%>&opc=list"><%=v.getNo_trabajador() + " " + v.getAp_paterno() + " " + v.getAp_materno()%></a></td>
                                <td><%=v.getNo_rol()%></td>
                                <td><%=v.getNo_puesto()%></td>
                                <td><%=v.getNo_seccion()%></td>
                                <td><%=v.getNo_area()%></td>
                                <td><%=v.getNo_dep()%></td>
                                <td><%=v.getNo_usuario()%></td>
                                <td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Modificar_clave_1"><%=v.getPw_usuario()%> </a></td>
                                <td id="<%=i + 1%>">
                                    <% if (v.getEs_usuario().equals("1")) {
                                    %>
                                    <button class="desactivar btn btn-warning" id="<%=i%>">Desactivar</button>
                                    <%} else if (v.getEs_usuario().equals("0")) {%>
                                    <button class="activar btn btn-success" id="<%=i%>">Activar</button>
                                    <%}%>
                                    <button class="btn btn-primary verDetalle"  ><i class="fa fa-info"></i></button>
                                </td>
                            </tr>
                            <%}%> 
                        </tbody>
                    </table> 
                </div>
            </div>
            <div class="modal fade" id="myModalDetalle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Detalle</h4>
                        </div>
                        <form class="smart-form" action="../../Usuario">
                            <div class="modal-body">
                                <fieldset>
                                    <div class="col col-md-12">
                                        <label>Nombres y Apellidos</label>
                                        <label class="lbNombres"></label>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <div class="col col-md-12">
                                        <label>Puesto</label>
                                        <label class="lbPuesto"></label>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="modal-footer">
                                <footer>
                                    <input type="hidden" name="opc" value="Registrar Usuario">
                                    <button type="submit" class="btn btn-primary" >Aceptar</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                </footer>

                            </div>
                        </form>               
                    </div>
                </div>
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

        <!-- EASY PIE CHARTS 
        <script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>-->

        <!-- SPARKLINES -->
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>


        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="../../js/plugin/fastclick/fastclick.min.js"></script>

        <!-- Demo purpose only
        <script src="js/demo.min.js"></script> -->

        <!-- MAIN APP JS FILE -->
        <script src="../../js/app.min.js"></script>
        <!--Business Logic -->
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script src="../../js/Js_Formulario/Js_Form.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var num = 0;
                list_selectJavaBeans($(".selectRol"), "../../CRoles", "opc=Listar_Rol","id_rol","no_rol");
                $('.tTabla').dataTable({
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
                                "sTitle": "Empleados_PDF",
                                "sPdfMessage": "Empleados PDF Export",
                                "sPdfSize": "letter"
                            },
                            {
                                "sExtends": "print",
                                "sMessage": "Generado por AlfaTeam <i>(presiona Esc para cerrar)</i>"
                            }
                        ],
                        "sSwfPath": "../../js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
                    },
                    "autoWidth": true
                });
                /*$('.tTabla').on('click', 'tr', function () {
                 alert($(this).children('.identif').text());
                 $('#myModalDetalle').modal()
                 
                 });;*/
                $('.verDetalle').click(function () {
                    num = $(this).parent().attr('id');
                    $('.lbNombres').text($('#idTrabajador' + num).val());
                    $('#myModalDetalle').modal();
                });

            });

        </script>


    </body>
</html>
