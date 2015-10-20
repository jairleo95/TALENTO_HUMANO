<%-- 
    Document   : ListaUsuario
    Created on : 19/07/2015, 02:32:17 PM
    Author     : Andres
--%>

<%@page import="pe.edu.upeu.application.model.V_Var_Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pe.edu.upeu.application.model.V_List_Empleado"%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="Listar_Emp" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Rol" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Usuario_var" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/JQuery/jQuery.js" type="text/javascript"></script>
        <script src="../../js/bootstrap/bootstrap-modal.js" type="text/javascript"></script>
        <link href="../../css/smartadmin-production.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/smartadmin-skins.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
        <title>Mantenimiento de Usuarios</title>
    </head>
    <body>
        <div class="row">
            <center>
                <h1>Mantenimiento a Usuarios de  Personal</h1>
                <hr>
            </center>
        </div>
        <!-- Button trigger modal -->
        <div class="row">
            <center>
                <a class="btn btn-primary btn-lg btn-block" style="width: 50%" data-toggle="modal" data-target="#myModalNuevo">
                    <span class="fa fa-user"></span>
                    <span>Nuevo Usuario</span>
                </a> 
            </center>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="myModalNuevo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Asignar nuevo Usuario</h4>
                    </div>
                    <form class="smart-form" action="../../Usuario">
                        <div class="modal-body">

                            <fieldset>
                                <section class="col col-md-12">
                                    <label class="label">Empleado:</label>
                                    <label class="select">
                                        <select class="form-control" name="IDEMPLEADO">
                                            <option value="">[Seleccione]</option>
                                            <%for (int i = 0; i < Listar_Emp.size(); i++) {
                                                    V_List_Empleado ve = new V_List_Empleado();
                                                    ve = (V_List_Empleado) Listar_Emp.get(i);
                                            %>
                                            <option value="<%=ve.getId_empleado()%>">
                                                <%=ve.getNo_trabajador()%>
                                                <%=ve.getAp_paterno()%>
                                                <%=ve.getAp_materno()%>
                                            </option>
                                            <%}%>
                                        </select>
                                        <i></i> </label>
                                </section>
                            </fieldset>
                            <fieldset>
                                <section class="col col-md-12">
                                    <label class="label">Rol:</label>
                                    <label class="select">
                                        <select class="form-control" name="IDROLES" >
                                            <option value="">[Seleccione]</option>
                                            <%for (int i = 0; i < List_Rol.size(); i++) {
                                                    Rol r = new Rol();
                                                    r = (Rol) List_Rol.get(i);
                                            %>
                                            <option value="<%=r.getId_rol()%>"><%=r.getNo_rol()%></option>
                                            <%}%>
                                        </select>
                                        <i></i> </label>
                                </section>
                            </fieldset>
                            <fieldset>

                                <section class="col col-md-6">
                                    <label class="label">Usuario:</label>
                                    <label class="input">
                                        <input type="text" required="" name="USUARIO"  >
                                        <i></i> </label>                                
                                </section>
                                <section class="col col-md-6">
                                    <label class="label">Clave:</label>
                                    <label class="input">
                                        <input type="password"  required="" name="CLAVE" > 
                                        <i></i> </label>
                                </section>
                            </fieldset>

                        </div>
                        <div class="modal-footer">
                            <footer>
                                <input type="hidden" name="opc" value="Registrar Usuario">
                                <button type="submit" class="btn btn-primary" >Registar</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </footer>

                        </div>
                    </form>               
                </div>
            </div>
        </div>
        <div class="row">
            <div class="well-lg">
                <div class=" col col-md-12">
                    <table class="table table-striped table-bordered table-hover tTabla" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombres y Apellidos</th>
                                <th>Rol</th>
                                <th>Puesto</th>
                                <th>Seccion</th>
                                <th>Area</th>
                                <th>Departamento</th>
                                <th>Usuario</th>
                                <th>Clave</th>
                                <th>Estado</th>
                                <th>Detalle</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (int i = 0; i < List_Usuario_var.size(); i++) {
                                    V_Var_Usuario v = new V_Var_Usuario();
                                    v = (V_Var_Usuario) List_Usuario_var.get(i);
                            %>
                            <tr>
                                <td>
                                    <input id="idTrabajador<%=i + 1%>" type="hidden" name="idTrabajador" value="<%=v.getId_trabajador()%>">
                                    <input id="idUsuario<%=i + 1%>" type="hidden" name="idUsuario" value="<%=v.getId_usuario()%>">
                                    <%=i + 1%>
                                </td>
                                <%--<!--<td>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                            Accion <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a class="modificar" href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Mod_Usuario_con"  >Editar</a></li>                                                                
                                            <li><a class="eliminar" id="<%=i%>">Eliminar<input class="btnId<%=i%>" type="hidden" value="<%=v.getId_usuario()%>"></a></li>
                                        </ul>
                                    </div>
                                </td>-->--%>
                                <td class="name"><a href="../../trabajador?idtr=<%=v.getId_trabajador()%>&opc=list"><%=v.getNo_trabajador() + " " + v.getAp_paterno() + " " + v.getAp_materno()%></a></td>
                                <td><%=v.getNo_rol()%></td>
                                <td><%=v.getNo_puesto()%></td>
                                <td><%=v.getNo_seccion()%></td>
                                <td><%=v.getNo_area()%></td>
                                <td><%=v.getNo_dep()%></td>
                                <td><%=v.getNo_usuario()%></td>
                                <td><a href="../../Usuario?id_Usuaio=<%=v.getId_usuario()%>&opc=Modificar_clave_1"><%=v.getPw_usuario()%> </a></td>
                                <% if (v.getEs_usuario().equals("1")) {
                                %>
                                <td><button class="desactivar btn btn-warning" id="<%=i%>">Desactivar</button></td>
                                <%} else if (v.getEs_usuario().equals("0")) {%>
                                <td><button class="activar btn btn-success" id="<%=i%>">Activar</button></td>
                                <%}%>
                                <td id="<%=i+1%>"><a class="verDetalle" href="#"><span class="fa fa-search"></span><span>Ver Detalle</span></a></td>
                            </tr>
                            <%}%> 
                        </tbody>
                    </table> 
                </div>
            </div>
            <div class="modal fade" id="myModalDetalle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Detalle</h4>
                        </div>
                        <form class="smart-form" action="../../Usuario">
                            <div class="modal-body">
                                <fieldset>
                                    <div class="col col-md-12">
                                        <label>Nombres y Apellidos</label>
                                        <label class="lbNombres"></label>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <div class="col col-md-12">
                                        <label>Puesto</label>
                                        <label class="lbPuesto"></label>
                                    </div>
                                </fieldset>



                            </div>
                            <div class="modal-footer">
                                <footer>
                                    <input type="hidden" name="opc" value="Registrar Usuario">
                                    <button type="submit" class="btn btn-primary" >Aceptar</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                </footer>

                            </div>
                        </form>               
                    </div>
                </div>
            </div>



        </div>
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var num=0;

                $('.tTabla').dataTable({
                    // Tabletools options: 
                    //   https://datatables.net/extensions/tabletools/button_options
                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'T>r>" +
                            "t" +
                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
                    "oTableTools": {
                        "aButtons": [
                            "copy",
                            "csv",
                            "xls",
                            {
                                "sExtends": "pdf",
                                "sTitle": "Empleados_PDF",
                                "sPdfMessage": "Empleados PDF Export",
                                "sPdfSize": "letter"
                            },
                            {
                                "sExtends": "print",
                                "sMessage": "Generado por AlfaTeam <i>(presiona Esc para cerrar)</i>"
                            }
                        ],
                        "sSwfPath": "../../js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
                    },
                    "autoWidth": true
                });
                /*$('.tTabla').on('click', 'tr', function () {
                 alert($(this).children('.identif').text());
                 $('#myModalDetalle').modal()
                 
                 });;*/
                $('.verDetalle').click(function () {
                    num=$(this).parent().attr('id');
                    $('.lbNombres').text($('#idTrabajador'+num).val() );
                    $('#myModalDetalle').modal();
                });

            });

        </script>


    </body>
</html>
