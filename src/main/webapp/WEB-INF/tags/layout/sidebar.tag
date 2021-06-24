<%--
  Created by IntelliJ IDEA.
  User: Lukas
  Date: 21.05.2021
  Time: 09:06
  To change this template use File | Settings | File Templates.
--%>
<%@ attribute name="title" required="true" %>
<%@ attribute name="activePage" required="true" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="file" tagdir="/WEB-INF/tags/file" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <header>
    <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="col Logo"
        style="margin-left: 8vh">
            <a href="/dashboard"><img src="img/Logo_small.png"></a>
        </div>
        <div class="col Actions">
            <div class="float-end mx-2 my-2">
                <div class="dropdown">
                    <button class="btn dropdown-toggle" type="button" id="userTask" data-bs-toggle="dropdown" aria-expanded="false"
                    style="color: white;
                    background-color: transparent;
                    margin-right: 10vh">
                        ${currentUser.username}
                            <c:choose>
                                <c:when test="${currentUser.files[0].id == null}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                    </svg>
                                </c:when>
                                <c:otherwise>
                                    <img src="/file/${currentUser.files[0].id}" alt="mdo" class="rounded-circle" width="20" height="20">
                                </c:otherwise>
                            </c:choose>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="userTask">
                        <li><a class="dropdown-item" href="/editProfile?id=${currentUser.id}">Edit User profile</a></li>
                        <li>
                            <form:form method="post" action="/logout">
                                <button class="dropdown-item" type="submit">Logout</button>
                            </form:form>
                        </li>
                    </ul>
                </div>
            </div>
            <c:if test="${activePage == 'dashboard'}">
                <div class="dropdown float-end my-2 mx-2">
                    <button class="btn dropdown-toggle" type="button" id="switchFlat" data-bs-toggle="dropdown" aria-expanded="false"
                            style="color: white;
                            background-color: transparent">
                      Switch active Flat
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="switchFlat">
                      <c:forEach items="${userFlats}" var="flats">
                          <li><a class="dropdown-item" href="/switchCurrentFlat?id=${flats.id}">${flats.name}</a></li>
                      </c:forEach>
                    </ul>
                </div>
            </c:if>
        </div>
    </div>
    </header>
    <bootstrap:bootstrap-metadata/>
        <title>${title}</title>
    <bootstrap:bootstrap-css/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.2/dropzone.css" />

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
        <a class="navbar-brand" href="/">
            <img src="img/logo_200x200.png">
        </a>
            <li>
                <a class="dropdown-item" href="/dashboard">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-speedometer2" viewBox="0 0 16 16">
                        <path d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z"/>
                        <path fill-rule="evenodd" d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z"/>
                    </svg>
                    Dashboard
                </a>
            </li>
        <a class="dropdown-item" href="/listGrocery">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-list-check" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/>
            </svg>
            List Grocery
        </a>
        <a class="dropdown-item" href="/listFlat">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-house" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
            </svg>
            Flats
        </a>
    </div>
</nav>
<main class="main-content">
    <button class="openSideNav">
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="black" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
            <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <jsp:doBody/>
</main>

<footer class="footer py-3 bg-dark shadow-sm" style="text-align: right">
    <c:choose>
        <c:when test="${activePage != 'contact'}">
            <a href="/contact" class="btn btn-secondary"
               style="background-color: transparent; margin-right: 10vh">About us</a>
        </c:when>
        <c:otherwise>
            <a href="/dashboard" class="btn btn-secondary"
               style="background-color: transparent; margin-right: 10vh">Back to Flattered</a>
        </c:otherwise>
    </c:choose>

</footer>

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
<bootstrap:bootstrap-js/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.2/dropzone.js"></script>

<script src="/js/custom-dropzone.js"></script>

</body>
</html>

