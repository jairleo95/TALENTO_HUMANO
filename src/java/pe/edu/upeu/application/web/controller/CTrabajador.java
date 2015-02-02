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
import pe.edu.upeu.application.dao.Centro_CostoDAO;
import pe.edu.upeu.application.dao.ContratoDAO;
import pe.edu.upeu.application.dao.Datos_Hijo_TrabajadorDAO;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.DocumentoDAO;
import pe.edu.upeu.application.dao.EmpleadoDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.Padre_Madre_ConyugueDAO;
import pe.edu.upeu.application.dao.Tipo_DocumentoDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UbigeoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCentro_CostosDAO;
import pe.edu.upeu.application.dao_imp.InterfaceContratoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDatos_Hijo_Trabajador;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfacePadre_Madre_ConyugueDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTipo_DocumentoDAO;
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
      /*  try {*/
            HttpSession sesion = request.getSession(true);
            String idrol = (String) sesion.getAttribute("IDROL");
            String iduser = (String) sesion.getAttribute("IDUSER");

            InterfaceListaDAO li = new ListaDAO();
            // InterfaceDgpDAO dgp = new DgpDAO();
            InterfaceUbigeoDAO ub = new UbigeoDAO();
            InterfaceTrabajadorDAO tr = new TrabajadorDAO();
            InterfaceDocumentoDAO d = new DocumentoDAO();
            InterfaceEmpleadoDAO em = new EmpleadoDAO();
            InterfaceDgpDAO dgp = new DgpDAO();
            InterfaceDireccionDAO dir = new DireccionDAO();
            InterfaceCentro_CostosDAO cc = new Centro_CostoDAO();
            InterfaceTipo_DocumentoDAO tdoc = new Tipo_DocumentoDAO();
            InterfaceContratoDAO con = new ContratoDAO();
            String opc = "";
            String Text = "";
            opc = (String) request.getParameter("opc");
            Text = (String) request.getParameter("text");
            String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
            InterfacePadre_Madre_ConyugueDAO pmc = new Padre_Madre_ConyugueDAO();
            InterfaceDatos_Hijo_Trabajador h = new Datos_Hijo_TrabajadorDAO();

            if (opc.equals("Form_Reg")) {
                getServletContext().setAttribute("List_Carrera", li.List_Carrera());
                getServletContext().setAttribute("List_Nacionalidad", li.List_Nacionalidad());
                getServletContext().setAttribute("List_Universidad", li.List_Universidad());
                getServletContext().setAttribute("List_Departamento", ub.List_Departamento());
                getServletContext().setAttribute("List_Situacion_Educativa", li.List_Situacion_Educativa());
                getServletContext().setAttribute("Listar_via", dir.Listar_via());
                getServletContext().setAttribute("Listar_zona", dir.Listar_zona());
                getServletContext().setAttribute("Listar_tipo_doc", tdoc.Listar_tipo_doc());
                response.sendRedirect("Vista/Trabajador/Reg_Trabajador.jsp");
            }
            if (opc.equals("Registrar")) {
                String AP_PATERNO = request.getParameter("APELLIDO_P");
                String AP_MATERNO = request.getParameter("APELLIDO_M");
                String NO_TRABAJADOR = request.getParameter("NOMBRES");
                String TI_DOC = request.getParameter("TIPO_DOC");
                String NU_DOC = request.getParameter("NRO_DOC");
                String ES_CIVIL = request.getParameter("ESTADO_CIVIL");
                String FE_NAC = request.getParameter("FECHA_NAC");
                String ID_NACIONALIDAD = request.getParameter("NACIONALIDAD");
                String ID_DEPARTAMENTO = null;
                String ID_PROVINCIA = null;
                String ID_DISTRITO = request.getParameter("DISTRITO");
                String TE_TRABAJADOR = request.getParameter("TELEFONO");
                String CL_TRA = request.getParameter("CELULAR");
                String DI_CORREO_PERSONAL = request.getParameter("CORREO_PERSONAL");
                String DI_CORREO_INST = request.getParameter("CORREO_INST");
                String CO_SISTEMA_PENSIONARIO = request.getParameter("SISTEMA_PENSIONARIO");
                String LI_NIVEL_EDUCATIVO = request.getParameter("NIVEL_EDUCATIVO");
                String CARRERA = request.getParameter("CARRERA");
                String REGIMEN = request.getParameter("REGIMEN");
                String ES_INST_PERU = request.getParameter("ES_INST_PERU");
                String DE_ANNO_EGRESO = request.getParameter("DE_ANNO_EGRESO");
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
                // String ID_DI_DOM_A_DISTRITO = "DST-001343";
                String LI_DI_DOM_LEG_D1 = request.getParameter("DIR_DOM_LEG_D1_ID");
                String DI_DOM_LEG_D2 = request.getParameter("DIR_DOM_LEG_D2");
                String LI_DI_DOM_LEG_D3 = request.getParameter("DIR_DOM_LEG_D3_ID");
                String DI_DOM_LEG_D4 = request.getParameter("DIR_DOM_LEG_D4");
                String LI_DI_DOM_LEG_D5 = request.getParameter("DIR_DOM_LEG_D5_ID");
                String DI_DOM_LEG_D6 = request.getParameter("DIR_DOM_LEG_D6");
                String ID_DI_DOM_LEG_DISTRITO = request.getParameter("DIR_DOM_LEG_DISTRITO_ID");
                //  String ID_DI_DOM_LEG_DISTRITO = "DST-001343";;
                String CA_ING_QTA_CAT_EMPRESA = request.getParameter("ING_QTA_CAT_EMPRESA");
                String CA_ING_QTA_CAT_RUC = request.getParameter("ING_QTA_CAT_RUC");
                String CA_ING_QTA_CAT_OTRAS_EMPRESAS = request.getParameter("ING_QTA_CAT_OTRAS_EMPRESAS");
                String CM_OBSERVACIONES = request.getParameter("OBSERVACIONES");
                String US_CREACION = iduser;
                String FE_CREACION = request.getParameter("FECHA_CREACION");
                String US_MODIF = request.getParameter("US_MODIF");
                String FE_MODIF = request.getParameter("FE_MODIF");
                String IP_USUARIO = request.getParameter("USUARIO_IP");

                String AP_NOMBRES_PADRE = request.getParameter("APELLIDOS_NOMBRES_PADRE");
                String AP_NOMBRES_MADRE = request.getParameter("APELLIDOS_NOMBRES_MADRE");
                String ES_TRABAJA_UPEU_C = request.getParameter("TRABAJA_UPEU_CONYUGUE");
                String AP_NOMBRES_C = request.getParameter("APELLIDO_NOMBRES_CONYUGUE");
                String FE_NAC_C = request.getParameter("FECHA_NAC_CONYUGUE");
                String ID_TIPO_DOC_C = request.getParameter("TIPO_DOC_ID");
                String NU_DOC_C = request.getParameter("NRO_DOC_C");
                String LI_INSCRIPCION_VIG_ESSALUD_C = request.getParameter("INSCRIPCION_VIG_ESSALUD");
                String ID_CONYUGUE = request.getParameter("CONYUGUE");
                int num_hijo = Integer.parseInt(request.getParameter("num_hijo"));
                //REGISTRAR EN TABLA CUENTA SUELDO
                String NO_BANCO = request.getParameter("BANCO");
                String NU_CUENTA = (request.getParameter("CUENTA") == null) ? "no tiene" : request.getParameter("CUENTA");
                //String NU_CUENTA_BANC = (request.getParameter("CUENTA_BANC") == null) ? "0" : "no tiene";
                String NU_CUENTA_BANC = request.getParameter("CUENTA_BANC");
                String ES_GEM_NU_CUENTA = (request.getParameter("GEN_NU_CUEN") == null) ? "0" : "1";
                String NO_BANCO_OTROS = request.getParameter("BANCO_OTROS");
                String ES_CUENTA_SUELDO = request.getParameter("ES_CUENTA_SUELDO");

                tr.INSERT_TRABAJADOR(null, AP_PATERNO, AP_MATERNO, NO_TRABAJADOR, TI_DOC, NU_DOC, ES_CIVIL, FE_NAC, ID_NACIONALIDAD, ID_DEPARTAMENTO, ID_PROVINCIA, ID_DISTRITO, TE_TRABAJADOR, CL_TRA, DI_CORREO_PERSONAL, DI_CORREO_INST, CO_SISTEMA_PENSIONARIO, LI_NIVEL_EDUCATIVO, REGIMEN, ES_INST_PERU, CARRERA, DE_ANNO_EGRESO, CM_OTROS_ESTUDIOS, ES_SEXO, LI_GRUPO_SANGUINEO, DE_REFERENCIA, LI_RELIGION, NO_IGLESIA, DE_CARGO, LI_AUTORIDAD, NO_AP_AUTORIDAD, CL_AUTORIDAD, ID_NO_AFP, ES_AFILIADO_ESSALUD, LI_TIPO_TRABAJADOR, CA_TIPO_HORA_PAGO_REFEERENCIAL, ES_FACTOR_RH, LI_DI_DOM_A_D1, DI_DOM_A_D2, LI_DI_DOM_A_D3, DI_DOM_A_D4, LI_DI_DOM_A_D5, DI_DOM_A_D6, DI_DOM_A_REF, ID_DI_DOM_A_DISTRITO, LI_DI_DOM_LEG_D1, DI_DOM_LEG_D2, LI_DI_DOM_LEG_D3, DI_DOM_LEG_D4, LI_DI_DOM_LEG_D5, DI_DOM_LEG_D6, ID_DI_DOM_LEG_DISTRITO, CA_ING_QTA_CAT_EMPRESA, CA_ING_QTA_CAT_RUC, CA_ING_QTA_CAT_OTRAS_EMPRESAS, CM_OBSERVACIONES, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, AP_NOMBRES_PADRE, AP_NOMBRES_MADRE,
                ES_TRABAJA_UPEU_C, AP_NOMBRES_C, FE_NAC_C, ID_TIPO_DOC_C, NU_DOC_C, LI_INSCRIPCION_VIG_ESSALUD_C, ID_CONYUGUE);
                String idtr = tr.MAX_ID_DATOS_TRABAJADOR();
                tr.INSERT_CUENTA_SUELDO(null, NO_BANCO, NU_CUENTA, NU_CUENTA_BANC, ES_GEM_NU_CUENTA, NO_BANCO_OTROS, idtr , ES_CUENTA_SUELDO);
                tr.INSERT_HIST_RELIGION(null, LI_RELIGION, NO_IGLESIA, DE_CARGO, LI_AUTORIDAD, NO_AP_AUTORIDAD, CL_AUTORIDAD, "1", idtr,iduser,FE_MODIF);
                
                tr.UPDATE_ID_CONYUGUE(idtr, ID_CONYUGUE);
                for (int i = 1; i <= num_hijo; i++) {
                    String AP_PATERNO_H = request.getParameter("APELLIDO_P_H" + i);
                    String AP_MATERNO_H = request.getParameter("APELLIDO_M_H" + i);
                    String NO_HIJO_TRABAJADOR = request.getParameter("NOMBRE_H" + i);
                    String FE_NACIMIENTO = request.getParameter("FECHA_NAC_H" + i);
                    String ES_SEXO_H = request.getParameter("SEXO_H" + i);
                    String ES_TIPO_DOC = request.getParameter("TIPO_DOC_ID_H" + i);
                    String NU_DOC_H = request.getParameter("NRO_DOC_H" + i);
                    String ES_PRESENTA_DOCUMENTO = null;
                    String ES_INSCRIPCION_VIG_ESSALUD = request.getParameter("ESSALUD_H" + i);
                    String ES_ESTUDIO_NIV_SUPERIOR = request.getParameter("EST_SUP_H" + i);
                    String ES_DATOS_HIJO_TRABAJADOR = "1";
                    h.INSERT_DATOS_HIJO_TRABAJADOR(null, idtr, AP_PATERNO_H, AP_MATERNO_H, NO_HIJO_TRABAJADOR, FE_NACIMIENTO, ES_SEXO_H, ES_TIPO_DOC, NU_DOC_H, ES_PRESENTA_DOCUMENTO, ES_INSCRIPCION_VIG_ESSALUD, ES_ESTUDIO_NIV_SUPERIOR, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, ES_DATOS_HIJO_TRABAJADOR);

                }

                getServletContext().setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + idtr + "&a=t");
            }
            if (opc.equals("Buscar")) {
                String Buscar = request.getParameter("busqueda");
                String dni = request.getParameter("dni");
                String nom = request.getParameter("nom");
                String ape_mat = request.getParameter("ape_mat");
                String ape_pat = request.getParameter("ape_pat");
                // String all = request.getParameter("all");

                if (("Buscar".equals(Buscar) & (!"".equals(dni) | !"".equals(nom) | !"".equals(ape_mat) | !"".equals(ape_pat)))) {
                    String busc = (String) request.getParameter("busc");
                    if (busc != null) {
                        getServletContext().setAttribute("ListarTrabajador2", tr.ListarTrabajador(iddep, dni, nom, ape_pat, ape_mat));
                        getServletContext().setAttribute(nom, dgp.VAL_OPC_DGP(dni));
                        response.sendRedirect("Vista/Dgp/Generar_Dgp.jsp?text=" + Text);
                    }
                } else {
                    response.sendRedirect("Vista/Dgp/Generar_Dgp.jsp?text=" + Text);

                }
            }
            if (opc.equals("Buscar_Trabajador")) {
                String Buscar = request.getParameter("busqueda");
                String dni = request.getParameter("dni");
                String nom = request.getParameter("nom");
                String ape_mat = request.getParameter("ape_mat");
                String ape_pat = request.getParameter("ape_pat");
                if (("Buscar".equals(Buscar) & (!"".equals(dni) | !"".equals(nom) | !"".equals(ape_mat) | !"".equals(ape_pat)))) {
                    getServletContext().setAttribute("ListarTrabajador", tr.ListarTrabajador(iddep, dni, nom, ape_pat, ape_mat));
                    getServletContext().setAttribute(nom, dgp.VAL_OPC_DGP(dni));
                    response.sendRedirect("Vista/Trabajador/Ficha_Trabajador.jsp");
                } else {
                    response.sendRedirect("Vista/Trabajador/Ficha_Trabajador.jsp");
                }
            }
            if ("list".equals(opc)) {
                String idtr = request.getParameter("idtr");
                getServletContext().setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + idtr.trim());
            }
            if ("actualizar".equals(opc)) {
                String idtr = request.getParameter("idtr");
                String id_anno = request.getParameter("id_anno");
                getServletContext().setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + idtr.trim());
            }
            if ("Documento_Trabajador".equals(opc)) {
                String idtr = request.getParameter("idtr");
                getServletContext().setAttribute("List_Id_Doc_Trab", d.List_Id_Doc_Trab(idtr));
                response.sendRedirect("Vista/Trabajador/List_Doc_Trabajador.jsp");
            }
            if ("aut".equals(opc)) {
                String idtr = request.getParameter("idtr");
                String id_contrato = con.Buscar_id_contrato_x_idtr(idtr);
                /*if (cc.Lis_c_c_id_contr(id_contrato).size() > 0) {
                 getServletContext().setAttribute("Lis_c_c_id_contr", cc.Lis_c_c_id_contr(id_contrato));
                 }
                 */int val_aps=0;
                String iddgp = request.getParameter("iddetalle_dgp");
                String puesto_id = request.getParameter("puesto_id");
                String cod = request.getParameter("cod");
                String idpasos = request.getParameter("idpasos");
                String drp = request.getParameter("IDDETALLE_REQ_PROCESO");
                String np = request.getParameter("nup");
                int num_c_dgp = dgp.VALIDAR_DGP_CONTRATO(iddgp);
                 val_aps=em.val_cod_aps_empleado(idtr);
                getServletContext().setAttribute("id_empleadox_ide", em.id_empleadox_ide(idtr));
                getServletContext().setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                getServletContext().setAttribute("List_Auto_mostrar", li.List_Auto_mostrar(idrol));
                getServletContext().setAttribute("List_", li.List_Auto_mostrar(idrol));
                
                response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + idtr.trim() + "&aut=1&dgp=" + iddgp + "&p=" + puesto_id + "&c=" + cod + "&pas=" + idpasos + "&drp=" + drp + "&np=" + np + "&vnc=" + num_c_dgp+"&val_aps="+val_aps);
            }
            if ("registrar_aps".equals(opc)) {
                String idtr = request.getParameter("idtr");
                String id_contrato = con.Buscar_id_contrato_x_idtr(idtr);
                /*if (cc.Lis_c_c_id_contr(id_contrato).size() > 0) {
                 getServletContext().setAttribute("Lis_c_c_id_contr", cc.Lis_c_c_id_contr(id_contrato));
                 }
                 */
                
                String iddgp = request.getParameter("iddetalle_dgp");
                String puesto_id = request.getParameter("puesto_id");
                String cod = request.getParameter("cod");
                String idpasos = request.getParameter("idpasos");
                String drp = request.getParameter("IDDETALLE_REQ_PROCESO");
                String np = request.getParameter("nup");
                int co_aps = Integer.parseInt(request.getParameter("cod_aps"));
                em.Reg_aps(idtr, co_aps);
                int num_c_dgp = dgp.VALIDAR_DGP_CONTRATO(iddgp);
                int val_aps=em.val_cod_aps_empleado(idtr);
                getServletContext().setAttribute("id_empleadox_ide", em.id_empleadox_ide(idtr));
                getServletContext().setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                getServletContext().setAttribute("List_Auto_mostrar", li.List_Auto_mostrar(idrol));
                response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + idtr.trim() + "&aut=1&dgp=" + iddgp + "&p=" + puesto_id + "&c=" + cod + "&pas=" + idpasos + "&drp=" + drp + "&np=" + np + "&vnc=" + num_c_dgp+"&val_aps="+val_aps);
            }
            if("EditarAR".equals(opc)){
               String idtr = request.getParameter("idtr");
                getServletContext().setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
               response.sendRedirect("Vista/Trabajador/Historial_Religion/Mod_Asp_Religioso.jsp?idtr="+idtr+"&iduser="+iduser);
            }
            if("Modificar".equals(opc)){
                String idtr = request.getParameter("idtr");
                String LI_RELIGION = request.getParameter("RELIGION");
                String NO_IGLESIA = request.getParameter("IGLESIA");
                String DE_CARGO = request.getParameter("CARGO");
                String LI_AUTORIDAD = request.getParameter("AUTORIDAD");
                String NO_AP_AUTORIDAD = request.getParameter("AUT_APELLIDOSNOMBRES");
                String CL_AUTORIDAD = request.getParameter("AUT_CELULAR");
                String FE_MODIF = "";
                out.print(idtr);
                tr.INSERT_HIST_RELIGION(null, LI_RELIGION, NO_IGLESIA, DE_CARGO, LI_AUTORIDAD, NO_AP_AUTORIDAD, CL_AUTORIDAD, "1", idtr ,iduser,FE_MODIF);
                tr.MOD_ASP_REL(LI_RELIGION, NO_IGLESIA, DE_CARGO, LI_AUTORIDAD, NO_AP_AUTORIDAD, CL_AUTORIDAD, idtr);
                getServletContext().setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                response.sendRedirect("Vista/Trabajador/Aspecto_Social.jsp");
                
            }

       /* } catch (Exception e) {
            out.println(e.getMessage());
        } finally {
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
