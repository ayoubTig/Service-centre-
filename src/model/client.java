package model;

public class client {
private int id;

private String nom;
private String prenom;
private String email;
private String password;
private String phone;
private String genre;




	public String getGenre() {
	return genre;
}
public void setGenre(String genre) {
	this.genre = genre;
}
	
	public client(int id, String nom, String prenom, String email, String password, String phone, String genre) {
	super();
	this.id = id;
	this.nom = nom;
	this.prenom = prenom;
	this.email = email;
	this.password = password;
	this.phone = phone;
	this.genre = genre;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public client() {
		super();
	}
	
	
	
	
	
}