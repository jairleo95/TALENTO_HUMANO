var _path = '../../';

function  initJobsFilters() {
    listSelectAjax($(".selectDir"), "../../Direccion_Puesto", "opc=Listar_direccion", null, null, "Direccion");
    $(".selectDir").change(function () {
        listSelectAjax($(".selectDep"), "../../Direccion_Puesto", "opc=Listar_dir_dep&id=" + $(this).val(), "1", $(this).val(), "Departamento");
        $(".selectDep").val("");
        $(".selectArea").val("");
        $(".selectSeccion").val("");
        $(".chosen-select").trigger("chosen:updated");
    });
    $(".selectDep").change(function () {
        listSelectAjax($(".selectArea"), "../../Direccion_Puesto", "opc=Listar_area2&id=" + $(this).val(), "1", $(this).val(), "Area");
        $(".chosen-select").trigger("chosen:updated");
    });
    $(".selectArea").change(function () {
        listSelectAjax($(".selectSeccion"), "../../Direccion_Puesto", "opc=Listar_sec2&id=" + $(".selectArea").val(), "3");
        $(".selectSeccion").val("");
        $(".chosen-select").trigger("chosen:updated");
    });
    $(".selectSeccion").change(function () {
        //  list_select($(".select-puesto"), "../../Direccion_Puesto", "opc=Listar_pu_id&id=" + $(".selectSeccion").val(), "3");
    });
}
$(document).ready(function () {
    pageSetUp();

    /* // DOM Position key index //
     
     l - Length changing (dropdown)
     f - Filtering input (search)
     t - The Table! (datatable)
     i - Information (records)
     p - Pagination (paging)
     r - pRocessing 
     < and > - div elements
     <"#id" and > - div with an id
     <"class" and > - div with a class
     <"#id.class" and > - div with an id and class
     
     Also see: http://legacy.datatables.net/usage/features
     */

    /* BASIC ;*/
    var responsiveHelper_datatable_tabletools = undefined;

    var breakpointDefinition = {
        tablet: 1024,
        phone: 480
    };
    var uriGetAllEmployees = "../../empleado";
    /* TABLETOOLS */
    $('.datatableEmployees').dataTable({
        "processing": true,
        "serverSide": true,
        "pageLength": 10,
        "ajax": {
            "url": uriGetAllEmployees,
            "type": "POST",
            "dataSrc": "data.data",
            "data": {
                "opc": "getAllEmployees"
            }
        },
        "columns": [
            {
                "data": "row_number"

            }, {
                "data": function (data) {
                    var txt = '';
                    if (data.ar_foto !== null) {
                        txt = ' <img src="../../img/avatar_default.jpg"  width="30"  height="30">';
                    } else {
                        txt = ' <img src="../../img/' + data.ar_foto + '"  width="30"  height="30">';
                    }
                    txt += data.no_trabajador + " " + data.ap_paterno + " " + data.ap_materno;
                    return txt;
                }
            }
            , {
                "data": "no_direccion"
            }
            , {
                "data": "no_dep"
            }
            , {
                "data": "no_area"
            }
            , {
                "data": "no_seccion"
            }, {
                "data": "no_puesto"
            }
            , {
                "data": "fe_desde",
                "defaultContent": ""
            }
            , {
                "data": function (data) {
                    var txt = '';
                    if (data.fe_hasta !== '' & typeof data.fe_hast !== 'undefined') {
                        txt = data.fe_hasta;
                    } else {
                        txt = 'Indeterminado';
                    }
                    return txt;
                }
            }
            , {
                "data": "ca_sueldo"
            }
        ],
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-3 no-padding'f><'selectFilters col-sm-6 col-xs-12'><'col-sm-3 col-xs-12'T>r>" +
                "t" +
                "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
        "oTableTools": {
            "aButtons": [
                "copy",
                "csv",
                "xls",
                {
                    "sExtends": "pdf",
                    "sTitle": "Empleados_PDF",
                    "sPdfMessage": "Empleados PDF Export",
                    "sPdfSize": "letter"
                },
                {
                    "sExtends": "print",
                    "sMessage": "Generado por AlfaTeam <i>(presiona Esc para cerrar)</i>"
                }
            ],
            "sSwfPath": "../../js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
        },
        "autoWidth": true,
        "preDrawCallback": function () {
            // Initialize the responsive datatables helper once.
            if (!responsiveHelper_datatable_tabletools) {
                responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper($('#datatable_tabletools'), breakpointDefinition);
            }
        },
        "rowCallback": function (nRow) {
            responsiveHelper_datatable_tabletools.createExpandIcon(nRow);
        },
        "drawCallback": function (oSettings) {
            responsiveHelper_datatable_tabletools.respond();
        },
        "initComplete": function (settings, json) {
            var x = '';
            x += '<div class="col col-xs-3 no-padding"><select class="selectDir form-control" style="width:100%;"><option value="">Direccion</option></select></div>';
            x += '<div class="col col-xs-3 no-padding"><select class="selectDep form-control" style="width:100%;"><option value="">Departamento</option></select></div>';
            x += '<div class="col col-xs-3 no-padding"><select class="selectArea form-control" style="width:100%;"><option value="">Area</option></select></div>';
            x += '<div class="col col-xs-3 no-padding"><select class="selectSeccion form-control" style="width:100%;"><option value="">Seccion</option></select></div>';
            $('.selectFilters').append(x);
            initJobsFilters();
        }
    });

    /* END TABLETOOLS */

});
