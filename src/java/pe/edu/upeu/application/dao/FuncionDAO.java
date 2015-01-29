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
import pe.edu.upeu.application.dao_imp.InterfaceFuncionDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Funciones;

/**
 *
 * @author joserodrigo
 */
public class FuncionDAO implements InterfaceFuncionDAO{
    ConexionBD cnn;
    
    @Override
    public List<Funciones> Listar_funciones() {
         this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT f.ID_FUNCION,f.DE_FUNCION,f.ES_FUNCION,f.US_CREACION,f.FE_CREACION,f.US_MODIF,f.FE_MODIF,f.ID_PUESTO,p.NO_PUESTO FROM RHTD_FUNCION f, RHTR_PUESTO p where f.ID_PUESTO=p.ID_PUESTO ";
        List<Funciones> Lista = new ArrayList<Funciones>();
        try {
            ResultSet rs = this.cnn.query(sql);

            while (rs.next()) {
                Funciones x = new Funciones();
                x.setId_fucion(rs.getString("ID_FUNCION"));
                x.setDe_funcion(rs.getString("DE_FUNCION"));
                x.setEs_funcion(rs.getString("ES_FUNCION"));
                x.setUs_creacion(rs.getString("US_CREACION"));
                x.setFe_creacion(rs.getString("FE_CREACION"));
                x.setUs_modif(rs.getString("US_MODIF"));
                x.setFe_modif(rs.getString("FE_MODIF"));
                x.setId_puesto(rs.getString("ID_PUESTO"));
                x.setNo_puesto(rs.getString("NO_PUESTO"));
                Lista.add(x);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            this.cnn.close();
        }
        return Lista;
    }    
}
