<%--
  Created by IntelliJ IDEA.
  User: Mustafa
  Date: 3/10/2019
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="helpers.HibernateHelper" %>
<%@ page import="elements.Goods" %>
<%@ page import="elements.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="elements.OperationType" %>
<%@ page import="elements.Ship" %><%--
  Created by IntelliJ IDEA.
  User: Mustafa
  Date: 3/6/2019
  Time: 1:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HibernateHelper hibernateHelper = new HibernateHelper(request, response);
    List<Client> clientList = hibernateHelper.retreiveData("from Client");
    List<Goods> goodsList = hibernateHelper.retreiveData("from Goods");
    List<Ship> shipList = hibernateHelper.retreiveData("from Ship");
%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="page_header.jsp">
    <jsp:param name="title" value="الرصيد الافتتاحى"/>
</jsp:include>
<form method="post" class="needs-validation mx-3" novalidate>

    <div class="row">
        <div class="col-1 px-0 py-2">
            <label> العميل: </label>
        </div>
        <div class="col-5">
            <select class="form-control" id="client" name="client" required>
                <option value="" selected disabled hidden>اختار اسم العميل</option>
                <%
                    for (Client client : clientList) {
                %>
                <option value="<%=client.getId()%>"><%=client.getClient()%>
                </option>
                <%
                    }
                %>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="col-1 px-0 py-2">
            <label> البضاعة: </label>
        </div>
        <div class="col-5">
            <select class="form-control" id="goods" name="goods" required>
                <%
                    if (goodsList.size() > 1) {
                %>
                <option value="" selected disabled hidden>اختار نوع البضاعة</option>
                <%
                    }

                    for (Goods goods : goodsList) {

                        if (goodsList.size() == 1) {
                %>
                <option selected value="<%=goods.getId()%>"><%=goods.getGoods()%>
                </option>
                <%
                } else {
                %>
                <option value="<%=goods.getId()%>"><%=goods.getGoods()%>
                </option>
                <%
                        }
                    }
                %>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="col-1 px-0 py-2">
            <label> الرصيد: </label>
        </div>
        <div class="col-5">
            <input type="number" class="form-control" id="opening_balance_" name="opening_balance_" placeholder="ادخل الرصيد الافتتاحى"
                   required>
            <div class="invalid-feedback mb-1">
                لابد من ادخال الرصيد الافتتاحى
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-1 offset-2">
            <button id="opening_balance_submit" type="button" class="btn btn-success">حـــفـــظ</button>
        </div>
        <div class="col-1">
            <button type="reset" class="btn btn-primary">مـــســـح</button>
        </div>
    </div>


</form>
