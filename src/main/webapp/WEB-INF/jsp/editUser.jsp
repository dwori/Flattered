<%--
  Created by IntelliJ IDEA.
  User: Lukas
  Date: 21.05.2021
  Time: 09:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <bootstrap:bootstrap-metadata/>
    <title>Register</title>
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
            <%--@elvariable id="user" type="at.fhj.ima.flattered.flattered.entity.User"--%>
            <form:form modelAttribute="user" method="post" action="changeUser">
                <form:hidden path="id" />
                <fieldset>
                    <h2>
                        Register
                    </h2>

                    <!--  Messages  ----------------------------------------------------------- -->

                    <!--  Error message ----------------------------------------------------------- -->
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">${errorMessage}</div>
                    </c:if>
                    <!--  Error message ----------------------------------------------------------- -->

                    <!--  Messages  ----------------------------------------------------------- -->

                    <! ---------------- username ---------------- -->
                    <div class="mb-3">
                        <label for="inputUsername" class="form-label">Username</label>
                        <c:set var="usernameInvalid"><form:errors path="username" cssClass="invalid-feedback"/></c:set>
                        <form:input path="username" class="form-control ${not empty usernameInvalid ? 'is-invalid' : ''}" id="inputUsername" type="text" name="username" placeholder="Enter username"/>
                            ${usernameInvalid}
                    </div>

                    <! ---------------- password ---------------- -->
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label">Password</label>
                        <div class="input-group" id="togglePassword1">
                        <c:set var="passwordInvalid"><form:errors path="password" cssClass="invalid-feedback"/></c:set>
                        <form:input path="password" class="form-control ${not empty passwordInvalid ? 'is-invalid' : ''}" id="inputPassword" type="password" name="password" placeholder="Enter password"/>
                            ${passwordInvalid}
                        <div class="input-group-addon" onclick="togglePassword1()">
                            <script>
                                function togglePassword1() {
                                    var pwField = document.getElementById("inputPassword");
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

                    <! ---------------- passwordAgain ---------------- -->
                    <div class="mb-3" >
                        <label for="passwordAgain" class="form-label">Confirm new Password</label>

                        <div class="input-group" id="togglePassword2">
                        <input id="passwordAgain" name="passwordAgain" class="form-control" placeholder="Please confirm your password" value="${param.passwordAgain}" type="password"/>
                        <div class="input-group-addon" onclick="togglePassword2()">
                            <script>
                                function togglePassword2() {
                                    var pwField = document.getElementById("passwordAgain");
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

                    <div class="mb-3">
                        <button type="submit" class="btn btn-lg btn-primary btn-block">Sign up</button>
                        <a href="/login" class="btn btn-lg btn-default btn-block">Cancel</a>
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