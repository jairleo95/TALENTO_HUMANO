<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>
    </head>
    <body>
        <?php
        // put your code here
        ?>
        <center>
            <form action="../Control/ControlUsuario.php">
            <table>
                <input type="hidden" name="iduser" value="<? echo $_REQUEST["idu"];?>">
                <input type="hidden" name="user"  value="<? echo $_REQUEST["us"];?>">
                <tr><td>Clave Antigua:</td><td><input type="password" name="cl"></td></tr>
                <tr><td>Clave  Nueva:</td><td><input type="password" name="ca_2"></td></tr>
                <tr><td>Repita la Clave  Nueva:</td><td><input type="password" name="ca_1"></td></tr>
                <input type="hidden" value="opc" name="opc">
                <tr><td><input type="submit" name="Cambiar" value="Cambiar"></td></tr>
            </table>
            </form>
        </center>
    </body>
</html>
