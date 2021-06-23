<%--
  Created by IntelliJ IDEA.
  User: Lukas
  Date: 21.05.2021
  Time: 09:46
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

<layout:sidebar title="Manage Groceries" activePage="editGroceryItem">
<div class="container" role="main">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <form:form modelAttribute="groceryItem" method="post" action="changeGroceryItem">
                <form:hidden path="id" />
                <fieldset>
                    <legend>
                        <c:choose>
                            <c:when test="${groceryItem.id == null}">
                                Create new Grocery Item
                            </c:when>
                            <c:otherwise>
                                Edit Grocery item #${groceryItem.id} - ${groceryItem.name}
                            </c:otherwise>
                        </c:choose>
                    </legend>

                    <!--  Messages  ----------------------------------------------------------- -->

                    <!--  Error message ----------------------------------------------------------- -->
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">${errorMessage}</div>
                    </c:if>
                    <!--  Error message ----------------------------------------------------------- -->

                    <!--  Messages  ----------------------------------------------------------- -->

                    <! ---------------- name ---------------- -->
                    <div class="mb-3">
                        <label for="inputName" class="form-label">Name</label>
                        <c:set var="nameInvalid"><form:errors path="name" cssClass="invalid-feedback"/></c:set>
                        <form:input path="name" class="form-control ${not empty nameInvalid ? 'is-invalid' : ''}" id="inputName" type="text" name="name"/>
                            ${nameInvalid}
                    </div>

                    <! ---------------- amount ---------------- -->
                    <div class="mb-3">
                        <label for="inputAmount" class="form-label">Amount</label>
                        <c:set var="amountInvalid"><form:errors path="amount" cssClass="invalid-feedback"/></c:set>
                        <form:input path="amount" class="form-control ${not empty amountInvalid ? 'is-invalid' : ''}" id="inputAmount" type="number" name="amount"/>
                            ${amountInvalid}
                    </div>

                    <! ---------------- comment ---------------- -->
                    <div class="mb-3">
                        <label for="inputComment" class="form-label">Comment</label>
                        <c:set var="commentInvalid"><form:errors path="comment" cssClass="invalid-feedback"/></c:set>
                        <form:input path="comment" class="form-control ${not empty commentInvalid ? 'is-invalid' : ''}" id="inputComment" type="text" name="name"/>
                            ${commentInvalid}

                    </div>

                    <! ---------------- isChecked? ---------------- -->
                    <div class="mb-3">
                        <label for="inputDone" class="form-label">Done?</label>
                        <input class="form-control" id="inputDone" type="text" readonly="readonly" name="done"
                               value="<c:out value="${groceryItem.done}"/>">
                    </div>

                    <! ---------------- Flat ---------------- -->
                    <form:hidden path="flat"></form:hidden>


                    <! ---------------- requestedBY ---------------- -->
                    <div class="mb-3">
                        <label for="inputRequester" class="form-label">Requested By</label>
                        <input class="form-control" id="inputRequester" type="text" readonly="readonly" name="requestedBy"
                               value="<c:out value="${currentUser.username}"/>">
                    </div>



                    <! ---------------- buttons ---------------- -->
                    <div class="mb-3">
                        <button type="submit" class="btn btn-success">Submit</button>
                        <a href="/listGrocery" class="btn btn-danger">Cancel</a>
                    </div>

                </fieldset>
            </form:form>
        </div>
    </div>
</div>
</layout:sidebar>