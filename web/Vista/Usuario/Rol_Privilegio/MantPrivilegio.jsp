
<%-- 
    Document   : MantPrivilegio
    Created on : 22/07/2015, 10:22:15 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento de Privilegios</title>
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
        <div class="page-header">
            <h1 class="page-title">Mantenimiento de Privilegios</h1>
        </div>
        <div class="row">
            <div class="col col-xs-12">
                <div class="contTabla">
                    <table class="tablaT table table-responsive table-hover">
                        <thead>
                        <th>Nro</th>
                        <th>Modulo</th>
                        <th>Privilegio</th>
                        <th>Estado</th>
                        <th>Opciones</th>
                        </thead>
                        <tbody class="tbodys">

                        </tbody>
                    </table>
                </div>

            </div>
        </div>




        <script src="../../../js/jquery-1.3.2.min.js" type="text/javascript"></script>
        <script src="../../../js/plugin/jquery-nestable/jquery.nestable.min.js"></script>
        <script src="../../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                //$('.tablaT').DataTable();

                listar_tabla();
                function listar_tabla() {
                    $.post("../../../Privilegio?opc=ListPrivilegio", function (objJson) {
                        var lista = objJson.lista;
                        alert(objJson);
                        if (lista.length > 0) {
                            crearTabla();
                            var t="";
                            for (var i = 0; i < lista.length; i++) {
                                t+="<tr>";
                                t+="<td>"+(i+1)+"</td>";
                                t+="<td>"+lista[i].no_md+"</td>";
                                t+="<td>"+lista[i].no_pr+"</td>";
                                t+="<td>"+lista[i].es_pr+"</td>";
                                t+="<td><a>Modificar</a></td>";
                                t+="</tr>";
                            }
                            $('.tbodys').append(t);
                            //$('.tablaT').DataTable();
                            
                        }
                    });
                }
                function crearTabla() {
                    var t = "";
                    t += '<table class="tablaT table table-responsive table-hover">';
                    t+='<thead>';
                    t+='<th>Nro</th>';
                    t+='<th>Modulo</th>';
                    t+='<th>Privilegio</th>';
                    t+='<th>Estado</th>';
                    t+='<th>Opciones</th>';
                    t+='</thead>';
                    t+='<tbody class="tbodys">';
                    t+='</tbody>';
                    t+='</table>';
                    $('.contTabla').empty();
                    $('.contTabla').append(t);
                }
            });
        </script>


    </body>
</html>
