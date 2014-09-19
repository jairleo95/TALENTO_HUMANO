<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>

        <link rel="stylesheet" href="../../../css/Css_Formulario/form.css"  type="text/css" > 
        <script language="javascript" type="text/javascript" src="../../../js/JQuery/jQuery.js"></script>

        <script type="text/javascript">
            $(document).ready(
                    function() {
                        $("#as").focus();
                    }
            );
        </script>
    </head>
    <body>
    <center>
        <label class="title">DATOS DEL PADRE, MADRE Y CONYUGUE</label>

        <form class="form" action="../../../familiar"> 
            <div >
                <table class="table" >  
                    <tr><td colspan="4"><div class="sub_title"><label class="label">Datos del Padre y Madre</label></div></td></tr>

                    <tr><td>Apellidos y Nombres del Padre:</td><td><input type="text" name="APELLIDOS_NOMBRES_PADRE"    class="text-box"  id="as" required="" maxlength="50"></td></tr>         
                    <tr><td>Apellidos  y Nombres de la Madre:</td><td><input type="text" name="APELLIDOS_NOMBRES_MADRE"  class="text-box" required="" maxlength="50"></td></tr>        
                </table>  
            </div>
            <div style="display: //none;" >
                <table  class="table">
                    <tr><td colspan="4"><div class="sub_title"><label class="label">Datos del Cónyugue</label></div></td></tr>
                    <tr><td>¿Trabaja Upeu Conyugue?</td><td>
                            <select name="TRABAJA_UPEU_CONYUGUE"  required=""  class="text-box">
                                <option value="1">Si</option>
                                <option value="0">No</option>
                            </select>
                        </td></tr>  

                    <tr><td>Apellidos y Nombres :</td><td><input type="text" name="APELLIDO_NOMBRES_CONYUGUE" class="text-box" required="" maxlength="50"></td></tr>    
                    <tr><td>Fecha de Nacimiento:</td><td><input type="date" name="FECHA_NAC_CONYUGUE"  class="text-box" required=""></td></tr>               

                    <tr><td>Tipo Documento:</td><td>
                            <select name="TIPO_DOC_ID"  class="text-box" required="">
                                <option value=""></option>
                                <option value="1">DNI</option>
                                <option value="2">Pasaporte</option>
                            </select>
                    <tr><td>Nro de Documento:</td><td><input type="text" name="NRO_DOC" class="text-box" required="" maxlength="10"></td></tr>           
                    <tr><td>Inscripcion Vigente en Essalud:</td><td>
                            <select name="INSCRIPCION_VIG_ESSALUD"   class="text-box" required="">
                                <option value=""></option>
                                <option value="1">Si</option>
                                <option value="0">No</option>
                            </select>
                        </td></tr>
                </table>
            </div>
            <div>
                <table class="table">
                    <input type="hidden" name="IDDATOS_TRABAJADOR"  value="<%=request.getParameter("idtr")%>" class="text-box" >  

                    <tr><td><input type="submit" name="opc"  class="submit" value="REGISTRAR"></td></tr>

                </table>
            </div>
        </form></center><br><br>
</body>
</html>
