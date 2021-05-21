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

<html>
<head>
    <bootstrap:bootstrap-metadata/>
    <title>Grocery List</title>
    <bootstrap:bootstrap-css/>
</head>
<body>
<div class="container" role="main">

    <div class="page-header">
        <h1>Grocery Manager</h1>
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

    <!--  2 simple buttons ----------------------------------------------------------- -->
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <p>
                <a href="/editGroceryItem" class="btn btn-success">Add new Item</a>
            </p>
        </div>
    </div>
    <!--  2 simple buttons ----------------------------------------------------------- -->


    <div class="row">
        <div class="col-md-10 col-md-offset-1">

            <table data-toggle="table" class="table table-striped">
                <thead>
                <tr>
                    <th data-sortable="true">ID</th>
                    <th data-sortable="true">name</th>
                    <th data-sortable="false">Amount</th>
                    <th data-sortable="true">Requested By</th>
                    <th data-sortable="true">State</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <!--  list all employees ----------------------------------------------------------- -->
                <c:forEach items="${groceryList}" var="groceryItem">
                    <tr>
                        <td>${groceryItem.id}</td>
                        <td>${groceryItem.name}</td>
                        <td>${groceryItem.amount}</td>
                        <td>${groceryItem.requestedBy}</td>
                        <td>${groceryItem.done}</td>
                        <td>
                            <a href="editGroceryItem?id=${groceryItem.id}" class="btn btn-xs btn-success">Edit</a>
                            <a href="deleteGroceryItem?id=${groceryItem.id}" class="btn btn-xs btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                <!--  list all employees ----------------------------------------------------------- -->
                </tbody>
            </table>
        </div>
    </div>


</div>    <!--  End of container -->

<bootstrap:bootstrap-js/>

</body>
</html>

