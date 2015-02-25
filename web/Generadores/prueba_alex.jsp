<%-- 
    Document   : prueba_alex
    Created on : 25/02/2015, 09:07:39 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("button").click(function(){
        $.post("demo_test_post.asp",
        {
          name: "Donald Duck",
          city: "Duckburg"
        },
        function(){
            alert();
            $.post("../dgp",function(){alert()});
        });
    });
});
</script>
</head>
<body>

<button>Send an HTTP POST request to a page and get the result back</button>

</body>
</html>