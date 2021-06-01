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
<%@taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<layout:sidebar title="Dashboard" activePage="dashboard">

<h1 class="text-center">DASHBOARD</h1>
<!-- TODO dashboard content -->
    <!-- sql:setDataSource var = "groceryItems" driver = "com.mysql.cj.jdbc.Driver"
                       url = "jdbc:mysql://localhost/flattered"
                       user = "flattered"  password = "flattered"/> -->

    <!-- -------- top row ------- -->
    <div class="row justify-content-center">
        <div class="card mx-4 my-4 bg-success" style="width: 18rem;">
            <div class="card-body">
                <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-people card-img-top" viewBox="0 0 16 16">
                    <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"/>
                </svg>
                <h4 class="card-title mb-2">Members</h4>
                <h6 class="card-subtitle mb2">Flatmembers</h6>
                <p class="card-text">14</p>
            </div>
        </div>
        <div class="card mx-4 my-4 bg-primary" style="width: 18rem;">
            <div class="card-body">
                <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-geo card-img-top" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M8 1a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999zm2.493 8.574a.5.5 0 0 1-.411.575c-.712.118-1.28.295-1.655.493a1.319 1.319 0 0 0-.37.265.301.301 0 0 0-.057.09V14l.002.008a.147.147 0 0 0 .016.033.617.617 0 0 0 .145.15c.165.13.435.27.813.395.751.25 1.82.414 3.024.414s2.273-.163 3.024-.414c.378-.126.648-.265.813-.395a.619.619 0 0 0 .146-.15.148.148 0 0 0 .015-.033L12 14v-.004a.301.301 0 0 0-.057-.09 1.318 1.318 0 0 0-.37-.264c-.376-.198-.943-.375-1.655-.493a.5.5 0 1 1 .164-.986c.77.127 1.452.328 1.957.594C12.5 13 13 13.4 13 14c0 .426-.26.752-.544.977-.29.228-.68.413-1.116.558-.878.293-2.059.465-3.34.465-1.281 0-2.462-.172-3.34-.465-.436-.145-.826-.33-1.116-.558C3.26 14.752 3 14.426 3 14c0-.599.5-1 .961-1.243.505-.266 1.187-.467 1.957-.594a.5.5 0 0 1 .575.411z"/>
                </svg>
                <h4 class="card-title">Flatname</h4>
                <h6 class="card-subtitle mb2">Where is your flat?</h6>
                <p class="card-text">Moserhofgasse 59a, 8010 Graz</p>
            </div>
        </div>
        <div class="card mx-4 my-4 bg-success" style="width: 18rem;">
            <div class="card-body">
                <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-cart4 card-img-top" viewBox="0 0 16 16">
                    <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                </svg>
                <h4 class="card-title">Grocery Items</h4>
                <h6 class="card-subtitle mb2">How many Items are in the list</h6>
                <p class="card-text">5
                    <!-- sql:query dataSource="${groceryItems}" var="result">
                        SELECT COUNT(*) AS count FROM grocery_item;
                    /sql:query>
                        c:out value="${result.item}">/c:out> -->
                </p>
            </div>
        </div>
    </div>

    <!-- -------- 2nd row ------- -->
        <div class="row justify-content-center">
            <div class="card mx-4 my-4" style="width: 18rem;">
                <div class="card-body">
                    <h4 class="card-title">Grocery Stats</h4>
                    <h6 class="card-subtitle mb2">Ratio of done and not done groceries.</h6>
                    <p class="card-text">>>Enter Chart here<<</p>
                </div>
            </div>
            <div class="card mx-4 my-4" style="width: 18rem;">
                <div class="card-body">
                    <h4 class="card-title">Coming soon</h4>
                    <h6 class="card-subtitle mb2">Coming soon</h6>
                    <p class="card-text"></p>
                </div>
            </div>
            <div class="card mx-4 my-4" style="width: 18rem;">
                <div class="card-body">
                    <h4 class="card-title">Coming soon</h4>
                    <h6 class="card-subtitle mb2">Coming soon</h6>
                    <p class="card-text"></p>
                </div>
            </div>
        </div>
</layout:sidebar>
