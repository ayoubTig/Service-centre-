package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import model.connect;

public class Categorie {
	private int id;
	private String nom;
	private String Classe;
	
	public String getClasse() {
		return Classe;
	}

	public void setClasse(String classe) {
		Classe = classe;
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
	
//	public static Arra getAllCategorie() throws SQLException
//	{
//		
//		
//		String[] categories = new String[31];
//		//try{
//			
//			String sql = "SELECT * FROM `categorie` ORDER BY `categorie`.`nom_categorie`";
//			Connection con = (Connection) connect.loadDatabase();
//			Statement statement = (Statement) con.createStatement();
//			
//			ResultSet res = statement.executeQuery(sql);
//			int i=0;
//			while(res.next())
//			{
//				
//				categories[i] =res.getString(2);
//				
//				i++;
//			}
//			con.close();
//			
//			
//			
//		//}catch(SQLException e1){
//		//	e1.printStackTrace();
//		//}
//		
//		return categories;
//	}
//	
	
	
	public static ArrayList<String> getAllCategorie() throws SQLException
	{
		
		ArrayList<String> categories = new ArrayList<String>();
		//try{
			
		String sql = "SELECT * FROM `categorie` ORDER BY `categorie`.`nom_categorie`";
		Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sql);
			//int i=0;
			while(res.next())
			{
				String c = new String();
				 
				c=res.getString(2);
				 
				
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
	
	
	
	
	

	public Categorie(int id, String nom, String classs) {
		super();
		this.id = id;
		this.nom = nom;
		this.Classe=classs;
	}

	public static ArrayList<Categorie> getAllCategorie1() throws SQLException
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
			String sql = "SELECT * FROM `annonce` WHERE `ID_categorie`='"+id+"';";
		Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sql);
			
			while(res.next())
			{
				Annonce ann = new Annonce();
				ann.setId(res.getInt(1));
				ann.setId_off(res.getInt(2));
				ann.setImage(res.getString(3));
				ann.setDescription(res.getString(4));
				
				Date maDate = res.getDate(5);
				String datt=formatDate.format(maDate);
				ann.setDatepub(datt); 
				
				ann.setId_cat(id);
				ann.setEtat(res.getString(6));
			
				ann.setPrice(res.getInt(7)); 
				ann.setTitle(res.getString(8));
				ann.setType(res.getString(10));
				ann.setTop(res.getString(11));
				
				ac.add(ann);
			}
			con.close();
	
		
		return ac;
	}
	public static  int  compterNombreCategorie() throws SQLException
	{
		
		
		String sq="SELECT count(*)  from `categorie`  " ;
		 int  cate=0;
			Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
			ResultSet res = statement.executeQuery(sq);
		if(res.next())
			{
				cate=res.getInt(1);
			}
			con.close();
		     return cate;
		
			
			
	}
	public static void delete(int id) throws SQLException
	{
		 
		
		
		try{
			
			String sql = "DELETE FROM `categorie` WHERE `ID_categorie`=?";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			
			 preparedStatement.executeUpdate();
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		 
	}
	
	public static void update(int id, Categorie cate) throws SQLException  {
		

		
		
		try{
			
			String sql = "UPDATE `categorie` SET  `nom_categorie`='"+cate.getNom()+"' , `classe` = '"+cate.getClasse()+"'  WHERE `ID_categorie`="+id+"";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			
//			preparedStatement.setString(1, cate.getNom());
//			preparedStatement.setString(2, cate.getClasse());
//			preparedStatement.setInt(3, id);
		 preparedStatement.executeUpdate();
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		
		
		
		
		 
		
		
	}
	
public  void ajouter() throws SQLException  {
		

		
		
		try{
			
			//String sql = "INSERT INTO `categorie`( `nom_categorie`) VALUES (?)";
			String sql ="INSERT INTO `categorie` (`ID_categorie`, `nom_categorie`, `classe`) VALUES (NULL, '"+this.getNom()+"', '"+this.getClasse()+"');";
			Connection con = (Connection) connect.loadDatabase();
			 PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			
			//preparedStatement.setString(1, this.getNom());

		 preparedStatement.executeUpdate();
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		
		
		
		
		 
		
		
	}
}

