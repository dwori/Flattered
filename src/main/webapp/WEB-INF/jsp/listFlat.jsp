<%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 30.05.2021
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:sidebar title="Flats" activePage="listFlat">

<html>
<head>
    <bootstrap:bootstrap-metadata/>
    <title>Flats</title>
    <bootstrap:bootstrap-css/>
</head>
<body>
<div class="container" role="main">
    <div class="page-header">
        <h1>Flat Manager</h1>
    </div>
    <!--  Messages  ----------------------------------------------------------- -->

    <!--  Error message ----------------------------------------------------------- -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">${errorMessage}</div>
    </c:if>
    <!--  Error message ----------------------------------------------------------- -->

    <!--  Warning message ----------------------------------------------------------- -->
    <c:if test="${not empty warningMessage}">
        <div class="alert alert-warning" role="warning">${warningMessage}</div>
    </c:if>
    <!--  Warning message ----------------------------------------------------------- -->

    <!--  successful message ----------------------------------------------------------- -->
    <c:if test="${not empty message}">
        <div class="alert alert-success" role="warning">${message}</div>
    </c:if>
    <!--  successful message ----------------------------------------------------------- -->

    <!--  Messages  ----------------------------------------------------------- -->

    <!--  2 simple buttons -----------------------------------------------------------

     2 simple buttons ----------------------------------------------------------- -->
    <div class="row row-cols-1 row-cols-md-2 g-4">
        <c:forEach items="${flatList}" var="flat" varStatus="flatStatus">
            <c:if test="${flat.users.contains(currentUser)}">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${flat.name}</h5>
                    <p class="card-text">${flat.address}</p>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Username</th>
                            <th>Actions</th>
                            <th>Role</th>
                        </tr>
                        </thead>
                        <c:forEach items="${flat.users}" var="user">
                            <tr>
                                <td>${user.username}</td>
                                <c:choose>
                                    <c:when test="${currentUserisAdmin[flatStatus.index] && !flat.admins.contains(user)}">
                                        <form:form action="/kick?flatId=${flat.id}&userId=${user.id}" method="post">
                                            <td><button class="btn btn-danger" type="submit">Kick User</button></td>
                                        </form:form>
                                    </c:when>
                                    <c:otherwise>
                                        <td><p></p></td>
                                    </c:otherwise>
                                </c:choose>

                                <c:if test="${flat.admins.contains(user)}">
                                    <td>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-hammer" viewBox="0 0 16 16">
                                            <path d="M9.972 2.508a.5.5 0 0 0-.16-.556l-.178-.129a5.009 5.009 0 0 0-2.076-.783C6.215.862 4.504 1.229 2.84 3.133H1.786a.5.5 0 0 0-.354.147L.146 4.567a.5.5 0 0 0 0 .706l2.571 2.579a.5.5 0 0 0 .708 0l1.286-1.29a.5.5 0 0 0 .146-.353V5.57l8.387 8.873A.5.5 0 0 0 14 14.5l1.5-1.5a.5.5 0 0 0 .017-.689l-9.129-8.63c.747-.456 1.772-.839 3.112-.839a.5.5 0 0 0 .472-.334z"/>
                                        </svg>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </table>
                    <c:if test="${currentUserisAdmin[flatStatus.index]}">
                    <div class="d-grid gap-2 d-md-block">
                        <a href="editFlat?id=${flat.id}" class="btn btn-success" type="btn">Edit</a>
                        <a href="deleteFlat?id=${flat.id}" class="btn btn-danger" type="btn">Delete</a>
                    </div>
                    </c:if>
                </div>
            </div>
        </div>
            </c:if>
        </c:forEach>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="d-grid gap-2">
                        <a href="/editFlat" class="btn btn-outline-success border-2" type="btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="CurrentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>    <!--  End of container -->
</body>
</html>
</layout:sidebar>