<%
    HttpSession ss = request.getSession();
    String id_user = (String) ss.getAttribute("IDUSER");
    if (id_user != null) {

%>

<%@page import="pe.edu.upeu.application.model.V_Privilegio"%>
<jsp:useBean id="LIST_MODULO" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Menu - Talento Humano</title>
        <meta name="description" content="Responsive Retina-Friendly Menu with different, size-dependent layouts" />
        <meta name="keywords" content="responsive menu, retina-ready, icon font, media queries, css3, transition, mobile" />
        <link rel="stylesheet" type="text/css" href="css/Css_Modulos/component.css" />
        <script src="js/Js_Modulos/modernizr.custom.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
        <style>
            .center {
                margin: auto;
                width: 60%;
            
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <!-- HEADER -->
        <header id="header">

            <div id="logo-group" >
                <!-- PLACE YOUR LOGO HERE -->
                <span id="logo"> <img src="img/logo_rrhh.jpg" style=" position: absolute;top: 6px; width:130px; height:36px " alt="Talento Humano"> </span>
                <!-- END LOGO PLACEHOLDER -->
                <!-- END AJAX-DROPDOWN -->
            </div>
            <!-- pulled right: nav area -->
            <div class="pull-right">
                <!-- logout button -->
                <div id="logout" class="btn-header transparent pull-right">
                    <span> 
                        <a href="menu?opc=logout" title="Sign Out" data-action="userLogout" data-logout-msg="¿Está complemetamente seguro de cerrar sesión?">
                            <i class="fa fa-sign-out"></i>
                            Salir
                        </a> 
                    </span>
                </div>
                <!-- end logout button -->
                <!-- fullscreen button -->
                <div id="fullscreen" class="btn-header transparent pull-right">
                    <span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
                </div>

            </div>
            <!-- end pulled right: nav area -->

        </header>
        <!-- END HEADER -->
        <br>
        <br>
    <center>
        <div class="">	
            <h1><span class="semi-bold">Gestión de</span> <i class="ultra-light">Talento Humano</i> <sup class="badge bg-color-red bounceIn animated"> v 2.0</sup> <br>
                <small class="text-primary slideInRight fast animated"><strong>¡Bienvenido!</strong></small></h1>
                  <br>
                  <br>
            <nav id="menu" class="nav"  >					
                <ul class="slideInLeft fast animated" >
                    <%for (int i = 0; i < LIST_MODULO.size(); i++) {
                            V_Privilegio m = new V_Privilegio();
                            m = (V_Privilegio) LIST_MODULO.get(i);
                    %>
                    <li >
                        <form id="form_<%=i%>" action="menu" method="POST">
                            <input type="hidden" name="opc" value="List_Privilegios"/>
                            <input type="hidden" name="idmod" value="<%=m.getId_modulo()%>"/>
                            <a onclick="document.getElementById('form_<%=i%>').submit();"  href="#" style="text-decoration: none;font-size:20px " >
                                <span class="icon">
                                    <i aria-hidden="true" class="<%=m.getIc_modulo()%>"></i>
                                </span>
                                <span><%=m.getNo_modulo()%></span>
                            </a> 
                        </form>
                    </li>
                    <%}%>
                </ul>
            </nav>
        </div><!-- /container -->
    </center>

    <script>
        //  The function to change the class
        var changeClass = function (r, className1, className2) {
            var regex = new RegExp("(?:^|\\s+)" + className1 + "(?:\\s+|$)");
            if (regex.test(r.className)) {
                r.className = r.className.replace(regex, ' ' + className2 + ' ');
            }
            else {
                r.className = r.className.replace(new RegExp("(?:^|\\s+)" + className2 + "(?:\\s+|$)"), ' ' + className1 + ' ');
            }
            return r.className;
        };

        //  Creating our button in JS for smaller screens
        var menuElements = document.getElementById('menu');
        menuElements.insertAdjacentHTML('afterBegin', '<button type="button" id="menutoggle" class="navtoogle" aria-hidden="true"><i aria-hidden="true" class="icon-menu"> </i> Menu</button>');

        //  Toggle the class on click to show / hide the menu
        document.getElementById('menutoggle').onclick = function () {
            changeClass(this, 'navtoogle active', 'navtoogle');
        }

        // http://tympanus.net/codrops/2013/05/08/responsive-retina-ready-menu/comment-page-2/#comment-438918
        document.onclick = function (e) {
            var mobileButton = document.getElementById('menutoggle'),
                    buttonStyle = mobileButton.currentStyle ? mobileButton.currentStyle.display : getComputedStyle(mobileButton, null).display;

            if (buttonStyle === 'block' && e.target !== mobileButton && new RegExp(' ' + 'active' + ' ').test(' ' + mobileButton.className + ' ')) {
                changeClass(mobileButton, 'navtoogle active', 'navtoogle');
            }
        }
    </script>
</body>
</html>
<%} else {
        out.print("<script> window.location.href = '/TALENTO_HUMANO/';</script>");
    }


%>
