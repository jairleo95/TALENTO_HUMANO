/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


            // DO NOT REMOVE : GLOBAL FUNCTIONS!

            $(document).ready(function () {

                pageSetUp();



                Dropzone.autoDiscover = false;
                /*$("#mydropzone").dropzone({
                 //url: "/file/post",
                 addRemoveLinks: true,
                 maxFilesize: 0.5,
                 dictResponseError: 'Error al cargar archivo!'
                 
                 });*/

                var myDropzone = new Dropzone("#mydropzone",
                        {
                            addRemoveLinks: true,
                            maxFilesize: 0.5,
                            dictResponseError: 'Error al cargar archivo!',
                            maxFiles: 5
                                    //  acceptedFiles: ('image/*', '.zip', '.pdf', '.rar')
                        }
                );
                $(".btn_accion").click(function () {
                    myDropzone.removeAllFiles();
                });
                myDropzone.on("addedfile", function (file) {
                    /* $.post("../../contrato_adjunto", "idc=" + $(".idc").val() + "&archivo=" + file.name, function (mensaje) {
                     alert(mensaje);
                     });*/

                    var jForm = new FormData();

                    jForm.append("idc", $('.idc').val());
                    jForm.append("archivo", file);
                    $.ajax({
                        type: "POST",
                        url: "../../contrato_adjunto",
                        cache: false,
                        processData: false,
                        contentType: false,
                        data: jForm
                    }).done(function (f) {
                        alert("Archivo Subido correctamente!");
                    });
                });
            });
