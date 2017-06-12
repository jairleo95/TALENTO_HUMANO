<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.X_Detalle_Privilegio"%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<%@page import="pe.edu.upeu.application.model.Privilegio"%>
<jsp:useBean id="List_det_pri_id" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Privilegio" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title></title>
                <link rel="stylesheet" href="../../../css/Css_Lista/listas.css" />
                <link rel="stylesheet" href="../../../css/Css_DGP/estilos.css" />
                <link rel="stylesheet" href="../../../css/Css_DGP//chosen.css">
                <script src="../../../js/businessLogic/Dgp/abc.js"></script>
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
               /* //font-size:34px; 
               // margin: 5px;*/
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
        <H1 class="title">MODIFICAR PRIVILEGIO</h1>
        <form class="form" action="../../../Privilegio" method="post"> 
            <% for (int i=0; i< List_det_pri_id.size();i++ ){
                    X_Detalle_Privilegio d=new X_Detalle_Privilegio();
                    d=(X_Detalle_Privilegio)List_det_pri_id.get(i);
                %>
            <table class="table" >
                <tr><td>Rol :</td>
                    <td><%=d.getNo_rol()%><%=d.getEs_datalle_privilegio()%><input type="hidden" name="id_det_pr" value="<%=d.getId_detalle_privilegio()%>"></td>
                </tr>
                <tr><td>Privilegio :</td>
                    <td><select  name="id_Priv" class="text-box chosen-select" required="">
                <%for(int a=0;a<List_Privilegio.size();a++){
                Privilegio p=new Privilegio();
                p=(Privilegio)List_Privilegio.get(a);
                %>

                <% if(p.getId_privilegio().trim().equals(d.getId_privilegio().trim())){%>
                <option value="<%=p.getId_privilegio()%>" selected=""><%=p.getNo_link()%></option>
                <%}else{%>
                <option value="<%=p.getId_privilegio()%>" ><%=p.getNo_link()%></option>
                <%}%>
                <%}%>
                </select></td>
                </tr>
                <tr><td>Nro de orden:</td><td><input type="number" name="Nu_Orden" value="<%=d.getNu_orden()%>"  maxlength="5"></td></tr>
                <tr><td>Estado de Privilegio otorgado</td>
                <td><select name="Es_detalle_privilegio" required="">
                <%if(d.getEs_datalle_privilegio().trim().equals("1")){%>
                <option value="1" selected="">Activado</option>
                <option value="0" >Desactivado</option>
                <%}else{%>
                <option value="1" >Activado</option>
                <option value="0"  selected="">Desactivado</option>
                <%}%>
                    </select></td></tr>
                <tr><td colspan="2"><input type="hidden" name="opc" value="Mod_det_pr2"> <input type="submit" value="MODIFICAR ROL PRIVILEGIO" ></tr>    
                
                <%}%>
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
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
