/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Datos_Hijo_Trabajador;
import pe.edu.upeu.application.model.Documentos;

/**
 *
 * @author Admin
 */
public class DocumentoDAO implements InterfaceDocumentoDAO{
ConexionBD conn;
    
    @Override
    public List<Documentos> List_Id_Doc_Trab(String id_trabajador) {
        this.conn= FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql="select * from RHTV_DOCUMENTO_ADJUNTO da, RHTR_DOCUMENTOS d ,RHTM_DGP dgp, RHTR_REQUERIMIENTO r  where da.id_documentos = d.id_documentos  and r.id_requerimiento = dgp.id_requerimiento  and dgp.id_dgp = da.id_dgp and dgp.id_trabajador='TRB-000209' and da.ES_DOCUMENTO_ADJUNTO=1";
        List<Documentos> list = new ArrayList<Documentos>();
        try {
            ResultSet rs = this.conn.query(sql);
            Documentos d = new Documentos();
            while (rs.next()) { 
                //falta agregar setter y getter
                list.add(d);
            }
        } catch (Exception e) {
        }finally{
        this.conn.close();
        }
                
        return list;
    }

    @Override
    public List<Documentos> List_Documentos() {
      this.conn= FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
      String sql= "Select * from RHTR_DOCUMENTOS";
      List<Documentos> list = new ArrayList<Documentos>();
        try {
            ResultSet rs = this.conn.query(sql);
            Documentos d = new Documentos();
            while (rs.next()) {
                d.setEs_documento(rs.getString("es_documento"));
                d.setId_documentos(rs.getString("id_documentos"));
                d.setId_tipo_planilla(rs.getString("id_tipo_planilla"));
                d.setNo_documento(rs.getString("es_no_documento"));
                d.setTi_documento(rs.getString("ti_documento"));
                list.add(d);
            }
        } catch (Exception e) {
        }finally{
        this.conn.close();
        }
        return list;
    }

    @Override
    public List<Datos_Hijo_Trabajador> List_Hijos(String id_trabajador) {
        this.conn= FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTD_DATOS_HIJO_TRABAJADOR where id_trabajador='"+id_trabajador+"' and (sysdate-fe_nacimiento)/360<18";
        List<Datos_Hijo_Trabajador> list = new ArrayList<Datos_Hijo_Trabajador>();
        try {
            ResultSet rs = this.conn.query(sql);
            Datos_Hijo_Trabajador dht = new Datos_Hijo_Trabajador();
            while (rs.next()) {                
                dht.setAp_materno(rs.getString("ap_materno"));
                dht.setAp_paterno(rs.getString("ap_paterno"));
                dht.setEs_datos_hijo_trabajador(rs.getString("es_datos_hijo_trabajador"));
                dht.setEs_estudio_niv_superior(rs.getString("es_estudio_niv_superior"));
                dht.setEs_inscripcion_vig_essalud(rs.getString("es_inscripcion_vig_essalud"));
                dht.setEs_presenta_documento(rs.getString("es_presenta_documento"));
                dht.setEs_sexo(rs.getString("es_sexo"));
                dht.setEs_tipo_doc(rs.getString("es_tipo_doc"));
                dht.setFe_creacion(rs.getString("fe_creacion"));
                dht.setFe_modif(rs.getString("fe_modif"));
                dht.setFe_nacimiento(rs.getString("fe_nacimiento"));
                dht.setId_datos_hijos_trabajador(rs.getString("id_datos_hijos_trabajador"));
                dht.setId_trabajador(rs.getString("id_trabajador"));
                dht.setIp_usuario(rs.getString("ip_usuario"));
                dht.setNo_hijo_trabajador(rs.getString("no_hijo_trabajador"));
                dht.setNu_doc(rs.getString("nu_doc"));
                dht.setUs_creacion(rs.getString("us_creacion"));
                dht.setUs_modif(rs.getString("us_modif"));
            }
        } catch (Exception e) {
        }
        
        return null;
        
    }

    
    
}
