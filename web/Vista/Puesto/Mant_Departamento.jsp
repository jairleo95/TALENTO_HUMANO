<%-- 
    Document   : Mant_Departamento
    Created on : 16/03/2015, 08:32:04 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">
    </head>
    <body>
        <div id="main" role="main" style="margin: 0px;">
            <div id="content" >
                <section id="widget-grid" class="">
                    <div class="row">
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3" data-widget-editbutton="false">

                                <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body no-padding">
                                        <form class="smart-form">
                                            <fieldset>
                                                <div class="row">
                                                    <section class="col col-12">
                                                        <h2 class="titulo_t" value="1">Agregar Departamento</h2>
                                                    </section>                                              
                                                </div>                                               
                                                <div class="row">
                                                    <section class="col col-3">
                                                        <label class="label">Nombre</label>
                                                        <label class="input">
                                                            <input class="inpNombre"type="text" placeholder="Escribir nombre de Departamento" required="" maxlength="100">
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="label">Nombre Corto</label>
                                                        <label class="input">
                                                            <input class="inpNCorto"type="text" placeholder="Escribir nombre Corto" required="" maxlength="30">
                                                        </label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="label">Estado</label>
                                                        <label class="select">
                                                            <select class="inpEstado" required="0">
                                                                <option value="">[Seleccione]</option>
                                                                <option value="1">Hablilitado</option>
                                                                <option value="2">Deshabilitado</option>
                                                            </select>
                                                            <i></i></label>
                                                    </section>
                                                    <section class="col col-3">
                                                        <label class="label">Direccion</label>
                                                        <label class="select">
                                                            <select class="inpDireccion" required="0">
                                                                <option value="">[Seleccione]</option>
                                                            </select>
                                                            <i></i></label>
                                                    </section>
                                                </div>
                                            </fieldset>
                                            <footer>
                                                <input class="inpId" type="hidden" value="">
                                                <input type="submit" class="btn btn-primary btnAceptar" value="Aceptar">
                                                <input type="reset" class="btn btn-default" value="Cancelar">
                                            </footer>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                    <div class="row">
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-1" data-widget-editbutton="false">
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                    <h2>Lista</h2>
                                </header>
                                <div>
                                    <div class="jarviswidget-editbox">
                                    </div>
                                    <div class="widget-body no-padding">
                                        <div class="table-responsive div_t">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </section>
            </div>
        </div>



        <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>
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
        <script src="../../js/speech/voicecommand.min.js"></script>
        <script src="../../js/plugin/jquery-nestable/jquery.nestable.min.js"></script>
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script src="../../js/Js_Mant_Puesto/Datatable_puesto.js"></script>
        <script>
            $(document).ready(function(){
                cargar_direccion();
                cargar_t();
                function cargar_t(){
                    var tabb = "";
                    tabb += '<table class="table table-striped table-bordered table-hover tabla_t" width="100%"><thead><tr>';
                    tabb += '<td>Nro</td><td>Nombre Departamento</td><td>Nombre Corto</td><td>Estado</td><td>Direccion</td>';
                    tabb += '<td>Acciones</td></tr></thead><tbody class="tbodys"></tbody></table>';
                    $('.div_t').empty();
                    $('.div_t').append(tabb);
                    $.post("../../Puesto","opc=list_Departamento",function(objJson){
                        var list = objJson.lista;
                        for (var i = 0; i < list.length; i++) {
                        }
                    });
                }
                function cargar_direccion(){
                    var x= $('.inpDireccion');
                    x.empty();
                    x.append("<option value=''>[Seleccione]</option>");
                    $.post("../../Puesto", "opc=list_direccion",function(objJson){
                        var list = objJson.lista;
                        for (var i = 0; i < list.length; i++) {
                            x.append("<option class='dir"+(i+1)+"' value="+list[i].id+">"+list[i].nombre+"</option>");
                        }
                    });
                }
                
            });
        </script>
    </body>
</html>
