$(document).ready(function () {
    init();
});

var idPresupuestoact;
var idDetallePreAct;
var listDetPuesto;
var idDetPreTra;
var idPuesto;
var idDetPuesto;
var idDetPrePuesto;

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

var condicionval = {
    'REQ-0001': 'Contrato Personal : Tiempo Completo',
    'REQ-0002': 'Contrato Personal : Medio Tiempo (24 Horas Semanal)',
    'REQ-0003': 'Contrato Personal : Tiempo Parcial',
    'REQ-0004': 'Renovacion de Contrato',
    'REQ-0005': 'Contrato Personal : Extranjero',
    'REQ-0007': 'Practicas Preprofesionales (Tope 6hrs diarias / 30 hrs  semanales.)',
    'REQ-0008': 'Practicas Profesionales',
    'REQ-0009': 'Convenio Laboral Juvenil (Hasta 22 a?os, no matriculados)',
    'REQ-0010': 'Locacion de Servicios',
    'REQ-0011': 'No domiciliado (Expositores Extranjeros)',
    'REQ-0018': 'Contrato Personal : Tiempo Parcial (Trabajador Docente)',
    'REQ-0019': 'Contratacion Casos Especiales'
};

function statusPresupuesto(idDestino, c_c, tip, tem) {
    var url = '../../pres?opc=status';
    var data = 'idDes=' + idDestino;
    $.ajax(url, {
        data: data,
        type: 'POST',
        async: false,
        success: function (objJson) {
            console.log(objJson);
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
                $("#detcontent").empty();
                var detalle = objJson.detallepres;
                var info = '';
                for (var i = 0; i < detalle.length; i++) {
                    info += '<div class="well col-lg-12 col-md-6 bg-color-teal txt-color-white">';
                    info += '<div>';
                    info += '<label>Requerimiento: </label><label>' + condicionval[detalle[i].ID_REQUERIMIENTO] + '</label><br>';
                    info += '<label>N° total de trabajadores: </label>' + detalle[i].N_TRABAJADORES + '<label></label><br>';
                    info += '</div>';
                    var prespuesto = detalle[i].detalleprespuesto;
                    for (var j = 0; j < prespuesto.length; j++) {
                        info += '<div class="well txt-color-greenDark">';
                        info += '<ul id="' + prespuesto[j].ID_PRESUPUESTO_PUESTO + '">';
                        info += '<li><label>Puesto:</label><label class="detpu">' + prespuesto[j].NO_PUESTO + '</label></li>';
                        info += '<li><label>N° de Trabajadores:</label class="detnt">' + prespuesto[j].N_TRABAJADORES + '<label></label></li>';
                        info += '<li><label>Sueldo Mínimo:</label><label class="detsmi">' + prespuesto[j].SUELDO_MIN + '</label></li>';
                        info += '<li><label>Sueldo Máximo:</label><label class="detsma">' + prespuesto[j].SUELDO_MAX + '</label></li>';
                        info += '<li><label>Bonificación min.:</label><label class="detbomi">' + prespuesto[j].BONO_MIN + '</label></li>';
                        info += '<li><label>Bonificación max.:</label><label class="detboma">' + prespuesto[j].BONO_MAX + '</label></li>';
                        info += '<li><label>Bon. Alimenticia min.:</label><label class="detbami">' + prespuesto[j].BOAL_MIN + '</label></li>';
                        info += '<li><label>Bon. Alimenticia max.:</label><label class="detbama">' + prespuesto[j].BOAL_MAX + '</label></li>';
                        info += '</ul>';
                        info += '</div>';
                    }
                    info += '</div>';
                }
                $("#detcontent").append(info);

            } else {
                (c_c !== null || c_c === "") ? c_c : c_c === null;
                var url = "../../pres?opc=reg";
                var data = "id=" + idDestino;
                data += "&cc=" + c_c;
                data += "&tip=" + tip;
                data += "&temp=" + tem;
                $.ajax(url, {
                    data: data,
                    type: 'POST',
                    async: false,
                    success: function (objJson) {
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
                    }
                });
                getPresupuestoDetails();
            }
        }
    });
}


//************    ASIGNACIÓN POR CONDICION LABORAL   ************************//
$(".BGE").click(function () {
    var idreq = $(".select_condicion").val();
    var ntra = $("#ntraG").val();
    if (idreq !== null && ntra !== "") {
        comprobarDet(idreq, ntra);
    } else {
        new PNotify({
            title: 'Incompleto',
            text: 'Los campos están incompletos',
            type: 'info'
        });
    }
    getPresupuestoDetails();

});

function comprobarDet(idreq, ntra) {
    var data = "idreq=" + idreq;
    data += "&idPre=" + idPresupuestoact;
    var url = "../../pres?opc=listDetPre";
    console.log(data);
    $.ajax(url, {
        data: data,
        type: 'POST',
        async: false,
        success: function (objJson) {
            console.log(objJson);
            if (objJson.detalle.length > 0) {
                console.log(objJson.detalle);
                $(".bNG").empty();
                $(".bNG").append('<input type="number" name="sueldo" id="ntraG" class="form-control" value="' + objJson.detalle[0].ntrabajadores + '"  placeholder="Número de trabajadores">');
                idDetallePreAct = objJson.detalle[0].id_det_pres;
                loadDetalleTrabajadores(objJson.detalle[0].ntrabajadores);
            } else {
                var data = "idreq=" + idreq;
                data += "&ntra=" + ntra;
                data += "&idPre=" + idPresupuestoact;
                var url = "../../pres?opc=regDetPre";
                $.ajax(url, {
                    data: data,
                    type: 'POST',
                    async: false,
                    success: function (objJson) {
                        if (objJson.res) {
                            new PNotify({
                                title: 'Registro Satisfactorio',
                                text: 'Se registró correctamente esta sección',
                                type: 'success'
                            });
                            console.log("Ejecutando nuevamente comprobarDet()");
                            comprobarDet(idreq, ntra);
                        } else {
                            alert("Error al registrar - comuniquese con el administrador del sistema");
                        }
                    }
                });
            }
            console.log("Saliendo de comprobarDet()");
        }
    });
}

function loadDetalleTrabajadores(ntra) {
    var nc = 0;
    var con = 0;
    var url = "../../pres?opc=listNtra";
    var data = "id=" + idDetallePreAct;
    $.ajax(url, {
        data: data,
        type: 'POST',
        async: false,
        success: function (objJson) {
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
                //$(".BD").attr("disabled", "");
            }
            var t = createAlert("Puede especificar puesto y sueldo a <strong>" + nc + "</strong> trabajadores de los <strong>" + ntra + "</strong> presupuestados ");
            $(".alertNT").empty();
            $(".alertNT").append(t);
        }
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
    getPresupuestoDetails();
});

function comprobarPuestoNT(pues, nt) {
    var o = pues.split("**");
    var puesto = o[0];
    var url = "../../pres?opc=comPues";
    var data = "puesto=" + puesto;
    data += "&idDet=" + idDetallePreAct;
    $.ajax(url, {
        data: data,
        type: 'POST',
        async: false,
        success: function (obj) {
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
        }
    });
}

function regPuesTra(puesto, nt) {
    var url = "../../pres?opc=regPuesTra";
    var data = "puesto=" + puesto;
    data += "&nt=" + nt;
    data += "&idDet=" + idDetallePreAct;
    $.ajax(url, {
        data: data,
        type: 'POST',
        async: false,
        success: function (obj) {
            var t = obj.ta;
            if (t === true) {
                new PNotify({
                    title: 'Registro Satisfactorio',
                    text: 'Se registró correctamente esta sección',
                    type: 'success'
                });
                var ntra = $("#ntraG").val();
                loadDetalleTrabajadores(ntra);
                getInfoSueldo();
            } else if (t === 2) {
                new PNotify({
                    title: 'Hay un problema',
                    text: 'Usted superó el N° de trabajadores por asignar o es que ya no queda ninguno.',
                    type: 'warning'
                });
            } else {
                new PNotify({
                    title: 'Ocurrio un Error',
                    text: 'No se pudo registrar',
                    type: 'error'
                });
            }
        }
    });
}

//***********   ASIGNACIÓN DE SUELDO POR PUESTO ******************************//

$(".BM").click(function () {
    console.log(idDetallePreAct);
    updateSueldo();
    getPresupuestoDetails();
});

function getInfoSueldo() {
    var pues = $(".select_puesto").val();
    var o = pues.split("**");
    var id = o[0];
    if (id !== undefined || id !== null) {
        var url = "../../pres?opc=infoPP";
        var data = "idpues=" + id;
        data += "&idDet=" + idDetallePreAct;
        $.ajax(url, {
            data: data,
            type: 'POST',
            async: false,
            success: function (at) {
                var datos = at.in;
                console.log(datos);
                if (datos.length > 0) {
                    $("#iSMin").attr("value", datos[0].sueldo_min);
                    $("#iSMax").attr("value", datos[0].sueldo_ax);
                    $("#iBMin").attr("value", datos[0].bono_min);
                    $("#iBMax").attr("value", datos[0].bono_ax);
                    $("#iBAMin").attr("value", datos[0].boal_min);
                    $("#iBAMax").attr("value", datos[0].boal_max);
                    idDetPrePuesto = datos[0].ID_PRESUPUESTO_PUESTO;
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
            }
        });
    } else {
        console.log("no presupuestó el número de trabajadores para este puesto");
    }

}

function updateSueldo() {
    var pues = $(".select_puesto").val();
    var o = pues.split("**");
    var id = o[0];
    if (id !== undefined || id !== null) {
        if (id !== undefined || id !== null) {
            var url = "../../pres?opc=infoPP";
            var data = "idpues=" + id;
            data += "&idDet=" + idDetallePreAct;
            $.ajax(url, {
                data: data,
                type: 'POST',
                async: false,
                success: function (at) {
                    var datos = at.in;
                    console.log(datos);
                    if (datos.length > 0) {
                        var smin = $("#iSMin").val();
                        var smax = $("#iSMax").val();
                        var bmin = $("#iBMin").val();
                        var bmax = $("#iBMax").val();
                        var bamin = $("#iBAMin").val();
                        var bamax = $("#iBAMax").val();
                        if (smin !== "" && smax !== "" && bmin !== "" && bmax !== "" && bamin !== "" && bamax !== "") {
                            var url = "../../pres?opc=updateSueldo";
                            var data = "idprepuesto=" + idDetPrePuesto;
                            data += "&sueldo_min=" + smin;
                            data += "&sueldo_max=" + smax;
                            data += "&bono_min=" + bmin;
                            data += "&bono_max=" + bmax;
                            data += "&boal_min=" + bamin;
                            data += "&boal_max=" + bamax;
                            $.ajax(url, {
                                data: data,
                                type: 'POST',
                                async: false,
                                success: function (up) {
                                    console.log(up.rpta);
                                    if (up.rpta) {
                                        new PNotify({
                                            title: 'Listo',
                                            text: 'Se guardaron los cambios de los detalles del sueldo para este puesto',
                                            type: 'success'
                                        });
                                    } else {
                                        new PNotify({
                                            title: 'Ups',
                                            text: 'Comuniquese con el administrador del sistema',
                                            type: 'warning'
                                        });
                                    }
                                }
                            });
                        } else {
                            new PNotify({
                                title: 'Incompleto',
                                text: 'Los campos están incompletos',
                                type: 'info'
                            });
                        }
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
                }
            });
        }
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
    $.ajax(url, {
        data: data,
        type: 'POST',
        async: false,
        success: function (sr) {
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
        }
    });
}

//***********************   TEMPORADA   **************************************//

function loadTemporada(id) {
    $('#myModal').modal('hide');
    var url = "../../pres?opc=list_temp";
    var data = "idDes=" + id;
    $.ajax(url, {
        data: data,
        type: 'POST',
        async: false,
        success: function (lista) {
            var list = lista.temporadas;
            var a = $(".select_temporada");
            a.empty();
            a.append("<option value='' selected disabled>[Seleccione]</option>");
            if (list.length > 0) {
                for (var i = 0, max = list.length; i < max; i++) {
                    a.append("<option value='" + list[i].id_temporada + "**" + list[i].fecha_inicio + "**" + list[i].fecha_fin + "' >" + list[i].nombre_temp + "</option>");
                }
            } else {
            }
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
            $.ajax(url, {
                data: data,
                type: 'POST',
                async: false,
                success: function (objJson) {
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
    $.ajax(url, {
        data: data,
        type: 'POST',
        async: false,
        success: function (objJson) {
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
        }
    });
}

function getPresupuestoDetails() {
    $.ajax("../../pres?opc=presupuestoDetails", {
        data: {
            id: idPresupuestoact
        },
        type: 'POST',
        async: false,
        success: function (obj) {
            $("#detcontent").empty();
            var detalle = obj.detallepres;
            var info = '';
            for (var i = 0; i < detalle.length; i++) {
                info += '<div class="well col-lg-12 col-md-6 bg-color-teal txt-color-white">';
                info += '<div>';
                info += '<label>Condición Laboral: </label><label>' + condicionval[detalle[i].ID_REQUERIMIENTO] + '</label><br>';
                info += '<label>N° total de trabajadores: </label>' + detalle[i].N_TRABAJADORES + '<label></label><br>';
                info += '</div>';
                var prespuesto = detalle[i].detalleprespuesto;
                for (var j = 0; j < prespuesto.length; j++) {
                    info += '<div class="well txt-color-greenDark">';
                    info += '<ul id="' + prespuesto[j].ID_PRESUPUESTO_PUESTO + '">';
                    info += '<li><label>Puesto:</label><label class="detpu">' + prespuesto[j].NO_PUESTO + '</label></li>';
                    info += '<li><label>N° de Trabajadores:</label class="detnt">' + prespuesto[j].N_TRABAJADORES + '<label></label></li>';
                    info += '<li><label>Sueldo Mínimo:</label><label class="detsmi">' + prespuesto[j].SUELDO_MIN + '</label></li>';
                    info += '<li><label>Sueldo Máximo:</label><label class="detsma">' + prespuesto[j].SUELDO_MAX + '</label></li>';
                    info += '<li><label>Bonificación min.:</label><label class="detbomi">' + prespuesto[j].BONO_MIN + '</label></li>';
                    info += '<li><label>Bonificación max.:</label><label class="detboma">' + prespuesto[j].BONO_MAX + '</label></li>';
                    info += '<li><label>Bon. Alimenticia min.:</label><label class="detbami">' + prespuesto[j].BOAL_MIN + '</label></li>';
                    info += '<li><label>Bon. Alimenticia max.:</label><label class="detbama">' + prespuesto[j].BOAL_MAX + '</label></li>';
                    info += '</ul>';
                    info += '</div>';
                }
                info += '</div>';
            }
            $("#detcontent").append(info);
        }
    });
}