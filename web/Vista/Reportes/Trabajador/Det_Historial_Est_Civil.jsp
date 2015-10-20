<%-- 
    Document   : Historial_Est_Civil
    Created on : 19/04/2015, 10:55:38 AM
    Author     : Alex
--%>
<jsp:useBean id="List_Estado_Civil" scope="session" class="java.util.ArrayList"/>

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

                        <div class="well">

                            <h2><label> Trabajador:</label> <strong><%=request.getParameter("name")%></strong></h2>
                            <input type="hidden" class="idtra" value="<%=request.getParameter("idtr")%>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="well" >

                            <button type="button" class="btn btn-success btn_pro_reg">Procesar Registros</button>
                            <div class="table-responsive cont_t" >

                                <table class="tabla_t table table-bordered table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center semi-bold">Nro</th>
                                            <th class="text-center semi-bold">Estado Civil</th>
                                            <th class="text-center semi-bold">Fe. Modificacion</th>
                                            <th class="text-center semi-bold">Usuario</th>
                                            <th class="text-center semi-bold">Procesado</th>
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
            $(document).ready(function() {
                pageSetUp();
                $.sound_path = "../../../sound/", $.sound_on = !0, jQuery(document).ready(function() {
                    $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                });
                ListarEC();
            });
            $(".btn_pro_reg").click(function() {
                //t += "<td><center><a href='../../../RHistorial?opc=Procesar_reg_ec'  </td>";
                    $.SmartMessageBox({
                        title: "¡Advertencia!",
                        content: "¿Esta seguro de procesar la(s) modificacione(s)?",
                        buttons: '[No][Si]'
                    }, function(ButtonPressed) {
                        if (ButtonPressed === "Si") {
                            var t = 0;
                            $.each($(".registrado"), function() {

                                if ($(this).prop('checked')) {
                                    $.ajax({
                                        url: "../../../RHistorial",
                                        type: "POST",
                                        data: "opc=Procesar_reg_ec&" + $(".id_ec" + $(this).val()).val()
                                    }).done(function() {
                                        $.smallBox({
                                            title: "Procesado con exito",
                                            content: "<i class='fa fa-clock-o'></i> <i>Las modificaciones se han procesado correctamente...</i>",
                                            color: "#659265",
                                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                            timeout: 4000
                                        });

                                    }).error(function() {
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
                            ListarEC();
                        }
                        if (ButtonPressed === "No") {
                        }
                    });
                });
            
            function ListarEC() {
                var id = $('.idtra').val();
                var d = "opc=list_detalle_ec";
                d += "&idtr=" + id;
                $.post("../../../RHistorial?", d, function(objJson) {
                    var lista = objJson.lista;

                    // alert(lista);
                    var t = "<tr>";
                    for (var i = 0; i < lista.length; i++) {
                        var ec_p;

                        if (lista[i].es_civil_p == 1) {
                            ec_p = "Soltero(a)"
                        }
                        if (lista[i].es_civil_p == 2) {
                            ec_p = "Casado(a)"
                        }
                        if (lista[i].es_civil_p == 3) {
                            ec_p = "Divorciado(a)"
                        }
                        if (lista[i].es_civil_p == 4) {
                            ec_p = "Viudo(a)"
                        }
                        if (lista[i].es_civil_p == 5) {
                            ec_p = "Separado(a)"
                        }
                        if (lista[i].es_civil_p == 6) {
                            ec_p = "Conviviente(a)"
                        }

                        t += "<td>" + (i + 1) + "</td>";
                        t += "<td>" + ec_p + "</td>";
                        t += "<td>" + lista[i].fe_modi + "</td>";
                        t += "<td><input type='hidden' class='id_ec" + i + "' value='idec=" + lista[i].id_ec + "'>" + lista[i].no_usuario + "</td>";
                        if (lista[i].es_reg == '1') {
                            t += "<td><center>Si</center></td>";
                        } else {
                            t += "<td class='smart-form'><center><label class='toggle'><input type='checkbox' value=" + i + " name='checkbox-toggle' class='registrado' ><i data-swchon-text='SI' data-swchoff-text='NO'></i></label><center> </td>";
                        }
                        t += "<tr>";
                    }
                    crear_t();
                    $('.tbodys').append(t);
                    $('.tabla_t').DataTable();

                });
                function crear_t() {
                    /* var text = '<table class="tabla_t table table-bordered table-hover table-striped"><thead><tr><th class="text-center semi-bold">Nro</th>';
                     text += '<th class="text-center semi-bold">Trabajador</th><th class="text-center semi-bold">Detalle</th></tr></thead><tbody class="tbodys">';
                     text += '</tbody></table>';
                     $('.cont_t').empty();
                     $('.cont_t').append(text);*/

                    var text = '<table class="tabla_t table table-bordered table-hover table-striped"><thead><tr><th class="text-center semi-bold">Nro</th>';
                    text += '<th class="text-center semi-bold">Estado Civil</th><th class="text-center semi-bold">Fe.Modificacion</th><th class="text-center semi-bold">Usuario</th>';
                    text += '<th class="text-center semi-bold">Procesado</th></tr> </thead><tbody class="tbodys">';
                    text += '</tbody></table>';
                    $('.cont_t').empty();
                    $('.cont_t').append(text);
                }


            }

        </script>
    </body>

</html>
