/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.Plazo_DgpDAO;
import pe.edu.upeu.application.dao.RolDAO;
import pe.edu.upeu.application.dao.UsuarioDAO;
import pe.edu.upeu.application.dao_imp.InterfacePlazo_DgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRolDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO;
import pe.edu.upeu.application.model.V_Usuario;

public class Cindex extends HttpServlet {

    InterfaceUsuarioDAO us = new UsuarioDAO();
    V_Usuario user = new V_Usuario();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Usuario = request.getParameter("username");
        String Clave = request.getParameter("clave");
        InterfaceRolDAO Irol = new RolDAO();
        InterfacePlazo_DgpDAO pl = new Plazo_DgpDAO();

        if (Usuario.equals("") && Clave.equals("")) {
            out.print("ERROR");
        } else if (us.Val_Usuario(Usuario, Clave).size() == 1) {
            List<V_Usuario> u = us.Val_Usuario(Usuario, Clave);
            V_Usuario user = new V_Usuario();
            user = (V_Usuario) u.get(0);
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("IDUSER", user.getId_usuario());
            sesion.setAttribute("IDTR", user.getId_trabajador());
            sesion.setAttribute("FECHA_MINIMA", us.fecha_actual());
            sesion.setAttribute("USER", user.getNo_usuario());
            sesion.setAttribute("IDPER", user.getId_empleado());
            sesion.setAttribute("IDROL", user.getId_rol().trim());
            sesion.setAttribute("CL", user.getPw_usuario());
            sesion.setAttribute("PUESTO_ID", user.getId_puesto());
            sesion.setAttribute("AREA_ID", user.getId_area());
            sesion.setAttribute("AREA", user.getNo_area());
            sesion.setAttribute("DEPARTAMENTO", user.getNo_dep());
            sesion.setAttribute("SECCION", user.getNo_seccion());
            sesion.setAttribute("DEPARTAMENTO_ID", user.getId_departamento());
            sesion.setAttribute("PUESTO", user.getNo_puesto());
            sesion.setAttribute("AR_FOTO", user.getAr_foto());
            sesion.setAttribute("IDDIR", user.getId_direccion());
            if (user.getAp_paterno() == null) {
                sesion.setAttribute("NOMBRE_AP", "");
            } else {
                sesion.setAttribute("NOMBRE_AP", user.getAp_paterno() + " " + user.getAp_materno() + " " + user.getNo_trabajador());
            }
            sesion.setAttribute("LIST_MODULO", Irol.LISTAR_MODULOS(user.getId_rol()));
            
            /*FALTA VALIDAR ESTOS DOS PROCEDIMIENTOS*/
            //   pl.Validar_Cumplimiento_plazo_t2();
            // pl.Validar_Cumplimiento_plazo_t1();
            
            
            //esta funcion valida los procesos de dgp se terminen cuando esten en el ultimo paso(SE PUSO EN UN JOB de cada 60 minutos)
          //  dgp.VAL_DGP_PASOS();
            
            // cto.VALIDAR_FE_CESE_CON();

            //validacion es lo mismo que Val_Es_Plazo();
            //pl.validar_Vig_plazos();
            //it's ok
            /*este procedimiento se puso en un job cada un dia de intervalo*/
            //pl.Val_Es_Plazo();

            /*este procedmiento se puso en un job de cada un dia de intervalo*/
          //  cto.VALIDAR_FE_HASTA_CON();
             
            response.sendRedirect("menu");
            out.print("EXITO!");
        } else {
            out.print("ERROR");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
