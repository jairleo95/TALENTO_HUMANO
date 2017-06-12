/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function SelectorListaContrato(objSelector, idtr, idc) {
    $.ajax({
        url: "../../contrato", type: 'POST', data: "opc=SelectorListaContrato&idtr=" + idtr + "&idc=" + idc,
        success: function (data, textStatus, jqXHR) {
            if (data.rpta) {
                objSelector.append(data.html);
                $(".anno").change(function () {
                    window.location.href = '../../contrato?opc=actualizar&idtr=' + $(".idtr").val() + '&idc=' + $(this).val();
                });
            }
        }
    });
}
$(document).ready(function () {
    $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
        $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>");
    });
    SelectorListaContrato($(".SelectorListaContrato"), $(".idtr").val(), $(".idc").val());
    $(".btnHorario").click(function () {
        listHorario($(this).data("valor"));
        /*trying to scroll to top*/
        //console.log('Scrolling...(333)');
        //var iframeTwo = window.parent.document;
      // $( iframeTwo.getElementsByTagName("header")[0]).css("background","red");
       window.parent.parent.scrolingToTop(200);
    });
    $(".ck_habilitar_is").click(function () {
        if ($(".ck_habilitar_is").prop('checked')) {
            $.ajax({
                url: "../../contrato",
                data: "opc=Habilitar_is&id=" + $(".id_contrato").val() + "&estado=1"
            }).done(function () {
                $.smallBox({
                    title: "¡Alerta!",
                    content: "Se ha autortizado que la secretaria pueda subir e imprimir el contrato.",
                    color: "#296191",
                    iconSmall: "fa fa-cloud",
                    timeout: 4000
                });

            }).fail(function (jqXHR, textStatus, errorThrown) {
                $.smallBox({
                    title: "¡Error!",
                    // content: "<i class='fa fa-clock-o'></i> <i>" +jqXHR.responseText+" - "+ textStatus + " - "+errorThrown+" : Se ha producido un error que causo que no se realice la accion...</i>",
                    content: "<i class='fa fa-clock-o'></i> <i>  " + textStatus + " - " + errorThrown + " : Se ha producido un error que causo que no se realice la accion...</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 6000
                });
            });
        } else {
            $.ajax({
                url: "../../contrato",
                data: "opc=Habilitar_is&id=" + $(".id_contrato").val() + "&estado=2"
            }).done(function () {
                $.smallBox({
                    title: "¡Alerta!",
                    content: "Se ha autortizado que la secretaria NO pueda subir e imprimir el contrato.",
                    color: "#C79121",
                    iconSmall: "fa fa-cloud",
                    timeout: 4000
                });
            }).fail(function (jqXHR, textStatus, errorThrown) {
                $.smallBox({
                    title: "¡Error!",
                    // content: "<i class='fa fa-clock-o'></i> <i>" +jqXHR.responseText+" - "+ textStatus + " - "+errorThrown+" : Se ha producido un error que causo que no se realice la accion...</i>",
                    content: "<i class='fa fa-clock-o'></i> <i>  " + textStatus + " - " + errorThrown + " : Se ha producido un error que causo que no se realice la accion...</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 6000
                });
            });
        }
    });


});
