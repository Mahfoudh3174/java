package com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.data.UserDB;

@WebServlet("/EditPassword")
public class EditPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditPassword() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        if (id == null || !UserDB.isUser(id)) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        try {
            String oldPass = request.getParameter("oldpassword");
            String newPass = request.getParameter("newpassword");

            if (oldPass == null || oldPass.trim().isEmpty()) {
                throw new IllegalArgumentException("L'ancien mot de passe ne peut pas être vide.");
            }
            if (newPass == null || newPass.trim().isEmpty()) {
                throw new IllegalArgumentException("Le nouveau mot de passe ne peut pas être vide.");
            }
            if (newPass.equals(oldPass)) {
                throw new IllegalArgumentException("Le nouveau mot de passe ne peut pas être identique à l'ancien.");
            }
            if (UserDB.findPassword(id).equals(newPass)) {
                throw new IllegalArgumentException("Ce mot de passe est déjà utilisé par vous.");
            }
            if (!UserDB.findPassword(id).equals(oldPass)) {
                throw new IllegalArgumentException("L'ancien mot de passe est incorrect.");
            }

            UserDB.editPass(id, newPass);
            session.setAttribute("success", "Mot de passe modifié avec succès.");
            response.sendRedirect(request.getContextPath() + "/EditPassword"); 

        } catch (IllegalArgumentException e) {
            session.setAttribute("fail", e.getMessage());
            response.sendRedirect(request.getContextPath() + "/EditPassword");
        }
    }
}
