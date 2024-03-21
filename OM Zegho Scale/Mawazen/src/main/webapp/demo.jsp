<%@ page import="org.hibernate.Session" %>
<%@ page import="hibernate.HibernateUtil" %>
<%@ page import="elements.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="elements.Goods" %>
<%@ page import="elements.OperationType" %>
<%@ page import="helpers.HibernateHelper" %>
<%@ page import="elements.Ship" %><%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 1/1/2019
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HibernateHelper hibernateHelper = new HibernateHelper(request, response);
    List<Client> clientList = hibernateHelper.retreiveData("from Client");
    List<Goods> goodsList = hibernateHelper.retreiveData("from Goods");
    List<OperationType> operationTypeList = hibernateHelper.retreiveData("from OperationType ");
    List<Ship> shipList = hibernateHelper.retreiveData("from Ship");
%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="page_header.jsp">
    <jsp:param name="title" value="وزنة أولى"/>
</jsp:include>
<form method="post" class="needs-validation mx-3" novalidate>
    <input type="hidden" id="auto" value=""/>

    <div class="row mt-2">
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
    <%--
    <div class="row">
        <div class="col-1 px-0 py-2">
            <label>  المركب: </label>
        </div>
        <div class="col-5">
            <select class="form-control" id="ship" name="ship" required>
                <option value="" selected disabled hidden>اختار اسم المركب</option>
                <%
                    for (Ship ship : shipList) {
                %>
                <option value="<%=ship.getId()%>"><%=ship.getShip()%>
                </option>
                <%
                    }
                %>
            </select>
        </div>
    </div>
    --%>
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

                        if (goods.getId() == 1) {
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
    <%--<div class="row">
        <div class="col-1 px-0 py-2">
            <label>نوع الحجز: </label>
        </div>
        <div class="col-5">
            <select class="form-control" name="operation_type">
                <option selected disabled hidden>اختار نوع الحجز</option>
                <%
                    for (OperationType operationType : operationTypeList) {
                %>
                <option value="<%=operationType.getId()%>"><%=operationType.getOperationType()%>
                </option>
                <%
                    }
                %>
            </select>
        </div>
    </div>--%>
    <div class="row">
        <div class="col-1 px-0 py-2">
            <label> السيارة: </label>
        </div>
        <div class="col-5">
            <input type="text" class="form-control" id="vechile_num" name="vechile_num" placeholder="ادخل رقم السيارة"
                   required>
        </div>
    </div>
    <div class="row">
        <div class="col-1 px-0 py-2">
            <label> المقطورة: </label>
        </div>
        <div class="col-5">
            <input type="text" class="form-control" id="maqtura_num" name="maqtura_num" placeholder="ادخل رقم المقطورة"
                   required>
        </div>
    </div>


    <%-- <div class="row">
         <div class="col-1 px-0 py-2">
             <label>اسم السائق: </label>
         </div>
         <div class="col-5">
             <input type="text" class="form-control" id="driver" name="driver" placeholder="ادخل اسم السائق"
                    required>
         </div>
     </div>--%>
    <div class="row">
        <div class="col-1 px-0 py-2">
            <label>وزنة اولى: </label>
        </div>
        <div class="col-5">

            <div class="input-group">
                <input type="text" class="form-control" id="weight_field" name="first_weight"
                       placeholder="وزنة اولى" disabled required>
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
    <%--<div class="row">
        <div class="col-2">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <input type="checkbox">
                    </div>
                </div>
                <label class="form-control text-center">تصريح</label>
            </div>
        </div>
    </div>--%>
    <div class="row">
        <div class="col-1 offset-2">
            <button type="button" id="demo_sumbit" class="btn btn-success">حـــفـــظ</button>
        </div>
        <div class="col-1">
            <button type="reset" class="btn btn-primary">مـــســـح</button>
        </div>
    </div>


</form>