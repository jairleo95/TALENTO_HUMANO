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
import static oracle.security.o3logon.b.a;
import pe.edu.upeu.application.dao_imp.InterfacePlantillaDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.X_List_Plantilla;

/**
 *
 * @author Admin
 */
public class PlantillaDAO implements InterfacePlantillaDAO {

    ConexionBD conn;

    @Override
    public List<X_List_Plantilla> List_Planilla(String id_direc, String id_depart, String id_seccion, String id_puesto, String id_area) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select RHFU_BUSCAR_PLANTILLA(" + id_puesto + " ,," + id_seccion + " ," + id_area + " , ," + id_depart + ",," + id_direc + ") from dual";
        String id = "";
        List<X_List_Plantilla> list = new ArrayList<X_List_Plantilla>();
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            id = rs.getString("1");

            String sql1 = "select * from RHTC_PLANTILLA_PUESTO pp , RHTC_PLANTILLA_CONTRACTUAL pc \n"
                    + "where pp.ID_PLANTILLA_CONTRACTUAL = pc.ID_PLANTILLA_CONTRACTUAL and pp.es_plantilla_puesto = 1 and pc.ID_PLANTILLA_CONTRACTUAL='" + id + "'";

            ResultSet rs1 = this.conn.query(sql1);
            X_List_Plantilla lp = new X_List_Plantilla();

            while (rs1.next()) {
                lp.setId_plantilla_puesto(rs.getString("id_plantilla_puesto"));
                lp.setId_direccion(rs.getString("id_direccion"));
                lp.setId_departamento(rs.getString("id_departamento"));
                lp.setId_area(rs.getString("id_area"));
                lp.setId_seccion(rs.getString("id_seccion"));
                lp.setId_puesto(rs.getString("id_puesto"));
                lp.setEs_plantilla_puesto(rs.getString("es_plantilla_puesto"));
                lp.setUs_creacion(rs.getString("us_creacion"));
                lp.setFe_creacion(rs.getString("fe_creacion"));
                lp.setUs_modificacion(rs.getString("us_modificacion"));
                lp.setFe_modificacion(rs.getString("fe_modificacion"));
                lp.setId_plantilla_contractual(rs.getString("id_plantilla_contractual"));
                lp.setNo_plantilla(rs.getString("no_plantilla"));
                lp.setDi_url(rs.getString("di_url"));
                lp.setUs_creacion(rs.getString("us_creacion"));
                lp.setFe_creacion(rs.getString("fe_creacion"));
                lp.setUs_modificacion(rs.getString("us_modificacion"));
                lp.setFe_modificacion(rs.getString("fe_modificacion"));
                list.add(lp);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }
}
