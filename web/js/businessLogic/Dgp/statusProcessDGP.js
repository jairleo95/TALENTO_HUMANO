/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// DO NOT REMOVE : GLOBAL FUNCTIONS!

function ListarMotivo(at) {
    alert("asdasdasd");
    var id = $(".vHist" + at + "").val();
    var url = '../../dgp?opc=SeguimientoH';
    var data = 'iddgp=' + id;
    $.post(url, data, function (objJson) {
        var lista = objJson.listar;
        if (lista.length > 0) {
            var ma = '';
            for (var i = 0; i < lista.length; i++) {
                //  alert("asdasdasd");
                $(".contMO").append("<td>" + lista[i].getDe_pasos + "</td>");
                $(".contMO").append("<td class='alert alert-danger'>" + lista[i].id_dgp + "</td>");
            }
            $(".contMO").empty();
        } else {
            alert("vacio");
        }
    });
}
function listHistory(at) {
    var dgp = "id_dgp";
    var id = $(".vHist" + at + "").val();
    var id1 = $(".idDepart").val();
    var url = '../../dgp?opc=SeguimientoH';
    var data = 'iddgp=' + id;
    var rol = $("#rolse").val();
    $.post(url, data, function (objJson) {
        var lista = objJson.listar;
        if (lista.length > 0) {
            var m = '';
            for (var i = 0; i < lista.length; i++) {
                m += '<tr>';
                m += '<td>' + lista[i].nu_pasos + '</td>';
                m += '<td>' + lista[i].de_pasos + '</td>';
                if (lista[i].es_autorizacion !== null) {
                    if (lista[i].es_autorizacion !== null) {
                        if (lista[i].es_autorizacion === '1') {
                            m += '<td><img src="../../img/Aprobado.png" width="20" height="20"></td>';
                        }
                        if (lista[i].es_autorizacion === '2') {
                            m += '<td><img src="../../img/Desaprobado.png" width="20" height="20"></td>';
                        }
                    } else {
                        m += '<td>No Registrado</td>';
                    }
                    if (lista[i].us_ap_mat !== null) {
                        m += '<td>' + lista[i].us_ap_p + " " + lista[i].us_ap_mat + " " + lista[i].us_no_tr + '</td>';
                    } else {
                        alert("No Registrado");
                    }
                    m += '<td>' + lista[i].us_no_puesto + '</td>';
                    m += '<td>' + lista[i].no_usuario + '</td>';
                    m += '<td>' + lista[i].us_no_area + '</td>';
                    m += '<td>' + lista[i].us_no_dep + '</td>';
                    m += '<td>' + lista[i].fe_creacion + '</td>';
                    m += '<td>' + lista[i].taskNum + ' dias.</td>';
                } else {
                    m += '<td colspan="7" style="text-align:center;"> No definido </td>';
                }

                m += '</tr>';
                if (lista[i].es_autorizacion !== null) {
                    if (lista[i].es_autorizacion === '2' & (rol === "ROL-0002" || rol === "ROL-0005" || rol === "ROL-0001")) {
                        function DivEspecial() {
                            var html = '<div id="divEs" class="alert alert-danger alert-block">';
                            html += '<a class="close" data-dismiss="alert" href="#">×</a>';
                            html += ' <h4 class="alert-heading">DGP fuera de Proceso!</h4>';
                            html += '<p>El DGP se ha rechazado por un Usuario... <a href="../../autorizacion?opc=HDGP&iddgp=' + id + '&ID' + id1
                                    + '" class="btn btn-primary"><strong><i class="fa fa-arrow-circle-right"></i> Habilitar</strong></a>  <a href="../../dgp?opc=MODIFICAR REQUERIMIENTO&iddgp='
                                    + id + '" class="btn btn-primary id-dgp "><strong><i class="fa fa-pencil-square-o"></i> Editar DGP</strong></a> <a data-toggle="modal" class="btn btn-primary" onclick="ListarMotivo()" data-toggle="modal" data-target="#myModalComentario"><i class="glyphicon glyphicon-remove"></i> Ver Motivo</a>';
                            if (rol === "ROL-0001") {
                                html += '<a href="../../autorizacion?opc=eliminarDGP&iddgp=' + id + '" class="btn btn-danger"><strong><i class="fa fa-arrow-circle-right"></i> Eliminar DGP</strong></a>';
                            }
                            //  alert(+lista[i].us_no_puesto+);                                                                                                                                                                                                                                                                                                                                                                                
                            html += '</p>';
                            html += '<input type="hidden" class="id-autorizacion" value="lista[i].id_autorizacion">';
                            html += '</div>';

                            return html;
                        }
                    }
                }

            }
            //var DivEspecial = DivEspecialL();
            var table = createTable();
            $(".contM").empty();
            $(".contM").append(table);
            $(".contM").append(DivEspecial);
            $("#dataB").empty();
            $("#dataB").append(m);
        } else {
            alert("vacio");
        }
    });
}
function createTable() {
    var table = '<table id="dt" class="table table-striped">';
    table += '<thead>';
    table += '<tr>';
    table += '<th>Paso</th>';
    table += '<th data-hide="phone,tablet"><i class="fa fa-fw fa-calendar txt-color-blue hidden-md hidden-sm hidden-xs"></i>Detalle</th>';
    table += '<th data-class="expand><i class="fa fa-fw fa-user text-muted hidden-md hidden-sm hidden-xs"></i> Estado</th>';
    table += '<th data-hide="phone"><i class="fa fa-fw fa-phone text-muted hidden-md hidden-sm hidden-xs"></i> Encargado</th>';
    table += '<th>Cargo Encargado</th>';
    table += '<th>Usuario</th>';
    table += '<th data-hide="phone,tablet"> <i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Area</th>';
    table += '<th data-hide="phone,tablet">Departamento</th>';
    table += '<th data-hide="phone,tablet">Fecha Autorizacion</th>';
    table += '<th data-hide="phone,tablet">Tiempo en autorizar</th>';
    table += '</tr>';
    table += '</thead>';
    table += '<tbody id="dataB">';
    table += '</tbody>';
    table += '</table>';
    return table;
}


// DO NOT REMOVE : GLOBAL FUNCTIONS!
function closedthis() {
    $.smallBox({
        title: "¡DGP registrada correctamente!",
        content: "Ya puede visualizar la informacion del DGP",
        color: "#739E73",
        iconSmall: "fa fa-check fa-2x fadeInRight animated",
        timeout: 6000
    });
}
function closedthis2() {
    $.smallBox({
        title: "¡Documentos del trabajador registrados correctamente!",
        content: "ya puede visualizar toda los documentos del trabajador...",
        color: "#739E73",
        iconSmall: "fa fa-check fa-2x fadeInRight animated",
        timeout: 6000
    });
}
function printDetProceso(objProgAut, postData) {
    objProgAut.empty();
    objProgAut.append('<img src="../../img/ajax-loader/horizontal_fountain.gif" />');
    $.ajax({
        url: "../../dgp",
        data: "opc=Imprimir_det_proceso" + postData,
        type: 'POST', async: true,
        success: function (data, textStatus, jqXHR) {
            if (data.rpta === "1") {
                objProgAut.hide();
                objProgAut.empty();
                objProgAut.append(data.html);
                objProgAut.show(250);
                objProgAut.find(".new-circle").popover({trigger: 'hover click'});
            } else {
                console.log('ocurrio un error al obtener el detalle del proceso');
            }
        }
    });
}

function initStatusProcessDGP() {
    var responsiveHelper_dt_basic = undefined;
    var breakpointDefinition = {
        tablet: 1024,
        phone: 480
    };
    var table_req = $('#dt_basic').dataTable({
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                "t" +
                "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "autoWidth": true,
        "preDrawCallback": function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper_dt_basic) {
                responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
            }
        },
        "rowCallback": function (nRow) {
            responsiveHelper_dt_basic.createExpandIcon(nRow);
        },
        "drawCallback": function (oSettings) {
            responsiveHelper_dt_basic.respond();
        }
    });

    /* END BASIC */
    var rows = table_req.fnGetNodes();
    for (var i = 0; i < rows.length; i++) {
        var obj = $(rows[i]).find(".prog_aut");
        printDetProceso(obj, obj.data("value"));
    }
    var responsiveHelperCAacademico = undefined;
    var varTableCAcademica = $(".tableEsCargaAcademica").dataTable({
        "ajax": {
            "url": "../../carga_academica",
            "type": "POST",
            "dataSrc": "list",
            "data": {
                "opc": "listEsCargaAcademica"
            }
        }, "columns": [
            {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            },
            {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            },
            {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            },
            {"data": "ap_paterno"},
            {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            },
            {"data": "no_dep"}, {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            }
        ],
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>"
                + "t"
                + "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "oLanguage": {
            "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
        },
        "autoWidth": true,
        "preDrawCallback": function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelperCAacademico) {
                responsiveHelperCAacademico = new ResponsiveDatatablesHelper(
                        $('.tableEsCargaAcademica'),
                        breakpointDefinition);
            }
        },
        "rowCallback": function (row, data, index) {
            responsiveHelperCAacademico.createExpandIcon(row);
            $('td:eq(0)', row).html(index + 1);
            $('td:eq(0)', row).html(data.mes_procesamiento);
            $('td:eq(2)', row)
                    .html(
                            '<div class="btn-group">'
                            + '   <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">'
                            + '   <i class="fa fa-gear fa-lg"></i>'
                            + '     <i class="fa fa-caret-down"></i>'
                            + ' </button>'
                            + ' <ul class="dropdown-menu">'
                            + '     <li><a href="../../dgp?iddgp=' + data.id_dgp + '&opc=User_Aut">Usuarios - Prox. Autorizacion</a></li>'
                            + '<li><a href="../../dgp?iddgp=' + data.id_dgp + '&opc=Seguimiento">Ver Historial</a> </li>'
                            + '<li><a href="../../documento?iddgp=' + data.id_dgp + '&idtr=' + data.id_trabajador + '&opc=Ver_Documento">Ver Documentos</a></li>'
                            + ' <li><a data-valor="' + data.id_dgp + ';' + data.id_trabajador + ';' + data.ap_paterno + ' ' + data.ap_materno + ' ' + data.no_trabajador + '" class="click" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false" onclick="sendAjaxComment()" >Comentario</a></li>'
                            + ' <li><a href="../../solicitud_requerimiento?iddgp=' + data.id_dgp + '&opc=Reg_List_Solicitud">Hacer Solicitud</a></li>'
                            + ' <li class="divider"></li><li>'
                            + '<li><a href="../../dgp?iddgp=' + data.id_dgp + '&idtr=' + data.id_trabajador + '&opc=Detalle">Ver Requerimiento</a> </li>'
                            + ' </ul>'
                            + ' </div>'
                            );
            if (data.es_dgp === "2") {
                $('td:eq(6)', row).html('<span class="label label-danger">Fuera de Proceso</span>');
            } else {
                $('td:eq(6)', row).html('<span class="label label-primary">En Proceso</span>');
            }
            $('td:eq(3)', row).html(data.ap_paterno + ' ' + data.ap_materno + ' ' + data.no_trabajador);
            // var rows = varTableCAcademica.fnGetNodes();
            //   for (var i = 0; i < rows.length; i++) {
            //  var obj = $(rows[i]).find(".prog_aut");
            printDetProceso($('td:eq(4)', row), "&dgp=" + data.id_dgp + "&idrp=" + data.id_detalle_req_proceso + "&iddep=" + data.id_departamento);
            $('td:eq(4)', row).addClass("new-progress");
            // }

        }, "drawCallback": function (oSettings) {
            responsiveHelperCAacademico.respond();
            console.log("Enter to drawCallBack CAcademico");
        }, "initComplete": function (settings, json) {
            // console.log(json.list);
            $(".badgeCAcademico").text(json.list.length).show();
        }
    });
}
$(document).ready(function () {
    pageSetUp();
    $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
        $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
    });
    $('#coment-s1').click(function () {
        console.log("jalar comentario");
        $.get('../../comentario?iddgp=DGP-000119&opc=Comentar_Dgp', function (responseJson) {
            var $select = $('.comentarios');
            $select.find('h2').remove();
            $.each(responseJson, function (value) {
                $('<p>').text(value).appendTo($select);
            });
        });
    });
    $(".seeDocuments").click(function () {
        $('.modalDocument').modal({keyboard: false, backdrop: 'static'});
        $('.modalDocument').modal('show');
        $(".modalTitle").text("Documentos del Trabajador");

        idtr = $(this).data("idtr");
        iddgp = $(this).data("iddgp");
        pathRequest = "../../";
        showDocuments(iddgp, idtr, false, false);
        return false;
    });
    initStatusProcessDGP();
    $(".btnHorario").click(function () {
        listHorario($(this).data("valor"));
    });
});