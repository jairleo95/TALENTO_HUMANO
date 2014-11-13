<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="List_Privilegio" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Rol" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?
require_once '../Modelo/modelorol.php';
require_once '../Modelo/ModeloPrivilegio.php';
$modp=new ModeloPrivilegio();
$modr=new modelorol();
$list_rol=$modr->ListarRol();
$list_pri=$modp->LIST_PRIVILEGIO();
?>
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>
    </head>
    <body>
    <center>
        <label class="title">OTORGAR PRIVILEGIOS</label>
        <form class="form" action="../Control/ControlPrivilegio.php" method="post"> 
            <table class="table" >    
                <% for(int i=0;i<List_Rol.size();i++){
                            Rol r = new Rol();
                            r = (Rol) List_Rol.get(i);
                        %>
                <tr><td>Nombre Rol:</td><input type="text" name="Nombre_Rol" value="<%%>"></tr>
                <tr><td>Nro_orden:</td><td><input type="text" name="NRO_ORDEN" class="text-box" value="<%%>"></td></tr>                                 
               <tr><td>Privilegio:</td><td>
                       <select name="IDPRIVILEGIO" >
                           <option>------</option>
                           <?  for ($f = 0; $f < count($list_pri); $f++) {?>
                           <option value="<?echo $list_pri[$f][0];?>"><?echo $list_pri[$f][1];?></option>
                           <?}?>
                       </select>
                       
                     
                   </td></tr>                       
               
               <input type="hidden" name="ESTADO" value="1" class="text-box" >                           
               <tr><td><input type="submit" name="opc"  class="submit" value="OTORGAR"></td></tr>
           </table>
       </form>
   </center>
    <br><br>

    </body>
</html>
<%@include file="" %>