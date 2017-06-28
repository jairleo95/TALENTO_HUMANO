<%-- 
    Document   : Gpresupuesto
    Created on : 24/06/2017, 09:37:35 PM
    Author     : Leandro Burgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
    </head>
    <body>
        <div class="col-lg-2 col-md-2">
            <div class="list-group"><br/><br/>
                <button type="button" class="list-group-item v2 disabled">Actualizar Presupuesto</button>
                <button type="button" class="list-group-item active v1">Asignar Presupuesto</button>
                <button type="button" class="list-group-item disabled">Historial de Modificaciones</button>
                <button type="button" class="list-group-item disabled">Reporte por Área</button>
            </div>
        </div>
        <div class="panel panel-primary col-md-8 col-lg-8" id="vadd">
            <div class="panel-heading"><h3>Asignar Presupuesto</h3></div>
            <div class="panel-body">
                <div class="widget-body">
                    <form class="">
                        <fieldset>
                            <legend>
                                Seleccionar Área
                            </legend>
                            <div class="row">
                                <div class="form-group col-md-4 col-xs-4" >
                                    <label>Dirección :</label><br>
                                    <select class="form-control select_direccion" > 
                                        <option value="" selected disabled>[Seleccione]</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4 col-xs-4" >
                                    <label>Departamento :</label><br>
                                    <select class="form-control select_dep" > 
                                        <option value="" selected disabled>[Seleccione]</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4 col-xs-4" >
                                    <label>Área :</label><br>
                                    <select class="form-control select_area" > 
                                        <option value="" selected disabled>[Seleccione]</option>
                                    </select>
                                </div>
                            </div>
                            <input type="hidden" id="iArea">
                        </fieldset>
                        <fieldset>
                            <legend>
                                Asignación Financiera
                            </legend>
                            <div class="form-group">
                                <label>Presupuesto Anual :</label><br>
                                <div class="input-group col-md-6 col-xs-6">
                                    <div class="input-group-addon">$</div>
                                    <input type="number" name="sueldo" class="form-control" maxlength="10" min="0" id="ipre" value="" placeholder="Ingrese el Presupuesto para esta área">
                                    <div class="input-group-addon">.00</div>
                                </div>
                            </div>

                        </fieldset>
                        <fieldset>
                            <legend>
                                Gestión de Contratos
                            </legend>
                            <div class="form-group">
                                <label>N° de Trabajadores :</label><br>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                                    <input type="number"  class="form-control" id="intr" placeholder="Ingrese el número de trabajadores de esta área">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6 col-xs-6">
                                    <label>Fecha Inicio:</label><br>
                                    <input type="date" name="fec_i" class="form-control" length="45"  id="fe_i">
                                </div>
                                <div class="form-group col-md-6 col-xs-6">
                                    <label>Fecha Fin :</label><br>
                                    <input type="date" name="fec_f" class="form-control" size="45" maxlength="100"  id="fe_fin">
                                </div>
                            </div>
                        </fieldset>

                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-4"></div>
                                    <button class="btn btn-success col-md-4" type="button" onclick="saveB()">
                                        <i class="fa fa-save"></i>
                                        Registrar
                                    </button>
                                    <div class="col-md-4"></div>
                                </div>
                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>

        <!--<div class="panel panel-warning col-md-8 col-lg-8" id="vupdate">
            <div class="panel-heading"><h3>Actualizar Presupuesto</h3></div>
            <div class="panel-body">
                <div class="widget-body">
                    <form class="">
                        <fieldset>
                            <legend>
                                Seleccionar Área
                            </legend>
                            <div class="row">
                                <div class="form-group col-md-4 col-xs-4" >
                                    <label>Dirección :</label><br>
                                    <select class="form-control select_direccion"> 
                                        <option value="" selected disabled>[Seleccione]</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4 col-xs-4" >
                                    <label>Departamento :</label><br>
                                    <select class="form-control select_dep"> 
                                        <option value="" selected disabled>[Seleccione]</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4 col-xs-4" >
                                    <label>Área :</label><br>
                                    <select class="form-control select_area"> 
                                        <option value="" selected disabled>[Seleccione]</option>
                                    </select>
                                </div>
                            </div>
                        </fieldset>
                        <div class="v3">
                            <fieldset>
                                <legend>
                                    Asignación Financiera
                                </legend>
                                <div class="form-group">
                                    <label>Presupuesto Anual :</label><br>
                                    <div class="input-group col-md-6 col-xs-6">
                                        <div class="input-group-addon">$</div>
                                        <input type="number" name="sueldo" class="form-control" maxlength="10" min="0" id="sueldo" value="500" placeholder="Ingrese el Presupuesto para esta área">
                                        <div class="input-group-addon">.95</div>
                                    </div>
                                </div>

                            </fieldset>
                            <fieldset>
                                <legend>
                                    Gestión de Contratos
                                </legend>
                                <div class="form-group row">
                                    <label>N° de Trabajadores :</label><br>
                                    <div class="form-group col-md-4 col-xs-4">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                                            <input type="number"  class="form-control" id="ap" placeholder="Ingrese el número de trabajadores de esta área" value="10">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4 col-xs-4">
                                        <span><strong>5</strong> trabajadores contratados de los <strong>10</strong> presupuestados</span>
                                    </div>
                                    <div class="form-group col-md-4 col-xs-4">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped progress-bar-warning active" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6 col-xs-6">
                                        <label>Fecha Inicio:</label><br>
                                        <input type="date" name="fec_i" class="form-control" length="45"  id="fe_i" value="2017-04-06">
                                    </div>
                                    <div class="form-group col-md-6 col-xs-6">
                                        <label>Fecha Fin :</label><br>
                                        <input type="date" name="fec_f" class="form-control" size="45" maxlength="100"  id="fe_fin" value="2017-04-06">
                                    </div>
                                </div>
                            </fieldset>

                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-4"></div>
                                        <button class="btn btn-success col-md-4" type="button">
                                            <i class="fa fa-save"></i>
                                            Actualizar
                                        </button>
                                        <div class="col-md-4"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>-->

        <div class="col-lg-2 col-md-2"></div>


        <script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
        <script src="../../ajax/ajax.google.min.js"></script> 
        <script type="text/javascript">

                                        function saveB() {
                                            var idArea = $("#iArea").val();
                                            var presupuesto = $("#ipre").val();
                                            var trabajadores = $("#intr").val();
                                            var f_inicio = $("#fe_i").val();
                                            var f_fin = $("#fe_fin").val();
                                            if (idArea !== "" && presupuesto !== "" && trabajadores !== "" && f_inicio !== "" && f_fin) {
                                                var f_i = convertir_fecha(f_inicio);
                                                var f_f = convertir_fecha(f_fin);
                                                var url = '../../pres?opc=reg';
                                                var data = 'idA=' + idArea;
                                                data += '&PA=' + presupuesto;
                                                data += '&NT=' + trabajadores;
                                                data += '&f_i=' + f_i;
                                                data += '&f_fin=' + f_f;
                                                console.log(data);
                                                $.post(url, data, function (objJson) {
                                                    if (objJson.rpta) {
                                                        console.log("registrado");
                                                    } else {
                                                        console.log("no registrado");
                                                    }
                                                });
                                            } else {
                                                console.log("Falta campos");
                                            }
                                        }

                                        function convertir_fecha(fecha) {
                                            var fi = fecha.split("-");
                                            var year = fi[0];
                                            var month = fi[1];
                                            var day = fi[2];
                                            var s = day + '/' + month + '/' + year;
                                            return s;
                                        }
                                        function listar_opciones(opc, id) {
                                            var ap = "";
                                            if (opc == 'Listar_direccion') {
                                                var a = $(".select_direccion");
                                                $(".select_dep").empty();
                                                $(".select_dep").append("<option value=''>[Seleccione]</option>");
                                                $(".selectarea").empty();
                                                $(".selectarea").append("<option value=''>[Seleccione]</option>");
                                                a.empty();
                                                a.append("<option value=''>[Seleccione]</option>");
                                            }
                                            if (opc == 'Listar_dir_dep') {
                                                var a = $(".select_dep");
                                                $(".selectarea").empty();
                                                $(".selectarea").append("<option value=''>[Seleccione]</option>");
                                                ap = "&id=" + id;
                                                a.empty();
                                                a.append("<option value=''>[Seleccione]</option>");
                                            }
                                            if (opc == 'Listar_area2') {
                                                var a = $(".select_area");
                                                ap = "&id=" + id;
                                                a.empty();
                                                a.append("<option value=''>[Seleccione]</option>");
                                            }
                                            $.post("../../Direccion_Puesto", "opc=" + opc + ap, function (objJson) {
                                                var list = objJson.lista;
                                                for (var i = 0; i < list.length; i++) {
                                                    a.append("<option value='" + list[i].id + "'>" + list[i].nombre + "</option>");
                                                }
                                            });
                                        }
                                        $(document).ready(function () {
                                            $("#vupdate").hide();
                                            $("#vadd").show();
                                            init();
                                        });

                                        function init() {
                                            var opc = 'Listar_direccion';
                                            var id = "";
                                            listar_opciones(opc, id);
                                        }
                                        $(".select_direccion").change(function () {
                                            var opc = 'Listar_dir_dep';
                                            var id = $(".select_direccion").val();
                                            listar_opciones(opc, id);
                                        });
                                        $(".select_dep").change(function () {
                                            var opc = 'Listar_area2';
                                            var id = $(".select_dep").val();
                                            listar_opciones(opc, id);
                                        });
                                        $(".select_area").change(function () {
                                            var id = $(".select_area").val();
                                            $("#iArea").attr("value", id);
                                        });
                                        function get_id_area() {
                                            $(".v3").show();
                                        }

                                        function change_view(id) {
                                            console.log(id);
                                            if (id == 1) {
                                                $(".v2").attr("class", "list-group-item v2");
                                                $(".v1").attr("class", "list-group-item active v1");
                                                $("#vupdate").hide();
                                                $("#vadd").show();
                                            }
                                            if (id == 2) {
                                                $(".v1").attr("class", "list-group-item v1");
                                                $(".v2").attr("class", "list-group-item active v2");
                                                $("#vadd").hide();
                                                $(".v3").hide();
                                                $("#vupdate").show();
                                            }
                                            init();
                                        }

        </script>
    </body>

</html>
