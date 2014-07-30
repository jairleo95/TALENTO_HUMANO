<% 
    
   HttpSession sesion = request.getSession(true);
String id_user=(String)sesion.getAttribute("IDUSER");
if (id_user!="") {
   /* require_once '../Modelo/modelousuario.php';
    require_once '../Modelo/Modelo_Imagen.php';
    $mdu= new modelousuario();
    $list_u= $mdu->LIST_ID_USER($_SESSION["IDUSER"]);
    $mod_f= new Modelo_Imagen();
    $idf=$mod_f->LIST_FOTO_TRABAJADOR($list_u[0][0]);

    */
    
    %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="windows-1252">
        <title>Perfil de Usuario</title>
        <link rel="stylesheet" type="text/css" href="../../css/Css_Perfil_Usuario/STYLE_USER_PROFILE.css">
        <style type="text/css">
            body{
                font-size: 14px;
            }
            #cajon{
                width: 580px;
                height: 300px;
            }
            #caja1{
                float: left;
                width: 150px;
                height: 250px;
                
             }
            #caja2{
                float: left;
                width: 400px;
                height: 250px;
                border-left: 1px solid #adafb0;
                margin-left: 10px;
                padding-left: 5px;
            }
            .cajita{
                width: 100%;
                height: 30px;
            }
            .cajita2{
                float: left;
                width: 150px;
                height: 100%;
                text-align: right; 
                font-family: arial;
                color: #7d8283;
                line-height: 30px;
                 
            }
            .cajita3{
                float: right;
                width: 245px;
                height: 100%;
                text-align: left; 
                padding-left: 5px;
            }
            #imagen{
                width: 150px;
                height: 200px;
                border: 1px solid #adafb0;               
            }
            #mod_imagen{
                width: 150px;
                height: 35px;
                text-align: center;
                padding-top: 15px;
            }
                #boton1{
                background:#0095cd;
                border:solid 1px #dadada;
                padding:5px;
                width:100px;
                text-align:center;
                transition:all 2s;
                color:#000;
                
            }
            #boton1{   
                border-top-left-radius:20px;
                border-bottom-right-radius:20px;
                color:#000;
                background:-moz-linear-gradient(#adafb0 0%, #fff 100%);
                background:-webkit-linear-gradient(#adafb0 0%, #fff 100%);
            }
            #boton1:hover{
                border-top-left-radius:0px;
                border-bottom-right-radius:0px;
                border-bottom-left-radius:10px;
                border-top-right-radius:10px;
                background:-moz-linear-gradient(#adafb0 0%, #fff 100%);
                background:-webkit-linear-gradient(#adafb0 0%, #fff 100%);
            }
            a{
                text-decoration: none;
            }
            input{
                width: 245px;
                border: 1px solid #dadada;
                height: 25px;
                padding-left: 5px;
                color: #aaadae;
            }
        </style>
    </head>
    <body>
    <center>
        <div style="width: 580px; border: 1px solid #fff; background: #1294bd;color: #fff; font-weight: bold;">PERFIL DEL USUARIO</div>
        <div style="width: 580px; margin-bottom: 20px;"><hr></div>
        <? for ($j = 0; $j < count($list_u); $j++) {?>
            <div id="cajon">
                <div id="caja1">
                    <div id="imagen">
                         <? if ($idf==null) {?>
                         <img src="../../imagenes/avatar_default.jpg"  width="120"  height="140" style="padding: 20px 14px 0px 14px;">              
                      <?}else{?>
                      <img src="Foto.php?idf=<? echo $idf;?>"  width="120" style="padding: 20px 14px 0px 14px;"  height="140" >
                      <?}?>
                    </div>
                    <div id="mod_imagen"><a href="Sub_fotos.php?idtr=<? echo $list_u[0][0] ;?>" id="boton1">Cambiar imagen</a></div>
                </div>
                <form action="../Control/ControlUsuario.php" method="post">
                <div id="caja2">
                <div class="cajita">
                    <div class="cajita2">Apellido Paterno:</div><div class="cajita3"><input type="text" name="ap_p" value="<?echo $list_u[$j][17];?>"></div>
                </div>
                <div class="cajita">
                    <div class="cajita2">Apellido Materno:</div><div class="cajita3"><input type="text" name="ap_m" value="<?echo $list_u[$j][18];?>"></div>
                </div>
                <div class="cajita">
                    <div class="cajita2">Nombres:</div><div class="cajita3"><input type="text" name="nombres" value="<?echo $list_u[$j][16];?>"></div>
                </div>
                    <input type="hidden" name="idtr" value="<? echo $list_u[0][0] ;?>">
                    <input type="hidden" name="idu" value="<? echo $_SESSION['IDUSER'] ;?>">
                    <input type="hidden" name="ui" value="<? echo $list_u[0][4] ;?>">
                        <input type="hidden" name="opc" value="Modificar">
              <!--  <div class="cajita">
                    <div class="cajita2">Puesto:</div><div class="cajita3"><input type="text" name="puesto" value="<?echo $list_u[$j][6];?>" disabled="" style="background: #fff;"></div>
                </div>
               --> 
               <div class="cajita">
                        <div class="cajita2">Usuario:</div><div class="cajita3"><input type="text" name="usuario" value="<? echo $list_u[$j][4];?>"></div>
                </div>
             <div class="cajita">
                 <div class="cajita2">Ingresar Clave para modificar:</div><div class="cajita3"><input type="password" name="clave"  required="" title="Ingrese Contraseña"  value=""></div>
                </div>
                  <!-- <div class="cajita">
                        <div class="cajita2">Clave Nueva:</div><div class="cajita3"><input type="text" name="c_nueva1" value=""></div>
                </div>
                <div class="cajita">
                        <div class="cajita2">Repetir Clave Nueva:</div><div class="cajita3"><input type="text" name="c_nueva2" value=""></div>
                </div>  --> 
                <div class="cajita">
                    <div class="cajita2"></div><div class="cajita3"><input type="submit" name="boton" value="Modificar" style="width: 251px;"></div>
                </div>
             
               </div>
                </form>
                  <div class="cajita">
                    <div class="cajita2"></div><div class="cajita3">
                       
                        <a href="Cambiar_Clave.jsp?idu=<? echo $_SESSION["IDUSER"]?>&us=<? echo $list_u[$j][4];?>"  id="boton1">Cambiar Contraseña</a>
                    </div>
                </div>
             
            </div> 
        <div style="width: 580px;"><hr></div>
    <?}?>

  </center>
    
    </body>
</html>
<%
} %>