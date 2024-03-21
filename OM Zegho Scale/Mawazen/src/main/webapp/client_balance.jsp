<%@ page import="org.hibernate.Session" %>
<%@ page import="hibernate.HibernateUtil" %>
<%@ page import="elements.ClientGoods" %>
<%@ page import="java.util.List" %>
<%@ page import="helpers.HibernateHelper" %>
<%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 1/2/2019
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HibernateHelper hibernateHelper = new HibernateHelper(request, response);
    List<ClientGoods> clientGoodsList = hibernateHelper.retreiveData("from ClientGoods");
%>
<div id="section-to-print" class="mx-auto mt-3 no-margin-print" style="height: 5.5in;">
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:include page="page_header.jsp">
        <jsp:param name="title" value="تقرير أرصدة عملاء"/>
    </jsp:include>
    <jsp:include page="search_field.jsp"/>
    <table id="mytable" class="table table-hover table-bordered" style="width: 95%;">
        <thead>
        <tr>
            <th> اسم العميل<i class="fas float-left my-2"></i></th>
            <th> البضاعة<i class="fas float-left my-2"></i></th>
            <th> الرصيد الافتتاحى<i class="fas float-left my-2"></i></th>
            <th> وارد<i class="fas float-left my-2"></i></th>
            <th> صادر<i class="fas float-left my-2"></i></th>
            <th> الباقى<i class="fas float-left my-2"></i></th>
        </tr>
        </thead>
        <tbody id="mytable_body">
        <%
            for (ClientGoods clientGoods : clientGoodsList) {
        %>
        <tr>
            <td><%=clientGoods.getClient().getClient()%>
            </td>
            <td><%=clientGoods.getGoods().getGoods()%>
            </td>
            <td><%=clientGoods.getOpeningBalance()%>
            </td>
            <td><%=clientGoods.getInBalance()%>
            </td>
            <td><%=clientGoods.getOutBalance()%>
            </td>
            <td><%=(clientGoods.getOpeningBalance() + clientGoods.getInBalance()) - clientGoods.getOutBalance()%>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>