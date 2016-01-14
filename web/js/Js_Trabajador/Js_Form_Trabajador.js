/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$("#sit_edu").change(function () {
    if ($("#sit_edu").val() === 'SED-0011' | $("#sit_edu").val() === 'SED-0013' | $("#sit_edu").val() === 'SED-0014'
            | $("#sit_edu").val() === 'SED-0015'
            | $("#sit_edu").val() === 'SED-0016' | $("#sit_edu").val() == 'SED-0017'
            | $("#sit_edu").val() === 'SED-0017' | $("#sit_edu").val() == 'SED-0018'
            | $("#sit_edu").val() === 'SED-0019' | $("#sit_edu").val() == 'SED-0020'
            | $("#sit_edu").val() === 'SED-0021') {

        $("#es_inst_p").show(200);
    }
    else {
        $("#es_inst_p").hide(200);
        $("#es_inst_p").find('select option:eq(0)').prop('selected', true);
        $("#regimen").hide(200);
        $("#regimen").find('select option:eq(0)').prop('selected', true);
        $("#egreso").hide(200);
        $("#egreso").find('select option:eq(0)').prop('selected', true);
        $("#ti").hide(200);
        $("#ti").find('select option:eq(0)').prop('selected', true);
        $("#institucion").hide(200);
        $("#institucion").find('select option:eq(0)').prop('selected', true);
        $("#carr").hide(200);
        $("#carr").find('select option:eq(0)').prop('selected', true);
    }
});
$("#es_inst_p").change(function () {
    if ($("#inst_peru").val() === "1") {
        $("#regimen").show(200);
        $("#egreso").show(200);
        $("#ti").show(200);
        $("#institucion").show(200);
        $("#carr").show(200);
    } else {
        $("#regimen").hide(200);
        $("#egreso").hide(200);
        $("#ti").hide(200);
        $("#institucion").hide(200);
        $("#carr").hide(200);
    }
});
