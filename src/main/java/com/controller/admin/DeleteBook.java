package com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.data.BookDB;

/**
 * Servlet implementation class DeleteBook
 */
@WebServlet("/Admin/DeleteBook")
public class DeleteBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		try {
			 
			String isbn=request.getParameter("isbn");
			if(isbn==null || !BookDB.isBook(isbn)) {
				throw new IllegalArgumentException("invalid parametre");
			}
			BookDB.deleteBook(isbn);
			System.out.println(request.getContextPath());
			session.setAttribute("success", "suprimer avec success");
			response.sendRedirect(request.getContextPath() + "/Admin");

		}
		catch(IllegalArgumentException e) {
			session.setAttribute("fail", e.getMessage());
			response.sendRedirect(request.getContextPath() + "/Admin");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
