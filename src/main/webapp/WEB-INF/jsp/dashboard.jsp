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

<!DOCTYPE html>
<layout:sidebar title="Dashboard" activePage="dashboard">

<h1 class="text-center">DASHBOARD</h1>
<!-- TODO dashboard content -->
    <!-- -------- top row ------- -->
    <div class="row justify-content-center">
        <div class="card mx-4 my-4 bg-success" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Members</h5>
                <h6 class="card-subtitle mb2">Flatmembers</h6>
                <p class="card-text">14</p>
            </div>
        </div>
        <div class="card mx-4 my-4 bg-primary" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Flatname</h5>
                <h6 class="card-subtitle mb2">Where is your flat?</h6>
                <p class="card-text">Moserhofgasse</p>
            </div>
        </div>
        <div class="card mx-4 my-4 bg-success" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Grocery Items</h5>
                <h6 class="card-subtitle mb2">How many Items are in the list</h6>
                <p class="card-text">20</p>
            </div>
        </div>
    </div>

    <!-- -------- 2nd row ------- -->
        <div class="row justify-content-center">
            <div class="card mx-4 my-4" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Grocery Stats</h5>
                    <h6 class="card-subtitle mb2">Ratio of done and not done groceries.</h6>
                    <p class="card-text">>>Enter Chart here<<</p>
                </div>
            </div>
            <div class="card mx-4 my-4" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Coming soon</h5>
                    <h6 class="card-subtitle mb2">Coming soon</h6>
                    <p class="card-text"></p>
                </div>
            </div>
            <div class="card mx-4 my-4" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Coming soon</h5>
                    <h6 class="card-subtitle mb2">Coming soon</h6>
                    <p class="card-text"></p>
                </div>
            </div>
        </div>
</layout:sidebar>
