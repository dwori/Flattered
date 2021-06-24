<%--
  Created by IntelliJ IDEA.
  User: Peter
  Date: 23.06.2021
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<!DOCTYPE html>
<layout:sidebar title="About us" activePage="contact">
<body style="padding: 0vh; background-color: white">

<div class="col" style=" width: fit-content; margin: auto; padding: 4vh">
    <h1>Flattered Team</h1>
</div>
    <div class="container" role="main" style="display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
    width: 100%;
    padding-left: 4vh;
    padding-right: 4vh;
    padding-bottom: 4vh;">
        <div class="row">

            <div class="col">
                <div class="card" style="width: auto; background-color: ghostwhite; margin: auto">
                    <img src="https://avatars.githubusercontent.com/u/73217509?v=4" class="card-img-top" style="width: 30vh">
                    <div class="card-body">
                        <h3 class="card-title">Maximilian Ceh</h3>
                        <p class="card-text">FH-JOANNEUM - IMA19</p>
                        <p class="card-text">maximilian.ceh@edu.fh-joanneum.at</p>
                        <a href="https://github.com/W0M34T">Github Profile</a>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card" style="width: auto; background-color: ghostwhite; margin: auto">
                    <img src="https://avatars.githubusercontent.com/u/73217570?v=4" class="card-img-top" style="width: 30vh;">
                    <div class="card-body">
                        <h3 class="card-title">Lukas Dworacek</h3>
                        <p class="card-text">FH-JOANNEUM - IMA19</p>
                        <p class="card-text">lukas.dworacek@edu.fh-joanneum.at</p>
                        <a href="https://github.com/dwori">Github Profile</a>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card" style="width: auto; background-color: ghostwhite; margin: auto">
                    <img src="https://avatars.githubusercontent.com/u/73217510?v=4" class="card-img-top" style="width: 30vh">
                    <div class="card-body">
                        <h3 class="card-title">Peter Ganster</h3>
                        <p class="card-text">FH-JOANNEUM - IMA19</p>
                        <p class="card-text">peter.ganster@edu.fh-joanneum.at</p>
                        <a href="https://github.com/Giu52">Github Profile</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
<%--<bootstrap:bootstrap-js/>--%>
</body>
</layout:sidebar>