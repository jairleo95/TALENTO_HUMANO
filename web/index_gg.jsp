
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="java.util.*"
         import="org.apache.commons.fileupload.*"
         import="org.apache.commons.fileupload.servlet.*"
         import="org.apache.commons.fileupload.disk.*"
         import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Subidor Devtroce</title>
    </head>
    <body>
        <form action=index.jsp method=post enctype=multipart/form-data>
            <table>
                <tr>
                    <td>Fichero</td>
                    <td><input type=file name=fichero></td>
                </tr>
                <tr><td colspan=2><input type=submit value=enviar name=enviar>
                    </td>
                </tr>
            </table>
        </form>

        <!-- codigo para subir el fichero al servidor-->
        <%
                //Ruta donde se guardara el fichero --/home/dreyna/NetBeansProjects/WebApplication3/web
            //File destino = new File("/home/dreyna/archivos/");
            //String ubicacion = getServletContext().getRealPath(".").substring(0, getServletContext().getRealPath(".").length() - 11) + "web/archivos/";
            String ubicacion = "/var/lib/tomcat7/webapps/TALENTO_HUMANO/Vista/";
            out.println(ubicacion);
            File destino = new File(ubicacion);
            ServletRequestContext src = new ServletRequestContext(request);

            if (ServletFileUpload.isMultipartContent(src)) {
                DiskFileItemFactory factory = new DiskFileItemFactory((1024 * 1024), destino);
                ServletFileUpload upload = new ServletFileUpload(factory);

                java.util.List lista = upload.parseRequest(src);
                File file = null;
                java.util.Iterator it = lista.iterator();

                while (it.hasNext()) {
                    FileItem item = (FileItem) it.next();
                    if (item.isFormField()) {
                        out.println(item.getFieldName() + "<br>");
                    } else {
                        file = new File(item.getName());
                        item.write(new File(destino, file.getName()));
                        out.println("Fichero subido");
                    } // end if
                } // end while
            } // end if
%>
    </body>
</html>