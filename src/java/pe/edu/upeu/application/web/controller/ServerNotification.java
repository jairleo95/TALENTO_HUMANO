/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Jairleo95
 */
@ServerEndpoint("/server")
public class ServerNotification {

    static Set<Session> chatRoomUser = Collections.synchronizedSet(new HashSet<Session>());

    @OnOpen
    public void handleOpened(Session userSession) {
        chatRoomUser.add(userSession);
    }

    @OnMessage
    public void handleMessage(String message, Session session) throws IOException {
        /* String userName = (String) userSession.getUserProperties().get("username");
         if (userName == null) {
         userSession.getUserProperties().put("username", message);
         userSession.getBasicRemote().sendText(buildJsonData("system", "estas conectado a :" + message));
         } else {
         Iterator<Session> iterator = chatRoomUser.iterator();
         while (iterator.hasNext()) {
         iterator.next().getBasicRemote().sendText(buildJsonData(userName, message));
         }
         }*/
        session.getBasicRemote().sendText(buildJsonData(session.getId(), message));
    }

    private String buildJsonData(String username, String message) {
        Map<String, Object> rpta = new HashMap<String, Object>();
        //rpta.put("message", username + ": " + message);
        rpta.put("message", "sdlñjsdfgñfg");
        Gson gson = new Gson();
        return gson.toJson(rpta);
    }
    @OnClose
    public void handleClose(Session id) {
        chatRoomUser.remove(id);
    }
}
