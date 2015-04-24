<%-- 
    Document   : detalleHistorial
    Created on : 20/04/2015, 10:03:16 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial de Modificaciones</title>

        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

        <!-- #FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- #GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
    </head>

    <body>
        <div id="main" role="main" style="margin: 0px;">
            <div id="content" >
                <section id="widget-grid" class="">
                    <div class="row">
                        <div class="col-xs-12">

                            <div class="well">
                                <form class="smart-form form_f">

                                    <h1 class="text-center ">Historial de Modificaciones <small>/ Trabajadores</small></h1><br>
                                    <div class="row">
                                        <div class="col col-xs-9">
                                            <section class="col col-xs-12">
                                                <label class="label">Ultimas Modificaciones</label>
                                                <label class="select">
                                                    <select class="s_fecha">
                                                        <option>[Seleccione]</option>
                                                    </select>
                                                    <i></i></label>
                                            </section>
                                        </div>
                                        <div class="col col-xs-3">
                                            <section class="col col-sm-12">
                                                <center>
                                                    <a class="btn btn-primary btn-circle btn-xl btnEnviar"><i class="glyphicon glyphicon-search"></i></a>
                                                </center>
                                            </section>
                                        </div>


                                    </div>
                                </form>


                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col col-md-6">
                            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="jarviswidget jarviswidget-color-blue" id="wid-id-1" data-widget-editbutton="false">
                                    <header>
                                        <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                        <h2 class="ti_fecha">Seleccionar Fecha</h2>
                                    </header>
                                    <div>
                                        <div class="jarviswidget-editbox">
                                        </div>
                                        <div class="widget-body no-padding">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <td>Nro</td>
                                                            <td>Columna</td>
                                                            <td>Detalle</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="tbodys_hist">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                        <div class="col col-md-6">
                            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="jarviswidget jarviswidget-color-blue" id="wid-id-2" data-widget-editbutton="false">
                                    <header>
                                        <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                        <h2>Datos Actuales</h2>
                                    </header>
                                    <div>
                                        <div class="jarviswidget-editbox">
                                        </div>
                                        <div class="widget-body no-padding">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <td>Nro</td>
                                                            <td>Columna</td>
                                                            <td>Detalle</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="tbodys">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>
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
        <script src="../../../js/app.config.js"></script>
        <script src="../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 
        <script src="../../../js/bootstrap/bootstrap.min.js"></script>
        <script src="../../../js/notification/SmartNotification.min.js"></script>
        <script src="../../../js/smartwidgets/jarvis.widget.min.js"></script>
        <script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
        <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>
        <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>
        <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>
        <script src="../../../js/plugin/select2/select2.min.js"></script>
        <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
        <script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>
        <script src="../../../js/plugin/fastclick/fastclick.min.js"></script>
        <!--[if IE 8]>
        
        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
        
        <![endif]-->

        <!-- Demo purpose only -->
        <script src="../../../js/demo.min.js"></script>
        <script src="../../../js/app.min.js"></script>
        <script src="../../../js/speech/voicecommand.min.js"></script>
        <script src="../../../js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="../../../js/plugin/fuelux/wizard/wizard.min.js"></script>
        <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>
        <script src="../../../js/plugin/jquery-nestable/jquery.nestable.min.js"></script>
        <script src="../../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var idtrab = '<%= request.getParameter("idtr")%>';
                cargar_fechas();
                function cargar_fechas() {
                    var s = $('.s_fecha');
                    s.empty();
                    s.append("<option>[Espere..]</option>");
                    $.post("../../../RHistorial?", "opc=list_mod_tra&idtr=" + idtrab, function (objJson) {
                        var lista = objJson.lista;
                        if (lista.length < 1) {
                            s.empty();
                            s.append("<option>[No hay Datos]</option>");
                        } else {
                            s.empty();
                            s.append("<option>[Seleccione]</option>");
                            for (var i = 0; i < lista.length; i++) {
                                if (lista[i].fe_mod != undefined) {
                                    s.append("<option >" + lista[i].fe_mod + "</option>");
                                }

                            }
                        }
                    });
                }
                $('.s_fecha').change(function () {
                    $('.ti_fecha').empty();
                    $('.ti_fecha').text("Datos al " + $(this).val());
                    cargar_hist($(this).val());
                });
                function cargar_hist(fe_hist) {
                    $.post("../../../RHistorial?", "opc=list_hist_fecha&fe_modif=" + fe_hist + "&idtra=" + idtrab, function (objJson) {
                        var lista = objJson.lista;
                        alert(lista.length);
                        if (lista.length < 1) {
                        } else {
                            var text="";
                            for(var i=0;i<lista.length;i++){
                                text += "<tr>";
                            text += "<td>" + (i+1) + "</td>";
                            text += "<td>"+lista[i].col+"</td>";
                            if(lista[i].det!=undefined){
                               text += "<td>" + lista[i].det + "</td>"; 
                            }else{
                                text += "<td>Sin Datos</td>"; 
                            }
                            
                            text += "</tr>";
                            }                                                        
                            $('.tbodys_hist').empty();
                            $('.tbodys_hist').append(text);
                        }
                    });
                }
            });
        </script>
        <script type="text/javascript">

            // DO NOT REMOVE : GLOBAL FUNCTIONS!

            $(document).ready(function () {

                pageSetUp();

                // PAGE RELATED SCRIPTS

                // switch style change
                $('input[name="checkbox-style"]').change(function () {
                    //alert($(this).val())
                    $this = $(this);

                    if ($this.attr('value') === "switch-1") {
                        $("#switch-1").show();
                        $("#switch-2").hide();
                    } else if ($this.attr('value') === "switch-2") {
                        $("#switch-1").hide();
                        $("#switch-2").show();
                    }

                });

                // tab - pills toggle
                $('#show-tabs').click(function () {
                    $this = $(this);
                    if ($this.prop('checked')) {
                        $("#widget-tab-1").removeClass("nav-pills").addClass("nav-tabs");
                    } else {
                        $("#widget-tab-1").removeClass("nav-tabs").addClass("nav-pills");
                    }

                });

            });

        </script>
    </body>
</html>
