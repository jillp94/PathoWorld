/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
//AIzaSyAzknEORh0AXvStgFmkHmaFljMNvBa9zzA

/**
 *
 * @author Sony
 */
public class database {

    Connection con;
    Statement st, st1;
    PreparedStatement ps, ps1;
    ResultSet rs,rs1;
    String uName = "System", username, password, area;
    public String id, email, usertype, labId, labname, statusValue, patientname, labAdmin,labIdAfterSignUp;
    public static Integer counter = 0;
    String Pwd = "jill1694";
    public Integer i = 0;

    //--------------------------------------Connection to the database---------------------------------------
    private void connect() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", uName, Pwd);
        } catch (Exception ex) {
            System.out.println("Exception in Connect" + ex);
        }
    }

    //--------------------------------------Patient details insert during signup---------------------------------------
    public boolean insert(String values[]) {
        boolean b = true;
        try {
            connect();
            ps = con.prepareStatement("insert into patient values(?,?,?,?,?,?,?,?)");
            for (int i = 1; i <= 8; i++) {
                ps.setString(i, values[i - 1]);
            }
            ps.executeUpdate();
            System.out.println("inserted");
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in Insert" + e);
            return false;
        }
        return b;
    }

   //--------------------------------------insert feeback details---------------------------------------
public boolean insertFeedback(String values[]) {
        boolean b = true;
        try {
            connect();
            ps = con.prepareStatement("insert into feedback values(?,?,?,?)");
            for (int i = 1; i <= 4; i++) {
                ps.setString(i, values[i - 1]);
            }
            ps.executeUpdate();
            System.out.println("inserted");
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in Feedback Insert" + e);
            return false;
        }
        return b;
    }


    //--------------------------------------Insert data during appointment ---------------------------------------
    public boolean insertAppointmentData(String values[]) {
        boolean b = true;
        try {
            connect();
            ps = con.prepareStatement("insert into appointment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            for (int i =1;i<=17; i++) {
                ps.setString(i, values[i - 1]);
            }
            ps.setString(18, "pending");
            ps.setString(19, "pending");
            ps.setString(20, "NotYetGiven");
            ps.setString(21, "-");
            ps.setString(22, "-");
            ps.setString(23, "-");
            ps.setString(24, "NotSent");
            ps.setString(25, "NotDeleted");
            
            counter = incrementCounter();
            counter = counter + 1;

            ps.executeUpdate();
            System.out.println("counter is" + counter);
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in Insert..." + e);
            return false;
        }
        return b;
    }

//-------------------------------------- Update Appointment status----------------------------------------------------------
    public boolean updateAppointmentStatus(String value, String aid) {
        try {
            connect();
            ps = con.prepareStatement("update appointment set status=? where aId='" + aid + "'");

            ps.setString(1, value);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println("Exception in updating Appointment Status:" + e);
            return false;
        }
        return true;
    }
    
 //-------------------------------------- Update Appointment status----------------------------------------------------------
    public boolean updateAppointDeleteStatus(String value, String aid) {
        try {
            connect();
            ps = con.prepareStatement("update appointment set deleteStatus=? where aId='" + aid + "'");

            ps.setString(1, value);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println("Exception in updating Appointment Status:" + e);
            return false;
        }
        return true;
    }
    

    
    //-------------------------------------- Update Rejection ----------------------------------------------------------
    public boolean updateRejectionReason(String value, String aid) {
        try {
            connect();
            ps = con.prepareStatement("update appointment set rejectionReason=? where aId='" + aid + "'");

            ps.setString(1, value);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println("Exception in updating Rejection Reason:" + e);
            return false;
        }
        return true;
    }
//-------------------------Update lab person details, who is going to visit the patient's home-----------------
  public boolean updateLabPersonDetail(String details[], String aid) {
        try {
            connect();
            ps = con.prepareStatement("update appointment set lpName=?,lpContact=? where aId='" + aid + "'");

            ps.setString(1, details[0]);
            ps.setString(2, details[1]);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println("Exception in updating Rejection Reason:" + e);
            return false;
        }
        return true;
    }


    //-------------------------------------- Update Rejection status----------------------------------------------------------
    public boolean updateRejectionStatus(String value, String aid) {
        try {
            connect();
            ps = con.prepareStatement("update appointment set rejectionStatus=? where aId='" + aid + "'");

            ps.setString(1, value);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println("Exception in updating Rejection Status:" + e);
            return false;
        }
        return true;
    }
//----------------------------------update the status of the lab person detail that will visit the home--------------------------
  public boolean updateLabPersonDetailsStatus(String value, String aid) {
        try {
            connect();
            ps = con.prepareStatement("update appointment set lpDetailsStatus=? where aId='" + aid + "'");

            ps.setString(1, value);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println("Exception in updating Lab Person Details Status:" + e);
            return false;
        }
        return true;
    }

//---------------------------------------Update Report Status-------------------------------------------------------------
    
public boolean updateReportStatus(String rStatus, String aid) {
        try {
            connect();
            ps = con.prepareStatement("update appointment set rStatus=? where aId='" + aid + "'");

            ps.setString(1, rStatus);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println("Exception in updating Report Status:" + e);
            return false;
        }
        return true;
    }

//--------------------------------------Display the data when first time lab profile is filled------------------------------
    public String[] labData(String id) {
        String s[] = new String[8];
        try {
            connect();
            st = con.createStatement();
            rs = st.executeQuery("select * from labRegistration where lId='" + id + "'");
            if (rs.next()) {
                for (int i = 0; i <= 6; i++) {
                    s[i] = rs.getString(i + 1);
                }
                return s;
            }
        } catch (Exception e) {
            System.out.println("Exception in getting lab id");
        }
        return s;
    }
    
//--------------------------------------Display the data when first time lab profile is filled------------------------------
    public String[] AppointmentDataForReportPage(String id) {
        System.out.println("Appointment id is:"+id);
        String s[] = new String[50];
        try {
            connect();
            st = con.createStatement();
            rs = st.executeQuery("select * from appointment where aId='" + id + "'");
            if (rs.next()) {
                for (int i = 0; i <25; i++) {
                    s[i] = rs.getString(i + 1);
                    System.out.println("in function appointment data:"+i+"-->"+s[i]);
                }
                return s;
            }
        } catch (Exception e) {
            System.out.println("Exception in getting appointmentdata for report page");
        }
        return s;
    }
    
    
//-------------------------------------- for getting Password----------------------------------------------------------    
public String[] getPwd(String patientemail) {
    System.out.println("function called");
        String s[] = new String[100];
        try {
            connect();
            st = con.createStatement();
            rs = st.executeQuery("select * from patient where pEmail='" + patientemail + "'");
            if (rs.next()) {
                for (int i = 0; i <= 7; i++) {
                    s[i] = rs.getString(i+1);
                   
                }
                
                return s;
            }
        } catch (Exception e) {
            System.out.println("Exception in getting lab id");
        }
        return s;
    }

//------------------------------ for incrementing counter value-------------------------------------------
    public Integer incrementCounter() {

        //String s[]=new String[18];
        try {
            connect();
            st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            rs = st.executeQuery("select aId from appointment");
            while (rs.next()) {
                if(rs.isLast()) 
                {   
                    System.out.println(" last aid is:"+ rs.getString(1));
                try{ 
                int i1=Integer.parseInt(rs.getString(1).charAt(1)+"");
                int i2=Integer.parseInt(rs.getString(1).charAt(2)+"");
                if(((i1==1)||(i1==2)||(i1==3)||(i1==4)||(i1==5)||(i1==6)||(i1==7)||(i1==8)||(i1==9))&& 
                   ((i2==0)||(i2==1)||(i2==2)||(i2==3)||(i2==4)||(i2==5)||(i2==6)||(i2==7)||(i2==8)||(i2==9)))
                {
                    
                System.out.println("I m in If part");
                String n1=rs.getString(1).substring(1,3);
                System.out.println("counter in if :::::"+n1);
                i=Integer.parseInt(n1);
                System.out.println("Counter in database in if condition is:" + i);
                }}
                catch(NumberFormatException ne){
                
                System.out.println("I m in else part");
                i = Integer.parseInt(rs.getString(1).charAt(1)+"");
                System.out.println("Counter in database is:" + i);
                }
                }   
            }
            rs.close();
            con.close();
            
            return i;
            
        } catch (Exception e) {
            System.out.println("Exception in incrementing Counter" + e);
        }
        
        
        return i;
    }

//------------------------------ Fetch Appointment data while confirming the appointment----------------------------------
    public String[] AppointmentData(String aid) {
        String s[] = new String[21];
        try {
            connect();
            st = con.createStatement();
            rs = st.executeQuery("select * from appointment where aId='" + aid + "'");
            if (rs.next()) {
                for (int i = 0; i <= 20; i++) {
                    s[i] = rs.getString(i + 1);
                }
                return s;
            }
        } catch (Exception e) {
            System.out.println("Exception in getting Appointment Data");
        }
        return s;
    }

    //---------------when updating the lab profile, this function will display the profile page with already entered data---------------------------
    public String[] getdata(String id) {
        String s[] = new String[17];
        try {
            connect();
             System.out.println("Function getdata is called");
            st = con.createStatement();
            System.out.println("Lab Id: " + id);
            rs = st.executeQuery("select * from lab where lId='" + id + "'");
            if (rs.next()) {
                for (int i = 0; i <= 16; i++) {
                    s[i] = rs.getString(i + 1);
                    System.out.println("value of lab profile page"+i+":::"+s[i]);
                }
                
                return s;
            }
        } catch (Exception e) {
            System.out.println("exception " + e);
        }
        return s;
    }

//----------------------------------This page will fill the information of lab during appointment booking --------------------
    public String[] getLabdataForAppointment(String labname) {
        String s[] = new String[21];
        try {
            connect();
            st = con.createStatement();
            rs = st.executeQuery("select * from lab where lName='" + labname + "'");
            if (rs.next()) {
                for (int i = 0; i <= 16; i++) {
                    s[i] = rs.getString(i + 1);
                    System.out.println("lab info:"+s[10]);
                }
                return s;
            }
        } catch (Exception e) {
            System.out.println("exception " + e);
        }
        return s;
    }

//---------------------------------------Display the list of Labs during Search lab page.--------------------------------------
    public ArrayList searchLab() {
        ArrayList li = new ArrayList();
        try {
            connect();
            st = con.createStatement();
            rs = st.executeQuery("select lName from lab");
            while (rs.next()) {
                String s = "";
                s += rs.getString(1) + ",";
                System.out.println("" + s);
                li.add(s);
            }
            rs.close();
            st.close();
            con.close();
            return li;
        } catch (Exception e) {
            System.out.println("Exception in search" + e);
        }
        return li;
    }
    
//---------------------------------------Display the list of Labs during Search lab page.--------------------------------------
    public ArrayList DisplayLabList() {
        ArrayList li = new ArrayList();
        try {
            connect();
            st = con.createStatement();
            rs = st.executeQuery("select lArea from lab group by lArea");
            while (rs.next()) {
                String s = "";
                s += rs.getString(1) + ",";
                System.out.println("" + s);
                li.add(s);
            }
            rs.close();
            st.close();
            con.close();
            return li;
        } catch (Exception e) {
            System.out.println("Exception in search" + e);
        }
        return li;
    }

//-------------------------------------Display the list of labs by area.(filter) ---------------------------------------

    public ArrayList searchLabByArea(String area) {
        ArrayList li = new ArrayList();
        try {
            connect();
            st = con.createStatement();
            rs = st.executeQuery("select lName from lab where lArea='" + area + "'");
            while (rs.next()) {
                String s = "";
                s += rs.getString(1) + ",";
                System.out.println("" + s);
                li.add(s);
            }
            rs.close();
            st.close();
            con.close();
            return li;
        } catch (Exception e) {
            System.out.println("Exception in search" + e);
        }
        return li;
    }

//--------------------------------------Display the list of Tests with Tesd-Id.---------------------------------------
    public ArrayList searchTest() {
        ArrayList li = new ArrayList();
        try {
            connect();
            st = con.createStatement();
            rs = st.executeQuery("select tName from test");
            while (rs.next()) {
                String s = "";
                s += rs.getString(1) + ",";
                System.out.println("" + s);
                li.add(s);
            }
            rs.close();
            st.close();
            con.close();
            return li;
        } catch (Exception e) {
            System.out.println("Exception in search" + e);
        }
        return li;
    }

//--------------------------------------check Username and Password.---------------------------------------
    public boolean loginCheck(String username, String password, String userType) {
        try {
            connect();
            st = con.createStatement(); // ResultSet.CONCUR_UPDATABLE,ResultSet.TYPE_SCROLL_SENSITIVE 
            if (userType.startsWith("P")) {
                rs = st.executeQuery("select * from patient where pEmail='" + username + "' and pPassword='" + password + "'");
                if (rs.next()) {
                    id = rs.getString(1);
                    patientname = rs.getString(2);
                    rs.close();
                    st.close();
                    con.close();
                    return true;
                } else {
                    rs.close();
                }
                st.close();
                con.close();
            } else {
                rs = st.executeQuery("select * from LabRegistration where lemail='" + username + "' and lpassword='" + password + "'");
                if (rs.next()) {
                    id = rs.getString(1);
                    labname=rs.getString(2);
                    labAdmin = rs.getString(3);
                    rs.close();
                    st.close();
                    con.close();
                    return true;
                } else {
                    rs.close();
                    st.close();
                    con.close();
                }
            }
        } catch (Exception ex) {
            System.out.println("Exception in checkLogin :" + ex);
        }
        return false;
    }
    //--------------------------------------For resetting the Password.---------------------------------------

    public boolean update(String oldpwd, String newpwd, String email) {
     try {
            connect();
    st = con.createStatement();
    rs = st.executeQuery("select pPassword from patient where pEmail='"+email+"'");
    while(rs.next())
    {
        System.out.println("I m in while loop");
        String p1=rs.getString(1);
        System.out.println("Old Pasword is:"+p1);
        if(p1.equals(oldpwd))
        {
            System.out.println("Password is matched");
          try{
              System.out.println("I m in try");
          ps = con.prepareStatement("update patient set pPassword='" + newpwd + "' where (pPassword='" + oldpwd + "') AND (pEmail='" +email+ "')");
          ps.executeUpdate();
          System.out.println(" i m in update function :updated");     
          ps.close();
          con.close();
          return true;
            }
            catch(Exception e)
            {
            System.out.println("exception in update" + e);
            return false;  
            }
        }
    }
    } catch (Exception e) {
            System.out.println("exception in update" + e);
            return false;
        }
        return false;
    }
 
 //--------------------------------------For resetting the Lab Password.---------------------------------------

    public boolean updateLabPwd(String oldpwd, String newpwd, String email) {
     try {
            connect();
    st = con.createStatement();
    rs = st.executeQuery("select lPassword from labRegistration where lEmail='"+email+"'");
    while(rs.next())
    {
        System.out.println("I m in while loop");
        String p1=rs.getString(1);
        System.out.println("Old Pasword is:"+p1);
        if(p1.equals(oldpwd))
        {
            System.out.println("Password is matched");
          try{
              System.out.println("I m in try");
          ps = con.prepareStatement("update labRegistration set lPassword='" + newpwd + "' where (lPassword='" + oldpwd + "') AND (lEmail='" +email+ "')");
          ps.executeUpdate();
          System.out.println(" i m in update function :updated");     
          ps.close();
          con.close();
          return true;
            }
            catch(Exception e)
            {
            System.out.println("exception in update" + e);
            return false;  
            }
        }
    }
    } catch (Exception e) {
            System.out.println("exception in update" + e);
            return false;
        }
        return false;
    }
    
    
    //--------------------------------------Insert/fill up lab profile ---------------------------------------  

    public boolean labProfileInsert(String values[]) {
        try {
            connect();
            ps = con.prepareStatement("insert into Lab values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            for (int i = 1; i <= 17; i++) {
                ps.setString(i, values[i - 1]);
            }
            ps.executeUpdate();
            System.out.println("inserted");
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in lab Profile insert" + e);
            return false;
        }
        return true;
    }

    //--------------------------------------Insert data when sign up from the Lab side---------------------------------------
    public boolean labSignUp(String values[]) {
        boolean b = true;
        try {
            connect();
            ps = con.prepareStatement("insert into LabRegistration values(?,?,?,?,?,?,?)");
            for (int i = 1; i <= 7; i++) {
                ps.setString(i, values[i - 1]);
            }
            ps.executeUpdate();
            labIdAfterSignUp=values[0];
            System.out.println("inserted");
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in Insert" + e);
            return false;
        }
        return b;
    }

//--------------------------------------Update lab Profile. (Old data will be displayed).------------------------------------
    public boolean updateLabProfile(String values[], String id) {
        try {
            connect();
            String query = "update lab set lName=?,lContact1=?,lContact2=?,lEmail=?,lAddressline1=?,lAdressline2=?,lArea=?,"
                    + "lCity=?,lPincode=?,lWorkinghrs=?,lAdmin=?,lTests=?,lFacilities=?,"
                    + "lServicies=?,lExtraInfo=?,lProfilePic=? where lId=?";
            ps = con.prepareStatement(query);
            for (int i = 1; i <= 16; i++) {
                ps.setString(i, values[i]);
            }
            ps.setString(17, values[0]);
            ps.executeUpdate();
            System.out.println("updated");
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in update:" + e);
            return false;
        }
        return true;
    }

//-------------------------update patient Data--------------------------------------------------------------------
    public boolean updatePatientData(String values[], String id) {
        try {
            connect();
            String query = "update patient set pName=?,pDob=?,pContact1=?,pContact2=?,pAddress=?,pEmail=?,pPassword=? where pId=?";
            ps = con.prepareStatement(query);
            
            for (int i = 1; i <= 7; i++) {
                ps.setString(i, values[i]);
            }
            ps.setString(8, values[0]);
            ps.executeUpdate();
            System.out.println("updated");
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in Patient data update:" + e);
            return false;
        }
        return true;
    }

 //---------------------------------update Lab Email/Password-------------------------------------------------
  public boolean updateLabEmailPwd(String values[], String id) {
        try {
            connect();
            String query = "update labRegistration set lEmail=?,lName=?,lAdmin=? where lId='"+id+"'";
            String query2="update lab set lEmail=?,lName=?,lAdmin=? where lId='"+id+"'";
            ps = con.prepareStatement(query);
            
           
            ps.setString(1, values[1]);
            ps.setString(2, values[2]);
            ps.setString(3, values[3]);
            
            ps1 = con.prepareStatement(query2);
            ps1.setString(1, values[1]);
            ps1.setString(2, values[2]);
            ps1.setString(3, values[3]);
            ps.executeUpdate();
            System.out.println("query 1");
            ps1.executeUpdate();
            System.out.println("query 2");
            System.out.println("updated in function");
            ps.close();
            ps1.close();
            con.close();
            
           
        } catch (Exception e) {
            System.out.println("Exception in Patient data update:" + e);
            return false;
        }
        return true;
    }
   
    
    //--------------------------------------View lab profile-----------------------------------------------------------------------
    public ArrayList viewlabProfile(String id) {
        ArrayList li = new ArrayList();
        try {
            connect();
            st = con.createStatement();
            st1=con.createStatement();
            rs = st.executeQuery("select * from lab where lId='" + id + "'");
                    while (rs.next()) {
                String s = "";
                for (int i = 1; i <= 17; i++) {
                    s += rs.getString(i) + "#";
                }
                
                li.add(s);
            }
             
            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in view:" + e);
        }
        return li;
    }
    
 //--------------------------------------- view feedbacks to the lab admin--------------------------------------------
    
  //--------------------------------------View lab profile-----------------------------------------------------------------------
    public ArrayList viewPatientFeedback(String lname) {
        System.out.println("Function is called");
        ArrayList li = new ArrayList();
        try {
            connect();
            
            st=con.createStatement();
            rs = st.executeQuery("select * from feedback where lName='" + lname + "'");
            System.out.println("Function is called again lname:" + lname );
                    while (rs.next()) {
                String s = "";
                for (int i = 1; i <= 4; i++) {
                    s += rs.getString(i) + "#";
                }
                System.out.println("Data" + s);
                li.add(s);
            }
             
            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in view feedbacks:" + e);
        }
        return li;
    }
//-------------------------In search part when user want to see particular Lab Profile---------------------------------------

    public ArrayList viewlabDetails(String labname) {
        ArrayList li = new ArrayList();
        try {
            connect();
            st = con.createStatement();
            //System.out.println("Lab Name is:"+labname);
            rs = st.executeQuery("select * from lab where lName='" + labname + "'");
            while (rs.next()) {
                String s = "";
                for (int i = 1; i <= 17; i++) {
                    s += rs.getString(i) + "#";
                }
                li.add(s);
            }
            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in view:" + e);
        }
        return li;
    }

    //--------------------While booking appointment patient data will be filled in the page.---------------------------------------
    public String[] patientData(String pId) {
        String s[] = new String[8];
        try {
            connect();
            st = con.createStatement();
            rs = st.executeQuery("select * from patient where pId='" + pId + "'");
            if (rs.next()) {
                for (int i = 0; i <= 7; i++) {
                    s[i] = rs.getString(i + 1);
                }
                return s;
            }
            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in patient Data:" + e);
        }
        return s;
    }

//----------------------------------------------display the appointment request to the respecive lab-------------------
    public ArrayList appointmentRequest(String id) {
        ArrayList li = new ArrayList();
        try {
            connect();
            st = con.createStatement();
            if (id.startsWith("L")) {
                rs = st.executeQuery("select * from appointment where lId='" + id + "'");
                while (rs.next()) {
                    String s = "";
                    for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                        s += rs.getString(i) + "#";
                    }
                    li.add(s);
                }
                rs.close();
                st.close();
                con.close();
            } else {
                rs = st.executeQuery("select * from appointment where pId='" + id + "'");
                while (rs.next()) {
                    String s = "";
                    for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                        s += rs.getString(i) + "#";
                    }
                    li.add(s);
                }
                rs.close();
                st.close();
                con.close();

            }
        } catch (Exception e) {
            System.out.println("Exception in view:" + e);
        }
        return li;
    }

//--------------------------------------Display the list of patho. tests on patho test page.---------------------------------------
    public ArrayList viewPathoTests() {
        ArrayList li = new ArrayList();
        try {
            connect();
            st = con.createStatement();
            rs = st.executeQuery("select * from test");
            while (rs.next()) {
                String s = "";
                for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                    s += rs.getString(i) + "#";
                }
                li.add(s);
            }
            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Exception in view:" + e);
        }
        return li;
    }
}
