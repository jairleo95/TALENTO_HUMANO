<%    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.V_Var_Usuario"%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="List_Usuario_var_id" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Rol" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Mantenimiento de Usuarios</title>
        <style type="text/css">
            .contenedor{
                margin-left: 1%;
                width: 98%;
            }
        </style>

    </head>
    <body class="body">
        <div class="row">
            <center>
                <h1>Mantenimiento a Usuarios de  Personal</h1>
                <hr>
            </center>
            <div class="contenedor">
                <article class="col-sm-12">
                    <div id="wid-id-0" class="jarviswidget" role="widget">
                        <div>
                            <div class="jarviswidget-editbox">
                            </div>
                            <div class="widget-body no-padding ">
                                <div class="smart-form">
                                    <%for (int i = 0; i < List_Usuario_var_id.size(); i++) {
                                            V_Var_Usuario v = new V_Var_Usuario();
                                            v = (V_Var_Usuario) List_Usuario_var_id.get(i);
                                    %>
                                    <fieldset>
                                        <h2>Editar Usuario </h2>
                                    </fieldset>
                                    <fieldset>
                                        <section class="col col-4">
                                            <label class="label">Empleado:</label>
                                            <label class="input state-disabled">
                                                <input type="text" disabled="" value="<%=v.getNo_trabajador() + " " + v.getAp_paterno() + " " + v.getAp_materno()%>">
                                            </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="label">Rol:</label>
                                            <label class="select">
                                                <select class="idRol" name="IDROLES">
                                                    <option value="">[Seleccione]</option>
                                                    <%for (int u = 0; u < List_Rol.size(); u++) {
                                                            Rol r = new Rol();
                                                            r = (Rol) List_Rol.get(u);
                                                            if (v.getId_rol().trim().equals(r.getId_rol())) {
                                                    %>
                                                    <option value="<%=r.getId_rol()%>" selected=""><%=r.getNo_rol()%></option>
                                                    <%} else {%>
                                                    <option value="<%=r.getId_rol()%>"><%=r.getNo_rol()%></option>
                                                    <%}%>
                                                    <%}%>
                                                </select>
                                                <i></i> </label>
                                        </section>
                                        <section class="col col-4">
                                            <label class="label">Usuario:</label>
                                            <label class="input">
                                                <input type="text" class="nUser" required="" name="USUARIO" value="<%=v.getNo_usuario().trim()%>">
                                                <i></i> </label>                                
                                        </section>
                                    </fieldset>
                                    <footer>
                                        <!--<input type="hidden" name="opc"  class="submit" value="Mod_Usuario_con_2">-->
                                        <input type="hidden"  class="idUser" value="<%=v.getId_usuario()%>">
                                        <button  id="mod" class="btn btn-primary btn-sm" onclick="javascript: editr();">Modificar</button>
                                        <button  class="btn btn-default btn-sm" onclick="window.history.back();" value="Atras">Atras</button>
                                    </footer>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>

    </body>
    <script type="text/javascript">
        function editr() {
            pageSetUp();
            var rol;
            var idUsuario;
            var nUsuario;
            idUsuario = $('.idUser').val();
            rol = $('.idRol').val();
            nUsuario = $('.nUser').val();
            $.SmartMessageBox({
                title: "Modificar usuario!",
                content: "¿Esta seguro de guardar los cambios en el usuario?",
                buttons: '[No][Yes]'
            }, function(ButtonPressed) {
                if (ButtonPressed === "Yes") {
                    $.post("../../Usuario", "ID_USUARIO=" + idUsuario + "&IDROLES=" + rol + "&USUARIO=" + nUsuario + "&opc=Mod_Usuario_con_2", function() {
                        $.smallBox({
                            title: "Editar Usuario",
                            content: "<i class='fa fa-clock-o'></i> <i>El Usuario ha sido modificado </i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                        window.history.back();
                    });

                }
                if (ButtonPressed === "No") {
                    $.smallBox({
                        title: "Edtar Usuario",
                        content: "<i class='fa fa-clock-o'></i> <i>Operacion Cancelada</i>",
                        color: "#C46A69",
                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                }
            });
        }
    </script>
</html>
<%@include file="List_Usuario.jsp" %>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
