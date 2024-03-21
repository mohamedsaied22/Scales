<%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 1/28/2019
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="page_header.jsp">
    <jsp:param name="title" value="انشاء بضاعة"/>
</jsp:include>
<form method="post" class="needs-validation mx-3" novalidate>

    <div class="row mt-2">
        <div class="col-1 px-0 py-2">
            <label> البضاعة: </label>
        </div>
        <div class="col-5">
            <input type="text" class="form-control" id="goods" name="goods" placeholder="ادخل اسم البضاعة"
                   required>
            <div class="invalid-feedback mb-1">
                لابد من ادخال اسم البضاعة
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-1 offset-2">
            <button id="new_goods_submit" type="button" class="btn btn-success">حـــفـــظ</button>
        </div>
        <div class="col-1">
            <button type="reset" class="btn btn-primary">مـــســـح</button>
        </div>
    </div>


</form>
