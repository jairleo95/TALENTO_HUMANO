
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
                           
                             <input type="hidden" name="TRABAJADOR" value="<%=request.getParameter("idtr")%>" class="text-box" >      
                             
                             <tr><td>Apellido Paterno:</td><td><input type="text" name="APELLIDO_P" class="text-box" required="" maxlength="30"></td></tr>      
                             <tr><td>Apellido Materno:</td><td><input type="text" name="APELLIDO_M" class="text-box"  required="" maxlength="30"></td></tr>    
                             <tr><td>Nombres:</td><td><input type="text" name="NOMBRE" class="text-box"  required="" maxlength="30"></td></tr>           
                             <tr><td>Fecha de Nacimiento:</td><td><input type="date" name="FECHA_NAC" class="text-box" required=""></td></tr>   
                             <tr><td>Sexo:</td><td>
                                     <select name="SEXO" class="text-box" required="">
                                     <option value=""></option>
                                     <option value="M">Masculino</option>
                                     <option value="F">Femenino</option>
                                 </select> </td> </tr>    
                             <tr><td>Tipo de Documento</td><td>
                                     <select name="TIPO_DOC_ID" class="text-box" required="">
                                     <option value=""></option>
                                     <option value="1">DNI</option>
                                     <option value="2">Partida</option>
                                 </select>
                             </td></tr>     
                             
                             <tr><td>Numero de Documento:</td><td><input type="text" name="NRO_DOC" class="text-box" maxlength="20"></td></tr>      
                             <!--<tr><td>Presenta documento:</td><td>
                                 <select name="PRESENTA_DOCUMENTO" class="text-box">
                                     <option value=""></option>
                                     <option value="1">Si</option>
                                     <option value="2">No</option>
                                 </select>
                             </td></tr>  -->
                             <tr><td>Inscripción Vigente en Essalud:</td><td>
                                 <select  name="INSCRIPCION_VIG_ESSALUD" class="text-box" >
                                     <option value=""></option>
                                     <option value="1">Si</option>
                                     <option value="0">No</option>
                                 </select></td></tr> 
                         
                             <tr><td>Estudiante de Nivel Superior:</td><td>
                                    <select name="ESTUD_NIV_SUPERIOR" class="text-box">
                                     <option  value=""></option>
                                     <option  value="1">Si</option>
                                     <option  value="0">No</option>
                                 </select>
                                </td></tr>  
                         <tr><td colspan="2"><input type="submit" name="opc"  class="submit" value="REGISTRAR HIJO"></td></tr>
                         </table></form></center><br><br>
                 
    </body>
</html>
<%@include  file="List_Hijo.jsp"%>
