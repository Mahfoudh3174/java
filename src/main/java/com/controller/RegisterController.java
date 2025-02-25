package com.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.data.UserDB;
import com.model.User;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/auth/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession session = request.getSession();
          try {
        	  User user=new User();
            // Validate Numero
            String numero = request.getParameter("numero");
            if (numero == null || numero.trim().isEmpty()) {
                throw new IllegalArgumentException("Numero ne peut pas etre vide.");
            }
            
            if(UserDB.isUser(numero)) {
            	throw new IllegalArgumentException("l'utilisateur dejas existe.");
            }
            
            user.setNumero(numero);

            // Validate Nom
            String nom = request.getParameter("nom");
            if (nom == null || nom.trim().isEmpty() ) {
                throw new IllegalArgumentException("Nom ne peut pas etre vide.");
            }
            if (!UserDB.isUnique(nom)) {
          	  throw new IllegalArgumentException("utilisateur dejas existe.");
            }
            user.setNom(nom);
            
;
            // Validate Prenom
            String prenom = request.getParameter("prenom");
            if (prenom == null || prenom.trim().isEmpty()) {
                throw new IllegalArgumentException("Prenom ne peut pas etre vide.");
            }
            user.setPrenom(prenom);

            // Validate Email
            String email = request.getParameter("email");
            if (email == null || email.trim().isEmpty()) 
            {
                throw new IllegalArgumentException("email ne peut pas etre vide.");
            }
            if(!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]{5,10}+$")) {
            	throw new IllegalArgumentException("format de l'email est invalide.");
            }
            user.setEmail(email);

            // Validate Password
            String password = request.getParameter("password");
            if (password == null || password.trim().isEmpty()) {
                throw new IllegalArgumentException("Mot de passe ne peut pas etre vide.");
            }
            user.setPassword(password);

            

            
            UserDB.addUser(user);
        	session.setAttribute("success", "user created successfuly");
        	response.sendRedirect(request.getContextPath()+"/Login");
            //request.getRequestDispatcher("/WEB-INF/auth/login.jsp").forward(request, response);

        } catch (IllegalArgumentException e) {
            session.setAttribute("fail", e.getMessage());
            response.sendRedirect(request.getContextPath()+"/Register");
        }

	}

}
