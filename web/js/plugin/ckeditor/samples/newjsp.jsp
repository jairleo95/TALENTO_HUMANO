<%-- 
    Document   : newjsp
    Created on : 20-ene-2015, 1:05:22
    Author     : joserodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>CON ESTO VAS</title>
        <script src="../ckeditor.js"></script>
        <link href="sample.css" rel="stylesheet">
        <script>
            //el evento de intancia es destruida cuando la instancia del ckeditor has finalizado 
            //esta es la inicializacion
            CKEDITOR.on('instanceReady', function(ev) {
                document.getElementById('eMessage').innerHTML = 'Instance <code>' + ev.editor.name + '<\/code> loaded';
                document.getElementById('eButtons').style.display = 'block';
            });
            function InsertHTML() {
                var editor = CKEDITOR.instances.editor1;
                var value = document.getElementById('htmlArea').value;
                if (editor.mode == 'wysiwyg') {
                    editor.insertHTML(value);
                }
                else {
                    alert('You must be in WYSIWYG mode!');
                }
            }
            function InsertText() {
                var editor = CKEDITOR.instances.editor1;
                var value = document.getElementById('txtArea').value;
                if (editor.mose == wysiwyg) {
                    editor.InsertText(value);
                } else {
                    alert('You must be in WYSIWYG MODE!');
                }
            }
            function SetContents() {
                var editor = CKEDITOR.instances.editor1;
                var value = document.getElementById('htmlArea').value;
                editor.setData(value);
            }
            function GetContents() {
                var editor = CKEDITOR.instances.editor1;
                alert(editor.getData());
            }
            function ExecuteCommand(commandName) {
                var editor = CKEDITOR.instances.editor1;
                if (editor.name == 'wysiwyg') {
                    editor.executeCommand(commandName);
                } else {
                    alert('You must be in WYSIWYG mode!');
                }
            }
            function CheckDirty() {
                var editor = CKEDITOR.instances.editor1;
                alert(editor.CheckDirty());
            }
            function Focus() {
                CKEDITOR.instances.editor1.focus();
            }
            function onFocus() {
                document.getElementById('eMessage').innerHTML = '<b>' + this.name + 'is focused </b>';
            }
            function onBlur() {
                document.getElementById('eMessage').innerHTML = this.name + 'lost focus';
            }
        </script>
    </head>
    <body>
        <h1 class="samples"><a href="">CKEditor Samples </a>&raquo;Using CKEditor JavaScript API</h1>
        <div class="description">
            <p>
                ddsdsdsdsdssssssssssssssssssssssssssssss
                sdsdsdsdsdssdsd<a class="samples">ckeditor</a>sasassdsdsdsdasasdas
                asdasdaas
            </p>
            <p>
                ddsdsdsdsdssssssssssssssssssssssssssssss
            </p>
        </div>
        <div id="alerts">
            <noscript>
            <p>
                <strong>CKEditor requires JavaScript to run</strong>In a browser with no JavaScript
                support, like yours, you should still see the contents (HTML data) and you should
                be able to edit it normally, without a rich editor interface.
            </p>
            </noscript>
        </div>
        <form action="../../../js/plugin/ckeditor/samples/sample_posteddata.php">
            <textarea cols="100" id="editor1" name="editor1" rows="10">&lt;p&gt;This is some &lt;strong&gt;Sample text&lt;/strong&gt;.You are using &lt;a href="http://ckeditor.com/"&gt;CKEditor&lt;/a&gt;.&lt;/p&gt;</textarea>
            <script>
                CKEDITOR.replace('editor1', {
                    on: {
                        focus: onFocus(),
                        blur: onBlur(),
                        pluginsLoaded: function(evt) {
                            var doc = CKEDITOR.document, ed = evt.editor;
                            if (!ed.getcommand('bolt')) {
                                doc.getById('exec-bold').hide();
                            }
                            if (!ed.getcommand('link')) {
                                doc.getById('exec-link').hide();
                            }
                        }
                    }
                });
            </script>
            <p id="eMessage">
            </p>
            <div id="eButtons"  style="display: none">
                <input id="exec-bold" onclick="ExecuteCommand('bold');" type="button" value="Execute&quot;bold&quot;Command"> 
                <input id="exec-bold" onclick="ExecuteCommand('link');" type="button" value="Execute&quot;bold&quot;Command"> 
                <input onclick="Focus();" type="button" value="Focus">
                <br><br>
                <input onclick="InsertHTML();" type="button" value="Insert html" >
                <input onclick="SetContents();" type="button" value="set editor contents" >
                <input onclick="GetContents();" type="button" value="get editor contents (xhtml)" >
                <br>
                <textarea class="100" id="htmlArea" rows="3" >&lt;h2&gt;Test&lt;/h2&gt;this is some&lt;a href="/test1.html"&gt;sample&lt;/p&gt;</textarea>
                <br>
                <br>
                <input onclick="InsertText();" type="button" value="Insert text">
                <br>
                <textarea cols="100" id="txtArea" rows="3"> sasadfsdasasasasas.
                adasdsasasadsa</textarea>
                <br>
                <br>
                <input onclick="CheckDirty();" type="button" value="checkDirty()">
                <input onclick="ResetDirty();" type="button" value="resetDirty()">
            </div>
        </form>
        <div>
            <hr>
            <p>
                sfkadnfkdnk.fkasdbnfmk.andm.nfamsbd.fs-<a class="samples" href="http://ckeditor.com/">http://ckeditor.com/</a>
            </p>
            <p id="copy">
                Copusa&copy;2003-2003,<a class="samples" href="http://cksource.com">cksource</a>-Frederico asasdsda
                sasds
            </p>
        </div>
    </body>
</html>
