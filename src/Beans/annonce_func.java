package Beans;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class annonce_func {
	
	
	
	
	public void add(int id,Annonce a)
	{
		try{
DateFormat formatDat = new SimpleDateFormat("yyyy/MM/dd");
			//   System.out.println("0000000000000000000000000000"+formatDat.format(new java.util.Date()));
			   
			   
			   
			   DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			  // System.out.println("eeeeeeeeeeeeeee");
				Connection con = (Connection) connect.loadDatabase();
				
				String input = formatDate.format(new java.util.Date());
			
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern( "yyyy-MM-dd" ) ;
				LocalDate localDate = LocalDate.parse( input, formatter ) ;
				System.out.println("333333333333"+localDate);
				
				
			String sql = "INSERT INTO `annonce`(`ID_off`, `image`, `descreption`, `ID_categorie`,`etat`,`date`) VALUES (?,?,?,?,?,?);";
		
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			
			preparedStatement.setInt(1,id );
			preparedStatement.setString(2, a.getImage());
			preparedStatement.setString(3, a.getDescription());
			preparedStatement.setInt(4,3);
			preparedStatement.setString(5, a.getEtat());
			preparedStatement.setObject(6, localDate);
			preparedStatement.executeUpdate();
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	public static int update(int id, String description, String image, String etat) throws SQLException
	{
		int check = 0;
		
		
		try{
			
			String sql = "UPDATE `annonce` SET `image`=?,`descreption`=?, `etat`=?   WHERE ID_annonce=?";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			preparedStatement.setString(1, image);
			preparedStatement.setString(2,description);
			preparedStatement.setString(3, etat);
			preparedStatement.setInt(4, id);
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
				ann.setId_cat(res.getInt(5));
				
				Date maDate = res.getDate(6 );
				
				String datt=formatDate.format(maDate);
				
				ann.setDate(datt); 
			
				ann.setEtat(res.getString(7)); 
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
		
	
			
			String sql = "SELECT `ID_annonce`, `ID_off`, `image`, `descreption`, `ID_categorie`, `date`, `etat` FROM `annonce` order by `date` desc  ";
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
				ann.setId_cat(res.getInt(5));
				
				Date maDate = res.getDate(6 );
				
				String datt=formatDate.format(maDate);
				
				ann.setDate(datt); 
			
				ann.setEtat(res.getString(7));	
				
				
				 
               
				
				annonces.add(ann);
			}
			
			con.close();
			
		
		
		return annonces;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public static int getIdOff(String id_annonce) throws SQLException
	{
		
	 int ac=0;
		
		try{
	 
			String sql = "SELECT ID_off FROM `annonce` WHERE `ID_annonce`=?";
			Connection con = (Connection) connect.loadDatabase();;
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			
			preparedStatement.setString(1, id_annonce);
			
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
			Connection con = (Connection) connect.loadDatabase();;
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
	
	
	public static List<Annonce> get_Annonce_By_Categorie(String cate) throws SQLException
	{
		
		List<Annonce> annonces = new ArrayList<Annonce>();
		
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
				ann.setDate(datt); 
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
	
	
	public static void addforOff(int id,Annonce a,int idcat) throws SQLException
	{
		
				DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			   //System.out.println("fffffffffffffffffffffffffffffffffffff");
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
		//	System.out.println("MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM");
			con.close();
			
			//con.close();
			
		
	}
	
	public static int updateforann(int id,String desc, String title,String Type,int price) throws SQLException
	{
		int check = 0;
		
		
		try{
			
			String sql = "UPDATE `annonce` SET  `descreption`=?,`title`=?,`Type`=?,`price`=?   WHERE ID_annonce=?";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			
			
			preparedStatement.setString(1, desc);
			preparedStatement.setString(2, title);
			preparedStatement.setString(3, Type);
			preparedStatement.setInt(4, price);
			preparedStatement.setInt(5, id);
			check = preparedStatement.executeUpdate();
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		return check;
	}
	
	public static ArrayList<Annonce> getAllAnnonce(int id) throws SQLException
	{
		
		ArrayList<Annonce> annonces = new ArrayList<Annonce>();
		
	
			
			String sql = "SELECT `ID_annonce`, `ID_off`, `image`, `descreption`, `date`, `etat`, `price`, `title`, `ID_categorie`,`Type` FROM `annonce` where `ID_off`='"+id+"'";
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
				ann.setId_cat(res.getInt(9));
				
				Date maDate = res.getDate(5);
				
				String datt=formatDate.format(maDate);
				
				ann.setDate(datt); 
			
				ann.setEtat(res.getString(6));
				ann.setTitre(res.getString(8));
				ann.setPrice(res.getInt(7));
				ann.setType(res.getString(10));
				annonces.add(ann);
			}
			con.close();
		return annonces;
	}
	
	
	
	public static List<Annonce> get_Annonce_By_ville (String ville) throws SQLException
	{
		
		List<Annonce> annonces = new ArrayList<Annonce>();
		
		try{
			DateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
			   System.out.println(formatDate.format(new java.util.Date()));
			
			String sql = "SELECT `ID_annonce`, offreur_service.`ID_off`, `image`, annonce.`descreption`, `date`, `etat`,`ID_categorie`,`price`, `title` ,`ID_categorie`, `Type` FROM `annonce`,`offreur_service` where  `ville`='"+ville+"'";
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
				ann.setId_cat(res.getInt(9));
				
				Date maDate = res.getDate(5 );
				
				String datt=formatDate.format(maDate);
				ann.setDate(datt); 
				ann.setEtat(res.getString(6));	
				ann.setTitre(res.getString(8));
				ann.setPrice(res.getInt(7));
				ann.setType(res.getString(10));
				annonces.add(ann);
			}
			
			
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		return annonces;
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
				ann.setId_cat(res.getInt(9));
				ann.setDate(res.getString(5)); 
				ann.setEtat(res.getString(6));	
				ann.setTitre(res.getString(8));
				ann.setPrice(res.getInt(7));
				annonces.add(ann);
			}
			
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		return annonces;
	}
	
	public static void addforOff(int id,String cat,String fn,String desc,String title,int price,String Type ) throws SQLException
	{
		int i=getIdCae(cat);
				DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
				Connection con = (Connection) connect.loadDatabase();
				String input = formatDate.format(new java.util.Date());
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern( "yyyy-MM-dd" ) ;
				LocalDate localDate = LocalDate.parse( input, formatter ) ;
				String sql = "INSERT INTO `annonce`( `ID_off`,`image`,`descreption`,`date`,`price`,`title`,`ID_categorie`,`Type`) VALUES (?,?,?,?,?,?,?,?);";
				PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
				try {
			preparedStatement.setInt(1,id );
			preparedStatement.setString(2, fn);
			preparedStatement.setString(3, desc);
			//preparedStatement.setString(5, a.getEtat());
			preparedStatement.setObject(4, localDate);
			preparedStatement.setInt(5,price);
			preparedStatement.setString(6,title);
			preparedStatement.setInt(7,i);
			preparedStatement.setString(8,Type);
			preparedStatement.executeUpdate();}
				catch (Exception e) {
				System.out.println("errreuuurrrrrrrrrrrrrrrrr"+e);
				}
			
			con.close();	
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
	public static ArrayList<String> selctCa() throws SQLException
	{
		
			
			//String sql ="SELECT `ID_categorie` FROM `offreur_service`,`categorie` where `ID_off`='"+id+"'";
		String sq="SELECT nom_categorie FROM categorie " ;
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
		
			
			//String sql ="SELECT `ID_categorie` FROM `offreur_service`,`categorie` where `ID_off`='"+id+"'";
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
	
	public static  String  selctNOm(int id_off) throws SQLException
	{
		
			
			//String sql ="SELECT `ID_categorie` FROM `offreur_service`,`categorie` where `ID_off`='"+id+"'";
		String sq="SELECT `nom` FROM `offreur_service` WHERE `ID_off`="+id_off ;
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
	public static ArrayList<Annonce> getAllAannonce() throws SQLException
	{
		
		ArrayList<Annonce> annonces = new ArrayList<Annonce>();
		
	
			
			String sql = "SELECT `ID_annonce`, `ID_off`, `image`, `descreption`, `date`, `etat`, `price`, `title`, `ID_categorie`,`Type` FROM `annonce`";
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
				ann.setId_cat(res.getInt(9));
				Date maDate = res.getDate(5);
				String datt=formatDate.format(maDate);
				ann.setDate(datt); 
				ann.setEtat(res.getString(6));
				ann.setTitre(res.getString(8));
				ann.setPrice(res.getInt(7));
				ann.setType(res.getString(10));
				annonces.add(ann);
			}
			
			con.close();
		return annonces;
	}
	public static int compterNombreAnnonce()
	{
		int nbr=0;
      try{
			
			String sql = "SELECT COUNT(ID_annonce) FROM `annonce`";
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
	public static int compterNombreAnnonceAccepter()
	{
		int nbr=0;
      try{
			
			String sql = "SELECT COUNT(ID_annonce) FROM `annonce` where etat='Accepter'";
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
	public static int compterNombreAnnonceRefuser()
	{
		int nbr=0;
      try{
			
			String sql = "SELECT COUNT(ID_annonce) FROM `annonce` where etat='Refuser'";
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
	public static int compterNombreAnn(int id)
	{
		int nbr=0;
      try{
			
			String sql = "SELECT COUNT(ID_annonce) FROM `annonce` where ID_off='"+id+"'";
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
	public static int compterNombreAnnonceAccept(int id)
	{
		int nbr=0;
      try{
			
			String sql = "SELECT COUNT(ID_annonce) FROM `annonce` where etat='Accepter' and ID_off='"+id+"'";
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
	public static int compterNombreAnnonceRefus(int id)
	{
		int nbr=0;
      try{
			
			String sql = "SELECT COUNT(ID_annonce) FROM `annonce` where etat='Refuser' and ID_off='"+id+"'";
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
	public static String getCae(int id) throws SQLException
	{
		
	 String ac=" ";
		
		try{
	 
			String sql = "SELECT `nom_categorie` FROM `categorie` WHERE `ID_categorie`=?";
			Connection con = (Connection) connect.loadDatabase();
			PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(sql);
			
			preparedStatement.setInt(1, id);
			
			ResultSet res = preparedStatement.executeQuery();
			if(res.next())
			{
				
				ac = res.getString(1);
			}
			
			con.close();
			
		}catch(SQLException e1){
			e1.printStackTrace();
		}
		
		//System.out.print("IIIDDDDDDDDDDDDDDD categorie"+ac);
		return ac;
	}
	public static ArrayList<Annonce> recherche(String key ,String ville,String categor,int start, int total) throws SQLException
	{
		System.out.println("etape0");
		ArrayList<Annonce> annonces = new ArrayList<Annonce>();
		
	
		System.out.println("etape1");
			String sql ="";
			//"SELECT `ID_annonce`, `ID_off`, `image`, `descreption`, `ID_categorie`, `date`, `etat` FROM `annonce` order by `date` desc limit "+(start-1)+","+total;  WHERE `offreur_service`.`ID_off`= `annonce`.`ID_off`
			
if(key!=null && ville==null && categor==null){
				
	sql ="SELECT `ID_annonce`, `ID_off`, `image`, `descreption`,`etat`,`date`,`price`,`title`,`ID_categorie`,`Type` FROM `annonce` where `descreption`like'%"+key+"%'or title like '%"+key+"%' order by `date` desc limit "+(start-1)+","+total;
			}
			else if(key==null && ville!=null && categor==null){
				sql ="SELECT DISTINCT `ID_annonce`, `ID_off`, `image`, `descreption`,`etat`,`date`,`price`,`title`,`ID_categorie`,`Type` FROM `annonce` where  `etat`='Accepter' and ( SELECT `ville` FROM `offreur_service` WHERE `offreur_service`.`ID_off`= `annonce`.`ID_off` )LIKE '%"+ville+"%' order by `date` desc LIMIT "+(start-1)+","+total;
				
			}
			else if(key==null && ville==null && categor!=null){
				
				sql="SELECT DISTINCT `ID_annonce`, `ID_off`, `image`, `descreption`,`etat`,`date`,`price`,`title`,`ID_categorie`,`Type` FROM `annonce` where  `etat`='Accepter' and ( SELECT `nom_categorie` FROM `categorie` WHERE  etat `categorie`.`ID_categorie`= `annonce`.`ID_categorie` )LIKE '%"+categor+"%' order by `date` desc LIMIT "+(start-1)+","+total;
			}
			else if(key!=null && ville!=null && categor==null){
				sql="SELECT DISTINCT `ID_annonce`, `ID_off`, `image`, `descreption`,`etat`,`date`,`price`,`title`,`ID_categorie`,`Type` FROM `annonce` where `etat`='Accepter' and (`descreption`like'%"+key+"%' and ( SELECT `ville` FROM `offreur_service` WHERE `offreur_service`.`ID_off`= `annonce`.`ID_off` )LIKE '%"+ville+"%') order by `date` desc LIMIT "+(start-1)+","+total;
				
			}
			else if(key==null && ville!=null && categor!=null){
				
				sql="SELECT DISTINCT `ID_annonce`, `ID_off`, `image`, `descreption`,`etat`,`date`,`price`,`title`,`ID_categorie`,`Type` FROM `annonce` where `etat`='Accepter' and (( SELECT `nom_categorie` FROM `categorie` WHERE `categorie`.`ID_categorie`= `annonce`.`ID_categorie` )LIKE '%"+categor+"%' and ( SELECT `ville` FROM `offreur_service` WHERE `offreur_service`.`ID_off`= `annonce`.`ID_off` )LIKE '%"+ville+"%') order by `date` desc LIMIT "+(start-1)+","+total;
			}
			else if(key!=null && ville==null && categor!=null){
				
				sql="SELECT DISTINCT `ID_annonce`, `ID_off`, `image`, `descreption`,`etat`,`date`,`price`,`title`,`ID_categorie`,`Type` FROM `annonce` where `etat`='Accepter' and ( ( SELECT `nom_categorie` FROM `categorie` WHERE `categorie`.`ID_categorie`= `annonce`.`ID_categorie` )LIKE '%"+categor+"%' and (`descreption`like'%"+key+"%'or title like '%"+key+"%')) order by `date` desc LIMIT "+(start-1)+","+total;
			}else if(key!=null && ville!=null && categor!=null){
			
				sql="SELECT DISTINCT `ID_annonce`, `ID_off`, `image`, `descreption`,`etat`,`date`,`price`,`title`,`ID_categorie`,`Type` FROM `annonce` where `etat`='Accepter' and ( ( SELECT `nom_categorie` FROM `categorie` WHERE `categorie`.`ID_categorie`= `annonce`.`ID_categorie` )LIKE '%"+categor+"%' and   ( SELECT `ville` FROM `offreur_service` WHERE `offreur_service`.`ID_off`= `annonce`.`ID_off` )LIKE '%"+ville+"%' and(`descreption`like'%"+key+"%'or title like '%"+key+"%')) order by `date` desc LIMIT "+(start-1)+","+total;
			}

			else{ return annonces;}
System.out.println("etape2");
			Connection con = (Connection) connect.loadDatabase();
			Statement statement = (Statement) con.createStatement();
			DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			ResultSet res = statement.executeQuery(sql);
			System.out.println("etape3");
			while(res.next())
			{
				Annonce ann = new Annonce();
				
				ann.setId(res.getInt(1));
				ann.setId_off(res.getInt(2));
				ann.setImage(res.getString(3));
				ann.setTitre(res.getString(8));
				ann.setPrice(res.getInt(7));
				ann.setDescription(res.getString(4));
				ann.setId_cat(res.getInt(9));
				ann.setType(res.getString(10));
				Date maDate = res.getDate(6 );
				String datt=formatDate.format(maDate);
				
				ann.setDate(datt); 
			
				ann.setEtat(res.getString(5));	
				
				annonces.add(ann);
			}
			System.out.println("etape4");
			
			con.close();
			
		
		
		return annonces;
	}
	public static ArrayList<Annonce> pagenation(int start, int total) throws SQLException
	{
		
		ArrayList<Annonce> annonces = new ArrayList<Annonce>();
		
	
			
			String sql = "SELECT `ID_annonce`, `ID_off`, `image`, `descreption`,`etat`,`date`,`price`,`title`,`ID_categorie`,`Type` FROM `annonce` where  `etat`='Accepter'  order by `date` desc limit "+(start-1)+","+total;
			
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
				ann.setTitre(res.getString(8));
				ann.setPrice(res.getInt(7));
				ann.setDescription(res.getString(4));
				ann.setId_cat(res.getInt(9));
				
				Date maDate = res.getDate(6);
				
				String datt=formatDate.format(maDate);
				
				ann.setDate(datt); 
			
				ann.setEtat(res.getString(5));	
				ann.setType(res.getString(10));
				annonces.add(ann);
				
			}
			
			con.close();
			
		return annonces;
	}
	public static  String  selctcatego(int id__cat) throws SQLException
	{
		
			
			//String sql ="SELECT `ID_categorie` FROM `offreur_service`,`categorie` where `ID_off`='"+id+"'";
		String sq="SELECT `nom_categorie` FROM `categorie` WHERE `categorie`.`ID_categorie`= "+id__cat ;
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
		
			
			
	}	public static int getIdOffh(int id_annonce) throws SQLException
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
				cate += " ";
				cate += res.getString(2);
		 
			}
			con.close();
		     return cate;
	}
	public static ArrayList<Annonce> getAllAnnonceTop() throws SQLException
	{
		ArrayList<Annonce> annonces = new ArrayList<Annonce>();
		
		
		
		String sql = "SELECT * FROM `annonce` WHERE `top`='ok' order by `date` desc  ";
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
			ann.setDate(datt); 
			
			ann.setId_cat(res.getInt(9));
			ann.setEtat(res.getString(6));
		
			ann.setPrice(res.getInt(7)); 
			ann.setTitre(res.getString(8));
			ann.setType(res.getString(10));
			ann.setTop(res.getString(11));
           
			
			annonces.add(ann);
		}
		
		con.close();
		
	
	
	return annonces;
	}
	public static  String  selectNomClient(int id_client) throws SQLException
	{
		
			
			//String sql ="SELECT `ID_categorie` FROM `offreur_service`,`categorie` where `ID_off`='"+id+"'";
		String sq="SELECT `nom`,`prenom` FROM `client` WHERE `ID_Client`="+id_client ;
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
	
	public static  double  sum_des_Star(int id_off) throws SQLException
	{
		
		
		String sq="SELECT sum(`stars`)  from  `evaluation`  WHERE `ID_off`= "+id_off ;
		double  cate=0.0;
		
			Connection con = (Connection) connect.loadDatabase();
			
			
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sq);
		if(res.next())
			{
				cate=res.getDouble(1);
			
		 
			}
			con.close();
		     return cate;
		
			
			
	}
	
	
	
	public static  void  inset(int id_off,double nbr_star,int id_client ) throws SQLException
	{
		
		
		double nbrClient=(double)annonce_func.nombre_des_visteur(id_off);
		
		double inbr_des_star=annonce_func.sum_des_Star(id_off);
		if(nbrClient==0){nbrClient=1.0;}
		double moyen=inbr_des_star/nbrClient;
		 
		
		
		annonce_func.vote( id_off,  nbr_star,id_client , moyen);
		
		 
		     
		
			
			
	}
	
	
//	public static  void  update(int id_off,double nbr_star,int id_client ) throws SQLException
//	{
//		
//		
//		double nbrClient=(double)annonce_func.nombre_des_visteur(id_off);
//		
//		double inbr_des_star=annonce_func.sum_des_Star(id_off);
//		if(nbrClient==0){nbrClient=1.0;}
//		 
//		 
//		
//		
//		annonce_func.update1(nbr_star,id_client );
//		
//		 
//		     
//		
//			
//			
//	}
	
	
	
	public static  void  update1( double nbr_star,int id_client ,int id_Off  ) throws SQLException
	{
		
		String slq2="UPDATE `evaluation` SET  `nbr_star`=? WHERE  `id_client`=? and `id_off`=?";
		Connection con = (Connection) connect.loadDatabase();
		 
		PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(slq2);
		
		preparedStatement.setDouble(1,nbr_star );
		preparedStatement.setInt(2,id_client);
		preparedStatement.setInt(3,id_Off);
		 
		try{
		preparedStatement.executeUpdate();
		con.close();
		
	}catch(SQLException e1){
		e1.printStackTrace();
	}
	
	}

	public static  double  selction_moyene(int id_off) throws SQLException
	{
		
		
		double nbrClient=(double)(annonce_func.nombre_des_visteur(id_off));
		
		double inbr_des_star=annonce_func.sum_des_Star(id_off);
		if(nbrClient==0.0){nbrClient=1.0;}
		double moyen=inbr_des_star/nbrClient;
		 
		     return moyen;
		
			
			
	}
	
	

		
		    
		
			
			
	

	
	
	

	public static  boolean  dejavote(int client ,int id_off) throws SQLException
	{
		
			
			 
		 
	 
		String sq="SELECT count(*)  from  `evaluation`  WHERE `id_client`= "+client+" and `ID_off`="+id_off ;
		 int  cate=0;;
		
		
		
			Connection con = (Connection) connect.loadDatabase();
			
			
			Statement statement = (Statement) con.createStatement();
			
			ResultSet res = statement.executeQuery(sq);
		if(res.next())
			{
				cate=res.getInt(1);
			
		 
			}
		   con.close();
					     if(cate!=0)
					    	 return true ;
		     else return false;		
					  

			
	}
	public static  int  nombre_des_visteur(int id_off) throws SQLException
	{
		
		
		String sq="SELECT count(*)  from  `evaluation`  WHERE `ID_off`= "+id_off ;
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
	public static  void  vote(int id_off, double nbr_star,int id_client ,double rs ) throws SQLException
	{
		
		String slq2="INSERT INTO `evaluation`( `id_off`, `id_client`, `resultat`, `nbr_star`) VALUES(?,?,?,?) ";
		Connection con = (Connection) connect.loadDatabase();
		//Statement statement = (Statement) con.createStatement();
		PreparedStatement preparedStatement = (PreparedStatement) con.prepareStatement(slq2);
		
		preparedStatement.setInt(1,id_off );
		preparedStatement.setInt(2,id_client);
		preparedStatement.setDouble(3,rs);
		preparedStatement.setDouble(4,nbr_star);
		try{
		preparedStatement.executeUpdate();
		con.close();
		
	}catch(SQLException e1){
		e1.printStackTrace();
	}
}
	
}
