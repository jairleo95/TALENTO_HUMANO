<%-- 
    Document   : steps
    Created on : 01-sep-2014, 12:19:06
    Author     : Docente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css-steps/normalize.css">
        <link rel="stylesheet" href="css-steps/main.css">
        <link rel="stylesheet" href="css-steps/jquery.steps.css">
        <script src="js-steps/modernizr-2.6.2.min.js"></script>
        <script src="js-steps/lib/jquery-1.9.1.min.js"></script>
        <script src="js-steps/lib/jquery.cookie-1.3.1.js"></script>
        <script src="js-steps/build/jquery.steps.js"></script>
    </head>
    <body>
        <header>
            <h1>Wizard Demo</h1>
            <nav>
                <ul>
                    <li><a href="index.html">Basic</a></li>
                    <li><a href="vertical.html">Vertical</a></li>
                    <li><a href="tabs.html">Tabs</a></li>
                </ul>
            </nav>
        </header>

        <div class="content">
            <h1>Basic Demo</h1>

            <script>
                $(function ()
                {
                    $("#wizard").steps({
                        headerTag: "h2",
                        bodyTag: "section",
                        transitionEffect: "slideLeft",
                        stepsOrientation: "vertical"
                    });
                });
            </script>

            <div id="wizard">
                <h2>First Step</h2>
                <section>
                    <form>
                        <label>Nombres:</label><br>
                        <input type="text" name="nombre" >
                            
                    </form>
                </section>

                <h2>Second Step</h2>
                <section>
                    <p>Donec mi sapien, hendrerit nec egestas a, rutrum vitae dolor. Nullam venenatis diam ac ligula elementum pellentesque. 
                        In lobortis sollicitudin felis non eleifend. Morbi tristique tellus est, sed tempor elit. Morbi varius, nulla quis condimentum 
                        dictum, nisi elit condimentum magna, nec venenatis urna quam in nisi. Integer hendrerit sapien a diam adipiscing consectetur. 
                        In euismod augue ullamcorper leo dignissim quis elementum arcu porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                        Vestibulum leo velit, blandit ac tempor nec, ultrices id diam. Donec metus lacus, rhoncus sagittis iaculis nec, malesuada a diam. 
                        Donec non pulvinar urna. Aliquam id velit lacus.</p>
                </section>

                <h2>Third Step</h2>
                <section>
                    <p>Morbi ornare tellus at elit ultrices id dignissim lorem elementum. Sed eget nisl at justo condimentum dapibus. Fusce eros justo, 
                        pellentesque non euismod ac, rutrum sed quam. Ut non mi tortor. Vestibulum eleifend varius ullamcorper. Aliquam erat volutpat. 
                        Donec diam massa, porta vel dictum sit amet, iaculis ac massa. Sed elementum dui commodo lectus sollicitudin in auctor mauris 
                        venenatis.</p>
                </section>

                <h2>Forth Step</h2>
                <section>
                    <p>Quisque at sem turpis, id sagittis diam. Suspendisse malesuada eros posuere mauris vehicula vulputate. Aliquam sed sem tortor. 
                        Quisque sed felis ut mauris feugiat iaculis nec ac lectus. Sed consequat vestibulum purus, imperdiet varius est pellentesque vitae. 
                        Suspendisse consequat cursus eros, vitae tempus enim euismod non. Nullam ut commodo tortor.</p>
                </section>
            </div>
        </div>
    </body>
</html>
