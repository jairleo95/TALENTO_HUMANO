/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Notification;

/**
 *
 * @author Cesar
 */
public interface InterfaceNotificationDAO {
    public void Registrar(Notification x);
    public List<Map<String, ?>> List_Notifications_json(String id);
    public List<Notification> List_Notifications();
    public void visualizado(String id);
    public void leido(String id);
    public int CountUnreadAuthorized(String id);
    public int CountUnreadUnAuthorized(String id);
    public List<String> PrevSteps(String id);
}
