<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.Area"%>
<jsp:useBean class="java.util.ArrayList" scope="application"  id="List_Area"/>
<jsp:useBean class="java.util.ArrayList" scope="application"  id="Listar_Requerimiento"/>
<%
    HttpSession sesion = request.getSession(true);
    String id_user = (String) sesion.getAttribute("IDUSER");
    String id_dep = (String) sesion.getAttribute("ID_DEPARTAMENTO");
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
            #contenido{
                margin: auto;

            }
            #form{
                width: 40%;
                margin: auto;

            }
         


        </style>
    </head>
    <body>  
        <div class="spacing">
            <center><h1 class="spacing" style="font-weight: bold;">Requeriemientos Autorizados</h1></center> 
        </div>
    <center>
        <br>
        <div id="contenido">
            <div id="form">

                <form id="frm_filtro" method="post" action="" name="formulario">
                    <div class="row">
                        <div class="col-xs-6">
                            <label>Fecha inicio:</label><br>
                            <input type="date"  class="form-control" name="del"  />
                        </div>
                        <div class="col-xs-6">
                            <label>Fecha fin:</label>
                            <input type="date" name="al" class="form-control" />
                            <input type="hidden" name="iddep" value="<? echo $_SESSION['DEPARTAMENTO_ID']; ?>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6">  
                            <label>Nombres y Apellidos :</label>
                            <input type="text" class="form-control" name="nom_ape"   size="25"/>
                        </div>
                        <div class="col-xs-6">  
                            <label>Area :</label><br>
                            <select name="area" class="form-control">
                                <option value="0">[Seleccione]</option>
                                <%                                    for (int i = 0; i < List_Area.size(); i++) {
                                        Area a = new Area();
                                        a = (Area) List_Area.get(i);
                                %>
                                <option value="<%=a.getId_area()%>"><%=a.getNo_area()%></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6">
                            <label>Puesto :</label>
                            <input type="text" name="puesto" class="form-control" size="25" />
                        </div>
                        <div class="col-xs-6">
                            <label>Sueldo :</label>
                            <input type="text" name="sueldo" class="form-control" size="25" maxlength="10"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6">
                            <label>Sección :</label>
                            <input type="text" name="seccion" class="form-control">
                        </div>
                        <div class="col-xs-6">
                            <label>Requerimiento :</label>
                            <select name="motivo" class="form-control" > 
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
                        <div class="col-xs-6">
                            <label>Proceso :</label>
                            <select name="proceso" class="form-control">
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
                            
                        <? //if ($_SESSION["IDROL"] == 1) { ?>
                        <div class="col-xs-6">
                            <label>Departamento :</label>
                            <select name="dep" class="form-control">
                                <option value="0" ></option>
                                <?  for ($kk = 0; $kk < count($list_d); $kk++) {?>
                                <option value="<?echo $list_d[$kk][0]?>"><?echo $list_d[$kk][1];?></option>
                                <?}?>
                            </select>
                        </div>
                    </div>
                    <? //} ?>

                    <hr/>

                    <div class="row">
                        <div class="col-xs-6">                            
                            <button type="button" class="btn btn-primary" id="btnfiltrar">Buscar</button>
                        </div>
                        <div class="col-xs-6">  
                            <a href="javascript:;"  id="btncancel" class="btn btn-primary">Cancelar</a>
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
                            <td><span title="FECHA_CREACION">Fecha de Contratación</span></td>
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

</html>
<%        }%>
