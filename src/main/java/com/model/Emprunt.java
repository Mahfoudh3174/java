package com.model;

import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

public class Emprunt {

	
		private String id=UUID.randomUUID().toString();
		private String numero;
		private Date dateE;
		private Date dateR;
		private String ISBN;
		private String statut="en cours"; 
		
	    public Emprunt() {
	    	

	    }

		public Emprunt(String numero,String iSBN) {
			super();
			this.numero = numero;
			ISBN = iSBN;
			this.id = UUID.randomUUID().toString();
		}

		public String getNumero() {
			return numero;
		}

		public void setNumero(String numero) {
			this.numero = numero;
		}

		public Date getDateR() {
			return dateR;
		}


		public Date getDateE() {
			return dateE;
		}



		public String getISBN() {
			return ISBN;
		}

		public void setISBN(String iSBN) {
			ISBN = iSBN;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getStatut() {
			return statut;
		}

		public void setStatut(String statut) {
			this.statut = statut;
		}

		public void setDateE(Date dateE) {
			this.dateE = dateE;
		}

		public void setDateR(Date dateR) {
			this.dateR = dateR;
		}
		
		

	}



