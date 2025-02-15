<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container-fluid mt-5">
        <% 
            String success = (String) request.getAttribute("success");
            String fail = (String) request.getAttribute("fail");
        %>

        <% if (success != null) { %>
            <div class="alert alert-success text-center" role="alert">
                <%= success %>
            </div>
        <% } %>

        <% if (fail != null) { %>
            <div class="alert alert-danger text-center" role="alert">
                <%= fail %>
            </div>
        <% } %>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center">Login</h2>
                <form action="Login" method="post">
                    <div class="form-group">
                        <label for="nom">Username</label>
                        <input type="text" name="nom" id="nom" class="form-control" placeholder="Username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                    <div class="mt-2 text-center">
                        <a href="Register">Créer un compte</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
