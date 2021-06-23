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
<%--<bootstrap:bootstrap-js/>--%>
</layout:sidebar>

