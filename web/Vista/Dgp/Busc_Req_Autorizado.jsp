<%@page import="pe.edu.upeu.application.model.Direccion"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.Area"%>
<jsp:useBean class="java.util.ArrayList" scope="application"  id="List_Area"/>
<jsp:useBean class="java.util.ArrayList" scope="application"  id="Listar_Requerimiento"/>
<jsp:useBean class="java.util.ArrayList" scope="application"  id="Listar_Direccion"/>
<%
    HttpSession sesion = request.getSession(true);
    String id_user = (String) sesion.getAttribute("IDUSER");
    String id_dep = (String) sesion.getAttribute("ID_DEPARTAMENTO");
    String id_rol = (String) sesion.getAttribute("IDROL");
    if (id_user != "") {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Requerimientos Autorizados</title>
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">

        <style>

        </style>
    </head>
    <body>  
        <div class="spacing">
            <center><h1 class="spacing" style="font-weight: bold;">Requerimientos Autorizados</h1></center> 
        </div>
    <center>
        <br>
        <div id="contenido">

            <div   >
                <!--style="padding-left: 30px"-->
                <form class="form-inline" id="frm_filtro" method="post" action="" name="formulario">
                    <div class="row">
                        <div class="form-group" >
                            <label>Fecha inicio:</label><br>
                            <input type="date"  class="form-control" name="del"  length="45" style="width: 250px" />
                        </div>
                        <div class="form-group" >
                            <label>Fecha fin:</label><br>
                            <input type="date"  class="form-control" name="al" size="45" maxlength="100" style="width: 250px" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label>Nombres y Apellidos :</label><br>
                            <input type="text"  class="form-control" name="nom_ape"  style="width: 250px"   />
                        </div>
                        <div class="form-group">  
                            <label>Area :</label><br>
                            <select name="area"  id="id_a" class="form-control" style="width: 250px" >
                                <option value="">[Seleccione]</option>
                                <%
                                    for (int i = 0; i < List_Area.size(); i++) {
                                        Area a = new Area();
                                        a = (Area) List_Area.get(i);
                                %>
                                <option value="<%=a.getId_area()%>"><%=a.getNo_area()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group" >
                            <label>Sección :</label><br>
                            <!-- <input type="text" name="seccion" class="form-control" style="width: 250px" />-->
                            <select name="seccion" class="form-control" style="width: 250px" >

                            </select>
                        </div>

                        <div class="form-group">
                            <label>Puesto :</label><br>
                            <!--<input type="text" name="puesto" class="form-control" style="width: 250px"/>-->
                            <select class="sel_pues" name="puesto" class="form-control" style="width: 250px" >

                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label>Sueldo :</label><br>
                            <input type="text" name="sueldo" class="form-control" style="width: 250px"  maxlength="10">
                        </div>
                        <div class="form-group">
                            <label>Requerimiento :</label><br>
                            <select name="motivo" class="form-control" style="width: 250px" > 
                                <option value="0">[Seleccione]</option>
                                <%
                                    for (int s = 0; s < Listar_Requerimiento.size(); s++) {
                                        Requerimiento r = new Requerimiento();
                                        r = (Requerimiento) Listar_Requerimiento.get(s);
                                %>
                                <option value="<%=r.getId_requerimiento()%>"><%=r.getNo_req()%></option>
                                <% } %>

                            </select>
                            <input type="hidden" name="iduser" value="<? echo $iduser; ?>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label>Proceso :</label><br>
                            <select name="proceso" class="form-control" style="width: 250px">
                                <option value="0">[Seleccione]</option>
                                <%
                                    for (int s = 0; s < Listar_Requerimiento.size(); s++) {
                                        Requerimiento r = new Requerimiento();
                                        r = (Requerimiento) Listar_Requerimiento.get(s);
                                %>
                                <option value="<%=r.getId_requerimiento()%>"><%=r.getNo_req()%></option>
                                <% } %>
                            </select>
                        </div>

                        <%//if (id_rol.equals("1")) { %>
                        <div class="form-group">
                            <label>Departamento :</label><br>
                            <select name="dep" class="form-control" style="width: 250px">
                                <option value="0" ></option>
                                <?  for ($kk = 0; $kk < count($list_d); $kk++) {?>
                                <option value=""><?echo $list_d[$kk][1];?></option>
                            </select>
                        </div>
                    </div>
                    <? //} ?>
                    <div class="row">



                        <div class="form-group">
                            <label>Dirección :</label><br>
                            <select name="dir" class="form-control" style="width: 250px">
                                <<%
                                    for (int s = 0; s < Listar_Direccion.size(); s++) {
                                        Direccion d = new Direccion();
                                        d = (Direccion) Listar_Direccion.get(s);
                                %>
                                <option value="<%=d.getId_direccion()%>"><%=d.getNo_direccion()%></option>
                                <% } %>
                            </select>
                        </div>
                        <%//}%>
                    </div>
                    <hr/>

                    <div class="row">
                        <div class="form-group">                            
                            <button type="button" class="btn btn-primary" id="btnfiltrar">Buscar</button>
                        </div>
                        <div class="form-group">  
                            <a href="javascript:;"  id="btncancel" class="btn btn-primary" >Cancelar</a>
                        </div>
                    </div>       





                </form>

            </div> 

            <br>
            <br>
            <div class="container">
                <table     id="data" class="table">
                    <thead class="tab_cabe">
                        <tr class="tr">
                            <td style="width: 230px;" ><span title="NOMBRE_P">Nombres y Apellidos</span></td>
                            <td  ><span title="DEPARTAMENTO" >Departamento</span></td>
                            <td  ><span title="AREA" >Area</span></td>
                            <td><span title="SECCION">Sección</span></td>
                            <td><span title="PUESTO">Puesto</span></td>
                            <td><span title="SUELDO">Sueldo</span></td>
                            <!-- <th><span title="PROCESO">Proceso</span></th>-->
                            <td><span title="MOTIVO">Requerimiento</span></td>
                            <td><span title="FECHA_CREACION">Fecha de Autorización</span></td>
                        </tr>
                    </thead>

                    <tbody class="tbodys">


                    </tbody>
                </table>

            </div>



        </div>
    </center>

</body>
<script>
    $(document).ready(function() {
        var b = $(".tbodys");
        /* $.ajax({
         data:$("#frm_filtro").serialize(),
         type:"POST",
         dataType:"json",
         url:"../../Ajax/Ajax_Dgp/Ajax_Dgp_Aut.jsp"
         
         }
         
         });
         */


        $("#btnfiltrar").click(
                function() {


                    $.post("../../ajax/Ajax_Dgp/Ajax_Dgp_Aut.jsp", $("#frm_filtro").serialize(), function(objJson) {
                        b.empty();
                        var list = objJson.lista;
                        for (var i = 0; i < list.length; i++) {
                            b.append("<tr>");
                            b.append("<td>" + list[i].nombre_p + "</td>");
                            b.append("<td>" + list[i].dep + "</td>");
                            b.append("<td>" + list[i].no_area + "</td>");
                            b.append("<td>" + list[i].no_seccion + "</td>");
                            b.append("<td>" + list[i].no_puesto + "</td>");
                            b.append("<td>" + list[i].ca_sueldo + "</td>");
                            b.append("<td>" + list[i].req + "</td>");
                            b.append("<td>" + list[i].fecha_contratacion + "</td>");
                            b.append("</tr>");
                            ;
                        }
                    }
                    );

                }
        );
        $("#btncancel").click(
                function() {
                    document.formulario.reset();
                    b.empty();
                    html = '<tr><td colspan="8" align="center">Haga la busqueda por algunos de los filtros...</td></tr>'
                    $(".tbodys").html(html);
                }
        );

        

    }
    );


</script>
<script>

    $("#id_a").change(function() {
        var id_area = ($("#id_a").val());
        //alert(id_area);
    });


    function Listar_Provincia_A() {

        var s = $(".sel_pues");
        $.post("../../", "opc=Listar_P&" + "id_area=" + id_area, function(objJson) {
            s.empty();
            var lista = objJson.lista;
            s.append("<option value='' > [SELECCIONE] </option>");
            for (var j = 0; j < lista.length; j++) {
                if ($(".pro_a").val() == lista[j].id) {
                    s.append("<option value='" + lista[j].id + "' selected=''> " + lista[j].descripcion + "</option>");

                } else {
                    s.append("<option value='" + lista[j].id + "'> " + lista[j].descripcion + "</option>");
                }
            }

        });
    }


</script>

</html>
<%        }%>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>