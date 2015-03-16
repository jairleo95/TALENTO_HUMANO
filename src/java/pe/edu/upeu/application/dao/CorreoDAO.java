package pe.edu.upeu.application.dao;

import java.util.ArrayList;
import java.util.List;
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
import pe.edu.upeu.application.dao_imp.InterfaceCorreoDAO;

public class CorreoDAO implements InterfaceCorreoDAO {

    @Override
    public void Enviar(String to, String from, String Asunto, String Cuerpo) {
        final String username = "jairleo95@gmail.com";//change accordingly
        final String password = "BlackVeilBrides";//change accordingly
        // Assuming you are sending email through relay.jangosmtp.net
        String host = "relay.jangosmtp.net";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        // Get the Session object.
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            // Set Subject: header field
            message.setSubject(Asunto);
            // Create the message part
            BodyPart messageBodyPart = new MimeBodyPart();
            // Now set the actual message
            messageBodyPart.setHeader("Content-Type", "text/html");
            messageBodyPart.setText(Cuerpo);

            // Create a multipar message
            Multipart multipart = new MimeMultipart();
            // Set text message part
            multipart.addBodyPart(messageBodyPart);
            // Part two is attachment
            //  messageBodyPart = new MimeBodyPart();
            String ubicacion = "C:\\Users\\ALFA 3\\Documents\\NetBeansProjects\\TALENTO_HUMANO\\web\\Vista\\Contrato\\Reglamentos\\";
            List<String> Lista_archivos = new ArrayList<>();
            Lista_archivos.add("BIENESTAR PARA EL TRABAJADOR.pdf");
            Lista_archivos.add("BoletinInformativo.pdf");
            Lista_archivos.add("Reglamento de Control de Asistencia.pdf");
            Lista_archivos.add("Reglamento de trabajo.pdf");
            /*DataSource source = new FileDataSource(filename);
             messageBodyPart.setDataHandler(new DataHandler(source));
             messageBodyPart.setFileName(filename);*/
            // multipart.addBodyPart(messageBodyPart);
            // Send the complete message parts 
            for (int i = 0; i < Lista_archivos.size(); i++) {
                agregar_archivo(multipart, ubicacion, Lista_archivos.get(i), messageBodyPart);
            }
            message.setContent(multipart);
            // addAttachment(multipart, filename2);
            // Send message
            Transport.send(message);
            //     System.out.println("Sent message successfully....");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private static void agregar_archivo(Multipart multipart, String ubicacion, String filename, BodyPart messageBodyPart) throws MessagingException {
        messageBodyPart = new MimeBodyPart();
        DataSource source = new FileDataSource(ubicacion + filename);
        messageBodyPart.setDataHandler(new DataHandler(source));
        messageBodyPart.setFileName(filename);
        multipart.addBodyPart(messageBodyPart);
    }

}
