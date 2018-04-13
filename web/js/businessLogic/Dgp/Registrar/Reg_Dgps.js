
function mostrar() {
    $(".cont_lun").hide();
    $(".cont_mar").hide();
    $(".cont_mie").hide();
    $(".cont_jue").hide();
    $(".cont_vie").hide();
    $(".cont_sab").hide();
    $(".cont_dom").hide();
    $("#select_lun").change(function () {
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
    $("#select_mar").change(function () {
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
    $("#select_mie").change(function () {
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
    $("#select_jue").change(function () {
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
    $("#select_vie").change(function () {
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
    $("#select_sab").change(function () {
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
    $("#select_dom").change(function () {
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
    console.log(f);
    if (f > 0) {
        v = v + 93;
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
        $("#nu_cuen").attr("minlength", "18");
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
function dar_valor(caracter, num) {
    $(".porc" + num).val(caracter);
    var acum = 0;
    $.each($(".porcentaje_cc"), function () {
        acum = acum + parseFloat($(this).val());
    });
    $(".por_sum_to").val(acum);
}
function showEsDiezmo() {
    var obj = $(".div_input_diezmo");
    obj.hide(100);
    obj.empty();
    $.ajax({
        url: "../../trabajador", data: "opc=ShowEsDiezmoTrabajador&id=" + $(".idtr").val(), type: 'POST', success: function (data, textStatus, jqXHR) {
            if (data.rpta) {
                obj.append(data.html);
                obj.show(100);
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
                                        }
                                    }
                                });
                            }
                            showEsDiezmo();
                        }
                    });
                    return false;
                });
            }
        }
    });
}
function RegDGPAditionalPermissions() {
    $.ajax({
        url: "../../dgp", type: 'POST', data: "opc=RegDGPAditionalPermissions",
        success: function (data, textStatus, jqXHR) {
            if (data.filterAnyJobs) {
                var aditionalFilters = $(".aditionalFilters");
                aditionalFilters.append(data.filterAnyJobsHTML);
                /*load data and events*/
                list_select($(".selectDireccion"), "../../Direccion_Puesto", "opc=Listar_direccion", "3");
                $(".selectDireccion").change(function () {
                    list_select($(".selectDepartamento"), "../../Direccion_Puesto", "opc=Listar&id_dir=" + $(".selectDireccion").val(), "3");
                    $(".selectDepartamento .select-area .select-seccion,.select-puesto").val("");
                    $(".chosen-select").trigger("chosen:updated");
                });
                $(".selectDepartamento").change(function () {
                    list_select($(".select-area"), "../../Direccion_Puesto", "opc=Listar_area2&id=" + $(".selectDepartamento").val(), "3");
                    $(".select-area .select-seccion,.select-puesto").val("");
                    $(".chosen-select").trigger("chosen:updated");
                    //evaluar presupuesto de Departamento
                    //evaluarPresupuesto($(".selectDepartamento").val());
                    console.log("ready!");
                    loadPresupuesto($(".selectDepartamento").val(), 2);
                });
                initJobsFilters(data.filterAnyJobs);
            } else {
                /*init traditional filters*/
                initJobsFilters(data.filterAnyJobs);
            }
        }
    });
}


/*function evaluarPresupuesto(idDestino) {
 $("#idDestino").attr("value", idDestino);
 try {
 var psaldo = 0;
 var psntra = 0;
 var url = '../../pres?opc=actual';
 var data = 'idDes=' + idDestino;
 $.ajax(url, {
 data: data,
 type: 'POST',
 async: false,
 success: function (objJson) {
 var tipo = "";
 var mensaje = "";
 var d = objJson.datos;
 if (d.length > 0) {
 psaldo = d[0].sbasico + d[0].afamiliar + d[0].bonoal + d[0].bonificacion; //saldo presupuestado
 psntra = d[0].ntrabajadores; //trabajadores presupuestados
 var pt = 0;
 //constratos realizados
 var pmonto = 0;
 var pntra = 0;
 var url = '../../pres?opc=comp';
 var data = 'idDes=' + idDestino;
 $.ajax(url, {
 data: data,
 type: 'POST',
 async: false,
 success: function (objJson) {
 var dinero = 0;
 var s = objJson.datos;
 pmonto = s[0].monto; //monto gastado
 pntra = s[0].ntrabajadores; //trabajadores contratados
 if (pmonto !== 0 & pntra !== 0) {//Presupuesto usado
 
 pt = pntra / psntra;
 pt = pt * 100;
 if (0 <= pt && pt < 25) {
 tipo = "success";
 }
 if (25 < pt && pt < 50) {
 tipo = "info";
 }
 if (50 < pt && pt < 75) {
 tipo = "warning";
 }
 if (75 < pt && pt <= 100) {
 tipo = "danger";
 }
 dinero = pmonto;
 
 } else {//Presupuestado pero no usado
 tipo = "success";
 pt = 100;
 dinero = psaldo;
 }
 mensaje = "<strong>" + pntra + "</strong> trabajadores contratados de <strong>" + psntra + "</strong> presupuestados en esta Area";
 mensaje += "<br/><strong>$ " + dinero + "</strong> disponibles en el presupuesto de esta Area";
 createAlert(mensaje, pt, tipo);
 }
 });
 } else {//No Presupuestado
 tipo = "danger";
 mensaje = "No se ha presupuestado este Destino";
 pt = 0;
 createAlert(mensaje, pt, tipo);
 }
 }
 });
 } catch (e) {
 console.error("Error al evaluar presupuesto" + e);
 }
 }*/

function createAlert(mensaje, por, tipo) {
    var s = '<div class="col-md-12" id="contAll">';
    s += '<div class="col-md-6" id="contMen">';
    s += mensaje;
    s += '</div>';
    s += '<div class="col-md-6" id="contBar">';
    s += '<div class="progress">';
    s += '<div class="progress-bar progress-bar-' + tipo + ' progress-bar-striped active" role="progressbar" aria-valuenow="' + por + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + por + '%">';
    s += Math.round(por) + "%";
    s += '</div>';
    s += '</div>';
    s += '</div>';
    s += '</div>';

    $("#presC").empty();
    $("#presC").attr("class", "alert alert-" + tipo + " col-sm-12 col-md-12 col-lg-6");
    $("#presC").append(s);

}

function createLoader(load) {
    var s = '<div class="progress">';
    s += '<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
    s += '<span class="sr-only">' + load + '% Complete</span>';
    s += '</div>';
    s += '</div>';
    return s;
}

var idPresupuesto;
var idDetPres;
var idPrePuesto;

function loadPresupuesto(idDestino, destino) {
    console.log(idDestino, destino);
    var url = "";
    var data = "";
    if (destino === 2) {
        url = "../../pres?opc=comp";
        data = "idDes=" + idDestino;
        data += "&dest=" + destino;
        data += "&idreq=" + $('#nom_req').val();
        $.ajax(url, {
            data: data,
            type: 'POST',
            async: false,
            success: function (obj) {
                var ntrad = parseInt(obj.ntrad);
                if (ntrad > 0) {
                    createAlertExist(destino, obj);
                } else {
                    createAlertNoExist(destino);
                    //disabledNext();
                }
            }
        });
    } else if (destino === 1) {
        url = "../../pres?opc=comp";
        data = "idDes=" + idDestino;
        data += "&dest=" + destino;
        data += "&idreq=" + $('#nom_req').val();
        $.ajax(url, {
            data: data,
            type: 'POST',
            async: false,
            success: function (obj) {
                idPresupuesto = obj.idpres;
                if (obj.iddetpres !== null) {
                    idDetPres = obj.iddetpres;
                }
                console.log(idPresupuesto);
                var ntrad = parseInt(obj.ntrad);
                if (ntrad > 0) {
                    createAlertExist(destino, obj);
                } else {
                    createAlertNoExist(destino);
                }
            }
        });
    } else if (destino === 3) {
        console.log(idDestino);
        url = "../../pres?opc=comp";
        data = "idpuesto=" + idDestino;
        data += "&dest=" + destino;
        data += "&iddetp=" + idDetPres;
        data += "&idreq=" + $('#nom_req').val();
        $.ajax(url, {
            data: data,
            type: 'POST',
            async: false,
            success: function (obj) {
                if (obj.detpuesto['NO_PUESTO'] != null) {
                    idPrePuesto = obj.detpuesto['ID_PRESUPUESTO_PUESTO'];
                    createAlertExist(destino, obj);
                } else {
                    createAlertNoExist(destino);
                }
            }
        });
    }

}

function createAlertNoExist(destino) {
    var d;
    var s;
    if (destino === 2) {
        $("#presC").empty();
        d = "este Departamento";
        s = '<div class="alert alert-warning">';
        s += '<strong>Atención!</strong>, no se ha presupuestado aún ' + d + '.';
        s += '</div>';
        $("#presC").append(decodeURIComponent(escape(s)));
    }
    if (destino === 1) {
        d = "este Área";
        console.log(($("#presCA").length == 0));
        if ($("#presCA").length == 0) {
            s = '<div id="presCA" class="alert alert-warning">';
            s += '<strong>Atención!</strong>, no se ha presupuestado aún ' + d + '.';
            s += '</div>';
            $("#presC").append(decodeURIComponent(escape(s)));
        } else {
            $("#presCA").empty();
            $("#presCA").attr("class", "alert alert-warning");
            s = '<strong>Atención!</strong>, no se ha presupuestado aún ' + d + '.';
            $("#presCA").append(decodeURIComponent(escape(s)));
        }
    }
    if (destino === 3) {
        d = "este Puesto";
        console.log(($("#presCP").length == 0));
        if ($("#presCP").length == 0) {
            s = '<div id="presCP" class="alert alert-warning">';
            s += '<strong>Atención!</strong>, no se ha presupuestado aún ' + d + '.';
            s += '</div>';
            $("#presC").append(decodeURIComponent(escape(s)));
        } else {
            $("#presCP").empty();
            $("#presCP").attr("class", "alert alert-warning");
            $("#presDP").empty();
            s = '<strong>Atención!</strong>, no se ha presupuestado aún ' + d + '.';
            $("#presCP").append(decodeURIComponent(escape(s)));
        }
    }
}

function createAlertExist(destino, obj) {
    var s = "";
    var info = "";
    console.log(obj);

    var load = calculatePorcent(parseInt(obj.ntrad), parseInt(obj.ntrac));
    var tipo = TipPresupuesto(load);
    if (destino === 1 | destino === 2) {
        var d;
        if (destino === 2) {
            $("#presC").empty();
            d = "Departamento";
            s += '<div class="alert alert-' + tipo + '">';
            s += '<strong>Presupuesto Actual: </strong>' + d + '';
            s += '<br/>';
            s += '<strong>' + obj.ntrac + '</strong> trabajadores contratados de los <strong>' + obj.ntrad + '</strong> trabajadores presupuestados bajo el mismo requerimiento';
            s += '<br/>';
            s += '<div class="progress">';
            s += '<div class="progress-bar progress-bar-striped progress-bar-' + tipo + ' active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
            s += load + '%';
            s += '</div>';
            s += '</div>';
            s += '</div>';
            $("#presC").append(decodeURIComponent(escape(s)));
        }
        if (destino === 1) {
            d = "Área";
            info = '<strong>Presupuesto Actual: </strong>' + d;
            info += '<br/>';
            info += '<strong>' + obj.ntrac + '</strong> trabajadores contratados de los <strong>' + obj.ntrad + '</strong> trabajadores presupuestados bajo el mismo requerimiento';
            info += '<br/>';
            info += '<div class="progress">';
            info += '<div class="progress-bar progress-bar-striped progress-bar-' + tipo + ' active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
            info += load + '%';
            info += '</div>';
            info += '</div>';
            if ($("#presCA").length == 0) {
                s += '<div id="presCA" class="alert alert-' + tipo + '">';
                s += info;
                s += '</div>';
                $("#presC").append(decodeURIComponent(escape(s)));
            } else {
                $("#presCA").attr('class', 'alert alert-' + tipo + '');
                $("#presCA").empty();
                s = info;
                $("#presCA").append(decodeURIComponent(escape(s)));
            }
        }
        if (obj.ntrad > obj.ntrac) {
        } else {
            //disabledNext();
        }
    }
    if (destino === 3) {
        d = "Puesto - " + obj.detpuesto.NO_PUESTO;
        load = calculatePorcent(parseInt(obj.detpuesto.N_TRABAJADORES), parseInt(obj.ntrac));
        console.log(load);
        tipo = TipPresupuesto(load);


        if ($("#presCP").length == 0) {
            s = '<div id="presCP" class="alert alert-' + tipo + '">';
            s += '<strong>Presupuesto Actual: </strong>' + d;
            s += '<br/>';
            s += '<strong>' + obj.ntrac + '</strong> trabajadores contratados de los <strong>' + obj.detpuesto.N_TRABAJADORES + '</strong> trabajadores presupuestados bajo el mismo requerimiento.';
            if (obj.detpuesto.N_TRABAJADORES > obj.ntrac) {
                $('.btnSig').attr("disabled", false);
                $(".btnPresModal").hide();
            } else {
                s += ' Se ha llegado al límite.';
                disabledNext();
                $(".btnPresModal").show();
                loadModalSolPres();
            }
            s += '<br/>';
            s += '<div class="progress">';
            s += '<div class="progress-bar progress-bar-striped progress-bar-' + tipo + ' active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
            s += load + '%';
            s += '</div>';
            s += '</div>';
            s += '</div>';
            s += '<div id="presDP" class="alert alert-info">';
            s += '<strong>Detalles: </strong>';
            s += '<br/>';
            s += '<div class="row"><div class="col-lg-6 col-sm-12">\n\
                    <strong>Sueldo Máx.: </strong><label>' + obj.detpuesto.SUELDO_MAX + '</label><br/>\n\
                    <strong>Sueldo Min.: </strong><label>' + obj.detpuesto.SUELDO_MIN + '</label><br/>\n\</div>';
            s += '<div class="col-lg-6 col-sm-12">\n\
                    <strong>Bonificaciones Máx.: </strong><label>' + obj.detpuesto.BONO_MAX + '</label><br/>\n\
                    <strong>Bonificaciones Min.: </strong><label>' + obj.detpuesto.BONO_MIN + '</label><br/>\n\</div>';
            s += '<div class="col-lg-6 col-sm-12">\n\
                    <strong>Bono Alimenticio Máx.: </strong><label>' + obj.detpuesto.BOAL_MAX + '</label><br/>\n\
                    <strong>Bono Alimenticio Min.: </strong><label>' + obj.detpuesto.BOAL_MIN + '</label><br/>\n\</div><div/>';
            s += '</div>';
            $("#presC").append(decodeURIComponent(escape(s)));
        } else {
            $("#presCP").attr('class', 'alert alert-' + tipo + '');
            s = '<strong>Presupuesto Actual: </strong>' + d;
            s += '<br/>';
            s += '<strong>' + obj.ntrac + '</strong> trabajadores contratados de los <strong>' + obj.detpuesto.N_TRABAJADORES + '</strong> trabajadores presupuestados bajo el mismo requerimiento.';
            if (obj.detpuesto.N_TRABAJADORES > obj.ntrac) {
                $('.btnSig').attr("disabled", false);
                $(".btnPresModal").hide();
            } else {
                s += ' Se ha llegado al límite.';
                //disabledNext();
                loadModalSolPres();
                $(".btnPresModal").show();
            }
            s += '<br/>';
            s += '<div class="progress">';
            s += '<div class="progress-bar progress-bar-striped progress-bar-' + tipo + ' active" role="progressbar" aria-valuenow="' + load + '" aria-valuemin="0" aria-valuemax="100" style="width: ' + load + '%">';
            s += load + '%';
            s += '</div>';
            s += '</div>';
            $("#presCP").empty();
            $("#presCP").append(decodeURIComponent(escape(s)));
            s = '<strong>Detalles: </strong>';
            s += '<br/>';
            s += '<div class="row"><div class="col-lg-6 col-sm-12">\n\
                    <strong>Sueldo Máx.: </strong><label>' + obj.detpuesto.SUELDO_MAX + '</label><br/>\n\
                    <strong>Sueldo Min.: </strong><label>' + obj.detpuesto.SUELDO_MIN + '</label><br/>\n\</div>';
            s += '<div class="col-lg-6 col-sm-12">\n\
                    <strong>Bonificaciones Máx.: </strong><label>' + obj.detpuesto.BONO_MAX + '</label><br/>\n\
                    <strong>Bonificaciones Min.: </strong><label>' + obj.detpuesto.BONO_MIN + '</label><br/>\n\</div>';
            s += '<div class="col-lg-6 col-sm-12">\n\
                    <strong>Bono Alimenticio Máx.: </strong><label>' + obj.detpuesto.BOAL_MAX + '</label><br/>\n\
                    <strong>Bono Alimenticio Min.: </strong><label>' + obj.detpuesto.BOAL_MIN + '</label><br/>\n\</div><div/>';
            $("#presDP").empty();
            $("#presDP").append(decodeURIComponent(escape(s)));
        }
    }
}
$(".btnPresModal").click(function () {
    loadModalSolPres();
});

$("#spbtn").click(function () {
    $.ajax("../../pres?opc=regSFP", {
        data: {
            idpp: idPrePuesto,
            ntra: $("#sntra").val(),
            com: $("#scom").val()
        },
        type: 'POST',
        async: false,
        success: function (data) {
            if (data.obj) {
                new PNotify({
                    title: 'Genial!',
                    text: 'Ya enviamos tu solicitud, puedes verlo en Estado de Solicitudes en la Sección de Presupuesto y asegurarte si lo autorizan para que puedas continuar con la contratación.',
                    type: 'success'
                });
                $("#solPresModal").modal('hide');
                setTimeout(function () {
                    window.location.href = "../../pres?opc=solfpview";
                }, 3000);

            } else {
                new PNotify({
                    title: 'Oh no!',
                    text: 'Hubo un problema, nuestros ingenieros están trabajando para solucionarlo. Por favor inténtalo de nuevo.',
                    type: 'warning'
                });
                $("#solPresModal").modal('hide');
            }
        }
    });
});

//Mostrar el modal para solicitar ampliación del presupuesto
function loadModalSolPres() {
    $("#spdep").text($(".selectDepartamento option:selected").text());
    $("#spare").text($(".select-area option:selected").text());
    $("#sppto").text($(".select-puesto option:selected").text());
    //alert($(".select_req option:selected").text());
    $("#spreq").text($("#nom_req option:selected").text());
    $.ajax("../../pres?opc=getTempByIdPres", {
        data: {
            idp: idPresupuesto
        },
        type: 'POST',
        async: false,
        success: function (obj) {
            console.log(obj);
            var detT = obj.detTemp;
            $("#sptem").text(detT.NOMBRE_TEMP + " > " + detT.FECHA_INICIO + " - " + detT.FECHA_FIN);
        }
    });
    $("#solPresModal").modal('show');
    //$("#spare").text($(".select-area option:selected").text());
    //$("#spare").text($(".select-area option:selected").text());
}

function TipPresupuesto(porcentaje) {
    var percent = parseInt(porcentaje);
    var tipo = "";
    if (percent > 0) {
        if (percent <= 25) {
            tipo = "success";
        } else {
            if (percent <= 50) {
                tipo = "info";
            } else {
                if (percent <= 75) {
                    tipo = "warning";
                } else {
                    tipo = "danger";
                }
            }
        }
    } else {
        tipo = "success";
    }
    return tipo;
}

function calculatePorcent(tpresup, tcon) {
    var por = tcon * 100 / tpresup;
    return por.toFixed(2);
}

function disabledNext() {
    $('.btnSig').attr("disabled", true);
}

function  initJobsFilters(aditionalFIlters) {
    if (!aditionalFIlters) {
        list_select($(".select-area"), "../../Direccion_Puesto", "opc=List_Area_RDGP", "3");
    }

    $(".select-area").change(function () {
        list_select($(".select-seccion"), "../../Direccion_Puesto", "opc=Listar_sec2&id=" + $(".select-area").val(), "3");
        $(".select-seccion,.select-puesto").val("");
        $(".chosen-select").trigger("chosen:updated");
        /*Filtrar Centro de costo*/
        //list_cc_area($(this).val(), $(".centro_costo1"));
        //actualPresupuesto($(".select-area").val());
        //evaluarPresupuesto($(".select-area").val());
        loadPresupuesto($(".select-area").val(), 1);
    });
    $(".select-seccion").change(function () {
        list_select($(".select-puesto"), "../../Direccion_Puesto", "opc=Listar_pu_id&id=" + $(".select-seccion").val() + "&esL=1", "3");
        cargar_horarios($('.t_horario'));
        //list_cc_seccion($(this).val(), $(".centro_costo1"));
    });
    $(".select-puesto").change(function () {
        $(".select-puesto1").val($(this).val());
        $(".chosen-select").trigger("chosen:updated");
        loadPresupuesto($(".select-puesto").val(), 3);
    });
    $(".select-puesto1").change(function () {
        $(".select-area,.select-seccion,.select-puesto").val("");
        $(".chosen-select").trigger("chosen:updated");
    });
}
$(document).ready(function () {
    pageSetUp();
    $(".btnPresModal").hide();
    $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
        $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
    });
    $("#bono_pu").numeric();
    $("#sueldo").numeric();
    $("#bono_al").numeric();
    $("#bev").numeric();
    $("#nu_cuen").numeric();
    $("#nu_cuen_ban").numeric();
    showEsDiezmo();
    mostrar();
    RegDGPAditionalPermissions();
    // $("#alerta_dgp").hide();
    var b = $("#alerta_dgp");
    var info = $(".div_info");
    listar_mensaje_plazo("2", b, info);
    var s = $(".info_1");
    var t = $(".alert_1");
    listar_mensaje_plazo("1", t, s);
    var lista_dgp = $(".btn-list-req");
    $.post("../../dgp", "opc=Listar_Req&idtr=" + $(".id_tr").val(), function (objJson) {
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length === 0) {
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
                    AddCentroCosto("1", arr_cc);
                }
            }
        });
        $("#horario").val("2");
        list_horario($("#horario").val());
    });
    $(".val_fe").change(function () {
        var fecha = $(this).val().split("-");
        if (fecha[0].length > 10) {
            $(this).val("");
        }
    });
    $(".feInicioDgp").change(function () {
        var fecha = $(this).val();
        AlertCumplimientoPlazo_Fecha(fecha);
    });
    $('#checkout-form').validate({
// Rules for form validation
        rules: {
            FEC_DESDE: {
//  val_fecha: true
            },
            FEC_HASTA: {
                //   val_fecha: true
            },
            horas_totales: {
                required: true
            },
            IDPUESTO:{
                required: true
            }
        },
        // Messages for form validation
        messages: {
            horas_totales: {
                max: 'Porfavor digite un horario que se menor a 48 Horas de Trabajo'
            },
            IDPUESTO:{
                required:'Hey! necesitamos que selecciones un puesto para este trabajador.'
            }
        },
        // Do not change code below
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        }
    });
    /*  jQuery.validator.addMethod("val_fechas", function (value, element) {
     var d = value.split("/");
     return this.optional(element) || String(parseInt(d[0])).length == 4;
     }, "¡Fecha ingresada invalida!");*/

    var cantidad = 1;
    $("#btn_add").click(function () {
        var agregar = $('.agregar_cuota');
        var texto = "";
        cantidad++;
        texto += '<div class="row pago_cuotas_' + cantidad + '">';
        texto += '<section class="col col-3" ><label class="input" id="titu">';
        texto += '<input type="number" name="CUOTA_' + cantidad + '" id="cuota" required="" value="' + cantidad + '" min="1" >';
        texto += '</label></section>';
        texto += '<section class="col col-3" ><label class="input" id="titu">';
        texto += '<input type="date" name="FEC_PAGAR_' + cantidad + '" id="datepicker" required="" >';
        texto += '</label></section>';
        texto += '<section class="col col-3" ><label class="input" id="titu">';
        texto += '<input type="text" name="MONTO_' + cantidad + '" required="" class="monto" >';
        texto += '</label></section>';
        texto += '<section class="col col-3"><label>';
        texto += '<button type="button" class="btn btn-danger btn-circle btn-lg eliminar' + cantidad + '" id="btn_add"><i class="glyphicon glyphicon-remove"></i></button>';
        texto += '</label>';
        texto += '</section>';
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
    $("#no_cuen").hide();
    $("#no_cuen_ban").hide();
    $("#generar").hide();
    $("#no_cuen_otros").hide();
    //  var r = "";
    $('#btn-agregar-cc').click(function () {
        AddCentroCosto("0");
    });
    $("#banco").change(function () {
        cuenta_bancaria($(this).val());
        $("#nu_cuen").focus();
        $("#es_cuenta").val(1);
        //  alert($("#es_cuenta").val());
    });
    /*sumn_porcen_total();*/
    listar_cc();
    $("#horario").change(
            function () {
                list_horario($(this).val());
            }
    );
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
