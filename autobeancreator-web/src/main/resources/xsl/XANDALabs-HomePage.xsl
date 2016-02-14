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
    		<td align="left" valign="middle" class="plain_text">
    		
    	
<a href="JavaProjectCreator?function=CreateBean&amp;beanID=">Create Bean</a>
<br/><br/>
<a href="JavaProjectCreator?function=CreateServlet&amp;beanID=">Create Servlet</a>
<br/><br/>
<a href="JavaProjectCreator?function=CreateXSL&amp;beanID=">Create XSL</a>
<br/><br/>
      			
    </td>
  </tr>
</table>
</xsl:template>
</xsl:stylesheet>
