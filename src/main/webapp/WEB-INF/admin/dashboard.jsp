<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.model.*" %>
    <%@ page import="com.data.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="Bibleo">Biliotecaires</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="ChangePass">change password</a>
              </li>
              <li><a class="navbar-brand" href="Logout">Logout</a></li>
            </ul>
          </div>
        </div>
      </nav>
    <div class="container-fluid mt-5">
        <% 
            String success = (String) session.getAttribute("success");
            String fail = (String) session.getAttribute("fail");
        %>

        <% if (success != null) { %>
            <div class="alert alert-success text-center" role="alert">
                <%= success %>
            </div>
        <% 
        session.removeAttribute("success");
        } %>

        <% if (fail != null) { %>
            <div class="alert alert-danger text-center" role="alert">
                <%= fail %>
            </div>
        <%
        session.removeAttribute("fail");
        } %>
<h2>Admin Dashboard</h2>


<h3 class="text-center">Book Collection</h3>
<div class="container-fluid mt-4">
              <table class="table table-striped">
            <th>ISBN</th>
            <th>Titre</th>
            <th>Auteur</th>
            <th>Image</th>
            <th>Date de publication</th>
            <th>quantite Disponible</th>
            <th colspan="2">Action</th>
<%
    for (Book book : BookDB.getBooks().values()) {
%>
     <tr>
      <td><%=book.getISBN() %></td>
            <td><%=book.getTitre() %></td>
            <td><%=book.getAuteur() %></td>
            <td><img src="<%= book.getImage()%>" width="80" height="80" class="img-thumbnail"></td>
            <td><%=book.getPublication() %></td>
            <td><%=book.getQuantity() %></td>
            <td><a class="btn btn-circle  btn-primary" href="Admin/EditBook?isbn=<%=book.getISBN() %>">Edit</a></td>
            <td>
            <a href="Admin/DeleteBook?isbn=<%= book.getISBN() %>" class="btn btn-danger">Delete</a>
        </td>
            </tr>

    
<%
    }
%>
</table>
</div>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-6">
           
                <h2 class="text-center">Addbook </h2>
                <form action="Admin" method="post">
                    <div class="form-group">
                        <label >ISBN</label>
                        <input type="text" name="isbn" class="form-control"  placeholder="Entrer ISBN">
                    </div>
                    
                    <div class="form-group">
                        <label for="titre">Titre</label>
                        <input type="titre" name="titre" class="form-control"  placeholder="Entrer titre">
                    </div>
                    <div class="form-group">
                        <label for="auteur">Auteur</label>
                        <input type="text" name="auteur" class="form-control"  placeholder="Entrer auteur">
                    </div>
                    <div class="form-group">
                        <label for="auteur">Lien de l'Image</label>
                        <input type="text" name="image" class="form-control"  placeholder="Entrer auteur">
                    </div>
                    <div class="form-group">
                        <label for="anne">Annee</label>
                        <input type="text" name="annee" class="form-control"  placeholder="Enter Annee de pub">
                    </div>
                    <div class="form-group">
                        <label for="quanite">quantite</label>
                        <input type="number" name="quantite" class="form-control"  placeholder="Quantite">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">AddBook</button>
                </form>

            </div>
        </div>
    </div>
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>