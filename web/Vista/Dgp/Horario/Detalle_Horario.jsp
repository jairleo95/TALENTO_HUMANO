<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="windows-1252">
        <title>Detalle Horiario</title>
        <style>
              table{
                // display:block;
                position: static;
                float: left;
                border-style: solid;
                border-width: 5px;
                margin: 2%;

            }
            body{
                height: 300px;
            }
            
        </style>
    </head>
    
    
    <body>
        <h2>Horario</h2>
        <? 
        require_once '../Modelo/ModeloHorario.php';
        require_once '../Modelo/ModeloLista.php';
        $mod_l=new ModeloLista();
        $mod= new ModeloHorario();
        
        $list_h=$mod->LIST_HORARIO($_REQUEST["iddgp"]);
        $list_l=$mod_l->LIST_H();
        ?>
        
        
     
        <?  for ($i = 0; $i < count($list_l); $i++) {?>
          <? $g=0;?>
            <? for ($s = 0; $s < count($list_h); $s++) {?>
                 
            <?  if ($list_h[$s][2]==$list_l[$i][0]) {?>

            <?if ($g==0) {?>
               <table border="1">
                   <tr><td colspan="2"><? echo $list_l[$i][1];?></td></tr>   
        
                <?}?>
               
            <tr><td><? echo $list_h[$s][3];?> </td><td><? echo $list_h[$s][4];?></td></tr>
         <? $g=$g+1;?>      
        <?}?>
     
            <?} ?>  
           </table>
            <?}?>
       
        <?  if ($_REQUEST["P2"]==true) {?>
        <a href="../Detalle_Dgp.jsp?iddgp">Continuar</a>
        <?}?>
 

    </body>
</html>
