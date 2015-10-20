/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.EmpleadoDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.RolDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UbigeoDAO;
import pe.edu.upeu.application.dao.UsuarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRolDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUbigeoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO;

/**
 *
 * @author joserodrigo
 */
@WebServlet(name = "CUsuario", urlPatterns = {"/Usuario"})
public class CUsuario extends HttpServlet {

    InterfaceUsuarioDAO usu = new UsuarioDAO();
    InterfaceEmpleadoDAO emp = new EmpleadoDAO();
    InterfaceRolDAO rol = new RolDAO();
    InterfaceListaDAO li = new ListaDAO();
    InterfaceUbigeoDAO ub = new UbigeoDAO();
    InterfaceDireccionDAO dir = new DireccionDAO();
    InterfaceTrabajadorDAO tr = new TrabajadorDAO();

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
        String opc = request.getParameter("opc");
        response.setContentType("text/html;charset=UTF-8");
            HttpSession sesion = request.getSession(true);
        PrintWriter out = response.getWriter();
        String id_user_1 = (String) sesion.getAttribute("IDUSER");
        String usuario = (String) sesion.getAttribute("USER");
        if ("Reg_Usuario".equals(opc)) {
            sesion.setAttribute("List_Usuario", usu.List_Usuario());
            sesion.setAttribute("Listar_Emp", emp.Listar_Emp());
            sesion.setAttribute("List_Rol", rol.List_Rol());
            sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var());
            response.sendRedirect("Vista/Usuario/Reg_Usuario.jsp");
        }
        if ("Registrar Usuario".equals(opc)) {
            String id_empleado = request.getParameter("IDEMPLEADO");
            String id_rol = request.getParameter("IDROLES");
            String no_usuario = request.getParameter("USUARIO");
            String no_pw = request.getParameter("CLAVE");
            String Estado = "1";
            usu.Insert_usuario(no_usuario, no_pw, id_empleado, id_rol, Estado);
            sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var());
            response.sendRedirect("Vista/Usuario/Reg_Usuario.jsp");
        }
        if ("list".equals(opc)) {
            sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var());
            response.sendRedirect("Vista/Usuario/List_Usuario.jsp");
        }
        if ("Modificar_clave_1".equals(opc)) {
            String id_usuario = request.getParameter("id_Usuaio");
            out.print(id_usuario);
            sesion.setAttribute("List_ID_User", usu.List_ID_User(id_usuario));
            response.sendRedirect("Vista/Usuario/Cambiar_Clave.jsp");
        }
        if ("Modificar_clave_2".equals(opc)) {
            String id_usuario = request.getParameter("iduser");
            String No_Usuario = request.getParameter("No_Usuario");
            String pw_an = request.getParameter("passwordNew2");
            usu.Mod_Pw(id_usuario, No_Usuario, pw_an);
            sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var());
            response.sendRedirect("Vista/Usuario/Reg_Usuario.jsp");
        }
        if ("Mod_Usuario_con".equals(opc)) {
            String id_usuario = request.getParameter("id_Usuaio");
            out.print(id_usuario);
            sesion.setAttribute("List_Usuario_var_id", usu.List_Usuario_var_id(id_usuario));
            sesion.setAttribute("List_Rol", rol.List_Rol());
            sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var());
            response.sendRedirect("Vista/Usuario/Mod_Usuario_rol.jsp");
        }
        if ("Mod_Usuario_con_2".equals(opc)) {
            String id_usuario = request.getParameter("ID_USUARIO");
            String IDROLES = request.getParameter("IDROLES");
            String no_user = request.getParameter("USUARIO");
            usu.Mod_rol_usuario(id_usuario, IDROLES, no_user);
            sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var());
            response.sendRedirect("Vista/Usuario/Reg_Usuario.jsp");
        }
        if ("Activar_Usuario_con".equals(opc)) {
            String id_usuario = request.getParameter("id_Usuaio");
            out.print(id_usuario);
            usu.Activar_usuario(id_usuario);
            sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var());
            response.sendRedirect("Vista/Usuario/Reg_Usuario.jsp");
        }

        if ("Desac_Usuario_con".equals(opc)) {
            String id_usuario = request.getParameter("id_Usuaio");
            out.print(id_usuario);
            usu.Desactivar_usuario(id_usuario);
            sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var());
            response.sendRedirect("Vista/Usuario/Reg_Usuario.jsp");
        }

        if ("Quitar_acceso".equals(opc)) {
            String id_usuario = request.getParameter("id_usu");
            //sesion.setAttribute("List_ID_User",usu.List_ID_User(id_usuario));
            out.print(id_usuario);
            //sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var());
            //response.sendRedirect("Vista/Usuario/List_Usuario.jsp");
        }
        if ("Eliminar_Usuario".equals(opc)) {
            String idUser = request.getParameter("id_usuario");
            usu.Delete_Usuario(idUser);
            sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var());
            response.sendRedirect("Vista/Usuario/List_Usuario.jsp");
        }
        if (opc.equals("Ver_Perfil")) {
            String id = request.getParameter("id");
            sesion.setAttribute("Lista_Usuarios", usu.Val_Usuario(id));
            response.sendRedirect("Vista/Usuario/Perfil_Usuario.jsp");

        }

        if (opc.equals("editar_Perfil")) {

            out.print(id_user_1);
            sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var_id(id_user_1));
            sesion.setAttribute("List_Usuario_var", usu.List_Usuario_var());
            sesion.setAttribute("List_Nacionalidad", li.List_Nacionalidad());
            sesion.setAttribute("List_Departamento", ub.List_Departamento());
            sesion.setAttribute("List_Provincia", ub.List_Provincia());
            sesion.setAttribute("List_Distrito", ub.List_Distrito());
            sesion.setAttribute("Listar_via", dir.Listar_via());
            sesion.setAttribute("Listar_zona", dir.Listar_zona());
            sesion.setAttribute("Lista_Usuarios", usu.Val_Usuario(id_user_1));
            response.sendRedirect("Vista/Usuario/editarPerfil.jsp");
        }

        if ("Modificar".equals(opc)) {
            String NO_USUARIO = request.getParameter("NOMBRE_USUARIO");
            String CLA_NUEVA = request.getParameter("passwordNew1");
            String TE_TRABAJADOR = request.getParameter("TEL_USUARIO");
            String CL_TRABAJADOR = request.getParameter("CEL_USUARIO");
            String CORREO_PERSONAL = request.getParameter("CORREO_USAURIO");
            String id_dep = request.getParameter("ID_DEPARTAMENTO");
            String id_prov = request.getParameter("ID_PROVINCIA");
            String DIR_DOM_A_DISTRITO_ID = request.getParameter("DIR_DOM_A_DISTRITO_ID");
            String DIR_DOM_A_D1_ID = request.getParameter("DIR_DOM_A_D1_ID");
            String DIR_DOM_A_D2 = request.getParameter("DIR_DOM_A_D2");
            String DIR_DOM_A_D3_ID = request.getParameter("DIR_DOM_A_D3_ID");
            String DIR_DOM_A_D4 = request.getParameter("DIR_DOM_A_D4");
            String DIR_DOM_A_D5_ID = request.getParameter("DIR_DOM_A_D5_ID");
            String DIR_DOM_A_D6 = request.getParameter("DIR_DOM_A_D6");
            String DIR_DOM_A_REF = request.getParameter("DIR_DOM_A_REF");
            String ID_TRABAJADOR = request.getParameter("ID_TR");

            usu.Mod_perfil(id_user_1, NO_USUARIO, CLA_NUEVA, TE_TRABAJADOR, CL_TRABAJADOR, CORREO_PERSONAL, id_dep, id_prov, DIR_DOM_A_D1_ID, DIR_DOM_A_D2, DIR_DOM_A_D3_ID, DIR_DOM_A_D4, DIR_DOM_A_D5_ID, DIR_DOM_A_D6, DIR_DOM_A_REF, DIR_DOM_A_DISTRITO_ID, ID_TRABAJADOR, id_user_1, tr.ip());
            sesion.setAttribute("Lista_Usuarios", usu.Val_Usuario(id_user_1));
            response.sendRedirect("Vista/Usuario/Perfil_Usuario.jsp");
        }
        if (opc.equals("Cambiar_clave")) {
            String pwd_actual = request.getParameter("password1");
            String pwd_nueva = request.getParameter("password2");
            if (usu.Val_Usuario(usuario, pwd_actual).size() == 1) {
                usu.Mod_Clave(id_user_1, pwd_nueva, id_user_1);
                out.print("1");
            } else {
                out.print("0");
            }

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
