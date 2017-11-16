//AL CARGAR LA PAGINA
$(document).ready(function () {
    $("#vcont").empty();
    $("#vcont").append(createContentAsignar());
    $("#nmeses").hide();
    $("#rowFecha").hide();
    $("#estOPC").attr("value", "anual");
    var a = getFechaInit();
    /*$("#fe_i").attr("min", a);*/
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
    s += '<legend class="text-primary">';
    s += 'Destino de Presupuesto';
    s += '</legend>';
    s += '<div class="alert alert-info" role="alert">';
    s += '<i class="fa fa-info"></i>  El destino puede ser un <strong>Departamento</strong> o un <strong>Area</strong>. Los <strong>Centros de Costo</strong> se muestran dependiendo de esta eleccion';
    s += '</div>';
    s += '<div class="row">';
    s += '<div class="form-group col-md-4 col-xs-12" >';
    s += '<label class="text-primary">Dirección :</label><br>';
    s += '<select class="form-control select_direccion" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-12" >';
    s += '<label class="text-primary">Departamento :</label><br>';
    s += '<select class="form-control select_dep" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-12" >';
    s += '<label class="text-primary">Área :</label><br>';
    s += '<select class="form-control select_area" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-12" >';
    s += '<label class="text-success">Centro de Costos :</label><br>';
    s += '<select class="form-control select_cc" disabled>';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '</div>';
    s += '<input type="hidden" id="iDestino">';
    s += '</fieldset>';
    s += '<fieldset>';
    s += '<legend class="text-primary">';
    s += 'Gestión de Presupuesto';
    s += '</legend>';
    s += '<div class="row" style="margin-left:1%">';
    s += '<ul class="nav nav-pills">';
    s += '<li role="presentation" onclick="ch(this.id)" id="anual" class="se active"><a style="cursor: pointer">Anual</a></li>';
    s += '<li role="presentation" onclick="ch(this.id)" id="mensual" class="se"><a style="cursor: pointer">Mensual</a></li>';
    s += '<li role="presentation" onclick="ch(this.id)" id="inter" class="se"><a style="cursor: pointer">Personalizar</a></li>';
    s += '</ul>';
    s += '<input type="hidden" id="estOPC">';
    s += '</div>';
    s += '<br/>';
    s += '<div class="row">';

    s += '<div class="form-group col-md-4 col-xs-12" id="rowFecha">';
    s += '<label>Numero de Meses:</label><br>';
    s += '<input type="number" name="" class="form-control" onkeyup="calNM()" max="11" min="0" id="nmeses" value="" placeholder="Numero de Meses a Presupuestar">';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-12">';
    s += '<label>Fecha Inicio:</label><br>';
    s += '<input type="date" name="fec_i" class="form-control" length="45"  id="fe_i" onchange="getFecha(this.value)">';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-12">';
    s += '<label>Fecha Fin :</label><br>';
    s += '<input type="date" name="fec_f" class="form-control" size="45" maxlength="100"  id="fe_fin" disabled="">';
    s += '</div>';

    s += '</div>';

    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<label>Sueldo Basico:</label><br>';
    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control SP" maxlength="10" min="0" id="ipreA" onkeyup="suma()" placeholder="Ingrese el Presupuesto">';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<label>Asignacion Familiar:</label><br>';
    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control SP" maxlength="10" min="0" id="ipreB" onkeyup="suma()" placeholder="Ingrese el Presupuesto">';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<label>Bono Alimentario:</label><br>';
    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control SP" maxlength="10" min="0" id="ipreC" onkeyup="suma()"  placeholder="Ingrese el Presupuesto">';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<label>Bonificacion:</label><br>';
    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control SP" maxlength="10" min="0" id="ipreD" onkeyup="suma()"  placeholder="Ingrese el Presupuesto">';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-12 col-xs-12">';
    s += '<label>Presupuesto General:</label><br>';
    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control" maxlength="10" min="0" id="ipret" value="" placeholder="Presupuesto calculado" disabled>';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<div class="form-group col-md-12 col-xs-12">';
    s += '<label>N° de Trabajadores :</label><br>';
    s += '<div class="input-group">';
    s += '<div class="input-group-addon"><i class="fa fa-users"></i></div>';
    s += '<input type="number" onkeyup="calNT()" class="form-control" id="intr" placeholder="Número máximo de trabajadores">';
    s += '</div>';
    s += '</div>';
    s += '</div>';

    //cambiar
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<div class="form-group col-md-12 col-xs-12">';
    s += '<label class="text-primary">Sueldo aproximado de un trabajador por Mes:</label><br>';
    s += '<ul class="list-group col col-md-6">';
    s += '<li class="list-group-item"><span class="badge" id="cSB">0</span>Sueldo Básico</li>';
    s += '</ul>';
    s += '<ul class="list-group col col-md-6">';
    s += '<li class="list-group-item"><span class="badge" id="cAF">0</span>Asignacion Familiar</li>';
    s += '</ul>';
    s += '<ul class="list-group col col-md-6">';
    s += '<li class="list-group-item"><span class="badge" id="cBA">0</span>Bono Alimentos</li>';
    s += '</ul>';
    s += '<ul class="list-group col col-md-6">';
    s += '<li class="list-group-item"><span class="badge" id="cBO">0</span>Bonificaciones</li>';
    s += '</ul>';
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
    s += '<legend class="text-success">';
    s += 'Destino de Presupuesto';
    s += '</legend>';
    s += '<div class="row">';
    s += '<div class="form-group col-md-4 col-xs-12" >';
    s += '<label class="text-success">Dirección :</label><br>';
    s += '<select class="form-control select_direccion" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-12" >';
    s += '<label class="text-success">Departamento :</label><br>';
    s += '<select class="form-control select_dep" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-12" >';
    s += '<label class="text-success">Área :</label><br>';
    s += '<select class="form-control select_area" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-12" >';
    s += '<label class="text-success">Centro de Costos :</label><br>';
    s += '<select class="form-control select_cc" disabled>';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '</div>';
    s += '<input type="hidden" id="iDestino">';
    s += '</fieldset>';
    s += '<div id="contH">';
    s += '<fieldset>';
    s += '<legend class="text-primary">';
    s += 'Gestión de Presupuesto';
    s += '</legend>';
    s += '<div class="row" style="margin-left:1%">';
    s += '<ul class="nav nav-pills">';
    s += '<li role="presentation" onclick="ch(this.id)" id="anual" class="se active"><a style="cursor: pointer">Anual</a></li>';
    s += '<li role="presentation" onclick="ch(this.id)" id="mensual" class="se"><a style="cursor: pointer">Mensual</a></li>';
    s += '<li role="presentation" onclick="ch(this.id)" id="inter" class="se"><a style="cursor: pointer">Definir Intervalo</a></li>';
    s += '</ul>';
    s += '<input type="hidden" id="estOPC">';
    s += '</div>';
    s += '<br/>';
    s += '<div class="row">';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<label>Fecha Inicio:</label><br>';
    s += '<input type="date" name="fec_i" class="form-control" length="45"  id="fe_i" onchange="getFecha(this.value)">';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<label>Fecha Fin :</label><br>';
    s += '<input type="date" name="fec_f" class="form-control" size="45" maxlength="100"  id="fe_fin" disabled="">';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<label>Sueldo Basico:</label><br>';
    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control SP" maxlength="10" min="0" id="ipreA" onkeyup="suma()" placeholder="Presupuesto para los Sueldos">';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<label>Asignacion Familiar:</label><br>';
    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control SP" maxlength="10" min="0" id="ipreB" onkeyup="suma()" placeholder="Ingrese el Presupuesto para esta área">';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<label>Bono Alimentario:</label><br>';
    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control SP" maxlength="10" min="0" id="ipreC" onkeyup="suma()"  placeholder="Presupuesto para los Sueldos">';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<label>Bonificacion:</label><br>';
    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control SP" maxlength="10" min="0" id="ipreD" onkeyup="suma()"  placeholder="Ingrese el Presupuesto para esta área">';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-12 col-xs-12">';
    s += '<label>Presupuesto General:</label><br>';
    s += '<div class="input-group ">';
    s += '<div class="input-group-addon">$</div>';
    s += '<input type="number" name="sueldo" class="form-control" maxlength="10" min="0" id="ipret" value="" placeholder="Ingrese el Presupuesto para esta área" disabled>';
    s += '<div class="input-group-addon">.00</div>';
    s += '</div>';
    s += '</div>';
    s += '</div>';
    s += '<div class="form-group col-md-6 col-xs-12">';
    s += '<div class="form-group col-md-12 col-xs-12">';
    s += '<label>N° de Trabajadores :</label><br>';
    s += '<div class="input-group">';
    s += '<div class="input-group-addon"><i class="fa fa-users"></i></div>';
    s += '<input type="number"  class="form-control" id="intr" placeholder="Ingrese el número de trabajadores de esta área">';
    s += '</div>';
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
    s += '</div>';
    return s;
}

function createContentReport() {
    var s = '<div class="panel panel-info">';
    s += '<div class="panel-heading"><h3><i class="fa fa-list"></i> Presupuesto</h3></div>';
    s += '<div class="panel-body">';
    s += '<form class="">';
    s += '<fieldset>';
    s += '<legend>';
    s += 'Seleccionar Área';
    s += '</legend>';
    s += '<div class="row">';
    s += '<div class="form-group col-md-4 col-xs-12" >';
    s += '<label>Dirección :</label><br>';
    s += '<select class="form-control select_direccion" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-12" >';
    s += '<label>Departamento :</label><br>';
    s += '<select class="form-control select_dep" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '<div class="form-group col-md-4 col-xs-12" >';
    s += '<label>Área :</label><br>';
    s += '<select class="form-control select_area" >';
    s += '<option value="" selected disabled>[Seleccione]</option>';
    s += '</select>';
    s += '</div>';
    s += '</div>';
    s += '<button class="btn btn-info col col-md-3 col-xs-6 col-md-offset-9 col-xs-offset-6" type="button" onclick="history()">Ver Reporte</button>';
    s += '<input type="hidden" id="iDestino">';
    s += '</fieldset>';
    s += '<fieldset>';
    s += '<div id="contHI"></div>';
    s += '</fieldset>';
    s += '</form>';
    s += '</div>';
    s += '</div>';
    s += '</div>';
    return s;
}

//LISTAR HISTORIAL

function history() {
    var idDestino = $("#iDestino").val();
    var url = '../../pres?opc=listActual';
    var data = 'idDes=' + idDestino;
    $.post(url, data, function (objJson) {
        var datos = objJson.datos;
        if (datos.length > 0) {
            var m = '';
            for (var i = 0, max = datos.length; i < max; i++) {
                var datos = objJson.datos;
                var sbgeneral = parseInt(datos[0].sbgeneral);
                var afgeneral = parseInt(datos[0].afgeneral);
                var bageneral = parseInt(datos[0].bageneral);
                var bogeneral = parseInt(datos[0].bogeneral);
                var n_trabajadores = parseInt(datos[0].n_trabajadores);
                var fe_i=datos[0].fe_desde;
                var fe_f=datos[0].fe_hasta;
                var monto_i = sbgeneral + afgeneral + bageneral + bogeneral;

                /*var sbacum = 0;//sueldo basico acumulado
                 var afacum = 0;//asignacion familiar acumulado
                 var baacum = 0;//bono alimentario acumulado
                 var boacum = 0;//bonificacion acumulado
                 var monacum = 0;//MONTO TOTAL acumulado
                 /*m += '<tr>';
                 m += '<td><center>' + (i + 1) + '</center></td>';
                 m += '<td><center>' + datos[i].f_modif + '</center></td>';
                 if (datos[i].operacion === "0") {
                 m += '<td><center>Presupuesto Inicial</center></td>';
                 }
                 if (datos[i].operacion === "2") {
                 m += '<td><center>Contratacion de Trabajador</center></td>';
                 }
                 if (datos[i].operacion === "1") {
                 m += '<td><center>Retiro de Trabajador</center></td>';
                 }
                 m += '<td><center>' + datos[i].sbdet + '</center></td>';
                 m += '<td><center>' + datos[i].afdet + '</center></td>';
                 m += '<td><center>' + datos[i].badet + '</center></td>';
                 m += '<td><center>' + datos[i].bodet + '</center></td>';
                 m += '</tr>';
                 if (datos[i].operacion === "2" && datos[i].ctrabajador !== "0") {
                 //Calculo de Sueldo Basico                    
                 sbacum = sbacum + parseInt(datos[i].sbdet);
                 //Calculo de Asignacion Familiar
                 afacum = afacum + parseInt(datos[i].afdet);
                 //Calculo de Bono Alimentario
                 baacum = baacum + parseInt(datos[i].badet);
                 //Calculo de Bonificacion
                 boacum = boacum + parseInt(datos[i].bodet);
                 }*/
            }
            var url = '../../pres?opc=hist_con';
            var data = 'idDes=' + idDestino;
            $.post(url, data, function (objJson) {
                var lista = objJson.datos;
                console.log(lista);
                if (lista.length > 0) {
                    for (var i = 0, max = lista.length; i < max; i++) {
                        m += '<tr>';
                        m += '<td><center>' + (i + 1) + '</center></td>';
                        m += '<td><center>' + lista[i].fe_creacion + '</center></td>';
                        m += '<td><center>Contratacion de Trabajador</center></td>';
                        m += '<td><center>' + lista[i].ca_sueldo + '</center></td>';
                        m += '<td><center>' + lista[i].ca_asig_familiar + '</center></td>';
                        m += '<td><center>' + lista[i].ca_bono_alimento + '</center></td>';
                        m += '<td><center>' + lista[i].ca_bonificacion_p + '</center></td>';
                        m += '</tr>';
                    }
                    $("#dHis").append(m);
                    $("#idTab").dataTable({
                        "language": {
                            "sProcessing": "Procesando...",
                            "sLengthMenu": "Mostrar _MENU_ registros",
                            "sZeroRecords": "No se encontraron resultados",
                            "sEmptyTable": "Ningún dato disponible en esta tabla",
                            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                            "sInfoPostFix": "",
                            "sSearch": "Buscar:",
                            "sUrl": "",
                            "sInfoThousands": ",",
                            "sLoadingRecords": "Cargando...",
                            "oPaginate": {
                                "sFirst": "Primero",
                                "sLast": "Último",
                                "sNext": "Siguiente",
                                "sPrevious": "Anterior"
                            },
                            "oAria": {
                                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                            }
                        }
                    });
                }
            });
            /*monacum = sbacum + afacum + baacum + boacum;
             var mt = monto_i - monacum;
             var sb = sbgeneral - sbacum;
             var af = afgeneral - afacum;
             var ba = bageneral - baacum;
             var bo = bogeneral - boacum;*/

            $("#contHI").empty();
            $("#contHI").append(createTableH(sbgeneral, afgeneral, bageneral, bogeneral, monto_i, n_trabajadores,fe_i,fe_f));
            $("#dHis").empty();


        } else {
            //No tiene data para mostrar
            new PNotify({
                title: 'Sin Historial',
                text: 'No se tiene un historial de presupuesto de este destino',
                type: 'info'
            });
        }
    });
}

function createTableH(sb, af, ba, bo, saldo, n_trabajadores,fe_i,fe_f) {
    var s = '<legend class="text-info">';
    s += 'Historial';
    s += '</legend>';

    s += '<div class="panel panel-info>';
    s += '<div class="panel-heading"><p class="text-success">El Presupuesto inicial fue de  $ <strong>' + saldo + '</strong> para <strong>' + n_trabajadores + '</strong> trabajadores entre <strong>'+fe_i+'</strong> y <strong>'+fe_f+'</strong></p></div>';
    s += '<ul class="list-group col col-md-3">';
    s += '<li class="list-group-item"><span class="badge">' + sb + '</span>Sueldo Básico</li>';
    s += '</ul>';
    s += '<ul class="list-group col col-md-3">';
    s += '<li class="list-group-item"><span class="badge">' + af + '</span>Asignacion Familiar</li>';
    s += '</ul>';
    s += '<ul class="list-group col col-md-3">';
    s += '<li class="list-group-item"><span class="badge">' + ba + '</span>Bono Alimentos</li>';
    s += '</ul>';
    s += '<ul class="list-group col col-md-3">';
    s += '<li class="list-group-item"><span class="badge">' + bo + '</span>Bonificaciones</li>';
    s += '</ul>';
    s += '</div>';

    s += '<table id="idTab">';
    s += '<thead>';
    s += '<tr>';
    s += '<th colspan="1"></th>';
    s += '<th colspan="1"></th>';
    s += '<th colspan="1"></th>';
    s += '<th colspan="4"><center>Detalle</center></th>';
    s += '</tr>';
    s += '<tr>';
    s += '<th><center>N°</center></th>';
    s += '<th><center>Fecha y Hora</center></th>';
    s += '<th><center>Operacion</center></th>';
    s += '<th><center>Sueldo Básico</center></th>';
    s += '<th><center>Asignacion Familiar</center></th>';
    s += '<th><center>Bono Alimentos</center></th>';
    s += '<th><center>Bonificaciones</center></th>';
    s += '</tr>';
    s += '</thead>';
    s += '<tbody id="dHis">';
    s += '</tbody>';
    s += '</table>';
    return s;
}

//CAMBIAR OPCIONES DE NAVEGADORES

function changeOption(id) {
    if (id === "v1") {
        $("#v2").attr("class", "list-group-item us");
        $("#v3").attr("class", "list-group-item us");
        $("#v1").attr("class", "list-group-item us active");
        $("#vopt").attr("value", "1");
        $("#vcont").empty();
        $("#vcont").append(createContentAsignar());
        $("#rowFecha").hide();
        $("#estOPC").attr("value", "anual");
        var a = getFechaInit();
        getFechaAnual(a);
        init();
    }
    if (id === "v2") {
        $("#v1").attr("class", "list-group-item us");
        $("#v3").attr("class", "list-group-item us");
        $("#v2").attr("class", "list-group-item us active");
        $("#vopt").attr("value", "2");
        $("#vcont").empty();
        $("#vcont").append(createContentEdit());
        $("#contH").hide();
        init();
    }
    if (id === "v3") {
        $("#v1").attr("class", "list-group-item us");
        $("#v2").attr("class", "list-group-item us");
        $("#v3").attr("class", "list-group-item us active");
        $("#vopt").attr("value", "3");
        $("#vcont").empty();
        $("#vcont").append(createContentReport());
        $("#contH").hide();
        init();
    }
}

function calNM() {
    var x = $("#nmeses").val();
    if (x !== "") {
        if (parseInt(x) > 11) {
            new PNotify({
                title: 'Limite de meses excedido',
                text: 'Limite máximo de 11 meses',
                type: 'warning'
            });
            $("#fe_i").attr("disabled", "");
        } else {
            jQuery("#fe_i").removeAttr("disabled");
        }
    } else {
        $("#fe_i").attr("disabled", "");
    }

}

function ch(id) {
    $(".se").attr("class", "se");
    $("#" + id + "").attr("class", "se active");
    $("#estOPC").attr("value", id);
    $("#fe_i").attr("value", "");
    $("#fe_fin").attr("value", "");
    if (id === "mensual") {
        $("#fe_i").attr("disabled", "");
        $("#nmeses").show();
        $("#rowFecha").show();
    } else {
        $("#rowFecha").hide();
    }
    if (id === "inter") {
        $("#rowFecha").hide();
        jQuery("#fe_fin").removeAttr("disabled");
        jQuery("#fe_i").removeAttr("disabled");
    } else {
        $("#fe_fin").attr("disabled", "");
    }
    if (id === "anual") {
        jQuery("#fe_i").removeAttr("disabled");
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
        var nm = 0;
        if ($("#nmeses").val() === "") {
            nm = 0;
        } else {
            nm = parseInt($("#nmeses").val());
        }
        setFechaMensual(fecha, nm);
    }
}

function setFechaMensual(fecha, nm) {
    nm = parseInt(nm);
    var f = fecha.split("-");
    var year = f[0];
    var month = f[1];
    var day = f[2];
    year = parseInt(year);
    month = parseInt(month);
    var x = 12 - month;
    if (x >= nm) {
        month = month + nm;
    } else {
        month = nm - x;
        year = year + 1;
    }
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
    var tipo = $("#tipo_p").val();
    var idDestino = "";
    if (tipo === "1") {
        idDestino = $("#iDestino").val();
    }
    if (tipo === "2") {
        idDestino = $("#iDestino").val();
    }
    var cc = $("#id_cc").val();
    //var presupuesto = $("#ipret").val();
    var trabajadores = $("#intr").val();
    var f_inicio = $("#fe_i").val();
    var f_fin = $("#fe_fin").val();
    if (idDestino !== "" && trabajadores !== "" && f_inicio !== "" && f_fin !== "" && cc !== "") {
//Confirmar
        var confirmar = confirm("¿Está seguro que desea registrar este presupuesto?");
        if (confirmar) {
            var iA = $("#ipreA").val();
            var iB = $("#ipreB").val();
            var iC = $("#ipreC").val();
            var iD = $("#ipreD").val();
            if (iA === "") {
                iA = 0;
            }
            if (iB === "") {
                iB = 0;
            }
            if (iC === "") {
                iC = 0;
            }
            if (iD === "") {
                iD = 0;
            }
            var f_i = convertir_fecha(f_inicio);
            var f_f = convertir_fecha(f_fin);
            var url = '../../pres?opc=reg';
            var data = 'idDes=' + idDestino;
            data += '&NT=' + trabajadores;
            data += '&f_i=' + f_i;
            data += '&f_fin=' + f_f;
            data += '&SB=' + iA;
            data += '&AF=' + iB;
            data += '&BA=' + iC;
            data += '&BO=' + iD;
            data += '&idCC=' + cc;
            data += '&tipo=' + tipo;
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
        $(".select_area").empty();
        $(".select_area").append("<option value=''>[Seleccione]</option>");
        a.empty();
        a.append("<option value=''>[Seleccione]</option>");
    }
    if (opc == 'Listar_dir_dep') {
        var a = $(".select_dep");
        $(".select_area").empty();
        $(".select_area").append("<option value=''>[Seleccione]</option>");
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
        $("#iDestino").attr("value", id);
        $("#tipo_p").attr("value", 2);
        if ($("#vopt").val() === "2") {
            listarActualPresupuesto(id);
        }
        if ($("#vopt").val() === "1") {
            statusPresupuesto(id, "dep");
        }
    });
    $(".select_area").change(function () {
        var id = $(".select_area").val();
        $("#iDestino").attr("value", id);
        $("#tipo_p").attr("value", 1);
        if ($("#vopt").val() === "2") {
            listarActualPresupuesto(id);
        }
        if ($("#vopt").val() === "1") {
            statusPresupuesto(id, "area");
        }
    });
    $(".select_cc").change(function () {
        var id = $(".select_cc").val();
        $("#id_cc").attr("value", id);
        jQuery("#sbu").removeAttr("disabled");
    });
}

//DATOS ACTUALES

function listarActualPresupuesto(id) {
    var url = '../../pres?opc=listActual';
    var data = 'idDes=' + id;
    $.post(url, data, function (objJson) {
        var datos = objJson.datos;
        var sbgeneral = 0;//sueldo basico inicial
        var afgeneral = 0;//asignacion familiar inicial
        var bageneral = 0;//bono alimentario inicial
        var bogeneral = 0;//bonificacion inicial
        var monto_i = 0;//MONTO TOTAL INICIAL
        var trab = 0;//Numero de trabajadores inicialmente

        var sbacum = 0;//sueldo basico acumulado
        var afacum = 0;//asignacion familiar acumulado
        var baacum = 0;//bono alimentario acumulado
        var boacum = 0;//bonificacion acumulado
        var monacum = 0;//MONTO TOTAL acumulado
        var tracum = 0;//Numero de trabajadores acumulado

        if (datos.length > 0) {

            $("#contH").show();

            var f_f = datos[0].fe_hasta.split(" ");
            var f_i = datos[0].fe_desde.split(" ");
            $("#fe_fin").attr("value", f_f[0]);
            $("#fe_i").attr("value", f_i[0]);
            sbgeneral = parseInt(datos[0].sbgeneral);
            afgeneral = parseInt(datos[0].afgeneral);
            bageneral = parseInt(datos[0].bageneral);
            bogeneral = parseInt(datos[0].bogeneral);
            monto_i = sbgeneral + afgeneral + bageneral + bogeneral;
            trab = parseInt(datos[0].n_trabajadores);

            opcCCDefault(datos[0].iddestino, datos[0].idccosto, datos[0].tipo);

            if (datos.length > 1) {

                for (var i = 0, max = datos.length; i < max; i++) {
                    if (datos[i].operacion === "2" && datos[i].ctrabajador !== "0") {
                        //Calculo de Sueldo Basico                    
                        sbacum = sbacum + parseInt(datos[i].sbdet);
                        //Calculo de Asignacion Familiar
                        afacum = afacum + parseInt(datos[i].afdet);
                        //Calculo de Bono Alimentario
                        baacum = baacum + parseInt(datos[i].badet);
                        //Calculo de Bonificacion
                        boacum = boacum + parseInt(datos[i].bodet);

                        tracum = tracum + 1;
                    }
                }
                monacum = sbacum + afacum + baacum + boacum;
                var mt = monto_i - monacum;
                var tt = trab - tracum;
                $("#ipreA").attr("value", sbgeneral - sbacum);
                $("#ipreB").attr("value", afgeneral - afacum);
                $("#ipreC").attr("value", bageneral - baacum);
                $("#ipreD").attr("value", bogeneral - boacum);
                $("#ipret").attr("value", mt);
                $("#intr").attr("value", tt);

            } else {//No se ha modificado el presupuesto inicial
                $("#ipreA").attr("value", sbgeneral);
                $("#ipreB").attr("value", afgeneral);
                $("#ipreC").attr("value", bageneral);
                $("#ipreD").attr("value", bogeneral);
                $("#ipret").attr("value", monto_i);
                $("#intr").attr("value", trab);
            }

        } else {
            $("#contH").hide();
            new PNotify({
                title: 'No Presupuestado',
                text: 'Este Departamento/Area no está presupuestado',
                type: 'info'
            });

        }
    });
}

//PRESUPUESTO ACTIVO

function statusPresupuesto(idDestino, tipo) {
    var url = '../../pres?opc=status';
    var data = 'idDes=' + idDestino;
    $.post(url, data, function (objJson) {
        if (objJson.rpta) {
            new PNotify({
                title: 'Presupuesto activo',
                text: 'Ya se tiene un presupuesto activo en este Destino',
                type: 'info'
            });
            $(".select_cc").attr("disabled", "");
        } else {
            listCCostos(idDestino, tipo);
        }
    });
}

//ACTUALIZAR PRESUPUESTO

function saveS() {
    var idArea = $("#iDestino").val();
    var presupuesto = $("#ipre").val();
    var trabajadores = $("#intr").val();
    var f_inicio = $("#fe_i").val();
    var f_fin = $("#fe_fin").val();
    if (idArea !== "" && presupuesto !== "" && trabajadores !== "" && f_inicio !== "" && f_fin) {
        console.log(idArea);
        console.log(presupuesto);
        console.log(trabajadores);
        console.log(f_inicio);
        console.log(f_fin);
    }

}

function suma() {
    var sum = 0;
    var sb = $("#ipreA").val();
    var af = $("#ipreB").val();
    var ba = $("#ipreC").val();
    var b = $("#ipreD").val();
    if (sb === "") {
        sb = 0;
    }
    if (af === "") {
        af = 0;
    }
    if (ba === "") {
        ba = 0;
    }
    if (b === "") {
        b = 0;
    }
    sum = parseInt(sb) + parseInt(af) + parseInt(ba) + parseInt(b);
    $("#ipret").attr("value", sum);
    if ($("#intr").val() !== "") {
        sueldoAprox(parseInt($("#intr").val()));
    }

}

function calNT() {
    var a = parseInt($("#intr").val());
    if (a !== "") {
        sueldoAprox(parseInt(a));
    } else {
        $("#cSB").empty();
        $("#cSB").append(0);
        $("#cAF").empty();
        $("#cAF").append(0);
        $("#cBA").empty();
        $("#cBA").append(0);
        $("#cBO").empty();
        $("#cBO").append(0);
    }
}

function sueldoAprox(ntra) {
    var t = $("#estOPC").val();
    var nm = 0;
    if (t === "anual") {
        nm = 14;
    }
    if (t === "mensual") {
        nm = parseInt($("#nmeses").val());
    }
    if (t === "") {
        nm = 0;
    }
    var sb = $("#ipreA").val();
    var af = $("#ipreB").val();
    var ba = $("#ipreC").val();
    var b = $("#ipreD").val();
    if (sb === "") {
        sb = 0;
    }
    if (af === "") {
        af = 0;
    }
    if (ba === "") {
        ba = 0;
    }
    if (b === "") {
        b = 0;
    }
    var sc = 0;
    var ss = sb / nm / ntra;
    var sa = af / nm / ntra;
    if (nm === 14) {
        sc = ba / 12 / ntra;
    } else {
        sc = ba / nm / ntra;
    }
    var so = b / nm / ntra;
    $("#cSB").empty();
    $("#cSB").append(ss.toFixed(2));
    $("#cAF").empty();
    $("#cAF").append(sa.toFixed(2));
    $("#cBA").empty();
    $("#cBA").append(sc.toFixed(2));
    $("#cBO").empty();
    $("#cBO").append(so.toFixed(2));
}

/*function listCCostos(id, tipo) {
    console.log("asdasd");
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
    console.log(data);
    $.post(url, data, function (objJson) {
        var a = $(".select_cc");
        var lista = objJson.datos;
        if (lista.length > 0) {
            jQuery(".select_cc").removeAttr("disabled");
            a.empty();
            a.append("<option value=''>[Seleccione]</option>");
            for (var i = 0; i < lista.length; i++) {
                a.append("<option value='" + lista[i].idccosto + "'>" + lista[i].codigo + " - " + lista[i].denominacion + "</option>");
            }
        } else {
            a.empty();
            a.append("<option value=''>[Seleccione]</option>");
            new PNotify({
                title: 'No hay Centros de Costo',
                text: text + 'no tiene centros de costos disponibles',
                type: 'info'
            });
        }
    });
}*/

function opcCCDefault(id, idCC, tipo) {
    var url = '../../pres?opc=ccosto';
    var data = '';
    if (tipo === "2") {
        data += 'id=' + id;
        data += '&tipo=2';
    }
    if (tipo === "1") {
        data += 'id=' + id;
        data += '&tipo=1';
    }
    $.post(url, data, function (objJson) {
        var a = $(".select_cc");
        var lista = objJson.datos;
        if (lista.length > 0) {
            jQuery(".select_cc").removeAttr("disabled");
            a.empty();
            a.append("<option value=''>[Seleccione]</option>");

            for (var i = 0; i < lista.length; i++) {
                if (lista[i].idccosto === idCC) {
                    a.append("<option value='" + lista[i].idccosto + "' selected>" + lista[i].denominacion + "</option>");
                } else {
                    a.append("<option value='" + lista[i].idccosto + "'>" + lista[i].denominacion + "</option>");
                }
            }
            jQuery("#sbu").removeAttr("disabled");
        } else {
            a.empty();
            a.append("<option value=''>[Seleccione]</option>");
            new PNotify({
                title: 'No hay Centros de Costo',
                text: 'no tiene centros de costos disponibles',
                type: 'info'
            });
            $("#sbu").attr("disabled", "");
        }
    });
}

