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
        <title>Presupuesto</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <link href="../../js/plugin/pfnotify/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="col-lg-2 col-md-2">
            <div class="list-group"><br/><br/>
                <button type="button" class="list-group-item v2 disabled" >Actualizar Presupuesto</button>
                <button type="button" class="list-group-item active v1">Asignar Presupuesto</button>
                <button type="button" class="list-group-item disabled">Historial de Modificaciones</button>
                <button type="button" class="list-group-item disabled">Reporte por Área</button>
            </div>
        </div>
        <div class="panel panel-primary col-md-8 col-lg-8" id="vadd">
            <div class="panel-heading"><h3><i class="fa fa-usd"></i>   Asignar Presupuesto</h3></div>
            <div class="panel-body">
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
                            Gestión de Presupuesto
                        </legend>
                        <div class="row">
                            <ul class="nav nav-pills">
                                <li role="presentation" onclick="ch(this.id)" id="anual" class="se active"><a style="cursor: pointer">Anual</a></li>
                                <li role="presentation" onclick="ch(this.id)" id="mensual" class="se"><a style="cursor: pointer">Mensual</a></li>
                                <li role="presentation" onclick="ch(this.id)" id="inter" class="se"><a style="cursor: pointer">Definir Intervalo</a></li>
                            </ul>
                            <input type="hidden" id="estOPC">
                        </div>
                        <br/>
                        <div class="row">
                            <div class="form-group col-md-6 col-xs-6">
                                <label>Fecha Inicio:</label><br>
                                <input type="date" name="fec_i" class="form-control" length="45"  id="fe_i" onchange="getFecha(this.value)">
                            </div>
                            <div class="form-group col-md-6 col-xs-6">
                                <label>Fecha Fin :</label><br>
                                <input type="date" name="fec_f" class="form-control" size="45" maxlength="100"  id="fe_fin" disabled="">
                            </div>
                        </div>                       
                        <div class="form-group col-md-6 col-xs-6">
                            <label>Presupuesto:</label><br>
                            <div class="input-group ">
                                <div class="input-group-addon">$</div>
                                <input type="number" name="sueldo" class="form-control" maxlength="10" min="0" id="ipre" value="" placeholder="Ingrese el Presupuesto para esta área">
                                <div class="input-group-addon">.00</div>
                            </div>
                        </div>

                        <div class="form-group col-md-6 col-xs-6">
                            <label>N° de Trabajadores :</label><br>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                                <input type="number"  class="form-control" id="intr" placeholder="Ingrese el número de trabajadores de esta área">
                            </div>
                        </div>

                    </fieldset>


                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-4"></div>
                                <button class="btn btn-primary btn-lg col-md-4" type="button" onclick="saveB()">
                                    Registrar
                                </button>
                                <div class="col-md-4"></div>
                            </div>
                        </div>
                    </div>

                </form>

            </div>
        </div>


        <div class="col-lg-2 col-md-2"></div>


        <script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
        <script src="../../ajax/ajax.google.min.js"></script> 
        <script src="../../js/plugin/pfnotify/pnotify.custom.min.js" type="text/javascript"></script>
        <script type="text/javascript">
                                    function ch(id) {
                                        $(".se").attr("class", "se");
                                        $("#" + id + "").attr("class", "se active");
                                        $("#estOPC").attr("value", id);
                                        $("#fe_i").attr("value", "");
                                        $("#fe_fin").attr("value", "");
                                        if (id === "inter") {
                                            jQuery("#fe_fin").removeAttr("disabled");
                                        } else {
                                            $("#fe_fin").attr("disabled", "");
                                        }
                                    }
                                    function getFechaInit() {
                                        var f = new Date();
                                        var day = f.getDate();
                                        var month = (f.getMonth() + 1);
                                        var year = f.getFullYear();
                                        if (day < 10) {
                                            day.toString();
                                            day = "0" + day;
                                        }
                                        if (month < 10) {
                                            month.toString();
                                            month = "0" + month;
                                        }
                                        var m = year + "-" + month + "-" + day;
                                        console.log("Fecha actual : " + m);
                                        return m;
                                    }

                                    function getFecha(fecha) {
                                        var com = $("#estOPC").val();
                                        if (com === "anual") {
                                            console.log("Eleccion de fecha ANUAL");
                                            getFechaAnual(fecha);
                                        }
                                        if (com === "mensual") {
                                            console.log("Eleccion de fecha MENSUAL");
                                            setFechaMensual(fecha);
                                        }
                                    }
                                    function setFechaMensual(fecha) {
                                        var f = fecha.split("-");
                                        var year = f[0];
                                        var month = f[1];
                                        var day = f[2];
                                        month = parseInt(month) + 1;
                                        if (month < 10) {
                                            month.toString();
                                            month = "0" + month;
                                        }
                                        var m = year + "-" + month + "-" + day;
                                        console.log("Fecha calculada : "+m);
                                        $("#fe_fin").attr("value", m);
                                    }


                                    function getFechaAnual(fecha) {
                                        var f = fecha.split("-");
                                        var year = f[0];
                                        var month = f[1];
                                        var day = f[2];
                                        var m = year + "-" + month + "-" + day;
                                        $("#fe_i").attr("value", m);
                                        setFechaAnual(m);
                                    }
                                    function setFechaAnual(fecha) {
                                        var f = fecha.split("-");
                                        var year = f[0];
                                        var month = f[1];
                                        var day = f[2];
                                        year = parseInt(year) + 1;
                                        var m = year + "-" + month + "-" + day;
                                        console.log("Fecha calculada : "+m);
                                        $("#fe_fin").attr("value", m);
                                    }
                                    function saveB() {
                                        var idArea = $("#iArea").val();
                                        var presupuesto = $("#ipre").val();
                                        var trabajadores = $("#intr").val();
                                        var f_inicio = $("#fe_i").val();
                                        var f_fin = $("#fe_fin").val();
                                        if (idArea !== "" && presupuesto !== "" && trabajadores !== "" && f_inicio !== "" && f_fin) {
                                            //Confirmar
                                            var confirmar = confirm("¿Está seguro que desea registrar este presupuesto?");
                                            if (confirmar) {
                                                var f_i = convertir_fecha(f_inicio);
                                                var f_f = convertir_fecha(f_fin);
                                                var url = '../../pres?opc=reg';
                                                var data = 'idA=' + idArea;
                                                data += '&PA=' + presupuesto;
                                                data += '&NT=' + trabajadores;
                                                data += '&f_i=' + f_i;
                                                data += '&f_fin=' + f_f;
                                                $.post(url, data, function (objJson) {
                                                    if (objJson.rpta) {
                                                        dyn_notice();
                                                    } else {
                                                        new PNotify({
                                                            title: 'Oh No!',
                                                            text: 'Un error ocurrió al registrar Presupuesto',
                                                            type: 'error'
                                                        });
                                                    }
                                                });
                                            } else {
                                                new PNotify({
                                                    title: 'No se registró',
                                                    text: 'No se ha registrado el Presupuesto',
                                                    type: 'info'
                                                });
                                            }

                                        } else {
                                            new PNotify({
                                                title: 'Campos Incompletos',
                                                text: 'Es necesario completar todo el formulario',
                                                type: 'info'
                                            });
                                        }
                                    }

                                    function dyn_notice() {
                                        var percent = 0;
                                        var notice = new PNotify({
                                            text: "Procesando",
                                            type: 'info',
                                            icon: 'fa fa-spinner fa-spin',
                                            hide: false,
                                            buttons: {
                                                closer: false,
                                                sticker: false
                                            },
                                            shadow: true,
                                            width: "300px"
                                        });

                                        setTimeout(function () {
                                            notice.update({
                                                title: false
                                            });
                                            var interval = setInterval(function () {
                                                percent += 2;
                                                var options = {
                                                    text: percent + "% procesado"
                                                };
                                                if (percent == 80) {
                                                    options.title = "Casi Listo";
                                                }
                                                if (percent >= 100) {
                                                    window.clearInterval(interval);
                                                    options.title = "Listo!";
                                                    options.type = "success";
                                                    options.hide = true;
                                                    options.buttons = {
                                                        closer: true,
                                                        sticker: true
                                                    };
                                                    options.icon = 'fa fa-check';
                                                    options.shadow = true;
                                                    options.width = PNotify.prototype.options.width;
                                                }
                                                notice.update(options);
                                            }, 60);
                                        }, 600);
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
                                        console.log("Loading...");
                                        $("#vupdate").hide();
                                        $("#vadd").show();
                                        $("#estOPC").attr("value", "anual");
                                        var a = getFechaInit();
                                        getFechaAnual(a);
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
