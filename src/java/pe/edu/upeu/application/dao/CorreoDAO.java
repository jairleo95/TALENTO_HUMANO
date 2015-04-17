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
import pe.edu.upeu.application.factory.FactoryConnectionDB;

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
            String ubicacion = FactoryConnectionDB.url + "web/Vista/Contrato/Reglamentos/";
            List<String> lista_archivos = new ArrayList<String>();

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
            messageBodyPart.setText(Cuerpo);
            // Create a multipar message
            Multipart multipart = new MimeMultipart();
            // Set text message part
            multipart.addBodyPart(messageBodyPart);
            // Part two is attachment
            //  messageBodyPart = new MimeBodyPart();
            lista_archivos.add("BoletinInformativo.pdf");
            lista_archivos.add("BIENESTAR PARA EL TRABAJADOR.pdf");
            lista_archivos.add("Reglamento de Control de Asistencia.pdf");
            lista_archivos.add("Reglamento de trabajo.pdf");
            //   String filename2 = "C:\\Users\\ALFA 3\\Documents\\ACTIVIDAD 1.docx";
           /* DataSource source = new FileDataSource(nombre_archivo);
             messageBodyPart.setDataHandler(new DataHandler(source));
             messageBodyPart.setFileName(nombre_archivo);
             multipart.addBodyPart(messageBodyPart);*/
            // Send the complete message parts
            message.setContent(multipart);
            for (int i = 0; i < lista_archivos.size(); i++) {
                agregar_archivo(multipart, lista_archivos.get(i), ubicacion + lista_archivos.get(i), messageBodyPart);
            }
            // addAttachment(multipart, filename2);
            // Send message
            Transport.send(message);
            //     System.out.println("Sent message successfully....");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private static void agregar_archivo(Multipart multipart, String filename, String ubicacion, BodyPart messageBodyPart) throws MessagingException {
        DataSource source = new FileDataSource(ubicacion);
        messageBodyPart = new MimeBodyPart();
        messageBodyPart.setDataHandler(new DataHandler(source));
        messageBodyPart.setFileName(filename);
        multipart.addBodyPart(messageBodyPart);
    }

}
