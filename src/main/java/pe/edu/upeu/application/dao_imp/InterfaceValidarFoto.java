/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;

/**
 *
 * @author USUARIO
 */
public interface InterfaceValidarFoto {
    public List<Map<String, ?>> ListFotos(String tipo);
    public void validar (String idtr,String estado);
}
