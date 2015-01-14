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
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.Carrera_UniversidadDAO;
import pe.edu.upeu.application.dao.Formato_HorarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCarrera_UniversidadDAO;
import pe.edu.upeu.application.dao_imp.InterfaceFormato_HorarioDAO;

/**
 *
 * @author Alex
 */
public class CFormato_Horario extends HttpServlet {

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

        HttpSession sesion = request.getSession(true);

        InterfaceFormato_HorarioDAO Ifh = new Formato_HorarioDAO();

        String opc = request.getParameter("opc");
        Map<String, Object> rpta = new HashMap<String, Object>();
        InterfaceCarrera_UniversidadDAO model = new Carrera_UniversidadDAO();
        try {

            if (opc.equals("registrar")) {
                String ID_TIPO_HORARIO = null;
                String NO_HORARIO = request.getParameter("NO_HORARIO");
                String DE_HORARIO = request.getParameter("DE_HORARIO");
                String ES_HORARIO = request.getParameter("ES_HORARIO");
                Double CA_HORAS = Double.parseDouble(request.getParameter("CA_HORAS"));

                Ifh.Insert_Horario(ID_TIPO_HORARIO, NO_HORARIO, DE_HORARIO, ES_HORARIO, CA_HORAS);
                getServletContext().setAttribute("List_Tipo_Horario", Ifh.Listar_Tipo_Horario());
                response.sendRedirect("Vista/Formato_Horario/Detalle_Formato_Horario.jsp");

            }

            if (opc.equals("Registrar_Formato")) {

            }
            if (opc.equals("Listar_Formato")) {

            }
            if (opc.equals("Modificar_Formato")) {

            }
            if (opc.equals("Listar_Tip_Horario")) {
                List<Map<String, ?>> lista = Ifh.List_Tipo_Horario();
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
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
