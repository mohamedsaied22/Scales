<%@ page import="elements.Operation" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="helpers.HibernateHelper" %>
<%@ page import="java.util.List" %>
<%@ page import="elements.OperationType" %>
<%@ page import="elements.Client" %><%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 2/17/2019
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HibernateHelper hibernateHelper = new HibernateHelper(request, response);
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String startTime = request.getParameter("startTime");
    String endTime = request.getParameter("endTime");
    OperationType importOperationType = (OperationType) hibernateHelper.retreiveData(OperationType.class, (long) 1);
    OperationType exportOperationType = (OperationType) hibernateHelper.retreiveData(OperationType.class, (long) 2);
    System.err.println("from Operation where done = true and (startDate between '" + startDate + "' and  '" + endDate + "') and (startTime between '" + startTime + "' and  '" + endTime + "')");
    List<Operation> totalOperationList = hibernateHelper.retreiveData("from Operation where done = true and (startDate between '" + startDate + "' and  '" + endDate + "') and (startTime between '" + startTime + "' and  '" + endTime + "')");
    List<Operation> importOperationList = hibernateHelper.retreiveData("from Operation where done = true and (startDate between '" + startDate + "' and  '" + endDate + "') and (startTime between '" + startTime + "' and  '" + endTime + "') and operationType =" + importOperationType.getId());
    List<Operation> exportOperationList = hibernateHelper.retreiveData("from Operation where done = true and (startDate between '" + startDate + "' and  '" + endDate + "') and (startTime between '" + startTime + "' and  '" + endTime + "') and operationType =" + exportOperationType.getId());
    List<Operation> sumOperationList = hibernateHelper.retreiveData("select sum(netWeight) from Operation where done = true and (startDate between '" + startDate + "' and  '" + endDate + "') and (startTime between '" + startTime + "' and  '" + endTime + "')");
    List<Operation> sumImportOperationList = hibernateHelper.retreiveData("select sum (netWeight) from Operation where done = true and (startDate between '" + startDate + "' and  '" + endDate + "') and (startTime between '" + startTime + "' and  '" + endTime + "') and operationType =" + importOperationType.getId());
    List<Operation> sumExportOperationList = hibernateHelper.retreiveData("select sum (netWeight) from Operation where done = true and (startDate between '" + startDate + "' and  '" + endDate + "') and (startTime between '" + startTime + "' and  '" + endTime + "') and operationType =" + exportOperationType.getId());
    List<Client> clientList = hibernateHelper.retreiveData("from Client order by client");
%>
<%
    if (totalOperationList.size() > 0) {
%>
<div class="mt-5">
    <h3> تقرير الكميات خلال الفترة من <%=startDate%> إلى <%=endDate%> من <%=startTime%> إلي <%=endTime%>
    </h3>
</div>
<jsp:include page="test_chart.jsp"/>
<table id="mytable" class="mx-auto table table-hover table-bordered" style="width: 60%;">
    <thead>
    <tr>
        <th>#</th>
        <th>عدد السيارات</th>
        <th>حمولة</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <%=importOperationType.getOperationType()%>
        </td>
        <td>
            <%=importOperationList.size()%>
        </td>
        <td>

            <%
                if (sumImportOperationList.get(0) != null) {
            %>
            <%=sumImportOperationList.get(0)%>
            <%
            } else {
            %>
            0
            <%
                }
            %>
        </td>
    </tr>
    <tr>
        <td>
            <%=exportOperationType.getOperationType()%>
        </td>
        <td>
            <%=exportOperationList.size()%>
        </td>
        <td>

            <%
                if (sumExportOperationList.get(0) != null) {
            %>
            <%=sumExportOperationList.get(0)%>
            <%
            } else {
            %>
            0
            <%
                }
            %>
        </td>
    </tr>
    <tr>
        <td>
            الإجمالى
        </td>
        <td>
            <%=totalOperationList.size()%>
        </td>
        <td>
            <%
                if (sumOperationList.get(0) != null) {
            %>
            <%=sumOperationList.get(0)%>
            <%
            } else {
            %>
            0
            <%
                }
            %>
        </td>
    </tr>
    </tbody>
</table>

<table id="mytable" class="mx-auto table table-hover table-bordered" style="width: 90%;">
    <thead>
    <tr>
        <th>العميل</th>
        <th>#</th>
        <th>عدد السيارات</th>
        <th>حمولة</th>
    </tr>
    </thead>
    <tbody>
    <%

        String bgColor;
        for (Client client : clientList) {
            if (clientList.indexOf(client) % 2 == 0) {
                bgColor = "bg-light";
            } else {
                bgColor = "bg-white";
            }
            int totalCount = 0, importCount = 0, exportCount = 0, totalWeight = 0, importWeight = 0, exportWeight = 0;
            for (Operation operation : totalOperationList) {
                if (operation.getClient().getId() == client.getId()) {
                    totalCount++;
                    totalWeight += operation.getNetWeight();
                    if (operation.getOperationType().getId() == importOperationType.getId()) {
                        importCount++;
                        importWeight += operation.getNetWeight();
                    } else if (operation.getOperationType().getId() == exportOperationType.getId()) {
                        exportCount++;
                        exportWeight += operation.getNetWeight();
                    }

                }
            }
    %>
    <%
        if (totalCount > 0) {
    %>
    <tr class="<%=bgColor%>">
        <td rowspan="3" style="vertical-align : middle;text-align:center;"><%=client.getClient()%>
        </td>
        <td>
            <%=importOperationType.getOperationType()%>
        </td>
        <td>
            <%=importCount%>
        </td>
        <td>
            <%=importWeight%>
        </td>
    </tr>
    <tr class="<%=bgColor%>">
        <td>
            <%=exportOperationType.getOperationType()%>
        </td>
        <td>
            <%=exportCount%>
        </td>
        <td>
            <%=exportWeight%>
        </td>
    </tr>
    <tr class="<%=bgColor%>">
        <td>
            الإجمالى
        </td>
        <td>
            <%=totalCount%>
        </td>
        <td>
            <%=totalWeight%>
        </td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>

<%} else {%>
<h3>لا يوجد اى سيارات خلال الفترة المختارة</h3>
<%}%>
