<%@page import="pe.edu.upeu.application.model.V_Privilegio"%>
<jsp:useBean id="LIST_MODULO" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Menu - Talent Humano</title>
        <meta name="description" content="Responsive Retina-Friendly Menu with different, size-dependent layouts" />
        <meta name="keywords" content="responsive menu, retina-ready, icon font, media queries, css3, transition, mobile" />
        <meta name="author" content="Codrops" />
        <link rel="stylesheet" type="text/css" href="css/Css_Modulos/default.css" />
        <link rel="stylesheet" type="text/css" href="css/Css_Modulos/component.css" />
        <script src="js/Js_Modulos/modernizr.custom.js"></script>
    </head>
    <body>
        <div class="container">	
            <!-- Codrops top bar -->
            <div class="codrops-top clearfix">
                <a class="codrops-icon codrops-icon-prev" href="http://tympanus.net/Development/PageTransitions/"><span>Previous Demo</span></a>
                <span class="right"><a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=14991"><span>Back to the Codrops Article</span></a></span>
            </div>
            <header>
                <h1 style="color:black">Gestión de Talento Humano <span><strong>¡Bienvenido!</strong> </span></h1>	
            </header>
            <div class="main clearfix">
                <nav id="menu" class="nav">					
                    <ul>
                        <%for (int i = 0; i < LIST_MODULO.size(); i++) {
                                V_Privilegio m = new V_Privilegio();
                                m = (V_Privilegio) LIST_MODULO.get(i);
                        %>
                        <li>
                            <form id="form_<%=i%>" action="menu" method="POST">
                                <input type="hidden" name="opc" value="List_Privilegios"/>
                                <input type="hidden" name="idmod" value="<%=m.getId_modulo()%>"/>


                                <a   onclick="document.getElementById('form_<%=i%>').submit();"  href="#" >
                                    <span class="icon">
                                        <i aria-hidden="true" class="<%=m.getIc_modulo()%>"></i>
                                    </span>
                                    <span><%=m.getNo_modulo()%></span>
                                </a>   </form>
                        </li>
                        <%}%>
                    </ul>
                </nav>

            </div>
        </div><!-- /container -->
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