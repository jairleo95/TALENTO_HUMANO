
function list_req(objReq) {
    var req = objReq;
    var text_html = "";
    req.empty();
    req.append("<option >Cargando...</option>");
    $.post("../../requerimiento", "opc=Listar_req", function (objJson) {
        req.empty();
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length > 0) {
            req.append("<option >[Seleccione]</option>");
            for (var i = 0; i < lista.length; i++) {
                text_html += "<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>";
            }
        } else {
            req.append("<option >[]</option>");
        }
        req.append(text_html);
        text_html = "";
    });
}
function insertDetalleReqProceso() {
    $.ajax({
        url: "../../Proceso", data: $(".formReqProceso").serialize() + "&proceso=" + $(".selectProceso").val() + "&opc=insertDetalleReqProceso", type: 'POST',
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            listDetalleReqProceso();
        }
    });
}
function listDetalleReqProceso() {
    $.fn.dataTable
            .Api($(".dtReqProceso")).ajax
            .reload();
}

var breakpointDefinition_dtReqProceso = {
    tablet: 1024,
    phone: 480
};
var responsiveHelper_dtReqProceso = undefined;
function initFormReqProceso() {
    var $formReqProceso = $('.formReqProceso').validate({
        submitHandler: function (form) {
            // some other code
            // maybe disabling submit button
            // then:
            //$(form).submit();
            insertDetalleReqProceso();
        }
    });

    $(".btn-cancelar").click(function () {
        $(".formReqProceso")[0].reset();
        $(".tbody-pro-paso").empty();
    });
    list_select($(".ti_planilla"), "../../requerimiento", "opc=Listar_Tipo_Planilla");
    $(".ti_planilla").change(function () {
        list_select($(".req"), "../../requerimiento", "opc=Listar_id_req&id=" + $(this).val(), "1", $(this).val());
    });
    list_select($(".proceso"), "../../Proceso", "opc=Listar");
    list_select($(".direccion"), "../../Direccion_Puesto", "opc=Listar_direccion", null, null, "Direccion");
    $(".direccion").change(function () {
        list_select($(".departamento"), "../../Direccion_Puesto", "opc=Listar_dir_dep&id=" + $(this).val(), "1", $(this).val(), "Departamento");
    });
    $(".departamento").change(function () {
        list_select($(".area"), "../../Direccion_Puesto", "opc=Listar_area2&id=" + $(this).val(), "1", $(this).val(), "Area");
    });
    $(".proceso, .req, .direccion, .departamento").change(function () {
        listDetalleReqProceso();
    });
}
function initDatatableDtReqProceso() {
    var dtReqProceso = $('.dtReqProceso').DataTable({
        "ajax": {
            "url": "../../Proceso",
            "type": "POST",
            "dataSrc": "lista",
            "data": function (d) {
                return $.extend({}, d, {
                    "opc": "Listar_Pro_Paso_Id",
                    "id_req": $(".req").val(),
                    "id_pro": $(".selectProceso").val(),
                    "id_dir": $(".direccion").val(),
                    "id_dep": $(".departamento").val()
                });
            }
        },
        "columns": [
            {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            },
            {
                "data": "ti_planilla"
            }, {
                "data": "req"
            }, {
                "data": "proceso"
            }, {
                "data": "dir",
                "defaultContent": ""
            }, {
                "data": "dep"
            }, {
                "data": "area"
            }, {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            }, {
                "orderable": false,
                "data": null,
                "defaultContent": ""
            }],
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>"
                + "t"
                + "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "oLanguage": {
            "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
        },
        "autoWidth": true,
        "preDrawCallback": function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper_dtReqProceso) {
                responsiveHelper_dtReqProceso = new ResponsiveDatatablesHelper(
                        $('.dtReqProceso'),
                        breakpointDefinition_dtReqProceso);
            }
        },
        "rowCallback": function (row, data, index) {
            responsiveHelper_dtReqProceso.createExpandIcon(row);
            $('td:eq(0)', row).html(index + 1);
            console.log(data.estado);
            var estadoE, estadoB;
            if (data.estado === "1") {
                estadoE = "Habilitado";
                estadoB = "<button class='btn btn-warning' value=" + index + ">Desactivar</button>";
            } else if (data.estado === "0") {
                estadoE = "Deshabilitado";
                estadoB = "<button class='btn btn-success' value=" + index + " style='width: 98%;'>Activar</button>";
            }
            $("td:eq(8)", row).html("<div class='row'>" + estadoB + "<button class='btn btn-danger'><i class='fa fa-times'></i></button></div>");
            $('td:eq(7)', row).html(estadoE);
        },
        "drawCallback": function (oSettings) {
            responsiveHelper_dtReqProceso.respond();
            // var api = this.api();
            console.log("Enter to drawCallBack");
        }
    });
}