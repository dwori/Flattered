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
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <p>
                <a href="/dashboard" class="btn btn-primary">Dashboard</a>
                <a href="/editGroceryItem" class="btn btn-success">Add new Item</a>
            </p>
        </div>
    </div>
     2 simple buttons ----------------------------------------------------------- -->
    <div class="row row-cols-1 row-cols-md-2 g-4">
        <c:forEach items="${flatList}" var="flat">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${flat.name}</h5>
                    <p class="card-text">${flat.address}</p>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Users</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Max</td>
                        </tr>
                        <tr>
                            <td>Peter</td>
                        </tr>
                        <tr>
                            <td>Lukas</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="d-grid gap-2 d-md-block">
                        <a href="editFlat?id=${flat.id}" class="btn btn-success" type="btn">Edit</a>
                        <a href="deleteFlat?id=${flat.id}" class="btn btn-danger" type="btn">Delete</a>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="d-grid gap-2">
                        <a href="/editFlat" class="btn btn-success" type="btn">Create Flat</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>    <!--  End of container -->

<bootstrap:bootstrap-js/>

</body>
</html>

</layout:sidebar>