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
		private String statut="en attente"; 
		
	    public Emprunt() {
	    	
	        // Set dateE to the current date
	        this.dateE = new Date();
	        
	        // Set dateR to one week after the current date
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(this.dateE);
	        calendar.add(Calendar.DAY_OF_MONTH, 7);
	        this.dateR = calendar.getTime();
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
		
		

	}



