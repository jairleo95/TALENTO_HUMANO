$(document).ready(function () {
    init();
});

var idPresupuestoact;
var idDetallePreAct;
var listDetPuesto;
var idDetPreTra;
var idPuesto;
var idDetPuesto;

//**************    GESTIONAR PRESUPUESTO GENERAL   **************************//
$(".BG").click(function () {
    var idDestino = $("#iDestino").val();
    var c_c = $(".select_cc").val();
    var tip = $("#tipo_p").val();
    var temp = $(".select_temporada").val();
    if (idDestino !== "" && temp !== null) {
        var t = temp.split("**");
        statusPresupuesto(idDestino, c_c, tip, t[0]);
    } else {
        new PNotify({
            title: 'Incompleto',
            text: 'Los campos están incompletos',
            type: 'info'
        });
    }
});

function statusPresupuesto(idDestino, c_c, tip, tem) {
    var url = '../../pres?opc=status';
    var data = 'idDes=' + idDestino;
    $.post(url, data, function (objJson) {
        if (objJson.rpta !== "no") {
            new PNotify({
                title: 'Presupuesto activo',
                text: 'Continúe el presupuestado',
                type: 'success'
            });
            idPresupuestoact = objJson.rpta;
            $(".select_direccion").attr("disabled", "");
            $(".select_dep").attr("disabled", "");
            $(".select_area").attr("disabled", "");
            $(".select_cc").attr("disabled", "");
            $(".select_temporada").attr("disabled", "");
            $(".BG").attr("disabled", "");
            jQuery(".BGE").removeAttr("disabled");
            jQuery(".BD").removeAttr("disabled");

        } else {
            (c_c !== null || c_c === "") ? c_c : c_c === null;
            var url = "../../pres?opc=reg";
            var data = "id=" + idDestino;
            data += "&cc=" + c_c;
            data += "&tip=" + tip;
            data += "&temp=" + tem;
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
                    statusPresupuesto(idDestino, c_c, tip, tem);
                }
            });
        }
    });
}


//************    ASIGNACIÓN POR CONDICION LABORAL   ************************//
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

function comprobarDet(con, tiem, ntra) {
    var data = "con=" + con;
    data += "&tiem=" + tiem;
    data += "&idPre=" + idPresupuestoact;
    var url = "../../pres?opc=listDetPre";
    $.post(url, data, function (objJson) {
        if (objJson.detalle.length > 0) {
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
                    alert("Error al registrar - comuniquese con el administrador del sistema");
                }
            });
        }
    });
}

function loadDetalleTrabajadores(ntra) {
    var nc = 0;
    var con = 0;
    var url = "../../pres?opc=listNtra";
    var data = "id=" + idDetallePreAct;
    $.post(url, data, function (objJson) {
        var lista = objJson.listaDet;
        if (lista.length > 0) {
            for (var i = 0, max = lista.length; i < max; i++) {
                con = con + parseInt(lista[i].ntrabajadores);
            }
            nc = ntra - con;
            jQuery(".BD").removeAttr("disabled");
            jQuery(".BM").removeAttr("disabled");
        } else {
            nc = ntra;
            //$(".BGE").attr("disabled", "");
            $(".BD").attr("disabled", "");
        }
        if (nc === 0) {
            $(".BD").attr("disabled", "");
            $(".BM").attr("disabled", "");
        } else {
            jQuery(".BD").removeAttr("disabled");
            jQuery(".BM").removeAttr("disabled");
        }
        var t = createAlert("Puede contratar a <strong>" + nc + "</strong> trabajadores de los <strong>" + ntra + "</strong> presupuestados ");
        $(".alertNT").empty();
        $(".alertNT").append(t);
    });
}

//************    ASIGNACIÓN DE TRABAJADORES POR PUESTO  *********************//

$(".BD").click(function () {
    var puesto = $(".select_puesto").val();
    var nt = $("#ntraD").val();
    if (puesto !== "" && nt !== "") {
        comprobarPuestoNT(puesto, nt);
    } else {
        new PNotify({
            title: 'Incompleto',
            text: 'Los campos están incompletos',
            type: 'info'
        });
    }
});

function comprobarPuestoNT(pues, nt) {
    var o = pues.split("**");
    var puesto = o[0];
    var url = "../../pres?opc=comPues";
    var data = "puesto=" + puesto;
    data += "&idDet=" + idDetallePreAct;
    $.post(url, data, function (obj) {
        var li = obj.detTPuesto;
        if (li.length > 0) {
            $(".bND").empty();
            $(".bND").append('<input type="number" name="sueldo" id="ntraD" class="form-control" value="' + li[0].n_trabajadores + '"  placeholder="Número de trabajadores">');
            new PNotify({
                title: 'Activo',
                text: 'Ya se ha presupuestado a este puesto, comuniquese con el administrador del sistema',
                type: 'info'
            });
            getInfoSueldo();
        } else {
            regPuesTra(puesto, nt);
        }
    });
}

function regPuesTra(puesto, nt) {
    var url = "../../pres?opc=regPuesTra";
    var data = "puesto=" + puesto;
    data += "&nt=" + nt;
    data += "&idDet=" + idDetallePreAct;
    $.post(url, data, function (obj) {
        var t = obj.ta;
        if (t) {
            new PNotify({
                title: 'Registro Satisfactorio',
                text: 'Se registró correctamente esta sección',
                type: 'success'
            });
            var con = $(".select_condicion").val();
            var tiem = $(".select_tiempo").val();
            var ntra = $("#ntraG").val();
            comprobarDet(con, tiem, ntra);
        } else {
            new PNotify({
                title: 'Ocurrio un Error',
                text: 'No se pudo registrar',
                type: 'error'
            });
        }
    });
}

//***********   ASIGNACIÓN DE SUELDO POR PUESTO ******************************//

$(".BM").click(function () {
    getInfoSueldo();
});

function getInfoSueldo() {
    var pues = $(".select_puesto").val();
    var o = pues.split("**");
    var id = o[0];
    if (id !== undefined || id !== null) {
        var url = "../../pres?opc=infoPP";
        var data = "idDet=" + id;
        $.post(url, data, function (at) {
            var datos = at.in;
            if (datos.length > 0) {
                $("#iSMin").attr("value", datos[0].sueldo_min);
                $("#iSMax").attr("value", datos[0].sueldo_ax);
                $("#iBMin").attr("value", datos[0].bono_min);
                $("#iBMax").attr("value", datos[0].bono_ax);
                $("#iBAMin").attr("value", datos[0].boal_min);
                $("#iBAMax").attr("value", datos[0].boal_max);
            } else {
                var smin = $("#iSMin").val();
                var smax = $("#iSMax").val();
                var bmin = $("#iBMin").val();
                var bmax = $("#iBMax").val();
                var bamin = $("#iBAMin").val();
                var bamax = $("#iBAMax").val();
                if (smin !== "" && smax !== "" && bmin !== "" && bmax !== "" && bamin !== "" && bamax !== "") {
                    regSueldo(id, smin, smax, bmin, bmax, bamin, bamax);
                } else {
                    new PNotify({
                        title: 'Incompleto',
                        text: 'Los campos están incompletos',
                        type: 'info'
                    });
                }
            }
        });
    } else {
        console.log("no presupuestó el número de trabajadores para este puesto");
    }

}

function regSueldo(id, smin, smax, bmin, bmax, bamin, bamax) {
    var url = "../../pres?opc=regPP";
    var data = "idDet=" + id;
    data += "&sueldo_min=" + smin;
    data += "&sueldo_max=" + smax;
    data += "&bono_min=" + bmin;
    data += "&bono_max=" + bmax;
    data += "&boal_min=" + bamin;
    data += "&boal_max=" + bamax;
    $.post(url, data, function (sr) {
        if (sr.ac) {
            new PNotify({
                title: 'Listo',
                text: 'Se registró correctamente los detalles del sueldo para este puesto',
                type: 'success'
            });
        } else {
            new PNotify({
                title: 'Ups',
                text: 'Comuniquese con el administrador del sistema',
                type: 'warning'
            });
        }
    });
}

//***********************   TEMPORADA   **************************************//

function loadTemporada(id) {
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
        }
    });
}

function saveNewTemp() {
    var f_i = $("#fe_i_n").val();
    var f_f = $("#fe_f_n").val();
    var n_n = $("#n_n_t").val();
    var idDestino = $("#iDestino").val();
    var tip = $("#tipo_p").val();
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


//***********************   CENTROS DE COSTO    ******************************//   

function listCCostos(id, tipo) {
    var text = '';
    var url = '../../pres?opc=ccosto';
    var data = '';
    if (parseInt(tipo) === 2) {
        data += 'id=' + id;
        data += '&tipo=2';
        text = 'Este Departamento ';
    }
    if (parseInt(tipo) === 1) {
        data += 'id=' + id;
        data += '&tipo=1';
        text = 'Esta Area ';
    }
    $.post(url, data, function (objJson) {
        var a = $(".select_cc");
        var lista = objJson.cco;
        if (lista.length > 0) {
            a.empty();
            a.append("<option value='' selected disabled>[Seleccione]</option>");
            for (var i = 0; i < lista.length; i++) {
                a.append("<option value='" + lista[i].idccosto + "'>" + lista[i].codigo + " - " + lista[i].denominacion + "</option>");
            }
            loadTemporada(id);
        } else {
            a.empty();
            a.append("<option value='' selected disabled>[Seleccione]</option>");
            new PNotify({
                title: 'No hay Centros de Costo',
                text: text + 'no tiene centros de costos disponibles',
                type: 'info'
            });
            loadTemporada(id);
        }
    });
}