<%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 30.05.2021
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<layout:sidebar title="Manage Flat" activePage="editFlat">
<div class="container" role="main">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
                <%--@elvariable id="flat" type="at.fhj.ima.flattered.flattered.entity.flat"--%>
            <form:form modelAttribute="flat" method="post" action="changeFlat">
                <form:hidden path="id" />
                <fieldset>
                    <legend>
                        <c:choose>
                            <c:when test="${flat.id == null}">
                                Create new flat
                            </c:when>
                            <c:otherwise>
                                Edit flat #${flat.id} - ${flat.name}
                            </c:otherwise>
                        </c:choose>
                    </legend>

                    <! ---------------- name ---------------- -->
                    <div class="mb-3">
                        <label for="inputName" class="form-label">Name</label>
                        <c:set var="nameInvalid"><form:errors path="name" cssClass="invalid-feedback"/></c:set>
                        <form:input path="name" class="form-control ${not empty nameInvalid ? 'is-invalid' : ''}" id="inputName" type="text"/>
                            ${nameInvalid}
                    </div>

                    <! ---------------- address ---------------- -->
                    <div class="mb-3">
                        <label for="inputAddress" class="form-label">Address</label>
                        <c:set var="addressInvalid"><form:errors path="address" cssClass="invalid-feedback"/></c:set>
                        <form:input path="address" class="form-control ${not empty addressInvalid ? 'is-invalid' : ''}" id="inputAddress" type="text"/>
                            ${addressInvalid}
                    </div>

                    <! ---------------- token ---------------- -->
                    <c:if test="${flat.id != null}">
                        <div class="mb-3">
                            <label for="inputToken" class="form-label">Share this token, go invite your friends!</label>
                            <div class="input-group" id="token">
                            <input class="form-control" id="inputToken" type="text" readonly="readonly" name="token"
                                   value="<c:out value="${flat.secretToken}"/>">
                                <div class="input-group-addon">
                                    <button type="button" style="padding: 1vh; background-color: ghostwhite" onclick="copyToken()">Copy token</button>
                                    <script>
                                        function copyToken() {
                                            var copyText = document.getElementById("inputToken");
                                            copyText.select();
                                            copyText.setSelectionRange(0, 99999)
                                            document.execCommand("copy");
                                            alert("Copied the token: " + copyText.value + " to your clipboard!");
                                        }
                                    </script>

                                </div>
                        </div>
                        </div>
                    </c:if>

                    <! ---------------- buttons ---------------- -->
                    <div class="mb-3">
                        <button type="submit" class="btn btn-success">Submit</button>
                        <a href="/listFlat" class="btn btn-danger">Cancel</a>
                        <a href="/joinFlat" class="btn btn-default btn-link float-end mx-4">or join a Flat</a>
                    </div>
                </fieldset>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
</layout:sidebar>