<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle Historial</title>
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
                                <h1 class="text-left font-md semi-bold">Comparar Modificaciones :</h1><br>
                                <div class="row">
                                    <div class="col col-lg-12">
                                        <section class="col col-sm-6">
                                            <label><strong>Trabajador</strong></label>
                                            <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                                <select name="trabajador" required="" class="tabajador">
                                                    <option value='' >[SELECCIONE]</option>
                                                </select>
                                                <input type="hidden" class="idtr" value="<%=request.getParameter("idtr")%>">
                                            </label>
                                        </section>
                                        <section class="col col-sm-6">
                                            <label><strong>Hijo(a)</strong></label>
                                            <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                                <select name="trabajador" required="" class="hijo">
                                                    <option value='' >[SELECCIONE]</option>
                                                </select>
                                                <input type="hidden" class="idh" value="<%=request.getParameter("idh")%>">
                                            </label>
                                        </section>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-lg-12">
                                        <section class="col col-sm-6">
                                            <label><strong>Fecha 1</strong></label>
                                            <label class="select"> <i class="icon-append fa fa-calendar"></i>
                                                <select class="fecha1" required="">
                                                    <option value='' >[SELECCIONE]</option>
                                                     <input type="hidden" class="fecha_default" value="<%=request.getParameter("fecha_default")%>">
                                                </select>
                                            </label>
                                        </section>
                                        <section class="col col-sm-6">
                                            <label><strong>Fecha 2</strong></label>
                                            <label class="select"><i class="icon-append fa fa-calendar"></i>
                                                <select class="fecha2" required="">
                                                    <option value='' >[SELECCIONE]</option>
                                                </select>
                                            </label>
                                        </section>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="well">
                            <div class="table-responsive cont_t">
                                <table class="tabla_t table table-bordered table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center semi-bold">Nro</th>
                                            <th class="text-center semi-bold">Campo</th>
                                            <th class="text-center semi-bold">Data 1</th>
                                            <th class="text-center semi-bold">Data 2</th>
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
        <script src="../../../js/Js_Formulario/Js_Form.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(document).ready(function () {

                list_select($(".hijo"), "../../../RHistorial", "opc=Listar_hijo_trabajador&idtr=" + $(".idtr").val(), "1", $(".idh").val());
                list_select($(".fecha1"), "../../../RHistorial", "opc=Fe_Modif_Hijo&hijo=" + $(".idh").val(), "1", $(".fecha_default").val());

                $.post("../../../RHistorial", "opc=Fe_Modif_Hijo&hijo=" + $(".idh").val(), function (objJson) {
                    var select2 = $(".fecha2");
                    var lista = objJson.lista;
                    select2.append("<option value=''>Cargando...</option>");
                    select2.empty();
                    if (lista.length > 0) {
                        select2.append("<option value=''>[SELECCIONE]</option>");
                        for (var i = 0; i < lista.length; i++) {
                            select2.append("<option value='" + lista[i].fecha + "'>" + lista[i].fecha + "</option>");
                        }
                    }
                });

                $(".fecha2").change(function () {
                    var tbody = $(".tbodys");
                    tbody.empty();
                    var texto_html = "";
                    $.post("../../../RHistorial", "opc=Comparar_dato_Hijo&id=" + $(".idh").val() + "&fecha1=" + $(".fecha1").val() + "&fecha2=" + $(".fecha2").val(), function (objJson) {
                        var lista = objJson.lista;


                        if (lista[0].ap_p != lista[1].ap_p) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>1</td><td>Apellido Paterno:</td><td>" + lista[0].ap_p + "</td>";
                        texto_html += "<td>" + lista[1].ap_p + "</td></tr>";


                        if (lista[0].ap_m != lista[1].ap_m) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>2</td><td>Apellido Materno:</td><td>" + lista[0].ap_m + "</td>";
                        texto_html += "<td>" + lista[1].ap_m + "</td></tr>";

                        if (lista[0].no_hijo != lista[1].no_hijo) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>3</td><td>Nombres:</td><td>" + lista[0].no_hijo + "</td>";
                        texto_html += "<td>" + lista[1].no_hijo + "</td></tr>";

                        if (lista[0].fe_nac != lista[1].fe_nac) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>4</td><td>Fecha de Nacimiento:</td><td>" + lista[0].fe_nac + "</td>";
                        texto_html += "<td>" + lista[1].fe_nac + "</td></tr>";

                        if (lista[0].no_sexo != lista[1].no_sexo) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>5</td><td>Sexo:</td><td>" + lista[0].no_sexo + "</td>";
                        texto_html += "<td>" + lista[1].no_sexo + "</td></tr>";

                        if (lista[0].de_tip_doc != lista[1].de_tip_doc) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>6</td><td>Tipo de documento:</td><td>" + lista[0].de_tip_doc + "</td>";
                        texto_html += "<td>" + lista[1].de_tip_doc + "</td></tr>";

                        if (lista[0].nu_doc != lista[1].nu_doc) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>7</td><td>Numero de Documento:</td><td>" + lista[0].nu_doc + "</td>";
                        texto_html += "<td>" + lista[1].nu_doc + "</td></tr>";


                        if (lista[0].no_essalud != lista[1].no_essalud) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>8</td><td>Inscripcion Vigente en Essalud:</td><td>" + lista[0].no_essalud + "</td>";
                        texto_html += "<td>" + lista[1].no_essalud + "</td></tr>";


                        if (lista[0].no_niv_sup != lista[1].no_niv_sup) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>9</td><td>Estudios en Nivel Superior:</td><td>" + lista[0].no_niv_sup + "</td>";
                        texto_html += "<td>" + lista[1].no_niv_sup + "</td></tr>";


                        if (lista[0].us_creacion != lista[1].us_creacion) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>10</td><td>Usuario de Creacion:</td><td>" + lista[0].us_creacion + "</td>";
                        texto_html += "<td>" + lista[1].us_creacion + "</td></tr>";

                        if (lista[0].creacion != lista[1].creacion) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>11</td><td>Fecha de Creacion:</td><td>" + lista[0].creacion + "</td>";
                        texto_html += "<td>" + lista[1].creacion + "</td></tr>";

                        if (lista[0].us_modif != lista[1].us_modif) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>12</td><td>Usuario de Modificacion:</td><td>" + lista[0].us_modif + "</td>";
                        texto_html += "<td>" + lista[1].us_modif + "</td></tr>";

                        if (lista[0].modif != lista[1].modif) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>13</td><td>Fecha de Modificacion:</td><td>" + lista[0].modif + "</td>";
                        texto_html += "<td>" + lista[1].modif + "</td></tr>";

                        var detalle_ip1 = lista[0].ip_usuario.split("**");
                        var ip1 = detalle_ip1[0];
                        var no_usuario1 = detalle_ip1[1];
                        var mac1 = detalle_ip1[2];

                        var detalle_ip2 = lista[1].ip_usuario.split("**");
                        var ip2 = detalle_ip2[0];
                        var no_usuario2 = detalle_ip2[1];
                        var mac2 = detalle_ip2[2];


                        if (ip1 != ip2) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>15</td><td>Direccion Ip:</td><td>" + ip1 + "</td>";
                        texto_html += "<td>" + ip2 + "</td></tr>";

                        if (no_usuario1 != no_usuario2) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>16</td><td>Nombre de Usuario:</td><td>" + no_usuario1 + "</td>";
                        texto_html += "<td>" + no_usuario2 + "</td></tr>";

                        if (mac1 != mac2) {
                            texto_html += "<tr class='danger'>";
                        } else {
                            texto_html += "<tr>";
                        }
                        texto_html += "<td>17</td><td>Direccion Fisica:</td><td>" + mac1 + "</td>";
                        texto_html += "<td>" + mac2 + "</td></tr>";


                        tbody.append(texto_html);

                    });
                    texto_html = "";
                });






            });
        </script>
    </body>
</html>
