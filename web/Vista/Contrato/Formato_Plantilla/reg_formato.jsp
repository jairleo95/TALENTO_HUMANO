
<%@page import="pe.edu.upeu.application.model.Zona"%>
<%@page import="pe.edu.upeu.application.model.Via"%>
<%@page import="pe.edu.upeu.application.model.Funciones"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<%@page import="pe.edu.upeu.application.model.X_List_Id_Contrato_DGP"%>
<%@page import="java.util.Calendar;"%>
<jsp:useBean id="List_contra_x_idcto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_x_fun_x_idpu" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Dom_D1_Id" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Dom_D5_Id" scope="application" class="java.util.ArrayList"/>
<html>
    <head>
        <meta charset="utf-8">
        <title>Crear Formatos</title>
        <script src="../../../HTML_version/js/plugin/ckeditor/ckeditor.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">
        <link href="../../../HTML_version/js/plugin/ckeditor/samples/sample.css" rel="stylesheet">

        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
        <%
            String no_arch = request.getParameter("no_arc");
            if (no_arch != null) {
                for (int i = 0; i < List_contra_x_idcto.size(); i++) {
                    X_List_Id_Contrato_DGP n = new X_List_Id_Contrato_DGP();
                    n = (X_List_Id_Contrato_DGP) List_contra_x_idcto.get(i);
                    String Direccion = "";
                    if (n.getLi_di_dom_a_d1() != null) {
                        for (int b = 0; b < List_Dom_D1_Id.size(); b++) {
                            Via v = new Via();
                            v = (Via) List_Dom_D1_Id.get(b);
                            if (n.getLi_di_dom_a_d1().trim().equals(b + 1 + "")) {
                                if (n.getDi_dom_a_d2() != null) {
                                    Direccion += v.getDe_via() +" "+ n.getDi_dom_a_d2().trim();
                                } else {
                                    Direccion += v.getDe_via().trim() + " - ";
                                }
                            }
                        }
                    } else {
                        Direccion += "--" + n.getDi_dom_a_d2().trim();
                    }
                    if (n.getLi_di_dom_a_d3() != null) {
                        if (n.getLi_di_dom_a_d3().trim().equals("1")) {
                            Direccion += " Numero ";
                        }
                        if (n.getLi_di_dom_a_d3().trim().equals("2")) {
                            Direccion += " Lote ";

                        }
                        if (n.getLi_di_dom_a_d3().trim().equals("3")) {
                            Direccion += " S/N ";
                        }
                        if (n.getLi_di_dom_a_d3().trim().equals("4")) {
                            Direccion += " Km ";
                        }
                        if (n.getLi_di_dom_a_d3().trim().equals("5")) {
                            Direccion += " Block ";
                        }
                        if (n.getLi_di_dom_a_d3().trim().equals("6")) {
                            Direccion += " Etapa ";
                        }
                        if (n.getLi_di_dom_a_d3().trim().equals("7")) {
                            Direccion += " Departamento ";
                        }
                        if (n.getLi_di_dom_a_d3().trim().equals("8")) {
                            Direccion += " Interior ";
                        }
                    } else {
                        Direccion += "-";
                    }
                    if (n.getLi_di_dom_a_d5() != null) {
                        for (int c = 0; c < List_Dom_D5_Id.size(); c++) {
                            Zona z = new Zona();
                            z = (Zona) List_Dom_D5_Id.get(c);
                            if (n.getLi_di_dom_a_d5().trim().equals(c + 1 + "")) {
                                if (n.getDi_dom_a_d4() != null) {
                                    Direccion += n.getDi_dom_a_d4().trim() + " " + z.getDe_zona();
                                } else {
                                    Direccion += " - " + z.getDe_zona();
                                }
                            }
                        }
                    } else {
                        Direccion += " -- "+n.getDi_dom_a_d4() ;
                    }
                    if (n.getDi_dom_a_d6() != null) {
                        Direccion += " " + n.getDi_dom_a_d6().trim();
                    } else {
                        Direccion += " - ";
                    }
                    String fecha = n.getFe_sus();
                    String fechasus = "";
                    if (fecha != "" & fecha != null) {
                        /*if (System.getProperty("sun.desktop").trim().equals("windows")) {
                         String f[] = fecha.split("/");
                         fechasus = f[0] + " de " + f[1] + " del " + f[2];
                         } else {*/
                        String f[] = fecha.split("/");
                        fechasus = f[0] + " de " + f[1] + " del " + f[2];
                        /* }*/
                    } else {
                        fechasus = "NO TIENE";
                    }
                    String fecha2 = n.getFe_des();
                    String fechades = "";
                    if (fecha2 != "" & fecha2 != null) {
                        String f[] = fecha2.split("/");
                        fechades = f[0] + " de " + f[1] + " del " + f[2];
                    } else {
                        fechades = "NO registrado";
                    }
                    fecha2 = n.getFe_has();
                    String fechahas = "";
                    if (fecha2 != "" & fecha2 != null) {
                        String f[] = fecha2.split("/");
                        fechahas = f[0] + " de " + f[1] + " del " + f[2];
                    } else {
                        fechahas = "NO TIENE";
                    }
                    String funciones = "";
                    for (int p = 0; p < List_x_fun_x_idpu.size(); p++) {
                        Funciones fn = new Funciones();
                        fn = (Funciones) List_x_fun_x_idpu.get(p);
                        if (p == (List_x_fun_x_idpu.size() - 1)) {
                            funciones += fn.getDe_funcion();
                        } else {
                            funciones += fn.getDe_funcion() + ",";
                        }
                    }
                    String moneda = "";
                    if (n.getCo_ti_moneda().trim().equals("01")) {
                        moneda = "nuevos soles";
                    }
                    if (n.getCo_ti_moneda().trim().equals("02")) {
                        moneda = "dolares";
                    }
                    if (n.getCo_ti_moneda().trim().equals("03")) {
                        moneda = "euros";
                    }
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
                var menu = {
                    "[nombre]": "<%=n.getNo_trabajador()%>",
                    "[app]": "<%=n.getAp_paterno()%>",
                    "[apm]": "<%=n.getAp_materno()%>",
                    "[dni]": "<%=n.getNu_documento()%>",
                    "[dir]": "<%=Direccion%>",
                    "[prov]": "<%=n.getNo_provincia()%>",
                    "[dist]": "<%=n.getNo_distrito()%>",
                    "[dep]": "<%=n.getNo_dep()%>",
                    "[desde]": "<%=fechades%>",
                    "[hasta]": "<%=fechahas%>",
                    "[puesto]": "<%=n.getNo_puesto()%>",
                    "[fe_suscripcion]": "<%=fechasus%>",
                    "[sueldo]": "<%=n.getCa_sueldo_total()%>",
                    "[horas]": "<%=n.getNu_horas_lab()%>",
                    "[cursos]": "",
                    "[moneda]": "<%=moneda%>",
                    "[funciones]": "<%=funciones%>"
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
                    procesar_texto();
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
                setTimeout(function() {
                    ExecuteCommand('print');
                }, 1000)
            });</script>

    </head>

    <body style="height:100%;width:100%;" align="center">
        <%String no_ar = request.getParameter("no_arc");%>
        <input type="hidden" id="no_arch" class="no_arc" value="<%=no_ar%>">
        <h1>EDITAR PLANTILLAS</h1>
    <CENTER>
        <button class="btn btn-lg btn-primary" onclick="ExecuteCommand('print');" style="height:50%;weith:20px;"><span class="btn-"><i class="fa fa-print"></i></span>IMPRIMIR</button>

        <form class="ckeditor_form" action="../../../formato_plantilla" method="post" align="center" width="100">
            <textarea cols="100" id="editor1" name="editor1" rows="10" >
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
                    , height: '800px', width: '100%'});</script>
            <script>
                $(document).ready(function() {
                    $(".procesar").click();
                }
                );</script>
            <div id="eButtons" >
                <input  type="hidden" name="opc" value="Actualizar"/>
                <input  type="hidden" name="id" value="" class="id_pl"/>
                <input type="submit" value="Actualizar Formato" id="actu" onclick="leer();">
            </div>
        </form>
        <%}
        } else {%>
        <table>
            <td><h1>Plantilla_no_registrada</h1></td>
        </table>
    </CENTER>
    <%}%>
</body>

</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }


%>