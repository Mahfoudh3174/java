package com.model;



public class User {
	
	private String numero;
	private String nom;
	private String prenom;
	private String email;
    private String password;
    private String role="user";

    public User() {
    }
    public User(String nom,String password,String role) {
    	this.nom=nom;
    	this.password=password;
    	this.role=role;
    }

    public User(String numero, String nom, String prenom,String email, String password) {
		super();
		this.numero = numero;
		this.nom = nom;
		this.prenom = prenom;
		this.email=email;
		this.password = password;
	}
    


	public User( String nom, String password) {
		super();

		this.nom = nom;
		this.password = password;
	}


	public String getNumero() {
		return numero;
	}


	public void setNumero(String numero) {
		this.numero = numero;
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


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}

	




}
