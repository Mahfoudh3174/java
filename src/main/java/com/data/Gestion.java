package com.data;

import java.nio.file.FileSystems;
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
	    
	    public static boolean isEmprunt(String idEmp) {
	    	return emprunts.containsKey(idEmp);
	    }

	    public static Emprunt findEmp(String numero, String isbn) {
	        return emprunts.values().stream()
	                .filter(em -> em.getISBN().equals(isbn) && em.getNumero().equals(numero))
	                .findFirst()
	                .orElse(null);
	    }
        
	    public static Emprunt findEmpId(String idEmp) {
	        return emprunts.get(idEmp); 
	    }

	    public static boolean addEmprunter(Emprunt em) {
	        // Temporary map to store emprunts that match the condition
	        Map<String, Emprunt> emps = new HashMap<>();
            Emprunt newEmp=findEmp(em.getNumero(), em.getISBN());
	        // Iterate over the emprunts map
	        for (Map.Entry<String, Emprunt> entry : emprunts.entrySet()) {
	            Emprunt value = entry.getValue();
                
	            // Check if the value matches the one we are looking for
	            if (value.getISBN().equals(newEmp.getISBN()) && value.getNumero().equals(newEmp.getNumero())) {
	                emps.put(entry.getKey(), value);
	            }
	        }

	        // Flag to check if any emprunt is already "emprunter"
	        boolean isEmp = false;

	        // Iterate over the emps map and check if any emprunt has the status "emprunter"
	        for (Map.Entry<String, Emprunt> entry : emps.entrySet()) {
	            if (entry.getValue().getStatut().equals("emprunter")) {
	                isEmp = true;
	                break; // Stop when a match is found
	            }
	        }

	        // If an emprunt with status "emprunter" is found, return false
	        if (isEmp) {
	            return false;
	        }

	        // Otherwise, add the new emprunt to the main map
	        emprunts.put(em.getId(), em);
	        return true;
	    }





	    public static void deleteEmp(String numero, String isbn) {
	        emprunts.entrySet().removeIf(entry -> 
	            entry.getValue().getNumero().equalsIgnoreCase(numero) && entry.getValue().getISBN().equals(isbn)
	        );
	    }



	    public static void retour(String idEmp) {
	        Emprunt emp = findEmpId(idEmp);
	        
	            emp.setStatut("retourner");

	            Date date = new Date();
	            Retour re = new Retour(date, idEmp);
	            retoures.put(idEmp, re);

	            BookDB.increment(emp.getISBN());
	        
	    }

	    public static Date findRetour(String idEmp) {
	        Retour re = retoures.get(idEmp);
	        return (re != null) ? re.getDateR() : null;
	    }
	}



