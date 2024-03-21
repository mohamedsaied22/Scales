<%@ page import="elements.Operation" %>
<%@ page import="helpers.HibernateHelper" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Mustafa
  Date: 10/29/2019
  Time: 9:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String fontSize = "display-4", fontColor;
    HibernateHelper hibernateHelper = new HibernateHelper(request, response);
    Operation operation = (Operation) hibernateHelper.retreiveData(Operation.class, Long.valueOf(request.getParameter("operation")));
    if (operation.getSafetyTax() > 0) {
        fontColor = "text-danger";

    } else {
        fontColor = "";
    }
%>

<table class="table table-bordered table-striped table-sm" width="100%">
    <tbody>
    <tr>
        <th width="30%">العميل</th>
        <td><%=operation.getClient().getClient()%>
        </td>
    </tr>
    <tr>
        <th>البضاعة</th>
        <td><%=operation.getGoods().getGoods()%>
        </td>
    </tr>
    <tr>
        <th>رقم المقطورة</th>
        <td><%=operation.getMaqturaNum()%>
        </td>
    </tr>
    <tr>
        <th>الوزنة الأولى</th>
        <td><%=operation.getFirstWeight()%>
        </td>
    </tr>
    <tr>
        <th>التاريخ</th>
        <td><%=operation.getStartDate()%>
        </td>
    </tr>
    <tr>
        <th>الوقت</th>
        <td><%=operation.getStartTime()%>
        </td>
    </tr>
    <tr>
        <th class="<%=fontColor%>">غرامة السلامة والصحة المهنية</th>
        <td class="<%=fontColor%> <%=fontSize%>"><%=operation.getSafetyTax()%>
        </td>
    </tr>
    </tbody>
</table>

