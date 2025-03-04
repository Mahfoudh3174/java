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
        </h2>
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
<h3 class="text-center">Les Etudiants </h3>
<div class="container-fluid mt-4">
              <table class="table table-striped">
            <th>Matricule</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Email</th>
            <th colspan="2">Action</th>
<%
     
    for (User user:UserDB.getUsers().values()) {
    	if("user".equals(user.getRole())){
    	
 %>
     <tr>
            <td><%=user.getNumero() %></td>
            <td><%=user.getNom() %></td>
            <td><%=user.getPrenom() %></td>
            <td><%=user.getEmail() %></td>
             <td><a class="btn btn-warning" href="<%=request.getContextPath()%>/Bib/EditUser?id=<%=user.getNumero()%>" >Editer</a></td>
             <%
             if(role.equals("admin")){ %>
            	 <td><a class="btn btn-warning"  onclick="return confirmDelete(event)" href="<%=request.getContextPath()%>/Admin/DeleteUser?id=<%=user.getNumero()%>" >Suprimer</a></td>
             <%
             }
             %>
            <td><a href="<%=request.getContextPath() %>/Bib/UsersHistory?id=<%=user.getNumero() %>" class="btn btn-success"> L'archive</a></td>
            </tr>

    
<%
    }}
%>
</table>
</div>
<script>
function confirmDelete(event) {
    if (!confirm('Supprimer le livre?')) {
        event.preventDefault(); // Stop the navigation if user clicks "Annuler"
    }
}
</script>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>