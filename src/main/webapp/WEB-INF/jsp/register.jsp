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
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:sidebar title="Register" activePage="register">


<html>
<head>
    <bootstrap:bootstrap-metadata/>
    <title>Register</title>
    <bootstrap:bootstrap-css/>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

</head>
<body>
<div class="container" role="main">

    <div class="page-header mb-4">
        <h1>Register</h1>
        <h4>Here you can create a User Account.</h4>
    </div>
    <div class="container">
        <div class="row">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <form method="POST" action="#" role="form">
                        <div class="form-group">
                            <h2>Create account</h2>
                        </div>
                        <!-- form:form modelAttribute="user" method="post" action="editUser" -->
                        <!--form:hidden path="id" /-->
                        <div class="form-group">
                            <label class="form-label" for="signupName">Username</label>
                            <input id="signupName" type="text" maxlength="50" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="signupPassword">Password</label>
                            <input id="signupPassword" type="password" maxlength="25" class="form-control" placeholder="at least 6 characters" length="40">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="signupPasswordagain">Password again</label>
                            <input id="signupPasswordagain" type="password" maxlength="25" class="form-control">
                        </div>
                        <div class="form-group">
                            <button id="signupSubmit" type="submit" class="btn btn-info btn-block">Create your account</button>
                        </div>
                        <p class="form-group">By creating an account, you agree to our <a href="#">Terms of Use</a> and our <a href="#">Privacy Policy</a>.</p>
                        <hr>
                        <p></p>Already have an account? <a href="/login">Sign in</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    <!--/form:form-->




<bootstrap:bootstrap-js/>

</body>
</html>

</layout:sidebar>