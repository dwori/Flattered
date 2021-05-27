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

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link href="/css/sidebar.css" rel="stylesheet">
</head>
<body>
<nav class="sideNav">
    <a href="#" class="closeBtn">×</a>
    <div class="container">
        <a class="navbar-brand">Flattered</a>


        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <c:if test="${activePage == 'listGrocery' or activePage == 'editGroceryItem'}">
                    <c:set var="groceriesMenuActive">active</c:set>
                </c:if>
                <li class="nav-item ${groceriesMenuActive} dropdown">
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/listGrocery">List Grocery</a>
                        <a class="dropdown-item" href="#">Flats</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<main class="main-content">
    <button class="openSideNav">
        Menu
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="black" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
            <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <h1>Flattered Dashboard</h1>
    <p>Here is some random sample text too</p>
</main>
<script>
    let openBtn = document.querySelector(".openSideNav");
    openBtn.addEventListener("click", () => {
        showNav();
    });
    let closeBtn = document.querySelector(".closeBtn");
    closeBtn.addEventListener("click", () => {
        hideNav();
    });
    function showNav() {
        document.querySelector(".sideNav").style.width = "300px";
        document.querySelector('.main-content').style.marginLeft = "300px";
    }
    function hideNav() {
        document.querySelector(".sideNav").style.width = "0";
        document.querySelector('.main-content').style.marginLeft = "0px";
    }
</script>
</body>
</html>

