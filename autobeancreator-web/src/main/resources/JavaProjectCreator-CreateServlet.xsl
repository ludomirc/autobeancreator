<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/tr/REC-html40">
	<xsl:import href="XANDALabs-GenericPage.xsl"/>
	<xsl:output indent="no" encoding="iso-8859-1" method="html"
		doctype-public="-//W3C//Dtd  HTML 4.0 Transitional//EN"/>
	<xsl:template match="menu"/>
	<xsl:template match="login"/>
	<xsl:template match="mainpage">	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  		<tr>
    		<td align="left" valign="middle">
    		<br />
    		




<b>Servlet Creation for <xsl:value-of select="//Bean/beanName"/></b><br/><br/><br/>

import java.io.File;<br/>
import java.io.IOException;<br/>
import java.util.Iterator;<br/>
import java.util.List;<br/>
import java.util.Random;<br/>
import java.util.StringTokenizer;<br/>
import javax.servlet.ServletException;<br/>
import javax.servlet.http.HttpServletRequest;<br/>
import javax.servlet.http.HttpServletResponse;<br/>
import org.apache.commons.fileupload.DiskFileUpload;<br/>
import org.apache.commons.fileupload.FileItem;<br/>
import org.w3c.dom.Document;<br/>
import org.w3c.dom.Element;<br/><br/>

public class Admin<xsl:value-of select="//Bean/beanName"/> extends AbstractPage {
<br/><br/>
<xsl:for-each select="//BeanAttribute">
<xsl:choose>
<xsl:when test="attTypeID=6">
	private String fileNameOnly = "";<br/>
	private int <xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/></xsl:when></xsl:choose></xsl:for-each> = 0;<br/>
	private int field = 0;<br/>
	private String fileName = "";<br/>
	private FileItem item = null;<br/>
	private boolean formChecker = false;<br/>
	private boolean fileTypeCheck = true;<br/>
	private long sizeInBytes = 0;<br/>
	private String enc = "";<br/><br/>
</xsl:when>
</xsl:choose>
</xsl:for-each>

	
	public void doRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
<br/><br/>		
		super.doRequest(request, response);
<br/><br/>		
		if (nosessionID) {<br/>
			return;<br/>
		}<br/>
<br/><br/>
		String function = request.getParameter("function");<br/><br/>
		
		if (function.equals("ViewAll")) {<br/>
			doViewAll(request, response);<br/>
			return;<br/>
		} else if (function.equals("View")) {<br/>
			doView(request, response);<br/>
			return;<br/>
		} else if (function.equals("Add")) {<br/>
			doAdd(request, response);<br/>
			return;	<br/>
		} else if (function.equals("AddSave")) {<br/>
			doAddSave(request, response);<br/>
			return;		<br/>
		} else if (function.equals("Edit")) {<br/>
			doEdit(request, response);<br/>
			return;<br/>
		} else if (function.equals("EditSave")) {<br/>
			doEditSave(request, response);<br/>
			return;	<br/>
		} else if (function.equals("Delete")) {<br/>
			doDelete(request, response);<br/>
			return;	<br/>
		} else if (function.equals("DeleteSave")) {<br/>
			doDeleteSave(request, response);<br/>
			return;		<br/>
		} else 
		
<xsl:for-each select="//BeanAttribute">
<xsl:choose>
<xsl:when test="attTypeID=6">		
		if (function.equals("Upload")) {<br/>
			doUpload(request, response);<br/>
			return;		<br/>
		} else if (function.equals("UploadSave")) {<br/>
			doUploadSave(request, response);<br/>
			return;		<br/>
		} else
</xsl:when></xsl:choose></xsl:for-each>		
		{<br/>
			return;<br/>
		}<br/>
	}<br/><br/>
	
	

	
	
	public void doAdd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {<br/><br/>

		Admin currentAdmin = Admin.loadBySession(sessionID, con);<br/>
		AbstractItem[] allData = { currentAdmin };<br/>
		Document myGroupsDOM = createDom(allData, "");<br/>
		MyXSLProc xslProc = new MyXSLProc();<br/>
		xslProc.process(request, response, XSLLocation + "Add<xsl:value-of select="//Bean/beanName"/>.xsl", myGroupsDOM);<br/>
		return;<br/>
	}<br/><br/>
	
	
	public void doEdit(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {<br/><br/>

		int 
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>
=<xsl:text> </xsl:text>Integer.parseInt(request.getParameter("<xsl:value-of select="beanAttName"/>"));<br/>
<xsl:value-of select="//Bean/beanName"/> this<xsl:value-of select="//Bean/beanName"/> = <xsl:value-of select="//Bean/beanName"/>.loadByID(<xsl:value-of select="beanAttName"/>, con);<br/>
</xsl:when></xsl:choose>
</xsl:for-each>
<br/><br/>

		Admin currentAdmin = Admin.loadBySession(sessionID, con);<br/>
		AbstractItem[] allData = { currentAdmin, this<xsl:value-of select="//Bean/beanName"/> };<br/>
		Document myGroupsDOM = createDom(allData, "");<br/>
		MyXSLProc xslProc = new MyXSLProc();<br/>
		xslProc.process(request, response, XSLLocation + "Edit<xsl:value-of select="//Bean/beanName"/>.xsl", myGroupsDOM);<br/>
		return;<br/>
	}<br/><br/>
	

	public void doDelete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {<br/><br/>

		int 
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>
=<xsl:text> </xsl:text>Integer.parseInt(request.getParameter("<xsl:value-of select="beanAttName"/>"));<br/>
<xsl:value-of select="//Bean/beanName"/> this<xsl:value-of select="//Bean/beanName"/> = <xsl:value-of select="//Bean/beanName"/>.loadByID(<xsl:value-of select="beanAttName"/>, con);<br/>
</xsl:when></xsl:choose>
</xsl:for-each>
<br/><br/>

		Admin currentAdmin = Admin.loadBySession(sessionID, con);<br/>
		AbstractItem[] allData = { currentAdmin, this<xsl:value-of select="//Bean/beanName"/> };<br/>
		Document myGroupsDOM = createDom(allData, "");<br/>
		MyXSLProc xslProc = new MyXSLProc();<br/>
		xslProc.process(request, response, XSLLocation + "Delete<xsl:value-of select="//Bean/beanName"/>.xsl", myGroupsDOM);<br/>
		return;<br/>
	}<br/><br/>	
	
	
public void doDeleteSave(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {<br/><br/>

		int 
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>
=<xsl:text> </xsl:text>Integer.parseInt(request.getParameter("<xsl:value-of select="beanAttName"/>"));<br/>
<xsl:value-of select="//Bean/beanName"/> this<xsl:value-of select="//Bean/beanName"/> = <xsl:value-of select="//Bean/beanName"/>.loadByID(<xsl:value-of select="beanAttName"/>, con);<br/>
</xsl:when></xsl:choose>
</xsl:for-each>
<br/><br/>

		if (!this<xsl:value-of select="//Bean/beanName"/>.delete(con)){
		
		Admin currentAdmin = Admin.loadBySession(sessionID, con);<br/>
		AbstractItem[] allData = { currentAdmin, this<xsl:value-of select="//Bean/beanName"/> };<br/>
		Document myGroupsDOM = createDom(allData, "");<br/>
		
		Element root = myGroupsDOM.getDocumentElement();
			
				Element reasonEl = myGroupsDOM.createElement("reason");
				reasonEl.appendChild(myGroupsDOM.createTextNode("Error Deleting Record"));
				root.appendChild(reasonEl);
		
		MyXSLProc xslProc = new MyXSLProc();<br/>
		xslProc.process(request, response, XSLLocation + "Delete<xsl:value-of select="//Bean/beanName"/>.xsl", myGroupsDOM);<br/>
		return;<br/>
		
		}

		Admin currentAdmin = Admin.loadBySession(sessionID, con);<br/>
		AbstractItem[] allData = { currentAdmin, this<xsl:value-of select="//Bean/beanName"/> };<br/>
		Document myGroupsDOM = createDom(allData, "");<br/>
		MyXSLProc xslProc = new MyXSLProc();<br/>
		xslProc.process(request, response, XSLLocation + "DeleteSave<xsl:value-of select="//Bean/beanName"/>.xsl", myGroupsDOM);<br/>
		return;<br/>
	}<br/><br/>		
	
	
	
	public void doView(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {<br/><br/>

		int 
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>
=<xsl:text> </xsl:text>Integer.parseInt(request.getParameter("<xsl:value-of select="beanAttName"/>"));<br/>
<xsl:value-of select="//Bean/beanName"/> this<xsl:value-of select="//Bean/beanName"/> = <xsl:value-of select="//Bean/beanName"/>.loadByID(<xsl:value-of select="beanAttName"/>, con);<br/>
</xsl:when></xsl:choose>
</xsl:for-each>
<br/><br/>

		Admin currentAdmin = Admin.loadBySession(sessionID, con);<br/>
		AbstractItem[] allData = { currentAdmin, this<xsl:value-of select="//Bean/beanName"/> };<br/>
		Document myGroupsDOM = createDom(allData, "");<br/>
		MyXSLProc xslProc = new MyXSLProc();<br/>
		xslProc.process(request, response, XSLLocation + "View<xsl:value-of select="//Bean/beanName"/>.xsl", myGroupsDOM);<br/>
		return;<br/>
	}<br/><br/>
	
	
	public void doViewAll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {<br/><br/>
		
<xsl:value-of select="//Bean/beanName"/>[] all<xsl:value-of select="//Bean/beanName"/> = <xsl:value-of select="//Bean/beanName"/>.loadAll(con);<br/>
<br/><br/>
		Admin currentAdmin = Admin.loadBySession(sessionID, con);<br/>
		AbstractItem[] allData = all<xsl:value-of select="//Bean/beanName"/>;<br/>
		Document myGroupsDOM = createDom(allData, "");<br/>
		MyXSLProc xslProc = new MyXSLProc();<br/>
		xslProc.process(request, response, XSLLocation + "ViewAll<xsl:value-of select="//Bean/beanName"/>.xsl", myGroupsDOM);<br/>
		return;<br/>
	}<br/><br/><br/>	
	
	
/** ERROR CHECKING FUNCTIONS **/

<br/><br/><br/>	
	
		public void doAddSave(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {<br/><br/>
		
		Admin currentAdmin = Admin.loadBySession(sessionID, con);<br/><br/>

		String reason = "";<br/><br/>
		boolean errorCheck = false;<br/><br/>
		
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=0">
<xsl:choose><xsl:when test="attTypeID=1">int <xsl:value-of select="beanAttName"/> = Integer.parseInt(request.getParameter("<xsl:value-of select="beanAttName"/>"));</xsl:when></xsl:choose> 
<xsl:choose><xsl:when test="attTypeID=2">String <xsl:value-of select="beanAttName"/> = request.getParameter("<xsl:value-of select="beanAttName"/>");</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=3">String <xsl:value-of select="beanAttName"/>  = request.getParameter("<xsl:value-of select="beanAttName"/>");</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=4">String <xsl:value-of select="beanAttName"/>  = request.getParameter("<xsl:value-of select="beanAttName"/>");</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=6">String <xsl:value-of select="beanAttName"/>  = request.getParameter("<xsl:value-of select="beanAttName"/>");</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=7">String <xsl:value-of select="beanAttName"/>  = request.getParameter("<xsl:value-of select="beanAttName"/>");</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=8">int <xsl:value-of select="beanAttName"/>  = Integer.parseInt(request.getParameter("<xsl:value-of select="beanAttName"/>"));</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=9">float <xsl:value-of select="beanAttName"/>  = Float.parseFloat(request.getParameter("<xsl:value-of select="beanAttName"/>"));</xsl:when></xsl:choose>
<br/>
</xsl:when></xsl:choose>
</xsl:for-each>
		
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="attTypeID=2"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "'", "&#39;");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\", "\\\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=3"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "'", "&#39;");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\", "\\\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=4"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "'", "&#39;");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\", "\\\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=6"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "'", "&#39;");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\", "\\\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=7"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "'", "&#39;");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\", "\\\\");<br/><br/></xsl:when></xsl:choose>
<br/>
</xsl:for-each>
		
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="compulsoryField=1">
<xsl:choose><xsl:when test="attTypeID=2">
if (<xsl:value-of select="beanAttName"/>.equals("")) {<br/>
			errorCheck = true;<br/>
			reason = reason + "You have not entered a <xsl:value-of select="friendlyName"/>.&lt;br/&gt;";<br/>
		}<br/><br/>
</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=3">
if (<xsl:value-of select="beanAttName"/>.equals("")) {<br/>
			errorCheck = true;<br/>
			reason = reason + "You have not entered a <xsl:value-of select="friendlyName"/>.&lt;br/&gt;";<br/>
		}<br/><br/>
</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=4">
if (<xsl:value-of select="beanAttName"/>.equals("")) {<br/>
			errorCheck = true;<br/>
			reason = reason + "You have not entered a <xsl:value-of select="friendlyName"/>.&lt;br/&gt;";<br/>
		}<br/><br/>
if (<xsl:value-of select="beanAttName"/>.length()&lt;5) {<br/>
			errorCheck = true;<br/>
			reason = reason + "Your password does not meet the minimum length of five characters.&lt;br/&gt;";<br/>
		}		<br/><br/>
</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=7">
if (<xsl:value-of select="beanAttName"/>.equals("")) {<br/>
			errorCheck = true;<br/>
			reason = reason + "You have not entered a <xsl:value-of select="friendlyName"/>.&lt;br/&gt;";<br/>
		}<br/>
if (answers[i].indexOf(".")>0 &amp;&amp; answers[i].indexOf("@")>0){	<br/>
//correct <br/>
}	else { <br/>
errorCheck = true;<br/>
			reason = reason + "You have not entered a valid <xsl:value-of select="friendlyName"/>.&lt;br/&gt;";<br/>
		}<br/>
</xsl:when></xsl:choose>
</xsl:when></xsl:choose>
</xsl:for-each>		

		if (errorCheck) {<br/><br/>

			AbstractItem[] allData = { };<br/><br/>
			
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="attTypeID=2"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=3"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=4"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=6"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=7"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
</xsl:for-each>

			
			Document outDOM = createDom(allData, "");<br/><br/>

			Element root = outDOM.getDocumentElement();<br/><br/>

			Element Elreason = outDOM.createElement("reason");<br/>
			Elreason.appendChild(outDOM.createTextNode(reason));<br/>
			root.appendChild(Elreason);<br/><br/>
			
			
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=0">
Element <xsl:value-of select="beanAttName"/>El = outDOM.createElement("<xsl:value-of select="beanAttName"/>");<br/>
<xsl:value-of select="beanAttName"/>El.appendChild(outDOM.createTextNode(<xsl:value-of select="beanAttName"/>+""));<br/>
root.appendChild(<xsl:value-of select="beanAttName"/>El);<br/><br/>
</xsl:when></xsl:choose>
</xsl:for-each>			
<br/><br/>			
			
			MyXSLProc xslProc = new MyXSLProc();<br/>			
			xslProc.process(request, response, XSLLocation + "Add<xsl:value-of select="//Bean/beanName"/>.xsl", outDOM);<br/>
			return;<br/><br/>
			
		}<br/><br/>

		int 
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>
</xsl:when></xsl:choose></xsl:for-each>
=0;<br/><br/>

		try {<br/>
		
		<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>
</xsl:when></xsl:choose></xsl:for-each> = <xsl:value-of select="//Bean/beanName"/>.createNew(

<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=0"><xsl:value-of select="beanAttName"/>,
</xsl:when></xsl:choose></xsl:for-each>
con);<br/>
		
		} catch (Exception e) {<br/>
			System.err.println("Error saving DocumentCategory: " + e);<br/>
			e.printStackTrace(System.err);<br/>
		}<br/><br/>

		if (<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>
</xsl:when></xsl:choose></xsl:for-each> == 0) {<br/><br/>
			
			reason = "There was a problem saving, please try again.&lt;br/&gt;";<br/><br/>

			AbstractItem[] allData = { };<br/><br/>
			
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="attTypeID=2"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=3"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=4"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=6"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=7"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose><br/>
</xsl:for-each>

			
			Document outDOM = createDom(allData, "");<br/><br/>

			Element root = outDOM.getDocumentElement();<br/><br/>

			Element Elreason = outDOM.createElement("reason");<br/>
			Elreason.appendChild(outDOM.createTextNode(reason));<br/>
			root.appendChild(Elreason);<br/><br/>
			
			
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=0">
Element <xsl:value-of select="beanAttName"/>El = outDOM.createElement("<xsl:value-of select="beanAttName"/>");<br/>
<xsl:value-of select="beanAttName"/>El.appendChild(outDOM.createTextNode(<xsl:value-of select="beanAttName"/>+""));<br/>
root.appendChild(<xsl:value-of select="beanAttName"/>El);<br/><br/>
</xsl:when></xsl:choose>
</xsl:for-each>			
<br/><br/>			
			
			MyXSLProc xslProc = new MyXSLProc();<br/>			
			xslProc.process(request, response, XSLLocation + "Add<xsl:value-of select="//Bean/beanName"/>.xsl", outDOM);<br/>
			return;<br/><br/>

		}<br/><br/>

		AbstractItem[] allData = { };<br/>
		Document outDOM = createDom(allData, "");<br/>
		MyXSLProc xslProc = new MyXSLProc();<br/>
		xslProc.process(request, response, XSLLocation + "AddSave<xsl:value-of select="//Bean/beanName"/>.xsl", outDOM);<br/><br/>
		return;<br/>

	}<br/><br/><br/>
	
	
	
	public void doEditSave(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {<br/><br/>

		Admin currentAdmin = Admin.loadBySession(sessionID, con);<br/><br/>
		
		int 
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/> = Integer.parseInt(request.getParameter("<xsl:value-of select="beanAttName"/>"));
</xsl:when></xsl:choose></xsl:for-each>
		<br/><br/>
		
		<xsl:value-of select="//Bean/beanName"/> this<xsl:value-of select="//Bean/beanName"/> = <xsl:value-of select="//Bean/beanName"/>.loadByID(<xsl:for-each select="//BeanAttribute">
		<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/></xsl:when></xsl:choose></xsl:for-each>, con);
		<br/><br/>

		
		String reason = "";<br/><br/>
		boolean errorCheck = false;<br/><br/>
		
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=0">
<xsl:choose><xsl:when test="attTypeID=1">int <xsl:value-of select="beanAttName"/> = Integer.parseInt(request.getParameter("<xsl:value-of select="beanAttName"/>"));</xsl:when></xsl:choose> 
<xsl:choose><xsl:when test="attTypeID=2">String <xsl:value-of select="beanAttName"/> = request.getParameter("<xsl:value-of select="beanAttName"/>");</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=3">String <xsl:value-of select="beanAttName"/>  = request.getParameter("<xsl:value-of select="beanAttName"/>");</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=4">String <xsl:value-of select="beanAttName"/>  = request.getParameter("<xsl:value-of select="beanAttName"/>");</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=6">String <xsl:value-of select="beanAttName"/>  = request.getParameter("<xsl:value-of select="beanAttName"/>");</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=7">String <xsl:value-of select="beanAttName"/>  = request.getParameter("<xsl:value-of select="beanAttName"/>");</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=8">int <xsl:value-of select="beanAttName"/>  = Integer.parseInt(request.getParameter("<xsl:value-of select="beanAttName"/>"));</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=9">float <xsl:value-of select="beanAttName"/>  = Float.parseFloat(request.getParameter("<xsl:value-of select="beanAttName"/>"));</xsl:when></xsl:choose>
<br/>
</xsl:when></xsl:choose>
</xsl:for-each>
		
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="attTypeID=2"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "'", "&#39;");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\", "\\\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=3"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "'", "&#39;");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\", "\\\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=4"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "'", "&#39;");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\", "\\\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=6"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "'", "&#39;");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\", "\\\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=7"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "'", "&#39;");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\", "\\\\");<br/><br/></xsl:when></xsl:choose>
<br/>
</xsl:for-each>
		
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="compulsoryField=1">
<xsl:choose><xsl:when test="attTypeID=2">
if (<xsl:value-of select="beanAttName"/>.equals("")) {<br/>
			errorCheck = true;<br/>
			reason = reason + "You have not entered a <xsl:value-of select="friendlyName"/>.&lt;br/&gt;";<br/>
		}<br/><br/>
</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=3">
if (<xsl:value-of select="beanAttName"/>.equals("")) {<br/>
			errorCheck = true;<br/>
			reason = reason + "You have not entered a <xsl:value-of select="friendlyName"/>.&lt;br/&gt;";<br/>
		}<br/><br/>
</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=4">
if (<xsl:value-of select="beanAttName"/>.equals("")) {<br/>
			errorCheck = true;<br/>
			reason = reason + "You have not entered a <xsl:value-of select="friendlyName"/>.&lt;br/&gt;";<br/>
		}<br/><br/>
if (<xsl:value-of select="beanAttName"/>.length()&lt;5) {<br/>
			errorCheck = true;<br/>
			reason = reason + "Your password does not meet the minimum length of five characters.&lt;br/&gt;";<br/>
		}		<br/><br/>
</xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=7">
if (<xsl:value-of select="beanAttName"/>.equals("")) {<br/>
			errorCheck = true;<br/>
			reason = reason + "You have not entered a <xsl:value-of select="friendlyName"/>.&lt;br/&gt;";<br/>
		}<br/>
if (answers[i].indexOf(".")>0 &amp;&amp; answers[i].indexOf("@")>0){	<br/>
//correct <br/>
}	else { <br/>
errorCheck = true;<br/>
			reason = reason + "You have not entered a valid <xsl:value-of select="friendlyName"/>.&lt;br/&gt;";<br/>
		}<br/>
</xsl:when></xsl:choose>
</xsl:when></xsl:choose>
</xsl:for-each>		

		if (errorCheck) {<br/><br/>

			AbstractItem[] allData = { };<br/><br/>
			
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="attTypeID=2"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=3"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=4"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=6"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=7"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
</xsl:for-each>

			
			Document outDOM = createDom(allData, "");<br/><br/>

			Element root = outDOM.getDocumentElement();<br/><br/>

			Element Elreason = outDOM.createElement("reason");<br/>
			Elreason.appendChild(outDOM.createTextNode(reason));<br/>
			root.appendChild(Elreason);<br/><br/>
			
			
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=0">
Element <xsl:value-of select="beanAttName"/>El = outDOM.createElement("<xsl:value-of select="beanAttName"/>");<br/>
<xsl:value-of select="beanAttName"/>El.appendChild(outDOM.createTextNode(<xsl:value-of select="beanAttName"/>+""));<br/>
root.appendChild(<xsl:value-of select="beanAttName"/>El);<br/><br/>
</xsl:when></xsl:choose>
</xsl:for-each>			
<br/><br/>			
			
			MyXSLProc xslProc = new MyXSLProc();<br/>			
			xslProc.process(request, response, XSLLocation + "Edit<xsl:value-of select="//Bean/beanName"/>.xsl", outDOM);<br/>
			return;<br/><br/>
			
		}<br/><br/>
			
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=0">
this<xsl:value-of select="//Bean/beanName"/>.SET<xsl:value-of select="beanAttName"/>(<xsl:value-of select="beanAttName"/>);<br/>
</xsl:when></xsl:choose></xsl:for-each>

		<br/><br/>
		
	
		if (!this<xsl:value-of select="//Bean/beanName"/>.save(con)) {<br/><br/>
		
		
		
		
		
		

			reason = "There was a problem saving, please try again.&lt;br/&gt;";<br/><br/>

			AbstractItem[] allData = { };<br/><br/>
			
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="attTypeID=2"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=3"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=4"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=6"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose>
<xsl:choose><xsl:when test="attTypeID=7"><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "&amp;#39;", "'");<br/><xsl:value-of select="beanAttName"/> = InputSyntaxCheck.replace(<xsl:value-of select="beanAttName"/>, "\\\\", "\\");<br/><br/></xsl:when></xsl:choose><br/>
</xsl:for-each>

			
			Document outDOM = createDom(allData, "");<br/><br/>

			Element root = outDOM.getDocumentElement();<br/><br/>

			Element Elreason = outDOM.createElement("reason");<br/>
			Elreason.appendChild(outDOM.createTextNode(reason));<br/>
			root.appendChild(Elreason);<br/><br/>
			
			
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=0">
Element <xsl:value-of select="beanAttName"/>El = outDOM.createElement("<xsl:value-of select="beanAttName"/>");<br/>
<xsl:value-of select="beanAttName"/>El.appendChild(outDOM.createTextNode(<xsl:value-of select="beanAttName"/>+""));<br/>
root.appendChild(<xsl:value-of select="beanAttName"/>El);<br/><br/>
</xsl:when></xsl:choose>
</xsl:for-each>			
<br/><br/>			
			
			MyXSLProc xslProc = new MyXSLProc();<br/>			
			xslProc.process(request, response, XSLLocation + "Edit<xsl:value-of select="//Bean/beanName"/>.xsl", outDOM);<br/>
			return;<br/><br/>

		}<br/><br/>
		
		AbstractItem[] allData = { };<br/>
		Document outDOM = createDom(allData, "");<br/>
		MyXSLProc xslProc = new MyXSLProc();<br/>
		xslProc.process(request, response, XSLLocation + "EditSave<xsl:value-of select="//Bean/beanName"/>.xsl", outDOM);<br/><br/>
		return;<br/>

	}<br/><br/><br/>
	
	
<xsl:for-each select="//BeanAttribute">
<xsl:choose>
<xsl:when test="attTypeID=6">	

	public void doUpload(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {<br/><br/>

		int 
<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>
=<xsl:text> </xsl:text>Integer.parseInt(request.getParameter("<xsl:value-of select="beanAttName"/>"));<br/>
<xsl:value-of select="//Bean/beanName"/> this<xsl:value-of select="//Bean/beanName"/> = <xsl:value-of select="//Bean/beanName"/>.loadByID(<xsl:value-of select="beanAttName"/>, con);<br/>
</xsl:when></xsl:choose>
</xsl:for-each>
<br/><br/>

		Admin currentAdmin = Admin.loadBySession(sessionID, con);<br/>
		AbstractItem[] allData = { currentAdmin, this<xsl:value-of select="//Bean/beanName"/> };<br/>
		Document myGroupsDOM = createDom(allData, "");<br/>
		MyXSLProc xslProc = new MyXSLProc();<br/>
		xslProc.process(request, response, XSLLocation + "Upload<xsl:value-of select="//Bean/beanName"/>.xsl", myGroupsDOM);<br/>
		return;<br/>
	}<br/><br/><br/>

public void doUploadSave(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {<br/><br/>
		
		Admin currentAdmin = Admin.loadBySession(sessionID, con);<br/><br/>
		
		DiskFileUpload upload = null;<br/><br/>
		try {<br/>
			upload = new DiskFileUpload();<br/>
		} catch (Exception e) {<br/>
			System.err.println("Initialising DiskFileUpload failed: " + e);<br/>
			e.printStackTrace(System.err);<br/>
		}<br/>
		try {
			List items = upload.parseRequest(request);<br/>
			upload.setSizeThreshold(0); //All files more than 0 bytes are written direct to disk<br/>
			
			upload.setSizeMax(-1); //(-1) there is no maximum size for files being uploaded<br/>
			
			upload.setRepositoryPath("/home/httpd/vhosts/***ENTER REPOSITORY HERE***/");<br/>
			
			Iterator iter = items.iterator();<br/>
			
			while (iter.hasNext()) {<br/>
				item = (FileItem) iter.next();<br/>
				if (item.isFormField()) {<br/>
					formChecker = processFormFieldICal(item);<br/>
				}<br/>
			}<br/>

			if (processUploadedFileICal(item) == false) {<br/><br/>

				String reason = "Error Uploading. Please try again.";<br/><br/>
				
				AbstractItem[] allData = { };<br/>

				Document outDOM = createDom(allData, "");<br/><br/>
				
				Element root = outDOM.getDocumentElement();<br/><br/>

				Element El<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/></xsl:when></xsl:choose></xsl:for-each> = outDOM.createElement("<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/></xsl:when></xsl:choose></xsl:for-each>");
				El<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/></xsl:when></xsl:choose></xsl:for-each>.appendChild(outDOM.createTextNode(<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/></xsl:when></xsl:choose></xsl:for-each> + ""));
				root.appendChild(El<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/></xsl:when></xsl:choose></xsl:for-each>);

				MyXSLProc xslProc = new MyXSLProc();<br/>
				xslProc.process(request, response, XSLLocation + "Upload<xsl:value-of select="//Bean/beanName"/>.xsl", outDOM);<br/>
				return;<br/>
			}<br/>
		} catch (Exception e) {<br/>
			System.err.println("Error Parsing Request: " + e);<br/>
			e.printStackTrace(System.err);<br/>
		}<br/>

		<xsl:value-of select="//Bean/beanName"/> this<xsl:value-of select="//Bean/beanName"/> = <xsl:value-of select="//Bean/beanName"/>.loadByID(<xsl:for-each select="//BeanAttribute">
<xsl:choose><xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/></xsl:when></xsl:choose></xsl:for-each>, con);
		
		this<xsl:value-of select="//Bean/beanName"/>.SET<xsl:for-each select="//BeanAttribute">
<xsl:choose>
<xsl:when test="attTypeID=6"><xsl:value-of select="beanAttName"/></xsl:when></xsl:choose></xsl:for-each>(enc+"_"+fileNameOnly);<br/>
		
		this<xsl:value-of select="//Bean/beanName"/>.save(con);<br/>
		
		AbstractItem[] allData = { };<br/>

		Document outDOM = createDom(allData, "");<br/>

		MyXSLProc xslProc = new MyXSLProc();<br/>
		xslProc.process(request, response, XSLLocation + "UploadSave<xsl:value-of select="//Bean/beanName"/>.xsl", outDOM);<br/>
		return;<br/>
	}<br/><br/><br/>


public boolean processFormField(FileItem item) {<br/>
		field++;<br/>
		String name = item.getFieldName();<br/>
		String value = item.getString();<br/>
		value = InputSyntaxCheck.replace(value, "'", "''");<br/>
		value = InputSyntaxCheck.replace(value, "\\", "\\\\");<br/>
		value = InputSyntaxCheck.replace(value, "\n", "&lt;br/>");<br/>

		if (name.equals("<xsl:for-each select="//BeanAttribute">
<xsl:choose>
<xsl:when test="primaryKey=1">
<xsl:value-of select="beanAttName"/>
</xsl:when>
</xsl:choose>
</xsl:for-each>	")) {
			<xsl:for-each select="//BeanAttribute">
<xsl:choose>
<xsl:when test="primaryKey=1">
<xsl:value-of select="beanAttName"/>
</xsl:when>
</xsl:choose>
</xsl:for-each>	 = Integer.parseInt(value);<br/>
			return true;<br/>
		}<br/>
		return false;<br/>
	}<br/>
<br/>

	public boolean processUploadedFile(FileItem item) {<br/><br/>

		fileName = item.getName();<br/><br/>
		
		if (fileName.equals("")) {<br/>
			return false;<br/>
		}<br/><br/>
		
		sizeInBytes = item.getSize();<br/><br/>
		
		//if (sizeInBytes > 25600) {<br/>
		//	return false;<br/>
		//}<br/><br/>
		
		StringTokenizer tok = new StringTokenizer(fileName, "\\");<br/>
		int count = tok.countTokens();<br/>
		for (int i = 1; i &lt; count; i++) {<br/>
			tok.nextToken();<br/>
		}<br/>
		fileNameOnly = tok.nextToken();<br/>
		fileNameOnly = InputSyntaxCheck.replace(fileNameOnly, "'", "''");<br/>
		fileNameOnly = InputSyntaxCheck.replace(fileNameOnly, "\\", "\\\\");<br/><br/>
		
		enc = this.getRandomBlah();<br/><br/>

		int nameLength = fileNameOnly.length();<br/>
		String fileType = fileNameOnly.substring(nameLength - 4, nameLength);<br/><br/>

		System.err.println("fileEnding is: " + fileType);<br/><br/>

		File uploadedFile = new File("/home/httpd/vhosts/***REPOSITORY DIRECTOY***documents/"+enc+"_"+fileNameOnly);<br/>
		if (!uploadedFile.exists()) {<br/><br/>

			try {<br/>
				item.write(uploadedFile);<br/>				
			} catch (Exception e) {<br/>
				System.err.println("Saving template to database failed: " + e);<br/>
				e.printStackTrace(System.err);<br/>
			}<br/>
			return true;<br/>
		}<br/>
		return false;<br/>
	}	<br/><br/><br/>
	
	
public String getRandomBlah() {<br/>
		StringBuffer buffer = new StringBuffer();<br/>
		Random random = new Random();<br/>
		char[] chars = new char[] { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};<br/>
		for ( int i = 0; i &lt; 5; i++ ) {<br/>
			buffer.append(chars[random.nextInt(chars.length)]);<br/>
		}<br/>
		return buffer.toString();<br/>
	}<br/><br/>
	
</xsl:when>
</xsl:choose>
</xsl:for-each>


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}<br/>
	



      			
    </td>
  </tr>
</table>
</xsl:template>
</xsl:stylesheet>
