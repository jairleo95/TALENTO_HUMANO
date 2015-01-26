<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>

<!DOCTYPE html>
<!--
Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.md or http://ckeditor.com/license
-->
<%@page import="pe.edu.upeu.application.model.X_List_Id_Contrato_DGP"%>
<jsp:useBean id="List_contra_x_idcto" scope="application" class="java.util.ArrayList"/>
<html>
    <head>
        <meta charset="utf-8">
        <title>Crear Formatos</title>
        <script src="../../../HTML_version/js/plugin/ckeditor/ckeditor.js"></script>
        <link href="../../../HTML_version/js/plugin/ckeditor/samples/sample.css" rel="stylesheet">
        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
        <%for (int i = 0; i < List_contra_x_idcto.size(); i++) {
                X_List_Id_Contrato_DGP n = new X_List_Id_Contrato_DGP();
                n = (X_List_Id_Contrato_DGP) List_contra_x_idcto.get(i);
        %>
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
                var meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
                var diasSemana = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado");
                var f = new Date();
                var menu = {
                    "[nombre]": "",
                    "[app]": "Santos",
                    "[apm]": "Gonzales",
                    "[sexo]": "Masculino",
                    "[dni]": "<%=n.getNu_documento()%>",
                    "[dir]": "<% InterfaceListaDAO l = new ListaDAO();
                    for (int b = 0; b < l.List_Dom_D1_Id().size(); b++) {
                        if (n.getLi_di_dom_a_d1().trim().equals(b + 1 + "")) {
                            out.println(l.List_Dom_D1_Id().get(b));
                        }

                    }

                    if (n.getLi_di_dom_a_d3().trim().equals("1")) {
                        out.println(" " + n.getDi_dom_leg_d2()+ " Numero");
                    }
                    if (n.getLi_di_dom_a_d3().trim().equals("2")) {
                        out.println(" " + n.getDi_dom_leg_d2() + " Lote");
                    }
                    if (n.getLi_di_dom_a_d3().trim().equals("3")) {
                        out.println(" " + n.getDi_dom_leg_d2() + " S/N");
                    }

                    for (int c = 0; c < l.List_Dom_D5_Id().size(); c++) {
                        if (n.getLi_di_dom_a_d5().trim().equals(c + 1 + "")) {
                            out.println(" " + n.getDi_dom_a_d4() + " " + l.List_Dom_D5_Id().get(c));
                        }

                    }
                    out.println(" " + n.getDi_dom_a_d6());

                        %>",
                    "[prov]": "",
                    "[dist]": "",
                    "[dep]": "",
                    "[desde]": "<%=n.getFe_desde()%>",
                    "[hasta]": "<%=n.getFe_hasta()%>",
                    "[puesto]": "<%=n.getNo_puesto()%>",
                    "[fe_actual]": "",
                    "[sueldo]": "<%=n.getCa_sueldo_total()%>",
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
            function mostrar_plantilla(valor) {
                var editor = CKEDITOR.instances.editor1;
                $.post("../../../formato_plantilla", "opc=Listar&id=" + valor, function(objJson) {
                    var imprimir = objJson.imprimir;
                    editor.setData(imprimir);
                });

            }
            function mostrars() {
                //var no_ar=$("#no_arch");
                //alert($(".no_arc").val());
                mostrar_plantilla($(".no_arc").val());
                // $(".id_pl").val($(".plantilla" + $(this).val()).val());
            }
            $(document).ready(function() {
                $("#actu").hide();
                mostrars();
                

            });

        </script>

    </head>

    <body style="height: 1080px">
        <h3>CARGAR PLANTILLAS</h3>
        <%String no_ar = request.getParameter("no_arc");%>
        <input type="hidden" id="no_arch" class="no_arc" value="<%=no_ar%>">
        <button  onclick="procesar_texto();" type="button">Procesar </button>
        <h3>EDITAR PLANTILLAS</h3>
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
                <input  type="hidden" name="opc" value="Actualizar"/>
                <input  type="hidden" name="id" value="" class="id_pl"/>
                <input type="submit" value="Actualizar Formato" id="actu" onclick="leer();">
            </div>
        </form>
    </body>
    <%}%>
</html>
