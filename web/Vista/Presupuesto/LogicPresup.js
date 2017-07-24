//AL CARGAR LA PAGINA
$(document).ready(function () {
    $("#vcont").empty();
    $("#vcont").append(createContentAsignar());
    $("#estOPC").attr("value", "anual");
    var a = getFechaInit();
    getFechaAnual(a);
    init();
});

//CONTENEDORES DE FORMULARIOS

function createContentAsignar() {
    var s = '<div class="panel panel-primary">';
    s += '<div class="panel-heading"><h3><i class="fa fa-usd"></i>   Asignar Presupuesto</h3></div>';
    s += '<div class="panel-body">';
    s += '<form class="">';
    s += '<fieldset>';
    s += '<legend>';
    s += 'Seleccionar Área';
    s += '</legend>';
    s += '<div class="row">';
    s += '<div class="form-group col-md-4 col-xs-4" >';
    s += '<label>Dirección :</label><br>';
    s += '<select class="form-control select_direccion" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-4" >';
    s += '<label>Departamento :</label><br>';
    s += '<select class="form-control select_dep" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-4" >';
    s += '<label>Área :</label><br>';
    s += '<select class="form-control select_area" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '</div>';
    s += '<input type="hidden" id="iArea">';
    s += '</fieldset>';
    s += '<fieldset>';
    s += '<legend>';
    s += 'Gestión de Presupuesto';
    s += '</legend>';
    s += '<div class="row">';
    s += '<ul class="nav nav-pills">';
    s += '<li role="presentation" onclick="ch(this.id)" id="anual" class="se active"><a style="cursor: pointer">Anual</a></li>';
    s += '<li role="presentation" onclick="ch(this.id)" id="mensual" class="se"><a style="cursor: pointer">Mensual</a></li>';
    s += '<li role="presentation" onclick="ch(this.id)" id="inter" class="se"><a style="cursor: pointer">Definir Intervalo</a></li>';
    s += '</ul>';
    s += '<input type="hidden" id="estOPC">';
    s += '</div>';
    s += '<br/>';
    s += '<div class="row">';
    s += '<div class="form-group col-md-6 col-xs-6">';
    s += '<label>Fecha Inicio:</label><br>';
    s += '<input type="date" name="fec_i" class="form-control" length="45"  id="fe_i" onchange="getFecha(this.value)">';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-6">';
    s += '<label>Fecha Fin :</label><br>';
    s += '<input type="date" name="fec_f" class="form-control" size="45" maxlength="100"  id="fe_fin" disabled="">';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-6">';
    s += '<label>Presupuesto:</label><br>';
    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control" maxlength="10" min="0" id="ipre" value="" placeholder="Ingrese el Presupuesto para esta área">';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-6">';
    s += '<label>N° de Trabajadores :</label><br>';
    s += '<div class="input-group">';
    s += '<div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>';
    s += '<input type="number"  class="form-control" id="intr" placeholder="Ingrese el número de trabajadores de esta área">';
    s += '</div>';
    s += '</div>';
    s += '</fieldset>';
    s += '<div class="form-actions">';
    s += '<div class="row">';
    s += '<div class="col-md-12">';
    s += '<div class="col-md-4"></div>';
    s += '<button class="btn btn-primary btn-lg col-md-4" type="button" onclick="saveB()" id="sbu" disabled>';
    s += 'Registrar';
    s += '</button>';
    s += '<div class="col-md-4"></div>';
    s += '</div>';
    s += '</div>';
    s += '</div>';

    s += '</form>';

    s += '</div>';
    s += '</div>';
    return s;
}

function createContentEdit() {
    var s = '<div class="panel panel-success">';
    s += '<div class="panel-heading"><h3><i class="fa fa-edit"></i>   Actualizar Presupuesto</h3></div>';
    s += '<div class="panel-body">';
    s += '<form class="">';
    s += '<fieldset>';
    s += '<legend>';
    s += 'Seleccionar Área';
    s += '</legend>';
    s += '<div class="row">';
    s += '<div class="form-group col-md-4 col-xs-4" >';
    s += '<label>Dirección :</label><br>';
    s += '<select class="form-control select_direccion" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-4" >';
    s += '<label>Departamento :</label><br>';
    s += '<select class="form-control select_dep" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-4" >';
    s += '<label>Área :</label><br>';
    s += '<select class="form-control select_area" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '</div>';
    s += '<input type="hidden" id="iArea">';
    s += '</fieldset>';
    s += '<div id="contH">';
    s += '<fieldset>';
    s += '<legend>';
    s += 'Gestión de Presupuesto';
    s += '</legend>';
    s += '<div class="row">';
    s += '<ul class="nav nav-pills">';
    s += '<li role="presentation" onclick="ch(this.id)" id="anual" class="se active"><a style="cursor: pointer">Anual</a></li>';
    s += '<li role="presentation" onclick="ch(this.id)" id="mensual" class="se"><a style="cursor: pointer">Mensual</a></li>';
    s += '<li role="presentation" onclick="ch(this.id)" id="inter" class="se"><a style="cursor: pointer">Definir Intervalo</a></li>';
    s += '</ul>';
    s += '<input type="hidden" id="estOPC">';
    s += '</div>';
    s += '<br/>';
    s += '<div class="row">';
    s += '<div class="form-group col-md-6 col-xs-6">';
    s += '<label>Fecha Inicio:</label><br>';
    s += '<input type="date" name="fec_i" class="form-control" length="45"  id="fe_i" onchange="getFecha(this.value)">';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-6">';
    s += '<label>Fecha Fin :</label><br>';
    s += '<input type="date" name="fec_f" class="form-control" size="45" maxlength="100"  id="fe_fin" disabled="">';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-6">';
    s += '<label>Presupuesto:</label><br>';

    s += '<div class="alert alert-warning" role="alert">';
    s += '<a class="alert-link" id="alpre"></a>';
    s += '</div>';

    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control" maxlength="10" min="0" id="ipre" value="" placeholder="Ingrese el Presupuesto para esta área">';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-6">';
    s += '<label>N° de Trabajadores :</label><br>';

    s += '<div class="alert alert-warning" role="alert">';
    s += '<a class="alert-link" id="altra"></a>';
    s += '</div>';

    s += '<div class="input-group">';
    s += '<div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>';
    s += '<input type="number"  class="form-control" id="intr" placeholder="Ingrese el número de trabajadores de esta área">';
    s += '</div>';
    s += '</div>';
    s += '</fieldset>';
    s += '<div class="form-actions">';
    s += '<div class="row">';
    s += '<div class="col-md-12">';
    s += '<div class="col-md-4"></div>';
    s += '<button class="btn btn-success btn-lg col-md-4" type="button" onclick="saveB()" disabled>';
    s += 'Actualizar';
    s += '</button>';
    s += '<div class="col-md-4"></div>';
    s += '</div>';
    s += '</div>';
    s += '</div>';
    s += '</div>';
    s += '</form>';
    s += '</div>';
    s += '</div>';
    s += '</div>';
    return s;
}

//CAMBIAR OPCIONES DE NAVEGADORES

function changeOption(id) {
    if (id === "v1") {
        $("#v2").attr("class", "list-group-item us");
        $("#v1").attr("class", "list-group-item us active");
        $("#vopt").attr("value", "1");
        $("#vcont").empty();
        $("#vcont").append(createContentAsignar());
        $("#estOPC").attr("value", "anual");
        var a = getFechaInit();
        getFechaAnual(a);
        init();
    }
    if (id === "v2") {
        $("#v1").attr("class", "list-group-item us");
        $("#v2").attr("class", "list-group-item us active");
        $("#vopt").attr("value", "2");
        $("#vcont").empty();
        $("#vcont").append(createContentEdit());
        $("#contH").hide();
        init();
    }
}

function ch(id) {
    $(".se").attr("class", "se");
    $("#" + id + "").attr("class", "se active");
    $("#estOPC").attr("value", id);
    $("#fe_i").attr("value", "");
    $("#fe_fin").attr("value", "");
    if (id === "inter") {
        jQuery("#fe_fin").removeAttr("disabled");
    } else {
        $("#fe_fin").attr("disabled", "");
    }
}

//GESTION DE FECHAS

function getFechaInit() {
    var f = new Date();
    var day = f.getDate();
    var month = (f.getMonth() + 1);
    var year = f.getFullYear();
    if (day < 10) {
        day.toString();
        day = "0" + day;
    }
    if (month < 10) {
        month.toString();
        month = "0" + month;
    }
    var m = year + "-" + month + "-" + day;
    return m;
}

function getFecha(fecha) {
    var com = $("#estOPC").val();
    if (com === "anual") {
        getFechaAnual(fecha);
    }
    if (com === "mensual") {
        setFechaMensual(fecha);
    }
}

function setFechaMensual(fecha) {
    var f = fecha.split("-");
    var year = f[0];
    var month = f[1];
    var day = f[2];
    month = parseInt(month) + 1;
    if (month < 10) {
        month.toString();
        month = "0" + month;
    }
    var m = year + "-" + month + "-" + day;
    $("#fe_fin").attr("value", m);
}

function getFechaAnual(fecha) {
    var f = fecha.split("-");
    var year = f[0];
    var month = f[1];
    var day = f[2];
    var m = year + "-" + month + "-" + day;
    $("#fe_i").attr("value", m);
    setFechaAnual(m);
}

function setFechaAnual(fecha) {
    var f = fecha.split("-");
    var year = f[0];
    var month = f[1];
    var day = f[2];
    year = parseInt(year) + 1;
    var m = year + "-" + month + "-" + day;
    $("#fe_fin").attr("value", m);
}

function convertir_fecha(fecha) {
    var fi = fecha.split("-");
    var year = fi[0];
    var month = fi[1];
    var day = fi[2];
    var s = day + '/' + month + '/' + year;
    return s;
}

//REGISTRAR PRESUPUESTO

function saveB() {
    var idArea = $("#iArea").val();
    var presupuesto = $("#ipre").val();
    var trabajadores = $("#intr").val();
    var f_inicio = $("#fe_i").val();
    var f_fin = $("#fe_fin").val();
    if (idArea !== "" && presupuesto !== "" && trabajadores !== "" && f_inicio !== "" && f_fin) {
        //Confirmar
        var confirmar = confirm("¿Está seguro que desea registrar este presupuesto?");
        if (confirmar) {
            var f_i = convertir_fecha(f_inicio);
            var f_f = convertir_fecha(f_fin);
            var url = '../../pres?opc=reg';
            var data = 'idA=' + idArea;
            data += '&PA=' + presupuesto;
            data += '&NT=' + trabajadores;
            data += '&f_i=' + f_i;
            data += '&f_fin=' + f_f;
            $.post(url, data, function (objJson) {
                if (objJson.rpta) {
                    dyn_notice();
                } else {
                    new PNotify({
                        title: 'Oh No!',
                        text: 'Un error ocurrió al registrar Presupuesto',
                        type: 'error'
                    });
                }
            });
        } else {
            new PNotify({
                title: 'No se registró',
                text: 'No se ha registrado el Presupuesto',
                type: 'info'
            });
        }

    } else {
        new PNotify({
            title: 'Campos Incompletos',
            text: 'Es necesario completar todo el formulario',
            type: 'info'
        });
    }
}

function dyn_notice() {
    var percent = 0;
    var notice = new PNotify({
        text: "Procesando",
        type: 'info',
        icon: 'fa fa-spinner fa-spin',
        hide: false,
        buttons: {
            closer: false,
            sticker: false
        },
        shadow: true,
        width: "300px"
    });

    setTimeout(function () {
        notice.update({
            title: false
        });
        var interval = setInterval(function () {
            percent += 2;
            var options = {
                text: percent + "% procesado"
            };
            if (percent == 80) {
                options.title = "Casi Listo";
            }
            if (percent >= 100) {
                window.clearInterval(interval);
                options.title = "Listo!";
                options.type = "success";
                options.hide = true;
                options.buttons = {
                    closer: true,
                    sticker: true
                };
                options.icon = 'fa fa-check';
                options.shadow = true;
                options.width = PNotify.prototype.options.width;
            }
            notice.update(options);
        }, 60);
    }, 600);
}


//SELECTORES CADENA

function listar_opciones(opc, id) {
    var ap = "";
    if (opc == 'Listar_direccion') {
        var a = $(".select_direccion");
        $(".select_dep").empty();
        $(".select_dep").append("<option value=''>[Seleccione]</option>");
        $(".selectarea").empty();
        $(".selectarea").append("<option value=''>[Seleccione]</option>");
        a.empty();
        a.append("<option value=''>[Seleccione]</option>");
    }
    if (opc == 'Listar_dir_dep') {
        var a = $(".select_dep");
        $(".selectarea").empty();
        $(".selectarea").append("<option value=''>[Seleccione]</option>");
        ap = "&id=" + id;
        a.empty();
        a.append("<option value=''>[Seleccione]</option>");
    }
    if (opc == 'Listar_area2') {
        var a = $(".select_area");
        ap = "&id=" + id;
        a.empty();
        a.append("<option value=''>[Seleccione]</option>");
    }
    $.post("../../Direccion_Puesto", "opc=" + opc + ap, function (objJson) {
        var list = objJson.lista;
        for (var i = 0; i < list.length; i++) {
            a.append("<option value='" + list[i].id + "'>" + list[i].nombre + "</option>");
        }
    });
}

function init() {
    var opc = 'Listar_direccion';
    var id = "";
    listar_opciones(opc, id);
    $(".select_direccion").change(function () {
        var opc = 'Listar_dir_dep';
        var id = $(".select_direccion").val();
        listar_opciones(opc, id);
    });
    $(".select_dep").change(function () {
        var opc = 'Listar_area2';
        var id = $(".select_dep").val();
        listar_opciones(opc, id);
    });
    $(".select_area").change(function () {
        var id = $(".select_area").val();
        $("#iArea").attr("value", id);
        if ($("#vopt").val() === "2") {
            listarActualPresupuesto(id);
        }
        if ($("#vopt").val() === "1") {
            statusPresupuesto(id);
        }
    });
}

//DATOS ACTUALES

function listarActualPresupuesto(idArea) {
    var url = '../../pres?opc=listActual';
    var data = 'idArea=' + idArea;
    $.post(url, data, function (objJson) {
        var datos = objJson.datos;
        var pres_ac = 0;
        var n_trab = 0;
        var tr = 0;
        var monto_i = 0;
        if (datos.length > 0) {
            $("#contH").show();
            var f_f = datos[0].fe_hasta.split(" ");
            var f_i = datos[0].fe_desde.split(" ");
            $("#fe_fin").attr("value", f_f[0]);
            $("#fe_i").attr("value", f_i[0]);
            monto_i = parseInt(datos[0].saldo);
            var trab = parseInt(datos[0].n_trabajadores);
            for (var i = 0; i < datos.length; i++) {
                var ca = 0;
                var monto_ac = datos[i].monto;
                var op = datos[i].operacion;
                if (parseInt(op) === 1) {
                    ca = parseFloat(monto_ac);
                }
                if (parseInt(op) === 2) {
                    ca = parseFloat(monto_ac) * (-1);
                }
                pres_ac = monto_i + ca;
                if (datos[i].operacion === "2" && datos[i].mtrabajador === "1") {
                    n_trab = n_trab + 1;
                }
                tr = parseInt(trab) - n_trab;
            }
            if (pres_ac === parseFloat(monto_i)) {
                $("#alpre").empty();
                $("#alpre").append("Aún no se ha usado el Presupuesto de esta área");
                $("#ipre").attr("value", pres_ac);
            } else {
                $("#alpre").empty();
                $("#alpre").append("$ " + ca * (-1) + " usados del presupuesto total de $ " + monto_i);
                $("#ipre").attr("value", pres_ac);
            }
            if (parseInt(tr) === parseInt(trab)) {
                $("#altra").empty();
                $("#altra").append("Aún no se ha contratado trabajadores con el presupuesto de esta área");
                $("#intr").attr("value", tr);
            } else {
                $("#altra").empty();
                if (parseInt(n_trab) > 1) {
                    $("#altra").append(n_trab + " trabajadores contratados de " + trab + " presupuestados");
                } else {
                    $("#altra").append(n_trab + " trabajador contratado de " + trab + " presupuestados");
                }
                $("#intr").attr("value", tr);
            }
        } else {
            alert("Area no presupuestada aún");
        }
    });
}

//PRESUPUESTO ACTIVO

function statusPresupuesto(idArea) {
    var url = '../../pres?opc=status';
    var data = 'idArea=' + idArea;
    $.post(url, data, function (objJson) {
        if (objJson.datos) {
            new PNotify({
                title: 'Área Presupuestada',
                text: 'Hay un Presupuesto Activo en esta Area',
                type: 'info'
            });
        } else {
            jQuery("#sbu").removeAttr("disabled");
        }
    });
}
