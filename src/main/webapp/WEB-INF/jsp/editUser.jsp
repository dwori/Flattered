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
<div class="container" role="main">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <form:form modelAttribute="user" method="post" action="changeUser">
                <form:hidden path="id" />
                <fieldset>
                    <h2>
                        <c:choose>
                            <c:when test="${user.id == null}">
                                Register
                            </c:when>
                            <c:otherwise>
                                Edit User #${user.id} - ${user.name}
                            </c:otherwise>
                        </c:choose>
                    </h2>

                    <! ---------------- username ---------------- -->
                    <div class="mb-3">
                        <label for="inputUsername" class="form-label">Username</label>
                        <c:set var="usernameInvalid"><form:errors path="username" cssClass="invalid-feedback"/></c:set>
                        <form:input path="username" class="form-control ${not empty usernameInvalid ? 'is-invalid' : ''}" id="inputUsername" type="text" name="username"/>
                            ${usernameInvalid}
                    </div>

                    <! ---------------- password ---------------- -->
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label">Password</label>
                        <c:set var="passwordInvalid"><form:errors path="password" cssClass="invalid-feedback"/></c:set>
                        <form:input path="password" class="form-control ${not empty passwordInvalid ? 'is-invalid' : ''}" id="inputPassword" type="text" name="password"/>
                            ${passwordInvalid}
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