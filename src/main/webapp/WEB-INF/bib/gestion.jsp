<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.*" %>
<%@ page import="com.data.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
    <%
    String role=(String) session.getAttribute("role");
    if(role.equals("admin")){ %>
        <a class="navbar-brand" href="<%=request.getContextPath()%>/Admin"><b>Dashboard</b></a>
        <%}else{%>
        <a class="navbar-brand" href="<%=request.getContextPath()%>/Bib/Gestion"><b>Dashboard</b></a>
        <%} %>
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

<!-- Success and Fail messages -->
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
%>

<h3 class="text-center">Les Empruntes</h3>

<div class="container-fluid mt-4">
      <table class="table table-striped" id="empruntTable">
        <thead>
            <tr>
                <th>ISBN</th>
                <th>Titre</th>
                <th>Matricule d'étudiant</th>
                <th>Nom de l'étudiant</th>
                <th>Email</th>
                <th>Date d'emprunt</th>
                <th>Date de retour prévu</th>
                <th>Date de retour</th>
                <th>Statut</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Emprunt em : Gestion.getEmprunts().values()) {
                if (!em.getStatut().equals("retourner") && !em.getStatut().equals("en retarde")) {
                    User user = UserDB.findUserById(em.getNumero());
                    Book book = BookDB.findBook(em.getISBN());
        %>
                    <tr>
                        <td><%= book.getISBN() %></td>
                        <td><%= book.getTitre() %></td>
                        <td><%= user.getNumero() %></td>
                        <td><%= user.getNom() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= em.getDateE() %></td>
                        <td><%= em.getDateR() %></td>
                        <td><%= Gestion.findRetour(em.getId()) %></td>
                        <td>
                            <%
                                if (em.getStatut().equals("en cours")) {
                            %>
                                <a href="<%=request.getContextPath() %>/Bib/Accept?idEmp=<%= em.getId() %>" class="btn btn-primary">Accepter</a>
                            <%
                                } else if (em.getStatut().equals("emprunter")) {
                            %>
                                <a href="<%=request.getContextPath() %>/Bib/Retourner?idRet=<%= em.getId() %>" class="btn btn-primary">Confirmer <br> Retour</a>
                            <%
                                } else {
                            %>
                                <%= em.getStatut() %>
                            <%
                                }
                            %>
                        </td>
                    </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
