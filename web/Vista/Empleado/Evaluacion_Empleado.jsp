<%-- 
    Document   : Evaluacion_Empleado
    Created on : 05-dic-2014, 15:44:19
    Author     : ALFA 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <label>Evaluar Empleado</label>
        <form>
            <table>
                <tr><td>¿El Empleado Es Jefe?</td><td>
                        <select>
                            <option value="">[SELECCIONE]</option>
                            <option value="0">No es Jefe</option>
                            <option value="1">Jefe de Sección</option>
                            <option value="2">Jefe de Area</option>
                            <option value="3">Jefe de Departamento</option>
                            <option value="4">Jefe de Dirección</option>
                        </select></td>
                </tr>
<input type="hidden" value="Reg_Evaluar_Emp" name="opc"/></td></tr>
                <tr><td></td><td><input type="submit" value="Guardar" name="Enviar"/></td></tr>
            </table>
        </form>
    </center>
    </body>
</html>
