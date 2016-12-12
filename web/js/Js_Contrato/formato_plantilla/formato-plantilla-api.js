/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



CKEDITOR.on('instanceReady', function (ev) {
    // Show the editor name and description in the browser status bar.
    document.getElementById('eMessage').innerHTML = 'Instance <code>' + ev.editor.name + '<\/code> loaded.';

    // Show this sample buttons.
    document.getElementById('eButtons').style.display = 'block';
});

function InsertHTML() {
    // Get the editor instance that we want to interact with.
    var editor = CKEDITOR.instances.editor1;
    var value = document.getElementById('htmlArea').value;

    // Check the active editing mode.
    if (editor.mode == 'wysiwyg')
    {
        // Insert HTML code.
        // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-insertHtml
        editor.insertHtml(value);
    } else
        alert('You must be in WYSIWYG mode!');
}

function InsertText() {
    // Get the editor instance that we want to interact with.
    var editor = CKEDITOR.instances.editor1;
    var value = document.getElementById('txtArea').value;

    // Check the active editing mode.
    if (editor.mode == 'wysiwyg')
    {
        // Insert as plain text.
        // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-insertText
        editor.insertText(value);
    } else
        alert('You must be in WYSIWYG mode!');
}

function SetContents() {
    // Get the editor instance that we want to interact with.
    var editor = CKEDITOR.instances.editor1;
    var value = document.getElementById('htmlArea').value;

    // Set editor contents (replace current contents).
    // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-setData
    editor.setData(value);
}

function GetContents() {
    // Get the editor instance that you want to interact with.
    var editor = CKEDITOR.instances.editor1;

    // Get editor contents
    // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-getData
    alert(editor.getData());
    //  alert(editor.getData())
}

function ExecuteCommand(commandName) {
    // Get the editor instance that we want to interact with.
    var editor = CKEDITOR.instances.editor1;

    // Check the active editing mode.
    if (editor.mode == 'wysiwyg')
    {
        // Execute the command.
        // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-execCommand
        editor.execCommand(commandName);
    } else
        alert('You must be in WYSIWYG mode!');
}

function CheckDirty() {
    // Get the editor instance that we want to interact with.
    var editor = CKEDITOR.instances.editor1;
    // Checks whether the current editor contents present changes when compared
    // to the contents loaded into the editor at startup
    // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-checkDirty
    alert(editor.checkDirty());
}

function ResetDirty() {
    // Get the editor instance that we want to interact with.
    var editor = CKEDITOR.instances.editor1;
    // Resets the "dirty state" of the editor (see CheckDirty())
    // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-resetDirty
    editor.resetDirty();
    alert('The "IsDirty" status has been reset');
}

function Focus() {
    CKEDITOR.instances.editor1.focus();
}

function onFocus() {
    document.getElementById('eMessage').innerHTML = '<b>' + this.name + ' is focused </b>';
}

function onBlur() {
    document.getElementById('eMessage').innerHTML = this.name + ' lost focus';
}

function procesar_texto() {
    var menu = {
        "[nombre]": "Jair",
        "[app]": "Santos",
        "[apm]": "Gonzales",
        "[sexo]": "Masculino",
        "[dni]": "",
        "[dir]": "",
        "[prov]": "",
        "[dist]": "",
        "[dep]": "",
        "[desde]": "",
        "[hasta]": "",
        "[puesto]": "",
        "[fe_actual]": "",
        "[sueldo]": "",
        "[horas]": "",
        "[cursos]": ""
    };
    var editor = CKEDITOR.instances.editor1;
    var string_texto = "";
    var texto = editor.getData();
    var arr_text;
    for (var key in menu) {
        var val = menu[key];
        arr_text = texto.split(key);
        for (var g = 0; g < arr_text.length; g++) {
            string_texto = string_texto + arr_text[g] + (((g + 1) == arr_text.length) ? "" : " " + val + " ");
        }
        texto = string_texto;
        string_texto = "";
    }
    editor.setData(texto);
}
function leer() {
    var ap = $(".ckeditor_form");
    $(".valor_editor").remove();
    var editor = CKEDITOR.instances.editor1.getData();
    ap.append("<input type='hidden' class='valor_editor' value='" + editor + "' name='valor'>");
}
function lis_dep(b) {
    $.post("../../../Direccion_Puesto", "opc=Listar_direccion", function (objJson) {
        b.empty();
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var list = objJson.lista;
        b.append("<option value='' selected=''> [TODOS] </option>");
        if (list.length !== 0) {
            for (var i = 0; i < list.length; i++) {
                b.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
            }
        } else {
            b.append("<option value='' > [] </option>");
        }
    });
}
function  lis_dir_id(d, valor) {
    d.empty();
    if (valor != 0) {
        $.post("../../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + valor.trim(), function (objJson) {
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var list = objJson.lista;
            d.append("<option value='' selected=''> [TODOS] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    d.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                }
            } else {
                d.append("<option value='' > [NO HAY] </option>");
            }
        });
    } else {
        d.append("<option value='0' selected=''> [GENERAL] </option>");
        list_area_id($(".area"), $(".dep").val());
    }
}
function list_area_id(c, valor) {
    c.empty();
    if (valor != 0) {
        $.post("../../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + valor, function (objJson) {
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var list = objJson.lista;
            c.append("<option value='' selected='' > [TODOS] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    c.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                }
            } else {
                c.append("<option value='' > [no hay] </option>");
            }
        });
    } else {
        c.append("<option value='0' selected='' > [GENERAL] </option>");
        list_sec_id($(".seccion"), $(".area").val());
    }
}
function list_sec_id(d, valor) {
    d.empty();
    if (valor != 0) {
        $.post("../../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + valor, function (objJson) {
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var list = objJson.lista;
            d.append("<option value='' selected='' > [TODOS] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    d.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                }
            } else {
                d.append("<option value='' > [no hay] </option>");
            }
        });
    } else {
        d.append("<option value='0' selected='' > [GENERAL] </option>");
        list_puesto_id($(".puesto"), $(".seccion").val());
    }
}
function list_puesto_id(e, valor) {
    e.empty();
    if (valor != 0) {
        $.post("../../../Direccion_Puesto", "opc=Listar_pu_id&" + "id=" + valor, function (objJson) {
            if (objJson.rpta == -1) {
                alert(objJson.mensaje);
                return;
            }
            var list = objJson.lista;
            e.append("<option value='' selected='' > [TODOS] </option>");
            if (list.length !== 0) {
                for (var i = 0; i < list.length; i++) {
                    e.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                }
            } else {
                e.empty();
                e.append("<option value='' > [] </option>");
            }
        });
    } else {
        e.append("<option value='0' selected='' > [GENERAL] </option>");
        Listar_Plantilla();
    }
}

function mostrar_plantilla(valor) {
    var editor = CKEDITOR.instances.editor1;
    $.post("../../../formato_plantilla", "opc=Listar&id=" + valor, function (objJson) {
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var imprimir = objJson.imprimir;
        editor.setData(imprimir);
    });

}
function Listar_Plantilla() {
    var d = $(".tbody-plantilla");
    var texto = "";
    $.post("../../../formato_plantilla", "opc=List_Plamtillas&" + "id_dir=" + $(".dir").val() + "&id_dep=" + $(".dep").val() + "&id_are=" + $(".area").val() + "&sec=" + $(".seccion").val() + "&id_pu=" + $(".puesto").val(), function (objJson) {
        d.empty();
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var list = objJson.lista;
        if (list.length > 0) {
            for (var i = 0; i < list.length; i++) {
                texto += '<tr style="height:5px" class="tr_li_plantilla" data-value="' + i + '">';
                texto += '<td align="center" style="width:.5%">' + (i + 1) + '</td>';
                texto += '<td ><i class="fa fa-file-text"></i> ' + list[i].nom_pl + '</td>';
                texto += '<td >' + list[i].nom_pp + '</td>';
                texto += '<input type="hidden" value="' + list[i].id + '" class="id_plantilla' + i + '" />';
                texto += '<input type="hidden" value="' + list[i].nom_ar + '" class="plantilla' + i + '" />';
                texto += '<input type="hidden" value="' + list[i].id_pp + '" class="idplpu' + i + '" />';
                texto += '<input type="hidden" value="' + list[i].nom_pl + '" class="nom_pl' + i + '" />';
                texto += '<input type="hidden" value="' + list[i].direccion + '" class="direccion' + i + '" />';
                if (list[i].es_pl === '1') {
                    texto += '<td align="center" ><button style="width: 100px" type="button" value="' + i + '" class="btn btn-xs btn-danger btn-Desac_pl">Desactivar</button></td>';
                } else {
                    texto += '<td align="center"><button style="width: 100px" type="button" value="' + i + '" class=" btn btn-xs btn-success btn-Activ_pl">Activar</button></td>';
                }
            }
            texto += '</tr>';
            d.append(texto);
            $(".tabla_plant").show('slow');
        } else {
            // d.append("<tr><td>NO HAY PLANTILLAS</td></tr>");
        }
        document.getElementById("table_plantilla").onselectstart = function () {
            return false;
        }


        $(".tr_li_plantilla").dblclick(function () {
            $(".tr_li_plantilla").removeClass("success");
            $(this).addClass("success");
            var valor = $(this).data('value');
            mostrar_plantilla($(".plantilla" + valor).val());
            $(".id_pl").val($(".plantilla" + valor).val());
            $(".id_pc").val($(".id_plantilla" + valor).val());
            $(".nombre_pl").val("");
            $(".nombre_pl").val($(".nom_pl" + valor).val());
            $(".txt_direccion").empty();
            $(".txt_direccion").append($(".direccion" + valor).val());
            $.smallBox({
                content: "<i class='fa fa-clock-o'></i> <i>La plantilla ha sido cargada con exito...</i>",
                color: "#296191",
                iconSmall: "fa fa-cloud bounce animated",
                timeout: 3000
            });
            var editor = CKEDITOR.instances.editor1;
            editor.focus();
        })
        $(".btn-Desac_pl").click(function () {
            var idpp = $(".idplpu" + $(this).val()).val();
            var opc = "Desactivar_pp";
            Desac_Plantilla(idpp, opc);
        });
        $(".btn-Activ_pl").click(function () {
            var idpp = $(".idplpu" + $(this).val()).val();
            var opc = "activar_pp";
            Activar_Plantilla(idpp, opc);
        });
    });
}
function Activar_Plantilla(id_pp, opc) {
    $.post("../../../formato_plantilla", "opc=" + opc + "&id_pp=" + id_pp, function () {
        Listar_Plantilla();
    });
}
function Desac_Plantilla(id_pp, opc) {
    $.post("../../../formato_plantilla", "opc=" + opc + "&id_pp=" + id_pp, function () {
        Listar_Plantilla();
    });
}
function  lis_sel(d, valor, opc, num) {
    d.empty();
    if (num == 1) {
        $(".dep_as").empty();
        $(".dep_as").append("<option value='0' selected='' > [GENERAL] </option>");
        $(".area_as").empty();
        $(".area_as").append("<option value='0' selected='' > [GENERAL] </option>");
        $(".seccion_as").empty();
        $(".seccion_as").append("<option value='0' selected='' > [GENERAL] </option>");
        $(".puesto_as").empty();
        $(".puesto_as").append("<option value='0' selected='' > [GENERAL] </option>");
        $("#de_sig").val("0");
        $("#ar_sig").val("0");
        $("#se_sig").val("0");
        $("#pu_sig").val("0");
        $("#di_sig").val("0");
    } else {
        if (valor != 0) {
            $.post("../../../Direccion_Puesto", "opc=" + opc + "&" + "id=" + valor, function (objJson) {
                var list = objJson.lista;
                d.append("<option value='0' selected=''> [TODOS] </option>");
                if (list.length !== 0) {
                    for (var i = 0; i < list.length; i++) {
                        d.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                    }
                } else {
                    d.append("<option value='' > [NO HAY] </option>");
                }
            });
        } else {
            d.append("<option value='0' > [GENERAL] </option>");
        }
    }
}
function list_dir_fil(c, fil, op) {
    $.post("../../../Direccion_Puesto", "opc=Listar_direccion_filial&id_fil=" + fil.val(), function (objJson) {
        c.empty();
        if (objJson.rpta == -1) {
            alert(objJson.mensaje);
            return;
        }
        var list = objJson.lista;
        if (list.length !== 0) {
            c.append("<option value='' > [SELECCIONE] </option>");
            for (var i = 0; i < list.length; i++) {
                c.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
            }
        } else {
            c.append("<option value='0' selected > [GENERAL] </option>");
            if (op !== true) {
                var d = $(".dep");
                var valor = $("#dir").val();
                lis_dir_id(d, valor);
            } else if (op === true) {
                var d = $(".dep_as");
                var valor = $(".dir_as").val();
                var opc = "Listar_dir_dep";
                var num = 1;
                lis_sel(d, valor, opc, num);
                $("#di_sig").val(valor.trim());
            }
        }
    });
}
function status_plantilla(status) {
    var div_status_pl = $(".status_plantilla");
    div_status_pl.empty();
    if (status === '0') {
        div_status_pl.append('<div class="alert alert-warning fade in"> <button class="close" data-dismiss="alert"> ×</button> <i class="fa-fw fa fa-refresh"></i> <strong></strong> Guardando...</div>');
    } else if (status === '1') {
        div_status_pl.append('<div class="alert alert-info fade in"><i class="fa-fw fa fa-info"></i><strong></strong> Todos los cambios guardados</div>');
    } else if (status === '-1') {
        div_status_pl.append('<div class="alert alert-danger fade in"> <i class="fa-fw fa fa-times"></i><strong></strong> Ocurrió un error al guardar</div>');
    } else {
        div_status_pl.append('<div class="alert alert-danger fade in"> <i class="fa-fw fa fa-times"></i><strong></strong> Ocurrió un error al guardar</div>');
    }

}
$(document).ready(function () {
    pageSetUp();
    $.sound_path = "../../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
        $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>");
    });
    $(".nombre_pl").keyup(function () {
        status_plantilla('0');
        if ($(".id_pl").val() != "" & $(this).val() != "") {
            $.ajax({
                url: "../../../formato_plantilla", type: 'POST', data: "nom_pl=" + $(this).val() + "&id=" + $(".id_pc").val() + "&opc=UpdateNameFile", success: function (data, textStatus, jqXHR) {
                    Listar_Plantilla();
                    status_plantilla(data.rpta);
                }
            });
        }
    });
    $(".btn_search").click(function () {
        Listar_Plantilla();
    });
    $(".btn_cancel").click(function () {
        $(".form_cargar")[0].reset();
        $("#form_asignar")[0].reset();
        $(".tabla_plant").hide();
    });
    $(".btn_cancel_asignar").click(function () {
        $(this).hide(200);
        $("#form_asignar").hide(200);
        $(".form_cargar").show();
        $(".tabla_plant").show();
    });
    $(".btn_asignar").click(function () {

        $(".btn_cancel_asignar").show(200);
        $(".form_cargar").hide();
        $(".tabla_plant").hide();
        $("#form_asignar").show(200);
        //  $(".form_editor").valid();
        if ($("#form_asignar").valid() & $(".form_editor").valid()) {
            var opc = "";
            if ($(".id_pc").val() == "") {
                opc = "Crear_Plantilla";
            } else {
                opc = "Asignar";
            }
            $.ajax({
                url: "../../../formato_plantilla",
                data: $(".form_editor").serialize() + "&opc=" + opc,
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    if (opc == "Crear_Plantilla") {
                        if (data.rpta === "1") {
                            $(".form_editor")[0].reset();
                            $.smallBox({
                                title: "¡Felicitaciones!",
                                content: "<i class='fa fa-clock-o'></i> <i>El formato de plantilla contractual se ha subido con éxito...</i>",
                                color: "#296191",
                                iconSmall: "fa fa-cloud bounce animated",
                                timeout: 7000
                            });
                        } else if (data.rpta === "-1") {
                            $.smallBox({
                                title: "¡Alerta!",
                                content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar su plantilla...</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-cloud bounce animated",
                                timeout: 7000
                            });
                        }
                    } else {
                        if (data.rpta === "1") {
                            $(".form_editor")[0].reset();
                            $.smallBox({
                                title: "¡Felicitaciones!",
                                content: "<i class='fa fa-clock-o'></i> <i>El formato de plantilla contractual se ha subido con éxito...</i>",
                                color: "#296191",
                                iconSmall: "fa fa-cloud bounce animated",
                                timeout: 7000
                            });
                        } else if (data.rpta === "-1") {
                            $.smallBox({
                                title: "¡Alerta!",
                                content: "<i class='fa fa-clock-o'></i> <i>Ha ocurrido un error al procesar su plantilla...</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-cloud bounce animated",
                                timeout: 7000
                            });
                        }
                    }
                }
            });
        }
    });
    var b = $(".dir");
    var c = $(".dir_as");
    $(".fil").change(function () {
        var c = $(".dir");
        list_dir_fil(c, $(this));
      //  alert($(this));
    });
    $(".fil_as").change(function () {
        var c = $(".dir_as");
        list_dir_fil(c, $(this), true);
       // alert($(this));
    });
    $("#dir").change(function () {
        var d = $(".dep");
        var valor = $("#dir").val();
        lis_dir_id(d, valor);
        Listar_Plantilla();
    });
    $(".dep").change(function () {
        Listar_Plantilla();
        list_area_id($(".area"), $(this).val());
    });

    $(".area").change(function () {
        var d = $(".seccion");
        Listar_Plantilla();
        list_sec_id(d, $(this).val());
    });

    $(".seccion").change(function () {
        Listar_Plantilla();
        var e = $(".puesto");
        var valor = $(this).val();
        list_puesto_id(e, valor);
    });
    $(".puesto").change(function () {
        Listar_Plantilla();
    });
    $(".dir_as").change(function () {
        var d = $(".dep_as");
        var valor = $(".dir_as").val();
        var opc = "Listar_dir_dep";
        lis_sel(d, valor, opc);
        $("#di_sig").val(valor.trim());

    });
    $(".dep_as").change(function () {
        var d = $(".area_as");
        var valor = $(".dep_as").val();
        var opc = "Listar_area2";
        lis_sel(d, valor, opc);
        $("#de_sig").val(valor.trim());
    });
    $(".area_as").change(function () {
        var d = $(".seccion_as");
        var valor = $(".area_as").val();
        var opc = "Listar_sec2";
        lis_sel(d, valor, opc);
        $("#ar_sig").val(valor.trim());
    });
    $(".seccion_as").change(function () {
        var d = $(".puesto_as");
        var valor = $(".seccion_as").val();
        var opc = "Listar_pu_id";
        lis_sel(d, valor, opc);
        $("#se_sig").val(valor.trim());
    });
    $(".puesto_as").change(function () {
        $("#pu_sig").val($(".puesto_as").val().trim());

    })
    $("#form_asignar").validate({
        errorPlacement: function (error, element) {
            error.insertAfter(element.parent());
        }
    });
    CKEDITOR.replace('editor1',
            {
                toolbar:
                        [['Source', '-', 'NewPage', 'Preview', '-', 'Templates'],
                            ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Print', 'SpellChecker', 'Scayt'],
                            ['Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll', 'RemoveFormat'],
                            ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
                            '/',
                            ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript'],
                            ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote'],
                            ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
                            ['Link', 'Unlink', 'Anchor'],
                            ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak'],
                            '/',
                            ['Styles', 'Format', 'Font', 'FontSize'],
                            ['TextColor', 'BGColor'],
                            ['Maximize', 'ShowBlocks', '-', 'About'],
                            ['Styles', 'Format'],
                            ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', '-', 'About']
                        ],
                height: '1024px'
            });

    var editor = CKEDITOR.instances.editor1;
    editor.on('change', function () {
        leer();
        status_plantilla('0');
        $.ajax({
            url: "../../../formato_plantilla",
            data: $(".form_editor").serialize() + "&opc=Actualizar",
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                setTimeout(function () {
                    status_plantilla(data.rpta);
                }, 1000);

            }
        });
    });
})
