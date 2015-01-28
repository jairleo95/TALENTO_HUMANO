/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import pe.edu.upeu.application.dao.Fotos_TrabajadorDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceFotos_TrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.model.Renombrar;

/**
 *
 * @author ALFA 3
 */
public class CFoto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        InterfaceFotos_TrabajadorDAO foto = new Fotos_TrabajadorDAO();
        InterfaceTrabajadorDAO tr = new TrabajadorDAO();
        String ubicacion = "";
        try {

            if (System.getProperty("sun.desktop").trim().equals("windows")) {
                ubicacion = getServletContext().getRealPath(".").substring(0, getServletContext().getRealPath(".").length() - 1) + "\\Vista\\Usuario\\Fotos";
            } else {
                ubicacion = getServletContext().getRealPath(".").substring(0, getServletContext().getRealPath(".").length() - 1) + "/Vista/Usuario/Fotos/";
            }
            out.print(ubicacion);

            DiskFileItemFactory f = new DiskFileItemFactory();
            f.setSizeThreshold(1024);
            f.setRepository(new File(ubicacion));
            ServletFileUpload upload = new ServletFileUpload(f);

            List<FileItem> p = upload.parseRequest(request);
            String idtr = null;
            String nombre_archivo = null;
            String no_original = null;
            long sizeInBytes = 0;
            Iterator it = p.iterator();
            while (it.hasNext()) {

                FileItem item = (FileItem) it.next();

                if (item.isFormField()) {

                    String nombre = item.getFieldName();
                    String valor = item.getString();
                    if (nombre.equals("idtr") & idtr == null) {
                        idtr = valor;
                    }

                } else {

                    String fieldName = item.getFieldName();
                    sizeInBytes = item.getSize();
                    Calendar fecha = new GregorianCalendar();
                    int hora = fecha.get(Calendar.HOUR_OF_DAY);
                    int min = fecha.get(Calendar.MINUTE);
                    int sec = fecha.get(Calendar.SECOND);
                    if (fieldName.equals("archivo")) {
                        nombre_archivo = String.valueOf(hora) + String.valueOf(min) + String.valueOf(sec) + "_" + idtr + "_" + item.getName().toUpperCase();
                        no_original = item.getName();
                        Thread thread = new Thread(new Renombrar(item, ubicacion, nombre_archivo));
                        thread.start();
                    } else {
                        no_original = no_original;
                        nombre_archivo = nombre_archivo;
                    }

                }

            }

            foto.INSERT_FOTOS_TRABAJADOR(null, null, nombre_archivo, no_original, no_original, String.valueOf(sizeInBytes), idtr);

            //getServletContext().setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
            //Thread.sleep(2000);
           // response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + idtr);
            // out.println("Archivo subido correctamente");
             out.println(no_original);
             out.println(nombre_archivo);
             out.println(sizeInBytes);
        } catch (Exception e) {
            out.print(e.getMessage());
            //out.print(ubicacion);
        } 
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
            Logger.getLogger(CFoto.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CFoto.class.getName()).log(Level.SEVERE, null, ex);
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
