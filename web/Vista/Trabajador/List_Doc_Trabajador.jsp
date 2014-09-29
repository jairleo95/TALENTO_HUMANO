<%@page import="pe.edu.upeu.application.model.V_Documento_Trabajador"%>
<jsp:useBean id="List_Id_Doc_Trab" scope="application" class="java.util.ArrayList"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Documentos</title>
        <link rel="stylesheet" href="../../css/Css_Lista/listas.css" />
        <link rel="stylesheet" href="../../css1/bootstrap.min.css" />
        <style type="text/css">


            @media 
            only screen and (max-width: 760px),
            (min-device-width: 768px) and (max-device-width: 1024px)  {

                /* Force table to not be like tables anymore */
                table, thead, tbody, th, td, tr { 
                    display: block; 
                }

                /* Hide table headers (but not display: none;, for accessibility) */
                thead tr { 
                    position: absolute;
                    top: -9999px;
                    left: -9999px;
                }

                tr { border: 1px solid #ccc; }

                td { 
                    /* Behave  like a "row" */
                    border: none;
                    border-bottom: 1px solid #eee; 
                    position: relative;
                    padding-left: 50%; 
                }

                td:before { 
                    /* Now like a table header */
                    position: absolute;
                    /* Top/left values mimic padding */
                    top: 6px;
                    left: 6px;
                    width: 45%; 
                    padding-right: 10px; 
                    white-space: nowrap;
                }

                td:nth-of-type(1):before { content: "Nro"; }
                td:nth-of-type(2):before { content: "Nombre"; }
                td:nth-of-type(3):before { content: "Documento"; }
                td:nth-of-type(4):before { content: "Descripcion"; }
                td:nth-of-type(5):before { content: "Requerimiento"; }

                //td:nth-of-type(10):before { content: "Arbitrary Data"; }

            }      
        </style>

    </head>
    <body>
    <center>
        <table class=" table table-hover alert-link  btn-default">
            <thead>
                <tr>
                    <th class="cajita">Nro</th>
                    <th class="cajita">Nombre</th>
                    <th class="cajita">Documento</th>              
                    <th class="cajita">Descripcion</th>              
                    <th class="cajita">Requerimiento</th>
                </tr>  
            <thead>
            <tbody>

                <%  if (List_Id_Doc_Trab.size() == 0) {%>
            <td colspan="5" style="text-align: center"><h2>No se ha registrado ningun documento...</h2></td>
            <%}%>
            <%for (int i = 0; i < List_Id_Doc_Trab.size(); i++) {
                    V_Documento_Trabajador d = new V_Documento_Trabajador();
                    d = (V_Documento_Trabajador) List_Id_Doc_Trab.get(i);
            %>
            <tr>
                <td class="caji"><%=i + 1%></td>
                <td class="caji" ><%=d.getNo_documento()%></td>
                <td class="caji" ><a href="../Dgp/Documento/Ver_Doc.jsp?nom_doc=<%=d.getAr_dato_archivo()%>"><%=d.getNo_documento()%></a></td>

                <td class="caji"><%=d.getDe_documento_adjunto()%></td>
                <td class="caji" ><%=d.getNo_req()%></td>

            </tr>
            <% }%>
            </tbody>
        </table>
    </center>
</body>
</html>
