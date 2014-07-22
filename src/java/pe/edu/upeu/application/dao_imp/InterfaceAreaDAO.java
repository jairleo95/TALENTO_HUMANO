/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Area;

/**
 *
 * @author Admin
 */
public interface InterfaceAreaDAO {
      public List<Area> List_Area();
      public List<Area> List_Area_ID(String id_departamento);
}
