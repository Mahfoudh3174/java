<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.*" %>
<%@ page import="com.data.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function sortTable(columnIndex) {
            var table = document.getElementById("empruntTable");
            var rows = Array.from(table.rows).slice(1); // Skip the header row
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

            // Reverse order attribute for next click
            table.rows[0].cells[columnIndex].setAttribute("data-order", isAscending ? "desc" : "asc");

            // Re-append sorted rows
            for (var i = 0; i < rows.length; i++) {
                table.appendChild(rows[i]);
            }
        }
    </script>
</head>
<body>

<!-- Navbar -->
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
                <th onclick="sortTable(0)" data-order="asc" style="cursor: pointer;">ISBN</th>
                <th onclick="sortTable(1)" data-order="asc" style="cursor: pointer;">Titre</th>
                <th onclick="sortTable(2)" data-order="asc" style="cursor: pointer;">Matricule d'etudiant</th>
                <th onclick="sortTable(3)" data-order="asc" style="cursor: pointer;">Nom de l'etudiant</th>
                <th onclick="sortTable(4)" data-order="asc" style="cursor: pointer;">Email</th>
                <th onclick="sortTable(5)" data-order="asc" style="cursor: pointer;">Date d'emprunt</th>
                <th onclick="sortTable(6)" data-order="asc" style="cursor: pointer;">Date de retour prevu</th>
                <th onclick="sortTable(7)" data-order="asc" style="cursor: pointer;">Date de retour</th>
                <th onclick="sortTable(8)" data-order="asc" style="cursor: pointer;">Statut</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Emprunt em : Gestion.getEmprunts().values()) {
                User user = UserDB.findUserById(em.getNumero());
                Book book = (Book) BookDB.findBook(em.getISBN());
        %>
                    <tr>
                        <td><%= book.getISBN() %></td>
                        <td><%= book.getTitre() %></td>
                        <td><%= user.getNumero() %></td>
                        <td><%= user.getNom() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= em.getDateE() %></td>
                        <td><%= em.getDateR() %></td>
                        <td>
                            <%
                                if (em.getStatut().equals("retourner")) {
                            %>
                                <%= Gestion.findRetour(em.getId()) %>
                            <%
                                } else {
                            %>
                                Null
                            <%
                                }
                            %>
                        </td>
                        <td><%= em.getStatut() %></td>
                    </tr>
        <%
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
