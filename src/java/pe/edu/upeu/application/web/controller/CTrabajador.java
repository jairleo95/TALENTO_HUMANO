/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UbigeoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUbigeoDAO;

/**
 *
 * @author Alfa.sistemas
 */
public class CTrabajador extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //try {

        HttpSession sesion = request.getSession(true);
        String idrol = (String) sesion.getAttribute("IDROL");

        InterfaceListaDAO li = new ListaDAO();
        InterfaceDgpDAO dgp = new DgpDAO();
        InterfaceUbigeoDAO ub = new UbigeoDAO();
        InterfaceTrabajadorDAO tr = new TrabajadorDAO();

        String opc = (String) request.getParameter("opc");
        String Text = (String) request.getParameter("text");

        if (opc.equals("Registrar")) {
            String ID_TRABAJADOR = request.getParameter("ID_TRABAJADOR");
            String AP_PATERNO = request.getParameter("APELLIDO_P");
            String AP_MATERNO = request.getParameter("APELLIDO_M");
            String NO_TRABAJADOR = request.getParameter("NOMBRES");
            String TI_DOC = request.getParameter("TIPO_DOC");
            String NU_DOC = request.getParameter("NRO_DOC");
            String ES_CIVIL = request.getParameter("ESTADO_CIVIL");
            String FE_NAC = "12/10/95";
            String ID_NACIONALIDAD = request.getParameter("NACIONALIDAD");
            String ID_DEPARTAMENTO = request.getParameter("ID_DEPARTAMENTO");
            String ID_PROVINCIA = request.getParameter("ID_PROVINCIA");
            String ID_DISTRITO = request.getParameter("DISTRITO");
            String TE_TRABAJADOR = request.getParameter("TELEFONO");
            String CL_TRA = request.getParameter("CELULAR");
            String DI_CORREO_PERSONAL = request.getParameter("CORREO_PERSONAL");
            String DI_CORREO_INST = request.getParameter("CORREO_INST");
            String CO_SISTEMA_PENSIONARIO = request.getParameter("SISTEMA_PENSIONARIO");
            String LI_NIVEL_EDUCATIVO = request.getParameter("NIVEL_EDUCATIVO");
            String LI_GRADO_ACADEMICO = request.getParameter("GRADO_ACADEMICO");
            String LI_TITULO_PROFESIONAL = request.getParameter("TITULO_PROFESIONAL");
            String ID_CARRERA = request.getParameter("CARRERA");
            String ID_UNIVERSIDAD = request.getParameter("CENTRO_DE_ESTUDIO");
            String CM_OTROS_ESTUDIOS = request.getParameter("OTROS_ESTUDIOS");
            String ES_SEXO = request.getParameter("SEXO");
            String LI_GRUPO_SANGUINEO = request.getParameter("GRUPO_SANGUINEO");
            String DE_REFERENCIA = request.getParameter("DE_REFERENCIA");
            String LI_RELIGION = request.getParameter("RELIGION");
            String NO_IGLESIA = request.getParameter("IGLESIA");
            String DE_CARGO = request.getParameter("CARGO");
            String LI_AUTORIDAD = request.getParameter("AUTORIDAD");
            String NO_AP_AUTORIDAD = request.getParameter("AUT_APELLIDOSNOMBRES");
            String CL_AUTORIDAD = request.getParameter("AUT_CELULAR");
            String ID_NO_AFP = request.getParameter("NOMBRE_AFP_ID");
            String ES_AFILIADO_ESSALUD = request.getParameter("AFILIADO_ESSALUD_ID");
            String LI_TIPO_TRABAJADOR = request.getParameter("TIPO_TRABAJADOR_ID");
            String CA_TIPO_HORA_PAGO_REFEERENCIAL = request.getParameter("TIPO_HORA_PAGO_REFEERENCIAL");
            String ES_FACTOR_RH = request.getParameter("FACTOR_RH_ID");
            String LI_DI_DOM_A_D1 = request.getParameter("DIR_DOM_A_D1_ID");
            String DI_DOM_A_D2 = request.getParameter("DIR_DOM_A_D2");
            String LI_DI_DOM_A_D3 = request.getParameter("DIR_DOM_A_D3_ID");
            String DI_DOM_A_D4 = request.getParameter("DIR_DOM_A_D4");
            String LI_DI_DOM_A_D5 = request.getParameter("DIR_DOM_A_D5_ID");
            String DI_DOM_A_D6 = request.getParameter("DIR_DOM_A_D6");
            String DI_DOM_A_REF = request.getParameter("DIR_DOM_A_REF");
            String ID_DI_DOM_A_DISTRITO = request.getParameter("DIR_DOM_A_DISTRITO_ID");
            String LI_DI_DOM_LEG_D1 = request.getParameter("DIR_DOM_LEG_D1_ID");
            String DI_DOM_LEG_D2 = request.getParameter("DIR_DOM_LEG_D2");
            String LI_DI_DOM_LEG_D3 = request.getParameter("DIR_DOM_LEG_D3_ID");
            String DI_DOM_LEG_D4 = request.getParameter("DIR_DOM_LEG_D4");
            String LI_DI_DOM_LEG_D5 = request.getParameter("DIR_DOM_LEG_D5_ID");
            String DI_DOM_LEG_D6 = request.getParameter("DIR_DOM_LEG_D6");
            String ID_DI_DOM_LEG_DISTRITO = request.getParameter("DIR_DOM_LEG_DISTRITO_ID");
            String CA_ING_QTA_CAT_EMPRESA = request.getParameter("ING_QTA_CAT_EMPRESA");
            String CA_ING_QTA_CAT_RUC = request.getParameter("ING_QTA_CAT_RUC");
            String CA_ING_QTA_CAT_OTRAS_EMPRESAS = request.getParameter("ING_QTA_CAT_OTRAS_EMPRESAS");
            String CM_OBSERVACIONES = request.getParameter("OBSERVACIONES");
            String US_CREACION = request.getParameter("USER_CREACION");
            String FE_CREACION = request.getParameter("FECHA_CREACION");
            String US_MODIF = request.getParameter("US_MODIF");
            String FE_MODIF = request.getParameter("FE_MODIF");
            String IP_USUARIO = request.getParameter("USUARIO_IP");

            tr.INSERT_TRABAJADOR(ID_TRABAJADOR, AP_PATERNO, AP_MATERNO, NO_TRABAJADOR, TI_DOC, NU_DOC, ES_CIVIL, FE_NAC, ID_NACIONALIDAD, ID_DEPARTAMENTO, ID_PROVINCIA, ID_DISTRITO, TE_TRABAJADOR, CL_TRA, DI_CORREO_PERSONAL, DI_CORREO_INST, CO_SISTEMA_PENSIONARIO, LI_NIVEL_EDUCATIVO, LI_GRADO_ACADEMICO, LI_TITULO_PROFESIONAL, ID_CARRERA, ID_UNIVERSIDAD, CM_OTROS_ESTUDIOS, ES_SEXO, LI_GRUPO_SANGUINEO, DE_REFERENCIA, LI_RELIGION, NO_IGLESIA, DE_CARGO, LI_AUTORIDAD, NO_AP_AUTORIDAD, CL_AUTORIDAD, ID_NO_AFP, ES_AFILIADO_ESSALUD, LI_TIPO_TRABAJADOR, CA_TIPO_HORA_PAGO_REFEERENCIAL, ES_FACTOR_RH, LI_DI_DOM_A_D1, DI_DOM_A_D2, LI_DI_DOM_A_D3, DI_DOM_A_D4, LI_DI_DOM_A_D5, DI_DOM_A_D6, DI_DOM_A_REF, ID_DI_DOM_A_DISTRITO, LI_DI_DOM_LEG_D1, DI_DOM_LEG_D2, LI_DI_DOM_LEG_D3, DI_DOM_LEG_D4, LI_DI_DOM_LEG_D5, DI_DOM_LEG_D6, ID_DI_DOM_LEG_DISTRITO, CA_ING_QTA_CAT_EMPRESA, CA_ING_QTA_CAT_RUC, CA_ING_QTA_CAT_OTRAS_EMPRESAS, CM_OBSERVACIONES, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO);
            out.println("sdfgiojdgkjdhgkjhdfg");
            String idtr = tr.MAX_ID_DATOS_TRABAJADOR();
            getServletContext().setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
            getServletContext().setAttribute("List_Auto_mostrar", li.List_Auto_mostrar(idrol));
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Vista/Trabajador/Detalle_Trabajador.jsp?idtr='" + idtr + "'");

            dispatcher.forward(request, response);
        }
        /* if (true) {
         RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Vista/Trabajador/Reg_Trabajador.jsp");
         dispatcher.forward(request, response);  
         }*/
        if (opc.equals("Buscar")) {

            String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");

            String Buscar = request.getParameter("busqueda");
            String dni = request.getParameter("dni");
            String nom = request.getParameter("nom");
            String ape_mat = request.getParameter("ape_mat");
            String ape_pat = request.getParameter("ape_pat");
            String all = request.getParameter("all");

            if (("Buscar".equals(Buscar) & (!"".equals(dni) | !"".equals(nom) | !"".equals(ape_mat) | !"".equals(ape_pat))) | "Todos".equals(all)) {
                
                
                String busc= (String)request.getParameter("busc");
            
           if (busc!=null) {
             getServletContext().setAttribute("ListarTrabajador2", tr.ListarTrabajador(iddep, dni, nom, ape_pat, ape_mat));
                 response.sendRedirect("Vista/Dgp/Generar_Dgp.jsp?text="+Text);
            }else{
            response.sendRedirect("Vista/Trabajador/Ficha_Trabajador.jsp");
            getServletContext().setAttribute("ListarTrabajador", tr.ListarTrabajador(iddep, dni, nom, ape_pat, ape_mat));
            }
            }
            
            
           
            
        }

        /* } catch(IOException e){
         System.out.println(e.getMessage());
         }
         finally {
         out.close();
         }*/
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
