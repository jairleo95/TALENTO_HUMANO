/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// DO NOT REMOVE : GLOBAL FUNCTIONS!
function  list_put_id(d, valor) {
    $.post("../../Direccion_Puesto", "opc=" + "Listar_pu_id" + "&" + "id=" + valor, function (objJson) {
        d.empty();
        d.append("<option value='' > [Seleccione] </option>");
        var list = objJson.lista;
        if (list.length !== 0) {
            for (var i = 0; i < list.length; i++) {
                d.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
            }
        } else {
            d.append("<option value='0' > [] </option>");
        }
    });
}
function  lis_dir_id(d, valor) {
    $.post("../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + valor, function (objJson) {
        d.empty();
        d.append("<option value='' > [Seleccione] </option>");
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var list = objJson.lista;
        if (list.length !== 0) {
            for (var i = 0; i < list.length; i++) {
                d.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
            }
        } else {
            d.append("<option value='' > [] </option>");
        }
    });
}
function list_area_id(c, valor) {
    $.post("../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + valor, function (objJson) {
        c.empty();
        c.append("<option value='' > [Seleccione] </option>");
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var list = objJson.lista;
        if (list.length !== 0) {
            for (var i = 0; i < list.length; i++) {
                c.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
            }
        } else {
            c.append("<option value='' > [] </option>");
        }
    });
}
function list_sec_id(d, valor) {
    $.post("../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + valor, function (objJson) {
        d.empty();
        d.append("<option value='' > [Seleccione] </option>");
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var list = objJson.lista;
        if (list.length !== 0) {
            for (var i = 0; i < list.length; i++) {
                d.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
            }
        } else {
            d.append("<option value='' > [no hay] </option>");
        }
    });
}
function list_dir(c) {
    $.post("../../Direccion_Puesto", "opc=Listar_direccion", function (objJson) {
        c.empty();
        c.append("<option value='' > [Seleccione] </option>");
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var list = objJson.lista;
        if (list.length !== 0) {
            for (var i = 0; i < list.length; i++) {
                c.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
            }
        } else {
            c.append("<option value='0' > [] </option>");
        }
    });
}


function list_puesto(num) {
    $(".lb-list_puesto").text($(".det_p_" + num).val());
    var tbody_p = $(".tbody-puesto");
    var texto = "";
    $(".id_pasos").val($(".id_paso" + num).val());
    $.post("../../paso", "opc=Paso_Puesto&id=" + $(".id_paso" + num).val(), function (objJson) {
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        tbody_p.empty();
        var lista = objJson.lista;
        for (var h = 0; h < lista.length; h++) {
            if (lista[h].estado === '0') {
                texto += "<tr class='danger' >";
            } else if (lista[h].estado === '1') {
                texto += "<tr class='success' >";
            }

            texto += "<td>" + lista[h].puesto + "</td>";
            texto += "<td>" + lista[h].area + "</td>";
            texto += "<td>" + lista[h].dep + "</td>";
            texto += "<td>" + lista[h].direccion + "</td>";
           /* if (lista[h].estado === '0') {
                texto += "<td>Deshabilitado</td>";
            } else if (lista[h].estado === '1') {
                texto += "<td>Habilitado</td>";
            }*/
            texto += "<td><input type='hidden' class='iddp" + h + "' value='" + lista[h].idpp + "' />";
            if (lista[h].estado === '1') {
                texto += "<button class='btn btn-warning btn_deshabilitar_p' value='" + h + "'>Deshabilitar</button></td>";
            } else {
                texto += "<button class='btn btn-success btn_habilitar_p' value='" + h + "' style='width: 98%'>Habilitar</button></td>";
            }
            texto += "<td><button type='button' value='" + h + "' class='btn btn-danger btn-eliminar_puesto'><i class='fa fa-times'></i></button></td>";
            texto += "</tr>";
        }
        tbody_p.append(texto);
        texto = "";
        $(".form_puesto").show();
        $(".btn-eliminar_puesto").click(function () {
            var $this = $(this).val();
            if (confirm("¿Esta Seguro de Eliminar?")) {
                alert("opc=Eliminar_PP&id=" + $(".iddp" + $this).val());
                $.post("../../paso", "opc=Eliminar_PP&id=" + $(".iddp" + $this).val(),
                        function (objJson) {
                            console.log("value:" + $this);
                            list_puesto($this - 1);
                        });
            }
        });
        $(".btn_deshabilitar_p").click(function () {
            $.post("../../paso", "opc=actualizar_estado&id=" + $(".iddp" + $(this).val()).val() + "&estado=0", function (objJson) {
                if (objJson.rpta === -1) {
                    alert(objJson.mensaje);
                    return;
                } else {
                    alert("El puesto para este paso se ha deshabilitado correctamente...");
                    list_puesto($(".num_p").val());
                }
            });
        });
        $(".btn_habilitar_p").click(function () {
            $.post("../../paso", "opc=actualizar_estado&id=" + $(".iddp" + $(this).val()).val() + "&estado=1", function (objJson) {
                if (objJson.rpta === -1) {
                    alert(objJson.mensaje);
                    return;
                } else {
                    alert("El puesto para este paso se ha habilitado correctamente...");
                    list_puesto($(".num_p").val());
                }
            });
        });

    });
}



function initFormPuestoTask() {
    $(".form_puesto").hide();
    list_dir($(".sl_dir"));
    $(".sl_dir").change(function () {
        lis_dir_id($(".sl_dep"), $(this).val());
    });
    $(".sl_dep").change(function () {
        list_area_id($(".sl_area"), $(this).val());
    });
    $(".sl_area").change(function () {
        list_sec_id($(".sl_sec"), $(this).val());
    });
    $(".sl_sec").change(function () {
        list_put_id($(".sl_puesto"), $(this).val());
    });
    // var num = 1;
    $(".btn-agregar-p").click(function () {
        if ($(".form_puesto").valid()) {
            $.ajax({
                url: "../../Direccion_Puesto",
                data: $(".form_puesto").serialize() + "&opc=Reg_puesto_paso"
            }).done(function () {
                list_puesto($(".num_p").val());
                // alert("¡Registrado Exitosamente!");
            }).fail(function (objJson) {
                alert(objJson.mensaje);
            });
        } else {
            alert("Completar campos requeridos...");
        }
        ///alert($(".sl_puesto").val());
    });
}