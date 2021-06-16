<%--
  Created by IntelliJ IDEA.
  User: Lukas
  Date: 11.06.2021
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:sidebar title="Join a Flat" activePage="joinFlat">

    <form:form action="/joinAFlat" method="post">
        <div class="mb-3 mx-4 my-4 justify-content-center">
            <h1>JOIN A FLAT</h1>
            <label for="token">Token:</label>
            <input id="token" name="token" class="form-control form-control-lg" type="string" placeholder="Enter Token here">
        </div>
        <div class="mb-3 mx-4 my-4 justify-content-center">
            <button type="submit" class="btn btn-success">Join</button>
            <a href="/listFlat" class="btn btn-danger">Cancel</a>
        </div>
    </form:form>
    <bootstrap:bootstrap-js/>
</layout:sidebar>
