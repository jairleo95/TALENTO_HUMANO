<%-- 
    Document   : Reg_Plazo
    Created on : 03/09/2015, 10:11:58 AM
    Author     : Andres
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production-plugins.min.css">
        <link href="../../../css/smartadmin-production.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../../css/smartadmin-skins.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <title>Plazos</title>
    </head>
    <body>
        <header class="page-header text-center">
            <h1 class="page-title">Mantenimiento de Plazos de Requerimientos</h1>
        </header>
        <div id="content">
            <div class="row">
                <div class="col-sm-3">
                    <div class="btn-group">
                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                            Agregar Plazo <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" data-toggle="modal" data-target="#addPlazo1">Ingreso a Planilla</a>
                            </li>
                            <li>
                                <a href="#" data-toggle="modal" data-target="#addPlazo2">Inicio de Contrato</a>
                            </li>
                        </ul>
                    </div>
                </div> 
            </div>
            <hr>
            <div class="row">
                <div class="col col-sm-12">
                    <div class="well ">

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col col-sm-12">
                    <div class="well">

                    </div>
                </div>
            </div>  
        </div>
        <div id="addPlazo1" class="modal fade" role="document">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Ingreso a Planilla</h4>
                    </div>
                    <div class="modal-body">
                        <form class="smart-form formPlazo1">
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="input">
                                        <input class="form-control" type="text" name="nPlazo" placeholder="Nombre del Plazo" required="true"> 
                                    </label>
                                </section>  
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="textarea">
                                        <textarea rows="3" required="true" name="descripcion" placeholder="Descripcion"></textarea>
                                    </label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="label">Tipo de Planilla</label>
                                    <label class="select">
                                        <select name="tpla">
                                            <option>Todos</option>
                                        </select>
                                        <i></i></label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="label">Tipo de Requerimiento</label>
                                    <label class="select">
                                        <select name="treq">
                                            <option>Todos</option>
                                        </select>
                                        <i></i></label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-6 col-xs-6">
                                    <label class="label">Desde</label>
                                    <label class="input"> <i></i>
                                        <input type="text" name="desde" placeholder="Seleccione Fecha de Inicio" required=""  readonly="" class="datepicker" data-dateformat='dd-mm-yyyy'>
                                    </label>
                                </section>
                                <section class="col col-sm-6 col-xs-6">
                                    <label class="label">Hasta</label>
                                    <label class="input"> <i></i>
                                        <input type="text" name="hasta" placeholder="Seleccione Fecha Limite" required=""  readonly="" class="datepicker" data-dateformat='dd-mm-yyyy'>
                                    </label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="label">Direccion</label>
                                    <label class="select">
                                        <select name="direccion">
                                            <option>[Seleccione]</option>
                                        </select>
                                        <i></i></label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="label">Departamento</label>
                                    <label class="select">
                                        <select name="dep">
                                            <option>[Seleccione]</option>
                                        </select>
                                        <i></i></label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="label">Area</label>
                                    <label class="select">
                                        <select name="area">
                                            <option>[Seleccione]</option>
                                        </select>
                                        <i></i></label>
                                </section>
                            </div>
                            <br>

                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <input type="button" name="opc" class="btn btn-primary btn-block" style="height: 30px;" data-dismiss="modal" value="Registar">
                                </section>
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="addPlazo2" class="modal fade" role="document">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Inicio de Contrato</h4>
                    </div>
                    <div class="modal-body">
                        <form class="smart-form formPlazo2">
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="input">
                                        <input class="form-control" type="text" name="nPlazo" placeholder="Nombre del Plazo" required="true"> 
                                    </label>
                                </section>  
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="textarea">
                                        <textarea rows="3" required="true" name="descripcion" placeholder="Descripcion"></textarea>
                                    </label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="label">Tipo de Planilla</label>
                                    <label class="select">
                                        <select name="tpla">
                                            <option>Todos</option>
                                        </select>
                                        <i></i></label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="label">Tipo de Requerimiento</label>
                                    <label class="select">
                                        <select name="treq">
                                            <option>Todos</option>
                                        </select>
                                        <i></i></label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-6 col-xs-6">
                                    <label class="label">Desde</label>
                                    <label class="input"> <i></i>
                                        <input type="text" name="desde" placeholder="Seleccione Fecha de Inicio" required=""  readonly="" class="datepicker" data-dateformat='dd-mm-yyyy'>
                                    </label>
                                </section>
                                <section class="col col-sm-6 col-xs-6">
                                    <label class="label">Hasta</label>
                                    <label class="input"> <i></i>
                                        <input type="text" name="hasta" placeholder="Seleccione Fecha Limite" required=""  readonly="" class="datepicker" data-dateformat='dd-mm-yyyy'>
                                    </label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="label">Direccion</label>
                                    <label class="select">
                                        <select name="direccion">
                                            <option>[Seleccione]</option>
                                        </select>
                                        <i></i></label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="label">Departamento</label>
                                    <label class="select">
                                        <select name="dep">
                                            <option>[Seleccione]</option>
                                        </select>
                                        <i></i></label>
                                </section>
                            </div>
                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <label class="label">Area</label>
                                    <label class="select">
                                        <select name="area">
                                            <option>[Seleccione]</option>
                                        </select>
                                        <i></i></label>
                                </section>
                            </div>
                            <br>

                            <div class="row">
                                <section class="col col-sm-12 col-xs-12">
                                    <input type="button" name="opc" class="btn btn-primary btn-block" style="height: 30px;" data-dismiss="modal" value="Registar">
                                </section>
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="../../../js/libs/jquery-2.0.2.min.js" type="text/javascript"></script>
        <script src="../../../js/libs/jquery-ui-1.10.3.min.js" type="text/javascript"></script>

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
    </body>
</html>
