/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller.notify;

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
@ServerEndpoint("/serverGth")
public class ServerNotification {

    static Set<Session> chatRoomUser = Collections.synchronizedSet(new HashSet<Session>());

    @OnOpen
    public void handleOpened(Session userSession) {
        System.out.println("User: " + userSession.toString());
        chatRoomUser.add(userSession);
    }

    @OnMessage
    public void handleMessage(String message, Session userSession) throws IOException {
        //String userName = (String) userSession.getUserProperties().get("username");
        String userName = userSession.toString();
        //System.out.println("User sending message" + userSession.toString());
        Iterator<Session> iterator = chatRoomUser.iterator();
        int i = 0;

        while (iterator.hasNext()) {
            Session s = iterator.next();
            if (!s.toString().equals(userSession.toString())) {
                 s.getBasicRemote().sendText(buildJsonData(userName, message));
                 System.out.println("Sending Message from "+ userName);
            }
            i++;
            System.out.println("(" + i + ") iteraciones ");
            System.out.println("(" + i + ") " + s.toString());
            System.out.println("(" + i + ") usuario en room" + chatRoomUser.toString());

        }
    }

    private String buildJsonData(String username, String message) {
        Map<String, Object> rpta = new HashMap<String, Object>();
        rpta.put("message", message);
        rpta.put("username", username);
        Gson gson = new Gson();
        return gson.toJson(rpta);
    }

    @OnClose
    public void handleClose(Session id) {
        chatRoomUser.remove(id);
    }
}
