<%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 18.06.2021
  Time: 13:25
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
    <title>Edit Profile</title>
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
            <form:form modelAttribute="user" method="post" action="updateUser">
                <form:hidden path="id" />
                <fieldset>
                    <legend>
                        Edit Profile
                    </legend>

                    <!--  Messages  ----------------------------------------------------------- -->

                    <!--  Error message ----------------------------------------------------------- -->
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">${errorMessage}</div>
                    </c:if>
                    <!--  Error message ----------------------------------------------------------- -->

                    <!--  Messages  ----------------------------------------------------------- -->

                    <img src="..." class="rounded mx-auto d-block" alt="You can upload your Profile Picture here:">
                    <div class="input-group mb-3">
                        <input type="file" class="form-control" id="inputGroupFile01">
                    </div>

                    <! ---------------- username ---------------- -->
                    <div class="mb-3">
                        <label for="inputUsername" class="form-label">Username</label>
                        <c:set var="usernameInvalid"><form:errors path="username" cssClass="invalid-feedback"/></c:set>
                        <form:input path="username" class="form-control ${not empty usernameInvalid ? 'is-invalid' : ''}" id="inputUsername" type="text" name="username"/>
                            ${usernameInvalid}
                    </div>

                    <! ---------------- newPassword ---------------- -->
                    <div class="mb-3" >
                        <label for="inputNewPassword" class="form-label">New Password?</label>
                        <input id="inputNewPassword" name="newPassword" class="form-control" placeholder="Leave blank if you do not want to change your password" type="password" value="${param.newPassword}"/>
                    </div>

                    <! ---------------- newPasswordAgain ---------------- -->
                    <div class="mb-3" >
                        <label for="newPasswordAgain" class="form-label">Confirm new Password</label>
                        <input id="newPasswordAgain" name="newPasswordAgain" class="form-control" placeholder="Leave blank if you do not want to change your password" type="password" value="${param.newPasswordAgain}"/>
                    </div>

                    <! ---------------- password ---------------- -->
                    <div class="mb-3" >
                        <c:set var="passwordInvalid"><form:errors path="password" cssClass="invalid-feedback"/></c:set>
                        <form:input path="password" class="form-control ${not empty passwordInvalid ? 'is-invalid' : ''}" id="inputPassword" type="hidden" name="password" />
                            ${passwordInvalid}
                    </div>

                    <div class="mb-3">
                        <button type="submit" class="btn btn-lg btn-primary btn-block">Save Changes and Logout</button>
                        <a href="/dashboard" class="btn btn-lg btn-default btn-block">No Changes</a>
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