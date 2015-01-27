<%-- 
    Document   : POST_FECHA
    Created on : 23-ene-2015, 12:01:18
    Author     : ALFA 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <style type="text/css">
            *, *:after, *:before {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Open Sans";
            }


            /* Form Progress */
            .new-progress {
                width: 100%;
                //  margin: 20px auto;
                text-align: center;
            }
            .new-progress .new-circle,
            .new-progress .new-bar {
                display: inline-block;
                background: #fff;
                width: 33px; height: 33px;
                border-radius: 100%;
                border: 1px solid #d5d5da;
            }
            .new-progress .new-bar {
                position: relative;
                 display: inline-block;
                width: 30px;
                height: 6px;
                //margin: 0 -0.01% 3% -5px;
                border-left: none;
                border-right: none;
                border-radius: 0;
            }

            .new-progress .new-circle .new-label {
                display: inline-block;
                width: 25px;
                height: 25px;
               // line-height: 32px;
                border-radius: 32px;
                margin-top: 3px;
                color: #b5b5ba;
               // font-size: 17px;
            }
            .new-progress .new-circle .new-title {
                color: #b5b5ba;
                font-size: 70%;
                //line-height: 30px;
                //margin-left: -5px;
            }

            /* Done / Active */
            .new-progress .new-bar.done,
            .new-progress .new-circle.done {
               background: #eee;
            }
            .new-progress .new-bar.active {
                background: linear-gradient(to right, #EEE 40%, #FFF 60%);
            }
            .new-progress .new-circle.done .new-label {
                color: #FFF;
                background: #8bc435;
                box-shadow: inset 0 0 2px rgba(0,0,0,.2);
            }
            .new-progress .new-circle.done .new-title {
                color: #444;
            }
            .new-progress .new-circle.active .new-label {
                color: #FFF;
                background: #0c95be;
                box-shadow: inset 0 0 2px rgba(0,0,0,.2);
            }
            .new-progress .new-circle.active .new-title {
                color: #0c95be;
            }

        </style>
        <script type="text/javascript" src="js/JQuery/jQuery.js" ></script>
    </head>
    <body>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
        <div class="new-progress">
            <div class="new-circle done">
                <span class="new-label">1</span>
                <span class="new-title">P1</span>
            </div>
            <span class="new-bar done"></span>
            <div class="new-circle done">
                <span class="new-label">2</span>
                <span class="new-title">P2</span>
            </div>
            <span class="new-bar half"></span>
            <div class="new-circle active">
                <span class="new-label">3</span>
                <span class="new-title">P3</span>
            </div>
            <span class="new-bar"></span>
            <div class="new-circle">
                <span class="new-label">4</span>
                <span class="new-title">P4</span>
            </div>
            <span class="new-bar"></span>
            <div class="new-circle">
                <span class="new-label">5</span>
                <span class="new-title">P5</span>
            </div>
            <span class="new-bar"></span>
            <div class="new-circle">
                <span class="new-label">6</span>
                <span class="new-title">P6</span>
            </div>
            <span class="new-bar"></span>
            <div class="new-circle">
                <span class="new-label">7</span>
                <span class="new-title">xx</span>
            </div>
            <span class="new-bar"></span>
            <div class="new-circle">
                <span class="new-label">8</span>
                <span class="new-title">xx</span>
            </div>
            <span class="new-bar"></span>
            <div class="new-circle">
                <span class="new-label">9</span>
                <span class="new-title">xx</span>
            </div>
            <span class="new-bar"></span>
            <div class="new-circle">
                <span class="new-label">10</span>
                <span class="new-title">xx</span>
            </div>
            <span class="new-bar"></span>
            <div class="new-circle">
                <span class="new-label">11</span>
                <span class="new-title">xx</span>
            </div>
            <span class="new-bar"></span>
            <div class="new-circle">
                <span class="new-label">12</span>
                <span class="new-title">xx</span>
            </div>
        </div>


    </body>
    <script type="text/javascript">
        var i = 1;
        $('.new-progress .new-circle').removeClass().addClass('new-circle');
        $('.new-progress .new-bar').removeClass().addClass('new-bar');
        setInterval(function () {
            if (i < 6) {
                $('.new-progress .new-circle:nth-of-type(' + i + ')').addClass('active');

                $('.new-progress .new-circle:nth-of-type(' + (i - 1) + ')').removeClass('active').addClass('done');

                $('.new-progress .new-circle:nth-of-type(' + (i - 1) + ') .new-label').html('&#10003;');

                $('.new-progress .new-bar:nth-of-type(' + (i - 1) + ')').addClass('active');

                $('.new-progress .new-bar:nth-of-type(' + (i - 2) + ')').removeClass('active').addClass('done');

                i++;

                if (i == 0) {
                    $('.new-progress .new-bar').removeClass().addClass('new-bar');
                    $('.new-progress div.new-circle').removeClass().addClass('new-circle');
                    i = 1;
                }
            }
        }, 200);

    </script>
</html>
