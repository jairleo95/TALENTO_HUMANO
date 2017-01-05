/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function mostrarRegHorario() {
    $(".cont_lunes").hide();
    $(".cont_martes").hide();
    $(".cont_miercoles").hide();
    $(".cont_jueves").hide();
    $(".cont_viernes").hide();
    $(".cont_domingo").hide();

    $("#lunes").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_1").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_lunes").hide();
                    $("#show_1 input").val("");
                }
            }
    );

    $("#martes").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_2").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_martes").hide();
                    $("#show_2 input").val("");
                }
            }
    );
    $("#miercoles").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_3").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_miercoles").hide();
                    $("#show_1 input").val("");
                }
            }
    );
    $("#jueves").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_4").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_jueves").hide();
                    $("#show_1 input").val("");
                }
            }
    );
    $("#viernes").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_5").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_viernes").hide();
                    $("#show_1 input").val("");
                }
            }
    );
    $("#domingo").change(
            function () {
                if ($(this).val() == 1) {
                    $("#show_6").show();
                }
                if ($(this).val() == 2) {
                    $(".cont_domingo").hide();
                    $("#show_1 input").val("");
                }
            }
    );


}
$(document).ready(function () {
    mostrarRegHorario();
    $("#horario").change(
            function () {
                if ($(this).val() == 0) {
                    $(".cont_lunes").hide();
                    $(".cont_martes").hide();
                    $(".cont_miercoles").hide();
                    $(".cont_jueves").hide();
                    $(".cont_viernes").hide();
                    $(".cont_domingo").hide();

                }
                if ($(this).val() == 1) {
                    $("#show_1").show();
                    $("#show_2").show();
                    $("#show_3").show();
                    $("#show_4").show();
                    $("#show_5").show();
                    $("#show_6").show();


                    $("#lunes").val(1);
                    $("#martes").val(1);
                    $("#miercoles").val(1);
                    $("#jueves").val(1);
                    $("#viernes").val(1);
                    $("#sabado").val(1);
                    $("#domingo").val(1);

                    document.getElementById("HORA_DESDE_lun1").value = "7:50";
                    document.getElementById("HORA_HASTA_lun1").value = "12:30";
                    document.getElementById("HORA_DESDE_lun2").value = "13:30";
                    document.getElementById("HORA_HASTA_lun2").value = "17:30";

                    document.getElementById("HORA_DESDE_mar1").value = "7:50";
                    document.getElementById("HORA_HASTA_mar1").value = "12:30";
                    document.getElementById("HORA_DESDE_mar2").value = "13:30";
                    document.getElementById("HORA_HASTA_mar2").value = "17:30";

                    document.getElementById("HORA_DESDE_mier1").value = "7:50";
                    document.getElementById("HORA_HASTA_mier1").value = "12:30";
                    document.getElementById("HORA_DESDE_mier2").value = "13:30";
                    document.getElementById("HORA_HASTA_mier2").value = "17:30";

                    document.getElementById("HORA_DESDE_jue1").value = "7:50";
                    document.getElementById("HORA_HASTA_jue1").value = "12:30";
                    document.getElementById("HORA_DESDE_jue2").value = "13:30";
                    document.getElementById("HORA_HASTA_jue2").value = "17:30";

                    document.getElementById("HORA_DESDE_vie1").value = "7:50";
                    document.getElementById("HORA_HASTA_vie1").value = "12:30";

                    document.getElementById("HORA_DESDE_dom1").value = "7:50";
                    document.getElementById("HORA_HASTA_dom1").value = "12:30";
                    document.getElementById("HORA_DESDE_dom2").value = "13:30";
                    document.getElementById("HORA_HASTA_dom2").value = "17:30";


                }

            }
    );
});
$(function () {
    var scntDiv = $('#show_1');
    var i = $('#show_1 .texto-h').size() + 1;
    var s = $('#show_1 .tr-count').size() + 1;

    $('#addScnt').live('click', function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"   name="HORA_DESDE_lun' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_lun' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_lun' + i + '" value="lun" ><input type="hidden" name="USER_CREACION_lun' + i + '"> <a href="#" id="remScnt">-</a></td></tr>').appendTo(scntDiv);

        i++;
        s++;
        return false;
    });
    $('#remScnt').live('click', function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});

//MARTES
$(function () {
    var scntDiv = $('#show_2');
    var i = $('#show_2 .texto-h').size() + 1;
    var s = $('#show_2 .tr-count_2').size() + 1;

    $('#add_2').live('click', function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mar' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mar' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mar' + i + '" value="mar" ><input type="hidden" name="USER_CREACION_mar' + i + '"> <a href="#" id="remove_2">-</a></td></tr>').appendTo(scntDiv);

        i++;
        s++;
        return false;
    });
    $('#remove_2').live('click', function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});
//MIERCOLES
$(function () {
    var scntDiv = $('#show_3');
    var i = $('#show_3 .texto-h').size() + 1;
    var s = $('#show_3 .tr-count_3').size() + 1;

    $('#add_3').live('click', function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_mie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_mie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_mie' + i + '" value="mie" ><input type="hidden" name="USER_CREACION_mie' + i + '"> <a href="#" id="remove_3">-</a></td></tr>').appendTo(scntDiv);

        i++;
        s++;
        return false;
    });
    $('#remove_3').live('click', function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});
//JUEVES
$(function () {
    var scntDiv = $('#show_4');
    var i = $('#show_4 .texto-h').size() + 1;
    var s = $('#show_4 .tr-count_4').size() + 1;

    $('#add_4').live('click', function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_jue' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_jue' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_jue' + i + '" value="jue" ><input type="hidden" name="USER_CREACION_jue' + i + '"> <a href="#" id="remove_4">-</a></td></tr>').appendTo(scntDiv);

        i++;
        s++;
        return false;
    });
    $('#remove_4').live('click', function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});
//VIERNES
$(function () {
    var scntDiv = $('#show_5');
    var i = $('#show_5 .texto-h').size() + 1;
    var s = $('#show_5 .tr-count_5').size() + 1;

    $('#add_5').live('click', function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_vie' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_vie' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_vie' + i + '" value="vie" ><input type="hidden" name="USER_CREACION_vie' + i + '"> <a href="#" id="remove_5">-</a></td></tr>').appendTo(scntDiv);

        i++;
        s++;
        return false;
    });
    $('#remove_5').live('click', function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});
//DOMINGO
$(function () {
    var scntDiv = $('#show_6');
    var i = $('#show_6 .texto-h').size() + 1;
    var s = $('#show_6 .tr-count_6').size() + 1;

    $('#add_6').live('click', function () {

        $('<tr><td>T' + s + ' :</td><td><input type="text"  name="HORA_DESDE_dom' + i + '" value="" placeholder="" /></td><td><input type="text"  size="20" name="HORA_HASTA_dom' + i + '" value="" placeholder=" " /><input type="hidden" name="DIA_dom' + i + '" value="dom" ><input type="hidden" name="USER_CREACION_dom' + i + '"> <a href="#" id="remove_6">-</a></td></tr>').appendTo(scntDiv);

        i++;
        s++;
        return false;
    });
    $('#remove_6').live('click', function () {
        if (i > 2) {
            $(this).parents('tr').remove();
            //  $("#tr-d").remove();           
            i--;
            s--;
        }
        return false;
    });
});

