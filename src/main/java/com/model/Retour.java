package com.model;

import java.util.Date;
import java.util.UUID;

public class Retour {
	private String id= UUID.randomUUID().toString();
	private Date dateR;
	private String idEmp;
	
	public Retour() {}
	public Retour(Date dateR,String idEmp) {
		super();
		this.dateR = dateR;
		this.idEmp=idEmp;
	}
	public Date getDateR() {
		return dateR;
	}
	public void setDateR(Date dateR) {
		this.dateR = dateR;
	}
	public String getIdEmp() {
		return idEmp;
	}
	public void setIdEmp(String idEmp) {
		this.idEmp = idEmp;
	}
	
	
	



}
