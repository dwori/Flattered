<%--
  Created by IntelliJ IDEA.
  User: Lukas
  Date: 21.05.2021
  Time: 09:46
  To change this template use File | Settings | File Templates.
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<layout:page-container title="Groceries" activePage="editGroceryItem">
<div class="container" role="main">

    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <form:form modelAttribute="groceryItem" method="post" action="changeGroceryItem">


                <fieldset>
                    <legend>Change Grocery item number ${groceryItem.id}</legend>

                    <! ---------------- name ---------------- -->
                    <div class="mb-3">
                        <label for="inputName" class="form-label">Name</label>
                        <input class="form-control" id="inputName" type="text" name="name"
                               value="<c:out value="${groceryItem.name}"/>">
                    </div>

                    <! ---------------- amount ---------------- -->
                    <div class="mb-3">
                        <label for="inputAmount" class="form-label">Amount</label>
                        <input class="form-control" id="inputAmount" type="number" name="amount"
                               value="<c:out value="${groceryItem.amount}"/>">
                    </div>

                    <! ---------------- comment ---------------- -->
                    <div class="mb-3">
                        <label for="inputComment" class="form-label">Comment</label>
                        <input class="form-control" id="inputComment" type="text" name="comment"
                               value="<c:out value="${groceryItem.comment}"/>">
                    </div>

                    <! ---------------- List ---------------- -->


                    <div class="mb-3">
                        <div class="mb-3">
                            <label for="inputGrocerylist" class="form-label">List</label>
                            <input class="form-control" id="inputGrocerylist" type="number" name="List"
                                   value="<c:out value="${groceryItem.amount}"/>">
                        </div>
                    </div>

                    <! ---------------- requestedBY ---------------- -->
                    <div class="mb-3">
                        <label for="inputRequester" class="form-label">Requested By</label>
                        <input class="form-control" id="inputRequester" type="text" name="requestedBy"
                               value="<c:out value="${groceryItem.requestedBy}"/>">
                    </div>

                    <! ---------------- buttons ---------------- -->
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a href="/listGrocery" class="btn btn-default">Cancel</a>
                    </div>

                </fieldset>
            </form:form>
        </div>
    </div>

</div>
<%--<bootstrap:bootstrap-js/>--%>
</body>
</html>
</layout:page-container>