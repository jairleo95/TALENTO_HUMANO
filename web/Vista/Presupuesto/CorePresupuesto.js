$(document).ready(function () {
    init();
});

var idPresupuestoact;
var idDetallePreAct;

function oModal() {
    var opc = 'Listar_direccion';
    var id = "";
    listar_opcionesM(opc, id);
    $(".select_direccion_M").change(function () {
        var opc = 'Listar_dir_dep';
        var id = $(".select_direccion_M").val().split("**")[0];
        listar_opcionesM(opc, id);
    });
    $(".select_dep_M").change(function () {
        var opc = 'Listar_area2';
        var id = $(".select_dep_M").val().split("**")[0];
        listar_opcionesM(opc, id);
        $("#iDestinoM").attr("value", id);
        $("#tipo_pM").attr("value", 2);
    });
    $(".select_area_M").change(function () {
        var id = $(".select_area_M").val().split("**")[0];
        $("#iDestinoM").attr("value", id);
        $("#tipo_pM").attr("value", 1);
    });
}

function listar_opcionesM(opc, id) {
    var ap = "";
    if (opc == 'Listar_direccion') {
        var a = $(".select_direccion_M");
        $(".select_dep_M").empty();
        $(".select_dep_M").append("<option value='' selected disabled>[Seleccione]</option>");
        $(".select_area_M").empty();
        $(".select_area_M").append("<option value='' selected disabled>[Seleccione]</option>");
        a.empty();
        a.append("<option value='' selected disabled>[Seleccione]</option>");
    }
    if (opc == 'Listar_dir_dep') {
        var a = $(".select_dep_M");
        $(".select_area_M").empty();
        $(".select_area_M").append("<option value='' selected disabled>[Seleccione]</option>");
        ap = "&id=" + id;
        a.empty();
        a.append("<option value='' selected disabled>[Seleccione]</option>");
    }
    if (opc == 'Listar_area2') {
        var a = $(".select_area_M");
        ap = "&id=" + id;
        a.empty();
        a.append("<option value='' selected disabled>[Seleccione]</option>");
    }
    $.post("../../Direccion_Puesto", "opc=" + opc + ap, function (objJson) {
        var list = objJson.lista;
        for (var i = 0; i < list.length; i++) {
            a.append("<option value='" + list[i].id + "**" + list[i].nombre + "'>" + list[i].nombre + "</option>");
        }
    });
}

function helpDG() {
    new PNotify({
        title: 'Datos Generales',
        text: 'El presupuesto puede ser destinado para un departamento o para un área,las temporadas se muestran dependiendo de esa elección',
        type: 'info'
    });
}

function saveNewTemp() {
    var f_i = $("#fe_i_n").val();
    var f_f = $("#fe_f_n").val();
    var n_n = $("#n_n_t").val();
    var idDestino = $("#iDestinoM").val();
    var tip = $("#tipo_pM").val();
    if (n_n !== "" && f_i !== "" && f_f !== "") {
        if (f_i < f_f) {
            var url = "../../pres?opc=n_temp";
            var data = "temporada=" + n_n;
            data += "&f_i=" + convertir_fecha(f_i);
            data += "&f_fin=" + convertir_fecha(f_f);
            data += "&idDes=" + idDestino;
            data += "&tip=" + tip;
            $.post(url, data, function (objJson) {
                if (objJson.rp) {
                    loadTemporada();
                    new PNotify({
                        title: 'Temporada Registrada',
                        text: 'Se registró correctamente la temporada',
                        type: 'success'
                    });
                } else {
                    console.error("Ocurrió un error al registrar temporada");
                }
            });
        } else {
            alert("fechas incorrectas");
        }
    } else {
        new PNotify({
            title: 'Incompleto',
            text: 'Los campos están incompletos',
            type: 'info'
        });
    }
}

$(".BG").click(function () {
    var idDestino = $("#iDestino").val();
    var c_c = $(".select_cc").val();
    var tip = $("#tipo_p").val();
    var temp = $(".select_temporada").val();
    var t = temp.split("**");
    if (idDestino !== "" && t !== null ) {
        statusPresupuesto(idDestino, c_c, tip);
    } else {
        new PNotify({
            title: 'Incompleto',
            text: 'Los campos están incompletos',
            type: 'info'
        });
    }
});

$(".BGE").click(function () {
    var con = $(".select_condicion").val();
    var tiem = $(".select_tiempo").val();
    var ntra = $("#ntraG").val();
    if (con !== null && tiem !== null && ntra !== "") {
        comprobarDet(con, tiem, ntra);
    } else {
        new PNotify({
            title: 'Incompleto',
            text: 'Los campos están incompletos',
            type: 'info'
        });
    }

});

$(".BD").click(function () {
    var puesto = $(".select_puesto").val();
    var nt = $("#nTraDP").val();
    if (puesto !== null && nt !== nt) {
        comprobarPuestoNT(puesto, nt);
    }
});

$(".BM").click(function () {

});

function comprobarPuestoNT(puesto, nt) {
    var url = "../../pres?opc=regPuesTra";
    var data = "puesto=" + puesto;
    data += "&idDet=" + idDetPreTra;

    $.post(url, data, function (obj) {
        var li = obj.detTPuesto;
    });

    var c;
    for (var i = 0, max = listDetPuesto.length; i < max; i++) {
        if (listDetPuesto[i].id_puesto === puesto) {
            console.log("presupuestado antes : " + nt + " trabajadores");
            c = 1;
        }
    }
    if (c !== 1) {
        regPuesTra(puesto, nt);
    }
}

function regPuesTra(puesto, nt) {
    var url = "../../pres?opc=regPuesTra";
    var data = "";

}

function comprobarDet(con, tiem, ntra) {
    var data = "con=" + con;
    data += "&tiem=" + tiem;
    data += "&idPre=" + idPresupuestoact;
    var url = "../../pres?opc=listDetPre";
    $.post(url, data, function (objJson) {
        if (objJson.detalle.length > 0) {
            /*new PNotify({
             title: 'Antes Presupuestado',
             text: 'Se presupuestó antes con las mismas opciones',
             type: 'success'
             });*/
            $(".bNG").empty();
            $(".bNG").append('<input type="number" name="sueldo" id="ntraG" class="form-control" value="' + objJson.detalle[0].ntrabajadores + '"  placeholder="Número de trabajadores">');
            idDetallePreAct = objJson.detalle[0].id_det_pres;
            loadDetalleTrabajadores(objJson.detalle[0].ntrabajadores);
        } else {
            var data = "con=" + con;
            data += "&tiem=" + tiem;
            data += "&ntra=" + ntra;
            data += "&idPre=" + idPresupuestoact;
            var url = "../../pres?opc=regDetPre";
            $.post(url, data, function (objJson) {
                if (objJson.res) {
                    new PNotify({
                        title: 'Registro Satisfactorio',
                        text: 'Se registró correctamente esta sección',
                        type: 'success'
                    });
                    comprobarDet(con, tiem, ntra);
                } else {
                    alert("Error al registrar");
                }
            });
        }
    });
}

var listDetPuesto;
var idDetPreTra;

function loadDetalleTrabajadores(ntra) {
    //nTraDP
    var nc = 0;
    var url = "../../pres?opc=listNtra";
    var data = "id=" + idDetallePreAct;
    $.post(url, data, function (objJson) {
        var lista = objJson.listaDet;
        if (lista.length > 0) {
            var con = 0;
            for (var i = 0, max = lista.length; i < max; i++) {
                con = con + parseInt(lista[i].npredet);
                idDetPreTra = lista[i].id_det_pres;
            }
            nc = ntra - con;
        } else {
            nc = ntra;
        }
        var t = createAlert("Puede contratar a <strong>" + nc + "</strong> trabajadores de los <strong>" + ntra + "</strong> presupuestados ");
        //var t = createAlert("Puede contratar a <strong>" + nc + "</strong> trabajadores de los <strong>" + ntra + "</strong> presupuestados  <button class='btn btn-info' type='button' style='float:right;margin-bottom: 5%'>Ver detalle</button>");
        $(".alertNT").empty();
        $(".alertNT").append(t);
    });

}

function createAlert(mensaje) {
    var s = '<div class="alert alert-info" role="alert">';
    s += '<i class="fa fa-info"></i>  ' + mensaje;
    s += '</div>';
    return s;
}


function loadTemporada(id) {
    console.log(id);
    $('#myModal').modal('hide');
    var url = "../../pres?opc=list_temp";
    var data = "idDes=" + id;
    $.post(url, data, function (lista) {
        var list = lista.temporadas;
        if (list.length > 0) {
            var a = $(".select_temporada");
            a.empty();
            a.append("<option value='' selected disabled>[Seleccione]</option>");
            for (var i = 0, max = list.length; i < max; i++) {
                a.append("<option value='" + list[i].id_temporada + "**" + list[i].fecha_inicio + "**" + list[i].fecha_fin + "' >" + list[i].nombre_temp + "</option>");
            }
        } else {
            console.log("No hay temporadas");
        }
    });
}

function convertir_fecha(fecha) {
    var fi = fecha.split("-");
    var year = fi[0];
    var month = fi[1];
    var day = fi[2];
    var s = day + '/' + month + '/' + year;
    return s;
}

function init() {
    var opc = 'Listar_direccion';
    var id = "";
    listar_opciones(opc, id);
    $(".select_direccion").change(function () {
        var opc = 'Listar_dir_dep';
        var id = $(".select_direccion").val().split("**")[0];
        listar_opciones(opc, id);
    });
    $(".select_dep").change(function () {
        var opc = 'Listar_area2';
        var id = $(".select_dep").val().split("**")[0];
        listar_opciones(opc, id);
        $("#iDestino").attr("value", id);
        $("#tipo_p").attr("value", 2);
        //statusPresupuesto(id);
        loadTemporada(id);
    });
    $(".select_area").change(function () {
        var id = $(".select_area").val().split("**")[0];
        var opc = 'Listar_sec2';
        listar_opciones(opc, id);
        $("#iDestino").attr("value", id);
        $("#tipo_p").attr("value", 1);
        //statusPresupuesto(id);
        loadTemporada(id);
    });
    $(".select_cc").change(function () {
        var id = $(".select_cc").val().split("**")[0];
        $("#id_cc").attr("value", id);
    });
    $(".select_seccion").change(function () {
        var id = $(".select_seccion").val().split("**")[0];
        var opc = 'Listar_pu_id';
        listar_opciones(opc, id);
    });
    $(".select_puesto").change(function () {
        var id = $(".select_puesto").val().split("**")[0];
        $("#ipuesto").attr("value", id);
        $(".cPuestoT").empty();
        $(".cPuestoT").append("<small>Puesto de : </small> <strong>" + $(".select_puesto").val().split("**")[1] + "</strong>");
    });
    $(".select_temporada").change(function () {
        var temp = $(".select_temporada").val();
        var t = temp.split("**");
        var id = t[0];
        var fecha_i = t[1];
        var fecha_f = t[2];
        var f_i = fecha_i.split(" ");
        var f_f = fecha_f.split(" ");
        $("#fe_f").attr("value", f_f[0]);
        $("#fe_i").attr("value", f_i[0]);
        $("#itemp").attr("value", id);
    });
}

function listar_opciones(opc, id) {
    var ap = "";
    if (opc == 'Listar_direccion') {
        var a = $(".select_direccion");
        $(".select_dep").empty();
        $(".select_dep").append("<option value='' selected disabled>[Seleccione]</option>");
        $(".select_area").empty();
        $(".select_area").append("<option value='' selected disabled>[Seleccione]</option>");
        a.empty();
        a.append("<option value='' selected disabled>[Seleccione]</option>");
    }
    if (opc == 'Listar_dir_dep') {
        var a = $(".select_dep");
        $(".select_area").empty();
        $(".select_area").append("<option value='' selected disabled>[Seleccione]</option>");
        ap = "&id=" + id;
        a.empty();
        a.append("<option value='' selected disabled>[Seleccione]</option>");
    }
    if (opc == 'Listar_area2') {
        var a = $(".select_area");
        ap = "&id=" + id;
        $(".select_seccion").empty();
        $(".select_seccion").append("<option value='' selected disabled>[Seleccione]</option>");
        a.empty();
        a.append("<option value='' selected disabled>[Seleccione]</option>");
    }
    if (opc === "Listar_sec2") {
        var a = $(".select_seccion");
        ap = "&id=" + id;
        $(".select_puesto").empty();
        $(".select_puesto").append("<option value='' selected disabled>[Seleccione]</option>");
        a.empty();
        a.append("<option value='' selected disabled>[Seleccione]</option>");
    }
    if (opc === "Listar_pu_id") {
        var a = $(".select_puesto");
        ap = "&id=" + id;
        a.empty();
        a.append("<option value='' selected disabled>[Seleccione]</option>");
    }
    $.post("../../Direccion_Puesto", "opc=" + opc + ap, function (objJson) {
        var list = objJson.lista;
        for (var i = 0; i < list.length; i++) {
            a.append("<option value='" + list[i].id + "**" + list[i].nombre + "'>" + list[i].nombre + "</option>");
        }
    });
}

function statusPresupuesto(idDestino, c_c, tip) {
    var url = '../../pres?opc=status';
    var data = 'idDes=' + idDestino;
    $.post(url, data, function (objJson) {
        if (objJson.rpta !== null) {
            new PNotify({
                title: 'Presupuesto activo',
                text: 'Continúe el presupuestado',
                type: 'info'
            });
            idPresupuestoact = objJson.rpta;
            console.log(idPresupuestoact);
            $(".select_direccion").attr("disabled", "");
            $(".select_dep").attr("disabled", "");
            $(".select_area").attr("disabled", "");
            $(".select_cc").attr("disabled", "");
            $(".select_temporada").attr("disabled", "");
            $(".BG").attr("disabled", "");
            jQuery(".BGE").removeAttr("disabled");
            jQuery(".BD").removeAttr("disabled");
            jQuery(".BM").removeAttr("disabled");
        } else {
            var t;
            (c_c !== null || c_c === "") ? c_c : c_c === null;
            var url = "../../pres?opc=reg";
            var data = "id=" + idDestino;
            data += "&cc=" + c_c;
            data += "&tip=" + tip;
            data += "&temp=" + t[0];
            $.post(url, data, function (Presupuesto) {
                idPresupuestoact = Presupuesto.obj;
                if (idPresupuestoact !== null || idPresupuestoact !== 0) {
                    $(".select_direccion").attr("disabled", "");
                    $(".select_dep").attr("disabled", "");
                    $(".select_area").attr("disabled", "");
                    $(".select_cc").attr("disabled", "");
                    $(".select_temporada").attr("disabled", "");
                    $(".BG").attr("disabled", "");
                    jQuery(".BGE").removeAttr("disabled");
                    jQuery(".BD").removeAttr("disabled");
                    jQuery(".BM").removeAttr("disabled");
                }
            });
        }
    });
}

function listCCostos(id, tipo) {
    var text = '';
    var url = '../../pres?opc=ccosto';
    var data = '';
    if (tipo === "dep") {
        data += 'id=' + id;
        data += '&tipo=2';
        text = 'Este Departamento ';
    }
    if (tipo === "area") {
        data += 'id=' + id;
        data += '&tipo=1';
        text = 'Esta Area ';
    }
    $.post(url, data, function (objJson) {
        var a = $(".select_cc");
        var lista = objJson.datos;
        if (lista.length > 0) {
            a.empty();
            a.append("<option value='' selected disabled>[Seleccione]</option>");
            for (var i = 0; i < lista.length; i++) {
                a.append("<option value='" + lista[i].idccosto + "'>" + lista[i].codigo + " - " + lista[i].denominacion + "</option>");
            }
        } else {
            a.empty();
            a.append("<option value='' selected disabled>[Seleccione]</option>");
            new PNotify({
                title: 'No hay Centros de Costo',
                text: text + 'no tiene centros de costos disponibles',
                type: 'info'
            });
        }
    });
}