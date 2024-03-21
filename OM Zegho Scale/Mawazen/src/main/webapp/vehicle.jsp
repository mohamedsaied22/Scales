<%@ page import="elements.Operation" %>
<%@ page import="java.util.List" %>
<%@ page import="helpers.HibernateHelper" %><%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 2/12/2019
  Time: 12:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HibernateHelper hibernateHelper = new HibernateHelper(request, response);
    List<Operation> operationList = hibernateHelper.retreiveData("from Operation");
    int x = 0;
%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="page_header.jsp">
    <jsp:param name="title" value="تقرير السيارات"/>
</jsp:include>
<div id="section-to-print" class="mx-auto mt-3 no-margin-print" style="height: 5.5in;">
    <div class="mt-5">
        <h3></h3>
    </div>

    <jsp:include page="search_field.jsp"/>
    <table id="mytable" class="table table-hover table-bordered">
        <thead>
        <tr>
            <th scope="col">#<i class="fas float-left my-2"></i></th>
            <th scope="col">رقم السيارة<i class="fas float-left my-2"></i></th>
            <th scope="col">رقم المقطورة<i class="fas float-left my-2"></i></th>
            <th scope="col">الوزن الفارغ<i class="fas float-left my-2"></i></th>
            <th scope="col">الوزن القائم<i class="fas float-left my-2"></i></th>
            <th scope="col">الوزن الصافى<i class="fas float-left my-2"></i></th>
            <th scope="col">التاريخ<i class="fas float-left my-2"></i></th>
            <th class="invisible"></th>

        </tr>
        </thead>
        <tbody id="mytable_body">
        <%
            for (Operation operation : operationList) {
        %>
        <tr>
            <td scope="row"><%=(++x)%>
            </td>
            <td><%=operation.getVehicleNum()%>
            </td>
            <td><%=operation.getMaqturaNum()%>
            </td>
            <td><%=operation.getEmptyWeight()%>
            </td>
            <td><%=operation.getNotEmptyWeight()%>
            </td>
            <td><%=operation.getNetWeight()%>
            </td>
            <td><%=operation.getStartDate()%>
            </td>
            <td class="pt-3 pb-1 invisible p"><i class="fas fa-print" operation_id="<%=operation.getId()%>"></i></td>
        </tr>
        <%
            }
        %>

        </tbody>
    </table>
</div>