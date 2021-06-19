<%--
  Created by IntelliJ IDEA.
  User: Lukas
  Date: 03.06.2021
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <bootstrap:bootstrap-metadata/>
    <title>Login</title>
    <bootstrap:bootstrap-css/>
    <link href="/css/sidebar.css" rel="stylesheet">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous"/>
</head>
<body>
<main class="main-content">
    <div class="container" role="main">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <form:form method="post" action="/login">
                    <fieldset>
                        <h2 class="form-signin-heading">Login</h2>

                        <! ---------------- username ---------------- -->
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
                        </div>

                        <! ---------------- password ---------------- -->
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
                        </div>

                        <! ---------------- checkbox ---------------- -->
                        <p><input type='checkbox' name='remember-me'/> Remember me on this computer.</p>

                        <div class="mb-3">
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                            <a href="/editUser" class="btn btn-lg btn-primary btn-block">Register</a>
                        </div>
                    </fieldset>
                </form:form>
            </div>
        </div>
    </div>
<%--<bootstrap:bootstrap-js/>--%>
</body>
</main>
</html>

