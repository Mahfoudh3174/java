<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.model.*" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier Bibliothécaire</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid mt-4">
        <% 
            String success = (String) session.getAttribute("success");
            String fail = (String) session.getAttribute("fail");

            if (success != null) { 
        %>
            <div class="alert alert-success text-center" role="alert">
                <%= success %>
            </div>
        <% 
            session.removeAttribute("success");
            } 
            if (fail != null) { 
        %>
            <div class="alert alert-danger text-center" role="alert">
                <%= fail %>
            </div>
        <% 
            session.removeAttribute("fail");
            } 
            
            User bib = (User) session.getAttribute("bib");
        %>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center">Modifier Bibliothécaire</h2>
                <form action="EditBibleo" method="post">
                    <div class="form-group">
                        <label for="numero">Numéro</label>
                        <input type="hidden" name="numero" class="form-control" 
                            value="<%= (bib != null) ? bib.getNumero() : ""%>" >
                    </div>
                    <div class="form-group">
                        <label for="nom">Nom</label>
                        <input type="text" name="nom" class="form-control" 
                            value="<%= (bib != null) ? bib.getNom() : "" %>" placeholder="Entrer le nom">
                    </div>
                    <div class="form-group">
                        <label for="prenom">Prénom</label>
                        <input type="text" name="prenom" class="form-control" 
                            value="<%= (bib != null) ? bib.getPrenom() : "" %>" placeholder="Entrer le prénom">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" class="form-control" 
                            value="<%= (bib != null) ? bib.getEmail() : "" %>" placeholder="Entrer l'email">
                    </div>
                    <div class="form-group">
                        <label for="password">Mot de passe</label>
                        <input type="password" name="password" class="form-control" value="<%= (bib != null) ? bib.getPassword() : "" %>" placeholder="Nouveau mot de passe">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Modifier</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
