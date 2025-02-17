package com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.data.BookDB;
import com.model.Book;

/**
 * Servlet implementation class EditBook
 */
@WebServlet("/Admin/EditBook")
public class EditBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		System.out.println("editBook");
		try {
			String isbn=request.getParameter("isbn");
			if(isbn==null || !BookDB.isBook(isbn)) {
				throw new IllegalArgumentException("Invalid parameter");
			}
			Book book=BookDB.findBook(isbn);
			session.setAttribute("book", book);
			request.getRequestDispatcher("/WEB-INF/admin/editBook.jsp").forward(request, response);
		}
		catch (IllegalArgumentException e) {
			// TODO: handle exception
			session.setAttribute("fail", e.getMessage());
			request.getRequestDispatcher("/WEB-INF/admin/dashboard.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		try {
			
		
 		    // Validate ISBN
 		    String isbn = request.getParameter("isbn");
 		    if (!BookDB.isBook(isbn)) {
 		        throw new IllegalArgumentException("Invalid parameter.");
 		    }
 		    Book book=BookDB.findBook(isbn);

 		    // Validate Title
 		    String titre = request.getParameter("titre");
 		    if (titre == null || titre.trim().isEmpty()) {
 		        throw new IllegalArgumentException("Titre ne peut pas etre vide.");
 		    }
 		    book.setTitre(titre);

 		    // Validate Author
 		    String auteur = request.getParameter("auteur");
 		    if (auteur == null || auteur.trim().isEmpty()) {
 		        throw new IllegalArgumentException("Auteur ne peut pas etre vide.");
 		    }
 		    book.setAuteur(auteur);

 		    // Validate Publication Year
 		    String publicationYear = request.getParameter("annee");
 		    if (publicationYear == null || !publicationYear.matches("\\d{4}")) { // Validate 4-digit year
 		        throw new IllegalArgumentException("Publication year doit etre quatre chiffres.");
 		    }
 		    book.setPublication(publicationYear);

 		    // Validate Quantity
 		    String quantityStr = request.getParameter("quantite");
 		    if (quantityStr == null || !quantityStr.matches("\\d+")) { // Validate numeric quantity
 		        throw new IllegalArgumentException("Quantite doiit etre un entier.");
 		    }
 		    int quantity = Integer.parseInt(quantityStr);
 		    if (quantity < 0) {
 		        throw new IllegalArgumentException("Quantite ne peut pas etre negative.");
 		    }
 		    book.setQuantity(quantity);
 		    BookDB.editBook(book);
 		   session.setAttribute("success", "Editer avec success");
 		   session.removeAttribute("book");
 		  request.getRequestDispatcher("/WEB-INF/admin/dashboard.jsp").forward(request, response);
	}
		catch (IllegalArgumentException e) {
			// TODO: handle exception
			session.setAttribute("fail", e.getMessage());
			request.getRequestDispatcher("/WEB-INF/admin/editBook.jsp").forward(request, response);
		}

	}
	}
