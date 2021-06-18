<%--
  Created by IntelliJ IDEA.
  User: Lukas
  Date: 21.05.2021
  Time: 09:06
  To change this template use File | Settings | File Templates.
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>


<layout:sidebar title="Grocery List" activePage="listGrocery">


<html>
<head>
    <bootstrap:bootstrap-metadata/>
    <title>Grocery List</title>
    <bootstrap:bootstrap-css/>
</head>
<body>
<div class="container" role="main">

    <div class="page-header mb-4">
        <h1>Grocery Manager</h1>
        <h5>Here you can add items that should be bought, the groceries get done.</h5>
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


    <div class="row">
        <div class="col-md-20 col-md-offset-1">

            <table data-toggle="table" class="table table table-striped">
                <thead>
                <tr>
                    <th data-sortable="true">Name</th>
                    <th data-sortable="false">Amount</th>
                    <th data-sortable="true">Requested By</th>
                    <th data-sortable="false">Comments</th>
                    <th data-sortable="true">State</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <!--  list all employees ----------------------------------------------------------- -->
                <c:forEach items="${groceryList}" var="groceryItem">
                    <c:if test="${groceryItem.flat == currentUserFlat}">
                    <tr>
                        <td>${groceryItem.name}</td>
                        <td>${groceryItem.amount}</td>
                        <td>${groceryItem.requestedBy}</td>
                        <td>${groceryItem.comment}</td>
                        <td>
                            <c:choose>
                                <c:when test="${groceryItem.done}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="green" class="bi bi-bag-check" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                                        <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                                    </svg>
                                </c:when>
                                <c:otherwise>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-bag-x" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M6.146 8.146a.5.5 0 0 1 .708 0L8 9.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 10l1.147 1.146a.5.5 0 0 1-.708.708L8 10.707l-1.146 1.147a.5.5 0 0 1-.708-.708L7.293 10 6.146 8.854a.5.5 0 0 1 0-.708z"/>
                                        <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                                    </svg>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="editGroceryItem?id=${groceryItem.id}" class="btn btn-xs btn-success">Edit</a>
                            <a href="deleteGroceryItem?id=${groceryItem.id}" class="btn btn-xs btn-danger">Delete</a>
                            <a href="checkGroceryItem?id=${groceryItem.id}" class="btn btn-xs btn-warning">Check</a>
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>
                <!--  list all employees ----------------------------------------------------------- -->
                </tbody>
            </table>
            <div class="d-grid gab-2">
                <c:choose>
                    <c:when test="${currentUser.currentUserflat != null}">
                        <a class="btn btn-outline-success border-2" href="/editGroceryItem">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                            </svg>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <p class="text-center text-danger"><b><mark>Please create or join a Flat to enter grocery items!</mark></b></p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>


</div>    <!--  End of container -->
</body>
</html>

</layout:sidebar>