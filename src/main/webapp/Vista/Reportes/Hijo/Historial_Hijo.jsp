


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial Hijos</title>
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
                        <div class="well">
                            <form class="smart-form form_f">
                                <h1 class="text-center"><strong>Datos de Hijos </strong> <small> / Historial de Modificaciones </small></h1><br>
                                <h1 class="text-left font-md semi-bold">Filtros:</h1><br>
                                <div class="row">
                                    <div class="col col-lg-9">
                                        <section class="col col-sm-4">
                                            <label><strong>Desde:</strong></label>
                                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
                                                <input type="text"  placeholder="Seleccionar Fecha" class="datepicker" id="dtp1" data-dateformat='dd/mm/yy' name="fe_inicio" required="">
                                            </label>
                                        </section>
                                        <section class="col col-sm-4">
                                            <label><strong>Hasta:</strong></label>
                                            <label class="input"> <i class="icon-append fa fa-calendar"></i>
                                                <input type="text"  placeholder="Seleccionar Fecha" class="datepicker" id="dtp2" data-dateformat='dd/mm/yy' name="fe_fin" required="">
                                            </label>
                                        </section>
                                        <section class="col col-sm-4">
                                            <label><strong>Tipo:</strong></label>
                                            <label class="select"><i class="icon-append fa fa-calendar"></i>
                                                <select name="tipo" required="" class="tipo">
                                                    <option value="1" >Todos</option>
                                                    <option value="2">Registrados</option>
                                                    <option value="3">Modificados</option>
                                                </select>
                                            </label>
                                        </section>
                                    </div>
                                    <div class="col col-lg-3">
                                        <center>
                                            <section class="col col-sm-12">
                                                <a class="btn btn-primary btn-circle btn-xl btnEnviar"><i class="glyphicon glyphicon-search"></i></a>
                                                <a class="btn btn-danger btn-circle btn-xl btnCancelar"><i class="glyphicon glyphicon-remove"></i></a>
                                            </section>
                                        </center>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <button class="btn_procesar btn btn-primary btn-labeled"  style="display: none;" type="button"><span class="btn-label"><i class="fa fa-check"></i></span>Procesar</button>
                    <div class="row">
                        <div class="well">
                            <div class="table-responsive cont_t">
                                <table class="tabla_t table table-bordered table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center semi-bold">Nro</th>
                                            <th class="text-center semi-bold">Trabajador</th>
                                            <th class="text-center semi-bold">Hijo(a)</th>
                                            <th class="text-center semi-bold">Estado</th>
                                            <th class="text-center semi-bold">Fecha</th>
                                            <th class="text-center semi-bold">¿Procesado?</th>
                                            <th class="text-center semi-bold">Detalle</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tbodys">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>
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
                $("#dtp1").datepicker({
                    dateFormat: "dd/mm/yy",
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 2,
                    onClose: function (selectedDate) {
                        $("#dtp2").datepicker("option", "minDate", selectedDate);
                        $("#dtp2").datepicker("setDate", selectedDate);

                    }
                });
                $("#dtp2").datepicker({
                    dateFormat: "dd/mm/yy",
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 2,
                    onClose: function (selectedDate) {
                        $("#dtp1").datepicker("option", "maxDate", selectedDate);
                    }
                });
                pageSetUp();
                $.sound_path = "../../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                    $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                });
                $(".btn_procesar").click(function () {

                    $.SmartMessageBox({
                        title: "¡Advertencia!",
                        content: "¿Esta seguro de procesar las modificaciones?",
                        buttons: '[No][Si]'
                    }, function (ButtonPressed) {
                        if (ButtonPressed === "Si") {
                            var t = 0;
                            $.each($(".ck_procesado"), function () {

                                if ($(this).prop('checked')) {
                                    $.ajax({
                                        url: "../../../RHistorial",
                                        type: "POST",
                                        data: "opc=Procesar_datos_hijos&" + $(".val_hijo" + $(this).val()).val()
                                    }).done(function () {
                                        $.smallBox({
                                            title: "Procesado con exito",
                                            content: "<i class='fa fa-clock-o'></i> <i>Las modificaciones se han procesado correctamente...</i>",
                                            color: "#659265",
                                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                            timeout: 4000
                                        });

                                    }).error(function () {
                                        $.smallBox({
                                            title: "¡Error!",
                                            content: "<i class='fa fa-clock-o'></i> <i>Las modificaciones NO se han procesado correctamente...",
                                            color: "#C46A69",
                                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                            timeout: 6000
                                        });
                                    });
                                    t++;
                                }
                            });
                            if (t == 0) {
                                $.smallBox({
                                    title: "Procesar Modificaciones",
                                    content: "<i class='fa fa-ban'></i> <i>No hay modificaciones por procesar, porfavor seleccione si o no...</i>",
                                    color: "#dfb56c",
                                    iconSmall: "bounce animated",
                                    timeout: 6000
                                });
                            }
                            obetnerDatos();
                        }
                        if (ButtonPressed === "No") {
                        }
                    });
                });

                $('.tabla_t').DataTable();
                $(".tipo").change(function () {
                    if ($("#dtp1").val() != '' && $("#dtp2").val() != '') {
                        obetnerDatos();
                    }
                });
                $('.btnEnviar').click(function () {
                    obetnerDatos();
                });
            });
            function obetnerDatos() {
                if ($('.form_f').valid()) {
                    var data = $('.form_f').serialize();
                    var d = "&opc=Filtro_hijo";
                    $.post("../../../RHistorial", data + d, function (objJson) {
                        var lista = objJson.lista;
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                        if (lista.length < 1) {
                            $(".btn_procesar").hide();
                            $.smallBox({
                                title: "Busqueda de Historial",
                                content: "<i class='fa fa-ban'></i> <i>No hay modificaciones en ese rango de fechas</i>",
                                color: "#dfb56c",
                                iconSmall: "bounce animated",
                                timeout: 4000
                            });
                            crear_t();
                            $('.tabla_t').DataTable();
                        } else {
                            $(".btn_procesar").show();
                            var t = "<tr>";
                            for (var i = 0; i < lista.length; i++) {
                                t += "<td>" + (i + 1) + "</td>";
                                t += "<td>" + lista[i].ap_pat_t + " " + lista[i].ap_mat_t + " " + lista[i].no_tra + "</td>";
                                t += "<td>" + lista[i].ap_pat_h + " " + lista[i].ap_mat_h + " " + lista[i].no_hijo + "</td>";
                                if (lista[i].estado_filtro == '1') {
                                    t += "<td>Modificado</td>";
                                } else if (lista[i].estado_filtro == '0') {
                                    t += "<td>Agregado</td>";
                                }
                                t += "<td>" + lista[i].fecha + "</td>";
                                if (lista[i].procesado == '1') {
                                    t += "<td>Si</td>";
                                } else {
                                    t += "<td class='smart-form'><label class='toggle'><input type='checkbox' value='" + i + "'  class='ck_procesado'  name='estado' name='checkbox-toggle' ><i data-swchon-text='SI' data-swchoff-text='NO'></i></label></td>";
                                }
                                t += "<td><input type='hidden' class='val_hijo" + i + "' value='idh=" + lista[i].id + "&es_fecha=" + lista[i].estado_filtro + "&fecha=" + lista[i].fecha + "' ><a href='../../../RHistorial?opc=Comparar_hijo&idtr=" + lista[i].idtr + "&idh=" + lista[i].id + "&fecha_default=" + lista[i].fecha + "' class='btn btn-primary btn-labeled'>Ver Detalle <i class='fa fa-arrow-circle-right' ></i></a></td></tr> ";
                            }
                            crear_t();
                            $('.tbodys').append(t);
                            $('.tabla_t').DataTable();
                        }
                    });
                    $(".btnCancelar").click(function () {
                        $('.form_f')[0].reset();
                        crear_t();
                        $('.tabla_t').DataTable();
                    });
                } else {
                    $.smallBox({
                        title: "Busqueda de Historial",
                        content: "<i class='fa fa-ban'></i> <i>Complete los filtros...</i>",
                        color: "red",
                        iconSmall: "bounce animated",
                        timeout: 4000
                    });
                }
            }
            function crear_t() {
                var text = '<table class="tabla_t table table-bordered table-hover table-striped"><thead><tr><th class="text-center semi-bold">Nro</th>';
                text += '<th class="text-center semi-bold">Trabajador</th><th class="text-center semi-bold">Hijo(a)</th><th class="text-center semi-bold">Estado</th><th class="text-center semi-bold">Fecha</th><th class="text-center semi-bold">¿Procesado?</th><th class="text-center semi-bold">Detalle</th></tr></thead><tbody class="tbodys">';
                text += '</tbody></table>';
                $('.cont_t').empty();
                $('.cont_t').append(text);
            }
        </script>
    </body>
</html>
