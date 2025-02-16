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
          <a class="navbar-brand" href="Admin"><b>Dashboard</b></a>
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
              <li><a class="navbar-brand" href="<%=request.getContextPath() %>/Logout">Logout</a></li>
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


<h3 class="text-center">les Bibliothecaires</h3>
<div class="container-fluid mt-4">
              <table class="table table-striped">
              <tr>
            <th>Numero</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Email</th>
            <th>Password</th>
            <th colspan="2">Action</th>
            </tr>
<%
    for (User user:UserDB.getBib().values()) {
%>
     <tr>
      <td><%=user.getNumero() %></td>
            <td><%=user.getNom() %></td>
            <td><%=user.getPrenom() %></td>
            <td><%=user.getEmail() %></td>
            <td><%=user.getPassword() %></td>
            <td><a class="btn btn-circle  btn-primary" href="Admin/EditBib?id=<%=user.getNumero() %>">Edit</a></td>
            <td>
            <a href="Admin/DeleteBib?isbn=<%= user.getNumero() %>" class="btn btn-danger">Delete</a>
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
           
                <h2 class="text-center">Ajouter un Bibliothecaire </h2>
                <form action="Bibleo" method="post">
                    <div class="form-group">
                        <label for="nom">Numero</label>
                        <input type="text" name="numero" class="form-control"  placeholder="Enter Matricule">
                    </div>
                    <div class="form-group">
                        <label for="nom">Nom </label>
                        <input type="text" name="nom" class="form-control"  placeholder="Enter nom">
                    </div>
                          <div class="form-group">
                        <label for="nom">Prenom </label>
                        <input type="text" name="prenom" class="form-control"  placeholder="Enter Prenom">
                    </div>
                       <div class="form-group">
                        <label for="email">Email </label>
                        <input type="email" name="email" class="form-control"  placeholder="Enter Email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control"  placeholder="Password">
                    </div>                    
                    <button type="submit" class="btn btn-primary btn-block">Ajouter</button>
                </form>

            </div>
        </div>
    </div>
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>