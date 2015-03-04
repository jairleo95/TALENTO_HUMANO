/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upeu.application.dao.PasoDAO;
import pe.edu.upeu.application.dao_imp.InterfacePasoDAO;

/**
 *
 * @author ALFA 3
 */
public class CPaso extends HttpServlet {

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
        InterfacePasoDAO p = new PasoDAO();
        Map<String, Object> rpta = new HashMap<String, Object>();
        try {
            String opc = request.getParameter("opc");
            if (opc.equals("Listar_habilitados")) {
                String id = request.getParameter("proceso");
                List<Map<String, ?>> lista = p.List_Paso_Habilitado(id);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);

            }
            if (opc.equals("Paso_Puesto")) {
                String id = request.getParameter("id");
                List<Map<String, ?>> lista = p.List_Paso_x_Puesto(id);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);

            }
            if (opc.equals("Mantenimiento")) {
                response.sendRedirect("Vista/Proceso/Menu_Mantenimiento.jsp");
            }
            if (opc.equals("Eliminar")) {
                String id = request.getParameter("paso");
                p.DELETE_PASOS(id);
            }
            if (opc.equals("Registrar")) {
                String ID_PROCESO = request.getParameter("proceso");
                String DE_PASOS = request.getParameter("desc");
                String NU_PASOS = request.getParameter("num");
                String CO_PASOS = request.getParameter("cod");
                p.INSERT_PASOS(null, ID_PROCESO, DE_PASOS, NU_PASOS, CO_PASOS);
            }
            if (opc.equals("Update_nu_paso")) {

                int numero = Integer.parseInt(request.getParameter("num"));
                for (int i = 1; i <= numero-1; i++) {
                    String ID_PASO = request.getParameter("id" + i);
                    String NU_PASO = request.getParameter("numero" + i);
                    p.UPDATE_NU_PASO(ID_PASO, NU_PASO);
                }

            }
            if (opc.equals("Modificar")) {
                String ID_PASO = request.getParameter("id");
                String ID_PROCESO = request.getParameter("proceso");
                String DE_PASOS = request.getParameter("desc");
                String NU_PASOS = request.getParameter("num");
                String CO_PASOS = request.getParameter("cod");
                String ESTADO = request.getParameter("estado");
                p.UPDATE_PASOS(ID_PASO, ID_PROCESO, DE_PASOS, NU_PASOS, CO_PASOS, ESTADO);
            }
            if (opc.equals("Eliminar_PP")) {
                String idpp = request.getParameter("id");
                p.DELETE_PUESTO_PASO(idpp);
            }
            if (opc.equals("actualizar_estado")) {
                String id = request.getParameter("id");
                String estado = request.getParameter("estado");
                p.ESTADO_DETALLE_PUESTO(id, estado);
            }

        } catch (Exception e) {
            rpta.put("rpta", "-1");
            rpta.put("mensaje", e.getMessage());
        }
        Gson gson = new Gson();
        out.print(gson.toJson(rpta));
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
