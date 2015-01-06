/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.RolDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRolDAO;

/**
 *
 * @author Docente
 */
public class CMenu extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        InterfaceRolDAO Irol = new RolDAO();
        String opc = request.getParameter("opc");

        HttpSession sesion = request.getSession(true);
        String user = (String) sesion.getAttribute("USER");
        String idrol = (String) sesion.getAttribute("IDROL");

        if (opc == null) {

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Principal_3.jsp");
            dispatcher.forward(request, response);
        } else if (opc != null & user != null) {
            if (opc.equals("logout")) {
                sesion.invalidate();
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            }
            if (opc.equals("List_Privilegios")) {
                String id_modulo = request.getParameter("idmod");
                getServletContext().setAttribute("listarURL", Irol.listarURL(idrol, id_modulo));
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Principal_3.jsp");
                dispatcher.forward(request, response);

            }

        } else {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
