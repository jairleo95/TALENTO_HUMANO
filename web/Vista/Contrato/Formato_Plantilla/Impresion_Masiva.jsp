
<%@page import="pe.edu.upeu.application.dao.PlantillaContractualDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfacePlantillaContractualDAO"%>
<%@page import="pe.edu.upeu.application.dao.FuncionDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceFuncionDAO"%>
<%@page import="pe.edu.upeu.application.dao.ContratoDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceContratoDAO"%>
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
<jsp:useBean id="lista" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_contra_x_idcto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_x_fun_x_idpu" scope="application" class="java.util.ArrayList"/>
<html>
    <head>
        <meta charset="utf-8">
        <title>Crear Formatos</title>
        <script src="../../../HTML_version/js/plugin/ckeditor/ckeditor.js"></script>
        <link href="../../../HTML_version/js/plugin/ckeditor/samples/sample.css" rel="stylesheet">
        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
    <input type="hidden" id="cant_con" value="<%=lista.size()%>">
    <%
    for (int i = 0; i < lista.size(); i++) {
            String cadena = lista.get(i).toString();
            String[] cadena2 = cadena.split("/");
            String id_contrato = cadena2[0];
            String id_pl = cadena2[1].toString();
    %>
    <input type="hidden" class="contrato<%=i%>" id="contrato<%=i%>" value="<%=id_contrato%>">
    <input type="hidden" class="plantilla<%=i%>" id="plantilla<%=i%>" value="<%=id_pl%>">
    <%}%>
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


        function leer() {
            var ap = $(".ckeditor_form");
            var editor = CKEDITOR.instances.editor1.getData();
            ap.append("<input type='text' value='" + editor + "' name='valor'>");
        }
        function procesar_texto(valor) {
            var editor = CKEDITOR.instances.editor1;
            var string_texto = "";
            var texto = editor.getData();
            var arr_text;
            /* $.post("../../../Imprimir", "opc=Listar_contrato&" + "id=" + valor + , function(objJson) {
             var Lista = objJson.lista;
             for (var i = 0; i < Lista.length; i++) {*/
            var menu = {
                "[nombre]": "" + Lista[i].no_tr,
                "[app]": "" + Lista[i].ap_pa,
                "[apm]": "" + Lista[i].ap_ma,
                "[dni]": "" + Lista[i].nu_do,
                "[dir]": "" + Lista[i].ap_pa,
                "[prov]": "" + Lista[i].no_pr,
                "[dist]": "" + Lista[i].no_di,
                "[dep]": "" + Lista[i].no_dp,
                "[desde]": "" + Lista[i].fe_de,
                "[hasta]": "" + Lista[i].fe_ha,
                "[puesto]": "" + Lista[i].no_pu,
                "[fe_suscripcion]": "" + Lista[i].fe_su,
                "[sueldo]": "" + Lista[i].ca_st,
                "[horas]": "" + Lista[i].nu_ho,
                "[cursos]": "",
                "[moneda]": "" + Lista[i].co_tm,
                "[funciones]": ""
            };
            for (var key in menu) {
                var val = menu[key];
                arr_text = texto.split(key);
                for (var g = 0; g < arr_text.length; g++) {
                    string_texto = string_texto + arr_text[g] + (((g + 1) == arr_text.length) ? "" : " " + val + " ");
                }
                texto = string_texto;
                string_texto = "";
            }
            //alert(texto);
            editor.setData(texto);
            /*}
             });*/
        }
        function mostrar_plantilla(plan,valor) {
            var editor = CKEDITOR.instances.editor1;

            $.post("../../../formato_plantilla", "opc=Listar2&id=" + plan.trim(), function(objJson) {

                var imprimir = objJson.imprimir;
                var imprimir2 = "";
                var editor2 = editor.getData();
                imprimir2=editor2+imprimir+'<div style="page-break-after: always;"><span style="display:none">&nbsp;</span></div>';
                //alert(imprimir);
                editor.setData(imprimir2);
                //$("#almacen").val($("#almacen").val()+imprimir)
                //$("#almacen").val($("#almacen").val()+ '<div style="page-break-after: always;"><span style="display:none">&nbsp;</span></div><p>&nbsp;</p>')
                //alert($("#almacen").val());
            });
        }
        function mostrars(valor, valor2) {
            //var no_ar=$("#no_arch");
            //alert($(".no_arc").val());
            mostrar_plantilla(valor);
            // $(".id_pl").val($(".plantilla" + $(this).val()).val());
        }
        function mostrars2(valor) {

            //var no_ar=$("#no_arch");
            //alert($(".no_arc").val());
            //alert();
            // alert()

            // $(".id_pl").val($(".plantilla" + $(this).val()).val());
        }
        function recorido() {
            var editor = CKEDITOR.instances.editor1;
            editor.resetDirty();
           // var impresion = $("#almacen").val();
            var cant_con = $("#cant_con").val();
            //alert(cant_con);
            for (var f = 0; f < cant_con+1; f++) {
                mostrar_plantilla($(".plantilla" + f+"").val(), $(".contrato" + f+"").val());
            }

        }

        $(document).ready(function() {
            $("#actu").hide();
           recorido();
            ///var impresion;
            // recorido();
            //alert($("#plantilla0").val()+ $("#contrato0").val());
            // mostrars($("#plantilla0").val(), $("#contrato0").val());
        });</script>

</head>

<body style="height: 1080px">
    <h3>CARGAR PLANTILLAS</h3>
    <%%>
    <input type="hidden" id="no_arch" class="no_arc" value="<%%>">
    
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
                , height: '800px'});</script>
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
</body>

</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>