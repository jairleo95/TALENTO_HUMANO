/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.ListaDAO;

import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao.RequerimientoDAO;
import pe.edu.upeu.application.dao.RolDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UbigeoDAO;
import pe.edu.upeu.application.dao.UsuarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;

import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRequerimientoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRolDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUbigeoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO;
import pe.edu.upeu.application.model.V_Usuario;

public class CPrincipal extends HttpServlet {

    InterfaceUsuarioDAO us = new UsuarioDAO();
    V_Usuario user = new V_Usuario();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print("ERROR");
         
        InterfaceListaDAO li = new ListaDAO();
        InterfaceDgpDAO dgp = new DgpDAO();
        InterfaceUbigeoDAO ub = new UbigeoDAO();
        InterfaceTrabajadorDAO tr = new TrabajadorDAO();
        InterfaceRequerimientoDAO IReq = new RequerimientoDAO();
        InterfaceRolDAO Irol = new RolDAO();
        InterfacePuestoDAO pu = new PuestoDAO();

        try {

                String Usuario = request.getParameter("username");
                String Clave = request.getParameter("clave");
            
                List<V_Usuario> u = us.Val_Usuario(Usuario, Clave);
                V_Usuario user = new V_Usuario();
                user = (V_Usuario) u.get(0);                
                if (us.Val_Usuario(Usuario, Clave).size() == 1) {
                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("IDUSER", user.getId_usuario());
                    sesion.setAttribute("USER", user.getNo_usuario());
                    sesion.setAttribute("IDPER", user.getId_empleado());
                    sesion.setAttribute("IDROL", user.getId_rol());
                    sesion.setAttribute("CL", user.getPw_usuario());
                    sesion.setAttribute("PUESTO_ID", user.getId_puesto());
                    sesion.setAttribute("AREA_ID", user.getId_area());
                    sesion.setAttribute("AREA", user.getNo_area());
                    sesion.setAttribute("DEPARTAMENTO", user.getNo_dep());
                    sesion.setAttribute("DEPARTAMENTO_ID", user.getId_departamento());
                    sesion.setAttribute("PUESTO", user.getNo_puesto());
                    getServletContext().setAttribute("listarURL", Irol.listarURL(user.getId_rol()));        
                    getServletContext().setAttribute("Listar_Requerimiento", IReq.Listar_Requerimiento());
                    getServletContext().setAttribute("List_Carrera", li.List_Carrera());
                    getServletContext().setAttribute("List_Nacionalidad", li.List_Nacionalidad());
                    getServletContext().setAttribute("List_Universidad", li.List_Universidad());
                    getServletContext().setAttribute("List_Distrito", ub.List_Distrito());
                    getServletContext().setAttribute("List_Det_Puesto", pu.List_Det_Puesto());
                    /*
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Principal.jsp");
                    dispatcher.forward(request, response);*/
                    response.sendRedirect("Principal2.jsp");
                } else {
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index2.jsp");
                    dispatcher.forward(request, response);
                }
            
                
        } finally {
            out.close();
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
