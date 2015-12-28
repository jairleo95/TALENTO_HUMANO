/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.EmpleadoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;

/**
 *
 * @author Admin
 */
public class CEmpleado extends HttpServlet {

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

        InterfaceEmpleadoDAO Iem = new EmpleadoDAO();

        HttpSession sesion = request.getSession(true);
        String idrol = (String) sesion.getAttribute("IDROL");

        String opc = request.getParameter("opc");
        try {

            if (opc.equals("Eva_Emp")) {
                String ID_Trabajador = request.getParameter("idtr");
                String ID_Empleado = Iem.ID_Empleado(ID_Trabajador);
                String estado = Iem.ES_Empleado(ID_Empleado);

                sesion.setAttribute("LIST_EVALUACION", Iem.Listar_Evaluacion_Emp(ID_Empleado));
                if (estado != null) {
                    if (estado.equals("1")) {
                        response.sendRedirect("Vista/Empleado/List_Evaluacion_Emp.jsp?idemp=" + ID_Empleado);
                    } else {
                        response.sendRedirect("Vista/Empleado/Evaluacion_Empleado.jsp?idtr=" + ID_Trabajador);
                    }
                } else {
                    response.sendRedirect("Vista/Empleado/Evaluacion_Empleado.jsp?idtr=" + ID_Trabajador);
                }

            }
            if (opc.equals("Reg_Evaluar_Emp")) {
                String ID_EVALUACION_EMP = null;
                String ES_EVALUACION = request.getParameter("ESTADO");
                String RE_EVALUACION = request.getParameter("RE_EVALUACION");
                String ID_TRABAJADOR = request.getParameter("ID_TRABAJADOR");
                String ID_EMPLEADO = Iem.ID_Empleado(ID_TRABAJADOR);
                Iem.Insert_Evaluacion_Emp(ID_EVALUACION_EMP, ES_EVALUACION, RE_EVALUACION, ID_EMPLEADO);
                sesion.setAttribute("LIST_EVALUACION", Iem.Listar_Evaluacion_Emp(ID_EMPLEADO));
                response.sendRedirect("Vista/Empleado/List_Evaluacion_Emp.jsp?idemp=" + ID_EMPLEADO);
            }
            if (opc.equals("Editar")) {
                String ID_EMP = request.getParameter("idemp");
                sesion.setAttribute("LIST_EVALUACION", Iem.Listar_Evaluacion_Emp(ID_EMP));
                response.sendRedirect("Vista/Empleado/Mod_Evaluacion_Emp.jsp?idemp=" + ID_EMP);
            }

            if (opc.equals("modificar")) {
                String RE_EVALUACION = request.getParameter("RE_EVALUACION");
                String ID_EMPLEADO = request.getParameter("ID_EMPLEADO");
                Iem.Mod_Evaluacion_emp(RE_EVALUACION, ID_EMPLEADO);
                sesion.setAttribute("LIST_EVALUACION", Iem.Listar_Evaluacion_Emp(ID_EMPLEADO));
                response.sendRedirect("Vista/Empleado/List_Evaluacion_Emp.jsp?idemp=" + ID_EMPLEADO);

            }

            if (opc.equals("Reporte")) {
                String iddepa = (String) sesion.getAttribute("DEPARTAMENTO_ID");
                if (idrol.trim().equals("ROL-0001")) {
                    sesion.setAttribute("List_Empleado", Iem.Listar_Empleado());
                } else {
                    sesion.setAttribute("List_Empleado", Iem.Listar_Empleado(iddepa));
                }
                response.sendRedirect("Vista/Empleado/Filtro_Empleado.jsp?idtr");
            }

            if (opc.equals("validar_aps")) {
                String co_aps = request.getParameter("co_aps");
                int aps = Iem.val_aps(co_aps);
                rpta.put("rpta", "1");
                rpta.put("aps", aps);
            }
            if (opc.equals("validar_huella")) {
                String co_hue = request.getParameter("co_hue");
                int huella = Iem.val_huella(co_hue);
                rpta.put("rpta", "1");
                rpta.put("huella", huella);
            }
            if ("reg_huella".equals(opc)) {
                String idtr = request.getParameter("idtr");
                int cod_huella = Integer.parseInt(request.getParameter("cod"));
                Iem.Reg_cod_huella(idtr, cod_huella);
                rpta.put("rpta", "1");
            }
            if (opc.equals("ShowHuella")) {

                String idtr = request.getParameter("idtr");
                String html = "";
                List<Map<String, ?>> Lista = Iem.List_co_huella(idtr);
                if (Lista.size() > 0) {
                    String codigo = "";
                    Map<String, ?> x = Lista.get(0);
                    codigo = String.valueOf(x.get("codigo_huella"));
                    if (idrol.trim().equals("ROL-0001")) {
                        html = "                        <div class='form-group'>"
                                + "                          <div class='col-md-4' >"
                                + "                             <label class='control-label' for='prepend'> <strong>  Código de Huella Digital:" + "</strong></label>"
                                + "                          </div>"
                                + "                            <div class='col-md-8'>"
                                + "                                <div class='input-group input-group-sm'>"
                                + "                                    <div class='icon-addon addon-sm'>"
                                + "                                        <input type='text' value='" + ((!codigo.equals("null")) ? codigo : "") + "' placeholder='Huella Digital' maxlength='6' class='form-control textCodHuella'>"
                                + "                                        <label for='email' class='glyphicon glyphicon-info-sign' rel='tooltip' title='Escribir código de Huella Digital'></label>"
                                + "                                    </div>"
                                + "                                    <span class='input-group-btn'>"
                                + "                                        <button class='btn btn-default btnHuellaDigital' type='button' ><i class='glyphicon glyphicon-ok'></i></button>"
                                + "                                    </span>"
                                + "                                </div>"
                                + "                            </div>"
                                + "                        </div>";
                    } else {
                        html = "                        <div class='form-group'>"
                                + "                            <label class='control-label col-md-12' for='prepend'> <strong>  Código de Huella Digital: </strong>" + ((!codigo.equals("null")) ? codigo : " No registrado") + "</label>"
                                + "                        </div>";
                    }
                } else {
                    html = "                        <div class='form-group'>"
                            + "                            <label class='control-label col-md-12' for='prepend'> <strong>  Código de Huella Digital: </strong>" + (" No registrado") + "</label>"
                            + "                        </div>";
                }

                rpta.put("value", html);
                rpta.put("rpta", "1");
            }
            if (opc.equals("ShowAPS")) {

                String idtr = request.getParameter("idtr");
                String html = "";
                List<Map<String, ?>> Lista = Iem.List_co_aps(idtr);
                if (Lista.size() > 0) {
                    String codigo = "";
                    Map<String, ?> x = Lista.get(0);
                    codigo = String.valueOf(x.get("aps"));
                    if (idrol.trim().equals("ROL-0001") | idrol.equals("ROL-0009")) {
                        html = "                        <div class='form-group'>"
                                + "                             <div class='col-md-4'>"
                                + "                               <label class='control-label' for='prepend'> <strong>  Código APS:" + "</strong></label>"
                                + "                             </div>                      "
                                + "                          <div class='col-md-8'>"
                                + "                                <div class='input-group input-group-sm'>"
                                + "                                    <div class='icon-addon addon-sm'>"
                                + "                                        <input type='text' value='" + ((!codigo.equals("null")) ? codigo : "") + "' placeholder='APS' maxlength='6' class='form-control txtCodigoAPS'>"
                                + "                                        <label for='email' class='glyphicon glyphicon-info-sign' rel='tooltip' title='Escribir código de APS'></label>"
                                + "                                    </div>"
                                + "                                    <span class='input-group-btn'>"
                                + "                                        <button class='btn btn-default btnCodigoAPS' type='button' rel='tooltip' title='Actualizar' ><i class='glyphicon glyphicon-ok'></i></button>"
                                + "                                    </span>"
                                + "                                </div>"
                                + "                            </div>"
                                + "                        </div>";
                    } else {
                        html = "                        <div class='form-group'>"
                                + "                            <label class='control-label col-md-12' for='prepend'> <strong>  Código APS: </strong>" + ((!codigo.equals("null")) ? codigo : " No registrado") + "</label>"
                                + "                        </div>";
                    }
                } else {
                    html = "                        <div class='form-group'>"
                            + "                            <label class='control-label col-md-12' for='prepend'> <strong>  Código APS: </strong>" + (" No registrado") + "</label>"
                            + "                        </div>";
                }

                rpta.put("value", html);
                rpta.put("rpta", "1");
            }
            if ("reg_aps".equals(opc)) {
                String idtr = request.getParameter("idtr");
                int co_aps = Integer.parseInt(request.getParameter("cod"));
                Iem.Reg_aps(idtr, co_aps);
                rpta.put("rpta", "1");
            }

        } catch (Exception e) {
            rpta.put("rpta", "-1");
            rpta.put("mensaje", e.getMessage());
        } finally {
            Gson gson = new Gson();
            out.println(gson.toJson(rpta));
            out.flush();
            out.close();
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
