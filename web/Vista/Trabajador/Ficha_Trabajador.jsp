<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%
    HttpSession sesion = request.getSession(true);
    String iddep = (String) request.getAttribute("DEPARTAMENTO_ID");

%>
<jsp:useBean id="ListarTrabajador" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Carrera" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Fichas de Trabajador</title>
        <link rel="stylesheet" href="../../css/Css_Trabajador/style.css" />
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <script type="text/javascript" src="../../js/Js_Alerta/alertify.js"></script>
        <link rel="stylesheet" href="../../css/Css_Alertas/alertify.core.css" />
        <link rel="stylesheet" href="../../css/Css_Alertas/alertify.default.css" />
        <script type="text/javascript"  src="../../js/Js_Alerta/Alertas.js"></script>
    </head>
    <SCRIPT LANGUAGE="JavaScript">
        function checkIt(evt) {
            evt = (evt) ? evt : window.event
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                status = "This field accepts numbers only."
                return false
            }
            status = ""
            return true
        }
    </SCRIPT>

    <body style="height: 1024px;">  

        <div class="spacing">
            <center><h1 class="spacing">Fichas de Trabajador</h1></center>


        </div>
    <center>
        <div class="container theme-showcase">
            <table  style="width: 80%;" >
                <tr>
                    <!--<td style="width: 800px;  " colspan="2"> Lista de Fichas (<? //echo $s; ?>)</td>-->
                    <td>Elaborar Ficha:</td><td><a href="Reg_Trabajador.jsp"    class="button blue" >Agregar Nueva Ficha</a></td>    
                    <!--<button onclick="Hola();">Hola</button>
                    -->
                </tr>
                <tr>
            </table>  
            <div>
                <form method="post">
                    <table style="width: 80%; " >
                        <td>Nombres: <input type="text"  class="text-box"  name="nom"></td>
                        <td>Apellido Paterno: <input type="text"  class="text-box"  name="ape_pat"></td>
                        <td>Apellidos Materno: <input type="text"  class="text-box"  name="ape_mat"></td>
                        <td>DNI : <input type="text" class="text-box" onKeyPress="return checkIt(event)" name="dni"></td>
                        <td><input class="button blue"  type="submit" name="Buscar"  value="Buscar"></td>
                        <!--<td><input class="button blue"  type="submit" name="all"  value="Todos"></td>
                        --><td><a class="button blue"href="trabajador"  >Cancelar</a></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%                int count = ListarTrabajador.size();
            if(count==0){            
            %>
            <h1>No se encontraron registros...</h1>
            <%}else{%>
            <table class="tinytable"   >
                <tr class="tab_cabe">
                    <td>Nro</td>
                    <td>Foto</td>
                    <td>Nombre</td>
                    <td>Carrera</td>
                    <td>Acciones</td>
                </tr>
                <% for(int i=0;i<ListarTrabajador.size();i++){
                V_Ficha_Trab_Num_C tr=  new V_Ficha_Trab_Num_C();
                tr= (V_Ficha_Trab_Num_C)ListarTrabajador.get(i);
                %>
                <tr>
                    <td><%out.println(i+1);%></td>         
                    <?
                    require_once '../Modelo/Modelo_Imagen.php';
                    $mod_f= new Modelo_Imagen();
                    $idf=$mod_f->LIST_FOTO_TRABAJADOR($listra[$index][0]);
                    ?>

                    <? if ($idf==null) {?>
                    <td><img src="../../imagenes/avatar_default.jpg"  width="80"  height="80"></td>
                    <?}else{?>
                    <td><img src="Foto.php?idf=<?echo $idf;?>"  width="80"  height="80"></td>
                    <?}?>

                    <td><div ><a href="Detalle_Trabajador.jsp?idtr=<? echo $listra[$index][0]; ?>"><? echo strtoupper($listra[$index]["1"] . ' ' . $listra[$index]["2"]. ' ' . $listra[$index]["3"]); ?></a></div></td>
                    <td><%for(int l=0;l<List_Carrera.size() ;l++){ 
                            if(List_Carrera.get(i).equals(tr.getId_trabajador())){
                            out.println(List_Carrera.get(i));
                            }  
                            
                        }%>
                    </td>
                    <td>
                        <?
                        require_once '../Modelo/ModeloDGP.php';
                        $mddgp= new ModeloDGP();
                        $num=$mddgp->VAL_TRA_DGP($listra[$index][0]);

                        $n_v=$mddgp->VAL_OPC_DGP($listra[$index][0]);
                        //  echo $n_v;
                        if ($n_v>0) {?>
                        <a href="List_Dgp_Trabajador.jsp?idtr=<? echo $listra[$index][0];?>">Ver DGP's</a>
                        <?}else{?> 
                        <?if ($listra[$index][62]>0) {?>
                        <? if ($num[0][0]!=0) {?>
                        <a href="List_Dgp_trabajador.jsp?idtr=<? echo $listra[$index][0];?>">Ver DGP's</a>
                        <?}?>
                        <a href="../Contrato/Detalle_Info_Contractual.jsp?idtr=<? echo $listra[$index][0];?>">Ver Contratos</a>
                        <?}else{?>
                        <a href="../Dgp/Reg_Dgp.jsp?idtr=<?echo $listra[$index][0];?>">Solicitar Contratación</a>        
                        <?  if ($_SESSION["IDROL"]==6) {?>
                        <a href="../Contrato/Reg_Contrato.jsp?idtr=<?echo $listra[$index][0];?>">ELaborar Contrato</a>                       
                        <?}?>
                        <?}}?>
                    </td>

                </tr>
                <? } ?>
            </table>
            <?}}?>
            <%}}%>
        </div>
    </center>
</body>

</html>
