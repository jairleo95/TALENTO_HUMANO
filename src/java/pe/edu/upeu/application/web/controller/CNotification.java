/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upeu.application.dao.NotificationDAO;
import pe.edu.upeu.application.dao_imp.InterfaceNotificationDAO;
import pe.edu.upeu.application.model.Notification;

/**
 *
 * @author Cesar
 */
@WebServlet(name = "CNotification", urlPatterns = {"/cnot"})
public class CNotification extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    InterfaceNotificationDAO notdao = new NotificationDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Map<String, Object> rpta = new HashMap<String, Object>();
        PrintWriter out = response.getWriter();
        int op = Integer.parseInt(request.getParameter("op"));
        switch (op) {
            case 1:
                try {
                    rpta.put("rpta", "1");
                    rpta.put("lista", notdao.List_Notifications_json());
                } catch (Exception e) {
                    rpta.put("rpta", "-1");
                    rpta.put("mensaje", e.getMessage());
                }
                Gson gson = new Gson();
                out.print(gson.toJson(rpta));
                out.flush();
                out.close();
                break;
            case 2:
                String id = request.getParameter("data");
                notdao.leido(id);
                break;
            case 3:
                try {
                    rpta.put("rpta", "1");
                    rpta.put("lista", notdao.List_Notifications_json());

                } catch (Exception e) {
                    rpta.put("rpta", "-1");
                    rpta.put("mensaje", e.getMessage());
                }
                gson = new Gson();
                out.print(gson.toJson(rpta));
                out.flush();
                out.close();
                break;
            case 4:
                try {
                    String[] listid = request.getParameterValues("listid[]");
                    if (listid != null) {
                        for (int i = 0; i < listid.length; i++) {
                            notdao.visualizado(listid[i]);
                        }
                    }
                } catch (Exception ex) {
                    System.out.println("Error por aca " + ex);
                }
                break;
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
