
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
        <link type="text/css" rel="stylesheet" href="../../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../../css/Css_Formulario/form.css">
        <link href="../../../HTML_version/js/plugin/ckeditor/samples/sample.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../HTML_version/css/font-awesome.min.css">
        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../HTML_version/css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../HTML_version/css/smartadmin-skins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../HTML_version/css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../../HTML_version/img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../HTML_version/img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../../HTML_version/img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../../HTML_version/img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../../HTML_version/img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../../HTML_version/img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../../HTML_version/img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../../HTML_version/img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../../HTML_version/img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
        <link rel="stylesheet" type="text/css"  href="../../../css/Css_Formulario/form.css">
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
                ap.append("<input type='hidden' value='" + editor + "' name='valor'>");
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


                $.post("../../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + valor, function(objJson) {
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
                    c.append("<option value='' selected='' > [TODOS] </option>");
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
            function Listar_Plantilla() {
                var d = $(".tbody-plantilla");
                $.post("../../../formato_plantilla", "opc=List_Plamtillas&" + "id_dir=" + $(".dir").val() + "&id_dep=" + $(".dep").val() + "&id_are=" + $(".area").val() + "&sec=" + $(".seccion").val() + "&id_pu=" + $(".puesto").val(), function(objJson) {
                    d.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    if (list.length > 0) {
                        for (var i = 0; i < list.length; i++) {
                            d.append('<tr>');
                            d.append('<td align="center">' + (i + 1) + '</td>');
                            d.append('<td align="center">' + list[i].nom_pl + '</td>');
                            if (list[i].es_pl === '1') {
                                d.append('<td align="center">Activado</td>');
                            } else {
                                d.append('<td align="center">Desactivado</td>');
                            }
                            d.append('<input type="hidden" value="' + list[i].id + '" class="id_plantilla' + i + '" />');
                            d.append('<input type="hidden" value="' + list[i].nom_ar + '" class="plantilla' + i + '" />');
                            d.append('<input type="hidden" value="' + list[i].id_pp + '" class="idplpu' + i + '" />');
                            d.append('<td><button type="button" value="' + i + '" class="btn-cargar_pl">Cargar</button></td>');
                            if (list[i].es_pl === '1') {
                                d.append('<td align="center" ><button style="width: 100px" type="button" value="' + i + '" class="btn-Desac_pl">Desactivar</button></td>');
                            } else {
                                d.append('<td align="center"><button style="width: 100px" type="button" value="' + i + '" class="btn-Activ_pl">Activar</button></td>');
                            }
                        }
                        d.append('</tr>');
                    }
                    else {
                        d.append("<tr><td>NO HAY PLANTILLAS</td></tr>");
                    }
                    $(".btn-cargar_pl").click(function() {
                        alert($(".plantilla" + $(this).val()).val());
                        mostrar_plantilla($(".plantilla" + $(this).val()).val());
                        $(".id_pl").val($(".plantilla" + $(this).val()).val());
                        $(".id_pc").val($(".id_plantilla" + $(this).val()).val());
                    });
                    $(".btn-Desac_pl").click(function() {
                        var r = jQuery(confirm("Esta seguro de Modificar"));
                        if (r === true) {
                        } else {
                            var idpp = $(".idplpu" + $(this).val()).val();
                            var opc = "Desactivar_pp";
                            Desac_Plantilla(idpp, opc);
                            Listar_Plantilla();
                        }
                    });
                    $(".btn-Activ_pl").click(function() {
                        var r = jQuery(confirm("Esta seguro de Modificar",false));
                        if (r == true) {
                        } else {
                            var idpp = $(".idplpu" + $(this).val()).val();
                            var opc = "activar_pp";
                            Activar_Plantilla(idpp, opc);
                            Listar_Plantilla();
                        }
                       /* var person = jQuery(prompt("Please enter your name", ""));
                        if (person != null) {
                            document.getElementById("demo").innerHTML =
                                    "Hello " + person + "! How are you today?";
                        }*/
                    });
                });
            }
            function Activar_Plantilla(id_pp, opc) {
                $.post("../../../formato_plantilla", "opc=" + opc + "&id_pp=" + id_pp, function() {
                });
            }
            function Desac_Plantilla(id_pp, opc) {
                $.post("../../../formato_plantilla", "opc=" + opc + "&id_pp=" + id_pp);
            }
            function  lis_sel(d, valor, opc) {


                $.post("../../../Direccion_Puesto", "opc=" + opc + "&" + "id=" + valor, function(objJson) {
                    d.empty();
                    var list = objJson.lista;
                    d.append("<option value='0' selected=''> [TODOS] </option>");
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            d.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                        }
                    } else {
                        d.append("<option value='0' > [] </option>");
                    }
                });

            }
            function list_dir(c) {
                $.post("../../../Direccion_Puesto", "opc=Listar_direccion", function(objJson) {
                    c.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var list = objJson.lista;
                    c.append("<option value='0' selected=''> [TODOS] </option>");
                    if (list.length !== 0) {
                        for (var i = 0; i < list.length; i++) {
                            c.append('<option value="' + list[i].id + '">' + list[i].nombre + '</option>');
                        }
                    } else {
                        c.append("<option value='0' > [] </option>");
                    }
                });
            }

            $(document).ready(function() {
                // mostrar_plantilla();
                var b = $(".dir");
                lis_dep(b);
                var c = $(".dir_as");
                list_dir(c);
                $("#dir").change(function() {
                    var d = $(".dep");
                    var valor = $("#dir").val();
                    lis_dir_id(d, valor);
                    Listar_Plantilla();

                });
                $(".dep").change(function() {
                    Listar_Plantilla();
                    list_area_id($(".area"), $(this).val());

                    //list_plantillas($(this).val());
                });

                $(".area").change(function() {
                    var d = $(".seccion");
                    Listar_Plantilla();
                    list_sec_id(d, $(this).val());
                    //list_plantillas($(this).val());
                });

                $(".seccion").change(function() {
                    //list_plantillas($(this).val());
                    Listar_Plantilla()
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
                    Listar_Plantilla();
                    //list_plantillas($(this).val());

                });
                $(".dir_as").change(function() {
                    var d = $(".dep_as");
                    var valor = $(".dir_as").val();
                    var opc = "Listar_dir_dep";
                    lis_sel(d, valor, opc);

                });
                $(".dep_as").change(function() {
                    var d = $(".area_as");
                    var valor = $(".dep_as").val();
                    var opc = "Listar_area2";
                    lis_sel(d, valor, opc);

                });
                $(".area_as").change(function() {
                    var d = $(".seccion_as");
                    var valor = $(".area_as").val();
                    var opc = "Listar_sec2";
                    lis_sel(d, valor, opc);

                });
                $(".seccion_as").change(function() {
                    var d = $(".puesto_as");
                    var valor = $(".seccion_as").val();
                    var opc = "Listar_pu_id";
                    lis_sel(d, valor, opc);

                });
            });

        </script>

    </head>

    <body align="center">
    <center>
        <form class="ckeditor_form" action="../../../formato_plantilla" method="post">
            <div class="row" >

                <h3>CARGAR PLANTILLAS</h3>
                <section class="col col-4" >
                    <label>Dirección:
                        <select class="dir col  " id="dir" name="id_di" >
                            <option value="">[SELECCIONE]</option>
                            <option value="">[TODO]</option>
                        </select>   
                    </label>
                </section>
                <section class="col col-4" >
                    <label>Departamento:
                        <select class="dep col " id="dep" name="id_dep" >
                            <option value="">[TODO]</option>
                        </select>
                    </label>
                </section>
                <section class="col col-4" >
                    <label>Area:
                        <select class="area col" id="area" name="id_are" >
                            <option value="">[TODO]</option>
                        </select>
                    </label>
                </section>
                <section class="col col-4" >
                    <label>Sección:
                        <select class="seccion col" id="seccion" name="id_sec" >
                            <option value="">[TODO]</option>
                        </select>
                    </label>
                </section>
                <section class="col col-4" >
                    <label>Puesto:
                        <select class="puesto col" id="puesto" name="id_pu" >
                            <option value="">[TODO]</option>
                        </select>
                    </label>
                </section>
                <br>
                <br>
                <table class="table table-hover table-responsive"  >
                    <thead>
                        <tr>
                            <td align="center" >Nro</td>
                            <td align="center">Nombre Plantilla</td>
                            <td align="center">Estado Plantilla Puesto</td>
                            <td colspan="2">Acciones</td>
                        </tr>
                    </thead>
                    <tbody class="tbody-plantilla">
                    </tbody>
                </table>
                <h3>ASIGNAR PLANTILLAS</h3>
                <section class="col col-4" >
                    <label>Dirección:
                        <select class="dir_as col  " id="dir_as" name="id_di_asig" >
                            <option value="">[SELECCIONE]</option>
                            <option value="0">[TODO]</option>
                        </select>   
                    </label>
                </section>
                <section class="col col-4" >
                    <label>Departamento:
                        <select class="dep_as col " id="dep_as" name="id_dep_asig" >
                            <option value="0">[TODO]</option>
                        </select>
                    </label>
                </section>
                <section class="col col-4" >
                    <label>Area:
                        <select class="area_as col" id="area_as" name="id_are_asig" >
                            <option value="0">[TODO]</option>
                        </select>
                    </label>
                </section>
                <section class="col col-4" >
                    <label>Sección:
                        <select class="seccion_as col" id="seccion_as" name="id_sec_asig" >
                            <option value="0">[TODO]</option>
                        </select>
                    </label>
                </section>
                <section class="col col-4" >
                    <label>Puesto:
                        <select class="puesto_as col" id="puesto_as" name="id_pu_asig" >
                            <option value="0">[TODO]</option>
                        </select>
                    </label>
                </section>
            </div>
            <h3>EDITAR PLANTILLAS</h3>

            <br><strong>NOMBRE PLANTILLA</strong><br>
            <input type="text" class="nombre_pl form-control" name="no_pl" ><br><br>
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
                <input  type="hidden" name="id_pc" value="" class="id_pc"/>
                <button type="submit" value="Actualizar" onclick="leer();" name="opc">Actualizar Plantilla</button>
                <button type="submit" value="Asignar" onclick="leer();" name="opc">Asignar Plantilla</button>
                <button type="submit" value="Crear_Plantilla" name="opc" onclick="leer();">Crear Plantilla</button>
            </div>
        </form>
        <h3>ASIGNAR PLANTILLAS</h3>
    </center>
</body>
</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>