
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Shadowbox.js</title>
<link rel="stylesheet" type="text/css" href="../js/shadowbox/style.css">

<!-- the following line is only required to run the demos -->
<script type="text/javascript" src="../js/shadowbox/demo.js"></script>

<!-- this section is the only one needed to run Shadowbox -->
<link rel="stylesheet" type="text/css" href="../js/shadowbox/shadowbox.css">
<script type="text/javascript" src="../js/shadowbox/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
    // a darker overlay looks better on this particular site
    overlayOpacity: 0.8
    // setupDemos is defined in assets/demo.js
}, setupDemos);
</script>

</head>

<body>
<div id="outer-wrapper">

<div id="stripe"></div>

<div id="wrapper">

    <div id="header">
        <a href="index.html"><img alt="Shadowbox.js" src="assets/logo.gif"></a>
    </div>

    <ul id="nav">
        <li><a class="selected">Home</a></li>
        <li><a href="download.html">Download</a></li>
        <li><a href="support.html">Support</a></li>
        <li><a href="usage.html">Usage</a></li>
        <li><a href="options.html">Options</a></li>
        <li><a href="api.html">API</a></li>
        <li><a href="faq.html">FAQ</a></li>
        <li><a href="forum.html">Forum</a></li>
    </ul>

    <div id="content">

        <div id="download-callout">
            <div style="height:42px;text-align:center;margin-bottom:18px"><a href="download.html"><img src="assets/button-download.png" alt="Download Shadowbox.js"></a></div>
            <p><a href="#license">Commercial licenses</a> are available for developers that would like to use Shadowbox on a commercial website.</p>
        </div>

        <p>Shadowbox is a web-based media viewer application that supports all of the web's <a href="support.html#media">most popular</a> media publishing formats. Shadowbox is written entirely in JavaScript and CSS and is <a href="options.html">highly customizable</a>. Using Shadowbox, website authors can showcase a wide assortment of media in <a href="support.html#browsers">all major browsers</a> without navigating users away from the linking page.</p>

        <h2><a name="features">Features</a></h2>

        <p>What sets Shadowbox apart from every other "box" out there?</p>

        <div id="features">

            <div id="feature-standards" class="feature left">
                <div class="feature-title">Standards</div>
                <div class="feature-text">Shadowbox uses HTML markup that <a href="http://validator.w3.org/check/referer">validates</a>. It doesn't depend on phony HTML attributes in your anchor tags to make it work. The web has enough problems with <a href="http://www.webstandards.org/">standards</a> compliance as it is, and Shadowbox does its best to not perpetuate them.</div>
            </div>

            <div id="feature-smarts" class="feature">
                <div class="feature-title">Smart</div>
                <div class="feature-text">Shadowbox uses a smart plugin detection mechanism behind the scenes that can spare your users from confusing torn image or puzzle piece icons when they don't have the plugins they need to view your content. Also, it will never overflow the viewport, forcing those obnoxious scroll bars.</div>
            </div>

            <div id="feature-free" class="feature left">
                <div class="feature-title">Free from Frameworks</div>
                <div class="feature-text">Although Shadowbox has the unique ability to <a href="support.html#adapters">adapt</a> to whatever JavaScript framework you choose, it's just as easy to run it as a standalone app, giving the developer a great deal of flexibility.</div>
            </div>

            <div id="feature-media" class="feature">
                <div class="feature-title">Flexible</div>
                <div class="feature-text">Shadowbox supports all of the web's <a href="support.html#media">most popular</a> media publishing formats including images, QuickTime, Windows Media Player, Flash, Flash video, HTML, and even external web pages. This makes it easy to display your content, no matter what it is.</div>
            </div>

            <div id="feature-customize" class="feature left">
                <div class="feature-title">Customizable</div>
                <div class="feature-text">Shadowbox supports a host of <a href="options.html">options</a> that make it highly configurable. If you don't like the way something works, chances are very good that you can change it without digging through the code.</div>
            </div>

            <div id="feature-universal" class="feature">
                <div class="feature-title">Universal</div>
                <div class="feature-text">Shadowbox ships with support for many of the world's most-spoken languages, making it easy to <a href="download.html">configure</a> Shadowbox to communicate with your visitors in their native tongue.</div>
            </div>

            <div id="feature-neat" class="feature left">
                <div class="feature-title">Neat and Compact</div>
                <div class="feature-text">The Shadowbox code is neat, modular, and compact. Create a <a href="download.html">custom build</a> of the code that includes just the features you need so it's as lightweight as possible.</div>
            </div>

            <div id="feature-smiley" class="feature">
                <div class="feature-title">Plays Well with Others</div>
                <div class="feature-text">Shadowbox tries to be as unobtrusive as possible. If your client doesn't have JavaScript enabled, it will stay completely out of the way and allow the page to function normally.</div>
            </div>

            <div style="clear:both;"></div>

        </div>

        <h2><a name="examples">Examples</a></h2>

        <p>The simplest way to use Shadowbox is to display a single piece of content, with a thumbnail link on the page. When the user clicks on the thumbnail, Shadowbox will open to display a larger version of the image.</p>

        <table class="thumbs" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td><a rel="shadowbox" href="Dgp/Documento/Archivo/101650_14null_PAISAJES-NATURALES.JPG"><img alt="Tiger" class="border" src="Dgp/Documento/Archivo/101650_14null_PAISAJES-NATURALES.JPG"></a></td>
                    <td><a rel="shadowbox" href="Dgp/Documento/Archivo/101650_14null_PAISAJES-NATURALES.JPG"><img alt="Colours" class="border" src="Dgp/Documento/Archivo/101650_14null_PAISAJES-NATURALES.JPG"></a></td>
                </tr>
            </tbody>
        </table>

        <p>Content may also be arranged in a gallery for viewing all together. The gallery below uses a <a href="options.html#countertype">"skip"-style counter</a> and is <a href="options.html#continuous">continuous</a>.</p>

        <table class="thumbs" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td><a class="mustang-gallery" href="Dgp/Documento/Archivo/101650_14null_PAISAJES-NATURALES.JPG"><img src="Dgp/Documento/Archivo/101650_14null_PAISAJES-NATURALES.JPG" alt="Red Mustang" class="border"></a></td>
                    <td><a class="mustang-gallery" href="Dgp/Documento/Archivo/101650_14null_PAISAJES-NATURALES.JPG" title="Blue Mustang"><img src="Dgp/Documento/Archivo/101650_14null_PAISAJES-NATURALES.JPG" alt="Blue Mustang" class="border"></a></td>
                    <td><a class="mustang-gallery" href="Dgp/Documento/Archivo/101650_14null_PAISAJES-NATURALES.JPG"><img src="Dgp/Documento/Archivo/101650_14null_PAISAJES-NATURALES.JPG" alt="Grey Mustang" class="border"></a></td>
                </tr>
            </tbody>
        </table>

        <p>Shadowbox is able to display Flash through the use of Adobe's Flash Player browser plugin. If Flash is not available, the user will be prompted to download and install it before they can view the content.</p>

        <table class="thumbs" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td><a rel="shadowbox;width=400;height=300" title="Girl Skipping" href="gallery/skip.swf"><img src="gallery/skip-thumb.gif" alt="" class="border"></a></td>
                    <td>
                        <a class="swf-gallery" rel="width=520;height=390" title="Caveman" href="gallery/caveman.swf"><img src="gallery/caveman-thumb.gif" alt="" class="border"></a>
                        <a class="swf-gallery hidden" rel="width=600;height=450" title="Hollywood or Bust" href="gallery/old_man.swf">swf</a>
                        <a class="swf-gallery hidden" rel="width=400;height=300" title="Girl Skipping" href="gallery/skip.swf">swf</a>
                    </td>
                </tr>
                <tr>
                    <td>Single SWF</td>
                    <td>SWF Gallery</td>
                </tr>
            </tbody>
        </table>

        <p>In addition to images and Flash, Shadowbox supports all of the web's most popular movie formats including QuickTime, Flash video, and Windows Media Player.</p>

        <table class="thumbs" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td><a rel="shadowbox;width=405;height=340;player=swf" title="Ebon Coast" href="http://www.youtube.com/v/lSnWhsmlGec&amp;hl=en&amp;fs=1&amp;rel=0&amp;autoplay=1"><img src="gallery/mckee-thumb.jpg" alt="" class="border"></a></td>
                    <td><a rel="shadowbox;width=480;height=204" title="The Dark Knight" href="http://trailers.apple.com/movies/wb/the_dark_knight/the_dark_knight-tlr2_h.480.mov"><img src="gallery/darkknight-thumb.jpg" alt="" class="border"></a></td>
                    <td><a title="Sweetness" href="http://d.yimg.com/static.video.yahoo.com/yep/YV_YEP.swf?ver=2.2.40"><img src="gallery/sweetness-thumb.jpg" alt="" class="border"></a></td>
                </tr>
                <tr>
                    <td>YouTube</td>
                    <td>QuickTime</td>
                    <td>Yahoo! Video</td>
                </tr>
            </tbody>
        </table>

        <table class="thumbs" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td><a title="The Last Eggtion Hero" href="http://vimeo.com/moogaloop.swf"><img src="gallery/eggtion-thumb.jpg" alt="" class="border"></a></td>
                    <td><a title="While My Ukulele Gently Weeps" href="http://video.google.com/googleplayer.swf"><img src="gallery/ukulele-thumb.jpg" alt="" class="border"></a></td>
                    <td><a rel="shadowbox;width=600;height=450" title="Alien" href="gallery/alien.flv"><img src="gallery/alien-thumb.gif" alt="" class="border"></a></td>
                </tr>
                <tr>
                    <td>Vimeo</td>
                    <td>Google Video</td>
                    <td>Flash Video</td>
                </tr>
            </tbody>
        </table>

        <p>When displaying images, you have some flexibility in deciding how the image will appear in browsers that are too small to display the entire image at once. The following three examples display the same image but each uses a different value for the <a href="options.html#handleoversize">handleOversize option</a>. Note: You may have to shrink your browser window to view the difference between the various options here.</p>

        <p>
            <a class="option" rel="shadowbox" href="gallery/tiger-large.jpg" title="Altaic Warrior">Resized (the default)</a>
            <a class="option" href="gallery/tiger-large.jpg" title="Altaic Warrior - Clipped">Clipped (no resizing is done)</a>
            <a class="option" href="gallery/tiger-large.jpg" title="Altaic Warrior - Draggable">Draggable</a>
        </p>

        <div class="break"></div>

        <p>Many more examples can be found in the <a href="http://github.com/mjijackson/shadowbox/tree/master/examples/">source</a>.</p>

        <h2><a name="license">License</a></h2>

        <p>Shadowbox is licensed under the terms of the <a rel="license" href="LICENSE">Shadowbox.js License</a>. This license grants personal, non-commercial users the right to use Shadowbox without paying a fee. It also provides an option for users who wish to use Shadowbox for commercial purposes. You are encouraged to review the terms of the license before using Shadowbox.</p>

        <p>If you would like to use Shadowbox for commercial purposes, you can purchase a license that allows you to use it on an unlimited number of commercial domains. Commercial licenses are available in two flavors: one for a single developer and one for any number of developers at a single agency or company. The form below will let you purchase both types of licenses securely via PayPal.</p>

        <div id="purchase-callout">
        <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
            <input type="hidden" name="cmd" value="_s-xclick">
            <input type="hidden" name="hosted_button_id" value="4497898">
            <input type="hidden" name="on0" value="License type">
            <input type="hidden" name="currency_code" value="USD">
            <input type="hidden" name="return" value="http://shadowbox-js.com/purchase">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr><td style="padding-bottom:0;">
                    License type:
                    <select name="os0">
                        <option value="Single Developer">Single Developer $20.00 USD</option>
                        <option value="Multiple Developers">Multiple Developers $50.00 USD</option>
                    </select>
                </td></tr>
                <tr><td>
                    <input type="image" src="assets/button-purchase.png" name="submit" alt="Purchase a license with PayPal - it's fast, free and secure!">
                </td></tr>
            </table>
        </form>
        </div>

        <h2><a name="credits">Credits</a></h2>

        <p>Shadowbox was inspired by <a href="http://www.huddletogether.com/projects/lightbox2/">Lightbox</a> and <a href="http://www.stickmanlabs.com/lightwindow/">LightWindow</a>. Credit should be given to the authors of those libraries for the basic idea behind Shadowbox.</p>
        <p><a href="http://www.flickr.com/photos/shanegorski/2515009456/">Altaic Warrior</a> is the work of <a href="http://www.flickr.com/photos/shanegorski">Shane Gorski</a> and is used under the terms of the <a href="http://creativecommons.org/licenses/by-nd/2.0/deed.en">Creative Commons Attribution-No Derivative 2.0 License</a>.</p>
        <p><a href="http://www.flickr.com/photos/iloveblue/2977659000/">Colours</a> is the work of <a href="http://www.flickr.com/photos/iloveblue">Scarleth White</a> and is used under the terms of the <a href="http://creativecommons.org/licenses/by/2.0/deed.en">Creative Commons Attribution 2.0 License</a>.</p>
        <p>All Flash animation pieces are the original work of <a href="http://flashpotatoes.com/">Wyatt Miles</a>.</p>

    </div>

    <div id="push"></div>

</div>

</div>

<div id="footer">
    <p>Copyright &copy; 2007-2010 <a href="http://mjijackson.com/">Michael J. I. Jackson</a></p>
</div>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-998116-7");
pageTracker._trackPageview();
} catch(err) {}
</script>
</body>

</html>