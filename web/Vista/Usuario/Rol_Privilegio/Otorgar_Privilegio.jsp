<%@page import="pe.edu.upeu.application.model.Rol"%>
<%@page import="pe.edu.upeu.application.model.Privilegio"%>
<jsp:useBean id="List_Rol" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Privilegio" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title></title>
                <link rel="stylesheet" href="../../../css/Css_Lista/listas.css" />
                <link rel="stylesheet" href="../../../css/Css_DGP/estilos.css" />
                <link rel="stylesheet" href="../../../css/Css_DGP//chosen.css">
                <script src="../../../js/Js_DGP/abc.js"></script>
                <script src="../../../js/Js_Formulario/organictabs.jquery.js"></script>
                <style type="text/css">

            .submit{
                margin:10px;
                margin-left:0px;
                width: 100%;
                height:90%;
                color:white;
                background-color: #0575f4 ;

            }
            .tab-mant{
                margin:10px;   
            }   
            .lab-mant{
                color:#0575f4;  
                //font-size:34px; 
               // margin: 5px;
            }
            .body{
                background-color: #EEE;

            }
          
            td{
                text-align: left;
            }
        </style>
    </head>
    <body>
    <center>
        <H1 class="title">OTORGAR PRIVILEGIOS</h1>
        <form class="form" action="../../../Privilegios" method="post"> 
            <table class="table" >  
                <tr><td>Rol :</td>
                <td><select  name="Id_Rol"  class="text-box chosen-select" class="text-box" required="">
                <%for(int i=0;i<List_Rol.size();i++){
                Rol r=new Rol();
                r=(Rol)List_Rol.get(i);
                %>
                <option value=" <%=r.getId_rol()%>" ><%=r.getNo_rol()%></option>
                <%}%>
                </select></td>
                </tr>
                
                <tr><td>Privilegio a Otorgar :</td>
                    <td><select  name="id_Priv" class="text-box chosen-select" required="">
                <%for(int a=0;a<List_Privilegio.size();a++){
                Privilegio p=new Privilegio();
                p=(Privilegio)List_Privilegio.get(a);
                %>
                <option value="<%=p.getId_privilegio()%>"><%=p.getNo_link()%></option>
                <%}%>
                </select></td>
                </tr>
                
                <tr><td>Nro de orden:</td><td><input type="number" name="Nu_Orden" ></td></tr>
                <tr><td>Estadod de Privilegio otorgado</td><td><select name="Es_detalle_privilegio" required="">
                    <option value="1">Activado</option>
                    <option value="0">Desactivado</option>
                </select></td></tr>
                <tr><td colspan="2"> <input type="submit" value="REGISTRAR PRIVILEGIO DADO" name="opc"></tr>
            </table>
       </form>
   </center>
    <br><br>
    </body>
    <script src="../../../js/prism.js" type="text/javascript" charset="utf-8"></script>
 <script src="../../../js/chosen.jquery.js" type="text/javascript"></script>
 <script src="../../../js/prism.js" type="text/javascript" charset="utf-8"></script>
   <script type="text/javascript">
                            var config = {
                                '.chosen-select': {},
                                '.chosen-select-deselect': {allow_single_deselect: true},
                                '.chosen-select-no-single': {disable_search_threshold: 10},
                                '.chosen-select-no-results': {no_results_text: 'Oops, nothing found!'},
                                '.chosen-select-width': {width: "95%"}
                            }
                            for (var selector in config) {
                                $(selector).chosen(config[selector]);
                            }
</script>
</html>
<%@include file="List_Pri_Roles.jsp" %>