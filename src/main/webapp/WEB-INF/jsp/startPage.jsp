<%--
  Created by IntelliJ IDEA.
  User: Lukas
  Date: 02.06.2021
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<layout:sidebar title="Welcome to Flattered" activePage="startPage">
    <head>
        <title>${title}</title>
    </head>

    <h1 class="text-center">Flattered</h1>
    <div class="container justify-content-center" style="width: 300px">
    <div class="card">
        <div class="card-header text-center">
            Welcome to Flattered!
        </div>
            <a href="/login" class="btn btn-primary mx-auto mb-2 mt-2" style="width: 100px">Login</a>
            <a href="/register" class="btn btn-primary mx-auto mb-2" style="width: 100px">Register</a>
    </div>
    </div>
</layout:sidebar>
