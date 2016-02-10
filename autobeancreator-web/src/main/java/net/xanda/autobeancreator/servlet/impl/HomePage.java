package net.xanda.autobeancreator.servlet.impl;

import net.xanda.autobeancreator.api.AbstractItem;
import net.xanda.autobeancreator.servlet.AbstractPage;
import net.xanda.autobeancreator.servlet.MyXSLProc;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.IOException;

@WebServlet("/homepage")
public class HomePage extends AbstractPage {


    public void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AbstractItem[] outItems = {};
        sessionID = request.getSession(true);
        con = getConnection();
        Document myGroupsDOM = createDom(outItems, "");
        Element root = myGroupsDOM.getDocumentElement();
        MyXSLProc xslProc = new MyXSLProc();

        xslProc.process(request, response, XSLLocation + "XANDALabs-HomePage.xsl", myGroupsDOM);
        return;
    }

    public void doRequest(HttpServletRequest request,HttpServletResponse response, String reason) throws ServletException, IOException {
        AbstractItem[] outItems = {};
        Document myGroupsDOM = createDom(outItems, "");
        Element root = myGroupsDOM.getDocumentElement();
        MyXSLProc xslProc = new MyXSLProc();
        xslProc.process(request, response, XSLLocation + "XANDALabs-HomePage.xsl", myGroupsDOM);
        return;
    }

    //creates nodes for the XML document.
    public Document createDom(AbstractItem[] inItem, String title, String reason) throws ServletException {
        Document doc = null;
        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = dbf.newDocumentBuilder();
            doc = docBuilder.newDocument();
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        Element root = doc.createElement("page");
        doc.appendChild(root);
        Element titleElement = doc.createElement("title");
        titleElement.appendChild(doc.createTextNode(title));
        root.appendChild(titleElement);
        Element mainpageEl = doc.createElement("mainpage");
        root.appendChild(mainpageEl);
        Element reasonEl = doc.createElement("reason");
        reasonEl.appendChild(doc.createTextNode(reason));
        root.appendChild(reasonEl);

        for (int i = 0; i < inItem.length; i++) {
            Element itemElement = inItem[i].getElement(doc);
            root.appendChild(itemElement);
        }

        return doc;
    }
}