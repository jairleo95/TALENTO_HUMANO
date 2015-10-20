<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="Listar_Rol_id" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

        <!-- #FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- #GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
    </head>
    <body>
        <header>
            <div class="page-header">
                <h1 class="page-title text-center">Modificar Roles</h1>
            </div>
        </header>
        <div class="well">
            <form class="smart-form formm">
                <%for (int i = 0; i < Listar_Rol_id.size(); i++) {
                        Rol r = new Rol();
                        r = (Rol) Listar_Rol_id.get(i);
                %>
                <div class="row">
                    <section class="col col-xs-6">
                        <label class="label">Nombre</label>
                        <label class="input">
                            <input type="text" name="Nombre_Rol" class="form-control" value="<%=r.getNo_rol()%>" >
                        </label>
                    </section>
                    <section class="col col-xs-4">
                        <label class="label">Estado</label>
                        <label class="select">
                            <select name="Es_rol"  required="">
                                <%if (r.getEs_rol().equals("1")) {%>
                                <option  value="1" selected="">Activado</option>
                                <option value="0">Desactivado</option>
                                <%} else if (r.getEs_rol().trim().equals("0")) {%>
                                <option value="1">Activado</option>
                                <option value="0" selected="">Desactivado</option>
                                <%}%>
                            </select>
                            <i></i></label>
                    </section>
                    <section class="col col-xs-2">
                        <input type="button" name="opc"value="Modificar" style="height: 31px;margin-top: 25px;" class="btnmod btn btn-primary btn-block">
                    </section>
                    <input type="hidden" name="id_rol" value="<%=r.getId_rol()%>">
                </div>
                <%}%>
            </form>
            <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>
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
            <script src="../../../js/app.config.js"></script>
            <script src="../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 
            <script src="../../../js/bootstrap/bootstrap.min.js"></script>
            <script src="../../../js/notification/SmartNotification.min.js"></script>
            <script src="../../../js/smartwidgets/jarvis.widget.min.js"></script>
            <script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
            <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>
            <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>
            <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>
            <script src="../../../js/plugin/select2/select2.min.js"></script>
            <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
            <script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>
            <script src="../../../js/plugin/fastclick/fastclick.min.js"></script>
            <script src="../../../js/demo.min.js"></script>
            <script src="../../../js/app.min.js"></script>
            <script src="../../../js/speech/voicecommand.min.js"></script>
            <script src="../../../js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
            <script src="../../../js/plugin/fuelux/wizard/wizard.min.js"></script>
            <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>
            <script src="../../../js/plugin/jquery-nestable/jquery.nestable.min.js"></script>
            <script src="../../../js/plugin/datatables/jquery.dataTables.min.js"></script>
            <script src="../../../js/plugin/datatables/dataTables.colVis.min.js"></script>
            <script src="../../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
            <script src="../../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
            <script src="../../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('.btnmod').click(function () {
                        var data = $('.formm').serialize();
                        $.post("../../../Roles?opc=Modificar", data, function () {
                            alert(data);
                        });
                    });
                });
            </script>
    </body>
</html>
<%@include file="List_Roles.jsp" %>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>