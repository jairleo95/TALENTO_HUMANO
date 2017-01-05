/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
            } else if (lista[i].estado == '0') {
                text_html += "<tr class='danger' >";
            }
            text_html += "<td>" + (i + 1) + "</td>";
            if (lista[i].tipo === "1") {
                text_html += "<td class='tipo" + i + "'>Inicio de Contrato</td>";
            } else if (lista[i].tipo === "2") {
                text_html += "<td class='tipo" + i + "'>Ingreso a planilla</td>";
            }

            text_html += "<td class='nombre" + i + "'>" + lista[i].nom + "</td>";
            text_html += "<td class='det" + i + "'>" + lista[i].det + "</td>";
            text_html += "<td class='desde" + i + "'>" + lista[i].desde + "</td>";
            text_html += "<td class='hasta" + i + "'>" + lista[i].hasta + "</td>";
            text_html += "<td class='planilla" + i + "'>" + lista[i].planilla + "</td>";
            text_html += "<td >" + lista[i].req + "</td>";
            text_html += "<td >" + lista[i].dep_tol + "</td>";
            text_html += "<td >" + lista[i].dias + "</td>";
            text_html += "<td >" + lista[i].dep + "</td>";
            text_html += "<td >" + lista[i].area + "</td>";

            if (lista[i].estado == '1') {
                text_html += "<td  >Activo</td>";
            } else if (lista[i].estado == '0') {
                text_html += "<td >No activo</td>";
            }
            text_html += "<input type='hidden' value='" + lista[i].id_req + "'/>";
            text_html += "<td><button class='btn btn-success btn-sm Editar-Plazo' value='" + lista[i].id + "'><i class='fa fa-pencil'></i></button>";
            text_html += "<button class='btn btn-danger btn-sm Eliminar-Plazo' value='" + lista[i].id + "'><i class='fa fa-times'></i></button></td>";
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
                    var valor = $(this).val();
                    $.SmartMessageBox({
                        title: "¡Advertencia!",
                        content: "¿Esta seguro de eliminar el plazo?",
                        buttons: '[No][Si]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Si") {
                            $.ajax({
                                url: "../../../plazo_dgp",
                                data: "opc=Eliminar&plz=" + valor,
                                type: "POST"
                            }).done(function () {
                                listar();
                                $.smallBox({
                                    title: "¡Procesado con exito!",
                                    content: "<i class='fa fa-clock-o'></i> <i>Se ha eliminado el plazo correctamente...</i>",
                                    color: "#659265",
                                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                    timeout: 4000
                                });
                            });
                        }
                        if (ButtonPressed === "No") {
                        }
                    });
                }
        );
    });
}
$(document).ready(function () {
    pageSetUp();
    $.sound_path = "../../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
        $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
    });
    $(".btnAgregar").show(300);
    $(".btnAgregar").click(function () {
        $(".btn-registrar").show(200);
        $(".btnClose").show(200);
        $(".form_plazo").show(200);
        $(this).hide(200);
    });
    $(".btnClose").click(function () {
        $(".btnAgregar").show(200);
        $(".form_plazo").hide(200);
        $(".btn-registrar").hide(200);
        $(this).hide(200);
    });
    $(".departamento").change(function () {
        listar()
    });
    $(".area").change(function () {
        listar()
    });
    $(".desde").datepicker({
        dateFormat: "yy-mm-dd",
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        onClose: function (selectedDate) {
            $(".hasta").datepicker("option", "minDate", selectedDate);
            $(".hasta").datepicker("setDate", selectedDate);
        }
    });
    $(".hasta").datepicker({
        dateFormat: "yy-mm-dd",
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        onClose: function (selectedDate) {
            $(".desde").datepicker("option", "maxDate", selectedDate);
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
            $(".tolerancia").val("0");
            $(".tr_tolerancia").show();
            $(".tr_dep_tolerancia").hide();
            $(".dep_tolerancia").val("0");

        } else if ($(this).val() == '2') {
            $(".tr_tolerancia").hide();
            $(".tolerancia").val("0");
            $(".tr_dep_tolerancia").show();
            $(".dep_tolerancia").val("DPT-0019");

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
                //$(this).attr("disabled", "true");
                validar_fechas();
                if ($(".form_plazo").valid()) {
                    $.ajax({
                        type: "post",
                        url: "../../../plazo_dgp",
                        data: "opc=Registrar&" + $("#form-plazo").serialize()
                    }).done(function (objJson) {
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        } else {
                            listar();
                            $("#form-plazo")[0].reset();
                            $.smallBox({
                                title: "Â¡Registrado!",
                                content: "<i class='fa fa-clock-o'></i> <i>El plazo se ha registrado correctamente...</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 4000
                            });
                            //$(this).removeAttr("disabled");
                        }
                    });
                } else {
                    $(this).removeAttr("disabled");
                    $.smallBox({
                        title: "¡Atención!",
                        content: "<i class='fa fa-ban'></i> <i>Complete los campos...</i>",
                        color: "red",
                        iconSmall: "bounce animated",
                        timeout: 4000
                    });
                }

            }
    );
    $(".desde").click(function () {
        validar_fechas();
    });

    list_select($(".direccion"), "../../../Direccion_Puesto", "opc=Listar_direccion");
    $(".direccion").change(function () {
        list_select($(".departamento"), "../../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + $(this).val());
    });
    $(".departamento").change(function () {
        list_select($(".area"), "../../../Direccion_Puesto", "opc=Listar_area2&" + "id=" + $(this).val());
    });

});


