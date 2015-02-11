import java.util.*;
import javax.servlet.*;
import javax.xml.soap.*;
import javax.servlet.http.*;
import javax.xml.messaging.*;

public class SOAP_CLIENT extends JAXMServlet implements ReqRespListener {

    static MessageFactory messageFactory = null;

    public void init(ServletConfig servletConfig) throws ServletException {
        super.init(servletConfig);
        try {
            messageFactory = MessageFactory.newInstance();
        } catch (Exception ex) {
        }
    }

    public SOAPMessage onMessage(SOAPMessage msg) {
        try {
            SOAPPart soappart = msg.getSOAPPart();
            SOAPEnvelope incomingEnvelope = soappart.getEnvelope();
            SOAPBody body = incomingEnvelope.getBody();

            Iterator iterator = body.getChildElements(
                    incomingEnvelope.createName("numberAvailable", "laptops",
                            "http://www.XMLPowerCorp.com"));

            SOAPElement element;
            element = (SOAPElement) iterator.next();

            SOAPMessage message = messageFactory.createMessage();
            SOAPEnvelope envelope = message.getSOAPPart().getEnvelope();

            envelope.getBody().addChildElement(envelope
                    .createName("Response")).addTextNode(
                            "Got the SOAP message indicating there are "
                            + element.getValue()
                            + " laptops available."
                    );

            return message;
        } catch (Exception e) {
            return null;
        }
    }
}
