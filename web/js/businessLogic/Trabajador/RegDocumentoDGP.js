/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var idtr = "";
var iddgp = "";
var casosEspeciales = false;
var enterToDGPProcess = false;
/*defaul path*/
var pathRequest = "";
function validateShadowBox() {
    Shadowbox.init({
        overlayOpacity: 0.9
    });
    Shadowbox.setup("a.mustang-gallery", {
        gallery: "mustang",
        continuous: true,
        counterType: "skip"
    });
}
function nobackbutton() {
    window.location.hash = "no-back-button";
    window.location.hash = "Again-No-back-button" //chrome
    window.onhashchange = function () {
        window.location.hash = "";
    }
}
function closedthis() {
    $.smallBox({
        title: "¡Documento registrada correctamente!",
        content: "Puede visualizar el documento",
        color: "#739E73",
        iconSmall: "fa fa-check fa-2x fadeInRight animated",
        timeout: 6000
    });
}
function closedthis2() {
    $.smallBox({
        title: "¡Documento eliminado correctamente!",
        content: "ya puede ver eñ cambio",
        color: "#739E73",
        iconSmall: "fa fa-check fa-2x fadeInRight animated",
        timeout: 6000
    });
}
function validateSizeFile() {
    var x = true;
    console.log("enter to function validar")
    $.each($(".fileDocument"), function (index) {
        var thisObject = $(this);
        if (thisObject.val() !== "") {
            var fp = thisObject;
            var lg = fp[0].files.length; // get length
            var items = fp[0].files;
            var fragment = "";
            if (lg > 0) {
                for (var i = 0; i < lg; i++) {
                    var fileName = items[i].name; // get file name
                    var fileSize = items[i].size; // get file size 
                    var fileType = items[i].type; // get file type
                    // append li to UL tag to display File info
                    fragment = "<li>" + fileName + " (<b>" + fileSize + "</b> bytes) - Type :" + fileType + "</li>";
                    if (fileSize > 512000) {
                        $(thisObject).focus();
                        x = false;
                    }
                    console.log(fragment);
                }
            }
        }
    });
    return x;
}
function initFormRegDocument(request) {
    validateShadowBox();
    $(".btn_reg_doc").click(function () {
        var data = new FormData($('.form_dgp_doc')[0]);
        if (validateSizeFile()) {
            $.ajax({
                url: pathRequest + "documento", type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    if (data.status) {
                        closedthis();
                        showDocuments(iddgp, idtr, casosEspeciales, enterToDGPProcess, initFormRegDocument);
                    }
                },
                cache: false,
                processData: false,
                contentType: false,
                data: data

            });
            return false;
        }
    });
    $(".fileDocument").fileinput({
        language: "es",
        showUpload: false,
        layoutTemplates: {
            main1: "{preview}\n" +
                    "<div class=\'input-group {class}\'>\n" +
                    "   <div class=\'input-group-btn\' >\n" +
                    "       {browse}\n" +
                    "       {upload}\n" +
                    "       {remove}\n" +
                    "   </div>\n" +
                    "   {caption}\n" +
                    "</div>"},
        allowedFileExtensions: ['jpg','jpeg', 'png', 'gif', 'pdf', 'docx', 'doc', 'txt'],
        overwriteInitial: false,
        maxFileSize: 500,
        maxFilesNum: 10,
        browseClass: "btn btn-primary btn-sm",
        removeClass: "btn btn-danger btn-sm",
        //allowedFileTypes: ['image', 'video', 'flash'],
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });
    if ($(".fileDocument").length) {
        $(".btn_reg_doc").show();
    } else {
        $(".btn_reg_doc").hide();
    }
    console.log("num requeridos:" + $(".fileDocument[required='required']").length);
    if ($(".fileDocument[required='required']").length === 0) {
        $(".btn_continuar_det").show();
    } else if ($(".fileDocument[required='required']").length > 0) {
        $(".btn_continuar_det").hide();
    }

    $(".form_dgp_doc").submit(function () {
        $(".btn_reg_doc").attr("disabled", true);
        $(".btn_atras").attr("disabled", true);
    });

    $(".DD").change(function () {
        $(".div-holi").text($(".DD").val());
    });
    $(".elimi").click(function () {
        var msg = confirm('¿Está seguro de eliminar?');
        if (msg === true) {
            return true;
        } else {
            return false;
        }
    });
}
function showDocuments(dgp, idtr, casosEspeciales, enterToDGPProcess, callback) {
    console.log("::enter to showDocuments function::");
    var objDiv = $(".listDocument");
    var data = {
        "opc": "listDocument",
        "iddgp": dgp,
        "idtr": idtr,
        "casosEspeciales": casosEspeciales,
        "enterToDGPProcess": enterToDGPProcess

                /*"iddgp": $(".iddgp").val(),
                 "idtr": $(".idtr").val(),
                 "enterToCasosEspecialesProcess": $(".enterToCasosEspecialesProcess").val(),
                 "enterToRegTrabajador": $(".enterToRegTrabajador").val()*/
    };
    objDiv.append('<img src=' + pathRequest + 'img/load.gif" class="img-responsive center-block"/>');
    $.ajax({
        url: pathRequest + "documento", type: 'POST', data: data, success: function (data, textStatus, jqXHR) {
            if (data.status) {
                objDiv.empty();
                objDiv.append(data.htmlListDocument);
                if (typeof callback !== "undefined") {
                    callback(data);
                }
            }
        }
    });
}
