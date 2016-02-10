package net.xanda.autobeancreator.api;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class Bean extends AbstractItem {

	private int beanID = 0;
	private String beanName = "";
	private int projID = 0;
	private String friendlyName = "";
		
	public final static Bean Null = new Bean(0, "", 0, "");

	private Bean(int beanID, String beanName, int projID, String friendlyName) {
		
		this.beanID = beanID;
		this.beanName = beanName;
		this.projID=projID;
		this.friendlyName=friendlyName;
			
	}
	
	public static int createNew(String beanName, int projID, String friendlyName, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("INSERT INTO bean VALUES('', '"+ beanName + "', '"+ projID + "', '"+ friendlyName + "');");
            ResultSet res = stmt.executeQuery("SELECT beanID FROM bean WHERE beanName='"+beanName+"' AND projID='"+projID+"' AND friendlyName='"+friendlyName+"';");
            res.next();
            return res.getInt(1);
        }
        catch(Exception e) {
            System.err.println("Error in creating new bean from Xanda Labs Database: "+e);
            e.printStackTrace(System.err);
            return 0;
        }
    }

	public static Bean loadByID(int beanID, Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery("SELECT * FROM bean WHERE beanID = '" + beanID + "';");
			if (res.next()) {
				return new Bean(res.getInt("beanID"), res.getString("beanName"), res.getInt("projID"), res.getString("friendlyName"));
			} else {
				return Bean.Null;
			}
		} catch (Exception e) {
			System.err.println("Failed to load bean from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);
			return Bean.Null;
		}
	}
	
	public static Bean[] loadAll(Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM bean;");
			res2.next();
			int count = res2.getInt(1);
			Bean[] AllCategories = new Bean[count];
			ResultSet res = stmt.executeQuery("SELECT * FROM bean ORDER BY beanName;");
			for (int i = 0; i < count; i++) {
				res.next();
				AllCategories[i] = new Bean(res.getInt("beanID"), res.getString("beanName"), res.getInt("projID"), res.getString("friendlyName"));
			}
			return AllCategories;
		} catch (Exception e) {
			System.err.println("Failed to load beans from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);
			Bean[] empty = new Bean[0];
			return empty;
		}
	}		
	
	public boolean save(Connection con) {
		try {
			Statement stmt = con.createStatement();
			int updater = stmt.executeUpdate("UPDATE bean SET beanName  =  '" +beanName +"', projID  =  '" +projID +"', friendlyName  =  '" +friendlyName +"' WHERE beanID  =  '"	+ beanID + "';");
			return true;
		} catch (Exception e) {
			System.err.println("Error in saving updates to bean from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);			
		}
		return false;
	}	
		
	public boolean delete(int beanID, Connection con) {
		try {
			Statement stmt = con.createStatement();
			int updater = stmt.executeUpdate("DELETE FROM bean WHERE beanID  =  '" + beanID + "';");
			return true;
		} catch (Exception e) {
			System.err.println("Error in deleting bean from Xanda Labs Database: "+e);
			e.printStackTrace(System.err);			
		}
		return false;
	}
		
	/**
	 * Get and set methods for the attributes of bean
	 */

	public int getBeanID() {
		return beanID;
	}

	public void setBeanID(int beanID) {
		this.beanID = beanID;
	}

	public String getBeanName() {
		return beanName;
	}

	public void setBeanName(String beanName) {
		this.beanName = beanName;
	}

	public int getProjID() {
		return projID;
	}

	public void setProjID(int projID) {
		this.projID = projID;
	}
	
	public String getFriendlyName() {
		return friendlyName;
	}

	public void setFriendlyName(String friendlyName) {
		this.friendlyName = friendlyName;
	}
	
	public boolean ok() {
		return ok(new Validatable[] {
		});
	}

	/**
	 * Creates the Category nodes for the XML document
	 */
	public Element getElement(Document doc) {

		Element userEl = doc.createElement("Bean");

		Element userIDEl = doc.createElement("beanID");
		userIDEl.appendChild(doc.createTextNode(beanID+""));
		userEl.appendChild(userIDEl);

		Element nameEl = doc.createElement("beanName");
		nameEl.appendChild(doc.createTextNode(beanName));
		userEl.appendChild(nameEl);
		
		Element namelowercaseEl = doc.createElement("beanNameLowerCase");
		namelowercaseEl.appendChild(doc.createTextNode(beanName.toLowerCase()));
		userEl.appendChild(namelowercaseEl);

		Element projIDEl = doc.createElement("projID");
		projIDEl.appendChild(doc.createTextNode(projID+""));
		userEl.appendChild(projIDEl);
		
		Element friendlyNameEl = doc.createElement("friendlyName");
		friendlyNameEl.appendChild(doc.createTextNode(friendlyName+""));
		userEl.appendChild(friendlyNameEl);
		
		return userEl;
		
	}

}