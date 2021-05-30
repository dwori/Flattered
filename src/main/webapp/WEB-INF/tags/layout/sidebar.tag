<%--
  Created by IntelliJ IDEA.
  User: Lukas
  Date: 21.05.2021
  Time: 09:06
  To change this template use File | Settings | File Templates.
--%>

<%@ attribute name="title" required="true" %>
<%@ attribute name="activePage" required="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <bootstrap:bootstrap-metadata/>
        <title>${title}</title>
    <bootstrap:bootstrap-css/>

    <link href="/css/sidebar.css" rel="stylesheet">
</head>
<body>
<nav class="sideNav">
    <a href="#" class="closeBtn">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
            <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
        </svg>
    </a>
    <div class="container">
        <a class="navbar-brand" href="/dashboard">Flattered</a>
        <c:if test="${activePage != 'dashboard'}">
            <li>
                <a class="dropdown-item" href="/dashboard">Dashboard</a>
            </li>
        </c:if>
        <a class="dropdown-item" href="/listGrocery">List Grocery</a>
        <c:if test="${activePage == 'listGrocery'}">
            <li>
                <a class="dropdown-item" href="/editGroceryItem">Add new Item</a>
            </li>
        </c:if>
        <a class="dropdown-item" href="#">Flats</a>

    </div>
</nav>
<main class="main-content">
    <button class="openSideNav">
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="black" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
            <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <jsp:doBody/>
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

