function initFormPlugins() {
    /* 
     * To change this license header, choose License Headers in Project Properties.
     * To change this template file, choose Tools | Templates
     * and open the template in the editor.
     */
    $.datepicker.regional['es'] = {
        closeText: 'Mostrar',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['es']);

    $(".frompicker").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        dateFormat: 'dd/mm/yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onClose: function (selectedDate) {
            $(".topicker").datepicker("option", "minDate", selectedDate);
        }

    });

    $(".topicker").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        dateFormat: 'dd/mm/yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onClose: function (selectedDate) {
            $(".frompicker").datepicker("option", "maxDate", selectedDate);
        }
    });
    $(".datePickerInput").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        dateFormat: 'dd/mm/yy',
        prevText: '<i class="fa fa-chevron-left"></i>',
        nextText: '<i class="fa fa-chevron-right"></i>',
        onClose: function (selectedDate) {
            //$(".frompicker").datepicker("option", "maxDate", selectedDate);
        }
    });


//Formato de Fecha-DATEPICKER AND DATEMASK

    $(function () {

        $(".fechapicker").datepicker(
                {dateFormat: 'dd/mm/yy'}
        );
        $(".fe_hasta").change(function () {
            console.log("f:" + $(this).val());
        });

    });
    $(function () {
        $(".fecha1").datepicker(
                {dateFormat: 'dd/mm/yy'}

        )
    });
// Date Range Picker


}
function validateFieldUnique(valueValidate, urlPost, opc, dataAdit) {
    var x = false;
    valueValidate = valueValidate.trim();
    $.ajax({
        async: false,
        url: urlPost,
        type: "POST",
        data: "opc=" + opc + "&fieldUnique=" + valueValidate + dataAdit,
        success: function (objJson) {
            objJson = JSON.parse(objJson);
            var exists = objJson.exists;
            if (exists) {
                x = false;
            } else {
                x = true;
            }
        }
    });
    return x;
}
function calcular_edad(fecha) {
    /* format 2016-12-11 yyyy-mm-dd
     * 09
     * */
    var fechaActual = new Date();
    var diaActual = fechaActual.getDate();
    var mmActual = fechaActual.getMonth() + 1;
    var yyyyActual = fechaActual.getFullYear();
    var FechaNac = fecha.split("/");
    var diaCumple = FechaNac[0];
    var mmCumple = FechaNac[1];
    var yyyyCumple = FechaNac[2];
    //retiramos el primer cero de la izquierda
    if (mmCumple.substr(0, 1) == 0) {
        mmCumple = mmCumple.substring(1, 2);
    }
    if (diaCumple.substr(0, 1) == 0) {
        diaCumple = diaCumple.substring(1, 2);
    }
    var edad = yyyyActual - yyyyCumple;
    if ((mmActual < mmCumple) || (mmActual == mmCumple && diaActual < diaCumple)) {
        edad--;
    }
    console.log("EDAD:" + edad);
    return edad;
}
function list_select(objSelect, url, datos, opc, id, selectText) {

    var text_html = "";
    objSelect.empty();
    objSelect.removeClass("chosen-select");
    objSelect.append("<option  value='' >Cargando...</option>");
    $.ajax(url, {
        data: datos,
        type: 'POST',
        async: false,
        success: function (objJson) {
            objSelect.empty();
            if (objJson.rpta === -1) {
                alert(objJson.mensaje);
                return;
            }
            var lista = objJson.lista;
            if (lista.length > 0) {
                if (typeof selectText !== "undefined" & selectText !== null & selectText !== "") {
                    objSelect.append("<option value=''>[" + selectText + "]</option>");
                } else {
                    console.log("enter to else condition ...");
                    objSelect.append("<option value=''>[Seleccione]</option>");
                }

                if (opc === "1" | opc === "4") {
                    for (var i = 0; i < lista.length; i++) {
                        if (id == lista[i].id) {
                            text_html += "<option selected value='" + lista[i].id + "'>" + lista[i].nombre + "</option>";
                        } else {
                            text_html += "<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>";
                        }
                    }
                } else {
                    for (var i = 0; i < lista.length; i++) {
                        text_html += "<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>";
                    }
                }
            } else {
                objSelect.append("<option value=''>[Sin Data]</option>");
            }
            objSelect.append(text_html);
            text_html = "";
            if (opc === "3" | opc === "4") {
                objSelect.addClass("chosen-select");
                $(".chosen-select").trigger("chosen:updated");
                var config = {
                    '.chosen-select': {no_results_text: 'Oops, nada encontrado!', allow_single_deselect: true},
                    '.chosen-select-width': {width: "95%"}
                };
                for (var selector in config) {
                    $(selector).chosen(config[selector]);
                }
            }
        }
    });
    if (opc === "3" | opc === "4") {
        /*sirve para validar cuando es required*/
        $.validator.setDefaults({ignore: ":hidden:not(select)"});
    }

}
function list_selectJavaBeans(objSelect, url, datos, id_select, opcion_select, opc, id, callback) {
    var text_html = "";
    objSelect.empty();
    objSelect.removeClass("chosen-select");
    objSelect.append("<option  value='' >Cargando...</option>");
    $.post(url, datos, function (objJson) {
        objSelect.empty();
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        }
        var lista = objJson.lista;
        if (lista.length > 0) {
            objSelect.append("<option value=''>[Seleccione]</option>");
            if (opc == "1" | opc == "4") {
                for (var i = 0; i < lista.length; i++) {
                    if (id == lista[i][id_select]) {
                        text_html += "<option selected value='" + lista[i][id_select] + "'>" + lista[i][opcion_select] + "</option>";
                    } else {
                        text_html += "<option value='" + lista[i][id_select] + "'>" + lista[i][opcion_select] + "</option>";
                    }
                }
            } else {
                for (var i = 0; i < lista.length; i++) {
                    text_html += "<option value='" + lista[i][id_select] + "'>" + lista[i][opcion_select] + "</option>";
                }
            }
        } else {
            objSelect.append("<option value=''>[No data]</option>");
        }
        objSelect.append(text_html);
        text_html = "";
        if (typeof callback === "function") {
            callback(objJson);
        }
        if (opc == "3" | opc == "4") {
            objSelect.addClass("chosen-select");
            $(".chosen-select").trigger("chosen:updated");
            var config = {
                '.chosen-select': {no_results_text: 'Oops, nada encontrado!', allow_single_deselect: true},
                '.chosen-select-width': {width: "95%"}
            }
            for (var selector in config) {
                $(selector).chosen(config[selector]);
            }
        }

    });
    if (opc == "3" | opc == "4") {
        /*sirve para validar cuando es required*/
        $.validator.setDefaults({ignore: ":hidden:not(select)"});
    }

}
initFormPlugins();