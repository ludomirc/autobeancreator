package net.xanda.autobeancreator.servlet.util;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;
import java.io.InputStream;


class XsltURIResolver implements URIResolver {
    protected Logger logger = Logger.getLogger(MyXSLProc.class);
    @Override
    public Source resolve(String href, String base) throws TransformerException {
        try{
            logger.debug(">>>>>>>>>> href" +  href);
            InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream( "xsl/"+ href);
            return new StreamSource(inputStream);
        }
        catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
}

public class MyXSLProc {

    protected Logger logger = Logger.getLogger(MyXSLProc.class);

    public void process(HttpServletRequest request,HttpServletResponse response, String xsl, Document inDOM) throws ServletException, IOException {


        if (xsl == null) {
            throw new ServletException("Missing stylesheet");
        }

        try {

            //File xmlFile = new File(xml);
            logger.info(">>>>>>>> resource: " + xsl);
            InputStream inStream = request.getServletContext().getResourceAsStream(xsl);

            /* File xslFile = new File(xsl);*/
            response.setContentType("text/html");
            Source xmlSource = new DOMSource(inDOM);
            Source xslSource = new StreamSource(inStream);
            Result result = new StreamResult(response.getWriter());
            TransformerFactory transFact = TransformerFactory.newInstance();

            transFact.setURIResolver(new XsltURIResolver());

            Transformer trans = transFact.newTransformer(xslSource);
            trans.transform(xmlSource, result);
            System.err.println("[" + DateConverter.getRawDateAndTime() + "] XSL XANDAlabs loaded " + xsl);

        } catch (Exception e) {
            e.printStackTrace(System.err);
            throw new ServletException("MyXSLProc: " + e.toString());

        }
    }
}
