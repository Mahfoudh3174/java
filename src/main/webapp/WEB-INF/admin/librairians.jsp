<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.*" %>
<%@ page import="com.data.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%=request.getContextPath() %>/Admin"><b>Dashboard</b></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="<%=request.getContextPath() %>/Admin">Main</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<%=request.getContextPath() %>/Admin/Bibleo">Bibliothécaires</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<%=request.getContextPath() %>/EditPassword">Change Password</a>
                    </li>
                    <li>
                        <a class="navbar-brand" href="<%=request.getContextPath() %>/Bib/Gestion">Switch to Bib</a>
                    </li>
                    <li>
                        <a class="navbar-brand" href="<%=request.getContextPath() %>/Logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid mt-5">
        <%
            String id = (session.getAttribute("id") != null) ? session.getAttribute("id").toString() : "";
            String success = (String) session.getAttribute("success");
            String fail = (String) session.getAttribute("fail");
        %>

        <% if (success != null) { %>
            <div class="alert alert-success text-center" role="alert">
                <%= success %>
            </div>
            <%
                session.removeAttribute("success");
            %>
        <% } %>

        <% if (fail != null) { %>
            <div class="alert alert-danger text-center" role="alert">
                <%= fail %>
            </div>
            <%
                session.removeAttribute("fail");
            %>
        <% } %>

        <h2 class="text-center">Admin Dashboard</h2>
        <h3 class="text-center">Les Bibliothécaires</h3>

        <div class="container-fluid mt-4">
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Numero</th>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (User user : UserDB.getUsers().values()) {
                            if (!user.getNumero().equals(id) && user.getRole().equals("bibliothecaire")) {
                    %>
                            <tr>
                                <td><%= user.getNumero() %></td>
                                <td><%= user.getNom() %></td>
                                <td><%= user.getPrenom() %></td>
                                <td><%= user.getEmail() %></td>
                                <td><%= user.getRole() %></td>
                                <td>
                                    <a class="btn btn-primary btn-sm" href="<%= request.getContextPath() %>/Admin/EditBibleo?id=<%= user.getNumero() %>">Edit</a>
                                    <a class="btn btn-danger btn-sm" href="<%= request.getContextPath() %>/Admin/DeleteBibleo?id=<%= user.getNumero() %>" 
                                        onclick="return confirmDelete(event)">Delete</a>
                                </td>
                            </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>

        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h2 class="text-center">Ajouter un Bibliothécaire</h2>
                    <form action="<%= request.getContextPath() %>/Admin/Bibleo" method="post">
                        <div class="form-group">
                            <label for="numero">Numéro</label>
                            <input type="text" name="numero" class="form-control" placeholder="Enter Matricule" required>
                        </div>
                        <div class="form-group">
                            <label for="nom">Nom</label>
                            <input type="text" name="nom" class="form-control" placeholder="Enter Nom" required>
                        </div>
                        <div class="form-group">
                            <label for="prenom">Prénom</label>
                            <input type="text" name="prenom" class="form-control" placeholder="Enter Prénom" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" name="email" class="form-control" placeholder="Enter Email" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Mot de passe</label>
                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Ajouter</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
<script>
function confirmDelete(event) {
    if (!confirm('Supprimer le livre?')) {
        event.preventDefault(); // Stop the navigation if user clicks "Annuler"
    }
}
</script>
    <!-- JS Scripts (Ensure jQuery is loaded before Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
