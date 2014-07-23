<!DOCTYPE html >

<html>
    <head>
        <meta charset="windows-1252">
        <title>Comentarios DGP</title>
        <style>
            .Coment{
                 padding:5px;
 border:solid 1px #6b00c5;
 border-radius:5px;
 background-color: #fcfcfc; 
 height: 200px;
width: 300px;
margin: 5px;
            }
            td{
                
                padding: 10px;
            }
            .tab{
                border-radius: 13px;
                background-color: white;
                 text-align: center;
            }
            .Coment:focus{
    box-shadow:0 0 13px #6b00c5;
 }
.Coment:hover{
   background-color: white;
 }
        </style>
    </head>
    
    <body>

    <center>
     
            <?  
            require_once '../Modelo/ModeloComentario_dgp.php';
            $mdc=new ModeloComentario_dgp();
            $list_c=$mdc->LIST_COMENTARIO($_REQUEST["iddgp"]);
            for ($f = 0; $f < count($list_c); $f++) {?>
        <table border="1" class="tab" style="width: 800px;"> 
    <br>
    <tr><td>Usuario:</td><td><? echo $list_c[$f][15];?></td><td rowspan="5" > <textarea class="Coment" readonly="" ><? echo $list_c[$f][4];?></textarea> </td></tr>
            <tr><td>Puesto:</td><td><? echo $list_c[$f][17];?></td></tr>
            <tr><td>Area:</td><td><? echo $list_c[$f][19];?></td></tr>
            <tr><td >Departamento:</td><td><? echo $list_c[$f][21];?></td></tr>
            <tr><td>Fecha:</td><td><? echo $list_c[$f][6];?></td></tr>
          
             </table>
                <?}?>
            
            <?if (count($list_c)==0) {
                echo '<h1>No se ha registrado ningun comentario...</h1>';
            }?>
              
       
    </center>
    </body>
</html>

