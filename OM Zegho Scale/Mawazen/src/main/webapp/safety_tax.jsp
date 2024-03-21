<%@ page import="helpers.HibernateHelper" %>
<%@ page import="elements.Operation" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Mustafa
  Date: 11/17/2019
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HibernateHelper hibernateHelper = new HibernateHelper(request,response);
    List<Operation> operationList = hibernateHelper.retreiveData("from Operation where done = false");
%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="page_header.jsp">
    <jsp:param name="title" value="غرامة سلامة وصحة مهنية"/>
</jsp:include>
<form method="post" class="needs-validation mx-3" novalidate>
    <input type="hidden" name="n" value="4">

    <div class="row mt-2">
        <div class="col-1 px-0 py-2">
            <label> السيارة:</label>
        </div>
        <div class="col-5">
            <select id="operation" class="form-control" name="operation" required>

                <%
                    if (operationList.size() == 0) {
                %>
                <option value="" selected disabled hidden>لا يوجد سيارات</option>
                <%
                } else {
                %>
                <option value="" selected disabled hidden>اختار رقم السيارة</option>
                <%
                    }
                %>
                <%
                    for (Operation operation : operationList) {
                %>
                <option value="<%=operation.getId()%>"><%=operation.getVehicleNum()%>
                </option>
                <%
                    }
                %>

            </select>
        </div>
    </div>
    <div class="row">
        <div id="first_weight_info" class="col-6"></div>
    </div>

    <div class="row">
        <div class="col-1 px-0 py-2">
            <label>الغرامة:</label>
        </div>
        <div class="col-5">

            <div class="input-group">
                <input type="text" class="form-control" id="tax_field" name="tax"
                       placeholder="ادخل الغرامة" required>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-1 offset-2">
            <button type="button" id="tax_submit" class="btn btn-success">حـــفـــظ</button>
        </div>
        <div class="col-1">
            <button type="reset" class="btn btn-primary">مـــســـح</button>
        </div>
    </div>

</form>
