<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<jsp:useBean id="ListarTrabajador2" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        
        <link rel="stylesheet" href="../../css1/bootstrap.min.css">
        <title></title>
    </head>
    <body>
 
                <center>
                <div class="spacing">
                <center><h3><%
                HttpSession sesion= request.getSession(true);
                String idreq = "";
                String text = request.getParameter("text");
                String iddep=(String)sesion.getAttribute("DEPARTAMENTO_ID");

                if (text.equals("1")) {
                    out.println("Requerimiento: Tiempo Completo");
                    idreq = "REQ-0001";
                }

                if (text.equals("2")) {
                    out.println("Requerimiento: Tiempo Parcial");
                    idreq = "REQ-0002";
                }

                if (text.equals("3")) {
                    out.println("Requerimiento: Medio Tiempo");
                    idreq = "REQ-0003";
                }
                    %>
                </h3></center>
                </div>
                <div >
            
                <form method="post" action="../../trabajador" class="form-inline">                    
                    
                        <div class="form-group">
                            <label class="control-label">Nombres:</label><br>
                            <input type="text"  class="form-control"  name="nom">
                        </div>
                        <div class="form-group">
                            <label class="control-label" >Apellido Paterno:</label><br>
                            <input type="text"  class="form-control"  name="ape_pat">
                        </div>
                        <div class="form-group">
                            <label class="control-label" >Apellido Materno:</label><br>
                            <input type="text"  class="form-control"  name="ape_mat">
                        </div>
                        <div class="form-group">
                            <label class="control-label" >DNI:</label><br>
                            <input type="text"  class="form-control"  onKeyPress="return checkIt(event)" name="dni">
                        </div>
                        <input type="hidden" name="opc" value="Buscar">
                        <input type="hidden" name="busc" value="Busc">
                        <input type="hidden" name="text" value="<%=text%>">
                        <div class="form-group">
                            <br>
                         <input class="btn btn-primary"  type="submit" name="busqueda"  value="Buscar">
                     
                         <a href="?cancel=true&text=<%=text%>" class="btn btn-default" role="button">Cancelar</a>
                        </div>
                   
                </form>
            </div>
            <%                int count = ListarTrabajador2.size();
                String cancel = request.getParameter("cancel");
                if (cancel != null) {
                    if (cancel.equals("true")) {
                        ListarTrabajador2.clear();
                    }
                } else {

                    if (count == 0) {
            %>
            <h1>No se encontraron registros...</h1>
            <%}
                if (count > 0) {%>
            <table class="tinytable"   >
                <tr class="tab_cabe">
                    <td>Nro</td>
                    <td>Foto</td>
                    <td>Nombre</td>
                    <td>Carrera</td>
                    <td>Acciones</td>
                </tr>
                <% for (int i = 0; i < ListarTrabajador2.size(); i++) {
                        V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                        tr = (V_Ficha_Trab_Num_C) ListarTrabajador2.get(i);
                %>
                <tr>
                    <td><%out.println(i + 1);%></td>         
                    <%
                        /*require_once '../Modelo/Modelo_Imagen.php';
                         $mod_f= new Modelo_Imagen();
                         $idf=$mod_f->LIST_FOTO_TRABAJADOR($listra[$index][0]);*/

                    %>

                    <% //if ($idf==null) {%>
                    <td><img src="../../imagenes/avatar_default.jpg"  width="80"  height="80"></td>
                        <%//}else{%>
                    <!--<td><img src="Foto.php?idf=<?echo $idf;?>"  width="80"  height="80"></td>-->
                    <% //}%>

                    <td><div ><a href="Detalle_Trabajador.jsp?idtr=<? echo $listra[$index][0]; ?>"><%=tr.getAp_paterno() + " " + tr.getAp_materno() + " " + tr.getNo_trabajador()%></a></div></td>
                    <td><%=tr.getNo_carrera()%></td>
                    <td><a href="../../dgp?idtr=<%=tr.getId_trabajador()%>&idreq=<%=idreq%>&iddep=<%=iddep%>&opc=Reg_form">Elaborar Requerimiento</a></td>

                </tr>
                <% //} %>

                <%//}}%>


                <%
                            }
                        }

                    }%> 
            </table>

            <?}}?>
   
    </center>

</body>
</html>
