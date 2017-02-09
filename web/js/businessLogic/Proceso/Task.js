/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Listar_Paso(proceso) {
    var b = $(".tbodys");
    var c = $(".dd-list");
    var txt_append = "";
    var TaskValues = $(".TaskValues");
    var TaskValuesHtml = "";
    TaskValues.empty();
    $.post("../../paso", "opc=Listar_habilitados&proceso=" + proceso, function (objJson) {
        c.hide();
        b.empty();
        c.empty();
        var lista = objJson.lista;
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
       
        for (var i = 0; i < lista.length; i++) {
            txt_append += '<li class="dd-item dd3-item" ><div class="dd-handle dd3-handle">Drag</div><div class="dd3-content"><label class="item_req item_' + (i + 1) + '" style="font-size: 12px;">' + lista[i].num + ' </label> ' +
                    '<div class="pull-right"><button class="btn btn-primary btn-sm btn-cargar-puesto" value="' + i + '" ><i class="fa fa-eye" ></i></button></div>' +
                    '<div class="pull-right"><button class="btn btn-success btn-sm btn-editar" value="' + i + '" ><i class="fa fa-pencil" ></i></button></div>' +
                    '<div class="pull-right"><button class="btn btn-danger btn-sm btn-eliminar" value="' + i + '" ><i class="fa fa-times"></i></button></div>';
            if (typeof (lista[i].det) === "undefined") {
                txt_append += '<div class="pull-right"><label ></label></div>';
            } else {

                txt_append += '<div class="pull-right"><label style="font-size: 12px;">' + lista[i].det + '&nbsp;&nbsp;</label></div>';
            }
            TaskValuesHtml += '<input type="hidden"  value="' + lista[i].det + '"  class="det_p_' + i + '"/>' +
                    '<input type="hidden" name="id" value="' + lista[i].id + '"  class="id_paso' + i + '"/>' + '</div> </li>';
            TaskValuesHtml += '<input  type="hidden" value="' + lista[i].det + '" class="inp_det_' + i + '" />';
            TaskValuesHtml += '<input type="hidden" value="' + lista[i].num + '" class="inp_num_' + i + '" />';
            TaskValuesHtml += '<input type="hidden" value="' + lista[i].co + '" class="inp_co_' + i + '" />';
            TaskValuesHtml += '<input type="hidden" value="' + lista[i].proceso_id + '" class="inp_pro_id_' + i + '" />';
        }
        console.log(TaskValuesHtml)
        TaskValues.append(TaskValuesHtml);
        c.append(txt_append);
        c.slideDown(200);
        txt_append = "";
        $(".btn-cargar-puesto").click(function () {
            var num = $(this).val();
            $(".id_pasos_puesto").val($(".id_paso" + num).val());
            list_puesto(num);
            $(".num_p").val($(this).val());
        });
        $(".btn-editar").click(function () {
            $(".btn_cancel_edit").show();
            $(".desc_paso").val($(".det_p_" + $(this).val()).val().trim());
            $(".num_paso").val($(".inp_num_" + $(this).val()).val().trim());
            $(".co_paso").val($(".inp_co_" + $(this).val()).val());
            $("#select-proceso").val($(".inp_pro_id_" + $(this).val()).val());
            $(".id_p").val($(".id_paso" + $(this).val()).val());
            $(".btn-registrar").html('<i class="fa fa-check"></i>');
            $(".opc").val("Modificar");
        });
        $(".btn-eliminar").click(
                function () {
                    var pr_e = $("#select-proceso").val();
                    if (confirm("¿Esta Seguro de Eliminar?")) {
                        $.post("../../paso", "opc=Eliminar&paso=" + $(".id_paso" + $(this).val()).val(), function () {
                            Listar_Paso(pr_e);
                        });
                        //alert($(".id_paso" + $(this).val()).val());
                    } else {

                    }
                }
        );

    });
}

function initFormTaskProcess() {
    $(".btn_cancel_edit").click(function () {
        $("#btn-registrar").html('<i class="fa fa-plus"></i>');
        $(".opc").val("Registrar");
        $(".form-paso")[0].reset();
        $(this).hide();
    });
    $("#btn-registrar").click(function () {
        var pr = $("#select-proceso").val();
        if ($(".form-paso").valid()) {
            $.post("../../paso", $(".form-paso").serialize() + "&proceso=" + pr, function (objJson) {
                if (objJson.rpta === "-1") {
                    alert(objJson.mensaje);
                    return;
                } else {
                    Listar_Paso(pr);
                }
            });
            $("#btn-registrar").html('<i class="fa fa-plus"></i>');
            $(".opc").val("Registrar");
            //$(".form-paso")[0].reset();
        }

        return false;
    });
    $(".Generar").click(function () {
        //var num = $(".tbodys tr").size();
        var num = 1;
        var url = "";

        $.each($(".item_req"), function () {
            $(this).text("P" + num);
            num++;
        });
        for (var s = 1; s <= $(".dd-list .dd-item").size(); s++) {
            url += "id" + s + "=" + $(".id_paso" + (s - 1)).val() + "&numero" + s + "=" + $(".item_" + s).text() + "&";
            console.log(url)
        }
        url = url.substring(0, url.length - 1);
        $.post("../../paso", "opc=Update_nu_paso&num=" + num + "&" + url, function (objJson) {
            if (objJson.rpta === -1) {
                alert(objJson.mensaje);
                return;
            } else {
                Listar_Paso($("#select-proceso").val());
            }
        });
        //  alert(url);
        url = "";
        num = 1;

    });
}