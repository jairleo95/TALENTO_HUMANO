// DO NOT REMOVE : GLOBAL FUNCTIONS!
$(document).ready(function () {
    pageSetUp();
            $.post("../../../familiar", "opc=Listar_Hijo_id_tr&idtr="+$(".idtr").val(), function (objJson) {
            var texto_html = '';
            var div = $(".listar_hijos");
            if (objJson.rpta === -1) {
                alert(objJson.mensaje);
                return;
            } else {
                var lista = objJson.lista;
                if (lista.length === 0) {
                } else {
                    texto_html += ' <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%" style="margin-left:0.5%;" >'
                            + '<thead><tr><th data-hide="phone">Nro</th><th data-class="expand">Apellidos y Nombres</th><th data-hide="phone">Fecha de nacimiento</th>'
                            + '<th data-hide="phone">Sexo</th><th data-hide="phone,tablet">Tipo de Documento</th><th data-hide="phone,tablet">Nro Documento</th>'
                            + '<th data-hide="phone,tablet">Essalud</th><th data-hide="phone,tablet">Est.Nivel Superior</th><th data-hide="phone,tablet" colspan="2">Opciones</th> </tr></thead>';
                    texto_html += '<tbody>';
                    for (var i = 0; i < lista.length; i++) {
                        texto_html += '<tr>'
                                + '  <td>' + (i + 1) + '</td>'
                                + '<td >' + lista[i].ap_p + ' ' + lista[i].ap_m + ' ' + lista[i].no_hijo + '</td>'
                                + ' <td >' + lista[i].fe_nac + '</td>'
                                + '<td >' + lista[i].sexo + '</td>'
                                + '<td>' + lista[i].ti_doc + '</td>'
                                + '<td >' + lista[i].nu_doc + '</td>'
                                + '<td >' + lista[i].essalud + '</td>'
                                + '<td >' + lista[i].superior + '</td>'
                                + '<td >';
                        if ($(".accesToEditDataHijos").val()) {
                            texto_html += '<a href = "../../../familiar?idhijo=' + lista[i].idh + '&idtr=' + lista[i].idtr + '&opc=modificar" class="btn btn-success btn-sm">'
                                    + ' <i class="fa fa-pencil"></i></a>'
                                    + ' <button type="button" class = "btn btn-danger btn-sm eliminar" value="../../../familiar?idhijo=' + lista[i].idh + '&idtr=' + lista[i].idtr + '&opc=eliminar">'
                                    + ' <i class="fa fa-times"></i> </button>';
                        }


                        texto_html += '</td></tr>';
                    }
                    texto_html += '</tbody></table>';
                    div.append(texto_html);
                }
            }
            $(".eliminar").click(function () {
                var url = $(this).val();
                $.SmartMessageBox({
                    title: "Eliminar Hijo!",
                    content: "¿Esta seguro que desea eliminar un hijo?",
                    buttons: '[No][Yes]'
                }, function (ButtonPressed) {
                    if (ButtonPressed === "Yes") {
                        window.location.href = url;

                    }
                    if (ButtonPressed === "No") {
                        return false;
                    }

                });
                return false;
            });
        });
$(".nu_doc").numeric();
$('#wizard-1').validate({
 
    // Do not change code below
    errorPlacement: function (error, element) {
        error.insertAfter(element.parent());
    }
});
 
$(".ti_doc").change(
        function () {
            //$(".nu_doc").val("");
            if ($(this).val() === 1) {
                $(".nu_doc").numeric(false, function () {
                });
                $(".nu_doc").attr("maxlength", "8");
                $(".nu_doc").attr("minlength", "8");
            } else {
                $(".nu_doc").removeNumeric();
                $(".nu_doc").attr("maxlength", "10");
                $(".nu_doc").removeAttr("minlength");
                //    $(".doc").val("");
            }
            $(".doc").focus();
        }
);
});
