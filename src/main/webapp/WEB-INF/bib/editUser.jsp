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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/Bib/Gestion"><b>Dashboard</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link active" href="<%=request.getContextPath()%>/Bib/Gestion">Gestion</a></li>
                <li class="nav-item" ><a class="nav-link active" href="<%=request.getContextPath()%>/Bib/Users">Etudiants</a></li>
                <li class="nav-item"><a class="nav-link active" href="<%=request.getContextPath()%>/Bib/EditPassword">Change Password</a></li>
                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/Logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
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
            
            User user = (User) session.getAttribute("user");
        %>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center">Modifier Utilisateur</h2>
                <form action="EditUser" method="post">
                    <div class="form-group">
                        
                        <input type="hidden" name="numero" class="form-control" 
                            value="<%= (user != null) ? user.getNumero() : ""%>" >
                    </div>
                    <div class="form-group">
                        <label for="nom">Nom</label>
                        <input type="text" name="nom" class="form-control" 
                            value="<%= (user != null) ? user.getNom() : "" %>" placeholder="Entrer le nom">
                    </div>
                    <div class="form-group">
                        <label for="prenom">Prénom</label>
                        <input type="text" name="prenom" class="form-control" 
                            value="<%= (user != null) ? user.getPrenom() : "" %>" placeholder="Entrer le prénom">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" class="form-control" 
                            value="<%= (user != null) ? user.getEmail() : "" %>" placeholder="Entrer l'email">
                    </div>
                    <div class="form-group">
                        <label for="password">Mot de passe</label>
                        <input type="password" name="password" class="form-control" value="<%= (user != null) ? user.getPassword() : "" %>" placeholder="Nouveau mot de passe">
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
