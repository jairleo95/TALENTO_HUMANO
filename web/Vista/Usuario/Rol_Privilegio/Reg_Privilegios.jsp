<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>
        <link rel="stylesheet" href="../../../css/Css_Formulario/form.css"  type="text/css" > 
    </head>
    <body>
        <center>
                <label class="title">HIJOS</label>
                <form class="form" action="../../../familiar"> 
                         <table class="table" >  
                             <tr><td>Nombre de Privilegio</td><td><input type="text" name="No_Link" class="text-box" required="" maxlength="30"></td></tr>      
                             <tr><td>Direccion url</td><td><input type="text" name="Di_url" class="text-box"  required="" maxlength="30"></td></tr>    
                             <tr><td>Estado Privilegio</td><td>
                                     <select name="Es_privilegio" class="text-box" required="">
                                     <option value="---"></option>
                                     <option value="1">Activado</option>
                                     <option value="0">Desactivado</option>
                                 </select> </td> </tr>
                             <tr><td>Direcion de Icono</td><td><input type="text" name="Ic_Link" class="text-box" required=""></td></tr>    
                         <tr><td colspan="2"><input type="submit" name="opc"   value="REGISTRAR PRIVILEGIO"></td></tr>
                         </table></form></center><br><br>
                 
    </body>
</html>
<%@include  file="List_Privilegios.jsp"%>
