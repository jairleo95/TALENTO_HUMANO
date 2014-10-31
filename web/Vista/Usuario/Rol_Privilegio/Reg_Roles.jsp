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

    <center><label class="title">ROLES</label><form class="form" action="../Control/ControlRoles.php" method="post"> <table class="table">              
                <tr><td>Nombre:</td><td><input type="text" name="NOMBRE" class="text-box" ></td></tr>                    
                <tr><td><input type="submit" name="opc"  class="submit" value="REGISTRAR"></td></tr>
            </table>
        </form>
    </center>
    <br><br>
</body>
</html>
<%@include  file="List_Roles.jsp"%>