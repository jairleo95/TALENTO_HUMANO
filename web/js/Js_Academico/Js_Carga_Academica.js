function ProcesarCargaAcademica(valorDgp, valorProceso) {

    $.ajax({
        url: "../../carga_academica", data: "opc=Procesar&dgp=" + valorDgp + "&proceso=" + valorProceso, type: "POST"
    }).done(function (data) {
        if (data.rpta) {
            window.location.href = "../../carga_academica?opc=Reporte_Carga_Academica";
        }
    });
}
function calcularCuotasDocente(valorFeDesde, valorFeHasta, valorHorasLaborales, valorTipoHoraPago) {
    var cuotas = $(".cuota_docente");
    cuotas.empty();
    $.post("../../pago_docente", "opc=Listar_Cuotas&fe_desde=" + valorFeDesde + "&fe_hasta=" + valorFeHasta + "&pago_semanal=" + (parseFloat(valorHorasLaborales) * parseFloat(valorTipoHoraPago)), function (objJson) {
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