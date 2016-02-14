<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
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
                    <br/>


                    <!-- DETAILS FOR THE DB ARE:
                    1 INT
                    2 STRING
                    3 DATE
                    4 PASSWORD
                    5 SESSION
                    6 FILE LOCATION
                    7 EMAIL
                    8 CURRENCY
                    9 FLOAT

                    <xsl:for-each select="//BeanAttribute">
                    <xsl:choose>
                    <xsl:when test="primaryKey=0">

                    ,
                    </xsl:when>
                    </xsl:choose>
                    </xsl:for-each>
                     -->


                    <b>Add<xsl:value-of select="//Bean/beanName"/>.xsl
                    </b>
                    <br/>
                    <br/>
                    <br/>

                    &lt;&#63;&#120;ml version="1.0"&#63;>
                    <br/>
                    &lt;xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                    xmlns="http://www.w3.org/tr/REC-html40">
                    <br/>
                    &lt;xsl:import href="GenericPageNetwork.xsl"/>
                    <br/>
                    &lt;xsl:output indent="no" encoding="iso-8859-1" method="html"
                    doctype-public="-//W3C//Dtd HTML 4.0 Transitional//EN"/>
                    <br/>
                    <br/>
                    &lt;xsl:template match="mainpage">
                    <br/>
                    <br/>
                    &lt;form action="Admin<xsl:value-of select="//Bean/beanName"/>?function=AddSave" method="post">
                    <br/>
                    <br/>
                    &lt;xsl:choose>
                    <br/>
                    <br/>
                    &lt;xsl:when test="//reason">
                    <br/>
                    <br/>
                    &lt;font color="red">&lt;xsl:value-of select="//reason" disable-output-escaping="yes"/>&lt;xsl:text>
                    &lt;/xsl:text>&lt;/font>
                    <br/>
                    <br/>
                    &lt;br/>&lt;br/>&lt;/xsl:when>
                    <br/>
                    <br/>
                    &lt;/xsl:choose>
                    <br/>
                    <br/>


                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=0">
                                <xsl:choose>
                                    <xsl:when test="formHidden=0">


                                        <xsl:choose>
                                            <xsl:when test="attTypeID=1">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=2">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=3">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="id">sel<xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">16&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="readonly">readonly&lt;/xsl:attribute>
                                                <br/>
                                                &lt;input type="image" src="/_resources/cal.gif" id='button<xsl:value-of
                                                    select="beanAttName"/>'/>
                                                <br/>
                                                <br/>
                                                &lt;script type="text/javascript">
                                                <br/>
                                                var cal = new Zapatec.Calendar.setup({
                                                <br/>
                                                <br/>

                                                inputField:"sel<xsl:value-of select="beanAttName"/>",
                                                <br/>
                                                ifFormat:"%Y-%m-%d",
                                                <br/>
                                                button:"button<xsl:value-of select="beanAttName"/>",
                                                <br/>
                                                showsTime:false
                                                <br/>
                                                <br/>

                                                });
                                                <br/>
                                                <br/>

                                                &lt;xsl:comment> JAVASCRIPT &lt;/xsl:comment>
                                                <br/>
                                                <br/>

                                                &lt;/script>
                                                <br/>

                                                <br/>

                                                &lt;/xsl:element>&lt;b>Click on calendar icon to select date&lt;/b>
                                                &lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=4">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">password&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=7">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=8">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=9">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>

                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>


                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=0">
                                <xsl:choose>
                                    <xsl:when test="formHidden=1">

                                        &lt;xsl:element name="input">
                                        <br/>
                                        &lt;xsl:attribute name="type">hidden&lt;/xsl:attribute>
                                        <br/>
                                        &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                        <br/>
                                        &lt;xsl:attribute name="value"><xsl:value-of select="//beanAttName"/>&lt;/xsl:attribute>
                                        <br/>
                                        &lt;/xsl:element>
                                        <br/>
                                        <br/>

                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>

                    &lt;input class="buttonwhite" type="submit" value="Create <xsl:value-of
                        select="//Bean/friendlyName"/>" name="save"/>&lt;br/>&lt;br/>
                    <br/>
                    <br/>

                    &lt;/form>
                    <br/>
                    <br/>

                    &lt;/xsl:template>
                    <br/>
                    <br/>

                    &lt;/xsl:stylesheet>
                    <br/>
                    <br/>
                    <br/>


                    <hr/>


                    <b>Edit<xsl:value-of select="//Bean/beanName"/>.xsl
                    </b>
                    <br/>
                    <br/>
                    <br/>

                    &lt;&#63;xml version="1.0"&#63;>
                    <br/>
                    &lt;xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                    xmlns="http://www.w3.org/tr/REC-html40">
                    <br/>
                    &lt;xsl:import href="GenericPageNetwork.xsl"/>
                    <br/>
                    &lt;xsl:output indent="no" encoding="iso-8859-1" method="html"
                    doctype-public="-//W3C//Dtd HTML 4.0 Transitional//EN"/>
                    <br/>
                    <br/>
                    &lt;xsl:template match="mainpage">
                    <br/>
                    <br/>
                    &lt;form action="Admin<xsl:value-of select="//Bean/beanName"/>?function=EditSave" method="post">
                    <br/>
                    <br/>
                    &lt;xsl:choose>
                    <br/>
                    <br/>
                    &lt;xsl:when test="//reason">
                    <br/>
                    <br/>
                    &lt;font color="red">&lt;xsl:value-of select="//reason" disable-output-escaping="yes"/>&lt;xsl:text>
                    &lt;/xsl:text>&lt;/font>
                    <br/>
                    <br/>
                    &lt;br/>&lt;br/>&lt;/xsl:when>
                    <br/>
                    <br/>
                    &lt;/xsl:choose>
                    <br/>
                    <br/>


                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=0">
                                <xsl:choose>
                                    <xsl:when test="formHidden=0">


                                        <xsl:choose>
                                            <xsl:when test="attTypeID=1">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="//Bean/beanName"/>/<xsl:value-of select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=2">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="//Bean/beanName"/>/<xsl:value-of select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=3">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="id">sel<xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">16&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="//Bean/beanName"/>/<xsl:value-of select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="readonly">readonly&lt;/xsl:attribute>
                                                <br/>
                                                &lt;input type="image" src="/_resources/cal.gif" id='button<xsl:value-of
                                                    select="beanAttName"/>'/>
                                                <br/>
                                                <br/>
                                                &lt;script type="text/javascript">
                                                <br/>
                                                var cal = new Zapatec.Calendar.setup({
                                                <br/>
                                                <br/>

                                                inputField:"sel<xsl:value-of select="beanAttName"/>",
                                                <br/>
                                                ifFormat:"%Y-%m-%d",
                                                <br/>
                                                button:"button<xsl:value-of select="beanAttName"/>",
                                                <br/>
                                                showsTime:false
                                                <br/>
                                                <br/>

                                                });
                                                <br/>
                                                <br/>

                                                &lt;xsl:comment> JAVASCRIPT &lt;/xsl:comment>
                                                <br/>
                                                <br/>

                                                &lt;/script>
                                                <br/>

                                                <br/>

                                                &lt;/xsl:element>&lt;b>Click on calendar icon to select date&lt;/b>
                                                &lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=4">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">password&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="//Bean/beanName"/>/<xsl:value-of select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=7">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="//Bean/beanName"/>/<xsl:value-of select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=8">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="//Bean/beanName"/>/<xsl:value-of select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=9">
                                                <xsl:value-of select="friendlyName"/>:
                                                <br/>
                                                &lt;xsl:element name="input">
                                                <br/>
                                                &lt;xsl:attribute name="type">text&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="size">20&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                                <br/>
                                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                                    select="//Bean/beanName"/>/<xsl:value-of select="beanAttName"/>"/>&lt;/xsl:attribute>
                                                <br/>
                                                &lt;/xsl:element>&lt;br/>&lt;br/>
                                                <br/>
                                                <br/>
                                            </xsl:when>
                                        </xsl:choose>

                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>


                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="formHidden=1">

                                &lt;xsl:element name="input">
                                <br/>
                                &lt;xsl:attribute name="type">hidden&lt;/xsl:attribute>
                                <br/>
                                &lt;xsl:attribute name="name"><xsl:value-of select="beanAttName"/>&lt;/xsl:attribute>
                                <br/>
                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                    select="//Bean/beanName"/>/<xsl:value-of select="beanAttName"/>"/>&lt;/xsl:attribute>
                                <br/>
                                &lt;/xsl:element>
                                <br/>
                                <br/>

                            </xsl:when>
                        </xsl:choose>

                    </xsl:for-each>

                    &lt;input class="buttonwhite" type="submit" value="Save changes to <xsl:value-of
                        select="//Bean/friendlyName"/>" name="save"/>&lt;br/>&lt;br/>
                    <br/>
                    <br/>

                    &lt;/form>
                    <br/>
                    <br/>

                    &lt;/xsl:template>
                    <br/>
                    <br/>

                    &lt;/xsl:stylesheet>
                    <br/>
                    <br/>
                    <br/>


                    <hr/>
                    <b>AddSave<xsl:value-of select="//Bean/beanName"/>.xsl
                    </b>
                    <br/>
                    <br/>
                    <br/>

                    &lt;&#63;&#120;ml version="1.0"&#63;>
                    <br/>
                    &lt;xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                    xmlns="http://www.w3.org/tr/REC-html40">
                    <br/>
                    &lt;xsl:import href="GenericPageNetwork.xsl"/>
                    <br/>
                    &lt;xsl:output indent="no" encoding="iso-8859-1" method="html"
                    doctype-public="-//W3C//Dtd HTML 4.0 Transitional//EN"/>
                    <br/>
                    <br/>
                    &lt;xsl:template match="mainpage">
                    <br/>
                    <br/>

                    &lt;xsl:choose>
                    <br/>
                    <br/>
                    &lt;xsl:when test="//reason">
                    <br/>
                    <br/>
                    &lt;font color="red">&lt;xsl:value-of select="//reason" disable-output-escaping="yes"/>&lt;xsl:text>
                    &lt;/xsl:text>&lt;/font>&lt;br/>&lt;br/>
                    <br/>
                    <br/>
                    &lt;/xsl:when>
                    <br/>
                    <br/>
                    &lt;/xsl:choose>
                    <br/>
                    <br/>


                    The
                    <xsl:value-of select="//Bean/friendlyName"/> have been saved.&lt;br/>&lt;br/>

                    &lt;/xsl:template>
                    <br/>
                    <br/>

                    &lt;/xsl:stylesheet>
                    <br/>
                    <br/>
                    <br/>

                    <hr/>
                    <b>EditSave<xsl:value-of select="//Bean/beanName"/>.xsl
                    </b>
                    <br/>
                    <br/>
                    <br/>

                    &lt;&#63;&#120;ml version="1.0"&#63;>
                    <br/>
                    &lt;xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                    xmlns="http://www.w3.org/tr/REC-html40">
                    <br/>
                    &lt;xsl:import href="GenericPageNetwork.xsl"/>
                    <br/>
                    &lt;xsl:output indent="no" encoding="iso-8859-1" method="html"
                    doctype-public="-//W3C//Dtd HTML 4.0 Transitional//EN"/>
                    <br/>
                    <br/>
                    &lt;xsl:template match="mainpage">
                    <br/>
                    <br/>

                    &lt;xsl:choose>
                    <br/>
                    <br/>
                    &lt;xsl:when test="//reason">
                    <br/>
                    <br/>
                    &lt;font color="red">&lt;xsl:value-of select="//reason" disable-output-escaping="yes"/>&lt;xsl:text>
                    &lt;/xsl:text>&lt;/font>
                    <br/>
                    <br/>
                    &lt;br/>&lt;br/>&lt;/xsl:when>
                    <br/>
                    <br/>
                    &lt;/xsl:choose>
                    <br/>
                    <br/>


                    The
                    <xsl:value-of select="//Bean/friendlyName"/> have been saved.&lt;br/>&lt;br/>

                    &lt;/xsl:template>
                    <br/>
                    <br/>

                    &lt;/xsl:stylesheet>
                    <br/>
                    <br/>
                    <br/>

                    <hr/>


                    <b>View<xsl:value-of select="//Bean/beanName"/>.xsl
                    </b>
                    <br/>
                    <br/>
                    <br/>

                    &lt;&#63;xml version="1.0"&#63;>
                    <br/>
                    &lt;xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                    xmlns="http://www.w3.org/tr/REC-html40">
                    <br/>
                    &lt;xsl:import href="GenericPageNetwork.xsl"/>
                    <br/>
                    &lt;xsl:output indent="no" encoding="iso-8859-1" method="html"
                    doctype-public="-//W3C//Dtd HTML 4.0 Transitional//EN"/>
                    <br/>
                    <br/>
                    &lt;xsl:template match="mainpage">
                    <br/>
                    <br/>

                    &lt;xsl:choose>
                    <br/>
                    <br/>
                    &lt;xsl:when test="//reason">
                    <br/>
                    <br/>
                    &lt;font color="red">&lt;xsl:value-of select="//reason" disable-output-escaping="yes"/>&lt;xsl:text>
                    &lt;/xsl:text>&lt;/font>
                    <br/>
                    <br/>
                    &lt;br/>&lt;br/>&lt;/xsl:when>
                    <br/>
                    <br/>
                    &lt;/xsl:choose>
                    <br/>
                    <br/>


                    <xsl:for-each select="//BeanAttribute">
                        &lt;b><xsl:value-of select="friendlyName"/>:&lt;/b>&lt;br/>
                        &lt;xsl:value-of select="//<xsl:value-of select="//Bean/beanName"/>/<xsl:value-of
                            select="beanAttName"/>"/>
                        &lt;br/>&lt;br/>
                        <br/>
                        <br/>
                    </xsl:for-each>

                    &lt;xsl:element name="a">
                    <br/>
                    &lt;xsl:attribute name="href">Admin<xsl:value-of select="//Bean/beanName"/>?function=Edit&amp;
                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>=&lt;xsl:value-of select="<xsl:value-of
                                    select="beanAttName"/>"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <br/>
                    &lt;/xsl:attribute>
                    <br/>
                    Edit this
                    <xsl:value-of select="//Bean/friendlyName"/>
                    <br/>
                    &lt;/xsl:element>
                    <br/>

                    &lt;/xsl:template>
                    <br/>
                    <br/>

                    &lt;/xsl:stylesheet>
                    <br/>
                    <br/>
                    <br/>


                    <hr/>


                    <b>Delete<xsl:value-of select="//Bean/beanName"/>.xsl
                    </b>
                    <br/>
                    <br/>
                    <br/>

                    &lt;&#63;xml version="1.0"&#63;>
                    <br/>
                    &lt;xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                    xmlns="http://www.w3.org/tr/REC-html40">
                    <br/>
                    &lt;xsl:import href="GenericPageNetwork.xsl"/>
                    <br/>
                    &lt;xsl:output indent="no" encoding="iso-8859-1" method="html"
                    doctype-public="-//W3C//Dtd HTML 4.0 Transitional//EN"/>
                    <br/>
                    <br/>
                    &lt;xsl:template match="mainpage">
                    <br/>
                    <br/>

                    &lt;xsl:choose>
                    <br/>
                    <br/>
                    &lt;xsl:when test="//reason">
                    <br/>
                    <br/>
                    &lt;font color="red">&lt;xsl:value-of select="//reason" disable-output-escaping="yes"/>&lt;xsl:text>
                    &lt;/xsl:text>&lt;/font>
                    <br/>
                    <br/>
                    &lt;br/>&lt;br/>&lt;/xsl:when>
                    <br/>
                    <br/>
                    &lt;/xsl:choose>
                    <br/>
                    <br/>

                    Confirm deletion&lt;br/>&lt;br/>
                    <br/>
                    <br/>
                    <xsl:for-each select="//BeanAttribute">
                        &lt;b><xsl:value-of select="friendlyName"/>:&lt;/b>&lt;br/>
                        <xsl:value-of select="//Bean/beanName"/>/<xsl:value-of select="beanAttName"/>"/>
                        &lt;br/>&lt;br/>
                        <br/>
                    </xsl:for-each>
                    <br/>
                    <br/>
                    &lt;xsl:element name="a">
                    <br/>
                    &lt;xsl:attribute name="href">Admin<xsl:value-of select="//Bean/beanName"/>?function=DeleteSave&amp;amp;
                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>=&lt;xsl:value-of select="<xsl:value-of
                                    select="beanAttName"/>"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    &lt;/xsl:attribute>
                    <br/>
                    Delete this
                    <xsl:value-of select="//Bean/friendlyName"/>
                    <br/>
                    &lt;/xsl:element>
                    <br/>
                    <br/>

                    &lt;/xsl:template>
                    <br/>
                    <br/>

                    &lt;/xsl:stylesheet>
                    <br/>
                    <br/>
                    <br/>

                    <hr/>
                    <b>DeleteSave<xsl:value-of select="//Bean/beanName"/>.xsl
                    </b>
                    <br/>
                    <br/>
                    <br/>

                    &lt;&#63;&#120;ml version="1.0"&#63;>
                    <br/>
                    &lt;xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                    xmlns="http://www.w3.org/tr/REC-html40">
                    <br/>
                    &lt;xsl:import href="GenericPageNetwork.xsl"/>
                    <br/>
                    &lt;xsl:output indent="no" encoding="iso-8859-1" method="html"
                    doctype-public="-//W3C//Dtd HTML 4.0 Transitional//EN"/>
                    <br/>
                    <br/>
                    &lt;xsl:template match="mainpage">
                    <br/>
                    <br/>


                    The
                    <xsl:value-of select="//Bean/friendlyName"/> have been deleted.&lt;br/>&lt;br/>

                    &lt;/xsl:template>
                    <br/>
                    <br/>

                    &lt;/xsl:stylesheet>
                    <br/>
                    <br/>
                    <br/>

                    <hr/>
                    <br/>
                    <br/>


                    <b>ViewAll<xsl:value-of select="//Bean/beanName"/>.xsl
                    </b>
                    <br/>
                    <br/>
                    <br/>

                    &lt;&#63;xml version="1.0"&#63;>
                    <br/>
                    &lt;xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                    xmlns="http://www.w3.org/tr/REC-html40">
                    <br/>
                    &lt;xsl:import href="GenericPageNetwork.xsl"/>
                    <br/>
                    &lt;xsl:output indent="no" encoding="iso-8859-1" method="html"
                    doctype-public="-//W3C//Dtd HTML 4.0 Transitional//EN"/>
                    <br/>
                    <br/>
                    &lt;xsl:template match="mainpage">
                    <br/>
                    <br/>

                    <xsl:for-each select="//Bean">
                        <xsl:variable name="thisBeanID">
                            <xsl:value-of select="beanID"/>
                        </xsl:variable>

                        &lt;xsl:for-each select="//<xsl:value-of select="//Bean/beanName"/>">
                        &lt;xsl:variable name="this
                        <xsl:for-each select="//BeanAttribute">
                            <xsl:choose>
                                <xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>">&lt;xsl:value-of
                                    select="<xsl:value-of select="beanAttName"/>"/>&lt;/xsl:variable>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>


                        <xsl:for-each select="//BeanAttribute">
                            <xsl:choose>
                                <xsl:when test="beanID=$thisBeanID">
                                    <br/>
                                    <br/>

                                    &lt;b><xsl:value-of select="friendlyName"/>:&lt;/b>&lt;br/>
                                    &lt;xsl:value-of select="<xsl:value-of select="beanAttName"/>"/>
                                    &lt;br/>&lt;br/>
                                    <br/>
                                    <br/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                        <br/>
                        &lt;xsl:element name="a">
                        <br/>
                        &lt;xsl:attribute name="href">Admin<xsl:value-of select="//Bean/beanName"/>?function=Edit&amp;
                        <xsl:for-each select="//BeanAttribute">
                            <xsl:choose>
                                <xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>=&lt;xsl:value-of
                                    select="<xsl:value-of select="$thisBeanID"/>"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                        <br/>
                        &lt;/xsl:attribute>
                        <br/>
                        Edit this
                        <xsl:value-of select="//Bean/friendlyName"/>
                        <br/>
                        &lt;/xsl:element>
                        <br/>
                        &lt;xsl:element name="a">
                        <br/>
                        &lt;xsl:attribute name="href">Admin<xsl:value-of select="//Bean/beanName"/>?function=Delete&amp;amp;
                        <xsl:for-each select="//BeanAttribute">
                            <xsl:choose>
                                <xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>=&lt;xsl:value-of
                                    select="<xsl:value-of select="$thisBeanID"/>"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                        <br/>
                        &lt;/xsl:attribute>
                        <br/>
                        Delete this
                        <xsl:value-of select="//Bean/friendlyName"/>
                        <br/>
                        &lt;/xsl:element>
                        <br/>

                        <br/>
                        <br/>
                        &lt;/xsl:for-each>
                    </xsl:for-each>


                    &lt;/xsl:template>
                    <br/>
                    <br/>

                    &lt;/xsl:stylesheet>
                    <br/>
                    <br/>
                    <br/>


                    <hr/>

                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="attTypeID=6">


                                <b>Upload<xsl:value-of select="//Bean/beanName"/>.xsl
                                </b>
                                <br/>
                                <br/>
                                <br/>

                                &lt;&#63;xml version="1.0"&#63;>
                                <br/>
                                &lt;xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                                xmlns="http://www.w3.org/tr/REC-html40">
                                <br/>
                                &lt;xsl:import href="GenericPageNetwork.xsl"/>
                                <br/>
                                &lt;xsl:output indent="no" encoding="iso-8859-1" method="html"
                                doctype-public="-//W3C//Dtd HTML 4.0 Transitional//EN"/>
                                <br/>
                                <br/>
                                &lt;xsl:template match="mainpage">
                                <br/>
                                <br/>
                                &lt;form action="Admin<xsl:value-of select="//Bean/beanName"/>?function=UploadSave"
                                method="post">
                                <br/>
                                <br/>
                                &lt;xsl:choose>
                                <br/>
                                <br/>
                                &lt;xsl:when test="//reason">
                                <br/>
                                <br/>
                                &lt;font color="red">&lt;xsl:value-of select="//reason" disable-output-escaping="yes"/>&lt;xsl:text>
                                &lt;/xsl:text>&lt;/font>
                                <br/>
                                <br/>
                                &lt;br/>&lt;br/>&lt;/xsl:when>
                                <br/>
                                <br/>
                                &lt;/xsl:choose>
                                <br/>
                                <br/>

                                Select the file to upload:
                                &lt;br/>
                                <br/>
                                &lt;xsl:element name="input">
                                <br/>
                                &lt;xsl:attribute name="type">file&lt;/xsl:attribute>
                                <br/>
                                &lt;xsl:attribute name="size">25&lt;/xsl:attribute>
                                <br/>
                                &lt;xsl:attribute name="class">main_content&lt;/xsl:attribute>
                                <br/>
                                &lt;xsl:attribute name="name">fileName&lt;/xsl:attribute>
                                <br/>
                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//
                                <xsl:for-each select="//BeanAttribute">
                                    <xsl:choose>
                                        <xsl:when test="primaryKey=1">
                                            <xsl:value-of select="beanAttName"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                                "/>&lt;/xsl:attribute>
                                <br/>
                                &lt;/xsl:element>
                                <br/>
                                <br/>


                                &lt;xsl:element name="input">
                                <br/>
                                &lt;xsl:attribute name="type">hidden&lt;/xsl:attribute>
                                <br/>
                                &lt;xsl:attribute name="name">
                                <xsl:for-each select="//BeanAttribute">
                                    <xsl:choose>
                                        <xsl:when test="primaryKey=1">
                                            <xsl:value-of select="beanAttName"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                                &lt;/xsl:attribute>
                                <br/>
                                &lt;xsl:attribute name="value">&lt;xsl:value-of select="//<xsl:value-of
                                    select="//Bean/beanName"/>/
                                <xsl:for-each select="//BeanAttribute">
                                    <xsl:choose>
                                        <xsl:when test="primaryKey=1">
                                            <xsl:value-of select="beanAttName"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                                "/>&lt;/xsl:attribute>
                                <br/>
                                &lt;/xsl:element>
                                <br/>
                                <br/>


                                &lt;input class="buttonwhite" type="submit" value="Upload File" name="save"/>&lt;br/>&lt;br/>
                                <br/>
                                <br/>

                                &lt;/form>
                                <br/>
                                <br/>

                                &lt;/xsl:template>
                                <br/>
                                <br/>

                                &lt;/xsl:stylesheet>
                                <br/>
                                <br/>
                                <br/>


                                <hr/>
                                <b>UploadSave<xsl:value-of select="//Bean/beanName"/>.xsl
                                </b>
                                <br/>
                                <br/>
                                <br/>

                                &lt;&#63;&#120;ml version="1.0"&#63;>
                                <br/>
                                &lt;xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                                xmlns="http://www.w3.org/tr/REC-html40">
                                <br/>
                                &lt;xsl:import href="GenericPageNetwork.xsl"/>
                                <br/>
                                &lt;xsl:output indent="no" encoding="iso-8859-1" method="html"
                                doctype-public="-//W3C//Dtd HTML 4.0 Transitional//EN"/>
                                <br/>
                                <br/>
                                &lt;xsl:template match="mainpage">
                                <br/>
                                <br/>


                                The
                                <xsl:value-of select="//Bean/friendlyName"/> file has been uploaded.&lt;br/>&lt;br/>

                                &lt;/xsl:template>
                                <br/>
                                <br/>

                                &lt;/xsl:stylesheet>
                                <br/>
                                <br/>
                                <br/>

                                <hr/>
                                <br/>
                                <br/>


                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>


                </td>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>
