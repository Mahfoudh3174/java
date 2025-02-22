<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.data.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Collection</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

 <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%=request.getContextPath() %>/Home"><b>Collection</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>

<h3 class="text-center">Book Collection</h3>
<div class="container-fluid mt-4">
    <div class="row">
        <%
            String id = (String) session.getAttribute("id");
            Map<String, Book> resultat = (Map<String, Book>) request.getAttribute("resultat");
            if (resultat != null) {
                for (Book book : resultat.values()) {
                    
        %>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="<%= book.getImage() %>" class="card-img-top" alt="Book Image" style="width: 300px; height: 400px">
                        <div class="card-body">
                            <h5 class="card-title">Titre: 
                                <span class="text-primary font-weight-bold"><%= book.getTitre() %></span>
                            </h5>
                            <p class="card-text font-weight-bold">Auteur: 
                                <span class="text-secondary"><%= book.getAuteur() %></span>
                            </p>
                            <p class="card-text font-weight-bold">Année de publication: 
                                <span class="text-info"><%= book.getPublication() %></span>
                            </p>
                            <a href="<%=request.getContextPath() %>/Home/Emprunter?isbn=<%= book.getISBN() %>" class="btn btn-primary">Emprunter</a>
                        </div>
                    </div>
                </div>
        <%
                    
                }
            }
            
        %>
        
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
