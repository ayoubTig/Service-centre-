package model;

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

import model.connect;

public class Annonce {
	private int id;
	private int id_off;
	private String title;
	private String description;
	private String image;
	private int id_cat; 
	private int price; 
	private String datepub;
	private String etat ;
	private String type;
	private String top;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String titre) {
		this.title = titre;
	}
	public String getTop() {
		return top;
	}
	public void setTop(String top) {
		this.top = top;
	}
	public int getId() {
		return id;
	}
	public String getDatepub() {
		return datepub;
	}

	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public void setDatepub(String date) {
		this.datepub = date;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_off() {
		return id_off;
	}
	public void setId_off(int id_off) {
		this.id_off = id_off;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public Annonce() {
	}
	public Annonce(String description, String image) {
		this.description = description;
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void add(int id)
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
			
			String sql = "INSERT INTO `annonce`(`ID_off`, `image`, `descreption`, `date`, `ID_categorie`, `price`, `title`, `Type`) VALUES (?,?,?,?,?,?,?);";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			
			preparedStatement.setInt(1,id );
			preparedStatement.setString(2, this.getTitle());
			preparedStatement.setString(3, this.getImage());
			preparedStatement.setString(4, this.getDescription());
			preparedStatement.setInt(5,3);
			preparedStatement.setObject(6, localDate);
			preparedStatement.setString(7, this.getTop());
			
			

			preparedStatement.executeUpdate();
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
	}
	
	public static int update(int id,Annonce a) throws SQLException
	{
		int check = 0;
		
		
		try{
			
			String sql = "UPDATE `annonce` SET `image`=?,`descreption`=?,`date`=?,`top`=?  WHERE ID_annonce=?";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			preparedStatement.setString(1, a.getImage());
			preparedStatement.setString(2, a.getDescription());
			preparedStatement.setInt(5, id);
			preparedStatement.setString(3, a.getDatepub());
			preparedStatement.setString(4, a.getTop());
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
			
			String sql = "DELETE FROM `annonce` WHERE ID_annonce=?";
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
	
	public static Annonce getAnnonce(int id) throws SQLException
	{
Annonce ann = new Annonce();
		
		
		try{DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			
			String sql = "SELECT * FROM `annonce` WHERE `ID_annonce`=?";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			
			ResultSet res = preparedStatement.executeQuery();
			if(res.next())
			{

				ann.setId(res.getInt(1));
				ann.setId_off(res.getInt(2));
				ann.setImage(res.getString(3));
				ann.setDescription(res.getString(4));
				
				Date maDate = res.getDate(5);
				String datt=formatDate.format(maDate);
				ann.setDatepub(datt); 
				
				ann.setId_cat(res.getInt(9));
				ann.setEtat(res.getString(6));
			
				ann.setPrice(res.getInt(7)); 
				ann.setTitle(res.getString(8));
				ann.setType(res.getString(10));
				ann.setTop(res.getString(11));
			}
			
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		return ann;
	}
	
	public static ArrayList<Annonce> getAllAnnonce() throws SQLException
	{
			
		
		ArrayList<Annonce> annonces = new ArrayList<Annonce>();
		
		String sql = "SELECT * FROM `annonce` order by `date` desc  ";
		Connection con = (Connection) connect.loadDatabase();
		Statement statement = (Statement) con.createStatement();
		DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
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
			
			ann.setId_cat(res.getInt(6));
			ann.setEtat(res.getString(7));
		
			ann.setPrice(res.getInt(8)); 
			ann.setTitle(res.getString(9));
			ann.setType(res.getString(10));
			ann.setTop(res.getString(11));
			
			
			 
           
			
			annonces.add(ann);
		}
		
		con.close();
		
	
	
	return annonces;
	}
	
	public static ArrayList<Annonce> getAllAnnonceTop() throws SQLException
	{
		ArrayList<Annonce> annonces = new ArrayList<Annonce>();
		
		
		// `ID_annonce`, `ID_off`, `image`, `descreption`, `date`, `etat`, `price`, `title`, `ID_categorie`, `Type`, `top` 
		String sql = "SELECT * FROM `annonce` WHERE `top`='ok' order by `date` desc ; ";
		Connection con = (Connection) connect.loadDatabase();
		Statement statement = (Statement) con.createStatement();
		DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
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
			
			ann.setId_cat(res.getInt(9));
			ann.setEtat(res.getString(6));
		
			ann.setPrice(res.getInt(7)); 
			ann.setTitle(res.getString(8));
			ann.setType(res.getString(10));
			ann.setTop(res.getString(11));
           
			
			annonces.add(ann);
		}
		
		con.close();
		
	
	
	return annonces;
	}
	
	public static int getIdOff(int id_annonce) throws SQLException
	{
		
			int ac=0;
		
		try{
	 
			String sql = "SELECT ID_off FROM `annonce` WHERE `ID_annonce`=?";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			
			preparedStatement.setInt(1, id_annonce);
			
			ResultSet res = preparedStatement.executeQuery();
			if(res.next())
			{
				
				ac = res.getInt(1);
			}
			
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		
		return ac;
	}
	
	
	
	
	
	
	public static int getIdCae(String categorie) throws SQLException
	{
		
	 int ac=0;
		
		try{
	 
			String sql = "SELECT `ID_categorie` FROM `categorie` WHERE `nom_categorie`=?";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			
			preparedStatement.setString(1, categorie);
			
			ResultSet res = preparedStatement.executeQuery();
			if(res.next())
			{
				
				ac = res.getInt(1);
			}
			
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		System.out.print("IIIDDDDDDDDDDDDDDD categorie"+ac);
		return ac;
	}
	
	
	public static ArrayList<Annonce> get_Annonce_By_Categorie(String cate) throws SQLException
	{
		
		ArrayList<Annonce> annonces = new ArrayList<Annonce>();
		
		try{
			DateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
			   System.out.println(formatDate.format(new java.util.Date()));
			
			String sql = "SELECT `ID_annonce`, `ID_off`, `image`, `descreption`, annonce.`ID_categorie`, `date`, `etat` FROM `annonce`,`categorie` where annonce.`ID_categorie` =categorie.`ID_categorie` and nom_categorie='"+cate+"'";
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
				ann.setId_cat(res.getInt(5));
				
				Date maDate = res.getDate(6 );
				
				String datt=formatDate.format(maDate);
				ann.setDatepub(datt); 
				ann.setEtat(res.getString(7));	
				
				annonces.add(ann);
			}
			
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		return annonces;
	}
	
	public static ArrayList<Annonce> get_Annonce_By_ville (String ville) throws SQLException
	{
		
		ArrayList<Annonce> annonces = new ArrayList<Annonce>();
		
		try{
			DateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
			   System.out.println(formatDate.format(new java.util.Date()));
			
			String sql = "SELECT `ID_annonce`, offreur_service.`ID_off`, `image`, annonce.`descreption`, `ID_categorie`, `date`, `etat` FROM `annonce`,`offreur_service` where  `ville`='"+ville+"'";
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
				ann.setId_cat(res.getInt(5));
				
				Date maDate = res.getDate(6 );
				
				String datt=formatDate.format(maDate);
				ann.setDatepub(datt); 
				ann.setEtat(res.getString(7));	
				
				annonces.add(ann);
			}
			
			
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		return annonces;
	}
	
	static public void addimage(String image)
	{
		try{
DateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
			   System.out.println(formatDate.format(new java.util.Date()));
			
			String sql = "INSERT INTO `image_table`(`id`, `firstname`, `lastname`, `filename`, `path`) VALUES (?,?,?,?,?);";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			
			preparedStatement.setInt(1,5 );
			preparedStatement.setString(2, "ayy");
			preparedStatement.setString(3, "dartz");
			preparedStatement.setString(4,image);
			preparedStatement.setString(5, "nnnnnnn");
			
			preparedStatement.executeUpdate();
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
	}
public static ArrayList<Annonce> accepteAnnonce() throws SQLException
	{
		
		ArrayList<Annonce> annonces = new ArrayList<Annonce>();
		
		try{
			
			String sql = "SELECT * FROM `annonce` where `etat`='Accepter'";
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
				ann.setId_cat(res.getInt(5));
				ann.setDatepub(res.getString(6)); 
				ann.setEtat(res.getString(7));	
				
				annonces.add(ann);
			}
			
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		return annonces;
	}
	
	public static void addforOff(int id,Annonce a,int idcat) throws SQLException
	{
		
				DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			   System.out.println("fffffffffffffffffffffffffffffffffffff");
			   Connection con = (Connection) connect.loadDatabase();
				
				String input = formatDate.format(new java.util.Date());
			
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern( "yyyy-MM-dd" ) ;
				LocalDate localDate = LocalDate.parse( input, formatter ) ;
				System.out.println("HHHHHHHHHHHH"+localDate);
				
				String sql = "INSERT INTO `annonce`( `ID_off`, `image`, `descreption`, `ID_categorie`, `date`) VALUES (?,?,?,?,?);";

				PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);				
				
			preparedStatement.setInt(1,id );
			preparedStatement.setString(2, a.getImage());
			preparedStatement.setString(3, a.getDescription());
			preparedStatement.setInt(4,idcat);
			//preparedStatement.setString(5, a.getEtat());
			preparedStatement.setObject(5, localDate);
			preparedStatement.executeUpdate();
			System.out.println("MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM");
			con.close();
			
			//con.close();
			
		
	}
	public static int recupereIDcat(int id) throws SQLException
	{
		
			
			//String sql ="SELECT `ID_categorie` FROM `offreur_service`,`categorie` where `ID_off`='"+id+"'";
		String sq="SELECT ID_categorie FROM categorie,offreur_service where categorie.nom_categorie=offreur_service.nom_categorie and ID_off="+id;
		Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sq);
			int idcat=res.getInt(1);
			System.out.println("idcatttttt:"+idcat);
			con.close();
		     return idcat;
		
			
			
	}
	
	public static String getNomCat(int idCat) throws SQLException
	{
		String nomcat="hmad";
		String sq="SELECT `nom_categorie` FROM `categorie` WHERE `ID_categorie`="+idCat;
		Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
		try {	
			ResultSet res = statement.executeQuery(sq);
			nomcat=(String)res.getString(1);
		}catch(Exception e) {
			
		}
			con.close();
		     return nomcat;
	}
	
	
	public static ArrayList<String> selctCa() throws SQLException
	{
		
			
			//String sql ="SELECT `ID_categorie` FROM `offreur_service`,`categorie` where `ID_off`='"+id+"'";
		String sq="SELECT nom_categorie FROM categorie  " ;
		ArrayList<String> cate = new ArrayList<String>();
		
		
		Connection con = (Connection) connect.loadDatabase();
			
			
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sq);
			while(res.next())
			{
				cate.add(res.getString(1));
			
		 
			}
			con.close();
		     return cate;
		
			
			
	}
	
	
	
	public static ArrayList<String> selctVille() throws SQLException
	{
		
			
			
		String sq="SELECT `ville` FROM `offreur_service` " ;
		ArrayList<String> cate = new ArrayList<String>();
		
		
		
		Connection con = (Connection) connect.loadDatabase();
			
			
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sq);
			while(res.next())
			{
				cate.add(res.getString(1));
			
		 
			}
			con.close();
		     return cate;
		
			
			
	}
	
	
	
	public static  String  selctVille(int id_off) throws SQLException
	{
		
			
			//String sql ="SELECT `ID_categorie` FROM `offreur_service`,`categorie` where `ID_off`='"+id+"'";
		String sq="SELECT `ville` FROM `offreur_service` WHERE `ID_off`= "+id_off ;
		 String  cate="" ;
		
		
		
		 Connection con = (Connection) connect.loadDatabase();
			
			
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sq);
		if(res.next())
			{
				cate=res.getString(1);
			
		 
			}
			con.close();
		     return cate;
		
			
			
	}
	
	public static  String  selectNom(int id_off) throws SQLException
	{
		
			
			//String sql ="SELECT `ID_categorie` FROM `offreur_service`,`categorie` where `ID_off`='"+id+"'";
		String sq="SELECT `nom`,`prenom` FROM `offreur_service` WHERE `ID_off`="+id_off ;
		 String  cate="" ;
		
		
		
		 Connection con = (Connection) connect.loadDatabase();
			
			
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sq);
		if(res.next())
			{
				cate=res.getString(1);
				cate += "_";
				cate += res.getString(2);
		 
			}
			con.close();
		     return cate;
		
			
			
	}
	public static  String  selectNomcli(int id_off) throws SQLException
	{
		
			
			//String sql ="SELECT `ID_categorie` FROM `offreur_service`,`categorie` where `ID_off`='"+id+"'";
		String sq="SELECT `nom`,`prenom` FROM `client` WHERE `ID_Client`="+id_off ;
		 String  cate="" ;
		
		
		
		 Connection con = (Connection) connect.loadDatabase();
			
			
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sq);
		if(res.next())
			{
				cate=res.getString(1);
				cate += " ";
				cate += res.getString(2);
		 
			}
			con.close();
		     return cate;
		
			
			
	}
	
	public static String getImage(String image ) {
		System.out.print("aaaaaaaaaaaaaaaaaaa          ");
		String[] decoupe = image.split("\\\\");
		
		int indes= decoupe.length;
		System.out.print("bbbbbbbbbbb          "+indes);
		String doussier =decoupe[indes-1];
		System.out.print("cccccccccccccc         ");
		String result=".\\img\\"+doussier;
		System.out.print("ddddddddddddd         ");
		System.out.print("iiiiiiiiiiiiiiimageimage           "+result);
		return result;
	}
	
}
