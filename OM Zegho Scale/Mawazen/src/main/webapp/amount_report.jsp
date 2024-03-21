<%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 2/16/2019
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="page_header.jsp">
    <jsp:param name="title" value="تقرير الكميات"/>
</jsp:include>
<div class="row mx-auto">
    <div class="col-6">
        <jsp:include page="date_range_picker.jsp"/>
    </div>
    <div class="col-2 p-2">
    <button id="preview_submit" type="button" class="btn btn-success">عــــرض</button>
</div>
</div>

<div class="row"></div>
<div class="mt-2">
    <div id="preview_content"></div>
</div>




