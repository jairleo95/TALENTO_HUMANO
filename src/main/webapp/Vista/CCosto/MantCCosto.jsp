<%-- 
    Document   : MantCCosto
    Created on : 19/05/2015, 09:55:03 AM
    Author     : Andres
--%>


<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento Centro Costo</title>
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
    </head>
    <body>
        <div class="well caja_t">
            <div class="row">
                <form class="smart-form form_cc">
                    <section class="col-xs-10">
                        <div class="row">
                            <section class="col col-sm-6" >
                                <label class="label">Codigo</label>
                                <label class="input">
                                    <input class="inccc" type="text" name="codigo" placeholder="Ingesar Codigo" maxlength="8">
                                </label>
                            </section>
                            <section class="col col-sm-6">
                                <label class="label">Detalle</label>
                                <label class="input">
                                    <input class="indcc" type="text" name="detalle" placeholder="Detalle Centro Costo" maxlength="200">
                                </label>
                            </section>
                        </div>
                        <div class="row">
                            <section class="col col-sm-3">
                                <label class="label">Direccion</label>
                                <label class="select">
                                    <select class="indir" name="dir">
                                        <option value="">[Seleccione]</option>
                                    </select>
                                </label>
                            </section>
                            <section class="col col-sm-3">
                                <label class="label">Departmento</label>
                                <label class="select">
                                    <select class="indep" name="dep">
                                        <option value="">[Seleccione]</option>
                                    </select>
                                </label>
                            </section>
                            <section class="col col-sm-3">
                                <label class="label">Area</label>
                                <label class="select">
                                    <select class="inarea" name="area">
                                        <option value="">[Seleccione]</option>
                                    </select>
                                </label>
                            </section>
                            <section class="col col-sm-3">
                                <label class="label">Seccion</label>
                                <label class="select">
                                    <select class="inseccion" name="seccion">
                                        <option value="">[Seleccione]</option>
                                    </select>
                                    <input type="hidden" name="id_cc" class="id_cc" />
                                    <input type="hidden" name="id_det_cc" class="iddcc" />
                                </label>
                            </section>
                        </div>
                    </section>
                    <section class="col-md-2">
                        <section class="col col-xs-12">
                            <center>
                                <button class="btn btn-primary btn-xl btn-circle btnSave" type="button" style="margin-top: 13%" value="1"><i id="icono" class="fa fa-plus"></i></button> 
                                <button class="btn btn-danger btn-xl btn-circle btnCancel" type="button" style="margin-top: 13%; display:none" value="1"><i id="icono" class="glyphicon glyphicon-remove"></i></button> 
                            </center>
                        </section>

                    </section>


                </form>
            </div>
        </div>
        <div class="well">
            <div class="row">
                <div class="table-responsive cont_t">
                    <table class="table table-bordered table-striped table-responsive tabla_t">
                        <thead>
                            <tr>
                                <td class="text-center semi-bold" width="4%">Nro</td>
                                <td class="text-center semi-bold">Codigo</td>
                                <td class="text-center semi-bold">Detalle</td>
                                <td class="text-center semi-bold">Departamento</td>
                                <td class="text-center semi-bold">Area</td>
                                <td class="text-center semi-bold" width="12%">Acciones</td>
                            </tr>
                        </thead>
                        <tbody class="tbodys">                            

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
            if (!window.jQuery) {
                document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');
            }
        </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
            if (!window.jQuery.ui) {
                document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
            }
        </script>
        <script src="../../js/app.config.js"></script>
        <script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 
        <script src="../../js/bootstrap/bootstrap.min.js"></script>
        <script src="../../js/notification/SmartNotification.min.js"></script>
        <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>
        <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>
        <script src="../../js/plugin/select2/select2.min.js"></script>
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
        <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>
        <script src="../../js/plugin/fastclick/fastclick.min.js"></script>
        <script src="../../js/demo.min.js"></script>
        <script src="../../js/app.min.js"></script>
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

        <script src="../../js/businessLogic/CentroCosto/mantCentroCosto.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    </body>
</html>
