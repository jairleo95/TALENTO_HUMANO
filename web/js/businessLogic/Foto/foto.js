/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var url_archivos = $(".url_archivo").val() + "Fotos/";
var idtrl = $(".idtr").val().trim();
var repeat = 0;
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
function addImage(e) {
    var file = e.target.files[0], imageType = /image.*/;
    if (!file.type.match(imageType))
        return;
    var reader = new FileReader();
    reader.onload = fileOnload;
    reader.readAsDataURL(file);
    //$('.ver_foto').hide(200);
}

function precarga(e) {
    var file = e.target.files[0], imageType = /image.*/;
    if (!file.type.match(imageType))
        return;
    var reader = new FileReader();
    reader.onload = prefile;
    reader.readAsDataURL(file);
}
function prefile(e) {
    var result = e.target.result;
    $('.pre_foto').attr("src", result);
}

// cargar imagen
function fileOnload(e) {
    var result = e.target.result;
    $('.pre_foto').attr("src", result);
    $(function () {
        $(".progressbar").show(200);
        var progressbar = $(".progressbar"),
                progressLabel = $(".progress-label");

        progressbar.progressbar({
            value: false,
            change: function () {
                progressLabel.text(progressbar.progressbar("value") + "%");
            },
            complete: function () {
                progressLabel.text("Complete!");
                $(".progressbar").hide(200);
            }});
        function progress() {
            var val = progressbar.progressbar("value") || 0;

            progressbar.progressbar("value", val + 2);

            if (val < 99) {
                setTimeout(progress, 68);
            }
        }

        setTimeout(progress, 100);
    });
}
function getAvatar(tipo, idtra) {
    console.log("geAvatar");
    $.ajax({
        url: "../../foto",
        type: "POST",
        data: "opc=getfoto&tipo=" + tipo + "&idtra=" + idtra,
        success: getImagen,
        error: errors
    });
    function getImagen(data) {
        $.each(data, function (i, datos) {
            $.each(datos, function (i, obj) {
                if (tipo == 'todo') {
                    if (obj.EFOTO != 2) {
                        console.log("foto todo");
                        console.log(url_archivos);
                        var imgens = '<img class="img-thumbnail" title="foto ' + i + '" src="' + url_archivos +
                                obj.ar_foto + '"style="width:100px; height:100px;" />';
                        $('.fotos').append(imgens);

                        if (repeat == 0) {
                        console.log(url_archivos);
                            var imgens = '<a class="mustang-gallery pull-left" href="' + url_archivos + obj.ar_foto + '" >' +
                                    '<img class="img-thumbnail" title="foto ' + i + '" src="' + url_archivos +
                                    obj.ar_foto + '"style="width:100px; height:100px;" /></a>';
                            $('.foto-user').append(imgens);
                            $('.fotos').append(imgens);
                        }
                    }

                } else if (tipo == 'perfil') {
                    console.log("foto perfil ");
                    $('.borde').attr("src", url_archivos + obj.ar_foto);
                    $(".avatar").attr("href", url_archivos + obj.ar_foto);
                    $("#sb-player").attr("href", url_archivos + obj.ar_foto);
                    console.log("tu doc es : "+url_archivos);
                    if (obj.EFOTO === "1") {/* your photo success */
                    }
                    if (obj.EFOTO === "0") {
                        //$(".ver_foto").hide(200);
                    }
                    if (obj.EFOTO === "2") {
                        /* your photo rechazada*/
                        $('.modal').modal('show');
                        $('.borde').attr('src', '../../img/Desaprobado.png');

                        var padre = $(window.parent.document.getElementById('foto_usuario'));
                        var idtra = $(window.parent.document.getElementById('id_trabajador')).val();
                        if (idtra.trim() == $(".idtr").val().trim()) {
                            $(padre).attr("src", "img/Desaprobado.png");
                        }
                    } else {
                        if (obj.EFOTO != 2) {
                            $('.borde').attr("src", "http://gth.upeu.edu.pe/DATA_FILES_GTH/Archivo/Fotos/" + obj.ar_foto);
                            $(".avatar").attr("href", "http://gth.upeu.edu.pe/DATA_FILES_GTH/Archivo/Fotos/" + obj.ar_foto);
                            console.log("doc:"+obj.ar_foto)
                            $("#sb-player").attr("href", "http://gth.upeu.edu.pe/DATA_FILES_GTH/Archivo/Fotos/" + obj.ar_foto);
                            console.log(obj.ar_foto);
                        }
                    }
                }
            });
        });
    }
    function errors(data) {
        console.log("error" + data);
    }
}
function initFoto() {
    getAvatar("perfil", idtrl);
    getAvatar("todo", idtrl);
    $('.ver_foto').click(function () {
        //$(".file-foto").val('');
        $("#modal_link").click();
        $(".file-foto").click();
    });
    $('.file-foto').change(function (e) {
        var evento;
        console.log("load foto");
        evento = e;
        var ext = $('.file-foto').val().split('.').pop();
        console.log(ext);
        if (ext != "jpeg" || ext != "jpg" || ext != "png") {
            if (this.files[0].size <= 500000) {
                var objDivDialog = $(".div_dialog");
                objDivDialog.empty();
                $.ajax({url: "../../trabajador", data: "opc=ShowDialogFotoTrabajador&id=" + idtrl, type: 'POST', async: false, success: function (data, textStatus, jqXHR) {
                        if (data.rpta == "1") {
                            objDivDialog.append(data.html);
                            $(".dialog-message").dialog({
                                autoOpen: false,
                                modal: true,
                                height: 600,
                                width: 630,
                                title: "<div class='widget-header'><h4><i class='icon-ok'></i>¿ Seguro que desea cambiar ?</h4></div>",
                                buttons: [{
                                        html: "Cancel",
                                        "class": "btn btn-default",
                                        click: function () {
                                            $(this).dialog("close");
                                        }
                                    }, {
                                        html: "<i class='fa fa-check'></i>&nbsp; OK",
                                        "class": "add-foto btn btn-primary",
                                        click: function () {

                                        }
                                    }]

                            });
                            $('.dialog-message').dialog('open');
                            precarga(e);
                            $(".add-foto").on('click', function (event) {
                                event.preventDefault();

                                var jForm = new FormData();
                                jForm.append("idtr", $('.idtr').val());
                                jForm.append("archivo", $('.file-foto').get(0).files[0]);

                                $.ajax({
                                    type: "POST",
                                    url: "../../foto",
                                    cache: false,
                                    processData: false,
                                    contentType: false,
                                    data: jForm, async: false,
                                    success: function (objJson) {
                                        console.log(objJson);
                                        if (objJson.rpta === "-1") {
                                            $.smallBox({
                                                title: "¡Alerta!",
                                                content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar su imagen...</i>",
                                                color: "#C46A69",
                                                iconSmall: "fa fa-cloud bounce animated",
                                                timeout: 7000
                                            });
                                        } else if (objJson.rpta === "1") {
                                            addImage(evento);
                                            this.timer = setTimeout(function () {
                                                var padre = $(window.parent.document.getElementById('foto_usuario'));
                                                var idtra = $(window.parent.document.getElementById('id_trabajador')).val();
                                                if (idtra.trim() == $(".idtr").val().trim()) {
                                                    $('.foto-user').empty();
                                                    $(padre).attr("src", url_archivos + objJson.archivo);
                                                }
                                                Shadowbox.clearCache();
                                                validateShadowBox();
                                                getAvatar("perfil", idtrl);
                                                getAvatar("todo", idtrl);
                                                repeat = 0;
                                                $(".borde").removeClass("ver_foto");
                                                // $(".ver_foto").show(200);
                                                // $(".form-subir-foto").remove();
                                                $.smallBox({
                                                    title: "¡Felicitaciones!",
                                                    content: "<i class='fa fa-clock-o'></i> <i>Su imagen se ha subido con éxito...</i>",
                                                    color: "#296191",
                                                    iconSmall: "fa fa-cloud bounce animated",
                                                    timeout: 6000
                                                });
                                                $('.dialog-message').dialog("close");
                                            }, 4000);
                                        }
                                    }
                                }).fail(function (objJson) {
                                });
                            });
                        }
                    }});



            } else {
                alert("Archivo no permitido, su tamaño debe ser menor a 500 KB");
                $(this).val('');
            }
        } else {
            alert("Archivo no permitido, debe ser una imagen");
            $(this).val('');
        }
    });
    $('.avatar').click(function () {
        console.log("mostar-imegen");
        var cont = '<div class="fotos conteiner"></div>';
        $('#sb-overlay').html(cont);
        getAvatar("todo", idtrl);
        repeat = 1;
        validateShadowBox();
    });

    // Alert
    $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
        _title: function (title) {
            if (!this.options.title) {
                title.html("&#160;");
            } else {
                title.html(this.options.title);
            }
        }
    }));
    $('.ver4foto').click(function () {
        $('#dialog-message').dialog('open');
        return false;
    });
}