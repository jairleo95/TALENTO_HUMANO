/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import pe.edu.upeu.application.dao.DocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO;
import pe.edu.upeu.application.model.Renombrar;

/**
 *
 * @author joserodrigo
 */
public class CDocumento_Trabajador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    InterfaceDocumentoDAO d = new DocumentoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String dgp = request.getParameter("iddgp");
        String idtr = request.getParameter("idtr");
        String idctr = request.getParameter("idctr");
        String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        String user = (String) sesion.getAttribute("IDUSER");

        // try {
        if (opc != null) {
            if (opc.equals("Eliminar")) {
                String id_doc_adj = request.getParameter("id_doc");
                d.Desactivar_doc(id_doc_adj);
                getServletContext().setAttribute("List_Hijos", d.List_Hijos(idtr));
                getServletContext().setAttribute("Documentos", d.Documentos());
                getServletContext().setAttribute("Lis_doc_trabajador", d.Lis_doc_trabajador(idtr));
                getServletContext().setAttribute("List_Conyugue", d.List_Conyugue(idtr));
                int s = d.List_Req_nacionalidad(idtr);
                int num_ad = d.List_Adventista(idtr);
                //    response.sendRedirect("Vista/Trabajador/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&idtr=" + idtr + "&pro=pr_dgp&P2=TRUE");
                String pr = request.getParameter("P2");
                String url = "Vista/Trabajador/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&idtr=" + idtr;
                if (pr != null) {
                    url += "&pro=pr_dgp&P2=TRUE";
                    response.sendRedirect(url);
                } else {
                    response.sendRedirect("Vista/Trabajador/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&idtr=" + idtr);
                }

            }
            if (opc.equals("Ver_Documento")) {

                getServletContext().setAttribute("List_doc_req_pla", d.List_doc_req_pla(dgp, idtr));
                int i = d.List_Req_nacionalidad(idtr);
                int num_ad = d.List_Adventista(idtr);
                getServletContext().setAttribute("List_Hijos", d.List_Hijos(idtr));
                getServletContext().setAttribute("List_Conyugue", d.List_Conyugue(idtr));

                response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + i + "&num_ad=" + num_ad);
            }
            if (opc.equals("Reg_Pro_Dgp")) {
                getServletContext().setAttribute("List_doc_req_pla", d.List_doc_req_pla(dgp, idtr));
                int i = d.List_Req_nacionalidad(idtr);
                int num_ad = d.List_Adventista(idtr);
                getServletContext().setAttribute("List_Hijos", d.List_Hijos(idtr));
                getServletContext().setAttribute("List_Conyugue", d.List_Conyugue(idtr));

                response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + i + "&num_ad=" + num_ad + "&pro=pr_dgp");
            }

            if (opc.equals("Registrars")) {
                String iddgp = request.getParameter("iddgp");
                int i = Integer.parseInt(request.getParameter("num"));
                for (int j = 1; j < i; j++) {
                    String name = request.getParameter("lob_upload" + j);
                    String desc = request.getParameter("lob_description" + j);
                    String iddoc = request.getParameter("iddoc" + j);
                    String estado = request.getParameter("estado" + j);
                    //out.println(iddgp);
                    String AR_DATO_ARCHIVO = request.getParameter("AR_DATO_ARCHIVO");
                    String NO_ARCHIVO = request.getParameter("NO_ARCHIVO");
                    String TA_ARCHIVO = request.getParameter("TA_ARCHIVO");
                    String AR_FILE_TYPE = request.getParameter("AR_FILE_TYPE");
                    if (AR_DATO_ARCHIVO == null & (desc != null | estado != null)) {

                        //d.INSERT_DOCUMENTO_ADJUNTO(null, iddgp, iddoc, estado, user, null, null, null, null, desc, AR_DATO_ARCHIVO, NO_ARCHIVO, TA_ARCHIVO, AR_FILE_TYPE, idctr);
                    }
                }
                getServletContext().setAttribute("List_doc_req_pla", d.List_doc_req_pla(iddgp, idtr));
                int s = d.List_Req_nacionalidad(idtr);
                int num_ad = d.List_Adventista(idtr);
                getServletContext().setAttribute("List_Hijos", d.List_Hijos(idtr));
                getServletContext().setAttribute("List_Conyugue", d.List_Conyugue(idtr));

                String pr = request.getParameter("P2");
                if (pr != null) {
                    if (pr.equals("enter")) {
                        //response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&P2=TRUE");
                    }
                } else {
                    //response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad);
                }
            }

            if (("Listar_doc").equals(opc)) {

                getServletContext().setAttribute("List_Hijos", d.List_Hijos(idtr));
                getServletContext().setAttribute("Documentos", d.Documentos());
                getServletContext().setAttribute("Lis_doc_trabajador", d.Lis_doc_trabajador(idtr));
                getServletContext().setAttribute("List_Conyugue", d.List_Conyugue(idtr));
                int s = d.List_Req_nacionalidad(idtr);
                int num_ad = d.List_Adventista(idtr);
                int count = d.count_documentos_x_tra(idtr);
                if (count > 0) {
                    response.sendRedirect("Vista/Trabajador/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&Vol=volver&idtr=" + idtr);
                } else {
                    response.sendRedirect("Vista/Trabajador/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&idtr=" + idtr);
                }

            }
        } else {

            //------>   ./var/www/html/files/   (con: pwd)
            String ubicacion = getServletContext().getRealPath(".").substring(0, getServletContext().getRealPath(".").length() - 11) + "web\\Vista\\Dgp\\Documento\\Archivo";
            // String ubicacion = "/var/lib/tomcat7/webapps/TALENTO_HUMANO/Vista/Dgp/Documento/Archivo/";
//out.print(ubicacion);
            DiskFileItemFactory f = new DiskFileItemFactory();
            f.setSizeThreshold(1024);
            f.setRepository(new File(ubicacion));
            ServletFileUpload upload = new ServletFileUpload(f);
            ServletRequestContext src = new ServletRequestContext(request);
            // try {
            List<FileItem> p = upload.parseRequest(src);
            int num_filas = 0;
            String iddgp = null;
            String pr = null;
            String id_ctr = null;
            String ms = null;
            String dt = null;
            List<String> list_files = new ArrayList<String>();
            Iterator itera = p.iterator();

            while (itera.hasNext()) {
                FileItem i_n_f = (FileItem) itera.next();

                if (i_n_f.isFormField()) {

                    String nombre = i_n_f.getFieldName();
                    String valor = i_n_f.getString();

                    num_filas = (nombre.equals("num")) ? Integer.parseInt(valor) : num_filas;
                    if (nombre.equals("iddgp") & iddgp == null) {
                        iddgp = valor;
                    }
                    if (nombre.equals("idtr") & idtr == null) {
                        idtr = valor;
                    }
                    if (nombre.equals("P2") & pr == null) {
                        pr = valor;
                    }

                    if (nombre.equals("idctr") & id_ctr == null) {
                        id_ctr = valor;
                    }

                    if (nombre.equals("ms") & ms == null) {
                        ms = valor;
                    }
                    if (nombre.equals("dt") & ms == null) {
                        dt = valor;
                    }

                }

            }

            String iddoc = null;
            String nombre_archivo = null;
            String desc = null;
            String estado = null;
            String archivo = null;
            int num = 0;
            String no_original = null;

            String validar_nombre = "";
            for (int i = 0; i < num_filas; i++) {
                Iterator it = p.iterator();
                while (it.hasNext()) {

                    FileItem item = (FileItem) it.next();

                    if (item.isFormField()) {
                        String nombre = item.getFieldName();
                        String valor = item.getString();
                        iddoc = (nombre.equals("iddoc" + i)) ? valor : iddoc;
                        desc = (nombre.equals("lob_description" + i)) ? valor : desc;
                        estado = (nombre.equals("estado" + i)) ? valor : estado;
                    } else {
                        String fieldName = item.getFieldName();

                        num++;
                        Calendar fecha = new GregorianCalendar();
                        int hora = fecha.get(Calendar.HOUR_OF_DAY);
                        int min = fecha.get(Calendar.MINUTE);
                        int sec = fecha.get(Calendar.SECOND);

                        if (fieldName.equals("archivos" + i) & item.getName() != null) {
                            if (!item.getName().equals("")) {

                                //out.println(item.getFieldName() + " : " + item.getName());
                                nombre_archivo = String.valueOf(hora) + String.valueOf(min) + String.valueOf(sec) + "_" + num + iddgp + "_" + item.getName().toUpperCase();
                                no_original = item.getName();
                                Thread thread = new Thread(new Renombrar(item, ubicacion, nombre_archivo));
                                thread.start();
                                archivo = no_original + ":" + nombre_archivo;
                                list_files.add(archivo);
                            }

                        } else {
                            no_original = no_original;
                            nombre_archivo = nombre_archivo;
                        }
                    }
                }
                Thread.sleep(200);
                if (nombre_archivo != null) {

                    if (!nombre_archivo.equals("")) {

                        estado = ((estado == null) ? "0" : estado);

                        String id = d.INSERT_DOCUMENTO_ADJUNTO(null, iddoc, "1", user, null, null, null, null, desc, null, estado, id_ctr);
                        //out.print(id);
                        d.INSERT_DGP_DOC_tra(null, null, id, null, idtr);
                        for (int t = 0; t < list_files.size(); t++) {
                            String g[] = list_files.get(t).split(":");

                            d.INSERT_ARCHIVO_DOCUMENTO(null, id, g[1], g[0], null);
                        }
                        list_files.clear();

                    }

                }
                no_original = null;
                iddoc = null;
                nombre_archivo = null;
                desc = null;
                estado = null;

                no_original = null;

            }

            getServletContext().setAttribute("List_Hijos", d.List_Hijos(idtr));
            getServletContext().setAttribute("Documentos", d.Documentos());
            getServletContext().setAttribute("Lis_doc_trabajador", d.Lis_doc_trabajador(idtr));
            getServletContext().setAttribute("List_Conyugue", d.List_Conyugue(idtr));

            int s = d.List_Req_nacionalidad(idtr);
            int num_ad = d.List_Adventista(idtr);

            out.print(idtr);
            int count = d.count_documentos_x_tra(idtr);

            if (count > 0) {
                String url = "Vista/Trabajador/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&idtr=" + idtr + "&m=si";
                if (pr != null) {
                    url += "&P2=TRUE";
                }
                if (ms != null) {
                    url += "&ms=" + ms;
                }
                if (dt != null) {
                    url += "&dt=" + dt;
                }
                response.sendRedirect(url);

            } else {
                String url = "Vista/Trabajador/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&idtr=" + idtr + "&pro=pr_dgp&P2=TRUE";
                if (ms != null) {
                    url += "&ms=" + ms;
                }
                if (dt != null) {
                    url += "&dt=" + dt;
                }
                response.sendRedirect(url);
            }

            /*} catch (FileUploadException e) {
             out.println("Error : " + e.getMessage());
             }*/
        }
        /* } catch (IOException | NumberFormatException e) {
         out.println("Error : " + e.getMessage());
         } finally {
         out.close();
         }*/
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CDocumento_Trabajador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CDocumento_Trabajador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
