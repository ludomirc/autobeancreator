package net.xanda.autobeancreator.api;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Project extends AbstractItem {

    public final static Project Null = new Project(0, "");
    private int projID = 0;
    private String projName = "";

    private Project(int projID, String projName) {

        this.projID = projID;
        this.projName = projName;

    }

    public static int createNew(String projName, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("INSERT INTO project VALUES('', '" + projName + "');");
            ResultSet res = stmt.executeQuery("SELECT projID FROM project WHERE projName='" + projName + "';");
            res.next();
            return res.getInt(1);
        } catch (Exception e) {
            System.err.println("Error in creating new project from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            return 0;
        }
    }

    public static Project loadByID(int projID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery("SELECT * FROM project WHERE projID = '" + projID + "';");
            if (res.next()) {
                return new Project(res.getInt("projID"), res.getString("projName"));
            } else {
                return Project.Null;
            }
        } catch (Exception e) {
            System.err.println("Failed to load project from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            return Project.Null;
        }
    }

    public static Project[] loadAll(Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet res2 = stmt.executeQuery("SELECT COUNT(*) FROM project;");
            res2.next();
            int count = res2.getInt(1);
            Project[] AllCategories = new Project[count];
            ResultSet res = stmt.executeQuery("SELECT * FROM project ORDER BY projName;");
            for (int i = 0; i < count; i++) {
                res.next();
                AllCategories[i] = new Project(res.getInt("projID"), res.getString("projName"));
            }
            return AllCategories;
        } catch (Exception e) {
            System.err.println("Failed to load projects from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
            Project[] empty = new Project[0];
            return empty;
        }
    }

    public boolean save(Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("UPDATE project SET projName  =  '" + projName + "' WHERE projID  =  '" + projID + "';");
            return true;
        } catch (Exception e) {
            System.err.println("Error in saving updates to project from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
        }
        return false;
    }

    public boolean delete(int projID, Connection con) {
        try {
            Statement stmt = con.createStatement();
            int updater = stmt.executeUpdate("DELETE FROM project WHERE projID  =  '" + projID + "';");
            return true;
        } catch (Exception e) {
            System.err.println("Error in deleting project from Xanda Labs Database: " + e);
            e.printStackTrace(System.err);
        }
        return false;
    }

    /**
     * Get and set methods for the attributes of project
     */

    public int getProjID() {
        return projID;
    }

    public void setProjID(int projID) {
        this.projID = projID;
    }

    public String getProjName() {
        return projName;
    }

    public void setProjName(String projName) {
        this.projName = projName;
    }

    public boolean ok() {
        return ok(new Validatable[]{
                //         readingGrade, lastName, skillGrade, skillGrade
        });
    }

    /**
     * Creates the Category nodes for the XML document
     */
    public Element getElement(Document doc) {

        Element userEl = doc.createElement("Project");

        Element userIDEl = doc.createElement("projID");
        userIDEl.appendChild(doc.createTextNode(projID + ""));
        userEl.appendChild(userIDEl);

        Element nameEl = doc.createElement("projName");
        nameEl.appendChild(doc.createTextNode(projName));
        userEl.appendChild(nameEl);

        return userEl;

    }

}
