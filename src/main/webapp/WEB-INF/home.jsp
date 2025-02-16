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
          <a class="navbar-brand" href="Home"><b>Collection </b></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="Route?path=hist">Histoire</a>
                
              </li>
              <li><a class="navbar-brand" href="Route?path=logout">Logout</a></li>
            </ul>
          </div>
        </div>
      </nav>
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
<h3 class="text-center">Book Collection </h3>
<div class="container-fluid mt-4">
              <table class="table table-striped">
            <th>ISBN</th>
            <th>Titre</th>
            <th>Auteur</th>
            <th>Date de publication</th>
            <th>quantite Disponible</th>
            <th>Action</th>
 
<%
String id=(String)session.getAttribute("id");
      
    for (Book book : BookDB.getBooks().values()) {
    	
 %>
     <tr>
            <td><%=book.getISBN() %></td>
            <td><%=book.getTitre() %></td>
            <td><%=book.getAuteur() %></td>
            
            <td><%=book.getPublication() %></td>
            <td><%=book.getQuantity() %></td>
            <td><a class="btn btn-secondary" href="Emprunter?id=<%=id%>&isbn=<%=book.getISBN()%>">Emprunte</a></td>
            </tr>

    
<%
    }
%>
</table>
</div>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>