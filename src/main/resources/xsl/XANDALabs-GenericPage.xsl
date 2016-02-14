<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns="http://www.w3.org/TR/REC-html40">
    <xsl:output indent="no" encoding="iso-8859-1" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="page">
        <html>
            <head>
                <title>XANDAlabs</title>
                <link href="/xandalabs_resources/xandalabs.css" type="text/css" rel="stylesheet"/>

                <script src="/xandalabs_resources/prototype.js" type="text/javascript">
                    <xsl:comment>JavaScript</xsl:comment>
                </script>

                <script src="/xandalabs_resources/scriptaculous.js" type="text/javascript">
                    <xsl:comment>JavaScript</xsl:comment>
                </script>

            </head>
            <body>

                <img src="/xandalabs_resources/xandalabs.jpg"/>
                <br/>
                <br/>
                <hr/>
                <br/>
                <br/>
                <span class="plain_text">
                    <xsl:apply-templates select="mainpage"/>
                </span>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
