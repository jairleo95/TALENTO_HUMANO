/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.util.Mail;

/**
 *
 * @author ALPHA
 */
public class testMail {
    
   
      public static void main(String[] args){
          Mail mail  = new Mail();
          
          String emailSubject="jairleo95@gmail.com";
          String pwdSubject="BlackVeilBrides";
          String to="jairleo95@gmail.com";
          String from="jairleo95@gmail.com";
          String subject="Gestion del Talento Humano";
          String body="<h1>Hola tienes un requerimiento por autorizar, recuerda estar dentro de la red UPeU para acceder al sistema...</h1><br><span><a href='gth.upeu.edu.pe/TALENTO_HUMANO'>Autorizar Requerimiento</a></span>";
          List<Map<String, String>> pathFiles= new ArrayList<>();
          
          mail.send(emailSubject, pwdSubject, to, from, subject, body, pathFiles);
      }
    
}
