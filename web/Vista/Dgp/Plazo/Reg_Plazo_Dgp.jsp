<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%-- 
Document   : Reg_Plazo_Dgp
Created on : 08-nov-2014, 15:58:07
Author     : JAIR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Plazo</title>
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">

        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

    </head>
    <body> 
    <center>
        <div class="row">
            <h1>Mantenimiento de Plazos de Requerimientos</h1>
            <form   id="form-plazo" class="form_plazo smart-form">
                <table>
                    <tr><td>Tipo de Plazo</td><td><select name="tipo" class="tipo" required="">
                                <option value='1' selected="">Ingreso a planilla</option>
                                <option value='2'>Inicio de Contrato</option>
                            </select></td></tr>
                    <tr><td>Nombre Plazo :<td><input type="text" name="nombre_plazo" required="" class="nombre_plazo" /></td></tr>
                    <tr><td>Descripción :<td><textarea name="descripcion" required="" class="descripcion"></textarea></td></tr>
                    <tr class="tr_tolerancia" style="display: none"><td>Dias de tolerancia (Inicio de contrato):<td><input type="number" name="tolerancia" min="1" required="" value="0" class="tolerancia"/></td></tr>
                    <tr class="tr_dep_tolerancia" style="display:none"><td>Departamento tolerancia (Inicio de contrato):<td><input type="text" name="dep_tolerancia" required="" value="0" class="dep_tolerancia"/></td></tr>
                    <tr><td>Tipo planilla :<td>
                            <select name="planilla" class="planilla" required="">
                                <option value="">[Seleccione]</option>
                            </select>
                        </td></tr>
                    <tr><td>Requerimiento :<td>
                            <select name="id_req" class="req"  required="">
                                <option value="">[Seleccione]</option>
                            </select>
                        </td></tr>
                    <tr><td>Desde :<td><input type="date"  readonly="" name="desde" required="" class="desde"/></td></tr>
                    <tr><td>Hasta :<td><input type="date" readonly="" name="hasta" required="" class="hasta"/></td></tr>
                    <input type="hidden" name="opc" value="Registrar"  class="opc"/>
                    <tr><td><button type="button"  id="btn-registrar" class="btn btn-primary btn-registrar">Registrar</button></td></tr>
                </table>
            </form>
        </div>
        <table class="table table-hover table-striped  table-responsive">
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Nombre Plazo</td>
                    <td>Descripción</td>
                    <td>Desde</td>
                    <td>Hasta</td>
                    <td>Tipo de Planilla</td>
                    <td>Requerimiento</td>
                    <td>Editar</td>
                </tr>
            </thead>
            <tbody  class="tbodys" >
            </tbody>
        </table>
    </center>
</body>

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


<script src="../../../js/demo.min.js"></script>

<!-- MAIN APP JS FILE -->
<script src="../../../js/app.min.js"></script>

<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
<!-- Voice command : plugin -->
<script src="../../../js/speech/voicecommand.min.js"></script>

<script src="../../../js/Js_Formulario/Js_Form.js" type="text/javascript"></script>


<script>
    function validar_fechas() {
        var data = "tipo=" + $(".tipo").val() + "&req=" + $(".req").val() + "&dias=" + $(".tolerancia").val() + "&dep=" + $(".dep_tolerancia").val();
        $.post("../../../plazo_dgp", "opc=fecha_habilitada&" + data, function (objJson) {
            var fecha = objJson.fecha;
            $(".desde").attr("min", fecha);
            if ($(".desde").val() == "") {
                $(".desde").val(fecha);
            } else {

            }
            $(".desde").removeAttr("readonly");
            $(".hasta").attr("min", fecha);
            $(".hasta").removeAttr("readonly");
        });
    }
    function listar() {
        var b = $(".tbodys");
        b.empty();
        b.append("<tr><td colspan='9'>Cargando...</td></tr>");
        $.post("../../../plazo_dgp", "opc=Listar_Plazo&" + $(".form_plazo").serialize(), function (objJson) {
            b.empty();
            var lista = objJson.lista;
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            for (var i = 0; i < lista.length; i++) {
                b.append("<tr>");
                b.append("<td class='id" + i + "'>" + lista[i].id + "</td>");
                b.append("<td class='nombre" + i + "'>" + lista[i].nom + "</td>");
                b.append("<td class='det" + i + "'>" + lista[i].det + "</td>");
                b.append("<td class='desde" + i + "'>" + lista[i].desde + "</td>");
                b.append("<td class='hasta" + i + "'>" + lista[i].hasta + "</td>");
                b.append("<td class='planilla" + i + "'>" + lista[i].planilla + "</td>");
                b.append("<td >" + lista[i].req + "</td>");
                b.append("<input type='hidden' value='" + lista[i].id_req + "'/>");
                b.append("<td><button value='" + i + "' class='Editar-Plazo'>Modificar</button><button value='" + i + "' class='Eliminar-Plazo' value='" + i + "'>Eliminar</button></td>");
                b.append("</tr>");
            }
            $(".Editar-Plazo").click(
                    function () {
                        $(".nombre_plazo").val($(".nombre" + $(this).val()).text());
                        $(".descripcion").val($(".det" + $(this).val()).text());
                        $(".desde").val($(".desde" + $(this).val()).text());
                        $(".hasta").val($(".hasta" + $(this).val()).text());
                        $("#form-plazo").append("<input type='hidden' name='ID' value='" + $(".id" + $(this).val()).text() + "'  />");
                        $("#btn-registrar").val("Modificar");
                        $(".opc").val("Modificar");
                    }
            );
            $(".Eliminar-Plazo").click(
                    function () {
                        if (confirm("Esta Seguro de Eliminar?")) {
                            $.post("../../../plazo_dgp", "opc=Eliminar&plz=" + $(".id" + $(this).val()).text(), function () {
                                listar();
                            });
                        } else {
                        }
                    }
            );
        });
    }
    $(document).ready(function () {
        listar();
        $.post("../../../requerimiento", "opc=Listar_tp", function (objJson) {
            var tp = $(".planilla");
            tp.empty();
            var lista = objJson.lista;
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            tp.append("<option value=''>[Seleccione]</option>");
            for (var t = 0; t < lista.length; t++) {
                tp.append("<option value='" + lista[t].id + "'>" + lista[t].nombre + "</option>");
            }
        });

        $(".tipo").change(function () {
            if ($(this).val() == '1') {
                $(".tr_tolerancia").hide();
                $(".tr_dep_tolerancia").hide();
                $(".dep_tolerancia").val("0");
                $(".tolerancia").val("0");

            } else if ($(this).val() == '2') {
                $(".tr_tolerancia").show();
                $(".tr_dep_tolerancia").show();
                $(".dep_tolerancia").val("");

            }
        });
        $(".planilla").change(function () {
            $.post("../../../requerimiento", "opc=Listar_req_id&id=" + $(this).val(), function (objJson) {
                var req = $(".req");
                req.empty();
                var lista = objJson.lista;
                if (objJson.rpta == -1) {
                    alert(objJson.mensaje);
                    return;
                }
                var lista = objJson.lista;
                req.append("<option value='' selected =''>[Seleccione]</option>");
                req.append("<option value='0'>[Todos]</option>");
                for (var t = 0; t < lista.length; t++) {
                    req.append("<option value='" + lista[t].id + "'>" + lista[t].nombre + "</option>");
                }
            });

        });
        $(".req").change(function () {
            validar_fechas();
        });
        $(".btn-registrar").click(
                function () {
                    validar_fechas();
                    if ($(".form_plazo").valid()) {
                        $.post("../../../plazo_dgp", $("#form-plazo").serialize(), function () {
                            listar();
                        });
                        $("#btn-registrar").val("Registrar Plazo");
                        $(".opc").val("Registrar");
                        $("#form-plazo")[0].reset();
                        return false;
                    }
                }
        );
        $(".desde").click(function () {
            validar_fechas();
        });
    });

</script>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>