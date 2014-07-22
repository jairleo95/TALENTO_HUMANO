/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceAnnoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Anno;
import pe.edu.upeu.application.model.Contrato;




/**
 *
 * @author Admin
 */
public class AnnoDAO implements InterfaceAnnoDAO{
    ConexionBD conn; 
    
    @Override
    public List<Anno> List_Anno() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql= "select * from rhtr_anno order by id_anno desc";
        List<Anno> list = new ArrayList<Anno>();
        try {
            ResultSet rs = this.conn.query(sql);
            Anno a = new Anno();
            while (rs.next()){
                a.setId_anno(rs.getString(1));
                a.setNo_anno(rs.getString(2));
                a.setDe_anno(rs.getString(3));
                a.setFe_desde(rs.getString(4));
                a.setFe_hasta(rs.getString(5));
                a.setDe_observacion(rs.getString(6));
               list.add(a);
            }
        } catch (Exception e) {
        }finally{
        this.conn.close();
        }
        return list;
    }

    @Override
    public List<Contrato> List_Anno_Max_Cont(String id_Trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select d.id_anno from (select a.id_anno,rhc.id_contrato,rhc.id_dgp ,rhc.id_trabajador from rhtm_contrato rhc ,  rhtr_año a where  rhc.id_anno=a.id_anno and a.no_anno =( select max(no_anno) from año)) d left outer join detalle_dgp dgp on (d.id_dgp = dgp.id_dgp) where d.i_trabajador='"+id_Trabajador+"'";
        return  null;
         /*$sql = "select d.año_id from (
        select a.año_id,rhc.idcontrato,rhc.iddetalle_dgp ,rhc.iddatos_trabajador 
        from rh_contrato rhc , año a where  rhc.año_id=a.año_id and a.nombre =
        ( select max(nombre) from año)) d left outer join detalle_dgp dgp 
        on (d.iddetalle_dgp = dgp.iddetalle_dgp) where d.iddatos_trabajador='$idtr'"; 
        //echo $sql;
        $consult = oci_parse(Conexion::conex(),$sql);   
        oci_execute($consult);
        $r = oci_fetch_array($consult); 
        $id=$r[0];
        return $id;*/
    }

    @Override
    public List<Contrato> List_A_Cont(String id_dgp) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    
}
