
function calcularHoras() {
    var dias_semana = new Array("lun", "mar", "mie", "jue", "vie", "sab", "dom");
    var acum = 0;
    for (var i = 0; i < dias_semana.length; i++) {

        for (var j = 0, max = 5; j < max; j++) {
            var horaTurno = 0;
            //var str = $("#HORA_DESDE_" + dias_semana[i] + j).val();
            var Desde = $(".HORA_DESDE_" + dias_semana[i] + (j + 1)).val();
            var Hasta = $(".HORA_HASTA_" + dias_semana[i] + (j + 1)).val();
            if ($(".HORA_DESDE_" + dias_semana[i] + (j + 1)).val() == null) {
                Desde = "00:00";
                Hasta = "00:00";
            }
            //  var arrDesde = $(str).val().split(":");
            //if (typeof Desde !== 'undefined' && typeof Hasta !== 'undefined') {
            var arrDesde = Desde.split(":");
            var arrHasta = Hasta.split(":");
            horaTurno = (((parseInt(arrHasta[0]) * 60) + (parseInt(arrHasta[1]))) - ((parseInt(arrDesde[0]) * 60) + (parseInt(arrDesde[1]))));
            // alert(horaTurno + Desde + ".HORA_DESDE_" + dias_semana[i] + (j + 1)); 
            acum = acum + horaTurno;
            // }
        }
    }
    var minutos_totales = acum;
    acum = acum / 60;
    var min = ((acum - parseInt(acum)) * 60);
    min = parseInt(min.toPrecision(2));
    $(".h_total").text("Hora Semanal Total : " + parseInt(acum) + ":" + min + " Horas.");
    $(".h_total").val(acum);
    if (minutos_totales > 2880) {
    }
}
function dar_valor(caracter, num) {
    $(".porc" + num).val(caracter);
    var acum = 0;
    $.each($(".porcentaje_cc"), function () {
        acum = acum + parseFloat($(this).val());
    });
    $(".por_sum_to").val(acum);
}
function Eliminar(id, num, dia) {
    var dia_string = "";
    var msg = confirm('Si aceptas se eliminara la informacion totalmente ¿estas seguro de realizar esta operacion?');
    if (msg == true) {
        $.post("../../formato_horario", "opc=Eliminar_turno&id_horario=" + id, function (objJson) {
            if (dia == 1) {
                dia_string = "lun";
            }
            if (dia == 2) {
                dia_string = "mar";
            }
            if (dia == 3) {
                dia_string = "mie";
            }
            if (dia == 4) {
                dia_string = "jue";
            }
            if (dia == 5) {
                dia_string = "vie";
            }
            if (dia == 6) {
                dia_string = "sab";
            }
            if (dia == 7) {
                dia_string = "dom";
            }
            $(".turno_" + num + dia_string).remove();
            calcularHoras();
        });
    } else {
        return false;
    }
}

function cuenta_bancaria(banco) {
    if (banco == '') {
        $("#no_cuen").hide();
        $("#no_cuen_ban").hide();
        $("#generar").hide();
        $("#texto").hide();
        $("#no_cuen_otros").hide();
    }
    if (banco == '0') {
        $("#no_cuen").hide();
        $("#nu_cuen").val("");
        $("#no_cuen_ban").hide();
        $("#nu_cuen_ban").val("");
        $("#no_cuen_otros").show();
        $("#nu_cuen_otros").val("BBVA Banco Continental");
        $("#nu_cuen_otros").attr('readonly', 'readonly');
        $("#texto").show();
        $("#generar").show();
        $("#subscription").attr("required", "required");
        $("#nu_cuen_otros").attr("required", "required");
        $("#nu_cuen_otros").removeAttr('maxlength');
        $("#nu_cuen_otros").removeAttr('minlength');
    }
    if (banco === '1') {
        $("#generar").hide();
        $("#no_cuen").show();
        $("#nu_cuen").val("");
        $("#nu_cuen").attr("required", "required");
        $("#no_cuen_ban").hide();
        $("#nu_cuen_ban").val("");
        $("#subscription").attr('checked', false);
        $("#nu_cuen").attr("maxlength", "21");
        $("#nu_cuen").attr("minlength", "19");
        $("#no_cuen_otros").hide();
        $("#nu_cuen_otros").val("");
        $("#texto").hide();
    }
    if (banco === '2') {

        $("#generar").hide();
        $("#subscription").attr('checked', false);
        $("#no_cuen_ban").hide();
        $("#nu_cuen_ban").val("");
        $("#no_cuen").show();
        $("#nu_cuen").val("");
        $("#nu_cuen").attr("required", "required");
        $("#nu_cuen_otros").removeAttr('maxlength');
        $("#nu_cuen_otros").removeAttr('minlength');
        $("#nu_cuen").removeAttr('maxlength');
        $("#nu_cuen").removeAttr('minlength');
        $("#nu_cuen").attr("maxlength", "14");
        $("#nu_cuen").attr("minlength", "0");
        //$("#nu_cuen").mask("99999999999999", {placeholder: "X"});
        $("#no_cuen_otros").hide();
        $("#nu_cuen_otros").val("");
        $("#texto").hide();
        $("#nu_cuen").valid();
    }
    if (banco === '3') {
        $("#no_cuen").show();
        $("#no_cuen").val("");
        $("#nu_cuen").attr("required", "required");
        $("#no_cuen_ban").show();
        $("#no_cuen_ban").val("");
        $("#nu_cuen_ban").attr("required", "required");
        $("#no_cuen_otros").show();
        $("#nu_cuen_otros").val("");
        $("#nu_cuen_otros").attr("required", "required");
        $("#generar").hide();
        $("#subscription").attr('checked', false);
        $("#texto").hide();
        $("#nu_cuen_otros").removeAttr('readonly');
        $("#nu_cuen_otros").removeAttr('maxlength');
        $("#nu_cuen_otros").removeAttr('minlength');
    }


}

function listar_tipo_horario() {
    $.post("../../formato_horario", "opc=Listar_Tip_Horario", function (objJson) {

        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        var horario = $("#horario");
        horario.empty();
        horario.append('<option value="" >[Seleccione]</option>');
        for (var i = 0; i < lista.length; i++) {
            if ($(".id_det_hor").val().trim() === lista[i].id) {
                horario.append('<option value="' + lista[i].id + '" selected="">' + lista[i].nombre + '</option>');
            } else {
                horario.append('<option value="' + lista[i].id + '" >' + lista[i].nombre + '</option>');
            }
        }

    });
}
function list_horario(valor) {
    if (valor == 0) {
        $(".cont_lun").hide();
        $(".cont_mar").hide();
        $(".cont_mie").hide();
        $(".cont_jue").hide();
        $(".cont_vie").hide();
        $(".cont_sab").hide();
        $(".cont_dom").hide();
        $("#select_lun").val(2);
        $("#select_mar").val(2);
        $("#select_mie").val(2);
        $("#select_jue").val(2);
        $("#select_vie").val(2);
        $("#select_sab").val(2);
        $("#select_dom").val(2);
    } else {


        var dias_semana = new Array("lun", "mar", "mie", "jue", "vie", "sab", "dom");
        $(".tr-dia").remove();
        $.post("../../formato_horario", "opc=Listar_Horario&id=" + valor, function (objJson) {
            var lista = objJson.lista;
            var text_html = '';
            var primera_fila = 0;
            for (var f = 0; f < dias_semana.length; f++) {
                var d = 0;
                for (var i = 0; i < lista.length; i++) {
                    if (dias_semana[f] == lista[i].dia) {
                        primera_fila++;
                        var scntDiv = $('#show_' + dias_semana[f]);
                        $(".cont_" + dias_semana[f]).show();
                        $("#select_" + dias_semana[f]).val(lista[i].estado);
                        if (lista[i].estado == '2') {
                            scntDiv.hide();
                        } else if (lista[i].estado == '1') {
                            scntDiv.show();
                            text_html += '<tr class="tr-dia turno_' + (i + 1) + '" ><td>T' + (d + 1);
                            text_html += ' :</td><td><input type="text"   class="texto-h HORA_DESDE_' + dias_semana[f] + (d + 1) + '"   name="HORA_DESDE_' + dias_semana[f] + (d + 1);
                            text_html += '" value="' + lista[i].desde + '"  /></td><td><input type="text"  class="texto-h HORA_HASTA_' + dias_semana[f] + (d + 1) + '"  value="' + lista[i].hasta + '" name="HORA_HASTA_' + dias_semana[f] + (d + 1)
                                    + '" /><input type="hidden" name="DIA_' + dias_semana[f] + (d + 1) + '" class="nombre_dia_' + (i + 1) + '" value="' + dias_semana[f] + '" >';
                            if (primera_fila == 1) {
                                text_html += '<button type="button" class="btn btn-primary agregar_turno" value="' + (i + 1) + '"><i class="fa fa-plus-square"></i></button></td></tr>';
                            } else {
                                text_html += '<button type="button" class="btn btn-danger remover_turno" value="' + (i + 1) + '"><i class="fa  fa-minus-circle"></i></button></td></tr>';
                            }
                            d++;
                            scntDiv.append(text_html);
                            text_html = "";
                        }

                    }
                    // alert(dias_semana[f]);
                }
                primera_fila = 0;
            }
            calcularHoras();
            //$(".texto-h").mask("99:99", {placeholder: "X"});
            $(".texto-h").keypress(
                    function () {
                        calcularHoras();
                    }
            );
            $(".remover_turno").click(function () {
                //alert($(this).val());                         $(".turno_" + $(this).val()).remove();
                calcularHoras();
            });
            $(".agregar_turno").click(function () {
                var turno = $('#show_' + $(".nombre_dia_" + $(this).val()).val() + ' .tr-dia').size() + 1;
                var dia = $(".nombre_dia_" + $(this).val()).val();
                var agregar_turno = $('#show_' + dia);
                var i = $(".dias_semana .tr-dia").size();
                text_html += '<tr class="tr-dia turno_' + (i + 1) + '" ><td>T' + turno;
                text_html += ' :</td><td><input type="text"   class="texto-h HORA_DESDE_' + dia + turno + '"   name="HORA_DESDE_' + dia + turno;
                text_html += '" value="00:00"  /></td><td><input type="text"  class="texto-h HORA_HASTA_' + dia + turno + '"  value="00:00" name="HORA_HASTA_' + dia + turno + '" /><input type="hidden" name="DIA_' + dia + turno + '" class="nombre_dia_' + (i + 1) + '" value="' + dia + '" >';
                text_html += '<button type="button" class="btn btn-danger remover_turno" value="' + (i + 1) + '"><i class="fa  fa-minus-circle"></i></button></td></tr>';
                agregar_turno.append(text_html);
                //$(".texto-h").mask("99:99", {placeholder: "X"});
                $(".remover_turno").click(function () {
                    //alert($(this).val());
                    $(".turno_" + $(this).val()).remove();
                    calcularHoras();
                });
                $(".texto-h").keypress(
                        function () {
                            calcularHoras();
                        }
                );
            });
        });
    }

}
function listar_horas() {
    $.post("../../formato_horario", "opc=Listar_Horas_horario&iddgp=" + $(".iddgp").val(), function (objJson) {
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        var turno_l = 0;
        var turno_ma = 0;
        var turno_mi = 0;
        var turno_j = 0;
        var turno_v = 0;
        var turno_s = 0;
        var turno_d = 0;
        var turno = 0;
        var dia = 0;
        $(".dias_semana").append("<input type='hidden' value='" + lista.length + "' name='cantidad_inicial_horario'>")
        for (var i = 0; i < lista.length; i++) {
            $("#select_" + lista[i].dia_h).val(1);
            $('#show_' + lista[i].dia_h).show();
            var g = $("#show_" + lista[i].dia_h);
            var text_html = '';
            if (lista[i].dia_h == "lun") {
                turno = turno_l;
                dia = 1;
            }
            if (lista[i].dia_h == "mar") {
                turno = turno_ma;
                dia = 2;
            }
            if (lista[i].dia_h == "mie") {
                turno = turno_mi;
                dia = 3;
            }
            if (lista[i].dia_h == "jue") {
                turno = turno_j;
                dia = 4;
            }
            if (lista[i].dia_h == "vie") {
                turno = turno_v;
                dia = 5;
            }
            if (lista[i].dia_h == "sab") {
                dia = 6;
                turno = turno_s;
            }
            if (lista[i].dia_h == "dom") {
                turno = turno_d;
                dia = 7;
            }

            text_html += '<tr class="tr-dia turno_' + (turno + 1) + lista[i].dia_h + '" ><td>T' + (turno + 1);
            text_html += ' :</td><td><input type="text"   class="texto-h HORA_DESDE_' + lista[i].dia_h + (turno + 1) + '"   name="HORA_DESDE_' + lista[i].dia_h + (turno + 1);
            text_html += '" value="' + lista[i].hor_d + '"  /></td><td><input type="text"  class="texto-h HORA_HASTA_' + lista[i].dia_h + (turno + 1) + '"  value="' + lista[i].hor_h + '" name="HORA_HASTA_' + lista[i].dia_h + (turno + 1)
                    + '" /><input type="hidden" name="DIA_' + lista[i].dia_h + (turno + 1) + '" class="nombre_dia_' + (i + 1) + '" value="' + lista[i].dia_h + '" >';
            text_html += '<input type="hidden" value="' + lista[i].id + '" name="id_horario' + (turno + 1) + lista[i].dia_h + '">'
            if (turno + 1 == 1) {
                text_html += '<button type="button" class="btn btn-primary agregar_turno' + (turno + 1) + '" value="' + lista[i].id + '" ><i class="fa fa-plus-square"></i></button></td></tr>';
            } else {
                text_html += '<button type="button" class="btn btn-danger remover_turno' + (turno + 1) + lista[i].dia_h + '" value="' + lista[i].id + '" onclick="Eliminar($(this).val(),' + (turno + 1) + ',' + dia + ');"><i class="fa  fa-minus-circle"></i></button></td></tr>';
            }
            g.append(text_html);
            if (lista[i].dia_h == "lun") {
                turno_l++;
            }
            if (lista[i].dia_h == "mar") {
                turno_ma++;
            }
            if (lista[i].dia_h == "mie") {
                turno_mi++;
            }
            if (lista[i].dia_h == "jue") {
                turno_j++;
            }
            if (lista[i].dia_h == "vie") {
                turno_v++;
            }
            if (lista[i].dia_h == "sab") {
                turno_s++;
            }
            if (lista[i].dia_h == "dom") {
                turno_d++;
            }
            calcularHoras();
            //$(".texto-h").mask("99:99", {placeholder: "X"});
            $(".texto-h").keypress(
                    function () {
                        calcularHoras();
                    }
            );
            /* $(".remover_turno" + (turno + 1)).click(function() {
             //alert($(this).val());
             //$(".turno_" + $(this).val()).remove();
             Eliminar();
             });*/
            $(".agregar_turno").click(function () {
                //var turno = $('#show_' + $(".nombre_dia_" + $(this).val()).val() + ' .tr-dia').size() + 1;
                var dia = $(".nombre_dia_" + $(this).val()).val();
                var agregar_turno = $('#show_' + dia);
                var i = $(".dias_semana .tr-dia").size();
                text_html += '<tr class="tr-dia turno_' + (i + 1) + '" ><td>T' + (turno + 1);
                text_html += ' :</td><td><input type="text"   class="texto-h HORA_DESDE_' + dia + (turno + 1) + '"   name="HORA_DESDE_' + dia + (turno + 1);
                text_html += '" value="00:00"  /></td><td><input type="text"  class="texto-h HORA_HASTA_' + dia + (turno + 1) + '"  value="00:00" name="HORA_HASTA_' + dia + (turno + 1)
                        + '" /><input type="hidden" name="DIA_' + dia + (turno + 1) + '" class="nombre_dia_' + (i + 1) + '" value="' + dia + '" >';
                text_html += '<button type="button" class="btn btn-danger remover_turno" value="' + (i + 1) + '"><i class="fa  fa-minus-circle"></i></button></td></tr>';
                agregar_turno.append(text_html);
                //$(".texto-h").mask("99:99", {placeholder: "X"});
                $(".remover_turno").click(function () {
                    //alert($(this).val());
                    $(".turno_" + $(this).val()).remove();
                    calcularHoras();
                });
                $(".texto-h").keypress(
                        function () {
                            calcularHoras();
                        }
                );
            });
        }
    });
}

function mostrarEditHorario() {

    $(".cont_lun").hide();
    $(".cont_mar").hide();
    $(".cont_mie").hide();
    $(".cont_jue").hide();
    $(".cont_vie").hide();
    $(".cont_sab").hide();
    $(".cont_dom").hide();
    $("#select_lun").change(
            function () {
                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                if (msg == true) {
                    if ($(this).val() == 1) {
                        $("#show_lun").show();
                    }
                    if ($(this).val() == 2) {
                        $(".cont_lun").hide();
                        $("#show_lun input").val("00:00");
                    }
                    calcularHoras();
                } else {
                    $("#select_lun").val("1");
                    return false;
                }
            }
    );
    $("#select_mar").change(
            function () {
                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                if (msg == true) {
                    if ($(this).val() == 1) {
                        $("#show_mar").show();
                    }
                    if ($(this).val() == 2) {
                        $(".cont_mar").hide();
                        $("#show_mar input").val("00:00");
                    }
                    calcularHoras();
                } else {
                    $("#select_mar").val("1")
                    return false;
                }
            }
    );
    $("#select_mie").change(
            function () {
                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                if (msg == true) {
                    if ($(this).val() == 1) {
                        $("#show_mie").show();
                    }
                    if ($(this).val() == 2) {
                        $(".cont_mie").hide();
                        $("#show_mie input").val("00:00");
                    }
                    calcularHoras();
                } else {
                    $("#select_mie").val("1")
                    return false;
                }
            }
    );
    $("#select_jue").change(
            function () {
                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                if (msg == true) {
                    if ($(this).val() == 1) {
                        $("#show_jue").show();
                    }
                    if ($(this).val() == 2) {
                        $(".cont_jue").hide();
                        $("#show_jue input").val("00:00");
                    }
                    calcularHoras();
                } else {
                    $("#select_jue").val("1")
                    return false;
                }
            }
    );
    $("#select_vie").change(
            function () {
                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                if (msg == true) {
                    if ($(this).val() == 1) {
                        $("#show_vie").show();
                    }
                    if ($(this).val() == 2) {
                        $(".cont_vie").hide();
                        $("#show_vie input").val("00:00");
                    }
                    calcularHoras();
                } else {
                    $("#select_vie").val("1")
                    return false;
                }
            }
    );
    $("#select_sab").change(
            function () {
                var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
                if (msg == true) {
                    if ($(this).val() == 1) {
                        $("#show_sab").show();
                    }
                    if ($(this).val() == 2) {
                        $(".cont_sab").hide();
                        $("#show_sab input").val("00:00");
                    }
                    calcularHoras();
                } else {
                    $("#select_sab").val("1")
                    return false;
                }
            }
    );
    $("#select_dom").change(function () {
        var msg = confirm("Si acepta esta operacion eliminara la informacion de turno de este dia ¿Desea continuar?")
        if (msg == true) {
            if ($(this).val() == 1) {
                $("#show_dom").show();
            }
            if ($(this).val() == 2) {
                $(".cont_dom").hide();
                $("#show_dom input").val("00:00");
            }
            calcularHoras();
        } else {
            $("#select_dom").val("1")
            return false;
        }
    }
    );
}
function periodo_pago(cantidad) {
    var sueldo = parseFloat($("#sueldo").val());
    var p_p = sueldo / cantidad;
    $.each($(".monto"), function () {
        $(".monto").val(p_p);
    });
}
function calcular_sueldo_total() {
    var x = parseFloat($("#sueldo").val());
    var y = parseFloat($("#bono_al").val());
    var w = parseFloat($("#bono_pu").val());
    var z = parseFloat($("#bev").val());
    var v = x + y + z + w;
    $("#suel_total").text(Math.round(v * 100) / 100);
}
function showEsDiezmo() {
    var obj = $(".div_input_diezmo");
    console.log("enter to function showEsDiezmo");
    obj.show();
    obj.empty();
    obj.append('<br><div class="col col-md-12 text-center"><i class="fa fa-spin fa-spinner"></i></div>');
    $.ajax({
        url: "../../trabajador", data: "opc=ShowEsDiezmoTrabajador&id=" + $(".idtr").val(), type: 'POST', success: function (data, textStatus, jqXHR) {
            if (data.rpta) {
                obj.empty();
                obj.append(data.html);
                $(".cbkDiezmo").click(function () {
                    $.SmartMessageBox({
                        title: "&iexcl;Alerta!",
                        content: "Esta seguro de modificar la autorizaci&oacute;n de descuento diezmo?",
                        buttons: '[No][Si]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Si") {
                            if ($(".cbkDiezmo").prop("checked")) {
                                $.ajax({
                                    url: "../../trabajador", data: "opc=UpdateEsDiezmo&id=" + $(".idtr").val() + "&estado=0", type: 'POST', success: function (data, textStatus, jqXHR) {
                                        if (data.status) {
                                            $(".cbkDiezmo").prop("checked", false);
                                            $.smallBox({
                                                title: "&iexcl;Atenci&oacute;n!",
                                                content: "<i class='fa fa-clock-o'></i> <i>Se neg&oacute; el descuento de diezmo...</i>",
                                                color: "#C46A69",
                                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                timeout: 6000
                                            });
                                        } else {
                                            alert('Error al actualizar.');
                                        }

                                    }
                                });
                            } else {
                                $.ajax({
                                    url: "../../trabajador", data: "opc=UpdateEsDiezmo&id=" + $(".idtr").val() + "&estado=1", type: 'POST', success: function (data, textStatus, jqXHR) {
                                        if (data.status) {
                                            $(".cbkDiezmo").prop("checked", true);
                                            $.smallBox({
                                                title: "&iexcl;Atenci&oacute;n!",
                                                content: "<i class='fa fa-clock-o'></i> <i>Se autoriz&oacute; el descuento de diezmo...</i>",
                                                color: "#659265",
                                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                timeout: 6000
                                            });
                                        } else {
                                            alert('Error al actualizar.');
                                        }
                                    }
                                });
                            }
                            showEsDiezmo();


                        }
                    });
                    return false;


                });
            }else{
                 alert('Error al cargar.');
            }
        }
    });
}
var cantidad = 1;
$("#btn_add").click(function () {
    var agregar = $('#fila-agregar');
    var texto = "";
    cantidad++;
    texto += '<div class="row pago_cuotas_' + cantidad + '">';
    texto += '<section class="col col-2"><label class="btn">';
    texto += '<button type="button" class="eliminar' + cantidad + '"  >Eliminar</button>';
    texto += '</label></section>';
    texto += '<section class="col col-2" ><label class="input" id="titu">';
    texto += '<input type="text" name="CUOTA_' + cantidad + '" id="cuota" required="" value="' + cantidad + '" >';
    texto += '</label></section>';
    texto += '<section class="col col-4" ><label class="input" id="titu">';
    texto += '<input type="date" name="FEC_PAGAR_' + cantidad + '" id="datepicker" required="" >';
    texto += '</label></section>';
    texto += '<section class="col col-4" ><label class="input" id="titu">';
    texto += '<input type="text" name="MONTO_' + cantidad + '" required="" class="monto" >';
    texto += '</label></section>';
    texto += '</div>';
    agregar.append(texto);
    periodo_pago(cantidad);
    $(".cant").val(cantidad);
    //alert($(".cant").val())
    $(".eliminar" + cantidad).click(function () {
        $(".pago_cuotas_" + cantidad).remove();
        periodo_pago(cantidad);
        cantidad--;
        periodo_pago(cantidad);
        //alert(cantidad)
    });
});
//MARTES
$(function () {
    var scntDiv = $('#show_mar');
    var i = $('#show_mar .texto-h').size() + 1;
    var s = $('#show_mar .tr-count_2').size() + 1;
    $('#add_2').click(function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mar' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mar' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mar' + i + '" value="mar" ><input type="hidden" name="USER_CREACION_mar' + i + '"> <a href="#" id="remove_2">-</a></td></tr>').appendTo(scntDiv);
        i++;
        s++;
        return false;
    });
    $('.remove_2').click(function () {
        if (i > 2) {
            $(this).parents('tr').remove(); //  $("#tr-d").remove();                                i--;                     s--;
        }
        return false;
    });
});
//MIERCOLES
$(function () {
    var scntDiv = $('#show_mie');
    var i = $('#show_mie .texto-h').size() + 1;
    var s = $('#show_mie .tr-count_3').size() + 1;
    $('#add_3').click(function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mie' + i + '" value="mie" ><input type="hidden" name="USER_CREACION_mie' + i + '"> <a href="#" id="remove_3">-</a></td></tr>').appendTo(scntDiv);
        i++;
        s++;
        return false;
    });
    $('.remove_3').click(function () {
        if (i > 2) {
            $(this).parents('tr').remove(); //  $("#tr-d").remove();                                i--;                     s--;
        }
        return false;
    });
});
//JUEVES
$(function () {
    var scntDiv = $('#show_jue');
    var i = $('#show_jue .texto-h').size() + 1;
    var s = $('#show_jue .tr-count_4').size() + 1;
    $('#add_4').click(function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_jue' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_jue' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_jue' + i + '" value="jue" ><input type="hidden" name="USER_CREACION_jue' + i + '"> <a href="#" id="remove_4">-</a></td></tr>').appendTo(scntDiv);
        i++;
        s++;
        return false;
    });
    $('.remove_4').click(function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});
//VIERNES
$(function () {
    var scntDiv = $('#show_vie');
    var i = $('#show_vie .texto-h').size() + 1;
    var s = $('#show_vie .tr-count_5').size() + 1;
    $('#add_5').click(function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_vie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_vie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_vie' + i + '" value="vie" ><input type="hidden" name="USER_CREACION_vie' + i + '"> <a href="#" id="remove_5">-</a></td></tr>').appendTo(scntDiv);
        i++;
        s++;
        return false;
    });
    $('.remove_5').click(function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});
//DOMINGO
$(function () {
    var scntDiv = $('#show_sab');
    var i = $('#show_sab .texto-h').size() + 1;
    var s = $('#show_sab .tr-count_6').size() + 1;
    $('#add_6').click(function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_dom' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_dom' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_dom' + i + '" value="dom" ><input type="hidden" name="USER_CREACION_dom' + i + '"> <a href="#" id="remove_6">-</a></td></tr>').appendTo(scntDiv);
        i++;
        s++;
        return false;
    });
    $('.remove_6').click(function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});

// DO NOT REMOVE : GLOBAL FUNCTIONS!
$(document).ready(function () {
    pageSetUp();
    mostrarEditHorario();
    $("#sueldo").numeric();
    $("#bono_al").numeric();
    $("#bev").numeric();
    $("#nu_cuen").numeric();
    $("#nu_cuen_ban").numeric();
    showEsDiezmo();
    listCentoCostoByDGP($(".iddgp").val());
    listar_tipo_horario();
    listar_horas();
    $("#banco").change(function () {
        $("#no_cuen").hide();
        $("#no_cuen_ban").hide();
        $("#generar").hide();
        $("#no_cuen_otros").hide();
        cuenta_bancaria($(this).val());
        $("#nu_cuen").focus();
        $("#es_cuenta").val(1);
    });
    listar_cc();
    $("#horario").change(function () {
        var select_an = $("#horario").val();
        var msg = confirm('Si aceptas se eliminara la informacion totalmente los horarios que se ven ahora ¿deseas continuar?');
        if (msg == true) {
            list_horario($(this).val());
            $(".modificacion-total").val("1");
        } else {
            listar_tipo_horario();
            return false;
        }
    });

    list_select($(".select-area"), "../../Direccion_Puesto", "opc=Listar_area2&id=" + $(".dep_id").val(), "4", $(".area_id").val());
    list_select($(".select-seccion"), "../../Direccion_Puesto", "opc=Listar_sec2&id=" + $(".area_id").val(), "4", $(".seccion_id").val());
    list_select($(".select-puesto"), "../../Direccion_Puesto", "opc=Listar_pu_id&id=" + $(".seccion_id").val(), "4", $(".puesto_id").val());
    $(".select-area").change(function () {
        list_select($(".select-seccion"), "../../Direccion_Puesto", "opc=Listar_sec2&id=" + $(".select-area").val(), "3");
        $(".select-seccion,.select-puesto").val("");
        $(".chosen-select").trigger("chosen:updated");
    });
    $(".select-seccion").change(function () {
        list_select($(".select-puesto"), "../../Direccion_Puesto", "opc=Listar_pu_id&id=" + $(".select-seccion").val(), "3");
        $(".chosen-select").trigger("chosen:updated");
    });


    $("#sueldo").keyup(function () {
        var sueldo = parseFloat($("#sueldo").val());
        $(".monto").val(Math.round(sueldo));
    });
    /*Advertencias de Plazo*/
    var b = $("#alerta_dgp");
    var info = $(".div_info");
    listar_mensaje_plazo("2", b, info);
    var s = $(".info_1");
    var t = $(".alert_1");
    listar_mensaje_plazo("1", t, s);


    $("#sueldo").keyup(function () {
        calcular_sueldo_total();
    });
    $("#bono_al").keyup(function () {
        calcular_sueldo_total();
    });
    $("#bev").keyup(function () {
        calcular_sueldo_total();
    });
    $("#bono_pu").keyup(function () {
        calcular_sueldo_total();
    });
    $(".contenido").hide();
    /*TEMPORAL*/             //Planilla
    //if ($("#combito").val()=="REQ-0001" | $("#combito").val() == "REQ-0002" | $("#combito").val() == "REQ-0003" | $(this).val() == "REQ-0004" | $(this).val() == "REQ-0005" | $(this).val() == "REQ-0006") {
    if (true) {
        $(".contenido").hide();
        $("#div_1").show();
    }
    //Fuera PLanilla
    if ($("#combito").val() == 7 | $(this).val() == 8 | $(this).val() == 9) {
        $(".contenido").hide();
        $("#div_2").show();
    }
    //Otros
    if ($("#combito").val() == 10 | $(this).val() == 11 | $(this).val() == 12) {
        $(".contenido").hide();
        $("#div_3").show();
    }
    $('#checkout-form').validate({
        // Rules for form validation
        rules: {
            horas_totales: {
                required: true
            }
        }, // Messages for form validation           
        messages: {
            horas_totales: {
                max: 'Porfavor digite un horario que se menor a 48 Horas de Trabajo'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        }
    });


    var scntDiv = $('#show_lun');
    var i = $('#show_lun .texto-h').size() + 1;
    var s = $('#show_lun .tr-count').size() + 1;
    $('#addScnt').click(function () {
        $('<tr><td>T' + s + ' :</td><td><input type="text"   name="HORA_DESDE_lun' + i
                + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_lun' + i
                + '" value="" placeholder=" " /><input type="hidden" name="DIA_lun' + i
                + '" value="lun" ><input type="hidden" name="USER_CREACION_lun' + i
                + '"> <a href="#" id="remScnt">-</a></td></tr>').appendTo(scntDiv);
        i++;
        s++;
        return false;
    });
    $('#remScnt').click(function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });

});