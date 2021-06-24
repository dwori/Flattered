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
    <div class="" role="main"
         style="display: flex;
         align-items: center;
         justify-content: center;
         height: 100%;
         position: absolute;
         width: 100%;
         top: 0;
         left: 0;">
        <div style="width: 30vh">
            <div>
                <form:form method="post" action="/login">
                    <fieldset>
                        <h2 class="form-signin-heading">Login</h2>

                        <!--  Messages  ----------------------------------------------------------- -->

                        <!--  successful message ----------------------------------------------------------- -->
                        <c:if test="${not empty message}">
                            <div class="alert alert-success" role="warning">${message}</div>
                        </c:if>
                        <!--  successful message ----------------------------------------------------------- -->

                        <!--  Messages  ----------------------------------------------------------- -->

                        <! ---------------- username ---------------- -->
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
                        </div>

                        <! ---------------- password ---------------- -->
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>

                            <div class="input-group" id="togglePassword">
                            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
                                <div class="input-group-addon" onclick="togglePassword()">
                                    <script>
                                        function togglePassword() {
                                            var pwField = document.getElementById("password");
                                            if (pwField.type === "password") {
                                                pwField.type = "text";
                                            } else {
                                                pwField.type = "password";
                                            }
                                        }
                                    </script>
                                    <a><i class="fa fa-eye-slash" aria-hidden="true">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#000000" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                                            <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                                        </svg>
                                    </i></a>
                                </div>
                            </div>

                        </div>

                        <! ---------------- checkbox ---------------- -->
                        <p><input type='checkbox' name='remember-me'/> Remember me on this computer</p>

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

