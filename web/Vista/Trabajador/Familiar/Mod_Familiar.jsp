
<%@page import="pe.edu.upeu.application.model.Tipo_Documento"%>
<%@page import="pe.edu.upeu.application.dao.Tipo_DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceTipo_DocumentoDAO"%>
<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>

<%@page import="pe.edu.upeu.application.model.Padre_Madre_Conyugue"%>
<jsp:useBean id="ListaridTrabajador" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_tipo_doc" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title>Registrar Trabajador</title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
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
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

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

        <style>

        </style>

        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
        <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>


        <style>
            #btn-duplicar{
                margin: 1%;
                margin-left:  6%;
            }
            label{
                font-weight: bold;
            }
        </style>

        <script type="text/javascript">
            $(document).ready(
                    function() {
                        $("#as").focus();
                    }
            );
        </script>


    </head>
    <body class="">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->

        <!-- HEADER -->
        <header >

        </header>
        <!-- END HEADER -->

        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">



            <!-- MAIN CONTENT -->
            <div id="content">


                <!-- widget grid -->
                <section id="widget-grid" class="" >

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-sm-12 col-md-12 col-lg-6" style="width: 95%">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false"  >
                                <!-- widget options:
                                usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

                                data-widget-colorbutton="false"
                                data-widget-editbutton="false"
                                data-widget-togglebutton="false"
                                data-widget-deletebutton="false"
                                data-widget-fullscreenbutton="false"
                                data-widget-custombutton="false"
                                data-widget-collapsed="true"
                                data-widget-sortable="false"

                                -->
                                <header>
                                    <center>
                                        <span class="widget-icon"> <i class="fa fa-male"></i> </span>
                                        <h2>MODIFICAR CONYUGUE</h2>
                                    </center>

                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body">

                                        <div class="row">
                                            <form  action="../../../familiar">
                                                <%for (int i = 0; i < ListaridTrabajador.size(); i++) {
                                                        V_Ficha_Trab_Num_C t = new V_Ficha_Trab_Num_C();
                                                        t = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(i);
                                                %>



                                                <div id="bootstrap-wizard-1" class="col-sm-12">

                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="tab1">
                                                            <div class="row">
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">
                                                                        <label>¿ Trabaja en la UPEU ?</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="TRABAJA_UPEU_CONYUGUE"   required=""   class="select-conyugue form-control input-group-sm">
                                                                                <%if (t.getEs_trabaja_upeu_c() != null) {
                                                                                        if (t.getEs_trabaja_upeu_c().trim().equals("1")) {%>
                                                                                <option value="1" selected="">Si</option>
                                                                                <option value="0">No</option>
                                                                                <%} else if (t.getEs_trabaja_upeu_c().trim().equals("0")) {%>
                                                                                <option value="1">Si</option>
                                                                                <option value="0" selected="">No</option>
                                                                                <%}
                                                                                    }%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Apellidos  y Nombres :</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm" value="<%if (t.getAp_nombres_c() != null) {
                                                                                    out.print(t.getAp_nombres_c());
                                                                                } else {
                                                                                    out.print("");
                                                                                }%>" type="text" name="APELLIDO_NOMBRES_CONYUGUE" id="DOM_A_D4" required="" onblur="this.value = this.value.toUpperCase()" maxlength="50">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Fecha Nacimiento:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-child fa-lg fa-fw"></i><label class="edad"></label></span>
                                                                            <input type="date" name="FECHA_NAC_CONYUGUE" required="" value="<%=t.getFe_nac_c()%>"  class="form-control input-group-sm fecha" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">
                                                                        <label>Tipo Documento:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>

                                                                            <select name="TIPO_DOC_ID"  class="form-control input-group-sm" required="">
                                                                                <%

                                                                                    for (int k = 0; k < Listar_tipo_doc.size(); k++) {
                                                                                        Tipo_Documento td = new Tipo_Documento();
                                                                                        td = (Tipo_Documento) Listar_tipo_doc.get(k);
                                                                                        if (t.getId_tipo_doc_c() != null) {
                                                                                            if (td.getId_tipo_doc_ident().trim().equals(t.getId_tipo_doc_c().trim())) {%>
                                                                                <option value="<%=td.getId_tipo_doc_ident()%>" selected=""><%=td.getDe_tdoc_abreviada()%></option>
                                                                                <%} else {%>
                                                                                <option value="<%=td.getId_tipo_doc_ident()%>"><%=td.getDe_tdoc_abreviada()%></option>    
                                                                                <% }
                                                                                        }
                                                                                    }
                                                                                %>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <div class="form-group">
                                                                        <label>Nro de Documento:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <input class="form-control input-group-sm" value="<%if (t.getNu_doc_c() != null) {
                                                                                    out.print(t.getNu_doc_c());
                                                                                } else {
                                                                                    out.print("");
                                                                                }%>" type="text" name="NRO_DOC"  required="" maxlength="10">

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-4">

                                                                    <div class="form-group">
                                                                        <label>Inscripcion Vigente en Essalud:</label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="fa fa-map-marker fa-lg fa-fw"></i></span>
                                                                            <select name="INSCRIPCION_VIG_ESSALUD"  class="form-control input-group-sm" required="">
                                                                                <%if (t.getLi_inscripcion_vig_essalud_c() != null) {
                                                                                        if (t.getLi_inscripcion_vig_essalud_c().trim().equals("1")) {%>
                                                                                <option value="1" selected="">Si</option>
                                                                                <option value="0">No</option>
                                                                                <%} else if (t.getLi_inscripcion_vig_essalud_c().trim().equals("0")) {%>
                                                                                <option value="1">Si</option>
                                                                                <option value="0" selected="">No</option>
                                                                                <%}
                                                                                    }%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>

                                                <%String idtr = request.getParameter("idtr");%>
                                                <input type="hidden" name="idtr" value="<%=idtr%>"/>
                                                <input type="hidden" name="opc" value="MODIFICAR_PMC">
                                                <footer>
                                                    <center>
                                                        <button type="submit" class="btn btn-labeled btn-info" name="opc">
                                                            <span class="btn-label">
                                                                <i class="glyphicon glyphicon-pencil"></i>
                                                            </span>Modificar
                                                        </button>
                                                    </center>
                                                </footer>
                                                <%
                                                    }%>
                                            </form>
                                        </div>

                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->

                        </article>
                        <!-- WIDGET END -->


                    </div>

                    <!-- end row -->

                </section>
                <!-- end widget grid -->


            </div>
            <!-- END MAIN CONTENT -->

        </div>
    <center>                                                                     
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Encontrar Conyugue</h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div id="contenido">
                                <div >

                                    <form class="form-inline" id="frm_filtro" method="post" name="formulario"  >

                                        <div class="row">
                                            <div class="form-group" >
                                                <label class="control-label" >Nombres</label><br>
                                                <input type="text"  class="form-control"  name="nom" maxlength="80" >
                                            </div>
                                            <div class="form-group" >
                                                <label class="control-label" >Apellido Paterno</label><br>
                                                <input type="text"  class="form-control"  name="ap_pa" maxlength="80">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="control-label" >Apellido Materno</label><br>
                                                <input type="text"  class="form-control"  name="ap_ma" maxlength="80" >
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label" >DNI:</label><br>
                                                <input type="text"  class="form-control"  onKeyPress="return checkIt(event)"   name="dni" maxlength="8">
                                            </div>
                                        </div>

                                        <div class="row">

                                            <div class="form-group">                            
                                                <button type="button" class="btn btn-primary" id="btnfiltrar" >Buscar</button>
                                            </div>
                                            <div class="form-group">  
                                                <a href="javascript:;"  id="btncancel" class="btn btn-primary" >Cancelar</a>
                                            </div>

                                        </div>

                                    </form>

                                </div> 

                                <hr/>

                                <table  id="data"  >
                                    <thead class="tab_cabe">
                                        <tr>
                                            <td><span title="NOMBRE_AP">Nombres y Apellidos</span></td>
                                            <td><span  >DNI</span></td>
                                            <td></td>

                                        </tr>
                                    </thead>

                                    <tbody class="tbodys">
                                    </tbody>
                                </table>

                            </div>
                        </div>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-salir-busc"  data-dismiss="modal">Salir</button>

                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <button  data-toggle="modal" data-target="#myModal" id="btn-mostrar" hidden="">
            Launch demo modal
        </button>
    </center>
    <!-- END MAIN PANEL -->


    <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>

    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script>
                                                    if (!window.jQuery) {
                                                        document.write('<script src="../../js/libs/jquery-2.0.2.min.js"><\/script>');
                                                    }
    </script>

    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script>
                                                    if (!window.jQuery.ui) {
                                                        document.write('<script src="../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
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
    <script src="../../../js/demo.min.js"></script>

    <!-- MAIN APP JS FILE -->
    <script src="../../../js/app.min.js"></script>

    <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
    <!-- Voice command : plugin -->
    <script src="../../../js/speech/voicecommand.min.js"></script>

    <!-- PAGE RELATED PLUGIN(S) -->
    <script src="../../../js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="../../../js/plugin/fuelux/wizard/wizard.min.js"></script>
    <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>

    <script>
                                                    $(document).ready(function() {
                                                        var b = $(".tbodys");

                                                        $("#btnfiltrar").click(
                                                                function() {


                                                                    $.post("../../../ajax/Ajax_Conyugue/Ajax_Busc_Conyug.jsp", $("#frm_filtro").serialize(), function(objJson) {
                                                                        b.empty();
                                                                        var list = objJson.lista;
                                                                        for (var i = 0; i < list.length; i++) {
                                                                            b.append("<tr>");
                                                                            b.append("<td>" + list[i].NOM + " " + list[i].AP_PA + " " + list[i].AP_MA + "</td>");
                                                                            b.append("<td>" + list[i].NU_DOC + "</td>");
                                                                            b.append("<input type ='hidden' class='trab_" + i + "' value='" + list[i].ID_TRAB + "' />");
                                                                            b.append("<input type ='hidden' class='nac_" + i + "' value='" + list[i].NAC + "' />");
                                                                            b.append("<input type ='hidden' class='dni_" + i + "' value='" + list[i].NU_DOC + "' />");
                                                                            b.append("<input type ='hidden' class='tipo_" + i + "' value='" + list[i].TIPO + "' />");
                                                                            b.append("<input type ='hidden' class='nom_ape_" + i + "' value='" + list[i].NOM + " " + list[i].AP_PA + " " + list[i].AP_MA + "' />");
                                                                            if (typeof (list[i].ID_C) === "undefined") {

                                                                                b.append('<td><button type="button" class="btn btn-primary btn-add-conyugue" value="' + i + '" data-dismiss="modal">Agregar</button></td>');
                                                                            } else {
                                                                                b.append('<td>Tiene conyugue</td>');
                                                                            }
                                                                            b.append("</tr>");

                                                                        }

                                                                        $(".btn-add-conyugue").click(function() {
                                                                            var v = $(this).val();
                                                                            $(".nom_c").val($(".nom_ape_" + v).val());
                                                                            $(".f_nac").val($(".nac_" + v).val());
                                                                            $(".ti_documento").val($(".tipo_" + v).val());
                                                                            $(".num_doc").val($(".dni_" + v).val());
                                                                            $(".cony").val($(".trab_" + v).val());




                                                                            //$(".select-conyugue").val("1");
                                                                        });
                                                                    }
                                                                    );



                                                                });
                                                        $(".btn-salir-busc, .close").click(function() {

                                                            $(".select-conyugue").val("0");
                                                        });


                                                        $(".select-conyugue").change(function() {
                                                            if ($(this).val() == "1") {
                                                                $("#btn-mostrar").click();
                                                            }
                                                            if ($(this).val() == "0") {
                                                                $(".nom_c").val("");
                                                                $(".f_nac").val("");
                                                                $(".ti_documento").val("");
                                                                $(".num_doc").val("");
                                                                $(".cony").val("");

                                                            }

                                                        }
                                                        );
                                                        $("#btncancel").click(
                                                                function() {
                                                                    document.formulario.reset();
                                                                    b.empty();
                                                                    html = '<tr><td colspan="8" align="center">Haga la busqueda por algunos de los filtros...</td></tr>'
                                                                    $(".tbodys").html(html);
                                                                }
                                                        );

                                                    }
                                                    );


    </script>

    <script type="text/javascript">

        // DO NOT REMOVE : GLOBAL FUNCTIONS!

        $(document).ready(function() {

            pageSetUp();




            var $validator = $("#wizard-1").validate({
                rules: {
                    email: {
                        required: true,
                        email: "Your email address must be in the format of name@domain.com"
                    },
                    FECHA_NAC: {
                        required: true,
                        val_fecha: true
                    }
                    ,
                    FECHA_NAC_H: {
                        val_fecha: true
                    }
                    ,
                    fname: {
                        required: true
                    },
                    lname: {
                        required: true
                    },
                    country: {
                        required: true
                    },
                    city: {
                        required: true
                    },
                    postal: {
                        required: true,
                        minlength: 4
                    },
                    wphone: {
                        required: true,
                        minlength: 10
                    },
                    hphone: {
                        required: true,
                        minlength: 10
                    }
                },
                messages: {
                    fname: "Please specify your First name",
                    lname: "Please specify your Last name",
                    email: {
                        required: "We need your email address to contact you",
                        email: "Your email address must be in the format of name@domain.com"
                    }
                },
                highlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                },
                unhighlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                },
                errorElement: 'span',
                errorClass: 'help-block',
                errorPlacement: function(error, element) {
                    if (element.parent('.input-group').length) {
                        error.insertAfter(element.parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
            jQuery.validator.addMethod("val_fecha", function(value, element) {
                var d = value.split("-");
                return this.optional(element) || String(parseInt(d[0])).length == 4;
            }, "¡Fecha ingresada invalida!");

            $('#bootstrap-wizard-1').bootstrapWizard({
                'tabClass': 'form-wizard',
                'onNext': function(tab, navigation, index) {
                    var $valid = $("#wizard-1").valid();
                    if (!$valid) {
                        $validator.focusInvalid();
                        return false;
                    } else {
                        $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).addClass(
                                'complete');
                        $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).find('.step')
                                .html('<i class="fa fa-check"></i>');
                    }
                }
            });


            // fuelux wizard
            var wizard = $('.wizard').wizard();

            wizard.on('finished', function(e, data) {
                //$("#fuelux-wizard").submit();
                //console.log("submitted!");
                $.smallBox({
                    title: "Congratulations! Your form was submitted",
                    content: "<i class='fa fa-clock-o'></i> <i>1 seconds ago...</i>",
                    color: "#5F895F",
                    iconSmall: "fa fa-check bounce animated",
                    timeout: 4000
                });

            });


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

    <!--Solo numeros -->
    <script type="text/javascript">
        $("#docs, .doc_c").numeric();
        $("#doc, .doc_c").numeric(false, function() {
            alert("Solo Numeros Enteros");
            this.value = "";
            this.focus();
        });
        $(".positive").numeric({negative: false}, function() {
            alert("No negative values");
            this.value = "";
            this.focus();
        });
        $(".positive-integer").numeric({decimal: false, negative: false}, function() {
            alert("Positive integers only");
            this.value = "";
            this.focus();
        });

        $("#remove").click(
                function(e)
                {
                    e.preventDefault();
                    $(".numeric,.integer,.positive").removeNumeric();
                }
        );
    </script>

</body>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
