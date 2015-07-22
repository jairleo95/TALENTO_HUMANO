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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.Detalle_PrivilegioDAO;
import pe.edu.upeu.application.dao.PrivilegioDAO;
import pe.edu.upeu.application.dao.RolDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDetalle_PrivilegioDAO;
import pe.edu.upeu.application.dao_imp.InterfacePrivilegioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRolDAO;

/**
 *
 * @author joserodrigo
 */
@WebServlet(name = "CPrivilegio", urlPatterns = {"/Privilegio"})
public class CPrivilegio extends HttpServlet {

    InterfaceRolDAO rol = new RolDAO();
    InterfacePrivilegioDAO priv = new PrivilegioDAO();
    InterfaceDetalle_PrivilegioDAO detp = new Detalle_PrivilegioDAO();

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
        String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        String iduser = (String) sesion.getAttribute("IDUSER");
        Map<String, Object> rpta = new HashMap<String, Object>();

        try {

            if (opc.equals("ListPrivilegio")) {
                List<Map<String, ?>> list = priv.List_Priv_Mod();
                rpta.put("rpta", "1");
                rpta.put("Lista", list);
            }
            if (opc.equals("ListModulo")) {
                List<Map<String, ?>> list = priv.List_Modulo();
                rpta.put("rpta", "1");
                rpta.put("Lista", list);
            }
            if (opc.equals("MenuOpciones")) {
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/TEMPORAL.jsp");
            }

            if (opc.equals("Listar_Rol")) {
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Roles.jsp");

            }
            if (opc.equals("Modificar_Rol")) {
                String idrol = request.getParameter("idrol");
                getServletContext().setAttribute("Listar_Rol_id", rol.Listar_Rol_id(idrol));
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Mod_Rol.jsp");
            }

            /*if(opc.equals("Listar_Privilegio")){
             getServletContext().setAttribute("List_Privilegio",priv.List_Privilegio());
             response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Privilegios.jsp");
             }*/
            if (opc.equals("Listar_Privilegio")) {
                
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Privilegio.jsp");
            }
            if (opc.equals("Desactivar_Priv")) {
                String idrol = request.getParameter("id_priv");
                priv.Desactivar_Privilegio(idrol);
                getServletContext().setAttribute("List_Privilegio", priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Privilegio.jsp");

            }
            if (opc.equals("Eliminar_Priv")) {
                String idrol = request.getParameter("id_priv");
                priv.Eliminar_Privilegio(idrol);
                getServletContext().setAttribute("List_Privilegio", priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Privilegio.jsp");

            }
            if (opc.equals("Activar_Priv")) {
                String idrol = request.getParameter("id_priv");
                priv.Activar_Privilegio(idrol);
                getServletContext().setAttribute("List_Privilegio", priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Privilegio.jsp");

            }
            if (opc.equals("modificar_Priv1")) {
                String idpriv = request.getParameter("id_priv");
                getServletContext().setAttribute("List_Pri_Id", priv.List_Pri_Id(idpriv));
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Mod_Privilegio.jsp");
            }
            if (opc.equals("modificar_Priv2")) {
                String id_priv = request.getParameter("Id_priv");
                String No_Link = request.getParameter("No_Link");
                String Es_priv = request.getParameter("Es_Privilegio");
                String Di_url = request.getParameter("Di_url");
                String Ic_link = request.getParameter("Ic_link");
                priv.Mod_Priv(id_priv, No_Link, Es_priv, Di_url, Ic_link);
                getServletContext().setAttribute("List_Privilegio", priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Privilegio.jsp");
            }
            if (opc.equals("Registrar")) {
                getServletContext().setAttribute("List_Privilegio", priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Privilegios.jsp");
            }
            if (opc.equals("REGISTRAR PRIVILEGIO")) {
                String no_link = request.getParameter("No_Link");
                String id_modulo = request.getParameter("modulo");
                String di_url = request.getParameter("Di_url");
                String es_privilegio = request.getParameter("Es_privilegio");
                out.print("sasas");
                String Ic_Link = request.getParameter("Ic_Link");
                priv.Insert_Privilegio(no_link, di_url, es_privilegio, Ic_Link, id_modulo);
                getServletContext().setAttribute("List_Privilegio", priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Privilegios.jsp");
            }
            if (opc.equals("Otorgar")) {
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                getServletContext().setAttribute("List_Privilegio", priv.List_Privilegio());
                getServletContext().setAttribute("List_Pr_Rol", priv.List_Pr_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Otorgar_Privilegio.jsp");
            }
            if (opc.equals("Listar_PR_ROL")) {
                getServletContext().setAttribute("List_Pr_Rol", priv.List_Pr_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Pri_Roles.jsp");
            }
            if (opc.equals("REGISTRAR PRIVILEGIO DADO")) {
                String Id_rol = request.getParameter("id_rol");
                String id_Priv = request.getParameter("id_privilegio");
                String Nu_Orden = request.getParameter("NRO_ORDEN");
                String Es_detalle_privilegio = request.getParameter("ESTADO");
                out.print(Id_rol + " " + id_Priv + " " + Nu_Orden + "" + Es_detalle_privilegio);
                detp.Registrar_Detalle_Priv(Id_rol, Nu_Orden, id_Priv, Es_detalle_privilegio);
                getServletContext().setAttribute("List_Pr_Rol", priv.List_Pr_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Otorgar_Privilegio.jsp");
            }
            if (opc.equals("Mod_det_pr")) {
                String id_det_pr = request.getParameter("id_det_pr");
                getServletContext().setAttribute("List_det_pri_id", detp.List_det_pri_id(id_det_pr));
                getServletContext().setAttribute("List_Privilegio", priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Mod_Detalle_privilegio.jsp");
            }
            if (opc.equals("Mod_det_pr2")) {
                String id_det_pr = request.getParameter("id_det_pr");
                String id_Priv = request.getParameter("id_Priv");
                int Nu_Orden = Integer.parseInt(request.getParameter("Nu_Orden"));
                String Es_detalle_privilegio = request.getParameter("Es_detalle_privilegio");
                out.print(id_det_pr + id_Priv + Nu_Orden + Es_detalle_privilegio);
                detp.Mod_Detalle_Priv(id_det_pr, Nu_Orden, id_Priv, Es_detalle_privilegio);
                getServletContext().setAttribute("List_Pr_Rol", priv.List_Pr_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Otorgar_Privilegio.jsp");
            }
            if (opc.equals("Desactivar_det_pr")) {
                String id_det_pr = request.getParameter("id_det_pr");
                out.print(id_det_pr);
                detp.Desc_r_pr(id_det_pr);
                getServletContext().setAttribute("List_Pr_Rol", priv.List_Pr_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Otorgar_Privilegio.jsp");
            }
            if (opc.equals("Activar_det_pr")) {
                String id_det_pr = request.getParameter("id_det_pr");
                out.print(id_det_pr);
                detp.Act_r_pr(id_det_pr);
                getServletContext().setAttribute("List_Pr_Rol", priv.List_Pr_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Otorgar_Privilegio.jsp");
            }
            if (opc.equals("Elim_det_pr")) {
                String id_det_pr = request.getParameter("id_det_pr");
                out.print(id_det_pr);
                detp.Elim_Detalle_Priv(id_det_pr);
                getServletContext().setAttribute("List_Pr_Rol", priv.List_Pr_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Otorgar_Privilegio.jsp");
            }
        } catch (Exception e) {
            rpta.put("rpta", "-1");
            rpta.put("mensaje", e.getMessage());
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
