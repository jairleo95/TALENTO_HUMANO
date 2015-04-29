<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : Detalle
    Created on : 13/01/2015, 12:17:43 PM
    Author     : Alex
--%>

<%@page import="pe.edu.upeu.application.model.Tipo_Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="List_Tipo_Horario" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <style>
            table, th, td {
                border: 1px solid black;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link href="../../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <title>JSP Page</title>
    </head>

    <body>
        <div class="well">
            <form  class="smart-form" action="../../formato_horario">
                <div class="row">
                    <center><h1>Formato de <small> Horarios</small></h1></center><br>
                </div>
                <div class="row">
                    <section class="col col-xs-12">
                        <div class="row">
                            <section class="col col-xs-12">
                                <label class="label">Nombre del Formato</label>
                                <label class="input">
                                    <input name="NO_HORARIO"  size="40" required=""/> 
                                </label>  
                            </section>
                        </div>
                        <div class="row">
                            <section class="col col-xs-12">
                                <label class="label">Comentario</label>
                                <label class="textarea">
                                    <textarea name="DE_HORARIO" rows="4"></textarea>
                                </label>
                            </section>
                        </div>
                        <div class="row">
                            <section class="col col-xs-12">
                                <center>
                                    <input type="submit" class="btn btn-primary  btn-lg" value="Registrar">
                                </center>
                            </section>
                        </div>
                        <input type="hidden" name="ES_HORARIO" value="1" >
                        <input type="hidden" name="opc" value="registrar">
                        <input type="hidden" name="CA_HORAS" value="0">
                    </section>
                </div>
            </form>
        </div>
        <div class="well">
            <div class="row">
                <section class="col col-xs-12">
                    <div class="table-responsive">
                        <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%" >
                            <thead>
                                <tr>
                                    <th width="5%">Nro</th>
                                    <th>Nombre</th>
                                    <th width="40%">Observación</th>
                                    <th width="7%">Cant.Horas</th>
                                    <th width='10%'>Opción</th>
                                </tr>
                            </thead>
                            <%for (int i = 0; i < List_Tipo_Horario.size(); i++) {
                                    Tipo_Horario th = new Tipo_Horario();
                                    th = (Tipo_Horario) List_Tipo_Horario.get(i);
                                    ;%>
                            <tbody>
                            <td><center><%=i+1%></center></td>
                            <td><%=th.getNo_horario()%></td>
                            <% if (th.getDe_horario() == null) {%>
                            <td>Sin Datos</td>
                            <%} else {%>
                            <td><%=th.getDe_horario()%></td>
                            <%}%>
                            <td><%=th.getCa_horas()%></td>
                            <td><center>
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                        Acciones
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                        <%if (th.getCa_formato().equals("0")) {%>
                                        
                                        <li role="presentation"><a role="menuitem"  href="Reg_Formato_Horario.jsp?idth=<%=th.getId_tipo_horario()%>&nofor=<%=th.getNo_horario()%>">Establecer Horarios</a></li>
                                        <%} else {%>
                                        <li role="presentation"><a role="menuitem"  href="../../formato_horario?opc=LISTAR_FORMATO_HORARIO&idth=<%=th.getId_tipo_horario()%>&nofor=<%=th.getNo_horario()%>">Ver</a></li>
                                        <%}%>
                                    </ul>
                                </div>

                            </center> </td>

                            </tbody>
                            <%}%>
                        </table>
                    </div>
                </section>
            </div>

        </div>
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>
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
        <script src="../../js/app.config.js"></script>
        <script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 
        <script src="../../js/bootstrap/bootstrap.min.js"></script>
        <script src="../../js/notification/SmartNotification.min.js"></script>
        <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>
        <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>
        <script src="../../js/plugin/select2/select2.min.js"></script>
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
        <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>
        <script src="../../js/plugin/fastclick/fastclick.min.js"></script>
        <script src="../../js/demo.min.js"></script>
        <script src="../../js/app.min.js"></script>
        <script src="../../js/speech/voicecommand.min.js"></script>
        <script src="../../js/plugin/jquery-nestable/jquery.nestable.min.js"></script>
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#datatable_tabletools').DataTable();
            });
        </script>
    </body>
</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>