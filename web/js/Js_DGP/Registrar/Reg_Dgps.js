function mostrar() {
    $(".cont_lun").hide();
    $(".cont_mar").hide();
    $(".cont_mie").hide();
    $(".cont_jue").hide();
    $(".cont_vie").hide();
    $(".cont_sab").hide();
    $(".cont_dom").hide();
    $("#select_lun").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_lun").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_lun").hide();
                    $("#show_lun input").val("00:00");
                }
                calcularHoras();
            }
    );
    $("#select_mar").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_mar").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_mar").hide();
                    $("#show_mar input").val("00:00");
                }
                calcularHoras();
            }
    );
    $("#select_mie").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_mie").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_mie").hide();
                    $("#show_mie input").val("00:00");
                }
                calcularHoras();
            }
    );
    $("#select_jue").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_jue").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_jue").hide();
                    $("#show_jue input").val("00:00");
                }
                calcularHoras();
            }
    );
    $("#select_vie").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_vie").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_vie").hide();
                    $("#show_vie input").val("00:00");
                }
                calcularHoras();
            }
    );
    $("#select_sab").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_sab").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_sab").hide();
                    $("#show_sab input").val("00:00");
                }
                calcularHoras();
            }
    );
    $("#select_dom").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_dom").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_dom").hide();
                    $("#show_dom input").val("00:00");
                }
                calcularHoras();
            }
    );
}
function mostrar_horario_edit() {

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
    $("#select_dom").change(
            function () {
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
function agregar_centro_costo(opc, arr_cc) {
    var agregar = $('#fila-agregar');
    var ag = $('#fila-agregar .porcentaje_cc').size() + 1;
    var texto = "";
    /*se condiciona con 1  para saber si vamos a extraer los datos*/
    if (opc == "1") {

        texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + ag + ':</label>';
        texto += '<div  class="row centro-costo_' + ag + '" >';
        texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '"><option value="">[DIRECCION]</option></select></label></section>';
        texto += '<section class="col col-3"><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
        texto += '<section class="col col-3"><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ag + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';
        texto += '<section class="col col-2"><label class="input" id="titu">%<input name="PORCENTAJE_' + ag + '"  min="0"   type="text" required="" value="' + arr_cc[3] + '" class="porcentaje_cc"/><button type="button" class="remover' + ag + '">Remover</button></label></section>';
        texto += '</div>';
        agregar.append(texto);
        listar_cc(ag, opc, arr_cc);
        sumn_porcen_total();
    } else {
        texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + ag + ':</label>';
        texto += '<div  class="row centro-costo_' + ag + '" >';
        texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '"><option value="">[DIRECCION]</option></select></label></section>';
        texto += '<section class="col col-3"><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
        /* nuevo agregado : area y seccion*/
        texto += '<section class="col col-3"><label class="select" id="titu"> Area :<select required=""  class="cc-area' + ag + '"><option value="">[AREA]</option></select></label></section>';
        texto += '<section class="col col-3"><label class="select" id="titu"> Seccion :<select required=""  class="cc-seccion' + ag + '"><option value="">[SECCION]</option></select></label></section>';

        texto += '<section class="col col-3"><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ag + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';
        texto += '<section class="col col-2"><label class="input" id="titu">%<input name="PORCENTAJE_' + ag + '"  min="0"   type="text" required="" class="porcentaje_cc"/><button type="button" class="remover' + ag + '">Remover</button></label></section>';
        texto += '</div>';
        agregar.append(texto);
        listar_cc(ag);
        var c_porcentaje = $(".porcentaje_cc").size();
        $(".porcentaje_cc").val(Math.round((100 / c_porcentaje) * 100) / 100);
        sumn_porcen_total();
    }
    texto = "";
    $(".cant-input").val(ag);
    ag++;
    $(".porcentaje_cc").keyup(function () {
        sumn_porcen_total();
    });
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
        horario.append('<option value="" >[SELECCIONE]</option>');
        for (var i = 0; i < lista.length; i++) {
            horario.append('<option value="' + lista[i].id + '" >' + lista[i].nombre + '</option>');
        }
    });
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
    var f = parseInt($('#asigf').val());
    if (f > 0) {
        v = v + 75;
    }

    $("#suel_total").text(Math.round(v * 100) / 100);
}
function calcularHoras() {
    var dias_semana = new Array("lun", "mar", "mie", "jue", "vie", "sab", "dom");
    var acum = 0;
    for (var i = 0; i < dias_semana.length; i++) {

        for (var j = 0, max = 5; j < max; j++) {
            var horaTurno = 0;
            var Desde = $(".HORA_DESDE_" + dias_semana[i] + (j + 1)).val();
            var Hasta = $(".HORA_HASTA_" + dias_semana[i] + (j + 1)).val();
            if ($(".HORA_DESDE_" + dias_semana[i] + (j + 1)).val() == null) {
                Desde = "00:00";
                Hasta = "00:00";
            }
            var arrDesde = Desde.split(":");
            var arrHasta = Hasta.split(":");
            horaTurno = (((parseInt(arrHasta[0]) * 60) + (parseInt(arrHasta[1]))) - ((parseInt(arrDesde[0]) * 60) + (parseInt(arrDesde[1]))));
            acum = acum + horaTurno;
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
function listar_dep_cc(x, opc, arr_cc) {
    var cc_dep = $(".cc-dep" + x);
    $.post("../../centro_costo?opc=Listar_dep", "&id_dir=" + $(".cc-dir" + x).val(), function (objJson) {
        cc_dep.empty();
        cc_dep.append("<option value=''>[DEPARTAMENTO]</option>");
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (opc == "1") {
                if (arr_cc[1] == lista[i].id) {
                    cc_dep.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                    listar_centro_costo(x, opc, arr_cc);
                } else {
                    cc_dep.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                }
            } else {
                cc_dep.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
            }
        }
    });
}
function listar_centro_costo(x, opc, arr_cc) {
    var centro_costo = $(".centro_costo" + x);
    $.post("../../centro_costo?opc=Listar_CC", "&id_dep=" + $(".cc-dep" + x).val(), function (objJson) {
        centro_costo.empty();
        centro_costo.append("<option value=''>[CENTRO COSTO]</option>");
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (opc == "1") {
                if (arr_cc[4] == lista[i].id) {
                    centro_costo.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                } else {
                    centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                }
            } else {
                centro_costo.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
            }
        }
    });
}
function listar_cc(num, opc, arr_cc) {
    var select_cc = $(".select-cc");
    $.post("../../centro_costo?opc=Listar_cc", function (objJson) {
        //  select_cc.empty();
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            select_cc.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
        }
    });
    var cc_dir = $(".cc-dir" + num);
    $.post("../../centro_costo?opc=Listar_dir", function (objJson) {
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (opc == "1") {
                if (arr_cc[0] == lista[i].id) {
                    cc_dir.append("<option value='" + lista[i].id + "' selected='selected'>" + lista[i].nombre + "</option>");
                    listar_dep_cc(num, opc, arr_cc);
                } else {
                    cc_dir.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
                }
            } else {
                cc_dir.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
            }
        }
    });
    $(".cc-dir" + num).change(function () {
        listar_dep_cc(num, "0", arr_cc);
    });
    $(".cc-dep" + num).change(function () {
        list_select($(".cc-area" + num), "../../Direccion_Puesto", "opc=Listar_area2&id=" + $(this).val());
        listar_centro_costo(num, "0", arr_cc);
    });
    $(".cc-area" + num).change(function () {
        list_select($(".cc-seccion" + num), "../../Direccion_Puesto", "opc=Listar_sec2&id=" + $(this).val());
        list_cc_area($(this).val(), $(".centro_costo" + num));

        //listar_centro_costo(num, "0", arr_cc);
    });
    $(".cc-seccion" + num).change(function () {
        list_cc_seccion($(".cc-seccion" + num).val(), $(".centro_costo" + num));
        //listar_centro_costo(num, "0", arr_cc);
    });
    $(".remover" + num).click(function () {
        $(".centro-costo_" + num).remove();
        sumn_porcen_total();
    });
}
function sumn_porcen_total() {
    var acum = 0;
    $.each($(".porcentaje_cc"), function () {
        acum = acum + parseFloat($(this).val());
    });
    $(".total_porcentaje").val(acum);
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
                        }
                        text_html += '<tr class="tr-dia turno_' + (i + 1) + '" ><td>T' + (d + 1);
                        text_html += ' :</td><td><input type="text"   style="width:40px;" class="texto-h HORA_DESDE_' + dias_semana[f] + (d + 1) + '"   name="HORA_DESDE_' + dias_semana[f] + (d + 1);
                        text_html += '" value="' + lista[i].desde + '"  /></td><td><input type="text"  style="width:40px;" class="texto-h HORA_HASTA_' + dias_semana[f] + (d + 1) + '"  value="' + lista[i].hasta + '" name="HORA_HASTA_' + dias_semana[f] + (d + 1)
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
                primera_fila = 0;
            }
            calcularHoras();
            $(".texto-h").keyup(
                    function () {
                        calcularHoras();
                    }
            );
            $(".remover_turno").click(function () {
                $(".turno_" + $(this).val()).remove();
                calcularHoras();
            });
            $(".agregar_turno").click(function () {
                var turno = $('#show_' + $(".nombre_dia_" + $(this).val()).val() + ' .tr-dia').size() + 1;
                var dia = $(".nombre_dia_" + $(this).val()).val();
                var agregar_turno = $('#show_' + dia);
                var text_html = '';
                var i = $(".dias_semana .tr-dia").size();
                text_html += '<tr class="tr-dia turno_' + (i + 1) + '" ><td>T' + turno;
                text_html += ' :</td><td><input type="text" style="width:40px;"   class="texto-h HORA_DESDE_' + dia + turno + '"   name="HORA_DESDE_' + dia + turno;
                text_html += '" value="00:00"  /></td><td><input type="text" style="width:40px;"   class="texto-h HORA_HASTA_' + dia + turno + '"  value="00:00" name="HORA_HASTA_' + dia + turno
                        + '" /><input type="hidden" name="DIA_' + dia + turno + '" class="nombre_dia_' + (i + 1) + '" value="' + dia + '" >';
                text_html += '<button type="button" class="btn btn-danger remover_turno" value="' + (i + 1) + '"><i class="fa  fa-minus-circle"></i></button></td></tr>';
                agregar_turno.append(text_html);
                $(".remover_turno").click(function () {
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
        //document.getElementById("nu_cuen_otros").readOnly = true;
        $("#texto").show();
        $("#generar").show();
        $("#subscription").attr("required", "required");
        $("#nu_cuen_otros").attr("required", "required");
        $("#nu_cuen_otros").removeAttr('maxlength');
        $("#nu_cuen_otros").removeAttr('minlength');
    }
    if (banco == '1') {
        $("#generar").hide();
        $("#no_cuen").show();
        $("#nu_cuen").val("");
        $("#nu_cuen").attr("required", "required");
        $("#no_cuen_ban").hide();
        $("#nu_cuen_ban").val("");
        $("#subscription").attr('checked', false);
        $("#nu_cuen").attr("maxlength", "21");
        $("#nu_cuen").attr("minlength", "19");
        // $("#nu_cuen").val("0011-")
        $("#no_cuen_otros").hide();
        $("#nu_cuen_otros").val("");
        $("#texto").hide();
    }
    if (banco == '2') {

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
    if (banco == '3') {
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
function listar_mensaje_plazo(tipo, warning, info, req) {
    $.post("../../plazo_dgp", "opc=Listar&tipo=" + tipo, function (objJson) {
        warning.empty();
        info.empty();
        var lista = objJson.lista;
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        for (var i = 0; i < lista.length; i++) {
            if (tipo == '2') {
                warning.append("<div class='alert alert-danger alert-block' ><a class='close' data-dismiss='alert' href='#'></a><h4 class='alert-heading'>" + lista[i].nom + "</h4>" + lista[i].det + " , Fecha Plazo " + lista[i].desde + " al " + lista[i].hasta + "</div>");
                info.append('<div class="alert alert-info fade in"><button class="close" data-dismiss="alert">×</button><i class="fa-fw fa fa-info"></i><strong>¡Importante!</strong> Su requerimiento será procesado en el mes de <strong>' + lista[i].mes + '.</strong></div>');
            } else if (tipo == '1') {
                // warning.append("<div class='alert alert-danger alert-block' ><a class='close' data-dismiss='alert' href='#'></a><h4 class='alert-heading'>" + lista[i].nom + "</h4>" + lista[i].det + " , se tiene " + lista[i].dias_tol + " dias de tolerancia para la fecha de inicio.</div>");
                info.append('<div class="alert alert-warning fade in"><button class="close" data-dismiss="alert"></button><i class="fa-fw fa fa-warning"></i><strong>¡Advertencia - Inicio de contrato!</strong> ' + lista[i].dias_tol + ' dias - plazo de envío respecto a la fecha de inicio' + '.</div>');
            }
        }
    });
}
function Listar_centro_costo1() {
    var x = $("#list-cc");
    $.post("../../centro_costo", "opc=Listar_centro_id_dgp&" + "id_dgp=" + $(".iddgp").val(), function (objJson) {
        if ($(".can_centro_cos").val() != 0) {
            //alert($(".iddgp").val());
            /*if (objJson.rpta == -1) {
             alert(objJson.mensaje);
             return;
             }*/
            var lista = objJson.lista;
            x.empty();
            var CANT_T = 0;
            var numero = 1;
            var texto = "";
            cant_act = lista.length;
            $(".cant-actualmente").val(cant_act);
            //alert(lista.length);
            texto += '<div class="row" ><section class="col col-1"><br><label  id="titu">Agregar:</label><br><label class="btn"><a type="button" style="padding:9%; padding-right:20%; padding-left:20%;" id="btn-agregar-cc2" class=" btn btn-default txt-color-green btn-agregar-cc"><i class="fa fa-plus fa-2x"></i></a></label></section><section class="col col-2"><label class="input" id="titulo">%:<input type="text" name="PORCENTAJE_TOTAL" max="100" min="100" maxlength="3"  class="input-group-sm por_sum_to" id="bo_a" readonly=""></label></section></div>';
            for (var i = 0; i < lista.length; i++) {

                numero = numero + i;
                if ($(".can_centro_cos").val() == "1") {
                    texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + (i + 1) + ':</label>';
                    texto += '<div  class="row centro-costo_' + ag + '" >';
                    texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '" id="cc-dir' + ag + '" readonly="readonly"  disabled><option value="">[DIRECCION]</option></select></label></section>';
                    texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '" readonly="readonly"  disabled><option value="">[DEPARTAMENTO]</option></select></label></section>';
                    texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required="" readonly="readonly"  disabled><option value="">[CENTRO COSTO]</option></select></label></section>';
                    texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ingr + '" value="' + lista[i].ca_por_cc + '"  type="text" required="" class="porcentaje_cc por-cen-' + ag + '" onkeyup="dar_valor($(this).val(),' + ag + ');"/><input type="hidden" name="porcent_ant_' + (i + 1) + '"  value="' + lista[i].ca_por_cc + '" class="porc' + ag + ' por-i" /></label> </section>';
                    texto += '<section class="col col-1" ><br><label class="btn"><button type="button" style="padding:9%; padding-right:20%; padding-left:20%;" value="' + ag + '" class=" btn btn-default txt-color-red remover' + ag + ' dis-total" onclick="Eliminar2($(this).val());"  disabled><i class="fa fa-minus fa-2x"></i></button></label></section>';
                    texto += '<input type="hidden" value="' + lista[i].id_det_ce + '" class="id_dcc' + ag + '" ><input type="hidden" name="id_d_cen_cos' + (i + 1) + '" value="' + lista[i].id_det_ce + '" ></div>';
                    var dir, dep, cc;
                    dir = lista[i].id_dir_cc;
                    dep = lista[i].id_dep_cc;
                    cc = lista[i].id;
                    listar_cc2(ag, dir, dep, cc);

                    /*texto += ('<section class="col col-4 cen-co-im' + i + '"><br><label class="select" id="titulo"> Centro costo Nº ' + numero + '<select name="select_cent_c_' + i + '" required="" class="input-group-sm selec' + i + '"><option value="' + lista[i].id_det_ce + '">' + lista[i].nombre + '</option></select></section><section class="col col-1 cen-co-im' + i + '" ><br><label class="btn"><button type="button" style="padding:9%; padding-right:20%; padding-left:20%;"value="' + i + '" class=" btn btn-default txt-color-red rem' + i + '" id="rem' + (i + 1) + '" onclick="Eliminar($(this).val());" disabled=""><i class="fa fa-minus fa-2x"></i></button></label></section>');
                     texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '"><option value="">[DIRECCION]</option></select></label></section>';
                     texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
                     texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';*/
                } else {
                    texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + (i + 1) + ':</label>';
                    texto += '<div  class="row centro-costo_' + ag + '" >';
                    texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '" id="cc-dir' + ag + '" readonly="readonly"  disabled><option value="">[DIRECCION]</option></select></label></section>';
                    texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '" readonly="readonly"  disabled><option value="">[DEPARTAMENTO]</option></select></label></section>';
                    texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ingr + '" class="centro_costo' + ag + '" required="" readonly="readonly"  disabled=""><option value="">[CENTRO COSTO]</option></select></label></section>';
                    texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ingr + '" value="' + lista[i].ca_por_cc + '"  type="text" required="" class="porcentaje_cc por-cen-' + ag + '" onkeyup="dar_valor($(this).val(),' + ag + ');"/><input type="hidden" name="porcent_ant_' + (i + 1) + '" value="' + lista[i].ca_por_cc + '" class="porc' + ag + ' por-i" /></label></section>';
                    texto += '<section class="col col-1" ><br><label class="btn"><button type="button" style="padding:9%; padding-right:20%; padding-left:20%;" value="' + ag + '" class=" btn btn-default txt-color-red remover' + ag + ' dis-total" onclick="Eliminar2($(this).val());" ><i class="fa fa-minus fa-2x"></i></button></label></section>';
                    texto += '<input type="hidden" value="' + lista[i].id_det_ce + '" class="id_dcc' + ag + '" ><input type="hidden" name="id_d_cen_cos' + (i + 1) + '" value="' + lista[i].id_det_ce + '" ></div>';
                    var dir, dep, cc;
                    dir = lista[i].id_dir_cc;
                    dep = lista[i].id_dep_cc;
                    cc = lista[i].id;
                    listar_cc2(ag, dir, dep, cc);
                    // texto += ('<section class="col col-4 cen-co-im' + i + '"><br><label class="select" id="titulo"> Centro costo Nº ' + numero + '<select name="select_cent_c_' + i + '" required="" class="input-group-sm selec' + i + '"><option value="' + lista[i].id_det_ce + '">' + lista[i].nombre + '</option></select></section><section class="col col-1 cen-co-im' + i + '" ><br><label class="btn"><button type="button" style="padding:9%; padding-right:20%; padding-left:20%;"value="' + i + '" class=" btn btn-default txt-color-red rem' + i + '" onclick="Eliminar($(this).val());"><i class="fa fa-minus fa-2x"></i></button></label></section>');
                }

                //listar_cc2(ag, lista[i].id_dir_cc, lista[i].id_dep_cc, lista[i].id);

                numero = 1;
                ag++;
                CANT_T = (CANT_T + parseFloat(lista[i].ca_por_cc));
            }
            x.append(texto);
            $('#btn-agregar-cc2').click(function () {
                agregar_centro_costo();
            });
            $(".por_sum_to").val(CANT_T);
        } else {
            remover_fil();
        }
    });
}
function list_cc_area(area, cc, dep) {
    // cc = $(".centro_costo1");
    $.post("../../centro_costo", "opc=Lista_cc_area&id=" + area, function (objJson) {
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length == 0) {
            //listarcc
        } else {
            for (var t = 0; t < lista.length; t++) {
                cc.empty();
                cc.append('<option value="">[SELECCIONE]</option>');
                cc.append('<option value="' + lista[t].id + '">' + lista[t].nombre + '</option>');
            }
        }
    });
}

function list_cc_seccion(seccion, cc) {
    // cc = $(".centro_costo1");
    $.post("../../centro_costo", "opc=Lista_cc_seccion&id=" + seccion, function (objJson) {
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length == 0) {
            /* si no ha nada listar todas las secciones del area*/
            // list_cc_area($(".select-area").val(), $(".centro_costo1"));
        } else {
            for (var t = 0; t < lista.length; t++) {
                cc.empty();
                cc.append('<option value="">[SELECCIONE]</option>');
                cc.append('<option value="' + lista[t].id + '">' + lista[t].nombre + '</option>');
            }
        }
    });
}
function dar_valor(caracter, num) {
    $(".porc" + num).val(caracter);
    var acum = 0;
    $.each($(".porcentaje_cc"), function () {
        acum = acum + parseFloat($(this).val());
    });
    $(".por_sum_to").val(acum);
}
$(document).ready(function () {
    pageSetUp();
    $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
        $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
    });

    mostrar();
    var lista_dgp = $(".btn-list-req");
    $.post("../../dgp", "opc=Listar_Req&idtr=" + $(".id_tr").val(), function (objJson) {
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length == 0) {
            lista_dgp.empty();
            lista_dgp.append('<option value="">[NO TIENE]</option>');
        } else {
            for (var t = 0; t < lista.length; t++) {
                lista_dgp.append('<option value="' + lista[t].id + '">' + lista[t].desc + '</option>');
            }
        }
    });
    lista_dgp.change(function () {
        $.post("../../dgp", "opc=Listar_Datos&idc=" + $(this).val(), function (objJson) {
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var lis_datos = objJson.lista;
            for (var v = 0; v < lis_datos.length; v++) {
                $("#sueldo").val(lis_datos[v].sueldo);
                $("#bono_al").val(lis_datos[v].bono_alimentario);
                $("#bev").val(lis_datos[v].bev);
                calcular_sueldo_total();
                $(".ant_policiales").val(lis_datos[v].ant_pol);
                $(".essalud").val(lis_datos[v].essalud);
                $("#banco").val(lis_datos[v].banco);
                cuenta_bancaria($("#banco").val());
                $("#nu_cuen_otros").val(lis_datos[v].banco_otros);
                $("#nu_cuen").val(lis_datos[v].cuenta);
                $("#nu_cuen_ban").val(lis_datos[v].cuenta_bancaria);
                $("#subscription").val(lis_datos[v].gen_cuenta);
            }
        });
        $.post("../../centro_costo", "opc=Cargar_cc_DGP&id_c=" + $(this).val(), function (objJson) {
            var lista = objJson.lista;
            for (var i = 0; i < lista.length; i++) {
                var dep_actual = $(".dep_actual").val();
                if (lista[i].id_dep == dep_actual) {
                    $(".centro_costo1").val(lista[i].id_cc);
                    $(".porcentaje_cc").val(lista[i].porcent_cc);
                } else {
                    var arr_cc = [lista[i].id_dir, lista[i].id_dep, "0", lista[i].porcent_cc, lista[i].id_cc];
                    agregar_centro_costo("1", arr_cc);
                }
            }
        });
        $("#horario").val("2");
        list_horario($("#horario").val());
    });
    $(".val_fe").change(function () {
        var fecha = $(this).val().split("-");
        if (fecha[0].length > 4) {
            $(this).val("");
        }
    });
    list_select($(".select-area"), "../../Direccion_Puesto", "opc=List_Area_RDGP", "3");
    $(".select-area").change(function () {
        list_select($(".select-seccion"), "../../Direccion_Puesto", "opc=Listar_sec2&id=" + $(".select-area").val(), "3");
        $(".select-seccion,.select-puesto").val("");
        $(".chosen-select").trigger("chosen:updated");
        /*Filtrar Centro de costo*/
        list_cc_area($(this).val(), $(".centro_costo1"));
    });
    $(".select-seccion").change(function () {
        list_select($(".select-puesto"), "../../Direccion_Puesto", "opc=Listar_pu_id&id=" + $(".select-seccion").val() + "&esL=1", "3");
        cargar_horarios($('.t_horario'));
        list_cc_seccion($(this).val(),$(".centro_costo1"));
    });
    $(".select-puesto").change(function () {
        $(".select-puesto1").val($(this).val());
        $(".chosen-select").trigger("chosen:updated");
    });
    $(".select-puesto1").change(function () {
        $(".select-area,.select-seccion,.select-puesto").val("");
        $(".chosen-select").trigger("chosen:updated");
    });
    $(".fe_inicio_dgp").change(function () {
        var fecha = $(this).val();
        $.post("../../dgp", "opc=Val_Fe_Inicio&fecha=" + fecha, function (objJson) {
            if (objJson.estado) {
                $.bigBox({
                    title: "¡Alerta de plazo no cumplido!",
                    content: "Si registra con esta fecha de inicio : " + fecha + ",  el requerimiento estara en fuera de plazo. ¡NECESITA HACER SOLICITUD AL TERMINAR REGISTRO!",
                    color: "#C79121",
                    icon: "fa fa-warning shake animated",
                    timeout: 3500
                            // number: "1",
                            //timeout: 15000
                });
            } else {
                $.bigBox({
                    title: "¡Plazo cumplido!",
                    content: "Con la fecha de inicio :" + fecha + " el plazo para este requerimiento se cumplirá.",
                    color: "#739E73",
                    icon: "fa fa-shield fadeInLeft animated",
                    timeout: 3500
                            // ,number: "1",
                            //timeout: 15000
                });
            }
        });
    });
    $('#checkout-form').validate({
        // Rules for form validation
        rules: {
            FEC_DESDE: {
                val_fecha: true
            },
            FEC_HASTA: {
                val_fecha: true
            },
            horas_totales: {
                required: true
            }
        },
        // Messages for form validation
        messages: {
            horas_totales: {
                max: 'Porfavor digite un horario que se menor a 48 Horas de Trabajo'
            },
            email: {
                required: 'Please enter your email address',
                email: 'Please enter a VALID email address'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        }
    });
    jQuery.validator.addMethod("val_fecha", function (value, element) {
        var d = value.split("-");
        return this.optional(element) || String(parseInt(d[0])).length == 4;
    }, "¡Fecha ingresada invalida!");

    // $("#alerta_dgp").hide();
    var b = $("#alerta_dgp");
    var info = $(".div_info");
    listar_mensaje_plazo("2", b, info);
    var s = $(".info_1");
    var t = $(".alert_1");
    listar_mensaje_plazo("1", t, s);
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
        });
    });
    $("#sueldo").keyup(function () {
        var sueldo = parseFloat($("#sueldo").val());
        $(".monto").val(Math.round(sueldo));
    });
    $("#sueldo").keyup(function () {
        calcular_sueldo_total();
    }
    );
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
    /*TEMPORAL*/
    //Planilla
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
    listar_tipo_horario();
    sumn_porcen_total();
    $("#no_cuen").hide();
    $("#no_cuen_ban").hide();
    $("#generar").hide();
    $("#no_cuen_otros").hide();
    //  var r = "";
    $('#btn-agregar-cc').click(function () {
        agregar_centro_costo();
    });
    $("#banco").change(function () {
        cuenta_bancaria($(this).val());
        $("#nu_cuen").focus();
        $("#es_cuenta").val(1);
        //  alert($("#es_cuenta").val());
    });
    listar_cc();
    $("#horario").change(
            function () {
                list_horario($(this).val());
            }
    );
    $("#sueldo").numeric();
    $("#bono_al").numeric();
    $("#bev").numeric();
    $("#nu_cuen").numeric();
    $("#nu_cuen_ban").numeric();
    // $(".texto-h").mask("99:99", {placeholder: "0"});
    /* $("#sueldo").mask("99999.99", {placeholder: "0"});
     $("#bono_al").mask("99999.99", {placeholder: "0"});
     $("#bev").mask("99999.99", {placeholder: "0"});*/
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