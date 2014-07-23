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
                <tr><td>Rol:</td><td>
                        <select  name="IDROLES">
                    <option>----</option>
                        <?  for ($i = 0; $i < count($list_rol); $i++) {?>
                    <option value="<? echo $list_rol[$i][0];?>"><?echo $list_rol[$i][1];?></option>
                            <?}?>
                        </select>
                    </td></tr>
               <tr><td>Nro_orden:</td><td><input type="text" name="NRO_ORDEN" class="text-box" ></td></tr>                                 
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
