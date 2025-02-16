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
        <a class="navbar-brand" href="Home"><b>Collection</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath() %>/Home/History">Histoire</a>
                </li>
                <li><a class="navbar-brand" href="<%=request.getContextPath() %>/Logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
    <div class="container-fluid mt-5">
        <% 
        String id = (String) session.getAttribute("id"); 
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
<h2 class="text-center">Mes Livres</h2>


<div class="container-fluid mt-4">
              <table class="table table-striped">
              <tr>
            <th>ISBN</th>
            <th>Titre</th>
            <th>Auteur</th>
            <th>Image</th>
            <th>Date de publication</th>
            <th>Date de Retour</th>
            <th colspan="2">Action</th>
            </tr>
<%
    for (Emprunt em:Gestion.getEmprunts().values()) {
    	if(em.getNumero().equals(id)){
    		Book book=BookDB.findBook((String)em.getISBN());

%>
     <tr>
      <td><%=book.getISBN() %></td>
            <td><%=book.getTitre() %></td>
            <td><%=book.getAuteur() %></td>
            <td><img src="<%= book.getImage()%>" width="80" height="80" class="img-thumbnail"></td>
            <td><%=book.getPublication() %></td>
            <td>Avant: <%=em.getDateR() %></td>
            <td><a class="btn btn-circle  btn-primary" href="Home/Retourn?isbn=<%=book.getISBN() %>">Retourner</a></td>
            
            <%if(em.getStatut().equals("emprunter")) {%>
            <td>
            <a href="<%=book.getImage() %>" class="btn btn-success">Visualiser</a>
            </td>
            <%} %>
        
            </tr>

    
<%
    }
    	}
%>
</table>
</div></div>
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>