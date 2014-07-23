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
import pe.edu.upeu.application.model.X_List_det_dgp;
import pe.edu.upeu.application.model.X_User_dgp;
import pe.edu.upeu.application.model.x_List_Id_Trab_Dgp;
import sun.security.rsa.RSACore;



/**
 *
 * @author Jose
 */
public class DgpDAO implements InterfaceDgpDAO{

    ConexionBD conn;
    @Override
    public List<X_User_dgp> USER_DGP(String id_dgp) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean INSERT_DETALLE_DGP(String IDDETALLE_DGP, String FEC_DESDE, String FEC_HASTA, String SUELDO, String DIAS_TRABAJO, String HORARIO, String IDPUESTO, String IDREQUERIMIENTO, String IDDATOS_TRABAJADOR, String RUC, String LUGAR_SERVICIO, String DESCRIPCION_SERVICIO, String PERIODO_PAGO, String DOMICILIO_FISCAL, String SUBVENCION, String HORARIO_CAPACITACION, String HORARIO_REFRIGERIO, String DIAS_CAPACITACION, String ESTADO, String USER_CREACION, String FECHA_CREACION, String USER_MODIF, String FECHA_MODIF, String USUARIO_IP, String BONO_ALIMENTARIO, String BEV, String CENTRO_COSTOS, String ANTECEDENTES_POLICIALES, String CERTIFICADO_SALUD, String MONTO_HONORARIO) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<x_List_Id_Trab_Dgp> LIST_ID_TRAB_DGP(String id) {
        this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql="select * from RHTM_DGP dgp, RHTR_REQUERIMIENTO r ,RHVD_PUESTO_DIRECCION pd where  pd.ID_PUESTO=dgp.ID_PUESTO and r.ID_REQUERIMIENTO= dgp.ID_REQUERIMIENTO and dgp.ID_TRABAJADOR='"+id+"'";
        List<x_List_Id_Trab_Dgp> Lista=new ArrayList<x_List_Id_Trab_Dgp>();
        try {
            ResultSet rs=this.conn.query(sql);
            x_List_Id_Trab_Dgp x=new x_List_Id_Trab_Dgp();
            while(rs.next())
            {
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
        }finally{
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public List<X_List_det_dgp> LIST_DET_DGP(String id_dep) {
        this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql="select dgp.ID_DGP , dgp.ID_TRABAJADOR,tr.NO_TRABAJADOR,tr.AP_PATERNO,tr.AP_MATERNO, dgp.ID_PUESTO,dgp.FE_DESDE,dgp.FE_HASTA,dgp.CA_SUELDO , pd.NO_PUESTO, pd.NO_AREA, r.NO_REQ ,dgp.ES_DGP\n" +
"from RHTR_REQUERIMIENTO r,RHTM_DGP dgp , \n" +
"RHTM_TRABAJADOR tr,RHVD_PUESTO_DIRECCION  pd \n" +
"where r.ID_REQUERIMIENTO = dgp.ID_REQUERIMIENTO and dgp.ES_DGP is not null and\n" +
"dgp.ID_PUESTO=pd.ID_PUESTO and tr.ID_TRABAJADOR = dgp.ID_TRABAJADOR";
        sql+=(id_dep!=null)?" and pd.ID_DEPARTAMENTO='"+id_dep+"'":"";
        List<X_List_det_dgp> Lista = new ArrayList<X_List_det_dgp>();
        try {
            ResultSet rs=this.conn.query(sql);
            X_List_det_dgp x=new X_List_det_dgp();
            while(rs.next())
            {
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
        }finally{
                this.conn.close();
        }
        return Lista;
     }
}
