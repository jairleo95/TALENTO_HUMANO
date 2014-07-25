/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.DGP;
import pe.edu.upeu.application.model.V_Es_Requerimiento;
import pe.edu.upeu.application.model.X_List_det_dgp;
import pe.edu.upeu.application.model.X_List_dgp_by;
import pe.edu.upeu.application.model.X_List_id_dgp;
import pe.edu.upeu.application.model.X_User_dgp;
import pe.edu.upeu.application.model.X_val_tra_dgp;
import pe.edu.upeu.application.model.x_List_Id_Trab_Dgp;


/**
 *
 * @author Jose
 */
public class DgpDAO implements InterfaceDgpDAO {

    ConexionBD conn;

    @Override
    public List<X_User_dgp> USER_DGP(String id_dgp) {
        this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql=" select u.*,du.NO_TRABAJADOR ,du.AP_PATERNO,du.AP_MATERNO, p.DE_PASOS as  paso from RHVD_USER_AUT u  ,RHTC_PASOS p ,RHVD_USUARIO du  where u.ID_EMPLEADO=du.ID_EMPLEADO and u.ID_PASOS= p.ID_PASOS  and u.ID_DGP='"+id_dgp+"'  and u.ID_PUESTO <>0";
        List<X_User_dgp> Lista=new ArrayList<X_User_dgp>();
        try {
            ResultSet rs=this.conn.query(sql);
            X_User_dgp x= new X_User_dgp();
            while(rs.next())
            {
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setId_usuario(rs.getString("id_usuario"));
                x.setId_rol(rs.getString("id_rol"));
                x.setId_empleado(rs.getString("id_empleado"));
                x.setNo_usuario(rs.getString("no_usuario"));
                x.setPw_usuario(rs.getString("pw_usuario"));
                x.setNo_puesto(rs.getString("no_puesto"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setNo_area(rs.getString("no_area"));
                x.setId_area(rs.getString("id_area"));
                x.setNo_dep(rs.getString("no_dep"));
                x.setId_departamento(rs.getString("id_departamento"));
                x.setId_direccion(rs.getString("id_direccion"));
                x.setId_seccion(rs.getString("id_seccion"));
                x.setNo_seccion(rs.getString("No_seccion"));
                x.setNu_pasos(rs.getString("nu_pasos"));
                x.setCo_pasos(rs.getString("co_pasos"));
                x.setDe_pasos(rs.getString("de_pasos"));
                x.setId_dgp(rs.getString("id_dgp"));
                x.setId_detalle_pasos(rs.getString("id_detalle_pasos"));
                x.setId_detalle_req_proceso(rs.getString("id_detalle_req_proceso"));
                x.setId_pasos(rs.getString("id_pasos"));
                x.setId_proceso(rs.getString("id_proceso"));
                x.setId_requerimiento(rs.getString("id_requerimiento"));
                x.setNo_proceso(rs.getString("no_proceso"));
                x.setNo_trabajador(rs.getString("no_trabajador"));
                x.setAp_paterno(rs.getString("ap_paterno"));
                x.setAp_materno(rs.getString("ap_materno"));
                x.setPaso(rs.getString("paso"));
                Lista.add(x);
            }
        } catch (SQLException e) {
        }finally{
                this.conn.close();
        }
        return Lista;
    }

    @Override
    public boolean INSERT_DETALLE_DGP(String IDDETALLE_DGP, String FEC_DESDE, String FEC_HASTA, String SUELDO, String DIAS_TRABAJO, String HORARIO, String IDPUESTO, String IDREQUERIMIENTO, String IDDATOS_TRABAJADOR, String RUC, String LUGAR_SERVICIO, String DESCRIPCION_SERVICIO, String PERIODO_PAGO, String DOMICILIO_FISCAL, String SUBVENCION, String HORARIO_CAPACITACION, String HORARIO_REFRIGERIO, String DIAS_CAPACITACION, String ESTADO, String USER_CREACION, String FECHA_CREACION, String USER_MODIF, String FECHA_MODIF, String USUARIO_IP, String BONO_ALIMENTARIO, String BEV, String CENTRO_COSTOS, String ANTECEDENTES_POLICIALES, String CERTIFICADO_SALUD, String MONTO_HONORARIO) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<x_List_Id_Trab_Dgp> LIST_ID_TRAB_DGP(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTM_DGP dgp, RHTR_REQUERIMIENTO r ,RHVD_PUESTO_DIRECCION pd where  pd.ID_PUESTO=dgp.ID_PUESTO and r.ID_REQUERIMIENTO= dgp.ID_REQUERIMIENTO and dgp.ID_TRABAJADOR='" + id + "'";
        List<x_List_Id_Trab_Dgp> Lista = new ArrayList<x_List_Id_Trab_Dgp>();
        try {
            ResultSet rs = this.conn.query(sql);
            x_List_Id_Trab_Dgp x = new x_List_Id_Trab_Dgp();
            while (rs.next()) {
                x.setId_dgp(rs.getString("id_dgp"));
                x.setFe_desde(rs.getString("fe_desde"));
                x.setFe_hasta(rs.getString("fe_hasta"));
                x.setCa_sueldo(rs.getDouble("ca_sueldo"));
                x.setDe_dias_trabajo(rs.getString("de_dias_trabajo"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setId_requerimiento(rs.getString("id_requerimiento"));
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setCo_ruc(rs.getString("co_ruc"));
                x.setDe_lugar_servicio(rs.getString("de_lugar_servicio"));
                x.setDe_servicio(rs.getString("de_servicio"));
                x.setDe_periodo_pago(rs.getString("de_periodo_pago"));
                x.setDe_domicilio_fiscal(rs.getString("de_domicilio_fiscal"));
                x.setDe_subvencion(rs.getString("de_subvencion"));
                x.setDe_horario_capacitacion(rs.getString("de_horario_capacitacion"));
                x.setDe_horario_refrigerio(rs.getString("de_horario_refrigerio"));
                x.setDe_dias_capacitacion(rs.getString("de_dias_capacitacion"));
                x.setEs_dgp(rs.getString("es_dgp"));
                x.setUs_creacion(rs.getString("us_creacion"));
                x.setFe_creacion(rs.getString("fe_creacion"));
                x.setUs_modif(rs.getString("us_modif"));
                x.setFe_modif(rs.getString("fe_modif"));
                x.setIp_usuario(rs.getString("ip_usuario"));
                x.setCa_bono_alimentario(rs.getDouble("ca_bono_alimentario"));
                x.setDe_bev(rs.getDouble("de_bev"));
                x.setCa_centro_costos(rs.getDouble("ca_centro_costos"));
                x.setDe_antecedentes_policiales(rs.getString("de_antecedentes_policiales"));
                x.setDe_certificado_salud(rs.getString("de_certificado_salud"));
                x.setDe_monto_honorario(rs.getString("de_monto_honorario"));
                x.setNo_req(rs.getString("no_req"));
                x.setId_tipo_planilla(rs.getString("id_tipo_planilla"));
                x.setNo_direccion(rs.getString("no_direccion"));
                x.setId_direccion(rs.getString("id_direccion"));
                x.setNo_dep(rs.getString("No_dep"));
                x.setId_departamento(rs.getString("id_departamento"));
                x.setNo_area(rs.getString("no_area"));
                x.setId_area(rs.getString("id_area"));
                x.setNo_seccion(rs.getString("No_seccion"));
                x.setId_seccion(rs.getString("id_seccion"));
                x.setNo_puesto(rs.getString("no_puesto"));
                Lista.add(x);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public List<X_List_det_dgp> LIST_DET_DGP(String id_dep) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select dgp.ID_DGP , dgp.ID_TRABAJADOR,tr.NO_TRABAJADOR,tr.AP_PATERNO,tr.AP_MATERNO, dgp.ID_PUESTO,dgp.FE_DESDE,dgp.FE_HASTA,dgp.CA_SUELDO , pd.NO_PUESTO, pd.NO_AREA, r.NO_REQ ,dgp.ES_DGP\n"
                + "from RHTR_REQUERIMIENTO r,RHTM_DGP dgp , \n"
                + "RHTM_TRABAJADOR tr,RHVD_PUESTO_DIRECCION  pd \n"
                + "where r.ID_REQUERIMIENTO = dgp.ID_REQUERIMIENTO and dgp.ES_DGP is not null and\n"
                + "dgp.ID_PUESTO=pd.ID_PUESTO and tr.ID_TRABAJADOR = dgp.ID_TRABAJADOR";
        sql += (id_dep != "") ? " and pd.ID_DEPARTAMENTO='" + id_dep + "'" : "";
        List<X_List_det_dgp> Lista = new ArrayList<X_List_det_dgp>();
        try {
            ResultSet rs = this.conn.query(sql);
            X_List_det_dgp x = new X_List_det_dgp();
            while (rs.next()) {
                x.setId_dgp(rs.getString("id_dgp"));
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setNo_trabajador(rs.getString("no_trabajador"));
                x.setAp_paterno(rs.getString("ap_paterno"));
                x.setAp_materno(rs.getString("ap_materno"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setFe_desde(rs.getString("fe_desde"));
                x.setFe_hasta(rs.getString("fe_hasta"));
                x.setCa_sueldo(rs.getDouble("ca_sueldo"));
                x.setNo_puesto(rs.getString("no_puesto"));
                x.setNo_reg(rs.getString("no_reg"));
                x.setEs_dgp(rs.getString("es_dgp"));
                Lista.add(x);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public List<X_List_dgp_by> LIST_DGP_BY(String id_user) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT a.ID_AUTORIZACION,dgp.ID_TRABAJADOR,a.ES_AUTORIZACION, tr.AP_PATERNO,tr.AP_MATERNO\n"
                + ",tr.NO_TRABAJADOR,dd.NO_PUESTO,dp.DE_PASOS,dp.NO_PROCESO,(to_char(a.FE_CREACION,'dd/mm/yy hh:mm:ss')) AS FECHA_CREACION\n"
                + "FROM RHTV_AUTORIZACION a,\n"
                + "  RHTM_DGP dgp ,\n"
                + "  RHVD_REQ_PASO_PU dp ,\n"
                + "  RHVD_PUESTO_DIRECCION dd,\n"
                + "  RHTM_TRABAJADOR tr\n"
                + "WHERE dgp.ID_DGP                 = a.ID_DGP\n"
                + "AND a.ID_DETALLE_REQ_PROCESO             =dp.ID_DETALLE_REQ_PROCESO\n"
                + "AND dp.ID_PUESTO = a.ID_PUESTO\n"
                + "AND dgp.ID_PUESTO                        = dd.ID_PUESTO\n"
                + "AND tr.ID_TRABAJADOR               = dgp.ID_TRABAJADOR\n"
                + "AND dp.ID_PASOS                          = a.ID_PASOS \n"
                + "AND trim(a.US_CREACION)               ='" + id_user + "'";
        List<X_List_dgp_by> Lista = new ArrayList<X_List_dgp_by>();
        try {
            ResultSet rs = this.conn.query(sql);
            X_List_dgp_by x = new X_List_dgp_by();
            while (rs.next()) {
                x.setId_autorizacion(rs.getString("id_autorizacion"));
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setEs_autorizacion(rs.getString("es_autorizacion"));
                x.setAp_paterno(rs.getString("ap_paterno"));
                x.setAp_materno(rs.getString("ap_materno"));
                x.setNo_trabajador(rs.getString("no_trabajador"));
                x.setNo_puesto(rs.getString("no_puesto"));
                x.setDe_pasos(rs.getString("de_pasos"));
                x.setNo_proceso(rs.getString("no_proceso"));
                x.setFecha_creacion(rs.getString("fecha_creacion"));
                Lista.add(x);
            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public void VAL_DGP_PASOS() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTM_DGP";
        try {
            ResultSet rs = this.conn.query(sql);
            List<DGP> Lista = new ArrayList<DGP>();
            DGP x = new DGP();
            while (rs.next()) {
                x.setId_dgp(rs.getString("id_dgp"));
                x.setFe_desde(rs.getString("fe_desde"));
                x.setFe_hasta(rs.getString("fe_hasta"));
                x.setCa_sueldo(rs.getDouble("ca_sueldo"));
                x.setDe_dias_trabajo(rs.getString("de_dias_trabajo"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setId_requerimiento(rs.getString("id_requerimiento"));
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setCo_ruc(rs.getString("co_ruc"));
                x.setDe_lugar_servicio(rs.getString("de_lugar_servicio"));
                x.setDe_servicio(rs.getString("de_servicio"));
                x.setDe_periodo_pago(rs.getString("de_periodo_pago"));
                x.setDe_domicilio_fiscal(rs.getString("de_domicilio_fiscal"));
                x.setDe_subvencion(rs.getString("de_subvencion"));
                x.setDe_horario_capacitacion(rs.getString("de_horario_capacitacion"));
                x.setDe_horario_refrigerio(rs.getString("de_horario_refrigerio"));
                x.setDe_dias_capacitacion(rs.getString("de_dias_capacitacion"));
                x.setEs_dgp(rs.getString("es_dgp"));
                x.setUs_creacion(rs.getString("us_creacion"));
                x.setFe_creacion(rs.getString("fe_creacion"));
                x.setUs_modif(rs.getString("us_modif"));
                x.setFe_modif(rs.getString("fe_modif"));
                x.setIp_usuario(rs.getString("ip_usuario"));
                x.setCa_bono_alimentario(rs.getDouble("ca_bono_alimentario"));
                x.setDe_bev(rs.getDouble("de_bev"));
                x.setCa_centro_costos(rs.getDouble("ca_centro_costos"));
                x.setDe_antecedentes_policiales(rs.getString("de_antecedentes_policiales"));
                x.setDe_certificado_salud(rs.getString("de_certificado_salud"));
                x.setDe_monto_honorario(rs.getString("de_monto_honorario"));
                Lista.add(x);
            }
            for (int i = 0; i < Lista.size(); i++) {
                String sql2 = "BEGIN SP_VAL_DGP(:id_dgp ); END;";
                this.conn.ejecutar(sql2);

            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<V_Es_Requerimiento> LIST_DGP(String id_dep) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);

        String sql = "select * from RHVD_ES_REQUERIMIENTO";
        sql += (id_dep != "") ? "where departamento_id='" + id_dep + "'" : "";
        sql += "order by ID_DGP";
        List<V_Es_Requerimiento> Lista = new ArrayList<V_Es_Requerimiento>();
        try {
            ResultSet rs = this.conn.query(sql);
            V_Es_Requerimiento v = new V_Es_Requerimiento();
            while (rs.next()) {
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setId_departamento(rs.getString("id_departamento"));
                Lista.add(v);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public List<X_val_tra_dgp> VAL_TRA_DGP(String id_tr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*) as TOTAL,ID_DGP from RHTM_DGP where ID_TRABAJADOR='" + id_tr + "' and ES_DGP=0 group by ID_DGP";
        List<X_val_tra_dgp> Lista = new ArrayList<X_val_tra_dgp>();
        try {
            ResultSet rs = this.conn.query(sql);
            X_val_tra_dgp X = new X_val_tra_dgp();
            while (rs.next()) {
                X.setTotal(rs.getString("total"));
                X.setId_dgp(rs.getString("id_dgp"));
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
            return Lista;
        }
    }

    @Override
    public int VAL_OPC_DGP(String idtr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(ID_DGP) from RHTM_DGP   where ES_DGP='0' and ID_TRABAJADOR='" + idtr + "';";
        int TOTAL=0 ;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                TOTAL =Integer.parseInt(rs.getString(1));
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return TOTAL;
    }

    @Override
    public List<X_List_id_dgp> LIST_ID_DGP(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select  d.ID_DGP,to_char(d.fe_desde,'yyyy-mm-dd') as fe_desde,to_char(d.fe_hasta,'yyyy-mm-dd') as fe_hasta ,d.CA_sueldo, d.DE_DIAS_TRABAJO,null, d.ID_PUESTO, d.ID_REQUERIMIENTO, d.ID_TRABAJADOR, d.CO_RUC, d.DE_LUGAR_SERVICIO,\n"
                + "d.DE_SERVICIO, d.DE_PERIODO_PAGO, d.DE_DOMICILIO_FISCAL, d.DE_SUBVENCION,d.DE_HORARIO_CAPACITACION,d.DE_HORARIO_REFRIGERIO,\n"
                + "d.DE_DIAS_CAPACITACION,d.ES_DGP,d.US_CREACION,d.FE_CREACION,d.US_MODIF,d.FE_MODIF,d.IP_USUARIO,r.NO_REQ,d.CA_BONO_ALIMENTARIO,d.DE_BEV,d.CA_CENTRO_COSTOS,d.DE_ANTECEDENTES_POLICIALES,d.DE_CERTIFICADO_SALUD\n"
                + "from RHTM_DGP  d , RHTR_REQUERIMIENTO r  where r.ID_REQUERIMIENTO = d.ID_REQUERIMIENTO and d.ID_DGP='"+id+"'";
        List<X_List_id_dgp> Lista=new ArrayList<X_List_id_dgp>();
        try {
            ResultSet rs=this.conn.query(sql);
            X_List_id_dgp x=new X_List_id_dgp();
            while(rs.next()){
                x.setId_dgp(rs.getString("id_dgp"));
                x.setFe_desde(rs.getString("fe_desde"));
                x.setFe_hasta(rs.getString("fe_hasta"));
                x.setCa_sueldo(rs.getDouble("ca_sueldo"));
                x.setDe_dias_trabajo(rs.getString("de_dias_trabajo"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setId_requerimiento(rs.getString("id_requerimiento"));
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setCo_ruc(rs.getString("co_ruc"));
                x.setDe_lugar_servicio(rs.getString("De_lugar_servicio"));
                x.setDe_servicio(rs.getString("De_servicio"));
                x.setDe_periodo_pago(rs.getString("De_periodo_pago"));
                x.setDe_domicilio_fiscal(rs.getString("De_domicilio_fiscal"));
                x.setDe_subvencion(rs.getString("De_subvencion"));
                x.setDe_horario_capacitacion(rs.getString("de_horario_capacitacion"));
                x.setDe_horario_refrigerio(rs.getString("de_horario_refrigerio"));
                x.setDe_dias_capacitacion(rs.getString("de_dias_capacitacion"));
                x.setEs_dgp(rs.getString("es_dgp"));
                x.setUs_creacion(rs.getString("Us_creacion"));
                x.setFe_creacion(rs.getString("fe_creacion"));
                x.setUs_modif(rs.getString("us_modif"));
                x.setFe_modif(rs.getString("fe_modif"));
                x.setIp_usuario(rs.getString("ip_usuario"));
                x.setNo_req(rs.getString("no_req"));
                x.setCa_bono_alimentario(rs.getDouble("ca_bono_alimentario"));
                x.setDe_bev(rs.getDouble("de_bev"));
                x.setCa_centro_costos(rs.getDouble("ca_centro_costos"));
                x.setDe_antecedentes_policiales(rs.getString("de_antecedentes_policiales"));
                x.setDe_certificado_salud(rs.getString("de_certificado_salud"));
                Lista.add(x);
            }
        } catch (SQLException e) {
        }finally{
                this.conn.close();
        }
        return Lista;
    }

    @Override
    public String MAX_ID_DETALLE_DGP() {
        this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql="SELECT 'DGP-' ||MAX (SUBSTR(ID_DGP,5,8)) FROM RHTM_DGP";
        String Maxdgp=null;
        try {
             ResultSet rs = this.conn.query(sql);
             while (rs.next()) {
                Maxdgp=rs.getString(1);
             }
        } catch (SQLException e) {
        }finally{
         this.conn.close();
         }
        return Maxdgp;
    }

    @Override
    public int VALIDAR_DGP_CONTR(String id_dgp, String id_tr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*) from rh_contrato  where iddetalle_dgp ='"+id_dgp+"' and  firmo_contrato is null and iddatos_trabajador='"+id_tr+"'";
        int val=0 ;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                val =Integer.parseInt(rs.getString(1));
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return val;
    }

    @Override
    public void REG_DGP_FINAL(String IDDGP) {
        String sql="UPDATE RHTM_DGP SET ES_DGP='0' WHERE ID_DGP='"+IDDGP+ "'";
        this.conn.ejecutar(sql);
    }
}
