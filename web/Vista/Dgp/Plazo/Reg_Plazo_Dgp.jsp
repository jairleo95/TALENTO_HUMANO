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
    <center>

        <div id="main" role="main" style="margin: 0px;">
            <div id="content" >

                <section id="widget-grid" class="">
                    <div class="row">

                        <div class="well">
                            <h1>Mantenimiento de Plazos de Requerimientos</h1>
                            <form    id="form-plazo" class="form_plazo smart-form">

                                <div class="row">

                                    <section class="col col-6">
                                        <label><strong>Tipo de plazo :</strong></label>
                                        <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                            <select name="tipo" required="" class="tipo" required="">
                                                <option value='1' selected="">Ingreso a planilla</option>
                                                <option value='2'>Inicio de Contrato</option>
                                            </select>
                                        </label>
                                    </section>
                                    <section class="col col-6">
                                        <label><strong>Nombre de plazo :</strong></label>
                                        <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                            <input type="text" name="nombre_plazo" required="" class="nombre_plazo" />
                                        </label>
                                    </section>

                                </div>
                                <section>
                                    <label class="textarea"> 										
                                        <textarea rows="3" name="descripcion" placeholder="Descripción" required="" class="descripcion" ></textarea> 
                                    </label>
                                </section>
                                <div class="row tr_tolerancia" style="display: none">

                                    <section class="col col-6">
                                        <label><strong>Dias de tolerancia (Inicio de contrato):</strong></label>
                                        <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                            <input type="number" name="tolerancia" min=""  required=""  value="0" class="tolerancia" />
                                        </label>
                                    </section>
                                    <section class="col col-6">
                                        <label><strong>Departamento tolerancia (Inicio de contrato):</strong></label>
                                        <label class="input"> <i class="icon-prepend fa fa-user"></i>
                                            <input type="text" name="dep_tolerancia" required="" value="0" class="dep_tolerancia" />
                                        </label>
                                    </section>

                                </div>
                                <div class="row ">
                                    <section class="col col-3">
                                        <label><strong>Tipo planilla :</strong></label>
                                        <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                            <select name="planilla" required="" class="planilla" >
                                                <option value="0">[Todos]</option>
                                            </select>
                                        </label>
                                    </section>
                                    <section class="col col-3">
                                        <label><strong>Requerimiento :</strong></label>
                                        <label class="select"> <i class=""></i>
                                            <select name="id_req" required="" class="req" required="">
                                                <option value="0">[Todos]</option>
                                            </select>
                                        </label>
                                    </section>
                                    <section class="col col-3">
                                        <label><strong>Desde :</strong></label>
                                        <label class="input"> <i class=""></i>
                                            <input type="text" name="desde" placeholder="Request activation on" required=""  readonly="" class="desde datepicker" data-dateformat='yyyy-mm-dd'>
                                        </label>
                                    </section>
                                    <section class="col col-3">
                                        <label><strong>Hasta :</strong></label>
                                        <label class="input"> <i class=""></i>
                                            <input type="text" name="hasta" placeholder="Request activation on" required="" readonly="" class="hasta datepicker" data-dateformat='yyyy-mm-dd'>
                                        </label>
                                    </section>
                                </div>

                                <footer>
                                    <button type="button"  id="btn-registrar" class="btn btn-primary btn-registrar">
                                        Registrar 
                                    </button>
                                </footer>


                            </form>
                        </div>
                    </div>
                </section>

                <div class="row">
                    <div class="well">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr >
                                        <td class="text-center semi-bold">ID</td>
                                        <td class="text-center semi-bold">Tipo Plazo</td>
                                        <td class="text-center semi-bold">Nombre Plazo</td>
                                        <td class="text-center semi-bold">Descripción</td>
                                        <td class="text-center semi-bold">Desde</td>
                                        <td class="text-center semi-bold">Hasta</td>
                                        <td class="text-center semi-bold">Tipo de Planilla</td>
                                        <td class="text-center semi-bold">Requerimiento</td>
                                        <td class="text-center semi-bold">Dias de tolerancia</td>
                                        <td class="text-center semi-bold"> Dep. Tolerancia</td>
                                        <td class="text-center semi-bold">Estado</td>
                                        <td class="text-center semi-bold">Editar</td>
                                    </tr>
                                </thead>
                                <tbody  class="tbodys" >
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> 
            </div>
        </div>


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
        var text_html = "";
        b.append("<tr><td colspan='9'>Cargando...</td></tr>");
        $.post("../../../plazo_dgp", $(".form_plazo").serialize() + "&opc=Listar_Plazo", function (objJson) {
            b.empty();
            var lista = objJson.lista;
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            for (var i = 0; i < lista.length; i++) {

                if (lista[i].estado == '1') {
                    text_html += "<tr class='success' >";
                }
                else if (lista[i].estado == '0') {
                    text_html += "<tr class='danger' >";
                }
                text_html += "<td class='id" + i + "'>" + lista[i].id + "</td>";
                text_html += "<td class='tipo" + i + "'>" + lista[i].tipo + "</td>";
                text_html += "<td class='nombre" + i + "'>" + lista[i].nom + "</td>";
                text_html += "<td class='det" + i + "'>" + lista[i].det + "</td>";
                text_html += "<td class='desde" + i + "'>" + lista[i].desde + "</td>";
                text_html += "<td class='hasta" + i + "'>" + lista[i].hasta + "</td>";
                text_html += "<td class='planilla" + i + "'>" + lista[i].planilla + "</td>";
                text_html += "<td >" + lista[i].req + "</td>";
                text_html += "<td >" + lista[i].dep + "</td>";
                text_html += "<td >" + lista[i].dias + "</td>";
                if (lista[i].estado == '1') {
                    text_html += "<td  >Activo</td>";
                }
                else if (lista[i].estado == '0') {
                    text_html += "<td >No activo</td>";
                }
                text_html += "<input type='hidden' value='" + lista[i].id_req + "'/>";
                text_html += "<td><button value='" + i + "' class='Editar-Plazo'>Modificar</button><button value='" + i + "' class='Eliminar-Plazo' value='" + i + "'>Eliminar</button></td>";
                text_html += "</tr>";
            }
            b.append(text_html);
            text_html = "";

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
        $(".desde").datepicker({
            dateFormat: "yy-mm-dd",
            // defaultDate: "+1w",
            changeMonth: true,
            numberOfMonths: 2,
            onClose: function (selectedDate) {
                $(".desde").datepicker("option", "minDate", selectedDate);
                $(".hasta").datepicker("setDate", selectedDate);
            }
        });
        $(".hasta").datepicker({
            dateFormat: "yy-mm-dd",
            // defaultDate: "+1w",
            changeMonth: true,
            numberOfMonths: 2,
            onClose: function (selectedDate) {
                $(".hasta").datepicker("option", "maxDate", selectedDate);
            }
        });
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
            tp.append("<option value='0'>[Todos]</option>");
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
            listar();
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
            listar();
        });
        $(".btn-registrar").click(
                function () {
                    validar_fechas();
                    if ($(".form_plazo").valid()) {
                        $.post("../../../plazo_dgp", "opc=Registrar&" + $("#form-plazo").serialize(), function () {
                            listar();
                        });
                        $("#btn-registrar").val("Registrar Plazo");
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