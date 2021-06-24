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
<%@taglib prefix="file" tagdir="/WEB-INF/tags/file" %>


<!DOCTYPE html>

<head>
    <link href="/css/sidebar.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous"/>
</head>
<body style="padding: 0">
<layout:sidebar title="Profile" activePage="editProfile">
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

                    <div class="mb-3">
                    <c:choose>
                        <c:when test="${currentUser.files[0].id == null}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="128" height="128" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                            </svg>
                        </c:when>
                        <c:otherwise>
                            <img src="/file/${currentUser.files[0].id}" alt="mdo" class="rounded-circle" width="128" height="128">
                        </c:otherwise>
                    </c:choose>
                    </div>

                    <!--  Messages  ----------------------------------------------------------- -->

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

                        <div class="input-group" id="togglePassword1">
                        <input id="inputNewPassword" name="newPassword" class="form-control" placeholder="Leave blank if you do not want to change your password" type="password" value="${param.newPassword}"/>
                        <div class="input-group-addon" onclick="togglePassword1()">
                            <script>
                                function togglePassword1() {
                                    var pwField = document.getElementById("inputNewPassword");
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

                    <! ---------------- newPasswordAgain ---------------- -->
                    <div class="mb-3" >
                        <label for="newPasswordAgain" class="form-label">Confirm new Password</label>
                        <div class="input-group" id="togglePassword2">
                        <input id="newPasswordAgain" name="newPasswordAgain" class="form-control" placeholder="Leave blank if you do not want to change your password" type="password" value="${param.newPasswordAgain}"/>
                        <div class="input-group-addon" onclick="togglePassword2()">
                            <script>
                                function togglePassword2() {
                                    var pwField = document.getElementById("newPasswordAgain");
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

                    <! ---------------- password ---------------- -->
                    <div class="mb-3" >
                        <c:set var="passwordInvalid"><form:errors path="password" cssClass="invalid-feedback"/></c:set>
                        <form:input path="password" class="form-control ${not empty passwordInvalid ? 'is-invalid' : ''}" id="inputPassword" type="hidden" name="password" />
                            ${passwordInvalid}
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Edit Profile Picture</label>
                        <file:file value="${user.files}"  />
                    </div>

                    <div class="mb-3">
                        <button type="submit" class="btn btn-lg btn-success btn-block">Save Changes and Logout</button>
                        <a href="/dashboard" class="btn btn-lg btn-danger btn-block">No Changes</a>
                    </div>
                </fieldset>
            </form:form>
        </div>
    </div>
</div>
    </body>
<%--<bootstrap:bootstrap-js/>--%>
</layout:sidebar>

