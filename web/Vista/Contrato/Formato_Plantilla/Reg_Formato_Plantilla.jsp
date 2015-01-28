
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
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
            CKEDITOR.on('instanceReady', function(ev) {
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
                var editor = CKEDITOR.instances.editor1.getData();
                ap.append("<input type='text' value='" + editor + "' name='valor'>");
            }
            function lis_dep(b) {

                $.post("../../../Direccion_Puesto", "opc=Listar_direccion", function(objJson) {
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


                $.post("../../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + valor,function(objJson) {
                    d.empty();
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
                        d.append("<option value='' > [] </option>");
                    }
                });

            }
            function list_area_id(c, valor) {


                $.post("../../../Direccion_Puesto", "opc=Listar_area&" + "id_dep=" + valor, function(objJson) {
                    c.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    c.append("<option value=''selected='' > [TODOS] </option>");
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
                $.post("../../../Direccion_Puesto", "opc=Listar_sec&" + "id_are=" + valor, function(objJson) {
                    d.empty();
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

            }
            
            function mostrar_plantilla(valor) {
                var editor = CKEDITOR.instances.editor1;
                $.post("../../../formato_plantilla", "opc=Listar&id=" + valor, function(objJson) {
                    var imprimir = objJson.imprimir;
                    editor.setData(imprimir);
                });

            }

            $(document).ready(function() {
                // mostrar_plantilla();
                var b = $(".dir");
                lis_dep(b);

                $("#dir").change(function() {
                    var d = $(".dep");
                    var valor = $("#dir").val();
                    lis_dir_id(d, valor);

                    list_plantillas(valor);

                });
                function list_plantillas(valor) {
                var d = $(".tbody-plantilla");
                $.post("../../../formato_plantilla", "opc=Cargar_Plantillas&" + "id_dir=" + valor.trim()+"&id_dep="+$("#dep").val()+"&id_are="+$("#area").val()+"&sec="+$("#seccion").val()+"&id_pu="+$("#puesto").val(), function(objJson) {
                    d.empty();
                    //alert(objJson.lista);
                    var list = objJson.lista;
                    alert(list.length);
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

                    $(".btn-cargar_pl").click(function() {
                        mostrar_plantilla($(".plantilla" + $(this).val()).val());

                        $(".id_pl").val($(".plantilla" + $(this).val()).val());
                    });

                });

            }
                $(".dep").change(function() {
                    list_area_id($(".area"), $(this).val());
                    list_plantillas($(this).val());
                });

                $(".area").change(function() {
                    var d = $(".seccion");
                    list_sec_id(d, $(this).val());
                    list_plantillas($(this).val());
                });

                $(".seccion").change(function() {
                    list_plantillas($(this).val());

                    var e = $(".puesto");
                    $.post("../../../Direccion_Puesto", "opc=Listar_pu_id&" + "id=" + $(this).val(), function(objJson) {
                        e.empty();
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
                });

                $(".puesto").change(function() {
                    list_plantillas($(this).val());

                });
            });

        </script>

    </head>

    <body>
        <h3>CARGAR PLANTILLAS</h3>
        <label>Dirección:</label>
        <select class="dir" id="dir" name="DIRECCION">
            <option value="">[SELECCIONE]</option>
            <option value="">[TODO]</option>
        </select>
        <label>Departamento:</label>
        <select class="dep" id="dep" name="DEPARTAMENTO" >
            <option value="">[TODO]</option>
        </select>
        <label>Area:</label>
        <select class="area" id="area" name="AREA" >
            <option value="">[TODO]</option>
        </select>
        <label>Sección:</label>
        <select class="seccion" id="seccion" name="SECCION" >
            <option value="">[TODO]</option>
        </select>
        <label>Puesto:</label>
        <select class="puesto" id="puesto" name="PUESTO" >
            <option value="">[TODO]</option>
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


        <h3>EDITAR PLANTILLAS</h3>
        <form class="ckeditor_form" action="../../../formato_plantilla" method="post">
            <br><strong>NOMBRE PLANTILLA</strong><br>
            <input type="text" class="nombre_pl" name="no_pl"><br><br>
            <button  onclick="procesar_texto();" type="button">Procesar </button>
            <textarea cols="100" id="editor1" name="editor1" rows="10">
            </textarea>
            <script>
                // Replace the <textarea id="editor1"> with an CKEditor instance.
                CKEDITOR.replace('editor1', {
                    on: {
                        focus: onFocus,
                        blur: onBlur,
                        // Check for availability of corresponding plugins.
                        pluginsLoaded: function(evt) {
                            var doc = CKEDITOR.document, ed = evt.editor;
                            if (!ed.getCommand('bold'))
                                doc.getById('exec-bold').hide();
                            if (!ed.getCommand('link'))
                                doc.getById('exec-link').hide();
                        }
                    }
                    , height: '800px'});
            </script>
            <div id="eButtons" >
                <input  type="hidden" name="id" value="" class="id_pl"/>
                <button type="submit" value="Actualizar" onclick="leer();" name="opc">Actualizar Plantilla</button>
                <button type="submit" value="Crear_Plantilla" name="opc" onclick="leer();">Crear Plantilla</button>
            </div>
        </form>
        <h3>ASIGNAR PLANTILLAS</h3>
    </body>
</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }


%>