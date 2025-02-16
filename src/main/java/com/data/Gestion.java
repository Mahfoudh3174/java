package com.data;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.model.Emprunt;
import com.model.Retour;

public class Gestion {

	    
	    private static Map<String, Emprunt> emprunts = new HashMap<>(); // Using a Map for fast lookup
	    private static Map<String, Retour> retoures = new HashMap<>();  // Map for retours

	    public static Map<String, Emprunt> getEmprunts() {
	        return emprunts;
	    }

	    public static Map<String, Retour> getRetours() {
	        return retoures;
	    }

	    public static Emprunt findEmp(String numero, String isbn) {
	        return emprunts.values().stream()
	                .filter(em -> em.getISBN().equals(isbn) && em.getNumero().equals(numero))
	                .findFirst()
	                .orElse(null);
	    }

	    public static Emprunt findEmpId(String idEmp) {
	        return emprunts.get(idEmp); // Direct lookup instead of looping
	    }

	    public static boolean addEmprunter(Emprunt em) {
	        String key = em.getId(); // Assuming Emprunt has a unique ID
	        
	        if (emprunts.containsKey(key)) {
	            Emprunt existingEmprunt = emprunts.get(key);
	            if ("en attente".equals(existingEmprunt.getStatut())) {
	                return false; // Already pending
	            } else if ("retourner".equals(existingEmprunt.getStatut())) {
	                emprunts.put(key, em); // Re-add if returned
	                return true;
	            }
	            return false;
	        }

	        emprunts.put(key, em); // Add new emprunt
	        return true;
	    }

	    public static void deleteEmp(String numero, String isbn) {
	        emprunts.entrySet().removeIf(entry -> 
	            entry.getValue().getNumero().equalsIgnoreCase(numero) && entry.getValue().getISBN().equals(isbn)
	        );
	    }

	    public static void accepter(String numero, String isbn) {
	        Emprunt em = findEmp(numero, isbn);
	        if (em != null) {
	            em.setStatut("emprunter");
	            BookDB.decrement(isbn);
	        }
	    }

	    public static void retour(String idEmp) {
	        Emprunt emp = findEmpId(idEmp);
	        if (emp != null) {
	            emp.setStatut("retourner");

	            Date date = new Date();
	            Retour re = new Retour(date, idEmp);
	            retoures.put(idEmp, re);

	            BookDB.increment(emp.getISBN());
	        }
	    }

	    public static Date findRetour(String idEmp) {
	        Retour re = retoures.get(idEmp);
	        return (re != null) ? re.getDateR() : null;
	    }
	}



