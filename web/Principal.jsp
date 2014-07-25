

<%@page import="pe.edu.upeu.application.model.V_Privilegio"%>
<%@page import="pe.edu.upeu.application.model.V_Usuario"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession(true);
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != "") {

        Usuario us = new Usuario();

        //include './SYS_SEG_URL/CLEAN_URL.php';
        /*require_once '../Modelo/modelorol.php';
         $idrol = $_SESSION["IDROL"];
         $w1 = new modelorol();
         $lista3 = $w1->listarURL($idrol);
         require_once '../Modelo/ModeloContrato.php';
         $modc=  new ModeloContrato();
         $modc->VENC_CONT();*/
%>
<jsp:useBean id="listarURL" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <% %>
        <meta charset="utf-8" />
        <meta http-equiv="Expires" content="0" />
        <meta http-equiv="Pragma" content="no-cache" />
        <title>Principal</title>
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/font-awesome.css" />
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700,300italic" />
        <link rel="stylesheet" href="css/principal.css" />

        <script type="text/javascript" src="js/jquery.autoheight.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>

        <link href="imagenes/guia.gif" rel="shortcut icon"/>

        <style type="text/css">

            .autoHeight{
                border-style: none;

            }
            @font-face{
                font-family: myFirstFont;
                src: url(sansation_light.woff);   
            }
            h1{
                font: oblique 120% sans-serif bold;
                color: #d0d2d3;
                font-size: 24px;
            }
            strong{
                padding: 10px 0px 10px 0px;
            }
            #area{
                position:absolute;
                list-style:none;
                text-align:center;
                width:300px;
                z-index: 10;
                height: 55px;
                border: 1px solid #d9d9d9;
                margin: 5px;
            }
            #a1{
                width: 100%;
                height: 20px;
                color:#d0d2d3;
                text-align: center;
                font-weight: bold;
            }
            #a2{
                width: 100%;
                height: 20px;
                text-align: center;
                font-size: 12px;
            }
            #a3{
                width: 100%;
                height: 15px;
                text-align: center;
                font-size: 12px;
            }
            #ab{
                font-family: sans-serif;
                color: #8e0537;
                font-size: 14px;
                padding-top: 2px;
            }             
        </style>

        <script>
            $(document).ready(
                    function() {
                        $(".li-pla").hover(function() {
                            $(".ul-pla1").show();

                        });
                    }
            );
        </script>
        <script language="Javascript">document.oncontextmenu = function() {
                return false;
            }</script>   
    </head>
    <body >
        </script>
        <header>

            <h1>Sistema de Dotación y Contratación del Personal</h1>
            <hr>
        </header>
        <div id="area" >
            <div id="a1">
                <p id="ab"> <%out.println((String) sesion.getAttribute("DEPARTAMENTO")); %></p>

            </div>
            <div id="a2">
                <p><%out.println((String) sesion.getAttribute("PUESTO")); %></p>
            </div>
            <div id="a3">
                <p style="color: #0575f4; "  >
                    <script>
                        var meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
                        var diasSemana = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado");
                        var f = new Date();
                        document.write(diasSemana[f.getDay()] + ", " + f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear());
                    </script>
                </p>
            </div>
        </div>
        <nav id="maxnav">
            <nav id="colorNav">
                <ul>
                    <li class="blue">
                        <a href="#" class="icon-cog" title="Contratación de Personal" ></a>
                        <ul>

                            <% for (int i = 0; i < listarURL.size(); i++) {
                                    V_Privilegio dp = new V_Privilegio();
                                    dp = (V_Privilegio) listarURL.get(i);
                            %>

                            <li class="a" ><a href="<%=dp.getDi_url()%>"  target="contenido1"><%=dp.getNo_link()%></a>
                                <%  if (dp.getId_privilegio().equals("PRV-000012")) {%>
                                <ul>
                                    <li class="li-pla" ><a> (Planilla) Contrato</a>
                                        <ul class="ul-pla1" style="display: none">
                                            <li ><a href="../Vistas/pruebaassss.php?text=1" target="contenido1">Tiempo Completo</a></li>
                                            <li><a href="../Vistas/pruebaassss.php?text=2" target="contenido1">Tiempo Parcial</a></li>
                                            <li><a href="../Vistas/pruebaassss.php?text=3" target="contenido1">Medio Tiempo</a></li>
                                            <!--  <li><a href="../Vistas/Reg_dgp.php">Renovación de Contrato</a></li>
                                              <li><a href="../Vistas/Reg_dgp.php">Extranjero</a></li>
                                            -->
                                        </ul>
                                    </li>
                                    <li class="li-pla" ><a>(Fuera de Planilla) - Convenio </a></li>
                                    <li class="li-pla" ><a>Otros</a></li>
                                </ul>
                                <%}
                                    }%>
                            </li>



                        </ul>
                    </li>
                    <li class="red">
                        <a href="#" class="icon-user" title="Usuario"></a>
                        <ul>
                            <li><a href="Vista/inicio.jsp" target="contenido1"><strong class="icon-home"></strong><strong>Inicio</strong></a></li>
                            <li><a href="Vista/Usuario/Perfil_Usuario.jsp" target="contenido1"><strong class="icon-user"></strong><strong><%out.println((String) sesion.getAttribute("USER")); %></strong></a></li>
                            <li><a href="../Control/cerrar.php"><strong class="icon-off"></strong><strong>Salir</strong></a></li>
                        </ul>
                    </li>
                </ul>                
            </nav>
        </nav>
        <hr style="border: 1px solid #d0d2d3; height: 2px; background-color: #EEEEEE; margin-top: 10px;">
            <iframe name="contenido1" id="contenido1"  class="autoHeight" src="Vista/inicio.jsp" width="100%"   height="100%" frameborder="0" align="center" transparency="transparency"></iframe>
            <script src="js/jquery-1.10.2.min.js"></script> 


    </body>
</html>
<%}%>