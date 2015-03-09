
<%@page import="pe.edu.upeu.application.model.Direccion"%>
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
<jsp:useBean id="Listar_Direccion_X" scope="application" class="java.util.ArrayList"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="descripcion" content>
        <meta name="author" content>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>Crear Formatos</title>

        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../../img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">

        <script src="../../../js/plugin/ckeditor/ckeditor.js"></script>
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


                $.post("../../../Direccion_Puesto", "opc=Listar_dir_dep&" + "id=" + valor.trim(), function(objJson) {
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
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var imprimir = objJson.imprimir;
                   // alert(imprimir);
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
                        //alert();
                        mostrar_plantilla($(".plantilla" + $(this).val()).val());
                        $(".id_pl").val($(".plantilla" + $(this).val()).val());
                        $(".id_pc").val($(".id_plantilla" + $(this).val()).val());
                        
                    });
                    $(".btn-Desac_pl").click(function() {

                        var idpp = $(".idplpu" + $(this).val()).val();
                        var opc = "Desactivar_pp";
                        Desac_Plantilla(idpp, opc);

                    });
                    $(".btn-Activ_pl").click(function() {

                        var idpp = $(".idplpu" + $(this).val()).val();
                        var opc = "activar_pp";
                        Activar_Plantilla(idpp, opc);
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
                    Listar_Plantilla();
                });
            }
            function Desac_Plantilla(id_pp, opc) {
                $.post("../../../formato_plantilla", "opc=" + opc + "&id_pp=" + id_pp, function() {
                    Listar_Plantilla();
                });
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
                var b = $(".dir");
                //lis_dep(b);
                var c = $(".dir_as");
                //list_dir(c);
               // Listar_Plantilla();
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
                    $("#di_sig").val(valor.trim());

                });
                $(".dep_as").change(function() {
                    var d = $(".area_as");
                    var valor = $(".dep_as").val();
                    var opc = "Listar_area2";
                    lis_sel(d, valor, opc);
                    $("#de_sig").val(valor.trim());
                });
                $(".area_as").change(function() {
                    var d = $(".seccion_as");
                    var valor = $(".area_as").val();
                    var opc = "Listar_sec2";
                    lis_sel(d, valor, opc);
                    $("#ar_sig").val(valor.trim());
                });
                $(".seccion_as").change(function() {
                    var d = $(".puesto_as");
                    var valor = $(".seccion_as").val();
                    var opc = "Listar_pu_id";
                    lis_sel(d, valor, opc);
                    $("#se_sig").val(valor.trim());
                });
                $(".puesto_as").change(function() {
                    $("#pu_sig").val($(".puesto_as").val().trim());

                })
            });

        </script>

    </head>

    <body class="body  desktop-detected pace-done" style="cursor: auto;">

        <div id="main" style="margin-left: 0px;" >
            <div id="content" class="widget-body">
                <section id="widget-grid" class="">

                   
                    <div class="row">
                        <article class=" col-sm-12 col-lg-12">
                            <div   class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="true" >
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                    <h2>Filtro de plantillas </h2>

                                </header>
                                <div>

                                    <!-- widget edit box -->
                                    <div  class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <div class="widget-body no-padding">
                                        <legend align="center">CARGAR PLANTILLAS</legend>
                                        <section class="col col-12" style="width:100%;align:cemter;" align="center">
                                            <label class="select">Dirección:
                                                <select class="dir form-control" id="dir" name="id_di" >
                                                    <option value="" >[Direccion]</option>
                                                    <%for (int i = 0; i < Listar_Direccion_X.size(); i++) {
                                                            Direccion d = new Direccion();
                                                            d = (Direccion) Listar_Direccion_X.get(i);
                                                    %>
                                                    <option value="<%=d.getId_direccion()%>"> <%=d.getNo_direccion()%></option>
                                                    <%}%>
                                                </select>   
                                            </label>
                                        </section>

                                        <section class="col col-12" style="width:100%;align:cemter;" align="center">
                                            <label>Departamento:
                                                <select class="dep form-control" id="dep" name="id_dep" >
                                                    <option value="">[TODO]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4"  style="width:100%;align:cemter;" align="center">
                                            <label>Area:
                                                <select class="area form-control" id="area" name="id_are" >
                                                    <option value="">[TODO]</option>
                                                </select>
                                            </label>
                                        </section>

                                        <section class="col col-4"  style="width:100%;align:cemter;" align="center">
                                            <label>Sección:
                                                <select class="seccion form-control" id="seccion" name="id_sec" >
                                                    <option value="">[TODO]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4"  style="width:100%;align:cemter;" align="center">
                                            <label>Puesto:
                                                <select class="puesto form-control" id="puesto" name="id_pu" >
                                                    <option value="">[TODO]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <br>
                                        <br>
                                        <legend>ASIGNAR PLANTILLAS</legend>
                                        <section class="col col-4"  style="width:100%;align:cemter;" align="center">
                                            <label>Dirección:
                                                <select class="dir_as form-control" id="dir_as"  >
                                                    <option value="">[SELECCIONE]</option>
                                                    <option value="">[SELECCIONE]</option>
                                                    <%for (int i = 0; i < Listar_Direccion_X.size(); i++) {
                                                            Direccion d = new Direccion();
                                                            d = (Direccion) Listar_Direccion_X.get(i);
                                                    %>
                                                    <option value="<%=d.getId_direccion()%>"> <%=d.getNo_direccion()%></option>
                                                    <%}%>
                                                </select>   
                                            </label>
                                        </section>
                                        <section class="col col-4"  style="width:100%;align:cemter;" align="center">
                                            <label>Departamento:
                                                <select class="dep_as form-control" id="dep_as" >
                                                    <option value="0">[TODO]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4" style="width:100%;align:cemter;" align="center" >
                                            <label>Area:
                                                <select class="area_as form-control" id="area_as" >
                                                    <option value="0">[TODO]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4"  style="width:100%;align:cemter;" align="center" >
                                            <label>Sección:
                                                <select class="seccion_as form-control col-5" id="seccion_as"  >
                                                    <option value="0">[TODO]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-4"  style="width:100%;align:cemter;" align="center">
                                            <label>Puesto:
                                                <select class="puesto_as form-control" id="puesto_as"  >
                                                    <option value="0">[TODO]</option>
                                                </select>
                                            </label>
                                        </section>
                                        <legend>Plantillas</legend>      
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th align="center" style="text-align:center;">Nro</th>
                                                    <th align="center" style="text-align:center;">Nombre Plantilla</th>
                                                    <th align="center" style="text-align:center;">Estado Plantilla Puesto</th>
                                                    <th colspan="2" style="text-align:center;">Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-plantilla">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </article>
                    </div>

                    <div class="row">

                        <article class=" col-sm-12 col-md-12 col-lg-9">
                            <div  class="jarviswidget jarviswidget-color-darken" id="wid-id-3" data-widget-colorbutton="true" >
                                <header><span class="widget-icon"><i class="fa fa-table"></i></span>
                                    <h2>Instrucciones </h2>
                                </header>
                                <div>
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <div class="widget-body no-padding">
                                        <div class="table-responsive">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th><i class="fa fa-building"></i>Nomenclatura</th>
                                                        <th><i class="fa fa-calendar"></i>Significado</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ><td>[nombre]</td><td>Nombre del trabajador</td></tr>
                                                    <tr><td>[app]</td><td>Apellido Paterno del trabajador</td></tr>
                                                    <tr><td>[apm]</td><td>Apellido Materno del trabajador</td></tr>
                                                    <tr><td>[dni]</td><td>Dni del trabajador</td></tr>
                                                    <tr><td>[dir]</td><td>direccion del trabajador</td></tr>
                                                    <tr><td>[prov]</td><td>Provincia actual</td></tr>
                                                    <tr><td>[dist]</td><td>Distrito en el que estan</td></tr>
                                                    <tr><td>[dep]</td><td>Departamento en donde se va a desenpeñar</td></tr>
                                                    <tr><td>[desde]</td><td>fecha de Inicio del contrato</td></tr>
                                                    <tr><td>[hasta]</td><td>Fecha de Fin del contrato</td></tr>
                                                    <tr><td>[puesto]</td><td>Puesto que va a desempeñar</td></tr>
                                                    <tr><td>[fe_suscripcion]</td><td>Fecha de suscripcion</td></tr>
                                                    <tr><td>[sueldo]</td><td>Sueldo del trabajador</td></tr>
                                                    <tr><td>[horas]</td><td>Horas de trabajo semanales</td></tr>
                                                    <tr><td>[cursos]</td><td>Cuesos que va enseñar (en el caso que sea docente)</td></tr>
                                                    <tr><td>[funciones]</td><td>Funciones que va a desempeñar en el puesto</td></tr>
                                                    <tr><td>[moneda]</td><td>Tipo de moneda de pago</td></tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="col-sm-12 col-md-12 col-lg-3">
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-2" data-widget-colorbutton="true"  >

                                <header>
                                    <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                    <h2>Editar Plantillas </h2>

                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding">

                                        <form class="ckeditor_form" action="../../../formato_plantilla" method="post" style="width:100%;" align="center">
                                            <h3></h3>
                                            <legend><h3>EDITAR PLANTILLAS</h3></legend>
                                            <h3><strong>NOMBRE PLANTILLA</strong></h3>

                                            <button type="submit" value="Asignar" onclick="leer();" name="opc">Asignar Plantilla</button>
                                            <button  onclick="procesar_texto();" type="button">Procesar </button>
                                            <input type="hidden" name="id_dep_asig" id="di_sig">
                                            <input type="hidden" name="id_are_asig" id="de_sig">
                                            <input type="hidden" name="id_sec_asig" id="ar_sig">
                                            <input type="hidden" name="id_di_asig" id="se_sig">
                                            <input type="hidden" name="id_pu_asig" id="pu_sig">
                                            <input type="text" class="nombre_pl form-control" name="no_pl" ><br><br>
                                            <textarea cols="100" id="editor1" name="editor1" >
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

                                                    }, height: '1024px'});
                                            </script>
                                            <div id="eButtons" >
                                                <input  type="hidden" name="id" value="" class="id_pl"/>
                                                <input  type="hidden" name="id_pc" value="" class="id_pc"/>
                                                <button type="submit" value="Actualizar" onclick="leer();" name="opc">Actualizar Plantilla</button>
                                                <button type="submit" value="Crear_Plantilla" name="opc" onclick="leer();">Crear Plantilla</button>
                                            </div>
                                            <div id="shortcut">
                                                <ul>
                                                    <li>
                                                        <a href="#inbox.html" class="jarvismetro-tile big-cubes bg-color-blue"> <span class="iconbox"> <i class="fa fa-envelope fa-4x"></i> <span>Mail <span class="label pull-right bg-color-darken">14</span></span> </span> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#calendar.html" class="jarvismetro-tile big-cubes bg-color-orangeDark"> <span class="iconbox"> <i class="fa fa-calendar fa-4x"></i> <span>Calendar</span> </span> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#gmap-xml.html" class="jarvismetro-tile big-cubes bg-color-purple"> <span class="iconbox"> <i class="fa fa-map-marker fa-4x"></i> <span>Maps</span> </span> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#invoice.html" class="jarvismetro-tile big-cubes bg-color-blueDark"> <span class="iconbox"> <i class="fa fa-book fa-4x"></i> <span>Invoice <span class="label pull-right bg-color-darken">99</span></span> </span> </a>
                                                    </li>
                                                    <li>
                                                        <a href="#gallery.html" class="jarvismetro-tile big-cubes bg-color-greenLight"> <span class="iconbox"> <i class="fa fa-picture-o fa-4x"></i> <span>Gallery </span> </span> </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="jarvismetro-tile big-cubes selected bg-color-pinkDark"> <span class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>My Profile </span> </span> </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </form>

                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->

                        </article>
                        <!-- END COL -->


                    </div>

                </section>

            </div>
        </div>
    </body>
    <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>

    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script>
                                                    if (!window.jQuery) {
                                                        document.write('<script src="../../../js/libs/jquery-2.0.2.min.js"><\/script>');
                                                    }
    </script>

    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script>
                                                    if (!window.jQuery.ui) {
                                                        document.write('<script src="../../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                                                    }
    </script>

    <!-- IMPORTANT: APP CONFIG -->
    <script src="../../../js/app.config.js"></script>

    <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
    <script src="../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

    <!-- BOOTSTRAP JS -->
    <script src="../../../js/bootstrap/bootstrap.min.js"></script>

    <!-- CUSTOM NOTIFICATION -->
    <script src="../../../js/notification/SmartNotification.min.js"></script>

    <!-- JARVIS WIDGETS -->
    <script src="../../../js/smartwidgets/jarvis.widget.min.js"></script>

    <!-- EASY PIE CHARTS -->
    <script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

    <!-- SPARKLINES -->
    <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

    <!-- JQUERY VALIDATE -->
    <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

    <!-- JQUERY MASKED INPUT -->
    <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

    <!-- JQUERY SELECT2 INPUT -->
    <script src="../../../js/plugin/select2/select2.min.js"></script>

    <!-- JQUERY UI + Bootstrap Slider -->
    <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

    <!-- browser msie issue fix -->
    <script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

    <!-- FastClick: For mobile devices -->
    <script src="../../../js/plugin/fastclick/fastclick.min.js"></script>

    <!--[if IE 8]>

    <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

    <![endif]-->

    <!-- Demo purpose only -->
    <script src="../../../HTML_version/js/demo.min.js"></script>

    <!-- MAIN APP JS FILE -->
    <script src="../../../HTML_version/js/app.min.js"></script>

    <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
    <!-- Voice command : plugin -->
    <script src="../../../HTML_version/js/speech/voicecommand.min.js"></script>

    <!-- PAGE RELATED PLUGIN(S) -->


    <script type="text/javascript">
                                                    // DO NOT REMOVE : GLOBAL FUNCTIONS!
                                                    $(document).ready(function() {
                                                        pageSetUp();
                                                    })

    </script>

    <!-- Your GOOGLE ANALYTICS CODE Below -->
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();

    </script>

</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>