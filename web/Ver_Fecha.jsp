<%-- 
    Document   : Ver_Fecha
    Created on : 27-nov-2014, 15:21:53
    Author     : ALFA 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <script type="text/javascript" src="js/JQuery/jQuery.js" ></script>
    
    <script>
        $(document).ready(
                function(){
                    $(".fecha").change(function(){
                      
        $(".ver").text($(".fecha").val());
                        
                    });
                });
        
    </script> 
    <body>
        <input  type="date" class="fecha"/>
        <p class="ver"></p>
    </body>
</html>
