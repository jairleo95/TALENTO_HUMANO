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
import pe.edu.upeu.application.dao.ContratoDAO;
import pe.edu.upeu.application.dao.DocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceContratoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO;
import pe.edu.upeu.application.model.Renombrar;

/**
 *
 * @author joserodrigo
 */
public class Cdocumento_adjunto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    InterfaceContratoDAO c = new ContratoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, InterruptedException {
        response.setContentType("text/html;charset=UTF-8");
        String dgp = request.getParameter("iddgp");
        String idtr = request.getParameter("idtr");
        String idctr = request.getParameter("idctr");
        String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        String user = (String) sesion.getAttribute("IDUSER");
        PrintWriter out = response.getWriter();
        // try (PrintWriter out = response.getWriter()) {
        if (opc != null) {
            if (opc.equals("Eliminar")) {
                String id_c = request.getParameter("idc");
                c.Eliminar_Contratos_firmados(id_c);
                int coun_doc = c.Count_doc_con(request.getParameter("idc"));
                response.sendRedirect("Vista/Contrato/Formato_Plantilla/Subir_Contrato_Firmado.jsp?idc=" + id_c + "&coun_doc=" + coun_doc);
                //out.print(coun_doc + id_c);
            }
        } else {

            //String ubicacion = "/TALENTO_HUMANO/Vista/Dgp/Documento/Archivo/";
            String ubicacion = getServletConfig().getServletContext().getRealPath("/") + "Vista/Contrato/Contratos_Adjuntos/";
            //String ubicacion = getServletContext().getRealPath(".").substring(0, getServletContext().getRealPath(".").length() - 11) + "web\\Vista\\Contrato\\Contratos_Adjuntos";
            System.out.println("Enter to Save Contrato");

            DiskFileItemFactory f = new DiskFileItemFactory();
            f.setSizeThreshold(1024);
            f.setRepository(new File(ubicacion));
            ServletFileUpload upload = new ServletFileUpload(f);
            ServletRequestContext src = new ServletRequestContext(request);
            // try {
            List<FileItem> p = upload.parseRequest(src);
            int num_filas = 0;
            String idc = null;

            List<String> list_files = new ArrayList<String>();
            Iterator itera = p.iterator();

            while (itera.hasNext()) {
                FileItem i_n_f = (FileItem) itera.next();
                if (i_n_f.isFormField()) {
                    String nombre = i_n_f.getFieldName();
                    String valor = i_n_f.getString();
                    num_filas = (nombre.equals("num")) ? Integer.parseInt(valor) : num_filas;
                    if (nombre.equals("idc") & idc == null) {
                        idc = valor;
                    }
                }
            }
            String nombre_archivo = null;

            String estado = null;
            String archivo = null;
            int num = 0;
            String no_original = null;

            Iterator it = p.iterator();

            while (it.hasNext()) {

                FileItem item = (FileItem) it.next();

                if (item.isFormField()) {
                    String nombre = item.getFieldName();
                } else {
                    String fieldName = item.getFieldName();

                    num++;
                    Calendar fecha = new GregorianCalendar();
                    int hora = fecha.get(Calendar.HOUR_OF_DAY);
                    int min = fecha.get(Calendar.MINUTE);
                    int sec = fecha.get(Calendar.SECOND);

                    if (fieldName.equals("archivo") & item.getName() != null) {
                        if (!item.getName().equals("")) {

                            // out.println(item.getFieldName() + " : " + item.getName());
                            nombre_archivo = String.valueOf(hora) + String.valueOf(min) + String.valueOf(sec) + "_" + num + idc + "_" + item.getName().toUpperCase();
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

                    out.print(no_original);
                    if (nombre_archivo != null) {

                        if (!nombre_archivo.equals("")) {

                            estado = ((estado == null) ? "0" : estado);

                            for (int t = 0; t < list_files.size(); t++) {
                                c.INSERT_CONTRATO_ADJUNTO(null, idc, nombre_archivo, no_original, null, null, null, null, null, null);
                                String g[] = list_files.get(t).split(":");

                            }
                            list_files.clear();

                        }

                    }
                    no_original = null;
                    estado = null;

                    no_original = null;
                }
            }

            Thread.sleep(2000);

            int coun_doc = c.Count_doc_con(idc);
            if (coun_doc > 0) {
                response.sendRedirect("Vista/Contrato/Formato_Plantilla/Subir_Contrato_Firmado.jsp?idc=" + idc + "&coun_doc=" + coun_doc);
            } else {
                response.sendRedirect("Vista/Contrato/Formato_Plantilla/Subir_Contrato_Firmado.jsp?idc=" + idc + "&coun_doc=" + coun_doc);
            }
        }
        // }

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
        } catch (FileUploadException ex) {
            Logger.getLogger(Cdocumento_adjunto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(Cdocumento_adjunto.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (FileUploadException ex) {
            Logger.getLogger(Cdocumento_adjunto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(Cdocumento_adjunto.class.getName()).log(Level.SEVERE, null, ex);
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
