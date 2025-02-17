<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.data.*" %>
<%@page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Changer le mot de passe</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
String id = (String) session.getAttribute("id");
String role = "user"; // القيمة الافتراضية

if (id != null && UserDB.getUsers().containsKey(id)) {
    role = UserDB.getUsers().get(id).getRole();
}

String path;
switch (role) {
    case "admin":
        path = "Admin";
        break;
    case "bibliothecaire":
        path = "Bib";
        break;
    default:
        path = "Home";
}
%>

<% 
String success = (String) session.getAttribute("success");
String fail = (String) session.getAttribute("fail");
%>

<% if (success != null) { %>
    <div class="alert alert-success text-center" role="alert">
        <%= success %>
    </div>
    <% session.removeAttribute("success"); %>
<% } %>

<% if (fail != null) { %>
    <div class="alert alert-danger text-center" role="alert">
        <%= fail %>
    </div>
    <% session.removeAttribute("fail"); %>
<% } %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%=request.getContextPath() %>/<%=path%>">Dashboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li><a class="navbar-brand" href="<%=request.getContextPath() %>/Logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="text-center">Changer le mot de passe</h2>
            <form action="EditPassword" method="post">
                <div class="form-group">
                    <label for="oldpassword">Ancien mot de passe</label>
                    <input type="password" name="oldpassword" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="newpassword">Nouveau mot de passe</label>
                    <input type="password" name="newpassword" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Changer</button>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
