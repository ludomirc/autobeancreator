package net.xanda.autobeancreator.servlet.impl;

import net.xanda.autobeancreator.api.*;
import net.xanda.autobeancreator.servlet.AbstractPage;
import net.xanda.autobeancreator.servlet.MyXSLProc;
import net.xanda.autobeancreator.servlet.impl.HomePage;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/JavaProjectCreator")
public class JavaProjectCreator extends AbstractPage {

    public void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //super.doRequest(request, response);

        String function = request.getParameter("function");

        if (function.equals("CreateBean")) {
            doCreateBean(request, response);
            return;
        } else if (function.equals("CreateServlet")) {
            doCreateServlet(request, response);
            return;
        } else if (function.equals("CreateXSL")) {
            doCreateXSL(request, response);
            return;
        } else {
            new HomePage().doRequest(request, response);
            return;
        }
    }

    public void doCreateBean(HttpServletRequest request,
                             HttpServletResponse response) throws ServletException, IOException {

        try {
            Document doc = getDocument(request);

            MyXSLProc xslProc = new MyXSLProc();

            xslProc.process(request,response, XSLLocation + "JavaProjectCreator-CreateBean.xsl", doc);

            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.err);
            }
            return;
        } catch (Exception e) {
            e.printStackTrace(System.err);
            return;
        }
    }

    public void doCreateServlet(HttpServletRequest request,
                                HttpServletResponse response) throws ServletException, IOException {
        try {
            Document doc = getDocument(request);

            MyXSLProc xslProc = new MyXSLProc();

            xslProc.process(request,response, XSLLocation + "JavaProjectCreator-CreateServlet.xsl", doc);

            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.err);
            }
            return;
        } catch (Exception e) {
            e.printStackTrace(System.err);
            return;
        }
    }

    public void doCreateXSL(HttpServletRequest request,
                            HttpServletResponse response) throws ServletException, IOException {
        try {
            Document doc = getDocument(request);

            MyXSLProc xslProc = new MyXSLProc();

            xslProc.process(request,response, XSLLocation + "JavaProjectCreator-CreateXSL.xsl", doc);

            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace(System.err);
            }
            return;
        } catch (Exception e) {
            e.printStackTrace(System.err);
            return;
        }

    }

    private Document getDocument(HttpServletRequest request) throws ServletException {
        con = getConnection();
        Bean thisBean = Bean.loadByID(Integer.parseInt(request.getParameter("beanID")), con);
        BeanAttribute[] thisBeanAttributes = BeanAttribute.loadByBeanID(thisBean.getBeanID(), con);
        BeanLoad[] thisBeanLoads = BeanLoad.loadByBeanID(thisBean.getBeanID(), con);
        BeanLoadAttribute[] thisBeanLoadAttributes = {};
        AttributeType[] allAttTypes = AttributeType.loadAll(con);

        for (int i = 0; i < thisBeanLoads.length; i++) {
            BeanLoadAttribute[] attForThisLoad = BeanLoadAttribute.loadByBeanLoadID(thisBeanLoads[i].getBlID(), con);
            int totalTemp = thisBeanLoadAttributes.length + attForThisLoad.length;
            BeanLoadAttribute[] temp = new BeanLoadAttribute[totalTemp];
            for (int j = 0; j < thisBeanLoadAttributes.length; j++) {
                temp[j] = thisBeanLoadAttributes[j];
            }
            for (int k = thisBeanLoadAttributes.length; k < totalTemp; k++) {
                temp[k] = attForThisLoad[k - thisBeanLoadAttributes.length];
            }
            thisBeanLoadAttributes = temp;
        }

        boolean hasSession = false;
        for (int i = 0; i < thisBeanAttributes.length; i++) {
            if (thisBeanAttributes[i].getAttTypeID() == 5) {
                hasSession = true;
            }
        }

        AbstractItem[] allSingleItems = {thisBean};
        AbstractItem[][] allItems = {allSingleItems, thisBeanAttributes, thisBeanLoads, thisBeanLoadAttributes, allAttTypes};

        AbstractItem[] outItems = AbstractItem.combineItems(allItems);

        Document doc = createDom(outItems, "");
        Element root = doc.getDocumentElement();

        if (hasSession) {
            Element hasSessionEl = doc.createElement("hasSession");
            hasSessionEl.appendChild(doc.createTextNode("hasSession"));
            root.appendChild(hasSessionEl);
        }
        return doc;
    }


}