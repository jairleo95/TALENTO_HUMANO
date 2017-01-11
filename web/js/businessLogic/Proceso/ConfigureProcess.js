//Listar_Paso($("#select-proceso").val());
$(document).ready(function () {
    pageSetUp();
    initFormReqProceso();
    initDatatableDtReqProceso();
    initFormProcess();
    initFormTaskProcess();
    initFormPuestoTask();

    // PAGE RELATED SCRIPTS
    var updateOutput = function (e) {
        var list = e.length ? e : $(e.target), output = list.data('output');
        if (window.JSON) {
            output.val(window.JSON.stringify(list.nestable('serialize')));
            //, null, 2));
        } else {
            output.val('JSON browser support required for this demo.');
        }
    };
    // activate Nestable for list 1
    $('#nestable').nestable({
        group: 1
    }).on('change', updateOutput);
    // activate Nestable for list 2
    // output initial serialised data
    updateOutput($('#nestable').data('output', $('#nestable-output')));
});
