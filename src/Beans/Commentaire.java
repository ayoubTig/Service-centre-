package Beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import Beans.connect;

public class Commentaire {
	private int ID_commentaire;
	private int ID_Client;
	private String text;
	private int ID_annonce;
	private String date;
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getID_commentaire() {
		return ID_commentaire;
	}
	public void setID_commentaire(int iD_commentaire) {
		ID_commentaire = iD_commentaire;
	}
	public int getID_Client() {
		return ID_Client;
	}
	public void setID_Client(int iD_Client) {
		ID_Client = iD_Client;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getID_annonce() {
		return ID_annonce;
	}
	public void setID_annonce(int iD_annonce) {
		ID_annonce = iD_annonce;
	}
	
	
	
	
	public void add(int id_Cl,int id_An)
	{
		try{
			//date
			DateFormat formatDat = new SimpleDateFormat("yyyy/MM/dd");
			   System.out.println("0000000000000000000000000000"+formatDat.format(new java.util.Date()));
			   
			   
			   
			   DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			   System.out.println("eeeeeeeeeeeeeee");
				
				
				String input = formatDate.format(new java.util.Date());
			
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern( "yyyy-MM-dd" ) ;
				LocalDate localDate = LocalDate.parse( input, formatter ) ;
				//////////////////////
			String sql = "INSERT INTO `commentaire`( `ID_Client`, `text`, `ID_annonce`, `date`) VALUES (?,?,?,?);";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			
			preparedStatement.setInt(1,id_Cl );
			preparedStatement.setString(2, this.getText());
			preparedStatement.setInt(3,id_An);
			preparedStatement.setObject(4, localDate);
		
			

			preparedStatement.executeUpdate();
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
	}
	
	public static int update(int id,String text) throws SQLException
	{
		int check = 0;
		
		
		try{
			
			String sql = "UPDATE `commentaire` SET `text`=? WHERE `ID_commentaire`=?";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			preparedStatement.setString(1, text);
			preparedStatement.setInt(2, id);
			
			check = preparedStatement.executeUpdate();
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		return check;
	}
	
	public static int delete(int id) throws SQLException
	{
		int check = 0;
		
		
		try{
			
			String sql = "DELETE FROM `commentaire` WHERE `ID_commentaire`=?";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			
			check = preparedStatement.executeUpdate();
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		return check;
	}
	
	public static Commentaire getCommentaire(int id) throws SQLException
	{
		Commentaire com = new Commentaire();
		
		
		try{
			DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			String sql = "SELECT * FROM `commentaire` WHERE `ID_commentaire`=?";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			
			ResultSet res = preparedStatement.executeQuery();
			if(res.next())
			{
				com.setID_commentaire(res.getInt(1));
				com.setID_Client(res.getInt(2));
				com.setText(res.getString(3));
				com.setID_annonce(res.getInt(4));
				
				Date maDate = res.getDate(5);
				String datt=formatDate.format(maDate);
				
				com.setDate(datt);
			}
			
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		return com;
	}
	public static ArrayList<Commentaire> getAllCommentaire() throws SQLException
	{
		
		ArrayList<Commentaire> commentaires = new ArrayList<Commentaire>();
		
			String sql = "SELECT * FROM `commentaire`";
			DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sql);
			
			while(res.next())
			{
				Commentaire c = new Commentaire();
				c.setID_commentaire(res.getInt(1));
				c.setID_Client(res.getInt(2));
				c.setText(res.getString(3));
				c.setID_annonce(res.getInt(4));
				
				Date maDate = res.getDate(5);
				String datt=formatDate.format(maDate);
				
				c.setDate(datt);
				
				commentaires.add(c);
				
				
			}
			con.close();
		
		return commentaires;
	}
	
	public static ArrayList<Commentaire> getAllCommentaireById(int id) throws SQLException
	{
		
		ArrayList<Commentaire> commentaires = new ArrayList<Commentaire>();
		
			
		
			String sql = "SELECT * FROM `commentaire` WHERE `ID_annonce`="+id;
			Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
			ResultSet res = statement.executeQuery(sql);
			
			while(res.next())
			{
				Commentaire c = new Commentaire();
				c.setID_commentaire(res.getInt(1));
				c.setID_Client(res.getInt(2));
				c.setText(res.getString(3));
				c.setID_annonce(res.getInt(4));
				c.setDate(res.getString(5));
				
				commentaires.add(c);
				
				
			}
			con.close();
		
		return commentaires;
	}
}
