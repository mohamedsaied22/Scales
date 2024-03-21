<%@ page import="helpers.HibernateHelper" %>
<%@ page import="elements.Operation" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Mustafa
  Date: 4/9/2020
  Time: 1:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="page_header.jsp">
    <jsp:param name="title" value="تقرير السيارات"/>
</jsp:include>
<div class="row mx-auto">
    <div class="col-6">
        <jsp:include page="date_range_picker.jsp"/>
    </div>
    <div class="col-lg-1 col-sm-2 mt-2 offset-lg-0 offset-sm-4">
        <button id="preview_submit" type="button" class="btn btn-success">عــــرض</button>
    </div>
</div>
<div class="row">


</div>
<div class="row"></div>
<div class="mt-2">
    <div id="preview_content"></div>
</div>