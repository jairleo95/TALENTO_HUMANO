<%-- 
    Document   : Prueba_Mail
    Created on : 12-mar-2015, 10:04:29
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
        <form action="autorizacion" method="post">
            De :<input type="email" name="from" value="" />
            Para :<input type="email" name="to" value="" />
            Asunto :<input type="text" name="asunto" value="" />
            Cuerpo :<textarea name="cuerpo" ></textarea>
            <input type="hidden" name="opc" value="Enviar_Correo" />
            <br><button type="submit">Enviar</button>
        </form>
        
        <div dir="ltr"><span style="font-size:13px">Estimado(a) Colaborador(a),</span><div style="font-size:13px"><br></div><div style="font-size:13px">Compartimos la siguiente información</div><div style="font-size:13px"><br></div><div style="font-size:13px">- Bienestar para el trabajador</div><div style="font-size:13px">- Reglamento de Control de Asistencia<br></div><div style="font-size:13px">-&nbsp;Reglamento de trabajo</div><div style="font-size:13px">- Boletín Informativo - sistema pensionario</div><div style="font-size:13px"><br></div><div style="font-size:13px">Saludos Cordiales</div><div class="yj6qo ajU"><div id=":1jm" class="ajR" role="button" tabindex="0" aria-label="Muestra el contenido reducido" data-tooltip="Muestra el contenido reducido"><img class="ajT" src="//ssl.gstatic.com/ui/v1/icons/mail/images/cleardot.gif"></div></div><span class="HOEnZb adL"><font color="#888888"><span><font color="#888888"><div><br></div>-- <br><div><div>Gerencia del Talento Humano</div>Universidad Peruana Unión<br><br></div></font></span></font></span></div>
    </body>
</html>
