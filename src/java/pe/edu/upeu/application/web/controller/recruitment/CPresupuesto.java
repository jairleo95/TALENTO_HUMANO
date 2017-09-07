/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller.recruitment;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.PresupuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfacePresupuestoDAO;

/**
 *
 * @author Leandro Burgos
 */
public class CPresupuesto extends HttpServlet {

    InterfaceDireccionDAO dO = new DireccionDAO();
    InterfacePresupuestoDAO pD = new PresupuestoDAO();
    Map<String, Object> rpta = new HashMap<>();

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        //int opc = Integer.parseInt(request.getParameter("opc"));
        String opc = request.getParameter("opc");
        String idDestino, id, ccosto;
        int tipo;
        switch (opc) {
            case "gest":
                response.sendRedirect("Vista/Presupuesto/Gpresupuesto.jsp");
                break;
            case "list":
                rpta.put("rpta", dO.List_Direccion());
                break;
            case "reg":
                Map<String, Object> c = new HashMap<>();
                idDestino = request.getParameter("idDes");
                ccosto = request.getParameter("idCC");
                int SB = Integer.parseInt(request.getParameter("SB"));
                int AF = Integer.parseInt(request.getParameter("AF"));
                int BA = Integer.parseInt(request.getParameter("BA"));
                int BO = Integer.parseInt(request.getParameter("BO"));
                int NT = Integer.parseInt(request.getParameter("NT"));
                String f_inicio = request.getParameter("f_i");
                String f_fin = request.getParameter("f_fin");
                String tip = request.getParameter("tipo");
                c.put("idDes", idDestino);
                c.put("SB", SB);
                c.put("NT", NT);
                c.put("f_i", f_inicio);
                c.put("f_fin", f_fin);
                c.put("idUSER", session.getAttribute("IDUSER"));
                c.put("AF", AF);
                c.put("BA", BA);
                c.put("BO", BO);
                c.put("idCC", ccosto);
                c.put("tipo", tip);
                rpta.put("rpta", pD.Reg_PresupuestoArea(c));
                break;
            case "comp":
                idDestino = request.getParameter("idDes");
                rpta.put("datos", pD.comprobar(idDestino));
                break;
            case "hist_con":
                idDestino = request.getParameter("idDes");
                rpta.put("datos", pD.historial_cont(idDestino));
                break;
            case "actual":
                idDestino = request.getParameter("idDes");
                rpta.put("datos", pD.dataPresupuesto(idDestino));
                break;
            case "listActual":
                idDestino = request.getParameter("idDes");
                rpta.put("datos", pD.pActual(idDestino));
                break;
            case "status":
                idDestino = request.getParameter("idDes");
                rpta.put("rpta", pD.statusPresupuesto(idDestino));
                break;
            case "ccosto":
                id = request.getParameter("id");
                tipo = Integer.parseInt(request.getParameter("tipo"));
                rpta.put("datos", pD.CCostos(id, tipo));
                break;
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
