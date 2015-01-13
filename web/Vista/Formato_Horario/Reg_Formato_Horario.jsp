<%-- 
    Document   : Reg_Formato_Horario
    Created on : 13/01/2015, 10:24:45 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../../formato_horario">
            <header>FORMATO HORIARIO</header>
            <fieldset>
            TURNO:<br>
            <select name="NO_TURNO">
                <option value="">SELECCIONE</option>
                <option value="T01">Turno Mañana</option>
                <option value="T02">Turno Tarde</option>
            </select>
            DÍA:<br>
            <select name="NO_DIA">
                <option value="">SELECCIONE</option>
                <option value="lun">Lunes</option>
                <option value="mar">Martes</option>
                <option value="mie">Miercoles</option>
                <option value="jue">Juevez</option>
                <option value="vie">Viernes</option>
                <option value="sab">Sabado</option>
                <option value="dom">Domingo</option>
            </select>
            HORA DESDE:
            <input type="text" name="HO_DESDE"/>
            HORA HASTA:
            <input type="text" name="HO_HASTA"/>
            <input type="hidden" name="ES_F_HORARIO" value="1"/>
            </fieldset>
        </form>
    </body>
</html>
