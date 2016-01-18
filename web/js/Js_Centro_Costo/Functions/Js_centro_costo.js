function listar_centro_costo(x, opc, arr_cc) {
    var centro_costo = $(".centro_costo" + x);
    $.post("../../centro_costo?opc=Listar_CC", "&id_dep=" + $(".cc-dep" + x).val(), function (objJson) {
        centro_costo.empty();
        centro_costo.append("<option value=''>[CENTRO COSTO]</option>");
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (opc === "1") {
                if (arr_cc[4] === lista[i].id) {
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
function AddCentroCosto(opc) {
    var agregar = $('#fila-agregar');
    var ag = contarElementosCC();
    ag++;
    var texto = "";
    texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo N&deg; ' + ag + ':</label>';
    texto += '<div  class="row centro-costo_' + ag + '" >';
    texto += '<section class="col col-3"><label class="select" id="titu">Direcci&oacute;n :<select required="" class="cc-dir' + ag + '"><option value="">[DIRECCION]</option></select></label></section>';
    texto += '<section class="col col-3"><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '"><option value="">[DEPARTAMENTO]</option></select></label></section>';
    texto += '<section class="col col-3"><label class="select" id="titu"> Area :<select required=""  class="cc-area' + ag + '"><option value="">[AREA]</option></select></label></section>';
    texto += '<section class="col col-3"><label class="select" id="titu"> Secci&oacute;n :<select required=""  class="cc-seccion' + ag + '"><option value="">[SECCION]</option></select></label></section>';
    texto += '<section class="col col-3"><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ag + '" class="centro_costo' + ag + '" required=""><option value="">[CENTRO COSTO]</option></select></label></section>';
    /*se condiciona con 1 para separar los datos antiguos de los agregados recientemente*/
    if (opc === "1") {
        texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ag + '"  min="0" value=""  type="text" required="" class="porcentaje_cc porcentaje_nuevo"/></label></section>';
        texto += '<section class="col col-3" ><button type="button" class="btn btn-danger btn-circle btn-lg remover_edit" value="' + ag + '" ><i class="glyphicon glyphicon-remove"></i></button></section>';
        texto += '</div>';

        /**editar/
         /*agregar atributos*/
        /*agrgar_atrib(ag - 1);
         agrgar_atrib_rem_t();*/

        // agregar.hide();
        agregar.append(texto);
        //agregar.show('blind');
        listar_cc_mod(ag);
        /*contar cantidad nueva y cantidad registrada*/
        $(".cant-ing").val($(".porcentaje_nuevo").size());
        $(".can_centro_cos").val($(".cc_registrado").size());

    } else if (opc === "0") {
        texto += '<section class="col col-3"><label class="input" id="titu">%<input name="PORCENTAJE_' + ag + '"  min="0"   type="text" required="" class="porcentaje_cc"/></label></section>';
        texto += '<section class="col col-3" ><button type="button" class="btn btn-danger btn-circle btn-lg remover" value="' + ag + '" ><i class="glyphicon glyphicon-remove"></i></button></section>';
        texto += '</div>';
        agregar.hide();
        agregar.append(texto);
        agregar.show('blind');
        /*Listar centro de costo*/
        listar_cc(ag);
        actualizar_porcentaje();

    }
    var objPorcentaje_item = $(".porcentaje_cc");
    actualizar_porcentaje();
    $(".cant-input").val(contarElementosCC());
    objPorcentaje_item.keyup(function () {
        sumn_porcen_total();
    });

    $(".remover_edit").click(function () {
        remover($(this).val());
        /*editar*/
        /*  remover(ag);
         $(".remover" + (ag - 1)).removeAttr("disabled");
         if (ingr === 0) {
         rem_atrib_rem_t();
         }
         */
        $(".cant-ing").val($(".porcentaje_nuevo").size());
        actualizar_porcentaje();
    });
    $(".remover").click(function () {
        remover($(this).val());
        $(".cant-input").val(contarElementosCC());
        actualizar_porcentaje();
    });
    texto = "";

}
function contarElementosCC() {
    return $(".porcentaje_cc").size();
}
function list_cc_seccion(seccion, cc) {
    $.post("../../centro_costo", "opc=Lista_cc_seccion&id=" + seccion, function (objJson) {
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length === 0) {
            /* si no ha nada listar todas las secciones del area*/
// list_cc_area($(".select-area").val(), $(".centro_costo1"));
        } else {
            cc.empty();
            cc.append('<option value="">[Seleccione]</option>');
            for (var t = 0; t < lista.length; t++) {
                cc.append('<option value="' + lista[t].id + '">' + lista[t].nombre + '</option>');
            }
        }
    });
}
function list_cc_area(area, cc, dep) {
    $.post("../../centro_costo", "opc=Lista_cc_area&id=" + area, function (objJson) {
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length === 0) {
        } else {
            cc.empty();
            cc.append('<option value="">[Seleccione]</option>');
            for (var t = 0; t < lista.length; t++) {
                cc.append('<option value="' + lista[t].id + '">' + lista[t].nombre + '</option>');
            }
        }
    });
}
function listar_dep_cc(x, opc, arr_cc) {
    var cc_dep = $(".cc-dep" + x);
    $.post("../../centro_costo?opc=Listar_dep", "&id_dir=" + $(".cc-dir" + x).val(), function (objJson) {
        cc_dep.empty();
        cc_dep.append("<option value=''>[DEPARTAMENTO]</option>");
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (opc === "1") {
                if (arr_cc[1] === lista[i].id) {
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
function listar_cc(num, opc, arr_cc) {
    var select_cc = $(".select-cc");
    $.post("../../centro_costo?opc=Listar_cc", function (objJson) {
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        } else {
            var lista = objJson.lista;
            for (var i = 0; i < lista.length; i++) {
                select_cc.append("<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>");
            }
        }
    });
    var cc_dir = $(".cc-dir" + num);
    $.post("../../centro_costo?opc=Listar_dir", function (objJson) {
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (opc === "1") {
                if (arr_cc[0] === lista[i].id) {
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
    });
    $(".cc-seccion" + num).change(function () {
        list_cc_seccion($(".cc-seccion" + num).val(), $(".centro_costo" + num));
    });

}
function Listar_centro_costo1(iddgp, ag) {
    var x = $("#fila-agregar");
    $.post("../../centro_costo", "opc=Listar_centro_id_dgp&" + "id_dgp=" + iddgp, function (objJson) {
        var lista = objJson.lista;
        x.empty();
        var PorcentajeTotal = 0;
        var numero = 1;
        var texto = "";
        $(".can_centro_cos").val(lista.length);
        texto += '<div class="row" >' +
                '<section class="col col-3">' +
                '<label class="btn">' +
                '<a type="button" id="btn-agregar-cc" value="' + ag + '" class="btn btn-primary btn-circle btn-lg"><i class="glyphicon glyphicon-plus"></i></a>' +
                '</label></section>' +
                '<section class="col col-2">' +
                '<label class="input" id="titulo">%:<input type="text" name="PORCENTAJE_TOTAL" max="100" min="100" maxlength="3"  class="input-group-sm total_porcentaje" id="bo_a" readonly=""></label>' +
                '</section></div>';
        for (var i = 0; i < lista.length; i++) {
            numero = numero + i;

            texto += '<label id="titu" class="centro-costo_' + ag + '"  >Centro de Costo Nº ' + (i + 1) + ':</label>';
            texto += '<div  class="row centro-costo_' + ag + ' cc_registrado" >';
            texto += '<section class="col col-3"><label class="select" id="titu">Dirección :<select required="" class="cc-dir' + ag + '" id="cc-dir' + ag + '" readonly="readonly"  disabled><option value="">[DIRECCION]</option></select></label></section>';
            texto += '<section class="col col-3" ><label class="select" id="titu"> Departamento :<select required="" name="DEP" class="cc-dep' + ag + '" readonly="readonly"  disabled><option value="">[DEPARTAMENTO]</option></select></label></section>';
            /* nuevo agregado : area y seccion*/
            texto += '<section class="col col-3"><label class="select" id="titu"> Area :<select  class="cc-area' + ag + '"><option value="">[AREA]</option></select></label></section>';
            texto += '<section class="col col-3"><label class="select" id="titu"> Seccion :<select   class="cc-seccion' + ag + '"><option value="">[SECCION]</option></select></label></section>';

            texto += '<section class="col col-3" ><label class="select" id="titu"> Centro de Costo :<select name="CENTRO_COSTOS_' + ag + '" class="centro_costo' + ag + '" required="" readonly="readonly"  disabled=""><option value="">[CENTRO COSTO]</option></select></label></section>';
            texto += '<section class="col col-2" ><label class="input" id="titu">%<input name="PORCENTAJE_' + ag + '" value="' + lista[i].ca_por_cc + '"  type="text" required="" class="porcentaje_cc"/></label></section>';
            texto += '<section class="col col-1" ><br><label class="btn"><button type="button" value="' + ag +
                    '" class="btn btn-danger btn-circle btn-lg remover_registro dis-total" value="' + ag + '" ><i class="glyphicon glyphicon-remove"></i></button></label></section>';
            texto += '<input type="hidden" value="' + lista[i].id_det_ce + '" class="id_dcc' + ag + '" ><input type="hidden" name="id_d_cen_cos' + (i + 1) + '" value="' + lista[i].id_det_ce + '" ></div>';
            var dir, dep, area, seccion, cc;
            dir = lista[i].id_dir_cc;
            dep = lista[i].id_dep_cc;
            area = lista[i].id_area_cc;
            seccion = lista[i].id_seccion_cc;
            cc = lista[i].id;
            listar_cc2(ag, dir, dep, cc, area, seccion);

            numero = 1;
            ag++;
            PorcentajeTotal = (PorcentajeTotal + parseFloat(lista[i].ca_por_cc));
        }
        x.append(texto);
        $('#btn-agregar-cc').click(function () {
            AddCentroCosto("1");
        });
        $(".total_porcentaje").val(PorcentajeTotal);
        var objPorcentaje_item = $(".porcentaje_cc");
        objPorcentaje_item.keyup(function () {
            sumn_porcen_total();
        });
        $(".remover_registro").click(function () {
            var msg = confirm('Si aceptas se eliminara la informacion totalmente ¿aceptas?');
            if (msg === true) {
                var numero = $(this).val();
                $.ajax({
                    url: "../../centro_costo"
                    , data: "opc=Eliminar_det_cc&" + "id_dcc=" + $(".id_dcc" + numero).val()
                    , type: "POST", success: function (data, textStatus, jqXHR) {
                        if (data.rpta === "1") {
                            remover(numero);
                            $(".can_centro_cos").val($(".cc_registrado").size());
                        }
                    }
                });
            } else if (msg === false) {
                return false;
            }

        });
    });
}


function actualizar_porcentaje() {
    var objPorcentaje_item = $(".porcentaje_cc");
    objPorcentaje_item.val(Math.round((100 / contarElementosCC()) * 100) / 100);
    sumn_porcen_total();
}

function sumn_porcen_total() {
    var objPorcentaje_item = $(".porcentaje_cc");
    var objPorcentTotal = $(".total_porcentaje");
    var acum = 0;
    $.each(objPorcentaje_item, function () {
        acum = acum + parseFloat($(this).val());
    });
    objPorcentTotal.val(acum);
}

function remover_atrib(num) {
    $(".remover" + num).removeAttr("disabled");
}

function rem_atrib_rem_t() {
    $(".dis-total").removeAttr("disabled");
}
function remover(rem) {
    $(".centro-costo_" + rem).remove();
}

function listar_cc_mod(num, opc, arr_cc) {
    var cc_dir = $(".cc-dir" + num);
    $.post("../../centro_costo?opc=Listar_dir", function (objJson) {
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        for (var i = 0; i < lista.length; i++) {
            if (opc === "1") {
                if (arr_cc[0] === lista[i].id) {
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
    });
    $(".cc-seccion" + num).change(function () {
        list_cc_seccion($(".cc-seccion" + num).val(), $(".centro_costo" + num));
    });
    $(".porcenttaj" + num).keyup(function () {
        $(".cont_dif" + num).val($(this).val());
        var acum = 0;
        $.each($(".porcentaje_cc"), function () {
            acum = acum + parseFloat($(this).val());
        });
        $(".por_sum_to").val(acum);
    });

}


function agrgar_atrib(num) {
    $(".dis-total").attr("disabled", "disabled");
    /* if ((num) == $(".can_centro_cos").val()) {
     } else {
     $(".remover" + num).attr("disabled", "disabled");
     }*/
}
