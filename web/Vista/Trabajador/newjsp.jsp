<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> SmartAdmin </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">

    </head>
    <body class="">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->

        <!-- HEADER -->
        <header id="header">
            <div id="logo-group">

                <!-- PLACE YOUR LOGO HERE -->
                <span id="logo"> <img src="../../img/logo.png" alt="SmartAdmin"> </span>
                <!-- END LOGO PLACEHOLDER -->

                <!-- Note: The activity badge color changes when clicked and resets the number to 0
                Suggestion: You may want to set a flag when this happens to tick off all checked messages / notifications -->
                <span id="activity" class="activity-dropdown"> <i class="fa fa-user"></i> <b class="badge"> 21 </b> </span>

                <!-- AJAX-DROPDOWN : control this dropdown height, look and feel from the LESS variable file -->
                <div class="ajax-dropdown">

                    <!-- the ID links are fetched via AJAX to the ajax container "ajax-notifications" -->
                    <div class="btn-group btn-group-justified" data-toggle="buttons">
                        <label class="btn btn-default">
                            <input type="radio" name="activity" id="ajax/notify/mail.html">
                            Msgs (14) </label>
                        <label class="btn btn-default">
                            <input type="radio" name="activity" id="ajax/notify/notifications.html">
                            notify (3) </label>
                        <label class="btn btn-default">
                            <input type="radio" name="activity" id="ajax/notify/tasks.html">
                            Tasks (4) </label>
                    </div>

                    <!-- notification content -->
                    <div class="ajax-notifications custom-scroll">

                        <div class="alert alert-transparent">
                            <h4>Click a button to show messages here</h4>
                            This blank page message helps protect your privacy, or you can show the first message here automatically.
                        </div>

                        <i class="fa fa-lock fa-4x fa-border"></i>

                    </div>
                    <!-- end notification content -->

                    <!-- footer: refresh area -->
                    <span> Last updated on: 12/12/2013 9:43AM
                        <button type="button" data-loading-text="<i class='fa fa-refresh fa-spin'></i> Loading..." class="btn btn-xs btn-default pull-right">
                            <i class="fa fa-refresh"></i>
                        </button> </span>
                    <!-- end footer -->

                </div>
                <!-- END AJAX-DROPDOWN -->
            </div>

            <!-- projects dropdown -->
            <div class="project-context hidden-xs">

                <span class="label">Projects:</span>
                <span class="project-selector dropdown-toggle" data-toggle="dropdown">Recent projects <i class="fa fa-angle-down"></i></span>

                <!-- Suggestion: populate this list with fetch and push technique -->
                <ul class="dropdown-menu">
                    <li>
                        <a href="javascript:void(0);">Online e-merchant management system - attaching integration with the iOS</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);">Notes on pipeline upgradee</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);">Assesment Report for merchant account</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="javascript:void(0);"><i class="fa fa-power-off"></i> Clear</a>
                    </li>
                </ul>
                <!-- end dropdown-menu-->

            </div>
            <!-- end projects dropdown -->

            <!-- pulled right: nav area -->
            <div class="pull-right">

                <!-- collapse menu button -->
                <div id="hide-menu" class="btn-header pull-right">
                    <span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
                </div>
                <!-- end collapse menu -->

                <!-- #MOBILE -->
                <!-- Top menu profile link : this shows only when top menu is active -->
                <ul id="mobile-profile-img" class="header-dropdown-list hidden-xs padding-5">
                    <li class="">
                        <a href="#" class="dropdown-toggle no-margin userdropdown" data-toggle="dropdown"> 
                            <img src="img/avatars/sunny.png" alt="John Doe" class="online" />  
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li>
                                <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0"><i class="fa fa-cog"></i> Setting</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="profile.html" class="padding-10 padding-top-0 padding-bottom-0"> <i class="fa fa-user"></i> <u>P</u>rofile</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="toggleShortcut"><i class="fa fa-arrow-down"></i> <u>S</u>hortcut</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="launchFullscreen"><i class="fa fa-arrows-alt"></i> Full <u>S</u>creen</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="login.html" class="padding-10 padding-top-5 padding-bottom-5" data-action="userLogout"><i class="fa fa-sign-out fa-lg"></i> <strong><u>L</u>ogout</strong></a>
                            </li>
                        </ul>
                    </li>
                </ul>

                <!-- logout button -->
                <div id="logout" class="btn-header transparent pull-right">
                    <span> <a href="login.html" title="Sign Out" data-action="userLogout" data-logout-msg="You can improve your security further after logging out by closing this opened browser"><i class="fa fa-sign-out"></i></a> </span>
                </div>
                <!-- end logout button -->

                <!-- search mobile button (this is hidden till mobile view port) -->
                <div id="search-mobile" class="btn-header transparent pull-right">
                    <span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
                </div>
                <!-- end search mobile button -->

                <!-- input: search field -->
                <form action="search.html" class="header-search pull-right">
                    <input id="search-fld"  type="text" name="param" placeholder="Find reports and more" data-autocomplete='[
                           "ActionScript",
                           "AppleScript",
                           "Asp",
                           "BASIC",
                           "C",
                           "C++",
                           "Clojure",
                           "COBOL",
                           "ColdFusion",
                           "Erlang",
                           "Fortran",
                           "Groovy",
                           "Haskell",
                           "Java",
                           "JavaScript",
                           "Lisp",
                           "Perl",
                           "PHP",
                           "Python",
                           "Ruby",
                           "Scala",
                           "Scheme"]'>
                    <button type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                    <a href="javascript:void(0);" id="cancel-search-js" title="Cancel Search"><i class="fa fa-times"></i></a>
                </form>
                <!-- end input: search field -->

                <!-- fullscreen button -->
                <div id="fullscreen" class="btn-header transparent pull-right">
                    <span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
                </div>
                <!-- end fullscreen button -->

                <!-- #Voice Command: Start Speech -->
                <div id="speech-btn" class="btn-header transparent pull-right hidden-sm hidden-xs">
                    <div> 
                        <a href="javascript:void(0)" title="Voice Command" data-action="voiceCommand"><i class="fa fa-microphone"></i></a> 
                        <div class="popover bottom"><div class="arrow"></div>
                            <div class="popover-content">
                                <h4 class="vc-title">Voice command activated <br><small>Please speak clearly into the mic</small></h4>
                                <h4 class="vc-title-error text-center">
                                    <i class="fa fa-microphone-slash"></i> Voice command failed
                                    <br><small class="txt-color-red">Must <strong>"Allow"</strong> Microphone</small>
                                    <br><small class="txt-color-red">Must have <strong>Internet Connection</strong></small>
                                </h4>
                                <a href="javascript:void(0);" class="btn btn-success" onclick="commands.help()">See Commands</a> 
                                <a href="javascript:void(0);" class="btn bg-color-purple txt-color-white" onclick="$('#speech-btn .popover').fadeOut(50);">Close Popup</a> 
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end voice command -->

                <!-- multiple lang dropdown : find all flags in the flags page -->
                <ul class="header-dropdown-list hidden-xs">
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="img/blank.gif" class="flag flag-us" alt="United States"> <span> English (US) </span> <i class="fa fa-angle-down"></i> </a>
                        <ul class="dropdown-menu pull-right">
                            <li class="active">
                                <a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-us" alt="United States"> English (US)</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-fr" alt="France"> Français</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-es" alt="Spanish"> Español</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-de" alt="German"> Deutsch</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-jp" alt="Japan"> ???</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-cn" alt="China"> ??</a>
                            </li>	
                            <li>
                                <a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-it" alt="Italy"> Italiano</a>
                            </li>	
                            <li>
                                <a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-pt" alt="Portugal"> Portugal</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-ru" alt="Russia"> ??????? ????</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-kp" alt="Korea"> ???</a>
                            </li>						

                        </ul>
                    </li>
                </ul>
                <!-- end multiple lang -->

            </div>
            <!-- end pulled right: nav area -->

        </header>
        <!-- END HEADER -->

        <!-- Left panel : Navigation area -->
        <!-- Note: This width of the aside area can be adjusted through LESS variables -->

        <!-- END NAVIGATION -->

        <!-- MAIN PANEL -->


        <!-- RIBBON -->
        <!-- END RIBBON -->

        <!-- MAIN CONTENT -->
        <div id="content">


            <div class="row">
                <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
                    <h1 class="page-title txt-color-blueDark">

                        <!-- PAGE HEADER -->
                        <i class="fa-fw fa fa-pencil-square-o"></i> 
                        Forms
                        <span>>  
                            Form Layouts
                        </span>
                    </h1>
                </div>

                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                    <!-- Button trigger modal -->
                    <a data-toggle="modal" href="#myModal" class="btn btn-success btn-lg pull-right header-btn hidden-mobile"><i class="fa fa-circle-arrow-up fa-lg"></i> Launch form modal</a>
                </div>
            </div>

            <div class="alert alert-block alert-success">
                <a class="close" data-dismiss="alert" href="#">×</a>
                <h4 class="alert-heading"><i class="fa fa-check-square-o"></i> Check validation!</h4>
                <p>
                    You may also check the form validation by clicking on the form action button. Please try and see the results below!
                </p>
            </div>

            <!-- widget grid -->

            <!-- end widget grid -->


            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title">
                                <img src="img/logo.png" width="150" alt="SmartAdmin">
                            </h4>
                        </div>
                        <div class="modal-body no-padding">

                            <form id="login-form" class="smart-form">

                                <fieldset>
                                    <section>
                                        <div class="row">
                                            <label class="label col col-2">COMENTARIO</label>
                                            <div class="col col-10">
                                                <label class="input">
                                                    <textarea cols="40" rows="5"></textarea>
                                                </label>
                                            </div>
                                        </div>
                                    </section>



                                </fieldset>

                                <footer>
                                    <button type="submit" class="btn btn-primary">
                                        Continuar
                                    </button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Cancel
                                    </button>

                                </footer>
                            </form>						


                        </div>

                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->


        </div>
        <!-- END MAIN CONTENT -->


        <!-- END MAIN PANEL -->

        <!-- PAGE FOOTER -->
        <div class="page-footer">
            <div class="row">
                <div class="col-xs-12 col-sm-6">
                    <span class="txt-color-white">SmartAdmin WebApp © 2013-2014</span>
                </div>

                <div class="col-xs-6 col-sm-6 text-right hidden-xs">
                    <div class="txt-color-white inline-block">
                        <i class="txt-color-blueLight hidden-mobile">Last account activity <i class="fa fa-clock-o"></i> <strong>52 mins ago &nbsp;</strong> </i>
                        <div class="btn-group dropup">
                            <button class="btn btn-xs dropdown-toggle bg-color-blue txt-color-white" data-toggle="dropdown">
                                <i class="fa fa-link"></i> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu pull-right text-left">
                                <li>
                                    <div class="padding-5">
                                        <p class="txt-color-darken font-sm no-margin">Download Progress</p>
                                        <div class="progress progress-micro no-margin">
                                            <div class="progress-bar progress-bar-success" style="width: 50%;"></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="padding-5">
                                        <p class="txt-color-darken font-sm no-margin">Server Load</p>
                                        <div class="progress progress-micro no-margin">
                                            <div class="progress-bar progress-bar-success" style="width: 20%;"></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="padding-5">
                                        <p class="txt-color-darken font-sm no-margin">Memory Load <span class="text-danger">*critical*</span></p>
                                        <div class="progress progress-micro no-margin">
                                            <div class="progress-bar progress-bar-danger" style="width: 70%;"></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="padding-5">
                                        <button class="btn btn-block btn-default">refresh</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PAGE FOOTER -->

        <!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
        Note: These tiles are completely responsive,
        you can add as many as you like
        -->
        <div id="shortcut">
            <ul>
                <li>
                    <a href="#inbox.html" class="jarvismetro-tile big-cubes bg-color-blue"> <span class="iconbox"> <i class="fa fa-envelope fa-4x"></i> <span>Mail <span class="label pull-right bg-color-darken">14</span></span> </span> </a>
                </li>
                <li>
                    <a href="#calendar.html" class="jarvismetro-tile big-cubes bg-color-orangeDark"> <span class="iconbox"> <i class="fa fa-calendar fa-4x"></i> <span>Calendar</span> </span> </a>
                </li>
                <li>
                    <a href="#gmap-xml.html" class="jarvismetro-tile big-cubes bg-color-purple"> <span class="iconbox"> <i class="fa fa-map-marker fa-4x"></i> <span>Maps</span> </span> </a>
                </li>
                <li>
                    <a href="#invoice.html" class="jarvismetro-tile big-cubes bg-color-blueDark"> <span class="iconbox"> <i class="fa fa-book fa-4x"></i> <span>Invoice <span class="label pull-right bg-color-darken">99</span></span> </span> </a>
                </li>
                <li>
                    <a href="#gallery.html" class="jarvismetro-tile big-cubes bg-color-greenLight"> <span class="iconbox"> <i class="fa fa-picture-o fa-4x"></i> <span>Gallery </span> </span> </a>
                </li>
                <li>
                    <a href="javascript:void(0);" class="jarvismetro-tile big-cubes selected bg-color-pinkDark"> <span class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>My Profile </span> </span> </a>
                </li>
            </ul>
        </div>
        <!-- END SHORTCUT AREA -->

        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
                                    if (!window.jQuery) {
                                        document.write('<script src="js/libs/jquery-2.0.2.min.js"><\/script>');
                                    }
        </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
                                    if (!window.jQuery.ui) {
                                        document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                                    }
        </script>

        <!-- IMPORTANT: APP CONFIG -->
        <script src="../../js/app.config.js"></script>

        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
        <script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

        <!-- BOOTSTRAP JS -->
        <script src="../../js/bootstrap/bootstrap.min.js"></script>

        <!-- CUSTOM NOTIFICATION -->
        <script src="../../js/notification/SmartNotification.min.js"></script>

        <!-- JARVIS WIDGETS -->
        <script src="../../js/smartwidgets/jarvis.widget.min.js"></script>

        <!-- EASY PIE CHARTS -->
        <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!-- SPARKLINES -->
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

        <!-- JQUERY SELECT2 INPUT -->
        <script src="../../js/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="../../js/plugin/fastclick/fastclick.min.js"></script>

        <!--[if IE 8]>

        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

        <![endif]-->

        <!-- Demo purpose only -->
        <script src="../../js/demo.min.js"></script>

        <!-- MAIN APP JS FILE -->
        <script src="../../js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="../../js/speech/voicecommand.min.js"></script>

        <!-- PAGE RELATED PLUGIN(S) -->
        <script src="../../js/plugin/jquery-form/jquery-form.min.js"></script>


        <script type="text/javascript">

                                    // DO NOT REMOVE : GLOBAL FUNCTIONS!

                                    $(document).ready(function() {

                                        pageSetUp();

                                        var $checkoutForm = $('#checkout-form').validate({
                                            // Rules for form validation
                                            rules: {
                                                fname: {
                                                    required: true
                                                },
                                                lname: {
                                                    required: true
                                                },
                                                email: {
                                                    required: true,
                                                    email: true
                                                },
                                                phone: {
                                                    required: true
                                                },
                                                country: {
                                                    required: true
                                                },
                                                city: {
                                                    required: true
                                                },
                                                code: {
                                                    required: true,
                                                    digits: true
                                                },
                                                address: {
                                                    required: true
                                                },
                                                name: {
                                                    required: true
                                                },
                                                card: {
                                                    required: true,
                                                    creditcard: true
                                                },
                                                cvv: {
                                                    required: true,
                                                    digits: true
                                                },
                                                month: {
                                                    required: true
                                                },
                                                year: {
                                                    required: true,
                                                    digits: true
                                                }
                                            },
                                            // Messages for form validation
                                            messages: {
                                                fname: {
                                                    required: 'Please enter your first name'
                                                },
                                                lname: {
                                                    required: 'Please enter your last name'
                                                },
                                                email: {
                                                    required: 'Please enter your email address',
                                                    email: 'Please enter a VALID email address'
                                                },
                                                phone: {
                                                    required: 'Please enter your phone number'
                                                },
                                                country: {
                                                    required: 'Please select your country'
                                                },
                                                city: {
                                                    required: 'Please enter your city'
                                                },
                                                code: {
                                                    required: 'Please enter code',
                                                    digits: 'Digits only please'
                                                },
                                                address: {
                                                    required: 'Please enter your full address'
                                                },
                                                name: {
                                                    required: 'Please enter name on your card'
                                                },
                                                card: {
                                                    required: 'Please enter your card number'
                                                },
                                                cvv: {
                                                    required: 'Enter CVV2',
                                                    digits: 'Digits only'
                                                },
                                                month: {
                                                    required: 'Select month'
                                                },
                                                year: {
                                                    required: 'Enter year',
                                                    digits: 'Digits only please'
                                                }
                                            },
                                            // Do not change code below
                                            errorPlacement: function(error, element) {
                                                error.insertAfter(element.parent());
                                            }
                                        });

                                        var $registerForm = $("#smart-form-register").validate({
                                            // Rules for form validation
                                            rules: {
                                                username: {
                                                    required: true
                                                },
                                                email: {
                                                    required: true,
                                                    email: true
                                                },
                                                password: {
                                                    required: true,
                                                    minlength: 3,
                                                    maxlength: 20
                                                },
                                                passwordConfirm: {
                                                    required: true,
                                                    minlength: 3,
                                                    maxlength: 20,
                                                    equalTo: '#password'
                                                },
                                                firstname: {
                                                    required: true
                                                },
                                                lastname: {
                                                    required: true
                                                },
                                                gender: {
                                                    required: true
                                                },
                                                terms: {
                                                    required: true
                                                }
                                            },
                                            // Messages for form validation
                                            messages: {
                                                login: {
                                                    required: 'Please enter your login'
                                                },
                                                email: {
                                                    required: 'Please enter your email address',
                                                    email: 'Please enter a VALID email address'
                                                },
                                                password: {
                                                    required: 'Please enter your password'
                                                },
                                                passwordConfirm: {
                                                    required: 'Please enter your password one more time',
                                                    equalTo: 'Please enter the same password as above'
                                                },
                                                firstname: {
                                                    required: 'Please select your first name'
                                                },
                                                lastname: {
                                                    required: 'Please select your last name'
                                                },
                                                gender: {
                                                    required: 'Please select your gender'
                                                },
                                                terms: {
                                                    required: 'You must agree with Terms and Conditions'
                                                }
                                            },
                                            // Do not change code below
                                            errorPlacement: function(error, element) {
                                                error.insertAfter(element.parent());
                                            }
                                        });

                                        var $reviewForm = $("#review-form").validate({
                                            // Rules for form validation
                                            rules: {
                                                name: {
                                                    required: true
                                                },
                                                email: {
                                                    required: true,
                                                    email: true
                                                },
                                                review: {
                                                    required: true,
                                                    minlength: 20
                                                },
                                                quality: {
                                                    required: true
                                                },
                                                reliability: {
                                                    required: true
                                                },
                                                overall: {
                                                    required: true
                                                }
                                            },
                                            // Messages for form validation
                                            messages: {
                                                name: {
                                                    required: 'Please enter your name'
                                                },
                                                email: {
                                                    required: 'Please enter your email address',
                                                    email: '<i class="fa fa-warning"></i><strong>Please enter a VALID email addres</strong>'
                                                },
                                                review: {
                                                    required: 'Please enter your review'
                                                },
                                                quality: {
                                                    required: 'Please rate quality of the product'
                                                },
                                                reliability: {
                                                    required: 'Please rate reliability of the product'
                                                },
                                                overall: {
                                                    required: 'Please rate the product'
                                                }
                                            },
                                            // Do not change code below
                                            errorPlacement: function(error, element) {
                                                error.insertAfter(element.parent());
                                            }
                                        });

                                        var $commentForm = $("#comment-form").validate({
                                            // Rules for form validation
                                            rules: {
                                                name: {
                                                    required: true
                                                },
                                                email: {
                                                    required: true,
                                                    email: true
                                                },
                                                url: {
                                                    url: true
                                                },
                                                comment: {
                                                    required: true
                                                }
                                            },
                                            // Messages for form validation
                                            messages: {
                                                name: {
                                                    required: 'Enter your name',
                                                },
                                                email: {
                                                    required: 'Enter your email address',
                                                    email: 'Enter a VALID email'
                                                },
                                                url: {
                                                    email: 'Enter a VALID url'
                                                },
                                                comment: {
                                                    required: 'Please enter your comment'
                                                }
                                            },
                                            // Ajax form submition
                                            submitHandler: function(form) {
                                                $(form).ajaxSubmit({
                                                    success: function() {
                                                        $("#comment-form").addClass('submited');
                                                    }
                                                });
                                            },
                                            // Do not change code below
                                            errorPlacement: function(error, element) {
                                                error.insertAfter(element.parent());
                                            }
                                        });

                                        var $contactForm = $("#contact-form").validate({
                                            // Rules for form validation
                                            rules: {
                                                name: {
                                                    required: true
                                                },
                                                email: {
                                                    required: true,
                                                    email: true
                                                },
                                                message: {
                                                    required: true,
                                                    minlength: 10
                                                }
                                            },
                                            // Messages for form validation
                                            messages: {
                                                name: {
                                                    required: 'Please enter your name',
                                                },
                                                email: {
                                                    required: 'Please enter your email address',
                                                    email: 'Please enter a VALID email address'
                                                },
                                                message: {
                                                    required: 'Please enter your message'
                                                }
                                            },
                                            // Ajax form submition
                                            submitHandler: function(form) {
                                                $(form).ajaxSubmit({
                                                    success: function() {
                                                        $("#contact-form").addClass('submited');
                                                    }
                                                });
                                            },
                                            // Do not change code below
                                            errorPlacement: function(error, element) {
                                                error.insertAfter(element.parent());
                                            }
                                        });

                                        var $loginForm = $("#login-form").validate({
                                            // Rules for form validation
                                            rules: {
                                                email: {
                                                    required: true,
                                                    email: true
                                                },
                                                password: {
                                                    required: true,
                                                    minlength: 3,
                                                    maxlength: 20
                                                }
                                            },
                                            // Messages for form validation
                                            messages: {
                                                email: {
                                                    required: 'Please enter your email address',
                                                    email: 'Please enter a VALID email address'
                                                },
                                                password: {
                                                    required: 'Please enter your password'
                                                }
                                            },
                                            // Do not change code below
                                            errorPlacement: function(error, element) {
                                                error.insertAfter(element.parent());
                                            }
                                        });

                                        var $orderForm = $("#order-form").validate({
                                            // Rules for form validation
                                            rules: {
                                                name: {
                                                    required: true
                                                },
                                                email: {
                                                    required: true,
                                                    email: true
                                                },
                                                phone: {
                                                    required: true
                                                },
                                                interested: {
                                                    required: true
                                                },
                                                budget: {
                                                    required: true
                                                }
                                            },
                                            // Messages for form validation
                                            messages: {
                                                name: {
                                                    required: 'Please enter your name'
                                                },
                                                email: {
                                                    required: 'Please enter your email address',
                                                    email: 'Please enter a VALID email address'
                                                },
                                                phone: {
                                                    required: 'Please enter your phone number'
                                                },
                                                interested: {
                                                    required: 'Please select interested service'
                                                },
                                                budget: {
                                                    required: 'Please select your budget'
                                                }
                                            },
                                            // Do not change code below
                                            errorPlacement: function(error, element) {
                                                error.insertAfter(element.parent());
                                            }
                                        });

                                        // START AND FINISH DATE
                                        $('#startdate').datepicker({
                                            dateFormat: 'dd.mm.yy',
                                            prevText: '<i class="fa fa-chevron-left"></i>',
                                            nextText: '<i class="fa fa-chevron-right"></i>',
                                            onSelect: function(selectedDate) {
                                                $('#finishdate').datepicker('option', 'minDate', selectedDate);
                                            }
                                        });

                                        $('#finishdate').datepicker({
                                            dateFormat: 'dd.mm.yy',
                                            prevText: '<i class="fa fa-chevron-left"></i>',
                                            nextText: '<i class="fa fa-chevron-right"></i>',
                                            onSelect: function(selectedDate) {
                                                $('#startdate').datepicker('option', 'maxDate', selectedDate);
                                            }
                                        });



                                    })

        </script>

        <!-- Your GOOGLE ANALYTICS CODE Below -->
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();

        </script>

    </body>

</html>