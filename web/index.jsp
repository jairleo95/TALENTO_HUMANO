<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<!DOCTYPE html>
<html lang="en-us" id="extr-page">
    <head>
        <meta charset="utf-8">
        <title> .:RRHH:.</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- #CSS Links -->
        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

        <!-- #FAVICONS -->
        <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

        <!-- #GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- #APP SCREEN / ICONS -->
        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <style>
            @media screen and (min-width: 992px)  /* Tablet */ {
                #content{
                    margin-left: 70px;margin-right: 70px;
                }
            }
            @media screen and (min-width: 992px) and (max-width: 1024px) /* Tablet */ {
                #content{
                    margin-left: 35px;margin-right: 35px;
                }
            }
        </style>
    </head>
    <body class="animated fadeInDown">
        <header id="header">
            <div id="logo-group" >
                <span id="logos"> <img src="img/logoRRHH.png"  style="margin-top: 13px; width:130px; height:52px " alt="Talento Humano"> </span>
            </div>

        </header>
        <div id="main" role="main" class="mainLogin">
            <div id="content" class="containerr">
                <div class="row">
                    <div
                        class="col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-xs hidden-sm">
                        <h1 class="text-info login-header-big text-center">Gesti�n de Talento Humano</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col col-md-12 col-md-offset-4">
                        <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4 ">
                            <div class="well no-padding">
                                <form   id="login-form" class="form-horizontal formLogin"   autocomplete="off" >
                                    <fieldset>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="icon-addon addon-md">
                                                    <input id="txtUsuario"
                                                           type="text" name="username"
                                                           placeholder="Usuario" maxlength="20"
                                                           autocomplete="off"
                                                           onkeypress="return soloLetrasNumeros(event);"
                                                           class="form-control txtUsuario" required="" />
                                                    <label  class="fa fa-user fa-lg fa-fw" rel="tooltip"   data-original-title="Complete este campo"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="input-group" style="width: 100%;">
                                                    <div class="icon-addon addon-md">
                                                        <input id="txtClave" required="" name="clave"  type="password" placeholder="Contrase�a"
                                                               maxlength="50" autocomplete="off" class="form-control txtClave" 
                                                               onkeypress="return soloLetrasNumeros(event);" style="width: 100%;" />
                                                        <span   class="fa fa-lock fa-lg fa-fw lbClave" rel="tooltip" style="z-index: 5;"   data-original-title="Complete este campo"></span>
                                                    </div>
                                                    <span class="input-group-btn" >
                                                        <button class="btn btn-default btnIngresar" type="submit" disabled="" id="btnIngresar" name="btnIngresar"><i class="fa fa-sign-in fa-lg" ></i></button>
                                                    </span>   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="alert alert-warning fade in box_cargando" style="display:none">
                                            <button class="close" data-dismiss="alert" >�</button>
                                            <i class="fa-fw fa fa-warning"></i>  
                                            <span class="texto_box_h">Conectando...</span>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--
          <div id="main" role="main">
              <div id="content" class="container">
                  <div class="row">
                      <div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm" >
                          <h1 class="txt-color-red login-header-big">Gesti�n del Talento Humano</h1>
  
                          <div class="hero">
  
                              <div class="pull-left login-desc-box-l">
                                  <h4 class="paragraph-header">Exitoso es aquel que puede establecer una base firme con los ladrillos que los dem�s le tiraron!</h4>
                                  <div class="login-app-icons">
                                      <a href="http://recursoshumanos.upeu.edu.pe/" class="btn btn-primary btn-sm">Pagina Oficial</a>
                                  </div>
                              </div>
  
                              <img src="img/demo/iphoneview.png" class="pull-right display-image" alt="" style="width:210px">
  
                          </div>
  
                          <div class="row">
                              <div class="about">
                                  <h5 class="about-heading">Sobre Recursos Humanos</h5>
                                  <p>
                                      "La Oficina de RRHH selecciona, eval�a, y capacita al personal id�neo para la formaci�n integral de los estudiantes que han de 
                                      formarse profesionalmente y prestar un servicio a la Iglesia y la Sociedad para restaurar en el ser humano la imagen de Dios".
                                  </p>
                              </div>
  
                          </div>
  
                      </div>
                      <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
                          <div class="well no-padding" style="padding-top: 50px;">
                              <form id="login-form" class="smart-form client-form">
                                  <header>
                                      Iniciar Sesi�n 
                                  </header>
  
                                  <fieldset>
                                      <section>
                                          <label class="label">Usuario</label>
                                          <label class="input"> <i class="icon-append fa fa-user"></i>
                                              <input type="text" name="username" autocomplete="off" autofocus="" required=""  />
                                              <b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Ingrese su usuario</b></label>
                                      </section>
  
                                      <section>
                                          <label class="label">Contrase�a</label>
                                          <label class="input"> <i class="icon-append fa fa-lock"></i>
                                              <input type="password" name="clave" required="" />
                                              <b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> Ingrese la contrase�a</b> </label>
  
                                      </section>
                                  </fieldset>
                                  <footer>
                                      <button type="submit" class="btn btn-primary">
                                          Conectar
                                      </button>
                                  </footer>
  
                              </form>
                          </div>
                          <div id="mensaje"  class="tooltip-arrow"></div>
  
                      </div>
                  </div>
              </div>
          </div>
  
        -->
        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
        <script src="js/plugin/pace/pace.min.js"></script>


        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script> if (!window.jQuery) {
                                                                       document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');
                                                                   }</script>

        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script> if (!window.jQuery.ui) {
                                                                       document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                                                                   }</script>
        <!-- IMPORTANT: APP CONFIG -->
        <script src="js/app.config.js"></script>

        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
        <script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

        <!-- BOOTSTRAP JS -->		
        <script src="js/bootstrap/bootstrap.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>
        <!--[if IE 8]>
                
                <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
        <![endif]-->
        <!-- MAIN APP JS FILE -->
        <script src="js/app.min.js"></script>
        <script src="js/index.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    </body>
</html>