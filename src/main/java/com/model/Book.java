package com.model;



public class Book {

	private String ISBN;
	private String titre;
	private String auteur;
	private String publication;
	private int quantity;
	
	public Book() {
		
	}
	

	public Book(String iSBN, String titre, String auteur, String publication, int quantity) {
		
		ISBN = iSBN;
		this.titre = titre;
		this.auteur = auteur;
		this.publication = publication;
		this.quantity = quantity;
	}
	
	public void decriment() {
		this.quantity-=1;
	}
	public void incriment() {
		this.quantity+=1;
	}


	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public String getAuteur() {
		return auteur;
	}

	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}

	public String getPublication() {
		return publication;
	}

	public void setPublication(String publication) {
		this.publication = publication;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
