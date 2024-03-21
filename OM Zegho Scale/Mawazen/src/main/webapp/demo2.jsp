<%@ page import="org.hibernate.Session" %>
<%@ page import="hibernate.HibernateUtil" %>
<%@ page import="elements.Operation" %>
<%@ page import="java.util.List" %>
<%@ page import="helpers.HibernateHelper" %><%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 1/2/2019
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HibernateHelper hibernateHelper = new HibernateHelper(request,response);
    List<Operation> operationList = hibernateHelper.retreiveData("from Operation where done = false");
%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="page_header.jsp">
    <jsp:param name="title" value="وزنة ثانية"/>
</jsp:include>
<form method="post" class="needs-validation mx-3" novalidate>
    <input type="hidden" name="n" value="4">
    <input type="hidden" id="auto" value=""/>

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
            <label>وزنة ثانية:</label>
        </div>
        <div class="col-5">

            <div class="input-group">
                <input type="text" class="form-control" id="weight_field" name="second_weight"
                       placeholder="ادخل وزنة ثانية" disabled required>
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" id="automatic_weight" type="button"><i
                            class="fas fa-weight"></i>
                    </button>
                    <button class="btn btn-outline-secondary" id="manual_weight" type="button"><i
                            class="fas fa-pencil-alt"></i></button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-1 offset-2">
            <button type="button" id="demo2_submit" class="btn btn-success">حـــفـــظ</button>
        </div>
        <div class="col-1">
            <button type="reset" class="btn btn-primary">مـــســـح</button>
        </div>
    </div>

</form>