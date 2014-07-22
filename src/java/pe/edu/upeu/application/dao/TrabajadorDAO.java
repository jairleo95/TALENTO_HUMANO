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
import oracle.sql.NUMBER;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Contrato;
import pe.edu.upeu.application.model.Rol;
import pe.edu.upeu.application.model.Trabajador;
import pe.edu.upeu.application.model.V_Ficha_Trab_Num_C;

/**
 *
 * @author Jose
 */
public class TrabajadorDAO implements InterfaceTrabajadorDAO{
    ConexionBD conn;
    @Override
    public String Calculaedad(String fecha_nac) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean INSERT_DATOS_TRABAJADOR(String IDDATOS_TRABAJADOR, String APELLIDO_P, String APELLIDO_M, String NOMBRES, String TIPO_DOC, String NU_DOC, String ESTADO_CIVIL, String FECHA_NAC, String ID_NACIONALIDAD, String ID_DEPARTAMENTO, String ID_PROVINCIA, String ID_DISTRITO, String TELEFONO_TRAB, String CELULAR, String CORREO_PERSONAL, String CORREO_INST, String SISTEMA_PENSIONARIO, String NIVEL_EDUCATIVO, String GRADO_ACADEMICO, String TITULO_PROFESIONA, String ID_CARRERA, String ID_CENTRO_DE_ESTUDIO, String OTROS_ESTUDIOS, String SEXO, String GRUPO_SANGUINEO, String REFERENCIA, String RELIGION, String IGLESIA, String CARGO, String AUTORIDAD, String AUT_APELLIDOSNOMBRES, int AUT_CELULAR, String NOMBRE_AFP_ID, String AFILIADO_ESSALUD_ID, String TIPO_TRABAJADOR_ID, String TIPO_HORA_PAGO_REFEERENCIAL, String FACTOR_RH_ID, String DIR_DOM_A_D1_ID, String DIR_DOM_A_D2, String DIR_DOM_A_D3_ID, String DIR_DOM_A_D4, String DIR_DOM_A_D5_ID, String DIR_DOM_A_D6, String DIR_DOM_A_REF, String DIR_DOM_A_DISTRITO_ID, String DIR_DOM_LEG_D1_ID, String DIR_DOM_LEG_D2, String DIR_DOM_LEG_D3_ID, String DIR_DOM_LEG_D4, String DIR_DOM_LEG_D5_ID, String DIR_DOM_LEG_D6, String ID_DIR_DOM_LEG_DISTRITO, String ING_QTA_CAT_EMPRESA, String ING_QTA_CAT_RUC, String ING_QTA_CAT_OTRAS_EMPRESAS, String OBSERVACIONES, String USER_CREACION, String FECHA_CREACION, String USER_MODIF, String FECHA_MODIF, String USUARIO_IP) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean EliminarTrabajador(String id, String idc) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<V_Ficha_Trab_Num_C> ListarTrabajador(String iddep, String dni, String nom, String ape_p, String ape_m) {
         if (dni != null || nom != "") {
            
        }
         this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
         String sql="select d.* , u.departametno_id from ficha_trab_num_c ) d, det_usuario u where \n" +
"u.idusuario= d.user_creacion ";
         nom=nom.toUpperCase();
         ape_p=ape_p.toUpperCase();
         ape_m=ape_m.toUpperCase();
         sql+=(Integer.parseInt(dni)<=0)?"and d.NRO_DOC='"+dni+"'":"";
         sql+=(nom!="")?"and upper(d.nombres)like '%"+nom+"%'":"";
         sql+=(ape_p!="")?"and upper(d.apellido_p)like '%"+ape_p+"%'":"";
         sql+=(ape_m!="")?"and upper(d.apellido_m)like '%"+ape_m+"%'":"";
         sql+="order by d.iddatos_trabajador desc";
         
         List<V_Ficha_Trab_Num_C> list = new ArrayList<V_Ficha_Trab_Num_C>();
          try {
             ResultSet rs = this.conn.query(sql);
             V_Ficha_Trab_Num_C v=new V_Ficha_Trab_Num_C();
             while (rs.next()) {
                 v.setId_trabajador(rs.getString("ID_TRABAJADOR"));
                 v.setAp_paterno(rs.getString("AP_PARTERNO"));
                 v.setAp_paterno(rs.getString("AP_MATERNO"));
                 v.setNo_trabajador(rs.getString("No_trabajador"));
                 v.setTi_doc(rs.getString("TI_DOC"));
                 v.setNu_doc(rs.getString("NU_DOC"));
                 v.setEs_civil(rs.getString("ES_CIVIL"));
                 v.setFe_nac(rs.getString("FE_NAC"));
                 v.setId_nacionalidad(rs.getString("ID_NACIONALIDAD"));
                 v.setId_departamento(rs.getString("ID_DEPARTAMENTO"));
                 v.setId_provincia(rs.getString("ID_PROVINCIA"));
                 v.setId_distrito(rs.getString("ID_DISTRITO"));
                 v.setAp_paterno(rs.getString(13));
                 v.setAp_paterno(rs.getString(14));
                 v.setAp_paterno(rs.getString(15));
                 v.setAp_paterno(rs.getString(16));
                 v.setAp_paterno(rs.getString(17));
                 v.setAp_paterno(rs.getString(18));
                 v.setAp_paterno(rs.getString(19));
                 v.setAp_paterno(rs.getString(20));
                 v.setAp_paterno(rs.getString(21));
                 v.setAp_paterno(rs.getString(22));
                 v.setAp_paterno(rs.getString(23));
                 v.setAp_paterno(rs.getString(24));
                 v.setAp_paterno(rs.getString(25));
                 v.setAp_paterno(rs.getString(26));
                 v.setAp_paterno(rs.getString(27));
                 v.setAp_paterno(rs.getString(28));
                 v.setAp_paterno(rs.getString(29));
                 v.setAp_paterno(rs.getString(30));
                 v.setAp_paterno(rs.getString(31));
                 v.setAp_paterno(rs.getString(32));
                 v.setAp_paterno(rs.getString(33));
                 v.setAp_paterno(rs.getString(34));
                 v.setAp_paterno(rs.getString(35));
                 v.setAp_paterno(rs.getString(36));
                 v.setAp_paterno(rs.getString(37));
                 v.setAp_paterno(rs.getString(38));
                 v.setAp_paterno(rs.getString(39));
                 v.setAp_paterno(rs.getString(40));
                 v.setAp_paterno(rs.getString(41));
                 v.setAp_paterno(rs.getString(42));
                 v.setAp_paterno(rs.getString(43));
                 v.setAp_paterno(rs.getString(44));
                 v.setAp_paterno(rs.getString(45));
                 v.setAp_paterno(rs.getString(46));
                 v.setAp_paterno(rs.getString(47));
                 v.setAp_paterno(rs.getString(48));
                 v.setAp_paterno(rs.getString(49));
                 v.setAp_paterno(rs.getString(50));
                 v.setAp_paterno(rs.getString(51));
                 v.setAp_paterno(rs.getString(52));
                 v.setAp_paterno(rs.getString(53));
                 v.setAp_paterno(rs.getString(54));
                 v.setAp_paterno(rs.getString(55));
                 v.setAp_paterno(rs.getString(56));
                 v.setAp_paterno(rs.getString(57));
                 v.setAp_paterno(rs.getString(58));
                 v.setAp_paterno(rs.getString(59));
                 v.setAp_paterno(rs.getString(60));
                 v.setAp_paterno(rs.getString(61));
                 v.setAp_paterno(rs.getString(62));
                 v.setAp_paterno(rs.getString(63));
                 v.setAp_paterno(rs.getString(64));
            list.add(v);
             }
             
        } catch (SQLException e) {
        }finally{
         this.conn.close();
         }
         
         return list;   
    }

    @Override
    public List<Trabajador> ListaridTrabajador(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Contrato> LIST_DAT_TR_PLANTILLA(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String MAX_ID_DATOS_TRABAJADOR() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
