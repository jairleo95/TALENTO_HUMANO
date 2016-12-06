
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
<jsp:useBean id="lista" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="texto" scope="session" class="java.util.ArrayList"/>
<html>
    <head>
        <meta charset="utf-8">
        <title>Crear Formatos</title>
        <script src="../../../js/plugin/ckeditor/ckeditor.js"></script>
        <link href="../../../js/plugin/ckeditor/samples/sample.css" rel="stylesheet">
        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
    <input type="hidden" id="cant_con" class="cant_con" value="<%=lista.size()%>">
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
    <%
        for (int i = 0; i < texto.size(); i++) {
            //String texto_pl = texto.get(i).toString();
%>
    <textarea type="hidden" class="texto<%=i%>" id="texto<%=i%>" style="display:none;" value="<%=texto.get(i).toString()%>" ></textarea>
    <%}%>
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
            var value = document.getElementById('texto2').value;

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
        function leer() {
            var ap = $(".ckeditor_form");
            var editor = CKEDITOR.instances.editor1.getData();
            ap.append("<input type='text' value='" + editor + "' name='valor'>");
        }
        function procesar_texto(valor, asa) {
            // var editor = CKEDITOR.instances.editor1;

            $.post("../../../Imprimir", "opc=Listar_contrato&" + "id=" + valor, function (objJson) {
                var Lista = objJson.lista;
                var texto = asa;
                //alert(Lista.length)
                for (var i = 0; i < Lista.length; i++) {
                    var nombre = "";
                    var app = "";
                    var apm = "";
                    var nu_doc = "";
                    if (Lista[i].no_tr != null) {
                        nombre = Lista[i].no_tr;
                    } else {
                        nombre = "no ingresado";
                    }
                    if (Lista[i].ap_pa != null) {
                        app = Lista[i].ap_pa;
                    } else {
                        app = "no ingresado";
                    }
                    if (Lista[i].ap_ma != null) {
                        apm = Lista[i].ap_ma;
                    } else {
                        apm = "no registrador";
                    }
                    if (Lista[i].nu_do != null) {
                        nu_doc = Lista[i].nu_do;
                    } else {
                        nu_doc = "no registrado";
                    }
                    var direccion = "";
                    var vias = "AVENIDA/JIRON/CALLE/PASAJE/ALAMEDA/MALECON/OVALO/PARQUE/PLAZA/CARRETERA/TROCHA/CAMINO RURAL/BAJADA/GALERIA/PROLONGACION/PASEO/PLAZUELA/PORTAL/CAMINO AFIRMADO/TROCHA CARROZABLE/MANZANA/OTROS";
                    var zona = "URB. URBANIZACION/P.J. PUEBLO JOVEN/U.V. UNIDAD VECINAL/C.H. CONJUNTO HABITACIONAL/A.H. ASENTAMIENTO HUMANO/COO. COOPERATIVA/RES. RESIDENCIAL/Z.I. ZONA INDUSTRIAL/GRU. GRUPO/CAS. CASERIO/FND. FUNDO/OTROS";
                    var arrayz;
                    var array;
                    if (Lista[i].li_d1 != null) {
                        array = vias.split("/");
                        for (var cont = 0; cont < array.length; cont++) {
                            if (Lista[i].li_d1.trim() == (cont + 1) + "") {
                                direccion += array[i];
                            }
                        }
                    } else {
                        direccion += '-';
                    }
                    if (Lista[i].li_d3 != null) {
                        if (Lista[i].li_d3.trim() == ("1")) {
                            if (Lista[i].di_d2 != null) {
                                direccion += " " + Lista[i].di_d2 + " Numero";
                            } else {
                                direccion += '- Numero';
                            }
                        }
                        if (Lista[i].li_d3.trim() == ("2")) {
                            if (Lista[i].di_d2 != null) {
                                direccion += ' ' + Lista[i].di_d2 + " Lote";
                            } else {
                                direccion += "- Lote";
                            }
                        }
                        if (Lista[i].li_d3.trim() == ("3")) {
                            if (Lista[i].di_d2 != null) {
                                direccion += ' ' + Lista[i].di_d2 + " S/N";
                            } else {
                                direccion += "-  S/N";
                            }
                        }
                    } else {
                        direccion += "-";
                    }
                    if (Lista[i].li_d5 != null) {
                        arrayz = zona.split("/");
                        for (var cont = 0; cont < arrayz.length; cont++) {
                            if (Lista[i].li_d5.trim() == (cont + 1) + "") {
                                if (Lista[i].di_d4 != null) {
                                    direccion += Lista[i].di_d4 + " " + arrayz[cont];
                                } else {
                                    direccion += "-" + arrayz[cont];
                                }
                            }
                        }
                    } else {
                        direccion += "-";
                    }
                    if (Lista[i].di_d6 != null) {
                        direccion += Lista[i].di_d6;
                    } else {
                        direccion += "-";
                    }
                    var pro = "";
                    if (Lista[i].no_pr != null) {
                        pro = Lista[i].no_pr;
                    } else {
                        pro = "-";
                    }
                    var no_di = "";
                    if (Lista[i].no_di != null) {
                        no_di = Lista[i].no_di;
                    } else {
                        no_di = "-";
                    }
                    var no_dp = "";
                    if (Lista[i].no_dp != null) {
                        no_dp = Lista[i].no_dp;
                    } else {
                        no_dp = "-";
                    }
                    var fe_de = "";
                    if (Lista[i].fe_de != null) {
                        var fe_Ar = Lista[i].fe_de.split("/");
                        fe_de = fe_Ar[0] + " de " + fe_Ar[1] + " del " + fe_Ar[2];
                    } else {
                        fe_de = "-";
                    }
                    var fe_ha = "";
                    if (Lista[i].fe_ha != null) {
                        var fe_Ar = Lista[i].fe_ha.split("/");
                        fe_ha = fe_Ar[0] + " de " + fe_Ar[1] + " del " + fe_Ar[2];
                    } else {
                        fe_ha = "-";
                    }
                    var no_pu = "";
                    if (Lista[i].no_pu != null) {
                        no_pu = Lista[i].no_pu;
                    } else {
                        no_pu = "-";
                    }
                    var fe_su = "";
                    if (Lista[i].fe_su != null) {
                        fe_su = Lista[i].fe_su;
                        var fe_Ar = Lista[i].fe_su.split("/");
                        fe_su = fe_Ar[0] + " de " + fe_Ar[1] + " del " + fe_Ar[2];
                    } else {
                        fe_su = "-";
                    }
                    var ca_st = "";
                    if (Lista[i].ca_st != null) {
                        ca_st = Lista[i].ca_st;
                    } else {
                        ca_st = "-";
                    }
                    var ca_sueldo_basico = "";
                    if (Lista[i].ca_sueldo_basico != null) {
                        ca_sueldo_basico = Lista[i].ca_sueldo_basico;
                    } else {
                        ca_sueldo_basico = "-";
                    }
                    var nu_ho = "";
                    if (Lista[i].nu_ho != null) {
                        nu_ho = Lista[i].nu_ho;
                    } else {
                        nu_ho = "-";
                    }
                    var co_tm = "";
                    if (Lista[i].co_tm != null) {
                        if (Lista[i].co_tm.trim() == "01") {
                            co_tm = "nuevos soles";
                        }
                        if (Lista[i].co_tm.trim() == "02") {
                            co_tm = "dolares";
                        }
                        if (Lista[i].co_tm.trim() == "03") {
                            co_tm = "euros";
                        }
                    } else {
                        co_tm = "-";
                    }

                    var menu = {
                        "[nombre]": nombre,
                        "[app]": app,
                        "[apm]": apm,
                        "[dni]": nu_doc,
                        "[dir]": direccion,
                        "[prov]": pro,
                        "[dist]": no_di,
                        "[dep]": no_dp,
                        "[desde]": fe_de,
                        "[hasta]": fe_ha,
                        "[puesto]": no_pu,
                        "[fe_suscripcion]": fe_su,
                        "[sueldo]": ca_sueldo_basico,
                        "[sueldo_total]": ca_st,
                        "[horas]": nu_ho,
                        "[cursos]": "",
                        "[moneda]": co_tm,
                        "[funciones]": ""
                    };
                    var string_texto = "";
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
                    //alert(texto);
                }
                var txt = $("#texto2").val();
                txt += texto + '<div style="page-break-after: always;"><span style="display:none">&nbsp;</span></div>';
                $("#texto2").val(txt);
            });
        }
        function recorido() {
            var cant_con = $(".cant_con").val();

            for (var f = 0; f < cant_con + 1; f++) {
                procesar_texto($(".contrato" + f).val(), $(".texto" + f).val());
            }

        }
        function resetear() {
            var editor = CKEDITOR.instances.editor1;
            //var value = document.getElementById('htmlArea').value;
            // Set editor contents (replace current contents).
            // http://docs.ckeditor.com/#!/api/CKEDITOR.editor-method-setData
            editor.setData("");
            $(".texto2").val("");
            setTimeout(function () {
                InsertHTML();
                ExecuteCommand("print");
            }, 10000);
            recorido();
            //ResetDirty();
            /*setTimeout(function() {
             InsertHTML();
             ExecuteCommand("print");
             }, 10000);
             recorido();*/
            // InsertHTML();
            //ExecuteCommand("print");
        }
        $(document).ready(function () {

            $("#actu").hide();
            $("#texto").hide();
            $("#texto2").hide();
            setTimeout(function () {
                InsertHTML();
                ExecuteCommand("print");
            }, 3000);
            recorido();



        }
        );</script>

</head>

<body style="height: 1080px">
    <h3>CARGAR PLANTILLAS</h3>
    <%%>
    <input type="hidden" id="no_arch" class="no_arc" value="<%%>">

    <button type="button" id="btn2" class="btn2  btn btn-success" onclick="InsertHTML()" style="display: none">CARGAR</button>
    <button type="button" id="btn2" class="btn2" onclick="resetear()" >Resetear</button>
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
                    pluginsLoaded: function (evt) {
                        var doc = CKEDITOR.document, ed = evt.editor;
                        if (!ed.getCommand('bold'))
                            doc.getById('exec-bold').hide();
                        if (!ed.getCommand('link'))
                            doc.getById('exec-link').hide();
                    }
                }
                , height: '800px'});</script>
        <script type="text/javascript">
            $(document).ready(function () {


            }
            );</script>
        <div id="eButtons" >
            <textarea id="texto" class="texto"></textarea>
            <textarea id="texto2" class="texto2"></textarea>
            <input  type="hidden" name="opc" value="Actualizar"/>
            <input  type="hidden" name="id" value="" class="id_pl"/>
            <input type="submit" value="Actualizar Formato" id="actu" onclick="leer();">
        </div>
    </form>
</body>

</html>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>