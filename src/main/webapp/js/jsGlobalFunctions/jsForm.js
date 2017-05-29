function initFormPluginsEvents() {
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
}

Array.prototype.remove = function (from, to) {
    var rest = this.slice((to || from) + 1 || this.length);
    this.length = from < 0 ? this.length + from : from;
    return this.push.apply(this, rest);
};

function getCurrentDate() {
    var f = new Date();
    var mes = "";
    if ((f.getMonth() + 1) < 10)
        mes = "0" + (f.getMonth() + 1);
    else
        mes = (f.getMonth() + 1);
    return (f.getDate() + "/" + mes + "/" + f.getFullYear());
}


var fvValidatorInteger = {
    validators: {
        callback: {
            message: 'Ingrese numeros enteros',
            callback: function (value, validator, $field) {
                console.log(value + " value field")
                var re = new RegExp(intRegex);
                return re.test(value);
            }
        }
    }
};

var fvCallbackOnlyInteger = {
    message: 'Ingrese numeros enteros',
    callback: function (value, validator, $field) {
        console.log(value + " value field")
        var re = new RegExp(intRegex);
        return re.test(value);
    }

};
var fvCallbackOnlyNumber = {
    message: 'Ingrese solo numeros',
    callback: function (value, validator, $field) {
        console.log(value + " value field")
        var re = new RegExp(floatRegex);
        return re.test(value);
    }

};

function validateFieldUnique(valueValidate, urlPost, opc, dataAdit) {
    var x = false;
    valueValidate = valueValidate.trim();
    $.ajax({
        async: false,
        url: urlPost,
        type: "POST",
        data: "opc=" + opc + "&fieldUnique=" + valueValidate + dataAdit,
        success: function (data) {
            if (data.status) {
                /*objJson = JSON.parse(objJson);*/
                var exists = data.exists;
                if (exists) {
                    x = false;
                } else {
                    x = true;
                }
            } else {
                console.log("ocurrio un error al validal el campo unico");
                console.log(data.message);
            }
        }
    });
    return x;
}

$(".btnClose").click(function () {
    formResetValues($(".formSubmit"));
});

var usernameRegex = "^[a-z0-9_-]{3,16}$";
var passwordStrengthRegex = "((?=.*d)(?=.*[a-z])(?=.*[A-Z]).{8,15})";
var dateDDMMYYYRegex = '^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)dd$';
var floatRegex = '[-+]?([0-9]*.[0-9]+|[0-9]+)';
var intRegex = '^[0-9 -()+]+$';

function onlyAlphanumeric(e) {
    var tecla = (document.all) ? e.keyCode : e.which;
    if ((tecla > 47 && tecla < 58) || (tecla >= 97 && tecla <= 122)
            || (tecla >= 65 && tecla <= 90))
        return true;
    else
        return false;
}
function antiSqlInjection(txt) {
    var txt2 = txt.replace(/^\s*|\s*$/g, "");
    var txt3 = txt2.toUpperCase();
    if (txt3 == "INSERT" || txt3 == "INTO" || txt3 == "SELECT"
            || txt3 == "WHERE" || txt3 == "UPDATE") {
        return false;
    }
    return true;
}

function setHighlight(element) {
    $(element).parent().removeClass('state-success').addClass('state-error');
}
function setUnhighlight(element) {
    $(element).parent().removeClass('state-error').addClass('state-success');

    if ($(element).hasClass('select2Element')) {
        $(element).parent().addClass('state-success');
    }
}

function interactiveButtons() {
    $(".btnAgregar").show(300);
    $(".btnAgregar").click(function () {
        $(".btn-registrar").show(200);
        $(".btnClose").show(200);
        $(".formSubmit").show(200);
        $(this).hide(200);
    });
    $(".btnClose").click(function () {
        $(".btnAgregar").show(200);
        $(".formSubmit").hide(200);
        $(".btn-registrar").hide(200);
        $(this).hide(200);
    });

}

function deleteRecord(id, urlAjax, dataAjax, dataTableList) {
    console.log("data :" + id)

    $.SmartMessageBox({
        title: "&iexcl;Alerta!",
        content: "¿Esta seguro de eliminar este registro?",
        buttons: '[No][Si]'
    },
            function (ButtonPressed) {
                if (ButtonPressed === "Si") {
                    $.ajax({
                        url: urlAjax,
                        data: "opc=delete&id=" + id + dataAjax,
                        type: "post",
                        success: function (objJson) {
                            /*objJson = JSON.parse(objJson);*/
                            var mensaje = objJson.message;
                            if (!objJson.status) {
                                alert(objJson.mensaje);
                                return;
                            } else {
                                $.fn.dataTable
                                        .Api(dataTableList).ajax
                                        .reload();
                                $.smallBox({
                                    title: "Se ha eliminado el registro con exito",
                                    content: "<i class='fa fa-clock-o'></i> <i>puede visualizar los cambios...</i>",
                                    color: "#296191",
                                    iconSmall: "fa fa-thumbs-up bounce animated",
                                    timeout: 6000
                                });
                            }

                        }
                    });
                }

            });

}

function saveFormAjax(ObjForm, url, dataAditional, dataTableList, callback, resetForm) {

    console.log("dataform :" + (formData == ObjForm.serialize()))
    console.log(opc);
    console.log("data :" + dataAditional)
    if (!(formData == ObjForm.serialize())) {
        $
                .ajax({
                    type: "POST",
                    url: url,
                    data: ObjForm.serialize() + dataAditional + "&opc=" + opc,
                    success: function (objJson) {
                        /*objJson = JSON.parse(objJson);*/
                        var message = objJson.message;
                        if (!objJson.status) {
                            alert(objJson.mensaje);
                            return;
                        } else {
                            if (typeof resetForm === "function") {
                                resetForm(ObjForm);

                            } else {
                                formResetValues(ObjForm);
                            }

                            $.smallBox({
                                title: "Registrado!",
                                content: "<i class='fa fa-clock-o'></i> <i>Se ha almacenado correctamente...</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 6000
                            });

                            callback(objJson);
                            $.fn.dataTable.Api(dataTableList).ajax.reload();
                            // alert(objJson.id)
                        }
                    }
                });
    } else {
        $.bigBox({
            title: "Sin cambios!",
            content: "Debe ingresar valores diferentes a los actuales.",
            color: "#C46A69",
            icon: "fa fa-warning shake animated",
            number: "1",
            timeout: 6000
        });

    }
}

function formResetValues(ObjForm) {
    ObjForm[0].reset();
    opc = "save"
}
function calcularEdad(fechaNacimiento) {
    /* format 2016-12-11 yyyy-mm-dd*/
    var fechaActual = new Date();
    var diaActual = fechaActual.getDate();
    var mmActual = fechaActual.getMonth() + 1;
    var yyyyActual = fechaActual.getFullYear();
    var FechaNac = fechaNacimiento.split("/");
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

function listSelectAjax(objSelect, url, datos, opc, id, selectText, callFunction) {
    var text_html = "";
    objSelect.empty();
    objSelect.removeClass("chosen-select");
    objSelect.append("<option  value='' >Cargando...</option>");
    $.post(url, datos, function (objJson) {
        /*objJson = JSON.parse(objJson);*/
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
                        text_html += "<option selected value='" + lista[i].id
                                + "'>" + lista[i].nombre + "</option>";
                    } else {
                        text_html += "<option value='" + lista[i].id + "'>"
                                + lista[i].nombre + "</option>";
                    }
                }
            } else {
                for (var i = 0; i < lista.length; i++) {
                    text_html += "<option value='" + lista[i].id + "'>"
                            + lista[i].nombre + "</option>";
                }
            }
        } else {
            objSelect.append("<option value=''>[No Data]</option>");
        }
        objSelect.append(text_html);
        text_html = "";
        if (opc === "3" | opc === "4") {
            objSelect.addClass("chosen-select");
            $(".chosen-select").trigger("chosen:updated");
            var config = {
                '.chosen-select': {
                    no_results_text: 'Oops, nada encontrado!',
                    allow_single_deselect: true
                },
                '.chosen-select-width': {
                    width: "95%"
                }
            };
            for (var selector in config) {
                $(selector).chosen(config[selector]);
            }
        }
        callFunction(lista);
    });
    if (opc === "3" | opc === "4") {
        /* sirve para validar cuando es required */
        $.validator.setDefaults({
            ignore: ":hidden:not(select)"
        });
    }

}
function listSelectAjaxWithJavaBeans(objSelect, url, datos, id_select, opcion_select, opc, id, callback) {
    var text_html = "";
    objSelect.empty();
    objSelect.removeClass("chosen-select");
    objSelect.append("<option  value='' >Cargando...</option>");
    $.post(url, datos, function (data) {
        /*objJson = JSON.parse(objJson);*/
        objSelect.empty();
        if (!data.status) {
            alert(data.mensaje);
            return;
        } else {
            var data = data.data;
            if (data.length > 0) {
                objSelect.append("<option value=''>[Seleccione]</option>");
                if (opc == "1" | opc == "4") {
                    for (var i = 0; i < data.length; i++) {
                        if (id == data[i][id_select]) {
                            text_html += "<option selected value='"
                                    + data[i][id_select] + "'>"
                                    + data[i][opcion_select] + "</option>";
                        } else {
                            text_html += "<option value='" + data[i][id_select]
                                    + "'>" + data[i][opcion_select] + "</option>";
                        }
                    }
                } else {
                    for (var i = 0; i < data.length; i++) {
                        text_html += "<option value='" + data[i][id_select] + "'>"
                                + data[i][opcion_select] + "</option>";
                    }
                }
            } else {
                objSelect.append("<option value=''>[No data]</option>");
            }
            objSelect.append(text_html);
            text_html = "";
            if (typeof callback === "function") {
                callback(data);
            }
            if (opc == "3" | opc == "4") {
                objSelect.addClass("chosen-select");
                $(".chosen-select").trigger("chosen:updated");
                var config = {
                    '.chosen-select': {
                        no_results_text: 'Oops, nada encontrado!',
                        allow_single_deselect: true
                    },
                    '.chosen-select-width': {
                        width: "95%"
                    }
                };
                for (var selector in config) {
                    $(selector).chosen(config[selector]);
                }
            }
        }


    });
    if (opc == "3" | opc == "4") {
        /* sirve para validar cuando es required */
        $.validator.setDefaults({
            ignore: ":hidden:not(select)"
        });
    }

}