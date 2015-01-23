/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.AnnoDAO;
import pe.edu.upeu.application.dao.AreaDAO;
import pe.edu.upeu.application.dao.Centro_CostoDAO;
import pe.edu.upeu.application.dao.ContratoDAO;
import pe.edu.upeu.application.dao.Datos_Hijo_TrabajadorDAO;
import pe.edu.upeu.application.dao.Detalle_Centro_Costo_DAO;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.EmpleadoDAO;
import pe.edu.upeu.application.dao.GrupoOcupacionesDAO;
import pe.edu.upeu.application.dao.HorarioDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.PlantillaDAO;
import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao.SeccionDAO;
import pe.edu.upeu.application.dao.Sub_ModalidadDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UsuarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAnnoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAreaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCentro_CostosDAO;
import pe.edu.upeu.application.dao_imp.InterfaceContratoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDatos_Hijo_Trabajador;
import pe.edu.upeu.application.dao_imp.InterfaceDetalle_Centro_Costo;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceGrupo_ocupacionesDAO;
import pe.edu.upeu.application.dao_imp.InterfaceHorarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfacePlantillaDAO;
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceSeccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceSub_ModalidadDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO;

/**
 *
 * @author Jose
 */
public class CContrato extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    InterfaceAnnoDAO a = new AnnoDAO();
    InterfaceDgpDAO dgp = new DgpDAO();
    InterfacePuestoDAO puesto = new PuestoDAO();
    InterfaceHorarioDAO IHor = new HorarioDAO();
    InterfaceDatos_Hijo_Trabajador dht = new Datos_Hijo_TrabajadorDAO();
    InterfaceSeccionDAO seccion = new SeccionDAO();
    InterfaceContratoDAO con = new ContratoDAO();
    InterfaceListaDAO l = new ListaDAO();
    InterfaceDetalle_Centro_Costo dcc = new Detalle_Centro_Costo_DAO();
    InterfaceAreaDAO area = new AreaDAO();
    InterfaceSeccionDAO sec = new SeccionDAO();
    InterfaceEmpleadoDAO emp = new EmpleadoDAO();
    InterfacePlantillaDAO pl = new PlantillaDAO();
    InterfaceUsuarioDAO usu = new UsuarioDAO();
    InterfaceTrabajadorDAO tr = new TrabajadorDAO();
    InterfaceCentro_CostosDAO cc = new Centro_CostoDAO();
    InterfaceDireccionDAO dir = new DireccionDAO();
    InterfaceGrupo_ocupacionesDAO gr = new GrupoOcupacionesDAO();
    InterfaceSub_ModalidadDAO sub = new Sub_ModalidadDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        String iduser = (String) sesion.getAttribute("IDUSER");
        String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        //try {
        if (opc.equals("enviar")) {
            String iddgp = request.getParameter("iddgp");
            String idtr = request.getParameter("idtr");

            getServletContext().setAttribute("List_Anno", a.List_Anno());
            getServletContext().setAttribute("LIST_ID_DGP", dgp.LIST_ID_DGP(iddgp));
            getServletContext().setAttribute("List_Puesto", puesto.List_Puesto());
            getServletContext().setAttribute("Listar_Direccion", dir.Listar_Direccion());

            //getServletContext().setAttribute("LISTA_RH_SECCION", seccion.LISTA_RH_SECCION());
            getServletContext().setAttribute("List_anno_max", a.List_anno_max());
            getServletContext().setAttribute("List_modalidad", con.List_modalidad());
            getServletContext().setAttribute("list_reg_labo", con.list_reg_labo());
            getServletContext().setAttribute("List_centro_costo", cc.List_centro_costo());
            //getServletContext().setAttribute("Listar_Direccion", dir.Listar_Direccion());
            getServletContext().setAttribute("List_grup_ocu", gr.List_grup_ocu());
            int num = dht.ASIGNACION_F(idtr);
            // out.println(num);
            response.sendRedirect("Vista/Contrato/Reg_Contrato.jsp?num=" + num);
        }
        if (opc.equals("Detalle_Contractual")) {
            String idtr = request.getParameter("idtr");
            String ida1 = a.List_Anno_Max_Cont(idtr);
            String id_cto=con.Contrato_max(idtr);
            getServletContext().setAttribute("List_Anno_trabajador", a.List_Anno_trabajador(idtr));
            getServletContext().setAttribute("Lis_c_c_id_contr", cc.Lis_c_c_id_contr(idtr));
            getServletContext().setAttribute("List_contra_x_idcto", con.List_contra_x_idcto(id_cto));
            getServletContext().setAttribute("List_Situacion_Actual", l.List_Situacion_Actual());
            //getServletContext().setAttribute("List_Planilla", pl.List_Planilla(ID_DIRECCION, ID_DEPARTAMENTO, ID_SEC, ID_PUESTO, ID_AREA));
            getServletContext().setAttribute("List_Usuario", usu.List_Usuario());
            getServletContext().setAttribute("list_Condicion_contrato", l.list_Condicion_contrato());
            getServletContext().setAttribute("List_tipo_contrato", l.List_tipo_contrato());
            getServletContext().setAttribute("list_reg_labo", con.list_reg_labo());
            out.print(id_cto+ida1+idtr);
            response.sendRedirect("Vista/Contrato/Detalle_Info_Contractualq.jsp?anno=" + ida1.trim()+"&idtr="+idtr.trim()+"&id_cto="+id_cto);
        }
        if (opc.equals( "actualizar")) {
            String ida1 = request.getParameter("ida");
            String idtr = request.getParameter("idtr");
            String id_cto =request.getParameter("ida");
            getServletContext().setAttribute("List_Anno_trabajador", a.List_Anno_trabajador(idtr));
            getServletContext().setAttribute("Lis_c_c_id_contr", cc.Lis_c_c_id_contr(idtr));
            getServletContext().setAttribute("List_contra_x_idcto", con.List_contra_x_idcto(id_cto));
            getServletContext().setAttribute("List_Situacion_Actual", l.List_Situacion_Actual());
            //getServletContext().setAttribute("List_Planilla", pl.List_Planilla(ID_DIRECCION, ID_DEPARTAMENTO, ID_SEC, ID_PUESTO, ID_AREA));
            getServletContext().setAttribute("List_Usuario", usu.List_Usuario());
            getServletContext().setAttribute("list_Condicion_contrato", l.list_Condicion_contrato());
            getServletContext().setAttribute("List_tipo_contrato", l.List_tipo_contrato());
            getServletContext().setAttribute("list_reg_labo", con.list_reg_labo());
            response.sendRedirect("Vista/Contrato/Detalle_Info_Contractualq.jsp?anno=" + ida1.trim()+"&idtr="+idtr.trim()+"&id_cto="+id_cto);
        }
        if (opc.equals("REGISTRAR CONTRATO")) {
            String ID_CONTRATO = "";
            String ID_DGP = request.getParameter("IDDETALLE_DGP");
            String FE_DESDE = request.getParameter("FEC_DESDE");
            String FE_HASTA = request.getParameter("FEC_HASTA");
            String FE_CESE = null;
            String ID_FUNC = "";
            String LI_CONDICION = request.getParameter("CONDICION");
            Double CA_SUELDO = Double.parseDouble(request.getParameter("SUELDO"));
            Double CA_REINTEGRO = Double.parseDouble(request.getParameter("REINTEGRO"));
            Double CA_ASIG_FAMILIAR = Double.parseDouble(request.getParameter("ASIG_FAMILIAR"));
            Double HO_SEMANA = Double.parseDouble(request.getParameter("HORAS_SEMANA"));
            Double NU_HORAS_LAB = Double.parseDouble(request.getParameter("NRO_HORAS_LAB"));
            Double DIA_CONTRATO = Double.parseDouble(request.getParameter("DIAS"));
            String TI_TRABAJADOR = request.getParameter("TIPO_TRABAJADOR");
            String LI_REGIMEN_LABORAL = request.getParameter("REGIMEN_LABORAL");
            String ES_DISCAPACIDAD = request.getParameter("DISCAPACIDAD");
            String TI_CONTRATO = request.getParameter("TIPO_CONTRATO");
            String LI_REGIMEN_PENSIONARIO = request.getParameter("REGIMEN_PENSIONARIO");
            String ES_CONTRATO_TRABAJADOR = null;
            String US_CREACION = iduser;
            String FE_CREACION = request.getParameter("FECHA_CREACION");
            String US_MODIF = request.getParameter("USER_MODIF");
            String FE_MODIF = request.getParameter("FECHA_MODIF");
            String US_IP = request.getParameter("USUARIO_IP");
            String FE_VACACIO_INI = "";
            String FE_VACACIO_FIN = "";
            String ES_CONTRATO = null;
            String ID_FILIAL = request.getParameter("FILIAL");
            String ID_DIRECCION = "";
            String ID_DEPARTAMENTO = "";
            String ID_AREA = request.getParameter("AREA_ID");
            String ID_PUESTO = request.getParameter("PUESTO_ID");
            String ID_SEC = sec.ID_SECCION(ID_PUESTO).trim();
            Double CA_BONO_ALIMENTO = Double.parseDouble(request.getParameter("BONO_ALIMENTO"));
            String LI_TIPO_CONVENIO = request.getParameter("TIPO_CONVENIO");
            String ES_FIRMO_CONTRATO = "1";
            Double NU_CONTRATO = 0.0;/*Double.parseDouble(request.getParameter("NU_CONTRATO"));*/

            String DE_OBSERVACION = request.getParameter("OBSERVACION");
            String ES_APOYO = "";/*request.getParameter("ES_APOYO");*/

            String TI_HORA_PAGO = request.getParameter("TIPO_HORA_PAGO");
            String NU_DOCUMENTO = ""; /*request.getParameter("NU_DOCUMENTO");*/

            String ID_ANNO = request.getParameter("AÑO_ID");
            String ES_ENTREGAR_DOC_REGLAMENTOS = request.getParameter("ENTREGAR_DOC_REGLAMENTOS");
            String ES_REGISTRO_HUELLA = request.getParameter("REGISTRO_HUELLA");
            String DE_REGISTRO_SISTEM_REMU = request.getParameter("REGISTRO_SISTEM_REMU");
            String ID_TRABAJADOR = request.getParameter("IDDATOS_TRABAJADOR");
            Double CA_SUELDO_TOTAL = Double.parseDouble(request.getParameter("TOTAL_SUELDO"));
            String ID_REGIMEN_LABORAL = request.getParameter("REG_LAB_MINTRA");
            String ID_MODALIDAD = request.getParameter("MODALIDAD");
            String ID_SUB_MODALIDAD = request.getParameter("SUB_MODALIDAD").trim();
            String CO_GR_OCUPACION = request.getParameter("CO_GRUPO_OCU");
            String FE_SUSCRIPCION = request.getParameter("FECHA_SUSCRIPCION");
            String CO_TI_MONEDA = request.getParameter("TIPO_MONEDA");
            String CO_TI_REM_VARIAB = request.getParameter("REM_VARIABLE");
            String DE_REMU_ESPECIE = request.getParameter("REM_ESPECIE");
            String DE_RUC_EMP_TRAB = request.getParameter("EMP_RUC");
            String CO_SUCURSAL = request.getParameter("SUCURSAL");
            String DE_MYPE = request.getParameter("MYPE");
            String ES_TI_CONTRATACION = request.getParameter("TI_CONTRATACION");
            Double CA_BEV = Double.parseDouble(request.getParameter("BEV"));
            String ID_TIPO_PLANILLA = request.getParameter("TIPO_PLANILLA");
            String ES_REMUNERACION_PROCESADO = null;
            String ID_HORARIO = "HORARIO";

            int cantidad_centro = Integer.parseInt(request.getParameter("can_centro_cos"));
            con.INSERT_CONTRATO(ID_CONTRATO, ID_DGP, FE_DESDE, FE_HASTA, FE_CESE, ID_FUNC, LI_CONDICION, CA_SUELDO, CA_REINTEGRO, CA_ASIG_FAMILIAR, HO_SEMANA, NU_HORAS_LAB, DIA_CONTRATO, TI_TRABAJADOR, LI_REGIMEN_LABORAL, ES_DISCAPACIDAD, TI_CONTRATO, LI_REGIMEN_PENSIONARIO, ES_CONTRATO_TRABAJADOR, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, US_IP, FE_VACACIO_INI, FE_VACACIO_FIN, ES_CONTRATO, ID_FILIAL, ID_PUESTO, CA_BONO_ALIMENTO, LI_TIPO_CONVENIO, ES_FIRMO_CONTRATO, NU_CONTRATO, DE_OBSERVACION, ES_APOYO, TI_HORA_PAGO, NU_DOCUMENTO, ID_ANNO, ES_ENTREGAR_DOC_REGLAMENTOS, ES_REGISTRO_HUELLA, DE_REGISTRO_SISTEM_REMU, ID_TRABAJADOR, CA_SUELDO_TOTAL, ID_REGIMEN_LABORAL, ID_MODALIDAD, ID_SUB_MODALIDAD, CO_GR_OCUPACION, FE_SUSCRIPCION, CO_TI_MONEDA, CO_TI_REM_VARIAB, DE_REMU_ESPECIE, DE_RUC_EMP_TRAB, CO_SUCURSAL, DE_MYPE, ES_TI_CONTRATACION, CA_BEV, ID_TIPO_PLANILLA, ES_REMUNERACION_PROCESADO, ID_HORARIO);

            if (cantidad_centro >= 1) {
                for (int c = 0; c < cantidad_centro; c++) {

                    String ID_DET_CEN_COS = request.getParameter("select_cent_c_" + c);
                    String id_contrato = con.Buscar_id_tr(ID_DGP);
                    cc.Mod_det_centro(ID_DET_CEN_COS, id_contrato);

                }
            } else {
            }

            /*Cambiar este for con un trigger al momento de insertar*/
            for (int i = 0; i < con.List_Rh_Contrato_Idtr().size(); i++) {
                emp.VALIDAR_EMPLEADO(con.List_Rh_Contrato_Idtr().get(i));
            }
            /*---*/
            String id_contrato = con.Buscar_id_tr(ID_DGP);
            String idtr1 = ID_TRABAJADOR;
            String ida1 = a.List_Anno_Max_Cont(idtr1);
            out.print(id_contrato + idtr1 + ida1);
            // getServletContext().setAttribute("Lis_c_c_id_contr", cc.Lis_c_c_id_contr(id_contrato));
            getServletContext().setAttribute("List_id_Contrato_DGP", con.List_id_Contrato_DGP(idtr1, ida1));
            getServletContext().setAttribute("List_Anno_Id_Tr_DGP", con.List_Anno_Id_Tr_DGP(idtr1));
            getServletContext().setAttribute("List_Jefe", l.List_Jefe());
            getServletContext().setAttribute("List_Situacion_Actual", l.List_Situacion_Actual());
            getServletContext().setAttribute("List_Planilla", pl.List_Planilla(ID_DIRECCION, ID_DEPARTAMENTO, ID_SEC, ID_PUESTO, ID_AREA));
            getServletContext().setAttribute("List_ID_User", usu.List_ID_User(US_CREACION));
            getServletContext().setAttribute("list_Condicion_contrato", l.list_Condicion_contrato());
            getServletContext().setAttribute("List_tipo_contrato", l.List_tipo_contrato());
            //getServletContext().setAttribute("List_tipo_contrato", l.List_tipo_contrato());*/
            //response.sendRedirect("Vista/Contrato/Reg_Casos_Especiales.jsp");
             response.sendRedirect("Vista/Contrato/Detalle_Info_Contractual.jsp?ida1=" + ida1);
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
                        response.sendRedirect("Vista/Contrato/Gen_Contrato_CE.jsp");
                    }
                } else {
                    response.sendRedirect("Vista/Contrato/Gen_Contrato_CE.jsp");

                }
            }

        if (opc.equals("LIST_FORMULARIO")) {
            
            
            String US_CREACION = iduser;
            String idtr1 = request.getParameter("idtr");
           

           // getServletContext().setAttribute("List_Anno_Id_Tr_DGP", con.List_Anno_Id_Tr_DGP(idtr1));
            getServletContext().setAttribute("LISTAR_ANNO", con.LIST_ANNO());
            String MAX_ID = con.ID_MAX_ANNO();
             getServletContext().setAttribute("Listar_Direccion", dir.Listar_Direccion());
            getServletContext().setAttribute("List_Jefe", l.List_Jefe());
            getServletContext().setAttribute("List_Situacion_Actual", l.List_Situacion_Actual());
            getServletContext().setAttribute("list_reg_labo", con.list_reg_labo());
            getServletContext().setAttribute("List_modalidad", con.List_modalidad());
            getServletContext().setAttribute("List_Puesto", puesto.List_Puesto());
            //getServletContext().setAttribute("List_Planilla", pl.List_Planilla(ID_DIRECCION, ID_DEPARTAMENTO, ID_SEC, ID_PUESTO, ID_AREA));
            getServletContext().setAttribute("List_ID_User", usu.List_ID_User(US_CREACION));
            getServletContext().setAttribute("list_Condicion_contrato", l.list_Condicion_contrato());
            getServletContext().setAttribute("List_grup_ocu", gr.List_grup_ocu());
            getServletContext().setAttribute("List_tipo_contrato", l.List_tipo_contrato());
            

            response.sendRedirect("Vista/Contrato/Reg_Casos_Especiales.jsp?idmax="+ MAX_ID+"&idtr="+ idtr1);
        }

        if (opc.equals("REG_CASOS_ESP")) {
            
            String ID_CONTRATO = "";
            String ID_DGP = "";
            String ID_ANNO = request.getParameter("AÑO_ID");
            String ID_DIRECCION = "";
            String ID_DEPARTAMENTO = "";
            String ID_AREA = request.getParameter("AREA_ID");
            String ID_PUESTO = request.getParameter("PUESTO_ID");
            String ID_SEC = sec.ID_SECCION(ID_PUESTO).trim();
            String ID_FUNC = "";
            String ID_TRABAJADOR = request.getParameter("IDDATOS_TRABAJADOR");
            String ID_TIPO_PLANILLA = request.getParameter("TIPO_PLANILLA");
            String ID_HORARIO = "HORARIO";
            String ID_REGIMEN_LABORAL = request.getParameter("REG_LAB_MINTRA");
            String ID_MODALIDAD = request.getParameter("MODALIDAD");
            String ID_SUB_MODALIDAD = request.getParameter("SUB_MODALIDAD").trim();

            String FE_DESDE = request.getParameter("FEC_DESDE");
            String FE_HASTA = request.getParameter("FEC_HASTA");
            String LI_CONDICION = request.getParameter("CONDICION");
            Double CA_SUELDO = Double.parseDouble(request.getParameter("SUELDO"));
            Double CA_REINTEGRO = Double.parseDouble(request.getParameter("REINTEGRO"));
            Double CA_BONO_ALIMENTO = Double.parseDouble(request.getParameter("BONO_ALIMENTO"));
            Double CA_BEV = Double.parseDouble(request.getParameter("BEV"));
            Double CA_SUELDO_TOTAL = Double.parseDouble(request.getParameter("TOTAL_SUELDO"));
            String TI_HORA_PAGO = request.getParameter("TIPO_HORA_PAGO");
            Double CA_ASIG_FAMILIAR = Double.parseDouble(request.getParameter("ASIG_FAMILIAR"));
            String ES_TI_CONTRATACION = request.getParameter("TI_CONTRATACION");
            String CO_GR_OCUPACION = request.getParameter("CO_GRUPO_OCU");
            String FE_SUSCRIPCION = request.getParameter("FECHA_SUSCRIPCION");
            String CO_TI_MONEDA = request.getParameter("TIPO_MONEDA");
            String CO_TI_REM_VARIAB = request.getParameter("REM_VARIABLE");
            String DE_REMU_ESPECIE = request.getParameter("REM_ESPECIE");
            Double HO_SEMANA = Double.parseDouble(request.getParameter("HORAS_SEMANA"));
            Double NU_HORAS_LAB = Double.parseDouble(request.getParameter("NRO_HORAS_LAB"));
            Double DIA_CONTRATO = Double.parseDouble(request.getParameter("DIAS"));
            String TI_TRABAJADOR = request.getParameter("TIPO_TRABAJADOR");
            String LI_REGIMEN_LABORAL = request.getParameter("REGIMEN_LABORAL");
            String ES_DISCAPACIDAD = request.getParameter("DISCAPACIDAD");
            String LI_REGIMEN_PENSIONARIO = request.getParameter("REGIMEN_PENSIONARIO");
            String TI_CONTRATO = request.getParameter("TIPO_CONTRATO");
            String LI_TIPO_CONVENIO = request.getParameter("TIPO_CONVENIO");
            String DE_OBSERVACION = request.getParameter("OBSERVACION");
            String ID_FILIAL = request.getParameter("FILIAL");
            String DE_RUC_EMP_TRAB = request.getParameter("EMP_RUC");
            String CO_SUCURSAL = request.getParameter("SUCURSAL");
            String DE_MYPE = request.getParameter("MYPE");
            String ES_ENTREGAR_DOC_REGLAMENTOS = request.getParameter("ENTREGAR_DOC_REGLAMENTOS");
            String ES_REGISTRO_HUELLA = request.getParameter("REGISTRO_HUELLA");
            String DE_REGISTRO_SISTEM_REMU = request.getParameter("REGISTRO_SISTEM_REMU");

            String FE_CESE = null;
            String ES_CONTRATO_TRABAJADOR = null;
            String US_CREACION = iduser;
            String FE_CREACION = request.getParameter("FECHA_CREACION");
            String US_MODIF = request.getParameter("USER_MODIF");
            String FE_MODIF = request.getParameter("FECHA_MODIF");
            String US_IP = request.getParameter("USUARIO_IP");
            String FE_VACACIO_INI = "";
            String FE_VACACIO_FIN = "";
            String ES_CONTRATO = null;
            String ES_FIRMO_CONTRATO = "1";
            Double NU_CONTRATO = 0.0;/*Double.parseDouble(request.getParameter("NU_CONTRATO"));*/

            String ES_APOYO = "";/*request.getParameter("ES_APOYO");*/

            String NU_DOCUMENTO = ""; /*request.getParameter("NU_DOCUMENTO");*/

            String ES_REMUNERACION_PROCESADO = null;

            //con.INSERT_CONTRATO(ID_CONTRATO, ID_DGP, FE_DESDE, FE_HASTA, FE_CESE, ID_FUNC, LI_CONDICION, CA_SUELDO, CA_REINTEGRO, CA_ASIG_FAMILIAR, HO_SEMANA, NU_HORAS_LAB, DIA_CONTRATO, TI_TRABAJADOR, LI_REGIMEN_LABORAL, ES_DISCAPACIDAD, TI_CONTRATO, LI_REGIMEN_PENSIONARIO, ES_CONTRATO_TRABAJADOR, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, US_IP, FE_VACACIO_INI, FE_VACACIO_FIN, ES_CONTRATO, ID_FILIAL, ID_PUESTO, CA_BONO_ALIMENTO, LI_TIPO_CONVENIO, ES_FIRMO_CONTRATO, NU_CONTRATO, DE_OBSERVACION, ES_APOYO, TI_HORA_PAGO, NU_DOCUMENTO, ID_ANNO, ES_ENTREGAR_DOC_REGLAMENTOS, ES_REGISTRO_HUELLA, DE_REGISTRO_SISTEM_REMU, ID_TRABAJADOR, CA_SUELDO_TOTAL, ID_REGIMEN_LABORAL, ID_MODALIDAD, ID_SUB_MODALIDAD, CO_GR_OCUPACION, FE_SUSCRIPCION, CO_TI_MONEDA, CO_TI_REM_VARIAB, DE_REMU_ESPECIE, DE_RUC_EMP_TRAB, CO_SUCURSAL, DE_MYPE, ES_TI_CONTRATACION, CA_BEV, ID_TIPO_PLANILLA, ES_REMUNERACION_PROCESADO, ID_HORARIO);

            //--------- CENTRO COSTOS --------------
            String IP_USUARIO = request.getParameter("USUARIO_IP");
            int cant_cc = Integer.parseInt(request.getParameter("CANT"));
            String idcto = con.MAX_ID_CONTRATO();
              for (int g = 1; g <= cant_cc; g++) {
                String ID_CENTRO_COSTO = request.getParameter("CENTRO_COSTOS_" + g);
                double porcentaje = Double.parseDouble(request.getParameter("PORCENTAJE_" + g));
                if (ID_CENTRO_COSTO != null && porcentaje != 0.0) {
               // dcc.INSERT_DETALLE_CENTRO_COSTO(null, ID_CENTRO_COSTO, null, porcentaje, IP_USUARIO,  iduser, FE_CREACION, US_MODIF, FE_MODIF,idcto,"1");
                }
            }
            //------------- HORARIO ------------
            /*List<String> dia = new ArrayList<String>();
            dia.add("lun");
            dia.add("mar");
            dia.add("mie");
            dia.add("jue");
            dia.add("vie");
            dia.add("sab");
            dia.add("dom");

            String ID_DETALLE_HORARIO = request.getParameter("ID_DETALLE_HORARIO");

            String ES_DETALLE_HORARIO = "1";
            String ES_HORARIO = "1";

           // IHor.Insert_Detalle_Horario(ID_DETALLE_HORARIO, null, ES_DETALLE_HORARIO, iduser, null, null, null);

            ID_DETALLE_HORARIO = IHor.Max_id_Detalle_Horario();

            for (int i = 0; i < dia.size(); i++) {
                for (int j = 0; j < 10; j++) {
                    String hora_desde = request.getParameter("HORA_DESDE_" + dia.get(i) + j);
                    String hora_hasta = request.getParameter("HORA_HASTA_" + dia.get(i) + j);
                    String d = request.getParameter("DIA_" + dia.get(i) + j);

                    if (hora_desde != null & d != null & hora_hasta != null) {
                        if (!hora_hasta.equals("") & !hora_desde.equals("") & !d.equals("")) {
                            IHor.Insert_Horario(null,
                                    hora_desde,
                                    hora_hasta,
                                    d,
                                    ES_HORARIO,
                                    ID_DETALLE_HORARIO);
                        }
                    }
                }

            }
*/
            /*Cambiar este for con un trigger al momento de insertar*/
            //for (int i = 0; i < con.List_Rh_Contrato_Idtr().size(); i++) {
            //    emp.VALIDAR_EMPLEADO(con.List_Rh_Contrato_Idtr().get(i));
           // }
            /*---*/
            // getServletContext().setAttribute("Lis_c_c_id_contr", cc.Lis_c_c_id_contr(id_contrato));
            getServletContext().setAttribute("List_Jefe", l.List_Jefe());
            getServletContext().setAttribute("List_Situacion_Actual", l.List_Situacion_Actual());
            getServletContext().setAttribute("List_Planilla", pl.List_Planilla(ID_DIRECCION, ID_DEPARTAMENTO, ID_SEC, ID_PUESTO, ID_AREA));
            getServletContext().setAttribute("List_ID_User", usu.List_ID_User(US_CREACION));
            getServletContext().setAttribute("list_Condicion_contrato", l.list_Condicion_contrato());
            getServletContext().setAttribute("List_tipo_contrato", l.List_tipo_contrato());
            //getServletContext().setAttribute("List_tipo_contrato", l.List_tipo_contrato());*/

           // response.sendRedirect("Vista/Contrato/Detalle_Info_Contractual.jsp?ida1=" + ida1);
            //response.sendRedirect("Vista/Contrato/Reg_Casos_Especiales.jsp" );
            out.print(ID_TRABAJADOR);
        }
 

        if (opc.equals("Buscar")) {
            getServletContext().setAttribute("List_Area", area.List_Area());
        }
        if (opc.equals("Ver_Plantilla")) {
            String idc = request.getParameter("idc");
            getServletContext().setAttribute("LIST_DAT_TR_PLANTILLA", tr.LIST_DAT_TR_PLANTILLA(idc));
            response.sendRedirect("Vista/Contrato/Plantilla/Editor_Plantilla.jsp");
        }
        if (opc.equals("Ver Plantilla")) {
            String idc = request.getParameter("idc");
            getServletContext().setAttribute("LIST_DAT_TR_PLANTILLA", tr.LIST_DAT_TR_PLANTILLA(idc));
            response.sendRedirect("Vista/Contrato/Plantilla/Editor_Plantilla.jsp");
        }
        if (opc.equals("filtrar")) {
            getServletContext().setAttribute("List_Area", area.List_Area());
            response.sendRedirect("Vista/Contrato/Busc_Contrato.jsp");
        }
        /*} catch (Exception e) {
         out.println(e.getMessage());
         } */

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
