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

    window.onhashchange = function () {
        window.location.hash = "";
    }
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
                    if (fileSize > 1048576) {
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
    console.log('Enter to initFormRegDocument function');
    validateShadowBox();
    $(".btn_reg_doc").click(function () {
        var data = new FormData($('.form_dgp_doc')[0]);
        if (validateSizeFile()) {
            $.ajax({
                url: pathRequest + "documento", type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    if (data.status) {
                        $.smallBox({
                            title: "¡Documento registrado correctamente!",
                            content: "Puede visualizar el documento",
                            color: "#739E73",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 6000
                        });
                        showDocuments(iddgp, idtr, casosEspeciales, enterToDGPProcess);
                    } else {
                        console.log(data);
                        alert('Ocurrio un error al guardar los documentos');
                    }
                },
                cache: false,
                processData: false,
                contentType: false,
                data: data

            });
            return false;
        } else {
            console.log('uno de los archivos ha excedido el tamaño requerido');
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
        allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif', 'pdf', 'docx', 'doc', 'txt'],
        overwriteInitial: false,
        maxFileSize: 1024,
        maxFilesNum: 10,
        browseClass: "btn btn-primary btn-sm",
        removeClass: "btn btn-danger btn-sm",
        //allowedFileTypes: ['image', 'video', 'flash'],
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });

    $(".fileDocument").change(function () {
        enabledRegDocumentButton(validateFileInputRequired());
    });

    validateButtons();

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
function enabledRegDocumentButton(isEnabled) {
    if (false) {
  //  if (!isEnabled) {
        $(".btn_reg_doc").attr("disabled", true);
    } else {
        $(".btn_reg_doc").removeAttr("disabled");
    }
}
function validateFileInputRequired() {
    var countEmptyFileInput = 0;
    $.each($(".fileDocument[required='required']"), function (index) {
        if ($(this).val() === '') {
            countEmptyFileInput++;
            console.log('se debe seshabilitar el boton registrar:' + index);
        }
    });
    return (countEmptyFileInput === 0);
}
function validateButtons() {
    console.log('enter to validateButtons function');
    var showRegigsterButton = $(".fileDocument").length > 0;
    console.log("sizeFileDocument:" + showRegigsterButton);
    var allFilesRequiredAreReady = $(".fileDocument[required='required']").length === 0;
    console.log("num requeridos:" + $(".fileDocument[required='required']").length);
    if (showRegigsterButton) {
        $(".btn_reg_doc").show();
        enabledRegDocumentButton(validateFileInputRequired());
    } else {
        $(".btn_reg_doc").hide();
    }
    if (allFilesRequiredAreReady) {
        $(".btn_continuar_det").show();
    } else {
        $(".btn_continuar_det").hide();
    }
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
                initFormRegDocument();
                if (typeof callback !== "undefined") {
                    callback(data);
                } else {
                    console.log('no existe funcion callback');
                }
            } else {
                console.log(data.mensaje);
                alert('ocurrio un error al cargar los documentos');

            }
        }
    });
}
