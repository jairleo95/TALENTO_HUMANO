/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.util;

/**
 *
 * @author ALPHA
 */
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Mail {

    public Boolean send(final String emailSubject, final String pwdSubject, String to, String from, String subject, String body, List<Map<String, String>> pathFiles) {

        // Assuming you are sending email through relay.jangosmtp.net
        // String host = "relay.jangosmtp.net";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        // Get the Session object.
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(emailSubject, pwdSubject);
            }
        });
        try {
            /* String ubicacion = globalProperties.url + "Reglamentos/";*/
            //   String ubicacion = "/var/lib/tomcat7/webapps/TALENTO_HUMANO/Vista/Contrato/Reglamentos/";

            //List<String> listFile = new ArrayList<String>();
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            // Set Subject: header field
            message.setSubject(subject);
            // Create the message part
            BodyPart messageBodyPart = new MimeBodyPart();
            // Now set the actual message
            messageBodyPart.setContent(body, "text/html");
            //messageBodyPart.setText(Cuerpo);
            // Create a multipar message
            Multipart multipart = new MimeMultipart();
            // Set text message part
            multipart.addBodyPart(messageBodyPart);
            // Part two is attachment
            //  messageBodyPart = new MimeBodyPart();

            // Send the complete message parts
            message.setContent(multipart);
            for (int i = 0; i < pathFiles.size(); i++) {
                addFileToMessage(multipart, pathFiles.get(i).get("fileName"), pathFiles.get(i).get("path") + pathFiles.get(i).get("fileName"), messageBodyPart);
            }
            // addAttachment(multipart, filename2);
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

    private static void addFileToMessage(Multipart multipart, String filename, String ubicacion, BodyPart messageBodyPart) throws MessagingException {
        DataSource source = new FileDataSource(ubicacion);
        messageBodyPart = new MimeBodyPart();
        messageBodyPart.setDataHandler(new DataHandler(source));
        messageBodyPart.setFileName(filename);
        multipart.addBodyPart(messageBodyPart);
    }

}
