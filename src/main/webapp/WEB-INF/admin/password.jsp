
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.data.*" %>
     <%@page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

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
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="<%=request.getContextPath() %>/Admin">DashBoard</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
             <li><a class="navbar-brand" href="<%=request.getContextPath() %>/Logout">Logout</a></li>
            </ul>
          </div>
        </div>
      </nav>
      

      
      </div>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-6">
           
                <h2 class="text-center">change password </h2>
                <form action="EditPassword" method="post">
                    <div class="form-group">        
                    <div class="form-group">
                        <label for="auteur">mot de passe</label>
                        <input type="text" name="oldpassword" class="form-control"  value="Ancient mot de passe">
                    </div>
                      <div class="form-group">
                        <label for="auteur">nouveau mot de passe</label>
                        <input type="text" name="newpassword" class="form-control"  value="Nouveau mot de passe">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Changer</button>
                </form>

            </div>
        </div>
    </div>
         <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>