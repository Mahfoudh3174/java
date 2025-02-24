<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.*" %>
<%@ page import="com.data.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Collection</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-img-top {
            object-fit: cover;
            width: 100%;
            height: 400px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%=request.getContextPath() %>/Home"><b>Collection</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" 
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="<%=request.getContextPath() %>/Home">Home</a>
               </li>
                <li class="nav-item">
                    <a class="nav-link active" href="<%=request.getContextPath() %>/Home/History">Histoire</a>
               </li>     
                <li class="nav-item">
                    <a class="nav-link active" href="<%=request.getContextPath() %>/EditPassword">Change Password</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath() %>/Logout">Logout</a>
                </li>
            </ul>

            <!-- Search Form -->
            <form class="form-inline ml-auto" action="<%=request.getContextPath() %>/Home/Cherche" method="GET">
                <input class="form-control mr-sm-2" type="search" name="valeur"  placeholder="Search....">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>

        </div>
    </div>
</nav>

<%
    String success = (String) session.getAttribute("success");
    String fail = (String) session.getAttribute("fail");
%>

<% if (success != null) { %>
    <div class="alert alert-success text-center" role="alert">
        <strong><%= success %></strong>
    </div>
    <% session.removeAttribute("success"); %>
<% } %>

<% if (fail != null) { %>
    <div class="alert alert-danger text-center" role="alert">
        <strong><%= fail %></strong>
    </div>
    <% session.removeAttribute("fail"); %>
<% } %>

<h3 class="text-center">Book Collection</h3>
<div class="container mt-4">
    <div class="row">
        <%
            String id = (String) session.getAttribute("id");
            if (id != null) { // Ensure ID exists before looping
                for (Book book : BookDB.getBooks().values()) {
                    if (book.getQuantity() > 0) {
        %>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <img src="<%= book.getImage() %>" class="card-img-top" alt="Book Image">
                    <div class="card-body">
                        <h5 class="card-title">Titre: 
                            <span class="text-primary font-weight-bold"><%= book.getTitre() %></span>
                        </h5>
                        <p class="card-text"><strong>Auteur:</strong> <%= book.getAuteur() %></p>
                        <p class="card-text"><strong>Année de publication:</strong> <%= book.getPublication() %></p>
                        <a href="<%=request.getContextPath() %>/Home/Emprunter?isbn=<%= book.getISBN() %>" class="btn btn-primary">Emprunter</a>
                    </div>
                </div>
            </div>
        <%
                    }
                }
            }
        %>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
