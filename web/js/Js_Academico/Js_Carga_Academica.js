function initCargaAcademica() {
    /*carga academica*/
    $(".btnCargaAcademica").click(function () {
        var currentItem=$(this).val();
        console.log("current item:"+currentItem)
        var objBodyPrint = $(".areaModal");
        var dataSent = $(this).data("valor");
        showCargaAcademica(objBodyPrint, dataSent, function () {
            pageSetUp();
            initFormPlugins();
            $(".fe_desde_p, .fe_hasta_p, .hl_docente, .TiHoraPago").change(function () {
                var tiHoraPago = $(".TiHoraPago option[value|='" + $(".TiHoraPago").val() + "']").data("valor");
                calcularCuotasDocente($(".fe_desde_p").val(), $(".fe_hasta_p").val(), $(".hl_docente").val(), tiHoraPago);
            });
            getTiHoraPago($(".idtr"+currentItem).val(), $(".divSelectTiHoraPAGO"));
            $(".btnAceptarCuotasCA").click(function () {
                $.ajax({
                    url: "../../../carga_academica",
                    type: "POST",
                    data: "opc=Registrar_CA&" + $(".form_carga_academica").serialize() + dataSent
                }).done(function (data) {
                    if (data.rpta === true) {
                        alert("Registrado con exito!...");
                        $(".proceso").val(data.proceso);
                        $(".dgp").val(data.dgp);
                        $(".btnAceptarCuotasCA").hide();
                        $(".btnProcesar").show('fast');
                    }
                });
            });
            $(".btnProcesar").click(function () {
                ProcesarCargaAcademica($(".dgp"+currentItem).val(), $(".proceso"+currentItem).val());
            });
        });
    });

}
function getTiHoraPago(idtr, objDivSelect) {
    objDivSelect.empty();
    console.log("cargando tipo de hora pago...");
    $.ajax({
        url: "../../../trabajador", data: "opc=getTiHoraPago&idtr=" + idtr, type: 'POST', success: function (data, textStatus, jqXHR) {
            if (data.status) {
                objDivSelect.append(data.html);
            } else {
                console.log("Error al cargar el tipo de hora pago");
            }
        }
    });
}
/*FIN carga academica*/
function showCargaAcademica(objBodyPrint, dataAjax, callback) {
    var url = '../../../carga_academica';
    var fila = 1;
    var columna = 0;
    var g = 0;
    objBodyPrint.empty();
    $.ajax({url: "horarioCursosAcademico.html", type: 'POST', success: function (htmlContent, textStatus, jqXHR) {
            objBodyPrint.append(htmlContent);
            /*test*/
            $.post(url, 'opc=getDetCargaAcademica' + dataAjax, function (data) {
                var dataList = data.list;
                $.each(dataList, function (index, dataItem) {
                    var myArray = dataItem.de_horario.trim();
                    console.log(myArray);
                    $('.bodyCursos').append('' + (g + 1) + '.' + dataItem.no_curso + '</br><li> ' + dataItem.no_eap + '</li><li>' + dataItem.de_tipo_curso + '</li>');
                    for (var i = 0; i < myArray.length; i++) {
                        columna++;
                        if (myArray[i] === "1") {
                            $(".fila-" + fila + " .columna-" + columna).append('<span class="badge bg-color-blueLight">' + (g + 1) + '</span>');
                        }
                        if (columna === 7) {
                            columna = 0;
                            fila++;
                        }
                    }
                    fila = 1;
                    columna = 0;
                    g++;
                    /*end print html*/
                    callback();
                });
            });

        }});
}
function ProcesarCargaAcademica(valorDgp, valorProceso) {
    $.ajax({
        url: "../../../carga_academica", data: "opc=Procesar&dgp=" + valorDgp + "&proceso=" + valorProceso, type: "POST"
    }).done(function (data) {
        if (data.rpta) {
            window.location.href = "../../carga_academica?opc=Reporte_Carga_Academica";
        }
    });
}
function calcularCuotasDocente(valorFeDesde, valorFeHasta, valorHorasLaborales, valorTipoHoraPago) {
    var cuotas = $(".cuota_docente");
    cuotas.empty();
    $.post("../../../pago_docente", "opc=Listar_Cuotas&fe_desde=" + valorFeDesde + "&fe_hasta=" + valorFeHasta + "&pago_semanal=" + (parseFloat(valorHorasLaborales) * parseFloat(valorTipoHoraPago)), function (objJson) {
        var lista = objJson.lista;
        if (objJson.rpta === -1) {
            alert(objJson.mensaje);
            return;
        } else {
            for (var i = 0; i < lista.length; i++) {
                cuotas.append(lista[i].html);

            }
            cuotas.append('<input type="hidden" value="' + lista.length + '" name="num_itera">');
        }
    });
}