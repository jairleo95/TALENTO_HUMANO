<%@page import="pe.edu.upeu.application.model.Area"%>
<?
session_start();
if (isset($_SESSION['IDUSER'])) {
    $iddep = $_SESSION["IDDEPARTAMENTO"];
    ?>
    <jsp:useBean id="List_Area" scope="application" class="java.util.ArrayList"/>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
            <title>Contratos</title>  
            <link rel="stylesheet" href="../../css/Css_Sort/style.css" />
            <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
            <script type="text/javascript" src="../../js/JQuery/jquery-ui-1.8.16.custom.min.js"></script>
            <script type="text/javascript" src="../../js/Js_Busc_Contrato/js_contratacion.js"></script>
            <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
            <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
            <link rel="stylesheet" href="../../css1/bootstrap.min.css" >
            
             <style>
                #contenido{
                    margin: auto;
                    
                }
                #form{
                    width: 40%;
                     margin: auto;
                     
                }
                #table{
                    width: 70%;
                     margin: auto;
                     
                }
                
            </style>
        </head>
        
        <body class="body" style="height: 1024px;">  
            <div class="spacing">
                <center><h1 class="spacing" style="font-weight: bold;">Contratos</h1></center>
            </div> 
            <br>
        <center>
            <div id="contenido">
                <div id="form">   
                 <form id="frm_filtro" method="post" action="">
                        <div class="row">
                            <div class="col-xs-6">
                                <label>Fecha de Contratación:</label><br>
                                 <input type="date" name="del"  size="15" class="form-control"  />
                            </div>
                            <div class="col-xs-6">
                                <label>Al</label>
                                <input type="date" name="al" size="15" class="form-control" />
                               <!-- <input type="hidden" name="iddep" value="<? echo $_SESSION['DEPARTAMENTO_ID']; ?>">-->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">  
                                <label>Nombres y Apellidos :</label>
                                <input type="text" class="form-control" name="nom_ape"   size="25"/>
                            </div>
                            <div class="col-xs-6">  
                                <label>Área :</label><br>
                                <select name="area" class="form-control">
                                     <option value="0"></option> 
                                     <%for (int u = 0; u < List_Area.size(); u++) {
                                            Area a=new Area();
                                            a=(Area)List_Area.get(u);
                                            %>
                                            <option value="<%=a.getId_area()%>"><%=a.getNo_area()%></option>
                                            <%}%>
                                    </select>
                            </div>
                        </div>
                        <div class="row">
                           <div class="col-xs-6">
                                <label>Puesto :</label>
                                <input type="text" name="puesto" class="form-control" size="25" />
                            </div>
                            <div class="col-xs-6">
                                 <label>Sueldo :</label>
                                <input type="text" name="sueldo" class="form-control" size="25" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <label>Fecha Inicio:</label>
                                <input type="date" name="fec_i" class="form-control">
                            </div>
                            <div class="col-xs-6">
                                <label>Fecha Fin :</label>
                                 <input type="date" name="fec_f" class="form-control">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                            <label>Sección:</label>
                           <input type="text" name="seccion" class="form-control">
                            </div>
             
                        </div>
                         <hr>
                         <div class="row">
                            <div class="col-xs-6">                            
                            <button type="button" class="btn btn-primary" id="btnfiltrar">Buscar</button>
                            </div>
                            <div class="col-xs-6">  
                            <a href="javascript:;"  id="btncancel" class="btn btn-primary">Cancelar</a>
                            </div>
                         </div>

                </form>
                </div>
                <br>
                <div id="table">
                    <table    class="table table-hover" >
                            <tr>
                                <td><span title="NOMBRE_P">Nombres y Apellidos</span></td>
                                <td><span title="FEC_DESDE">Fecha Desde</span></td>
                                <td><span title="FEC_HASTA">Fecha Hasta</span></td>
                                <td><span title="AREA">Area</span></td>
                                <td><span title="SECCION">Sección</span></td>
                                <td ><span title="PUESTO">Puesto</span></td>
                                <td><span title="SUELDO">Sueldo</span></td>
                                <td><span title="FECHA_CREACION">Fecha de Contratación</span></td>
                                <td><span title="">Contrato</span></td>
                            </tr>


                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </center>

    </body>


    </html>
 