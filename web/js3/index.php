<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link type="text/css" rel="stylesheet" href="/SysDGP/CSS/estilos.css"/>
        <title>Logueo</title>
        <style type="text/css">
            body{
                font-family: arial;
                font-size: 12px;
                /*background-image: url(/SysDGP/Imagenes/fondo.png);*/
                background-image: url(/SysDGP/Imagenes/nuevo1.png);
            }
        </style>
        <script language="JavaScript">
            javascript:window.history.forward(1); //Esto es para cuando le pulse al botón de Atrás
            javascript:window.history.back(1); //Esto para cuando le pulse al botón de Adelante
            
        </script>
    </head>
    <body>
        <div id="caja">        
            <form action="Control/Operaciones.php" method="post">
            <table>
                <tr><td><input type="text" name="user" id="user" autofocus="" autocomplete="off"></td></tr>
                <tr><td><input type="password" name="clave" id="pass"></td></tr>
                <input type="hidden" name="opc" value="ingresar">
                <tr><td><input type="submit" id="botoncito" value=""></td></tr>
                
            </table>
        </form>
       </div>
</body>
</html>