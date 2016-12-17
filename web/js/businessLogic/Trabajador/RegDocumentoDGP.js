/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


    Shadowbox.init({
                                                        overlayOpacity: 0.8
                                                    }, setupDemos);
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
                                                            content: "ya puede visualizar el documento",
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
                                                                // console.log("value input :" + thisObject.val())
                                                                //   console.log("tam input :" + thisObject[0].files.size)

                                                                //  $("#ulList").empty();
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
                                                                        console.log(fragment)


                                                                        if (fileSize > 512000) {
                                                                            // $(thisObject).val(" ");
                                                                            //    thisObject.clik(".kv-file-remove");
                                                                            $(thisObject).focus();
                                                                            x = false;


                                                                        }
                                                                       
                                                                        
                                                                        

                                                                    }

                                                                    // $("#ulList").append(fragment);
                                                                }

                                                            }
                                                            console.log(index)
                                                            //   console.log(thisObject.files.length);
                                                        });
                                                        console.log(x)
                                                        return x;
                                                    }


                                                    $(document).ready(function () {
                                                        pageSetUp();
                                                        $.sound_path = "../../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                                                            $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                                                        });
                                                        $("#file-0").fileinput({
                                                            'allowedFileExtensions': ['jpg', 'png', 'gif'],
                                                        });

                                                        $(".btn_reg_doc").click(function () {
                                                            console.log(validateSizeFile());
                                                            if (validateSizeFile()) {
                                                                $(".form_dgp_doc").submit();
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
                                                            allowedFileExtensions: ['jpg', 'png', 'gif', 'pdf', 'docx', 'doc','txt'],
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
                                                            $(".btn_continuar_det").show();
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

                                                     
                                                    });