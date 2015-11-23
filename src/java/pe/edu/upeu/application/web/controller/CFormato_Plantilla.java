/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.Formato_HorarioDAO;
import pe.edu.upeu.application.dao.PlantillaContractualDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceFormato_HorarioDAO;
import pe.edu.upeu.application.dao_imp.InterfacePlantillaContractualDAO;

/**
 *
 * @author ALFA 3
 */
public class CFormato_Plantilla extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> rpta = new HashMap<String, Object>();
        InterfaceFormato_HorarioDAO f = new Formato_HorarioDAO();
        InterfacePlantillaContractualDAO pl = new PlantillaContractualDAO();
        HttpSession sesion = request.getSession(true);
        InterfaceDireccionDAO dir = new DireccionDAO();
        String iduser = (String) sesion.getAttribute("IDUSER");
        String opc = request.getParameter("opc");
        String ubicacion = getServletConfig().getServletContext().getRealPath("/") + "Vista/Contrato/Formato_Plantilla/Formato/";
        if (iduser != null) {
            try {
                if (opc.equals("Asignar")) {
                    String DEP = request.getParameter("id_dep_asig");
                    String AREA = request.getParameter("id_are_asig");
                    String SEC = request.getParameter("id_sec_asig");
                    String DIR = request.getParameter("id_di_asig");
                    String PUES = request.getParameter("id_pu_asig");
                    String id = request.getParameter("id_pc");
                    pl.Insertar_pertenencia(id, DIR, DEP, AREA, SEC, PUES, iduser);
                    rpta.put("rpta", "1");
                }
                if (opc.equals("asignar")) {
                    sesion.setAttribute("Listar_Direccion_X", dir.Listar_Direccion());
                    response.sendRedirect("Vista/Contrato/Formato_Plantilla/Reg_Formato_Plantilla.jsp");
                }
                if (opc.equals("Actualizar")) {
                    String texto_html = request.getParameter("valor");
                    String id = request.getParameter("id");
                    File archivo = new File(ubicacion + id);
                    if (archivo.exists()) {
                        FileWriter escribir = new FileWriter(archivo);
                        // aqui se hace un append al archivo existente
                        escribir.write(texto_html);
                        escribir.close();
                    } else {
                        FileWriter escribir = new FileWriter(archivo);
                        escribir.write(texto_html);
                        escribir.close();
                    }
                    rpta.put("rpta", "1");
                }

                if (opc.equals("Listar")) {
                    String texto = "";
                    String imprimir = "";
                    String no_archivo = request.getParameter("id");
                    FileReader lector = new FileReader(ubicacion + no_archivo);
                    BufferedReader contenido = new BufferedReader(lector);
                    while ((texto = contenido.readLine()) != null) {
                        imprimir = imprimir + texto + "\n";
                    }
                    rpta.put("rpta", "1");
                    rpta.put("imprimir", imprimir);
                }
                if (opc.equals("Listar2")) {
                    String texto = "";
                    String imprimir = "";
                    String no_archivo = request.getParameter("id");
                    String no_arhivo_or = pl.List_pl_con_x_id(no_archivo);
                    FileReader lector = new FileReader(ubicacion + no_arhivo_or);
                    BufferedReader contenido = new BufferedReader(lector);
                    while ((texto = contenido.readLine()) != null) {
                        imprimir = imprimir + texto;
                    }
                    rpta.put("rpta", "1");
                    rpta.put("imprimir", imprimir);
                }
                if (opc.equals("List_Plamtillas")) {
                    String id_dir = request.getParameter("id_dir");
                    String id_dep = request.getParameter("id_dep");
                    String id_are = request.getParameter("id_are");
                    String id_sec = request.getParameter("sec");
                    String id_pu = request.getParameter("id_pu");
                    List<Map<String, ?>> lista = pl.List_PLant_x_sel(id_pu, id_sec, id_are, id_dep, id_dir);
                    rpta.put("rpta", "1");
                    rpta.put("lista", lista);
                }
                if (opc.equals("activar_pp")) {
                    String id_pp = request.getParameter("id_pp");
                    pl.Activar_pl_pu(id_pp, iduser);
                }
                if (opc.equals("Desactivar_pp")) {
                    String id_pp = request.getParameter("id_pp");
                    pl.Desactivar_pl_pu(id_pp, iduser);
                }
                if (opc.equals("Crear_Plantilla")) {
                    String texto_html = request.getParameter("valor");
                    String DEP = request.getParameter("id_dep_asig");
                    String AREA = request.getParameter("id_are_asig");
                    String SEC = request.getParameter("id_sec_asig");
                    String DIR = request.getParameter("id_di_asig");
                    String PUES = request.getParameter("id_pu_asig");
                    String no_pl = request.getParameter("no_pl");

                    pl.Crear_Plantilla(no_pl, iduser);
                    String id_pl = pl.ob_id_pl_max();
                    pl.Insertar_pertenencia(id_pl, DIR, DEP, AREA, SEC, PUES, iduser);
                    String no_arch = pl.Obt_no_arch();
                    File archivo = new File(ubicacion + no_arch);
                    FileWriter escribir = new FileWriter(archivo, true);
                    escribir.write(texto_html);
                    escribir.close();
                    rpta.put("rpta", "1");
                }
            } catch (Exception e) {
                rpta.put("rpta", "-1");
                rpta.put("mensaje", e.getMessage());
            }
        } else {
            rpta.put("rpta", "-1");

        }
        Gson gson = new Gson();
        out.println(gson.toJson(rpta));
        out.flush();
        out.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
