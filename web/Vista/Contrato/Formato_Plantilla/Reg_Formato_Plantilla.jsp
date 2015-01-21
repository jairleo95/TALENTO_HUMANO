<!DOCTYPE html>
<!--
Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.md or http://ckeditor.com/license
-->
<html>
    <head>
        <meta charset="utf-8">
        <title>Crear Formatos</title>
        <script src="../../../HTML_version/js/plugin/ckeditor/ckeditor.js"></script>
        <link href="../../../HTML_version/js/plugin/ckeditor/samples/sample.css" rel="stylesheet">
        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
        <script>

// The instanceReady event is fired, when an instance of CKEditor has finished
// its initialization.
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
                }
                else
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
                }
                else
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
                }
                else
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
                    "[ape_p]": "Santos",
                    "[ape_m]": "Gonzales",
                    "[sexo]": "Masculino"
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
                var editor = CKEDITOR.instances.editor1.getData();
                ap.append("<input type='text' value='" + editor + "' name='valor'>");
            }
            function lis_dep(b) {

                $.post("../../../Direccion_Puesto", "opc=Listar_direccion", function (objJson) {
                    b.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    b.append("<option value='' > [SELECCIONE] </option>");
                    b.append("<option value='0' > [TODOS] </option>");
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


                $.post("../../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + valor, function (objJson) {
                    d.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    d.append("<option value='' > [SELECCIONE] </option>");
                    d.append("<option value='0' > [TODOS] </option>");
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            d.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                        }
                    } else {
                        d.append("<option value='' > [] </option>");
                    }
                });

            }
            function list_area_id(c, valor) {


                $.post("../../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + valor, function (objJson) {
                    c.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    c.append("<option value='' > [SELECCIONE] </option>");
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            c.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                        }
                    } else {
                        c.append("<option value='' > [no hay] </option>");
                    }
                });

            }
            function list_sec_id(d, valor) {
                $.post("../../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + valor, function (objJson) {
                    d.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    d.append("<option value='' > [SELECCIONE] </option>");
                    d.append("<option value='0' > [TODOS] </option>");
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            d.append('<option value="' + list[i].id + '">' + list[i].nom + '</option>');
                        }
                    } else {
                        d.append("<option value='' > [no hay] </option>");
                    }
                });

            }
            function list_plantillas(valor) {
                var d = $(".tbody-plantilla");
                $.post("../../../formato_plantilla", "opc=Cargar_Plantillas&" + "id=" + valor, function (objJson) {
                    d.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            d.append('<tr>');
                            d.append('<td>' + (i + 1) + '</td>');
                            d.append('<td>' + list[i].nombre + '</td>');
                            d.append('<input type="hidden" value="' + list[i].id_plantilla + '" class="id_plantilla' + i + '" />');
                            d.append('<input type="hidden" value="' + list[i].plantilla + '" class="plantilla' + i + '" />');
                            d.append('<td><button type="button" value="' + i + '" class="btn-cargar_pl">Cargar</button></td>');
                            d.append('</tr>');
                        }
                    } else {
                        d.append("<tr><td colspan='3'>No existen Plantillas</td></tr>");
                    }

                    $(".btn-cargar_pl").click(function () {
                        //alert();
                        mostrar_plantilla($(".plantilla" + $(this).val()).val());

                        $(".id_pl").val($(".plantilla" + $(this).val()).val());
                    });

                });

            }
            function mostrar_plantilla(valor) {
                var editor = CKEDITOR.instances.editor1;
                $.post("../../../formato_plantilla", "opc=Listar&id=" + valor, function (objJson) {
                    var imprimir = objJson.imprimir;
                    editor.setData(imprimir);
                });

            }



            $(document).ready(function () {

                // mostrar_plantilla();
                var b = $(".dir");
                lis_dep(b);

                b.change(function () {
                    var d = $(".dep");
                    var valor = $(this).val();
                    lis_dir_id(d, valor);
                    list_plantillas(valor);

                });

                $(".dep").change(function () {
                    list_area_id($(".area"), $(this).val());
                });

                $(".area").change(function () {
                    var d = $(".seccion");
                    list_sec_id(d, $(this).val());
                });

                $(".seccion").change(function () {
                    var e = $(".puesto");
                    $.post("../../../Direccion_Puesto", "opc=Listar_pu_id&" + "id=" + $(this).val(), function (objJson) {
                        e.empty();
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                        var list = objJson.lista;
                        e.append("<option value='' > [SELECCIONE] </option>");
                        e.append("<option value='0' > [TODOS] </option>");
                        if (list.length !== 0) {
                            for (var i = 0; i < list.length; i++) {
                                e.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                            }
                        } else {
                            e.empty();
                            e.append("<option value='' > [] </option>");
                        }
                    });
                });
            });

        </script>

    </head>
    <body>
        <label>Dirección:</label>
        <select class="dir" name="DIRECCION">
            <option value="">[SELECCIONE]</option>
            <option value="0">[TODO]</option>
        </select>
        <label>Departamento:</label>
        <select name="DEPARTAMENTO" class="dep">
            <option value="">[SELECCIONE]</option>
            <option value="0">[TODO]</option>
        </select>
        <label>Area:</label>
        <select name="AREA" class="area">
            <option value="">[SELECCIONE]</option>
            <option value="0">[TODO]</option>
        </select>
        <label>Sección:</label>
        <select name="SECCION" class="seccion">
            <option value="">[SELECCIONE]</option>
            <option value="0">[TODO]</option>
        </select>
        <label>Puesto:</label>
        <select name="PUESTO" class="puesto">
            <option value="">[SELECCIONE]</option>
            <option value="0">[TODO]</option>
            <option value="1">Direccion General de Sistemas</option>
        </select>
        <br>
        <br>
        <table class="table" border="1">
            <thead>
                <tr>
                    <td>Nro</td>
                    <td>Nombre Plantilla</td>
                    <td>Acciones</td>
                </tr>
            </thead>
            <tbody class="tbody-plantilla">

            </tbody>

        </table>
        <button  onclick="procesar_texto();" type="button">Procesar </button>

        <form class="ckeditor_form" action="../../../formato_plantilla" method="post">
            <textarea cols="100" id="editor1" name="editor1" rows="10">
            </textarea>
            <script>
                // Replace the <textarea id="editor1"> with an CKEditor instance.
                CKEDITOR.replace('editor1', {
                    on: {
                        focus: onFocus,
                        blur: onBlur,
                        // Check for availability of corresponding plugins.
                        pluginsLoaded: function (evt) {
                            var doc = CKEDITOR.document, ed = evt.editor;
                            if (!ed.getCommand('bold'))
                                doc.getById('exec-bold').hide();
                            if (!ed.getCommand('link'))
                                doc.getById('exec-link').hide();
                        }
                    }
                    , height: '800px'});
            </script>

            <p id="eMessage"></p>

            <div id="eButtons" style="display: none">
                <input  type="hidden" name="opc" value="Actualizar"/>
                <input  type="text" name="id" value="" class="id_pl"/>
                <input type="submit" value="Actualizar Formato" onclick="leer();">
                <br>
                <input id="exec-bold" onclick="ExecuteCommand('bold');" type="button" value="Execute &quot;bold&quot; Command">
                <input id="exec-link" onclick="ExecuteCommand('link');" type="button" value="Execute &quot;link&quot; Command">
                <input onclick="Focus();" type="button" value="Focus">
                <br><br>
                <input onclick="InsertHTML();" type="button" value="Insert HTML">
                <input onclick="SetContents();" type="button" value="Set Editor Contents">
                <input onclick="GetContents();" type="button" value="Get Editor Contents (XHTML)">
                <br>
                <textarea cols="100" id="htmlArea" rows="3">&lt;h2&gt;Test&lt;/h2&gt;&lt;p&gt;This is some &lt;a href="/Test1.html"&gt;sample&lt;/a&gt; HTML code.&lt;/p&gt;</textarea>
                <br>
                <br>
                <input onclick="InsertText();" type="button" value="Insert Text">
                <br>
                <textarea cols="100" id="txtArea" rows="3">   First line with some leading whitespaces.Second line of text preceded by two line breaks.</textarea>
                <br>
                <br>
                <input onclick="CheckDirty();" type="button" value="checkDirty()">
                <input onclick="ResetDirty();" type="button" value="resetDirty()">
            </div>
        </form>

    </body>
</html>