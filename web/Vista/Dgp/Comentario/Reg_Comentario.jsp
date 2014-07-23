<?session_start();
?>

<!DOCTYPE>
<html>
    <head>
        <meta charset="windows-1252">
        <title>Comentarios</title>
    </head>
    <body>
    <center>
        <br>
        <br>
        <br>
        <!--<label class="title">agregar comentarios</label>
                     -->
                     <form class="form" action="../Control/ControlComentario_dgp.php" method="post"> 
                         <table class="table">   
                             <input type="hidden" value="<? echo $_SESSION["IDUSUARIO"];?>" name="IDUSUARIO"  class="text-box" >    
                             <input type="hidden" name="IDDETALLE_DGP" value="<? echo $_REQUEST["iddgp"]?>" class="text-box" > 
                             <input type="hidden" name="IDAUTORIZACION"  value="<?//echo $_REQUEST["ida"]?>" class="text-box" > 
                             <input type="hidden" name="IDPASOS" value="<? echo $_REQUEST["idp"];?>" class="text-box" > 
                             
                             <tr><td>Comentario:</td><td><textarea name="COMENTARIO" required="" rows="8" cols="60" class="text-box" ></textarea></td></tr>         
                             <input type="hidden" name="USER_CREACION" value="<? echo $_SESSION["IDUSUARIO"];?>" class="text-box" >
                             <input type="hidden" name="FECHA_CREACION" class="text-box" >  
                             <input type="hidden" name="USER_MODIFICACION"   class="text-box" >     
                             <input type="hidden" name="FECHA_MODIFICACION" class="text-box">
                             <input type="hidden" value="1" name="ESTADO" class="text-box" >                       
                             <tr><td><input type="submit" name="opc"  class="submit" value="COMENTAR"></td></tr>
                         </table></form></center><br><br>
    </body>
</html>
<? include_once './List_Coment.php';?>