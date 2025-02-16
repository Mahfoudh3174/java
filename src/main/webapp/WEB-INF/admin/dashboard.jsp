<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.*" %>
<%@ page import="com.data.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <script>
        function sortTable(columnIndex) {
            var table = document.getElementById("bookTable");
            var rows = Array.from(table.rows).slice(1); // Exclude header row
            var isAscending = table.rows[0].cells[columnIndex].getAttribute("data-order") === "asc";

            rows.sort(function (rowA, rowB) {
                var cellA = rowA.cells[columnIndex].innerText.trim();
                var cellB = rowB.cells[columnIndex].innerText.trim();

                // Convert to numbers if possible
                var numA = parseFloat(cellA);
                var numB = parseFloat(cellB);

                if (!isNaN(numA) && !isNaN(numB)) {
                    return isAscending ? numA - numB : numB - numA;
                } else {
                    return isAscending ? cellA.localeCompare(cellB) : cellB.localeCompare(cellA);
                }
            });

            // Toggle sorting order for next click
            table.rows[0].cells[columnIndex].setAttribute("data-order", isAscending ? "desc" : "asc");

            // Re-append sorted rows
            rows.forEach(row => table.appendChild(row));
        }
    </script>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="Admin"><b>Dashboard</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link active" href="Admin/Bibleo">Bibliothécaires</a></li>
                <li class="nav-item"><a class="nav-link active" href="ChangePass">Change Password</a></li>
                <li><a class="navbar-brand" href="Logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Success and Fail Messages -->
<div class="container-fluid mt-5">
    <% 
        String success = (String) session.getAttribute("success");
        String fail = (String) session.getAttribute("fail");
    %>

    <% if (success != null) { %>
        <div class="alert alert-success text-center"><%= success %></div>
        <% session.removeAttribute("success"); %>
    <% } %>

    <% if (fail != null) { %>
        <div class="alert alert-danger text-center"><%= fail %></div>
        <% session.removeAttribute("fail"); %>
    <% } %>

    <h2 class="text-center">Admin Dashboard</h2>

    <h3 class="text-center">Book Collection</h3>
    <div class="container-fluid mt-4">
        <table class="table table-striped" id="bookTable">
            <thead>
                <tr>
                    <th onclick="sortTable(0)" data-order="asc" style="cursor: pointer;">ISBN</th>
                    <th onclick="sortTable(1)" data-order="asc" style="cursor: pointer;">Titre</th>
                    <th onclick="sortTable(2)" data-order="asc" style="cursor: pointer;">Auteur</th>
                    <th>Image</th>
                    <th onclick="sortTable(4)" data-order="asc" style="cursor: pointer;">Date de publication</th>
                    <th onclick="sortTable(5)" data-order="asc" style="cursor: pointer;">Quantité Disponible</th>
                    <th colspan="2">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Book book : BookDB.getBooks().values()) {
                %>
                <tr>
                    <td><%= book.getISBN() %></td>
                    <td><%= book.getTitre() %></td>
                    <td><%= book.getAuteur() %></td>
                    <td><img src="<%= book.getImage() %>" width="80" height="80" class="img-thumbnail"></td>
                    <td><%= book.getPublication() %></td>
                    <td><%= book.getQuantity() %></td>
                    <td><a class="btn btn-primary" href="Admin/EditBook?isbn=<%= book.getISBN() %>">Edit</a></td>
                    <td><a href="Admin/DeleteBook?isbn=<%= book.getISBN() %>" class="btn btn-danger">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center">Add Book</h2>
                <form action="Admin" method="post">
                    <div class="form-group">
                        <label>ISBN</label>
                        <input type="text" name="isbn" class="form-control" placeholder="Enter ISBN">
                    </div>
                    <div class="form-group">
                        <label for="titre">Titre</label>
                        <input type="text" name="titre" class="form-control" placeholder="Enter Title">
                    </div>
                    <div class="form-group">
                        <label for="auteur">Auteur</label>
                        <input type="text" name="auteur" class="form-control" placeholder="Enter Author">
                    </div>
                    <div class="form-group">
                        <label for="image">Lien de l'Image</label>
                        <input type="text" name="image" class="form-control" placeholder="Enter Image URL">
                    </div>
                    <div class="form-group">
                        <label for="annee">Année</label>
                        <input type="text" name="annee" class="form-control" placeholder="Enter Publication Year">
                    </div>
                    <div class="form-group">
                        <label for="quantite">Quantité</label>
                        <input type="number" name="quantite" class="form-control" placeholder="Quantity">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Add Book</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
