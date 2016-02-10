package net.xanda.autobeancreator.servlet;

import net.xanda.autobeancreator.servlet.util.DateConverter;
import org.w3c.dom.Document;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.IOException;


public class MyXSLProc {
    public void process(HttpServletRequest request, HttpServletResponse response, String xsl, Document inDOM) throws ServletException, IOException {

        if (xsl == null) {
            throw new ServletException("Missing stylesheet");
        }

        try {

            //File xmlFile = new File(xml);
            File xslFile = new File(xsl);
            response.setContentType("text/html");
            Source xmlSource = new DOMSource(inDOM);
            Source xslSource = new StreamSource(xslFile);
            Result result = new StreamResult(response.getWriter());
            TransformerFactory transFact = TransformerFactory.newInstance();
            Transformer trans = transFact.newTransformer(xslSource);
            trans.transform(xmlSource, result);
            System.err.println("[" + DateConverter.getRawDateAndTime() + "] XSL XANDAlabs loaded " + xsl);

        } catch (Exception e) {
            e.printStackTrace(System.err);
            throw new ServletException("MyXSLProc: " + e.toString());

        }
    }
}
