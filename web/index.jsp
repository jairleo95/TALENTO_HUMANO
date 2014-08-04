<%-- 
    Document   : index
    Created on : 07-jul-2014, 10:52:37
    Author     : Alfa.sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css1/bootstrap.css" rel="stylesheet" >
        <link href="css1/signin.css" rel="stylesheet">
        <link href="css1/style.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Skranji' rel='stylesheet' type='text/css'>
        <link href="css1/cssindex.css" rel="stylesheet">
        <script src="js1/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="js1/bootstrap.min.js" type="text/javascript"></script>
        <script src="js2/index.js" type="text/javascript"></script>
        
        <title>.: RRHH :.</title> 
<script language="Javascript" type="text/javascript">
           document.oncontextmenu = function(){return false;}
</script>
</head>
<body>
       <div id="logueo"></div>
       <div id="caja_logueo">
       <div>
           <form class="form-signin" method="POST" id="formulario" action="menu">
                <h2 class="form-signin-heading">RRHH</h2>
                <input class="form-control" type="text"  id="usuario" name="username" placeholder="Usuario" autocomplete="off" autofocus >
                <input class="form-control" type="password"  placeholder="Clave" name="clave" id="clave">
                <input type="submit" id="enviar" class="btn btn-lg btn-primary btn-block" value="Iniciar Sesión" name="submit">
            </form>
        </div>
        </div>
      <div id="mensaje"></div>
       
       <!--<span></span>-->
       <footer>            
            © Copyright 2014 - UPeU - Cardumen            
        </footer>
        <hr style="border: 1px solid #999999; margin-top: 5px;">
       
</body>
</html>