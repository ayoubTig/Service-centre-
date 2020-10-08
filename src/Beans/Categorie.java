package Beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import Beans.connect;;

public class Categorie {
	private int id;
	private String nom;
	private String classe;
	
	
	public String getClasse() {
		return classe;
	}

	public void setClasse(String classe) {
		this.classe = classe;
	}

	public Categorie(){
		
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
	
	
	
	public static ArrayList<Categorie> getAllCategorie() throws SQLException
	{
		
		ArrayList<Categorie> categories = new ArrayList<Categorie>();
		//try{
			
			String sql = "SELECT * FROM `categorie`";
			Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sql);
			//int i=0;
			while(res.next())
			{
				Categorie c = new Categorie();
				c.setId(res.getInt(1));
				c.setNom(res.getString(2));
				c.setClasse(res.getString(3));
				
				categories.add(c);
				
				//categories[i] =res.getString(2);
				//i++;
			}
			con.close();
			
			
			
		//}catch(SQLException e1){
		//	e1.printStackTrace();
		//}
		
		return categories;
	}
	
	
	public static ArrayList<Categorie> getCategorie(int id) throws SQLException
	{
		
		ArrayList<Categorie> categorie = new ArrayList<Categorie>();
		//try{
			
			String sql = "SELECT * FROM `categorie` WHERE `ID_categorie`="+id;
			Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sql);
			//int i=0;
			while(res.next())
			{
				Categorie c = new Categorie();
				c.setId(res.getInt(1));
				c.setNom(res.getString(2));
				c.setClasse(res.getString(3));
				
				categorie.add(c);
				
				//categories[i] =res.getString(2);
				//i++;
			}
			con.close();
			
			
			
		//}catch(SQLException e1){
		//	e1.printStackTrace();
		//}
		
		return categorie;
	}

	public static ArrayList<Annonce> getAnnonceOfCategorie(int id) throws SQLException
	{
		
		ArrayList<Annonce> ac = new ArrayList<Annonce>();
		
		DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			String sql = "SELECT * FROM `annonce` WHERE `ID_categorie`="+id;
			Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sql);
			
			while(res.next())
			{
				Annonce c = new Annonce();
				
				
				c.setId(res.getInt(1));
				c.setId_off(res.getInt(2));
				c.setImage(res.getString(3));
				c.setDescription(res.getString(4));
				
				Date maDate = res.getDate(5);
				String datt=formatDate.format(maDate);
				c.setDate(datt); 
				
				c.setId_cat(res.getInt(6));
				c.setEtat(res.getString(7));
			
				c.setPrice(res.getInt(8)); 
				c.setTitre(res.getString(9));
				c.setType(res.getString(10));
				c.setTop(res.getString(11));
				
				ac.add(c);
			}
			con.close();
	
		
		return ac;
	}
	
}

