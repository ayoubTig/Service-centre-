package Beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import Beans.connect;
public class offreur 
{
	int id;
	String  nom;
	String  prenom;
	String  email;
	String  password;
	String  genre;
	String phone;
	String  service;
	String  descreption;
	String  ville;
	String photo;
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getDescreption() {
		return descreption;
	}
	public void setDescreption(String descreption) {
		this.descreption = descreption;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public offreur(int id, String nom, String prenom, String email, String password, String genre, String phone,
			String service, String descreption, String ville) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.password = password;
		this.genre = genre;
		this.phone = phone;
		this.service = service;
		this.descreption = descreption;
		this.ville = ville;
	}
	public offreur() {
		super();
	}
	
	public void ajouter(offreur e) 
    {
		Connection con = (Connection) connect.loadDatabase();
        
        try {
            PreparedStatement preparedStatement = (PreparedStatement)con.prepareStatement("INSERT INTO offreur_service(nom, prenom,email,password,phone,nom_service,descreption,ville,genre) VALUES(?,?,?,?,?,?,?,?,?);");
            preparedStatement.setString(1, e.getNom());
            preparedStatement.setString(2, e.getPrenom());
            preparedStatement.setString(3, e.getEmail());
            preparedStatement.setString(4, e.getPassword());
            preparedStatement.setString(5,e.getPhone());
            preparedStatement.setString(6, e.getService());
            preparedStatement.setString(7, e.getDescreption());
            preparedStatement.setString(8, e.getVille());
            preparedStatement.setString(9, e.getGenre());
            preparedStatement.executeUpdate();
        } catch (SQLException es) {
            es.printStackTrace();
        }
    }
 
 public ArrayList<offreur> AllOffreur() throws SQLException
	{
		ArrayList<offreur> et=new ArrayList<>();
		Connection con = (Connection) connect.loadDatabase();
		 PreparedStatement st=(PreparedStatement)con.prepareStatement("select * from offreur_service");
		ResultSet rs=st.executeQuery();
		try {
			while(rs.next())
			{
				offreur p=new offreur();
				p.setId(rs.getInt(1));
				p.setNom(rs.getString(2));
				p.setPrenom(rs.getString(3));
				p.setEmail(rs.getString(4));
				p.setPassword(rs.getString(5));
				
				p.setPhone(rs.getString(6));
	           
	            p.setService(rs.getString(7));
	            p.setDescreption(rs.getString(8));
	            p. setVille(rs.getString(9));
	            p. setGenre(rs.getString(10));
	            p.setPhoto(rs.getString(11));
				et.add(p);
				
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	
		return et ;
		
	}
 public void updateOffreurr (int id ,offreur e)
	{
	 Connection con = (Connection) connect.loadDatabase();
		 try {
	            PreparedStatement preparedStatement = (PreparedStatement)con.prepareStatement("update offreur_service set nom='"+e.getNom()+"',prenom='"+e.getPrenom()+"',email='"+e.getEmail()+"',password='"+e.getPassword()+"',phone='"+e.getPhone()+"',nom_service='"+e.getService()+"',descreption='"+e.getDescreption()+"',ville='"+e.getVille()+"',genre='"+e.getGenre()+"' where ID_off='"+id+"'");
	            
	            
	            preparedStatement.executeUpdate();
	        } catch (SQLException es) {
	            es.printStackTrace();
	        }
	}

 public offreur findOffreur(String email) throws SQLException
	{
	 Connection con = (Connection) connect.loadDatabase();
		
		offreur o=null;
		
		 PreparedStatement st=(PreparedStatement)con.prepareStatement("select * from offreur_service where 	email="+email+"'");
		 ResultSet rs=st.executeQuery();
		try {
			if(rs.next())
			{
				o=new offreur();
				o.setId(rs.getInt(1));
				o.setNom(rs.getString(2));
				o.setPrenom(rs.getString(3));
				
				o.setEmail(rs.getString(4));
				 o.setPassword(rs.getString(5));
				o.setPhone(rs.getString(6));
	           
	            o.setService(rs.getString(7));
	            o.setDescreption(rs.getString(8));
	            o. setVille(rs.getString(9));
	            o.setDescreption(rs.getString(10));
				
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	return o;
	}
 public void deleteOffreur(int id)
	{
	 Connection con = (Connection) connect.loadDatabase();
		 try {
	            PreparedStatement preparedStatement = (PreparedStatement)con.prepareStatement("delete from `offreur_service` where ID_off='"+id+"'");
	            
	            preparedStatement.executeUpdate();
	        } catch (SQLException es) {
	            es.printStackTrace();
	        }
		
	
	}
 public void updateOffreur (int id ,offreur e)
	{
	 Connection con = (Connection) connect.loadDatabase();
		 try {
	            PreparedStatement preparedStatement = (PreparedStatement)con.prepareStatement("update offreur_service set nom='"+e.getNom()+"',prenom='"+e.getPrenom()+"',email='"+e.getEmail()+"',phone='"+e.getPhone()+"',nom_service='"+e.getService()+"',descreption='"+e.getDescreption()+"',ville='"+e.getVille()+"',genre='"+e.getGenre()+"' where ID_off='"+id+"'"); 
	            preparedStatement.executeUpdate();
	        } catch (SQLException es) {
	            es.printStackTrace();
	        }
	}
public static void updatePicture(String fname,int id)
 {
	Connection con = (Connection) connect.loadDatabase();
	 try {
            PreparedStatement preparedStatement = (PreparedStatement)con.prepareStatement("update offreur_service set photo='"+fname+"' where ID_off='"+id+"'");
            
            
            preparedStatement.executeUpdate();
        } catch (SQLException es) {
            es.printStackTrace();
        }
 }
public static int compterNombreOffreur()
{
int nbr=0;
try{
	
	String sql = "SELECT COUNT(ID_off) FROM `offreur_service`";
	Connection con = null;
	con=(Connection) connect.loadDatabase();
	Statement statement = (Statement) con.createStatement();
	
	ResultSet res = statement.executeQuery(sql);
	while(res.next())
	{
	nbr=res.getInt(1);
	}
	
	con.close();
	
}catch(SQLException e1){
	e1.printStackTrace();
}
return nbr;
}

}
