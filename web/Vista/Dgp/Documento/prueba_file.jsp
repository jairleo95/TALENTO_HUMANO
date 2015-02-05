
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<!DOCTYPE html PUBLIC ?-//W3C//DTD HTML 4.01 Transitional//EN? ?http://www.w3.org/TR/html4/loose.dtd?>
<html>
    <head>

        <title></title>
    </head>
    <body>
        <%
            String destPath = System.getProperty("user.home");
            
            
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            
            
            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    //Problem in reading stream
                    e.printStackTrace();
                }
                Iterator itr = items.iterator();
                while (itr.hasNext()) {
                    //Iterate files
                    FileItem item = (FileItem) itr.next();
                    if (!item.isFormField()) {
                        try {
                            String itemName = item.getName();
                            if ("".equals(itemName)) {
                                continue;
                            }
                          //  File savedFile = new File(destPath + "/" + itemName);
                            //item.write(savedFile);
                            //System.out.println(savedFile.getAbsoluteFile());
                            out.println(itemName+item.getFieldName()); //Required for JUpload ACK
                        } catch (Exception e) {
                            e.printStackTrace();
                            //Could not save file
                        }
                    }
                }
              
            } else {
                //Not a multipart upload
            }
        %>
    </body>
</html>