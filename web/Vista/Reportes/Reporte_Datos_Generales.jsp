<%-- 
    Document   : Reporte_Datos_Generales
    Created on : 05-feb-2015, 9:11:47
    Author     : joserodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">

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
    <body class="" >
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->

        <!-- HEADER -->
        <!-- END HEADER -->

        <!-- Left panel : Navigation area -->
        <!-- Note: This width of the aside area can be adjusted through LESS variables -->
        <!-- END NAVIGATION -->

        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px">

            <!-- RIBBON -->
            <!-- END RIBBON -->

            <!-- MAIN CONTENT -->
            <div id="content">

                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <!-- end widget -->
                            
                            <!-- Widget ID (each widget will need unique ID)-->
                            <!-- end widget -->

                            <!-- Widget ID (each widget will need unique ID)-->
                            <!-- end widget -->

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-1" data-widget-editbutton="false">
                                <!-- widget options:
                                usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

                                data-widget-colorbutton="false"
                                data-widget-editbutton="false"
                                data-widget-togglebutton="false"
                                data-widget-deletebutton="false"
                                data-widget-fullscreenbutton="false"
                                data-widget-custombutton="false"
                                data-widget-collapsed="true"
                                data-widget-sortable="false"

                                -->
                                <header>
                                    <span class="widget-icon"><i class="fa fa-table"></i>  </span>
                                    <label style=" font-size:21px; font-family:cambria; color:white ;padding-left:5px;padding-top: 2px;">Reporte Filtro</label>
                                </header>
                                
                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding">

                                        <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%">
                                            <thead>
                                                <tr>
                                                    <th data-hide="phone">ID</th>
                                                    <th data-class="expand">Name</th>
                                                    <th>Phone</th>
                                                    <th data-hide="phone">Company</th>
                                                    <th data-hide="phone,tablet">Zip</th>
                                                    <th data-hide="phone,tablet">City</th>
                                                    <th data-hide="phone,tablet">Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Jennifer</td>
                                                    <td>1-342-463-8341</td>
                                                    <td>Et Rutrum Non Associates</td>
                                                    <td>35728</td>
                                                    <td>Fogo</td>
                                                    <td>03/04/14</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Clark</td>
                                                    <td>1-516-859-1120</td>
                                                    <td>Nam Ac Inc.</td>
                                                    <td>7162</td>
                                                    <td>Machelen</td>
                                                    <td>03/23/13</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>Brendan</td>
                                                    <td>1-724-406-2487</td>
                                                    <td>Enim Commodo Limited</td>
                                                    <td>98611</td>
                                                    <td>Norman</td>
                                                    <td>02/13/14</td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>Warren</td>
                                                    <td>1-412-485-9725</td>
                                                    <td>Odio Etiam Institute</td>
                                                    <td>10312</td>
                                                    <td>Sautin</td>
                                                    <td>01/01/13</td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>Rajah</td>
                                                    <td>1-849-642-8777</td>
                                                    <td>Neque Ltd</td>
                                                    <td>29131</td>
                                                    <td>Glovertown</td>
                                                    <td>02/16/13</td>
                                                </tr>
                                                <tr>
                                                    <td>6</td>
                                                    <td>Demetrius</td>
                                                    <td>1-470-329-9627</td>
                                                    <td>Euismod In Ltd</td>
                                                    <td>1883</td>
                                                    <td>Kapolei</td>
                                                    <td>03/15/13</td>
                                                </tr>
                                                <tr>
                                                    <td>7</td>
                                                    <td>Keefe</td>
                                                    <td>1-188-191-2346</td>
                                                    <td>Molestie Industries</td>
                                                    <td>2211BM</td>
                                                    <td>Modena</td>
                                                    <td>07/08/13</td>
                                                </tr>
                                                <tr>
                                                    <td>8</td>
                                                    <td>Leila</td>
                                                    <td>1-663-655-8904</td>
                                                    <td>Est LLC</td>
                                                    <td>75286</td>
                                                    <td>Hondelange</td>
                                                    <td>12/09/12</td>
                                                </tr>
                                                <tr>
                                                    <td>9</td>
                                                    <td>Fritz</td>
                                                    <td>1-598-234-7837</td>
                                                    <td>Et Ultrices Posuere Institute</td>
                                                    <td>2324</td>
                                                    <td>Monte San Pietrangeli</td>
                                                    <td>12/29/12</td>
                                                </tr>
                                                <tr>
                                                    <td>10</td>
                                                    <td>Cassady</td>
                                                    <td>1-212-965-8381</td>
                                                    <td>Vitae Erat Vel Company</td>
                                                    <td>5898</td>
                                                    <td>Huntly</td>
                                                    <td>10/07/13</td>
                                                </tr>
                                                <tr>
                                                    <td>11</td>
                                                    <td>Rogan</td>
                                                    <td>1-541-654-9030</td>
                                                    <td>Iaculis Incorporated</td>
                                                    <td>6464JN</td>
                                                    <td>Carson City</td>
                                                    <td>05/30/13</td>
                                                </tr>
                                                <tr>
                                                    <td>12</td>
                                                    <td>Candice</td>
                                                    <td>1-153-708-6027</td>
                                                    <td>Pellentesque Company</td>
                                                    <td>8565</td>
                                                    <td>Redruth</td>
                                                    <td>02/25/14</td>
                                                </tr>
                                                <tr>
                                                    <td>13</td>
                                                    <td>Brittany</td>
                                                    <td>1-987-452-6038</td>
                                                    <td>Suspendisse Inc.</td>
                                                    <td>4031</td>
                                                    <td>Carapicuíba</td>
                                                    <td>10/13/13</td>
                                                </tr>
                                                <tr>
                                                    <td>14</td>
                                                    <td>Baxter</td>
                                                    <td>1-281-147-5085</td>
                                                    <td>Nulla Donec Non Associates</td>
                                                    <td>53067</td>
                                                    <td>Yellowknife</td>
                                                    <td>08/14/14</td>
                                                </tr>
                                                <tr>
                                                    <td>15</td>
                                                    <td>Vaughan</td>
                                                    <td>1-940-231-1787</td>
                                                    <td>Metus Facilisis Lorem Incorporated</td>
                                                    <td>26530-046</td>
                                                    <td>Guarapuava</td>
                                                    <td>11/17/12</td>
                                                </tr>
                                                <tr>
                                                    <td>16</td>
                                                    <td>Ivan</td>
                                                    <td>1-314-209-1223</td>
                                                    <td>Posuere Vulputate Inc.</td>
                                                    <td>KX3W 1OI</td>
                                                    <td>Bienne-lez-Happart</td>
                                                    <td>03/04/14</td>
                                                </tr>
                                                <tr>
                                                    <td>17</td>
                                                    <td>Marah</td>
                                                    <td>1-348-582-4041</td>
                                                    <td>Feugiat Ltd</td>
                                                    <td>2128</td>
                                                    <td>Nîmes</td>
                                                    <td>11/29/12</td>
                                                </tr>
                                                <tr>
                                                    <td>18</td>
                                                    <td>Kiara</td>
                                                    <td>1-570-428-6681</td>
                                                    <td>Et Euismod Et Corp.</td>
                                                    <td>70483</td>
                                                    <td>Meeuwen</td>
                                                    <td>03/28/13</td>
                                                </tr>
                                                <tr>
                                                    <td>19</td>
                                                    <td>Brielle</td>
                                                    <td>1-216-787-0056</td>
                                                    <td>Quis Massa Mauris Institute</td>
                                                    <td>19913</td>
                                                    <td>Mombaruzzo</td>
                                                    <td>12/17/12</td>
                                                </tr>
                                                <tr>
                                                    <td>20</td>
                                                    <td>Kennedy</td>
                                                    <td>1-997-154-9340</td>
                                                    <td>Quis Diam Pellentesque Institute</td>
                                                    <td>3092FI</td>
                                                    <td>Edmundston</td>
                                                    <td>02/26/13</td>
                                                </tr>
                                                <tr>
                                                    <td>21</td>
                                                    <td>Peter</td>
                                                    <td>1-394-459-3833</td>
                                                    <td>Mauris Eu Turpis Corporation</td>
                                                    <td>27337</td>
                                                    <td>Ravenstein</td>
                                                    <td>06/05/14</td>
                                                </tr>
                                                <tr>
                                                    <td>22</td>
                                                    <td>Kibo</td>
                                                    <td>1-162-467-7160</td>
                                                    <td>Massa LLP</td>
                                                    <td>30305</td>
                                                    <td>Witney</td>
                                                    <td>08/20/14</td>
                                                </tr>
                                                <tr>
                                                    <td>23</td>
                                                    <td>Tanek</td>
                                                    <td>1-806-556-1897</td>
                                                    <td>Pharetra Nam Industries</td>
                                                    <td>84972</td>
                                                    <td>Abbotsford</td>
                                                    <td>05/03/14</td>
                                                </tr>
                                                <tr>
                                                    <td>24</td>
                                                    <td>Guinevere</td>
                                                    <td>1-850-940-6176</td>
                                                    <td>Montes Nascetur Limited</td>
                                                    <td>54983</td>
                                                    <td>Rio Grande</td>
                                                    <td>02/24/14</td>
                                                </tr>
                                                <tr>
                                                    <td>25</td>
                                                    <td>Ronan</td>
                                                    <td>1-168-544-4394</td>
                                                    <td>Nunc Inc.</td>
                                                    <td>12167</td>
                                                    <td>Pinkafeld</td>
                                                    <td>01/02/13</td>
                                                </tr>
                                                <tr>
                                                    <td>26</td>
                                                    <td>Kasper</td>
                                                    <td>1-153-221-5650</td>
                                                    <td>Rutrum Limited</td>
                                                    <td>M9N 0N6</td>
                                                    <td>Saint-G?ry</td>
                                                    <td>04/03/14</td>
                                                </tr>
                                                <tr>
                                                    <td>27</td>
                                                    <td>Otto</td>
                                                    <td>1-894-944-5767</td>
                                                    <td>Purus Maecenas Libero LLC</td>
                                                    <td>74552-602</td>
                                                    <td>Jauche</td>
                                                    <td>11/17/13</td>
                                                </tr>
                                                <tr>
                                                    <td>28</td>
                                                    <td>Brenda</td>
                                                    <td>1-783-562-8563</td>
                                                    <td>Sit Consulting</td>
                                                    <td>15632</td>
                                                    <td>Llandrindod Wells</td>
                                                    <td>08/13/14</td>
                                                </tr>
                                                <tr>
                                                    <td>29</td>
                                                    <td>Laith</td>
                                                    <td>1-482-317-8464</td>
                                                    <td>Tellus Limited</td>
                                                    <td>P8L 2V5</td>
                                                    <td>Codó</td>
                                                    <td>11/02/13</td>
                                                </tr>
                                                <tr>
                                                    <td>30</td>
                                                    <td>Ella</td>
                                                    <td>1-275-839-6518</td>
                                                    <td>Tincidunt Inc.</td>
                                                    <td>V8L 7Y0</td>
                                                    <td>Lummen</td>
                                                    <td>09/29/13</td>
                                                </tr>
                                                <tr>
                                                    <td>31</td>
                                                    <td>Hanae</td>
                                                    <td>1-339-661-4197</td>
                                                    <td>Nunc Incorporated</td>
                                                    <td>47931</td>
                                                    <td>South Burlington</td>
                                                    <td>05/19/14</td>
                                                </tr>
                                                <tr>
                                                    <td>32</td>
                                                    <td>Donna</td>
                                                    <td>1-236-575-1365</td>
                                                    <td>Ultricies Sem Incorporated</td>
                                                    <td>78685</td>
                                                    <td>Baranello</td>
                                                    <td>02/19/13</td>
                                                </tr>
                                                <tr>
                                                    <td>33</td>
                                                    <td>Bevis</td>
                                                    <td>1-955-717-0835</td>
                                                    <td>Est Ac Inc.</td>
                                                    <td>7424</td>
                                                    <td>Ichtegem</td>
                                                    <td>08/15/13</td>
                                                </tr>
                                                <tr>
                                                    <td>34</td>
                                                    <td>Celeste</td>
                                                    <td>1-368-137-6285</td>
                                                    <td>Tortor Nibh Sit Inc.</td>
                                                    <td>01318</td>
                                                    <td>Portobuffolè</td>
                                                    <td>05/28/14</td>
                                                </tr>
                                                <tr>
                                                    <td>35</td>
                                                    <td>Ila</td>
                                                    <td>1-315-684-6122</td>
                                                    <td>Gravida Sagittis Associates</td>
                                                    <td>4438PF</td>
                                                    <td>Keswick</td>
                                                    <td>11/22/13</td>
                                                </tr>
                                                <tr>
                                                    <td>36</td>
                                                    <td>Alana</td>
                                                    <td>1-586-261-7830</td>
                                                    <td>Nullam Industries</td>
                                                    <td>6044</td>
                                                    <td>Bacabal</td>
                                                    <td>03/04/13</td>
                                                </tr>
                                                <tr>
                                                    <td>37</td>
                                                    <td>Rowan</td>
                                                    <td>1-782-168-2387</td>
                                                    <td>Aliquet Consulting</td>
                                                    <td>33000</td>
                                                    <td>Papasidero</td>
                                                    <td>02/06/14</td>
                                                </tr>
                                                <tr>
                                                    <td>38</td>
                                                    <td>Eric</td>
                                                    <td>1-161-390-1140</td>
                                                    <td>Odio Institute</td>
                                                    <td>5652</td>
                                                    <td>Moliterno</td>
                                                    <td>03/14/13</td>
                                                </tr>
                                                <tr>
                                                    <td>39</td>
                                                    <td>Dana</td>
                                                    <td>1-989-320-2205</td>
                                                    <td>Bibendum Fermentum Institute</td>
                                                    <td>X31 1HZ</td>
                                                    <td>Saint-Pierre</td>
                                                    <td>02/25/13</td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>

                                    </div>
                                    <!-- end widget content -->

                                </div>
                                <!-- end widget div -->

                            </div>
                            <!-- end widget -->

                        </article>
                        <!-- WIDGET END -->

                    </div>

                    <!-- end row -->

                    <!-- end row -->

                </section>
                <!-- end widget grid -->

            </div>
            <!-- END MAIN CONTENT -->

        </div>
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
        <!-- END SHORTCUT AREA -->

        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script>
                                                            if (!window.jQuery) {
                                                                document.write('<script src="../../js/libs/jquery-2.0.2.min.js"><\/script>');
                                                            }
        </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>
                                                            if (!window.jQuery.ui) {
                                                                document.write('<script src="../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
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
        <script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
        <script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
        <script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
        <script type="text/javascript">

                                                            // DO NOT REMOVE : GLOBAL FUNCTIONS!

                                                            $(document).ready(function () {

                                                                pageSetUp();

                                                                /* // DOM Position key index //
                                                                         
                                                                 l - Length changing (dropdown)
                                                                 f - Filtering input (search)
                                                                 t - The Table! (datatable)
                                                                 i - Information (records)
                                                                 p - Pagination (paging)
                                                                 r - pRocessing 
                                                                 < and > - div elements
                                                                 <"#id" and > - div with an id
                                                                 <"class" and > - div with a class
                                                                 <"#id.class" and > - div with an id and class
                                                                         
                                                                 Also see: http://legacy.datatables.net/usage/features
                                                                 */

                                                                /* BASIC ;*/
                                                                var responsiveHelper_dt_basic = undefined;
                                                                var responsiveHelper_datatable_fixed_column = undefined;
                                                                var responsiveHelper_datatable_col_reorder = undefined;
                                                                var responsiveHelper_datatable_tabletools = undefined;

                                                                var breakpointDefinition = {
                                                                    tablet: 1024,
                                                                    phone: 480
                                                                };

                                                                $('#dt_basic').dataTable({
                                                                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                                                                            "t" +
                                                                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                                                                    "autoWidth": true,
                                                                    "preDrawCallback": function () {
                                                                        // Initialize the responsive datatables helper once.
                                                                        if (!responsiveHelper_dt_basic) {
                                                                            responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
                                                                        }
                                                                    },
                                                                    "rowCallback": function (nRow) {
                                                                        responsiveHelper_dt_basic.createExpandIcon(nRow);
                                                                    },
                                                                    "drawCallback": function (oSettings) {
                                                                        responsiveHelper_dt_basic.respond();
                                                                    }
                                                                });

                                                                /* END BASIC */

                                                                /* COLUMN FILTER  */
                                                                var otable = $('#datatable_fixed_column').DataTable({
                                                                    //"bFilter": false,
                                                                    //"bInfo": false,
                                                                    //"bLengthChange": false
                                                                    //"bAutoWidth": false,
                                                                    //"bPaginate": false,
                                                                    //"bStateSave": true // saves sort state using localStorage
                                                                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6 hidden-xs'f><'col-sm-6 col-xs-12 hidden-xs'<'toolbar'>>r>" +
                                                                            "t" +
                                                                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                                                                    "autoWidth": true,
                                                                    "preDrawCallback": function () {
                                                                        // Initialize the responsive datatables helper once.
                                                                        if (!responsiveHelper_datatable_fixed_column) {
                                                                            responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper($('#datatable_fixed_column'), breakpointDefinition);
                                                                        }
                                                                    },
                                                                    "rowCallback": function (nRow) {
                                                                        responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
                                                                    },
                                                                    "drawCallback": function (oSettings) {
                                                                        responsiveHelper_datatable_fixed_column.respond();
                                                                    }

                                                                });

                                                                // custom toolbar
                                                                $("div.toolbar").html('<div class="text-right"><img src="img/logo.png" alt="SmartAdmin" style="width: 111px; margin-top: 3px; margin-right: 10px;"></div>');

                                                                // Apply the filter
                                                                $("#datatable_fixed_column thead th input[type=text]").on('keyup change', function () {

                                                                    otable
                                                                            .column($(this).parent().index() + ':visible')
                                                                            .search(this.value)
                                                                            .draw();

                                                                });
                                                                /* END COLUMN FILTER */

                                                                /* COLUMN SHOW - HIDE */
                                                                $('#datatable_col_reorder').dataTable({
                                                                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'C>r>" +
                                                                            "t" +
                                                                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
                                                                    "autoWidth": true,
                                                                    "preDrawCallback": function () {
                                                                        // Initialize the responsive datatables helper once.
                                                                        if (!responsiveHelper_datatable_col_reorder) {
                                                                            responsiveHelper_datatable_col_reorder = new ResponsiveDatatablesHelper($('#datatable_col_reorder'), breakpointDefinition);
                                                                        }
                                                                    },
                                                                    "rowCallback": function (nRow) {
                                                                        responsiveHelper_datatable_col_reorder.createExpandIcon(nRow);
                                                                    },
                                                                    "drawCallback": function (oSettings) {
                                                                        responsiveHelper_datatable_col_reorder.respond();
                                                                    }
                                                                });

                                                                /* END COLUMN SHOW - HIDE */

                                                                /* TABLETOOLS */
                                                                $('#datatable_tabletools').dataTable({
                                                                    // Tabletools options: 
                                                                    //   https://datatables.net/extensions/tabletools/button_options
                                                                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'T>r>" +
                                                                            "t" +
                                                                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
                                                                    "oTableTools": {
                                                                        "aButtons": [
                                                                            "copy",
                                                                            "csv",
                                                                            "xls",
                                                                            {
                                                                                "sExtends": "pdf",
                                                                                "sTitle": "SmartAdmin_PDF",
                                                                                "sPdfMessage": "SmartAdmin PDF Export",
                                                                                "sPdfSize": "letter"
                                                                            },
                                                                            {
                                                                                "sExtends": "print",
                                                                                "sMessage": "Generated by SmartAdmin <i>(press Esc to close)</i>"
                                                                            }
                                                                        ],
                                                                        "sSwfPath": "../../js/DataTables-1.10.4/media/js/copy_csv_xls_pdf.swf"
                                                                    },
                                                                    "autoWidth": true,
                                                                    "preDrawCallback": function () {
                                                                        // Initialize the responsive datatables helper once.
                                                                        if (!responsiveHelper_datatable_tabletools) {
                                                                            responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper($('#datatable_tabletools'), breakpointDefinition);
                                                                        }
                                                                    },
                                                                    "rowCallback": function (nRow) {
                                                                        responsiveHelper_datatable_tabletools.createExpandIcon(nRow);
                                                                    },
                                                                    "drawCallback": function (oSettings) {
                                                                        responsiveHelper_datatable_tabletools.respond();
                                                                    }
                                                                });

                                                                /* END TABLETOOLS */

                                                            })

        </script>

        <!-- Your GOOGLE ANALYTICS CODE Below -->
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
            _gaq.push(['_trackPageview']);

            (function () {
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