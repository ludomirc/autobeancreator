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


                    <b>Bean Creation for
                        <xsl:value-of select="//Bean/beanName"/>
                    </b>
                    <br/>
                    <br/>
                    <br/>

                    import java.sql.Connection;
                    <br/>
                    import java.sql.ResultSet;
                    <br/>
                    import java.sql.Statement;
                    <br/>
                    import javax.servlet.http.HttpSession;
                    <br/>
                    import org.w3c.dom.Document;
                    <br/>
                    import org.w3c.dom.Element;
                    <br/>
                    <br/>
                    /**
                    <br/>
                    * This class deals with
                    <xsl:value-of select="//Bean/beanName"/> objects. It contains the constructor, load and
                    <br/>
                    * save methods for the <xsl:value-of select="//Bean/beanName"/>, as well as get and set methods for
                    the attributes
                    <br/>
                    * the object contains.
                    <br/>
                    */
                    <br/>
                    <br/>
                    public class
                    <xsl:value-of select="//Bean/beanName"/> extends AbstractItem {
                    <br/>
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
                     -->

                    <!-- ATTRIBUTE DECLARATION -->
                    <br/>
                    <xsl:for-each select="//BeanAttribute">

                        private<xsl:text> </xsl:text>
                        <xsl:choose>
                            <xsl:when test="attTypeID=1">int
                                <xsl:value-of select="beanAttName"/> = 0;
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=2">String
                                <xsl:value-of select="beanAttName"/> = "";
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=3">String
                                <xsl:value-of select="beanAttName"/> = "";
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=4">String
                                <xsl:value-of select="beanAttName"/> = "";
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=5">HttpSession
                                <xsl:value-of select="beanAttName"/> = null;
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=6">String
                                <xsl:value-of select="beanAttName"/> = "";
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=7">String
                                <xsl:value-of select="beanAttName"/> = "";
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=8">int
                                <xsl:value-of select="beanAttName"/> = 0;
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=9">float
                                <xsl:value-of select="beanAttName"/> = 0;
                            </xsl:when>
                        </xsl:choose>
                        <br/>
                    </xsl:for-each>
                    <br/>
                    <br/>
                    /**
                    <br/>
                    * The constructor methods for a
                    <xsl:value-of select="//Bean/beanName"/>
                    <br/>
                    */
                    <br/>
                    <br/>
                    public final static
                    <xsl:value-of select="//Bean/beanName"/> Null = new <xsl:value-of select="//Bean/beanName"/>(
                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="attTypeID=1">0</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=2">""</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=3">""</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=4">""</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=5">null</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=6">""</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=7">""</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=8">0</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=9">0</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="position()=last()"></xsl:when>
                            <xsl:otherwise>,</xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    );
                    <br/>
                    <br/>
                    private <xsl:value-of select="//Bean/beanName"/>(
                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="attTypeID=1">int
                                <xsl:value-of select="beanAttName"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=2">String
                                <xsl:value-of select="beanAttName"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=3">String
                                <xsl:value-of select="beanAttName"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=4">String
                                <xsl:value-of select="beanAttName"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=5">HttpSession
                                <xsl:value-of select="beanAttName"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=6">String
                                <xsl:value-of select="beanAttName"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=7">String
                                <xsl:value-of select="beanAttName"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=8">int
                                <xsl:value-of select="beanAttName"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=9">float
                                <xsl:value-of select="beanAttName"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="position()=last()"></xsl:when>
                            <xsl:otherwise>,</xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    ) {
                    <br/>
                    <br/>
                    <xsl:for-each select="//BeanAttribute">
                        this.<xsl:value-of select="beanAttName"/>=<xsl:value-of select="beanAttName"/>;
                        <br/>
                    </xsl:for-each>
                    }
                    <br/>
                    <br/>

                    /* CREATE NEW FUNCTION */
                    <br/>
                    <br/>
                    public static int createNew(
                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=0">
                                <xsl:choose>
                                    <xsl:when test="attTypeID=1">int
                                        <xsl:value-of select="beanAttName"/>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="attTypeID=2">String
                                        <xsl:value-of select="beanAttName"/>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="attTypeID=3">String
                                        <xsl:value-of select="beanAttName"/>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="attTypeID=4">String
                                        <xsl:value-of select="beanAttName"/>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="attTypeID=5">HttpSession
                                        <xsl:value-of select="beanAttName"/>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="attTypeID=6">String
                                        <xsl:value-of select="beanAttName"/>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="attTypeID=7">String
                                        <xsl:value-of select="beanAttName"/>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="attTypeID=8">int
                                        <xsl:value-of select="beanAttName"/>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="attTypeID=9">float
                                        <xsl:value-of select="beanAttName"/>
                                    </xsl:when>
                                </xsl:choose>
                                ,
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    Connection con) {
                    <br/>
                    try {
                    <br/>
                    Statement stmt = con.createStatement();
                    <br/>
                    int updater = stmt.executeUpdate("INSERT INTO
                    <xsl:value-of select="//Bean/beanNameLowerCase"/> VALUES('',

                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=0">
                                <xsl:choose>
                                    <xsl:when test="attTypeID=5">''</xsl:when>
                                    <xsl:otherwise>
                                        '"+<xsl:value-of select="beanAttName"/>+"'
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="position()=last()"></xsl:when>
                                    <xsl:otherwise>,</xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    );");
                    <br/>
                    <br/>
                    ResultSet res = stmt.executeQuery("SELECT
                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=1">
                                <xsl:value-of select="beanAttName"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    FROM
                    <xsl:value-of select="//Bean/beanNameLowerCase"/> WHERE
                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=0">
                                <xsl:choose>
                                    <xsl:when test="attTypeID=5">
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="beanAttName"/>='"+<xsl:value-of select="beanAttName"/>+"'
                                        <xsl:choose>
                                            <xsl:when test="position()=last()">
                                            </xsl:when>
                                            <xsl:otherwise>,
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    ;");
                    <br/>
                    res.next();
                    <br/>
                    return res.getInt(1);
                    <br/>
                    }
                    <br/>
                    catch(Exception e) {
                    <br/>
                    System.err.println("Error in creating new
                    <xsl:value-of select="//Bean/beanName"/> from Database: "+e);
                    <br/>
                    e.printStackTrace(System.err);
                    <br/>
                    return 0;
                    <br/>
                    }
                    <br/>
                    }
                    <br/>
                    <br/>
                    <br/>

                    /** DELETE FUNCTION **/
                    <br/>
                    <br/>
                    public boolean delete(int
                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=1">
                                <xsl:value-of select="beanAttName"/>
                                , Connection con) {
                                <br/>
                                try {
                                <br/>
                                Statement stmt = con.createStatement();
                                <br/>
                                int updater = stmt.executeUpdate("DELETE FROM
                                <xsl:value-of select="//Bean/beanNameLowerCase"/> WHERE
                                <xsl:value-of select="beanAttName"/> = '" +
                                <xsl:value-of select="beanAttName"/> + "';");
                                <br/>
                                return true;
                                <br/>
                                } catch (Exception e) {
                                <br/>
                                System.err.println("Error in deleting
                                <xsl:value-of select="//Bean/beanName"/> from Database: "+e);
                                <br/>
                                e.printStackTrace(System.err);
                                <br/>
                                }
                                <br/>
                                return false;
                                <br/>
                                }
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <br/>
                    <br/>

                    /** STANDARD LOAD FUNCTIONS */
                    <br/>
                    <br/>
                    public static <xsl:value-of select="//Bean/beanName"/>[] loadAll(Connection con){
                    <br/>
                    try {
                    <br/>
                    Statement stmt = con.createStatement();
                    <br/>
                    ResultSet res2 = stmt.executeQuery("SELECT COUNT(*)

                    * FROM <xsl:value-of select="//Bean/beanNameLowerCase"/>;");
                    <br/>
                    <br/>
                    res2.next();
                    <br/>
                    int count = res2.getInt(1);
                    <br/>
                    <xsl:value-of select="//Bean/beanName"/>[] all<xsl:value-of select="//Bean/beanName"/> = new
                    <xsl:value-of select="//Bean/beanName"/>[count];
                    ResultSet res = stmt.executeQuery("SELECT *

                    FROM
                    <xsl:value-of select="//Bean/beanNameLowerCase"/> ;");
                    <br/>
                    <br/>

                    for (int i = 0; i &lt; count; i++) {
                    <br/>
                    res.next();
                    <br/>
                    all<xsl:value-of select="//Bean/beanName"/>[i] = new <xsl:value-of select="//Bean/beanName"/>(

                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="attTypeID=1">res.getInt("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=2">res.getString("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=3">res.getString("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=4">res.getString("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=5">null</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=6">res.getString("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=7">res.getString("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=8">res.getInt("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=9">res.getFloat <xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="position()=last()"></xsl:when>
                            <xsl:otherwise>,</xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    );
                    <br/>
                    }
                    <br/>
                    return all<xsl:value-of select="//Bean/beanName"/>;
                    <br/>
                    } catch (Exception e) {
                    <br/>
                    System.err.println("Failed to load
                    <xsl:value-of select="//Bean/beanName"/> from Database: "+e);
                    <br/>
                    e.printStackTrace(System.err);
                    <br/>
                    <xsl:value-of select="//Bean/beanName"/>[] empty = new <xsl:value-of select="//Bean/beanName"/>[0];
                    <br/>
                    return empty;
                    <br/>
                    }
                    <br/>
                    }
                    <br/>
                    <br/>
                    <br/>
                    public static
                    <xsl:value-of select="//Bean/beanName"/> loadByID(int
                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=1">
                                <xsl:value-of select="beanAttName"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    , Connection con) {
                    <br/>
                    try {
                    <br/>
                    Statement stmt = con.createStatement();
                    <br/>
                    ResultSet res = stmt.executeQuery("SELECT *

                    FROM
                    <xsl:value-of select="//Bean/beanNameLowerCase"/> WHERE
                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="primaryKey=1"><xsl:value-of select="beanAttName"/>='"+<xsl:value-of
                                    select="beanAttName"/>+"'
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    ;");
                    <br/>
                    <br/>

                    if (res.next()){ {
                    <br/>
                    return new <xsl:value-of select="//Bean/beanName"/>(

                    <xsl:for-each select="//BeanAttribute">
                        <xsl:choose>
                            <xsl:when test="attTypeID=1">res.getInt("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=2">res.getString("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=3">res.getString("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=4">res.getString("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=5">null</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=6">res.getString("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=7">res.getString("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=8">res.getInt("<xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=9">res.getFloat <xsl:value-of select="beanAttName"/>")
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="position()=last()"></xsl:when>
                            <xsl:otherwise>,</xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    );
                    <br/>
                    }
                    <br/>
                    return <xsl:value-of select="//Bean/beanName"/>.Null;
                    <br/>
                    } catch (Exception e) {
                    <br/>
                    System.err.println("Failed to load
                    <xsl:value-of select="//Bean/beanName"/> from Database: "+e);
                    <br/>
                    e.printStackTrace(System.err);
                    <br/>
                    return <xsl:value-of select="//Bean/beanName"/>.Null;
                    <br/>
                    }
                    <br/>
                    }
                    <br/>


                    <br/>
                    <br/>
                    /** NON STANDARD LOAD FUNCTIONS */
                    <br/>
                    <br/>

                    <xsl:for-each select="//BeanLoad">
                        <xsl:variable name="thisBLID">
                            <xsl:value-of select="blID"/>
                        </xsl:variable>

                        <xsl:choose>
                            <xsl:when test="bltID=1">
                                public static
                                <xsl:value-of select="//Bean/beanName"/> load<xsl:value-of select="blName"/>(

                                <xsl:for-each select="//BeanLoadAttribute">
                                    <xsl:choose>
                                        <xsl:when test="blID=$thisBLID">
                                            <xsl:variable name="thisBLAtt">
                                                <xsl:value-of select="beanAttID"/>
                                            </xsl:variable>

                                            <xsl:for-each select="//BeanAttribute">
                                                <xsl:choose>
                                                    <xsl:when test="beanAttID=$thisBLAtt">

                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=1">int
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=2">String
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=3">String
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=4">String
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=5">HttpSession
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=6">String
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=7">String
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=8">int
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=9">float
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        ,
                                                        <xsl:text> </xsl:text>

                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:for-each>

                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>

                                Connection con) {
                                <br/>
                                <br/>
                                try {
                                <br/>
                                Statement stmt = con.createStatement();
                                <br/>
                                ResultSet res = stmt.executeQuery("SELECT * FROM
                                <xsl:value-of select="//Bean/beanNameLowerCase"/> WHERE

                                <xsl:for-each select="//BeanLoadAttribute">
                                    <xsl:choose>
                                        <xsl:when test="blID=$thisBLID">
                                            <xsl:variable name="thisBLAtt">
                                                <xsl:value-of select="beanAttID"/>
                                            </xsl:variable>

                                            <xsl:for-each select="//BeanAttribute">
                                                <xsl:choose>
                                                    <xsl:when test="beanAttID=$thisBLAtt">

                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=4">
                                                                <xsl:value-of
                                                                        select="beanAttName"/>=PASSWORD('"+<xsl:value-of
                                                                    select="beanAttName"/>+"') AND<xsl:text> </xsl:text>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:value-of select="beanAttName"/>='"+<xsl:value-of
                                                                    select="beanAttName"/>+"' AND
                                                                <xsl:text> </xsl:text>
                                                            </xsl:otherwise>
                                                        </xsl:choose>


                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:for-each>

                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                                ;");
                                <br/>
                                <br/>

                                if (res.next()) {
                                <br/>
                                return new <xsl:value-of select="//Bean/beanName"/>(

                                <xsl:for-each select="//BeanAttribute">
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=1">res.getInt("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=2">res.getString("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=3">res.getString("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=4">res.getString("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=5">null</xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=6">res.getString("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=7">res.getString("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=8">res.getInt("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=9">res.getFloat <xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="position()=last()"></xsl:when>
                                        <xsl:otherwise>,</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                                );

                                } else {
                                <br/>
                                return <xsl:value-of select="//Bean/beanName"/>.Null;
                                <br/>
                                }
                                <br/>
                                } catch (Exception e) {
                                <br/>
                                System.err.println("Failed to load
                                <xsl:value-of select="//Bean/beanName"/> from Database" + e);
                                <br/>
                                return <xsl:value-of select="//Bean/beanName"/>.Null;
                                <br/>
                                }
                                <br/>
                                }

                            </xsl:when>
                        </xsl:choose>

                        <xsl:choose>
                            <xsl:when test="bltID=2">
                                public static <xsl:value-of select="//Bean/beanName"/>[] load<xsl:value-of
                                    select="blName"/>(

                                <xsl:for-each select="//BeanLoadAttribute">
                                    <xsl:choose>
                                        <xsl:when test="blID=$thisBLID">
                                            <xsl:variable name="thisBLAtt">
                                                <xsl:value-of select="beanAttID"/>
                                            </xsl:variable>

                                            <xsl:for-each select="//BeanAttribute">
                                                <xsl:choose>
                                                    <xsl:when test="beanAttID=$thisBLAtt">

                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=1">int
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=2">String
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=3">String
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=4">String
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=5">HttpSession
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=6">String
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=7">String
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=8">int
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=9">float
                                                                <xsl:value-of select="beanAttName"/>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                        ,
                                                        <xsl:text> </xsl:text>

                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:for-each>

                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>

                                Connection con) {
                                <br/>
                                <br/>
                                try {
                                <br/>
                                Statement stmt = con.createStatement();
                                <br/>
                                ResultSet res2 = stmt.executeQuery("SELECT COUNT(*)

                                * FROM
                                <xsl:value-of select="//Bean/beanNameLowerCase"/> WHERE

                                <xsl:for-each select="//BeanLoadAttribute">
                                    <xsl:choose>
                                        <xsl:when test="blID=$thisBLID">
                                            <xsl:variable name="thisBLAtt">
                                                <xsl:value-of select="beanAttID"/>
                                            </xsl:variable>

                                            <xsl:for-each select="//BeanAttribute">
                                                <xsl:choose>
                                                    <xsl:when test="beanAttID=$thisBLAtt">

                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=4">
                                                                <xsl:value-of
                                                                        select="beanAttName"/>=PASSWORD('"+<xsl:value-of
                                                                    select="beanAttName"/>+"') AND<xsl:text> </xsl:text>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:value-of select="beanAttName"/>='"+<xsl:value-of
                                                                    select="beanAttName"/>+"' AND
                                                                <xsl:text> </xsl:text>
                                                            </xsl:otherwise>
                                                        </xsl:choose>


                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:for-each>

                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                                ;");
                                <br/>
                                <br/>
                                res2.next();
                                <br/>
                                int count = res2.getInt(1);
                                <br/>
                                <xsl:value-of select="//Bean/beanName"/>[] all<xsl:value-of select="//Bean/beanName"/> =
                                new <xsl:value-of select="//Bean/beanName"/>[count];
                                ResultSet res = stmt.executeQuery("SELECT *

                                FROM
                                <xsl:value-of select="//Bean/beanNameLowerCase"/> WHERE

                                <xsl:for-each select="//BeanLoadAttribute">
                                    <xsl:choose>
                                        <xsl:when test="blID=$thisBLID">
                                            <xsl:variable name="thisBLAtt">
                                                <xsl:value-of select="beanAttID"/>
                                            </xsl:variable>

                                            <xsl:for-each select="//BeanAttribute">
                                                <xsl:choose>
                                                    <xsl:when test="beanAttID=$thisBLAtt">

                                                        <xsl:choose>
                                                            <xsl:when test="attTypeID=4">
                                                                <xsl:value-of
                                                                        select="beanAttName"/>=PASSWORD('"+<xsl:value-of
                                                                    select="beanAttName"/>+"') AND<xsl:text> </xsl:text>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:value-of select="beanAttName"/>='"+<xsl:value-of
                                                                    select="beanAttName"/>+"' AND
                                                                <xsl:text> </xsl:text>
                                                            </xsl:otherwise>
                                                        </xsl:choose>


                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:for-each>

                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                                ;");
                                <br/>
                                <br/>

                                for (int i = 0; i &lt; count; i++) {
                                <br/>
                                res.next();
                                <br/>
                                all<xsl:value-of select="//Bean/beanName"/>[i] = new <xsl:value-of
                                    select="//Bean/beanName"/>(

                                <xsl:for-each select="//BeanAttribute">
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=1">res.getInt("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=2">res.getString("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=3">res.getString("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=4">res.getString("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=5">null</xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=6">res.getString("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=7">res.getString("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=8">res.getInt("<xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="attTypeID=9">res.getFloat <xsl:value-of select="beanAttName"/>")
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="position()=last()"></xsl:when>
                                        <xsl:otherwise>,</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                                );
                                <br/>
                                }
                                <br/>
                                return all<xsl:value-of select="//Bean/beanName"/>;
                                <br/>
                                } catch (Exception e) {
                                <br/>
                                System.err.println("Failed to load
                                <xsl:value-of select="//Bean/beanName"/> from Database: "+e);
                                <br/>
                                e.printStackTrace(System.err);
                                <br/>
                                <xsl:value-of select="//Bean/beanName"/>[] empty = new <xsl:value-of
                                    select="//Bean/beanName"/>[0];
                                <br/>
                                return empty;
                                <br/>
                                }
                                <br/>
                                }

                            </xsl:when>
                        </xsl:choose>


                        <br/>
                        <br/>
                        <br/>
                    </xsl:for-each>

                    <br/>
                    <br/>
                    /* SAVE FUNCTION */
                    <br/>
                    <br/>
                    <xsl:choose>
                        <xsl:when test="//hasSession">
                            public boolean save(Connection con) {
                            <br/>
                            if (
                            <xsl:for-each select="//BeanAttribute">
                                <xsl:choose>
                                    <xsl:when test="attTypeID=5">
                                        <xsl:value-of select="beanAttName"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:for-each>
                            == null){
                            <br/>
                            try {
                            <br/>
                            Statement stmt = con.createStatement();
                            <br/>
                            int updater = stmt.executeUpdate("UPDATE
                            <xsl:value-of select="//Bean/beanNameLowerCase"/> SET
                            <xsl:for-each select="//BeanAttribute">
                                <xsl:choose>
                                    <xsl:when test="primaryKey=0">
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=5"><xsl:value-of select="beanAttName"/>=''
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="beanAttName"/>='"+<xsl:value-of
                                                    select="beanAttName"/>+"'
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="position()=last()">
                                            </xsl:when>
                                            <xsl:otherwise>,
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:for-each>
                            WHERE
                            <xsl:for-each select="//BeanAttribute">
                                <xsl:choose>
                                    <xsl:when test="primaryKey=1">
                                        <xsl:value-of select="beanAttName"/> = '" +
                                        <xsl:value-of select="beanAttName"/> + "';");
                                        <br/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:for-each>
                            return true;
                            <br/>
                            } catch (Exception e) {
                            <br/>
                            System.err.println("Error in saving updates to
                            <xsl:value-of select="//Bean/beanName"/> " + e);
                            <br/>
                            e.printStackTrace(System.err);
                            <br/>
                            }
                            <br/>
                            return false;
                            <br/>
                            } else {
                            <br/>
                            try {
                            <br/>
                            Statement stmt = con.createStatement();
                            <br/>
                            int updater = stmt.executeUpdate("UPDATE
                            <xsl:value-of select="//Bean/beanNameLowerCase"/> SET
                            <xsl:for-each select="//BeanAttribute">
                                <xsl:choose>
                                    <xsl:when test="primaryKey=0">
                                        <xsl:choose>
                                            <xsl:when test="attTypeID=5"><xsl:value-of
                                                    select="beanAttName"/>='"+<xsl:value-of select="beanAttName"/>.getId()+"'
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="beanAttName"/>='"+<xsl:value-of
                                                    select="beanAttName"/>+"'
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:choose>
                                            <xsl:when test="position()=last()"></xsl:when>
                                            <xsl:otherwise>,</xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                </xsl:choose>

                            </xsl:for-each>
                            WHERE
                            <xsl:for-each select="//BeanAttribute">
                                <xsl:choose>
                                    <xsl:when test="primaryKey=1">
                                        <xsl:value-of select="beanAttName"/> = '" +
                                        <xsl:value-of select="beanAttName"/> + "';");
                                        <br/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:for-each>
                            return true;
                            <br/>
                            } catch (Exception e) {
                            <br/>
                            System.err.println("Error in saving updates to event " + e);
                            <br/>
                            e.printStackTrace(System.err);
                            <br/>
                            }
                            <br/>
                            return false;
                            <br/>
                            }
                            <br/>
                            }
                            <br/>
                            <br/>

                        </xsl:when>
                        <xsl:otherwise>
                            public boolean save(Connection con) {
                            <br/>
                            try {
                            <br/>
                            Statement stmt = con.createStatement();
                            <br/>
                            int updater = stmt.executeUpdate("UPDATE
                            <xsl:value-of select="//Bean/beanNameLowerCase"/> SET
                            <xsl:for-each select="//BeanAttribute">
                                <xsl:choose>
                                    <xsl:when test="primaryKey=0">
                                        <xsl:value-of select="beanAttName"/>='"+<xsl:value-of select="beanAttName"/>+"'
                                        <xsl:choose>
                                            <xsl:when test="position()=last()"></xsl:when>
                                            <xsl:otherwise>,</xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                </xsl:choose>

                            </xsl:for-each>
                            WHERE
                            <xsl:for-each select="//BeanAttribute">
                                <xsl:choose>
                                    <xsl:when test="primaryKey=1">
                                        <xsl:value-of select="beanAttName"/> = '" +
                                        <xsl:value-of select="beanAttName"/> + "';");
                                        <br/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:for-each>
                            return true;
                            <br/>
                            } catch (Exception e) {
                            <br/>
                            System.err.println("Error in saving updates to event " + e);
                            <br/>
                            e.printStackTrace(System.err);
                            <br/>
                            return false;
                            <br/>
                            }
                            <br/>
                            }
                            <br/>
                        </xsl:otherwise>
                    </xsl:choose>


                    <br/>
                    <br/>
                    /**
                    * Get and set methods for the attributes of
                    <xsl:value-of select="//Bean/beanName"/>
                    */
                    <br/>
                    <br/>
                    <xsl:for-each select="//BeanAttribute">
                        public<xsl:text> </xsl:text>
                        <xsl:choose>
                            <xsl:when test="attTypeID=1">int GET<xsl:value-of select="beanAttName"/>() {<br/>return
                                <xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=2">String GET<xsl:value-of select="beanAttName"/>() {<br/>return
                                <xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=3">String GET<xsl:value-of select="beanAttName"/>() {<br/>return
                                <xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=4">String GET<xsl:value-of select="beanAttName"/>() {<br/>return
                                <xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=5">HttpSession GET<xsl:value-of select="beanAttName"/>() {
                                <br/>
                                return <xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=6">String GET<xsl:value-of select="beanAttName"/>() {<br/>return
                                <xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=7">String GET<xsl:value-of select="beanAttName"/>() {<br/>return
                                <xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=8">int GET<xsl:value-of select="beanAttName"/>() {<br/>return
                                <xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=9">float GET<xsl:value-of select="beanAttName"/>() {<br/>return
                                <xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <br/>
                    <br/>

                    <xsl:for-each select="//BeanAttribute">
                        public void<xsl:text> </xsl:text>
                        <xsl:choose>
                            <xsl:when test="attTypeID=1">SET<xsl:value-of select="beanAttName"/>(int <xsl:value-of
                                    select="beanAttName"/>) {<br/>this.<xsl:value-of
                                    select="beanAttName"/>=<xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=2">SET<xsl:value-of select="beanAttName"/>(String <xsl:value-of
                                    select="beanAttName"/>) {<br/>this.<xsl:value-of
                                    select="beanAttName"/>=<xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=3">SET<xsl:value-of select="beanAttName"/>(String <xsl:value-of
                                    select="beanAttName"/>) {<br/>this.<xsl:value-of
                                    select="beanAttName"/>=<xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=4">SET<xsl:value-of select="beanAttName"/>(String <xsl:value-of
                                    select="beanAttName"/>) {<br/>this.<xsl:value-of
                                    select="beanAttName"/>=<xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=5">SET<xsl:value-of select="beanAttName"/>(HttpSession
                                <xsl:value-of select="beanAttName"/>) {<br/>this.<xsl:value-of
                                        select="beanAttName"/>=<xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=6">SET<xsl:value-of select="beanAttName"/>(String <xsl:value-of
                                    select="beanAttName"/>) {<br/>this.<xsl:value-of
                                    select="beanAttName"/>=<xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=7">SET<xsl:value-of select="beanAttName"/>(String <xsl:value-of
                                    select="beanAttName"/>) {<br/>this.<xsl:value-of
                                    select="beanAttName"/>=<xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=8">SET<xsl:value-of select="beanAttName"/>(int <xsl:value-of
                                    select="beanAttName"/>) {<br/>this.<xsl:value-of
                                    select="beanAttName"/>=<xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="attTypeID=9">SET<xsl:value-of select="beanAttName"/>(float <xsl:value-of
                                    select="beanAttName"/>) {<br/>this.<xsl:value-of
                                    select="beanAttName"/>=<xsl:value-of select="beanAttName"/>;<br/>}
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <br/>
                    <br/>
                    public boolean ok() {
                    <br/>
                    return ok(new Validatable[] {
                    <br/>
                    });
                    <br/>
                    }
                    <br/>
                    <br/>
                    <br/>

                    /**
                    <br/>
                    * Creates the
                    <xsl:value-of select="//Bean/beanName"/> nodes for the XML document
                    <br/>
                    */
                    <br/>
                    <br/>
                    <br/>
                    public Element getElement(Document doc) {
                    <br/>
                    <br/>
                    Element <xsl:value-of select="//Bean/beanName"/>El = doc.createElement("<xsl:value-of
                        select="//Bean/beanName"/>");
                    <br/>
                    <br/>

                    <xsl:for-each select="//BeanAttribute">

                        Element <xsl:value-of select="beanAttName"/>El = doc.createElement("<xsl:value-of
                            select="beanAttName"/>");
                        <br/>
                        <xsl:value-of select="beanAttName"/>El.appendChild(doc.createTextNode(<xsl:value-of
                            select="beanAttName"/>+""));
                        <br/>
                        <xsl:value-of select="//Bean/beanName"/>El.appendChild(<xsl:value-of select="beanAttName"/>El);
                        <br/>

                        <xsl:choose>
                            <xsl:when test="attTypeID=3">
                                <br/>
                                <br/>
                                Element <xsl:value-of select="beanAttName"/>StringEl = doc.createElement("<xsl:value-of
                                    select="beanAttName"/>String");
                                <br/>
                                <xsl:value-of select="beanAttName"/>StringEl.appendChild(doc.createTextNode(DateConverter.convertRawDate(<xsl:value-of
                                    select="beanAttName"/>)+""));
                                <br/>
                                <xsl:value-of select="//Bean/beanName"/>El.appendChild(<xsl:value-of
                                    select="beanAttName"/>StringEl);
                                <br/>
                                <br/>
                            </xsl:when>
                        </xsl:choose>
                        <br/>
                    </xsl:for-each>
                    <br/>
                    return <xsl:value-of select="//Bean/beanName"/>El;
                    <br/>
                    }
                    <br/>
                    }


                </td>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>
