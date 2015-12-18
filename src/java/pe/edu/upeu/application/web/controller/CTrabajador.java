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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.Carrera_UniversidadDAO;
import pe.edu.upeu.application.dao.Datos_Hijo_TrabajadorDAO;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.DocumentoDAO;
import pe.edu.upeu.application.dao.EmpleadoDAO;
import pe.edu.upeu.application.dao.Hist_Estado_CivilDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.Tipo_DocumentoDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UbigeoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCarrera_UniversidadDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDatos_Hijo_Trabajador;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceHist_Estado_CivilDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTipo_DocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUbigeoDAO;
import pe.edu.upeu.application.model.Cuenta_Sueldo;
import pe.edu.upeu.application.model.Empleado;

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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        Map<String, Object> rpta = new HashMap<String, Object>();
        HttpSession sesion = request.getSession(true);
        String idrol = (String) sesion.getAttribute("IDROL");
        String iduser = (String) sesion.getAttribute("IDUSER");
        String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        String user = (String) sesion.getAttribute("IDUSER");

        if (user != null) {
            try {
                InterfaceListaDAO l = new ListaDAO();
                InterfaceListaDAO li = new ListaDAO();
                InterfaceUbigeoDAO ub = new UbigeoDAO();
                InterfaceTrabajadorDAO tr = new TrabajadorDAO();
                InterfaceDocumentoDAO d = new DocumentoDAO();
                InterfaceEmpleadoDAO em = new EmpleadoDAO();
                InterfaceDgpDAO dgp = new DgpDAO();
                InterfaceDireccionDAO dir = new DireccionDAO();
                InterfaceTipo_DocumentoDAO tdoc = new Tipo_DocumentoDAO();
                InterfaceCarrera_UniversidadDAO cu = new Carrera_UniversidadDAO();
                InterfaceHist_Estado_CivilDAO ec = new Hist_Estado_CivilDAO();
                String opc = "";
                String Text = "";
                opc = (String) request.getParameter("opc");
                Text = (String) request.getParameter("text");
                InterfaceDatos_Hijo_Trabajador h = new Datos_Hijo_TrabajadorDAO();
                if (opc.equals("Form_Reg")) {
                    sesion.setAttribute("List_Carrera", li.List_Carrera());
                    sesion.setAttribute("List_Nacionalidad", li.List_Nacionalidad());
                    sesion.setAttribute("List_Universidad", li.List_Universidad());
                    sesion.setAttribute("List_Departamento", ub.List_Departamento());
                    sesion.setAttribute("List_Situacion_Educativa", li.List_Situacion_Educativa());
                    sesion.setAttribute("Listar_via", dir.Listar_via());
                    sesion.setAttribute("Listar_zona", dir.Listar_zona());
                    sesion.setAttribute("Listar_tipo_doc", tdoc.Listar_tipo_doc());
                    sesion.setAttribute("list_año", li.lista_años());
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
                    String DE_ANNO_EGRESO = request.getParameter("A_EGRESO");
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
                    String NU_CUENTA_BANC = request.getParameter("CUENTA_BANC");
                    String ES_GEM_NU_CUENTA = (request.getParameter("GEN_NU_CUEN") == null) ? "0" : "1";
                    String NO_BANCO_OTROS = request.getParameter("BANCO_OTROS");
                    String ES_CUENTA_SUELDO = request.getParameter("ES_CUENTA_SUELDO");
                    String CO_UNIVERSITARIO = request.getParameter("COD_UNI");

                    //VALIDACIONES CUENTA SUELDO
                    if (NO_BANCO.equals("") && ES_GEM_NU_CUENTA.equals("0")) {
                        ES_CUENTA_SUELDO = "0";
                    } else {
                        ES_CUENTA_SUELDO = "1";
                    }

                    if (tr.val_nu_doc(NU_DOC)) {
                        out.print("Trabajador ya existe!");
                    } else {

                        tr.INSERT_TRABAJADOR(null, AP_PATERNO, AP_MATERNO, NO_TRABAJADOR, TI_DOC, NU_DOC, ES_CIVIL, FE_NAC, ID_NACIONALIDAD, ID_DEPARTAMENTO, ID_PROVINCIA, ID_DISTRITO, TE_TRABAJADOR, CL_TRA, DI_CORREO_PERSONAL, DI_CORREO_INST, CO_SISTEMA_PENSIONARIO, LI_NIVEL_EDUCATIVO, REGIMEN, ES_INST_PERU, CARRERA, DE_ANNO_EGRESO, CM_OTROS_ESTUDIOS, ES_SEXO, LI_GRUPO_SANGUINEO, DE_REFERENCIA, LI_RELIGION, NO_IGLESIA, DE_CARGO, LI_AUTORIDAD, NO_AP_AUTORIDAD, CL_AUTORIDAD, ID_NO_AFP, ES_AFILIADO_ESSALUD, LI_TIPO_TRABAJADOR, CA_TIPO_HORA_PAGO_REFEERENCIAL, ES_FACTOR_RH, LI_DI_DOM_A_D1, DI_DOM_A_D2, LI_DI_DOM_A_D3, DI_DOM_A_D4, LI_DI_DOM_A_D5, DI_DOM_A_D6, DI_DOM_A_REF, ID_DI_DOM_A_DISTRITO, LI_DI_DOM_LEG_D1, DI_DOM_LEG_D2, LI_DI_DOM_LEG_D3, DI_DOM_LEG_D4, LI_DI_DOM_LEG_D5, DI_DOM_LEG_D6, ID_DI_DOM_LEG_DISTRITO, CA_ING_QTA_CAT_EMPRESA, CA_ING_QTA_CAT_RUC, CA_ING_QTA_CAT_OTRAS_EMPRESAS, CM_OBSERVACIONES, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, AP_NOMBRES_PADRE, AP_NOMBRES_MADRE,
                                ES_TRABAJA_UPEU_C, AP_NOMBRES_C, FE_NAC_C, ID_TIPO_DOC_C, NU_DOC_C, LI_INSCRIPCION_VIG_ESSALUD_C, ID_CONYUGUE, CO_UNIVERSITARIO);
                        String idtr = tr.MAX_ID_DATOS_TRABAJADOR();
                        tr.INSERT_CUENTA_SUELDO(null, NO_BANCO, NU_CUENTA, NU_CUENTA_BANC, ES_GEM_NU_CUENTA, NO_BANCO_OTROS, idtr, ES_CUENTA_SUELDO);
                        tr.INSERT_HIST_RELIGION(null, LI_RELIGION, NO_IGLESIA, DE_CARGO, LI_AUTORIDAD, NO_AP_AUTORIDAD, CL_AUTORIDAD, "1", idtr, iduser, FE_MODIF);
                        US_MODIF = iduser;
                        IP_USUARIO = tr.ip();
                        tr.UPDATE_ID_CONYUGUE(idtr, ID_CONYUGUE, US_MODIF, IP_USUARIO);
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
                            if (NU_DOC_H != null) {
                                if (!NU_DOC_H.equals("")) {
                                    h.INSERT_DATOS_HIJO_TRABAJADOR(null, idtr, AP_PATERNO_H, AP_MATERNO_H, NO_HIJO_TRABAJADOR, FE_NACIMIENTO, ES_SEXO_H, ES_TIPO_DOC, NU_DOC_H, ES_PRESENTA_DOCUMENTO, ES_INSCRIPCION_VIG_ESSALUD, ES_ESTUDIO_NIV_SUPERIOR, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, ES_DATOS_HIJO_TRABAJADOR);
                                }
                            }
                        }
                        sesion.setAttribute("List_Hijos", d.List_Hijos(idtr));
                        sesion.setAttribute("Documentos", d.Documentos());
                        sesion.setAttribute("Lis_doc_trabajador", d.Lis_doc_trabajador(idtr));
                        sesion.setAttribute("List_Conyugue", d.List_Conyugue(idtr));
                        int s = d.List_Req_nacionalidad(idtr);
                        int num_ad = d.List_Adventista(idtr);
                        int count = d.count_documentos_x_tra(idtr);
                        if (count > 0) {
                            response.sendRedirect("Vista/Trabajador/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&P2=TRUE&idtr=" + idtr + "&dt=ok");
                        } else {
                            response.sendRedirect("Vista/Trabajador/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&idtr=" + idtr + "&pro=pr_dgp&P2=TRUE&dt=ok");
                        }
                    }
                }
                if (opc.equals("Buscar")) {
                    String Buscar = request.getParameter("busqueda");
                    String dni = request.getParameter("dni");
                    String nom = request.getParameter("nom");
                    String ape_mat = request.getParameter("ape_mat");
                    String ape_pat = request.getParameter("ape_pat");
                    String id_req = request.getParameter("id_req");
                    if (("Buscar".equals(Buscar) & (!"".equals(dni) | !"".equals(nom) | !"".equals(ape_mat) | !"".equals(ape_pat)))) {
                        String busc = (String) request.getParameter("busc");
                        if (busc != null) {
                            sesion.setAttribute("ListarTrabajador2", tr.Buscar_Trabajador_Requerimiento(iddep, dni, nom, ape_pat, ape_mat, id_req));
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
                        sesion.setAttribute("ListarTrabajador", tr.Buscar_Ficha_Trabajador(iddep, dni, nom, ape_pat, ape_mat));
                        getServletContext().setAttribute(nom, dgp.VAL_OPC_DGP(dni));
                        response.sendRedirect("Vista/Trabajador/Ficha_Trabajador.jsp");
                    } else {
                        response.sendRedirect("Vista/Trabajador/Ficha_Trabajador.jsp");
                    }
                }
                if ("list".equals(opc)) {
                    String idtr = request.getParameter("idtr");
                    sesion.setAttribute("List_Cuenta_Sueldo", tr.List_Cuenta_Sueldo(idtr));
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    sesion.setAttribute("List_Universidad", li.List_Universidad());
                    sesion.setAttribute("List_tipo_institucion", cu.List_Tipo_Ins());
                    sesion.setAttribute("List_Ubigeo", ub.List_Distrito());
                    sesion.setAttribute("Listar_tipo_doc", tdoc.Listar_tipo_doc());
                    sesion.setAttribute("id_empleadox_ide", em.id_empleadox_ide(idtr));
                    response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + idtr);
                }
                if ("list_reg_tra".equals(opc)) {
                    String idtr = request.getParameter("idtr");
                    String me = request.getParameter("aa");
                    String op = request.getParameter("a");
                    if (op != null) {
                        me = "t";
                    }
                    sesion.setAttribute("List_Cuenta_Sueldo", tr.List_Cuenta_Sueldo(idtr));
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    sesion.setAttribute("List_Universidad", li.List_Universidad());
                    sesion.setAttribute("List_tipo_institucion", cu.List_Tipo_Ins());
                    sesion.setAttribute("List_Ubigeo", ub.List_Distrito());
                    sesion.setAttribute("Listar_tipo_doc", tdoc.Listar_tipo_doc());
                    response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + idtr.trim() + "&ms=" + me);
                }
                if ("actualizar".equals(opc)) {
                    String idtr = request.getParameter("idtr");
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + idtr.trim());
                }
                if ("Documento_Trabajador".equals(opc)) {
                    String idtr = request.getParameter("idtr");
                    sesion.setAttribute("Lis_doc_trabajador_hab", d.Lis_doc_trabajador_hab(idtr));
                    response.sendRedirect("Vista/Trabajador/List_Doc_Trabajador.jsp?idtr=" + idtr);
                }
                if ("aut".equals(opc)) {
                    String idtr = request.getParameter("idtr");
                    int val_aps = 0;
                    int val_huella = 0;
                    String iddgp = request.getParameter("iddetalle_dgp");
                    String puesto_id = request.getParameter("puesto_id");
                    String cod = request.getParameter("cod");
                    String idpasos = request.getParameter("idpasos");
                    String drp = request.getParameter("IDDETALLE_REQ_PROCESO");
                    String np = request.getParameter("nup");
                    int num_c_dgp = dgp.VALIDAR_DGP_CONTRATO(iddgp);
                    val_aps = em.val_cod_aps_empleado(idtr);
                    val_huella = em.val_cod_huella(idtr);
                    sesion.setAttribute("id_empleadox_ide", em.id_empleadox_ide(idtr));
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    sesion.setAttribute("List_Auto_mostrar", li.List_Auto_mostrar(idrol));
                    sesion.setAttribute("List_", li.List_Auto_mostrar(idrol));

                    response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + idtr.trim() + "&aut=1&dgp=" + iddgp + "&p=" + puesto_id + "&c=" + cod + "&pas=" + idpasos + "&drp=" + drp + "&np=" + np + "&vnc=" + num_c_dgp + "&val_aps=" + val_aps + "&val_huella=" + val_huella);
                }
                if (opc.equals("Mostrar_Cod_APS")) {
                    String idtr = request.getParameter("tr");
                    List<Empleado> e = em.id_empleadox_ide(idtr);
                    if (e.size() == 0) {
                        rpta.put("msg", "0");
                    } else {
                        for (int i = 0; i < e.size(); i++) {

                        }
                        rpta.put("msg", "1");
                    }

                }
                if ("reg_aps_masivo".equals(opc)) {
                    String idtr = request.getParameter("idtr");
                    int co_aps = Integer.parseInt(request.getParameter("cod"));
                    em.Reg_aps(idtr, co_aps);
                    sesion.setAttribute("id_empleadox_ide", em.id_empleadox_ide(idtr));
                    response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + idtr + "");
                }
                if ("registrar_huella".equals(opc)) {
                    String idtr = request.getParameter("idtr");
                    int co_huella = Integer.parseInt(request.getParameter("cod"));
                    em.Reg_cod_huella(idtr, co_huella);
                    rpta.put("rpta", "1");
                }
                if (opc.equals("Editar_Dat_Gen")) {
                    String idtr = request.getParameter("idtr");
                    String edit = request.getParameter("edit");
                    sesion.setAttribute("3e", tr.ListaridTrabajador(idtr));
                    sesion.setAttribute("List_Nacionalidad", li.List_Nacionalidad());
                    sesion.setAttribute("List_Departamento", ub.List_Departamento());
                    sesion.setAttribute("List_Provincia", ub.List_Provincia());
                    sesion.setAttribute("List_Distrito", ub.List_DistritoTra());
                    sesion.setAttribute("Listar_tipo_doc", tdoc.Listar_tipo_doc());
                    response.sendRedirect("Vista/Trabajador/Mod_Datos_Generales.jsp?idtr=" + idtr + "&edit=" + edit);
                }
                if (opc.equals("Modificar_Dat_Gen")) {
                    String edit = request.getParameter("editar");
                    String ID_TRABAJADOR = request.getParameter("IDTR");
                    String AP_PATERNO = request.getParameter("APELLIDO_P");
                    String AP_MATERNO = request.getParameter("APELLIDO_M");
                    String NO_TRABAJADOR = request.getParameter("NOMBRES");
                    String ES_SEXO = request.getParameter("SEXO");
                    String FE_NAC = request.getParameter("FECHA_NAC");
                    String ID_NACIONALIDAD = request.getParameter("NACIONALIDAD");
                    String ID_DEPARTAMENTO = null;
                    String ID_PROVINCIA = null;
                    String ID_DISTRITO = request.getParameter("DISTRITO");
                    String TI_DOC = "";
                    String NU_DOC = "";
                    if (edit.equals("ok")) {
                        TI_DOC = request.getParameter("TI_DOC");
                        NU_DOC = request.getParameter("NU_DOC");
                    } else {
                        TI_DOC = request.getParameter("TIPO_DOC");
                        NU_DOC = request.getParameter("NRO_DOC");
                    }
                    String ES_CIVIL = request.getParameter("ESTADO_CIVIL");
                    String LI_GRUPO_SANGUINEO = request.getParameter("GRUPO_SANGUINEO");
                    String ES_FACTOR_RH = request.getParameter("FACTOR_RH_ID");
                    String TE_TRABAJADOR = request.getParameter("TELEFONO");
                    String CL_TRA = request.getParameter("CELULAR");
                    String DI_CORREO_PERSONAL = request.getParameter("CORREO_PERSONAL");
                    String DI_CORREO_INST = request.getParameter("CORREO_INST");
                    String CO_SISTEMA_PENSIONARIO = request.getParameter("SISTEMA_PENSIONARIO");
                    String ID_NO_AFP = request.getParameter("NOMBRE_AFP_ID");
                    String ES_AFILIADO_ESSALUD = request.getParameter("AFILIADO_ESSALUD_ID");
                    String LI_TIPO_TRABAJADOR = request.getParameter("TIPO_TRABAJADOR_ID");
                    String idtr = request.getParameter("idtr");
                    String US_MODIF = iduser;
                    String IP_USUARIO = tr.ip();
                    String FE_MODIFICACION = "";
                    String ES_CIVIL_A = request.getParameter("ES_CIVIL_A");
                    String ES_REGISTRO = request.getParameter("ES_REGISTRO");
                    if (!ES_CIVIL.equals(ES_CIVIL_A)) {
                        ec.INSERT_HIST_ESTADO_CIVIL(null, ES_CIVIL_A, FE_MODIFICACION, US_MODIF, ID_TRABAJADOR, ES_REGISTRO);
                    }
                    tr.MOD_DAT_GEN(AP_PATERNO, AP_MATERNO, NO_TRABAJADOR, TI_DOC, NU_DOC, ES_CIVIL, FE_NAC, ID_NACIONALIDAD, ID_DEPARTAMENTO, ID_PROVINCIA, ID_DISTRITO, TE_TRABAJADOR, CL_TRA, DI_CORREO_PERSONAL, DI_CORREO_INST, CO_SISTEMA_PENSIONARIO, ES_SEXO, LI_GRUPO_SANGUINEO, ID_NO_AFP, ES_AFILIADO_ESSALUD, LI_TIPO_TRABAJADOR, ES_FACTOR_RH, idtr, US_MODIF, IP_USUARIO);
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    if (edit.equals("ok")) {
                        response.sendRedirect("Vista/Trabajador/Datos_Generales.jsp?idtr=" + idtr + "&edit=" + edit);
                    } else {
                        response.sendRedirect("Vista/Trabajador/Datos_Generales.jsp?idtr=" + idtr);
                    }
                }
                if (opc.equals("Editar_Asp_Acad")) {
                    String idtr = request.getParameter("idtr");
                    String edit = request.getParameter("edit");
                    boolean x = false;
                    List<Cuenta_Sueldo> li1 = tr.List_Cuenta_Sueldo(idtr);
                    //while (x) {
                    if (!li1.isEmpty()) {
                        x = false;
                        sesion.setAttribute("List_Cuenta_Sueldo", li1);
                    } else {
                        tr.INSERT_CUENTA_SUELDO(null, null, null, null, "0", null, idtr, "0");
                    }
                    // }
                    if (li1.get(0).getEs_cuenta_sueldo().trim().equals("1")) {
                        edit = "ok";
                    }
                    sesion.setAttribute("List_tipo_institucion", cu.List_Tipo_Ins());
                    sesion.setAttribute("list_año", li.lista_años());
                    sesion.setAttribute("List_Universidad", li.List_Universidad());
                    sesion.setAttribute("List_Carrera", li.List_Carrera());
                    sesion.setAttribute("List_Situacion_Educativa", li.List_Situacion_Educativa());
                    response.sendRedirect("Vista/Trabajador/Mod_Aspecto_Academico.jsp?idtr=" + idtr + "&edit=" + edit);

                }
                if (opc.equals("Modificar_Asp_Acad")) {
                    String idtr = request.getParameter("idtr");
                    //ASPECTO ACADEMICO
                    String LI_NIVEL_EDUCATIVO = request.getParameter("NIVEL_EDUCATIVO");
                    String CARRERA = request.getParameter("CARRERA");
                    String REGIMEN = request.getParameter("REGIMEN");
                    String ES_INST_PERU = request.getParameter("ES_INST_PERU");
                    String DE_ANNO_EGRESO = request.getParameter("A_EGRESO");
                    String CM_OTROS_ESTUDIOS = request.getParameter("OTROS_ESTUDIOS");
                    String CA_TIPO_HORA_PAGO_REFEERENCIAL = request.getParameter("TIPO_HORA_PAGO_REFEERENCIAL");
                    String CO_UNIVERSITARIO = request.getParameter("CO_UNIVERSITARIO");
                    String US_MODIF = iduser;
                    String IP_USUARIO = tr.ip();
                    tr.MOD_ASPEC_ACADEM(LI_NIVEL_EDUCATIVO, REGIMEN, ES_INST_PERU, CARRERA, DE_ANNO_EGRESO, CM_OTROS_ESTUDIOS, CA_TIPO_HORA_PAGO_REFEERENCIAL, idtr, CO_UNIVERSITARIO, US_MODIF, IP_USUARIO);
                    String editar = request.getParameter("editar");
                    //MODIFICAR CUENTA SUELDO
                    String NO_BANCO = "";
                    String NU_CUENTA = "";
                    String NU_CUENTA_BANC = "";
                    String ES_GEM_NU_CUENTA = "";
                    String NO_BANCO_OTROS = "";
                    if (request.getParameter("BANCO") != null) {
                        if (editar.equals("ok")) {
                            NO_BANCO = (request.getParameter("BANCO").equals("null")) ? null : request.getParameter("BANCO");
                            NU_CUENTA = (request.getParameter("CUENTA").equals("null")) ? null : request.getParameter("CUENTA");
                            NU_CUENTA_BANC = (request.getParameter("CUEN_BAN").equals("null")) ? null : request.getParameter("CUEN_BAN");
                            ES_GEM_NU_CUENTA = (request.getParameter("GCC"));
                            NO_BANCO_OTROS = (request.getParameter("BAN_OTROS").equals("null")) ? null : request.getParameter("BAN_OTROS");
                        } else {
                            NO_BANCO = request.getParameter("BANCO");
                            NU_CUENTA = (request.getParameter("CUENTA") == null) ? "no tiene" : request.getParameter("CUENTA");
                            NU_CUENTA_BANC = request.getParameter("CUENTA_BANC");
                            ES_GEM_NU_CUENTA = (request.getParameter("GEN_NU_CUEN") == null) ? "0" : "1";
                            NO_BANCO_OTROS = request.getParameter("BANCO_OTROS");
                        }
                        String ES_CUENTA_SUELDO = request.getParameter("ES_CUENTA_SUELDO");
                        if (NO_BANCO == null || NO_BANCO.equals("null")) {
                            ES_CUENTA_SUELDO = "0";
                        } else {
                            ES_CUENTA_SUELDO = "1";
                        }
                        tr.MOD_CUENTA_SUELDO(NO_BANCO, NU_CUENTA, NU_CUENTA_BANC, ES_GEM_NU_CUENTA, NO_BANCO_OTROS, idtr, ES_CUENTA_SUELDO);
                    }
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    sesion.setAttribute("List_Cuenta_Sueldo", tr.List_Cuenta_Sueldo(idtr));

                    if (editar.equals("ok")) {
                        response.sendRedirect("Vista/Trabajador/Aspecto_Academico.jsp?edit=" + editar + "&idtr=" + idtr);
                    } else {
                        response.sendRedirect("Vista/Trabajador/Aspecto_Academico.jsp?idtr=" + idtr);
                    }
                }
                if (opc.equals("Listar_Asp_Social")) {
                    String idtr = request.getParameter("idtr");
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    sesion.setAttribute("Listar_via", dir.Listar_via());
                    sesion.setAttribute("Listar_zona", dir.Listar_zona());
                    sesion.setAttribute("ListarDir_Dom", li.List_Dom_D3_Id());
                    sesion.setAttribute("List_Provincia", ub.List_Provincia());
                    sesion.setAttribute("List_Distrito", ub.List_DistritoTra());
                    sesion.setAttribute("List_Ubigeo", ub.List_Distrito());
                    sesion.setAttribute("List_Departamento", ub.List_Departamento());
                    sesion.setAttribute("List_Dom_D1_Id", l.List_Dom_D1_Id());
                    sesion.setAttribute("List_Dom_D5_Id", l.List_Dom_D5_Id());
                    sesion.setAttribute("List_Dom_D3_Id", l.List_Dom_D3_Id());

                    response.sendRedirect("Vista/Trabajador/Aspecto_Social.jsp?idtr=" + idtr);
                }

                if (opc.equals("Editar_Asp_Soc")) {
                    String idtr = request.getParameter("idtr");
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    sesion.setAttribute("Listar_via", dir.Listar_via());
                    sesion.setAttribute("Listar_zona", dir.Listar_zona());
                    sesion.setAttribute("ListarDir_Dom", li.List_Dom_D3_Id());
                    sesion.setAttribute("List_Provincia", ub.List_Provincia());
                    sesion.setAttribute("List_Distrito", ub.List_DistritoTra());
                    sesion.setAttribute("List_Ubigeo", ub.List_Distrito());
                    sesion.setAttribute("List_Departamento", ub.List_Departamento());
                    sesion.setAttribute("List_Dom_D1_Id", l.List_Dom_D1_Id());
                    sesion.setAttribute("List_Dom_D5_Id", l.List_Dom_D5_Id());
                    sesion.setAttribute("List_Dom_D3_Id", l.List_Dom_D3_Id());

                    response.sendRedirect("Vista/Trabajador/Mod_Aspecto_Social.jsp?idtr=" + idtr);
                }
                if (opc.equals("Modificar_Asp_Soc")) {
                    String idtr = request.getParameter("idtr");
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
                    String US_MODIF = iduser;
                    String IP_USUARIO = tr.ip();
                    tr.MOD_ASPEC_SOCIAL(LI_DI_DOM_A_D1, DI_DOM_A_D2, LI_DI_DOM_A_D3, DI_DOM_A_D4, LI_DI_DOM_A_D5, DI_DOM_A_D6, DI_DOM_A_REF, ID_DI_DOM_A_DISTRITO, LI_DI_DOM_LEG_D1, DI_DOM_LEG_D2, LI_DI_DOM_LEG_D3, DI_DOM_LEG_D4, LI_DI_DOM_LEG_D5, DI_DOM_LEG_D6, ID_DI_DOM_LEG_DISTRITO, CA_ING_QTA_CAT_EMPRESA, CA_ING_QTA_CAT_RUC, CA_ING_QTA_CAT_OTRAS_EMPRESAS, idtr, US_MODIF, IP_USUARIO);
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    response.sendRedirect("Vista/Trabajador/Aspecto_Social.jsp?idtr=" + idtr);
                }
                if ("Editar_Asp_Rel".equals(opc)) {
                    String idtr = request.getParameter("idtr");
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    response.sendRedirect("Vista/Trabajador/Historial_Religion/Mod_Asp_Religioso.jsp?idtr=" + idtr + "&iduser=" + iduser);
                }
                if ("Modificar_Asp_Rel".equals(opc)) {
                    String idtr = request.getParameter("idtr");
                    String LI_RELIGION = request.getParameter("RELIGION");
                    String NO_IGLESIA = request.getParameter("IGLESIA");
                    String DE_CARGO = request.getParameter("CARGO");
                    String LI_AUTORIDAD = request.getParameter("AUTORIDAD");
                    String NO_AP_AUTORIDAD = request.getParameter("AUT_APELLIDOSNOMBRES");
                    String CL_AUTORIDAD = request.getParameter("AUT_CELULAR");
                    String FE_MODIF = "";
                    out.print(NO_AP_AUTORIDAD);
                    tr.INSERT_HIST_RELIGION(null, LI_RELIGION, NO_IGLESIA, DE_CARGO, LI_AUTORIDAD, NO_AP_AUTORIDAD, CL_AUTORIDAD, "1", idtr, iduser, FE_MODIF);
                    tr.MOD_ASP_REL(LI_RELIGION, NO_IGLESIA, DE_CARGO, LI_AUTORIDAD, NO_AP_AUTORIDAD, CL_AUTORIDAD, idtr, iduser, tr.ip());
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    response.sendRedirect("Vista/Trabajador/Aspecto_Social.jsp");
                }
                if ("edit_perfil".equals(opc)) {
                    String idtr = tr.ID_TRB(user);
                    sesion.setAttribute("List_Cuenta_Sueldo", tr.List_Cuenta_Sueldo(idtr));
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    sesion.setAttribute("List_Universidad", li.List_Universidad());
                    sesion.setAttribute("List_tipo_institucion", cu.List_Tipo_Ins());
                    sesion.setAttribute("List_Ubigeo", ub.List_Distrito());
                    sesion.setAttribute("Listar_tipo_doc", tdoc.Listar_tipo_doc());
                    sesion.setAttribute("id_empleadox_ide", em.id_empleadox_ide(idtr));
                    response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?edit=ok&idtr=" + idtr);
                }
                if (opc.equals("Form_Cambiar_Clave")) {
                    response.sendRedirect("Vista/Usuario/Cambiar_Pwd.jsp");
                }
                if (opc.equals("Val_num_Doc")) {
                    String nu_doc = request.getParameter("doc");
                    out.print(tr.val_nu_doc(nu_doc));
                }
                if (opc.equals("validar_cod_uni")) {
                    String cod_uni = request.getParameter("cod_uni");
                    int n = tr.cod_uni_unico(cod_uni);
                    out.print(n);
                }
                if (opc.equals("reg_trb")) {
                    response.sendRedirect("Vista/Trabajador/Ficha_Trabajador.jsp");
                }

            } catch (Exception e) {
                rpta.put("rpta", "-1");
                rpta.put("mensaje", e.getMessage());
            } finally {
                Gson gson = new Gson();
                out.print(gson.toJson(rpta));
                out.flush();
                out.close();
            }
        } else {
            // response.sendRedirect("/TALENTO_HUMANO/");
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
