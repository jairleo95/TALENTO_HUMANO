<%-- 
    Document   : Año_contrato
    Created on : 22-ene-2015, 11:22:44
    Author     : joserodrigo
--%>

<%@page import="pe.edu.upeu.application.model.Anno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="List_Anno_trabajador" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css">  
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/font-awesome.min.css">
        <style type="text/css">
            body{

                margin-left: auto;
                margin-right: auto  ;
                width: 95%;
                // margin: 0;
            }
            .titulo{


                background-color: #474747;
                padding: 0.5%;

                font-family: arial;
                font-size: 130%;
                text-align: center;
                color: white;

            }
            .autoHeight{
                border-style:none;            
            }

            .td{
                font-weight: bold;
                text-align: center;
            }
            .td1{
                text-align: center;
            }
            .td2{
                width: 8%;
            }
            .info-det{

                width: 25%;
            }

            .table-det{
                width: 100%;
            }
            .submit{
                //position: relative;

                background-color: #0575f4;
                color: white;
                width: 100%;

            }
            .submit:hover{
                background-color: #643771;
            }

            table, th, td {

                padding: 4px;
            }
            img{
                position: absolute;

            }


        </style>
        <title>Información Contractual</title>
        <style type="text/css">
            .tables{
                // margin-top: 0px;
                // margin-left: 40px;
                //  font-family: cursive;
                //  font-size:18px;
                border-radius: 3%;
                padding: 0.5%;
                background-color: white;
                width: 60%;
            }
            td {
                padding: 0.5%;
                padding-left: 2%;
            } 
            tr:hover{
                background-color:#c6dcde;     
            }



        </style>
    </head>
    <body>
        <%String idanno=request.getParameter("ida1");
        if ( idanno != null){%>
        <div>
            
            <table class="table table-hover table-striped  table-responsive" style="border-radius: 30px ">
                <tr><td><select name="ida">
                            <%
                                String anno = request.getParameter("ida1");
                                for (int cv = 0; cv < List_Anno_trabajador.size(); cv++) {
                                    Anno an = new Anno();
                                    an = (Anno) List_Anno_trabajador.get(cv);
                                    if (an.getId_anno().equals(anno)) {
                            %><option value="<%=an.getId_anno()%>" selected=""><%=an.getNo_anno()%></option><%
                            } else {
                            %><option value="<%=an.getId_anno()%>"><%=an.getNo_anno()%></option><%
                                    }
                                }%>
                        </select> 
                    </td>
                    <td><input type="hidden" name="idtr" value=""></td>
                    <td><input name="opc" value="actualizar" type="submit"></td></tr>
            </table>
            <%@include file="Detalle_Info_Contractualq.jsp" %>
        </div>
        <%} else {%>
        <div>
            <table class="table table-hover table-striped  table-responsive">
                <td> <strong>NO TIENE CONTRATO</strong> </td>
            </table>
        </div>
        <%}%>
    </body>
</html>

