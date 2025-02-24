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
          <a class="navbar-brand" href="<%=request.getContextPath() %>/Admin">DashBoard</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
                <a class="navbar-brand" href="<%=request.getContextPath() %>/Bib/Gestion">Suich to Bib</a>
                </li>
                <li>
                <a class="navbar-brand" href="<%=request.getContextPath() %>/Logout">Logout</a>
                </li>
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
<%
 //  if(session.getAttribute("book")==null){
//	   response.sendRedirect(request.getContextPath());
//   }
    Book book=(Book) session.getAttribute("book");
    
%>
      
<h2 class="text-center">Editer Un Livre</h2>

</div>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-6">
           
                
                <form action="EditBook" method="post">
                    <div class="form-group">
                        
                        <input type="hidden" name="isbn" class="form-control"  value="<%=book.getISBN()  %>">
                    </div>
                    
                    <div class="form-group">
                        <label for="titre">Titre</label>
                        <input type="titre" name="titre" class="form-control" value="<%= book.getTitre() %>"  >
                    </div>
                    <div class="form-group">
                        <label for="auteur">Auteur</label>
                        <input type="text" name="auteur" class="form-control"  value="<%= book.getAuteur() %>">
                    </div>
                    <div class="form-group">
                        <label for="anne">Annee</label>
                        <input type="text" name="annee" class="form-control"  value="<%=book.getPublication() %>">
                    </div>
                    <div class="form-group">
                        <label for="quanite">quantite</label>
                        <input type="number" name="quantite" class="form-control"  value="<%=book.getQuantity() %>">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Confirmer</button>
                </form>

            </div>
        </div>
    </div>
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
