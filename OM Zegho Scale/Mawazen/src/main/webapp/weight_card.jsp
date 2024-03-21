<%@ page import="org.hibernate.Session" %>
<%@ page import="hibernate.HibernateUtil" %>
<%@ page import="elements.Operation" %>
<%@ page import="helpers.HibernateHelper" %><%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 1/2/2019
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HibernateHelper hibernateHelper = new HibernateHelper(request, response);
    Operation operation = (Operation) hibernateHelper.retreiveData(Operation.class, Long.valueOf(request.getParameter("n")));
%>
<div id="section-to-print" class="mx-auto mt-3 no-margin-print" style="height: 5.5in;width:8.5in">

    <div id="print_card" class="card">
        <div class="card-body">
            <input type="hidden" id="n" value="<%=request.getParameter("n")%>"/>
            <div class="row">
                <div class="col-1 d-print-none">
                    <i class="invisible fas fa-2x fa-print"></i>
                </div>
                <div class="offset-5">
                    <h2><%=operation.getId()%>
                    </h2>
                </div>
                <div class="mr-auto ml-3">
                    <img src="photos/New%20Logo/sescotrans_logo.png" height="59" alt="" >
                </div>
            </div>
            <div class="row">
                <div class="offset-5">
                    <h1 class="display-5 text-center ">بطاقة وزن</h1>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-7">
                    <table class="table table-bordered">
                        <tr>
                            <th class="py-1" width="35%">اسم العميل</th>
                            <td class="py-1"><%=operation.getClient().getClient()%>
                            </td>
                        </tr>
                        <%--
                        <tr>
                            <th class="py-1">اسم المركب</th>
                            <td class="py-1"><%=operation.getShip().getShip()%>
                            </td>
                        </tr>
                        --%>
                        <%
                            if (operation.isDone()) {
                        %>
                        <tr>
                            <th class="py-1">نوع الحجز</th>
                            <td class="py-1"><%=operation.getOperationType().getOperationType()%>
                            </td>
                        </tr>
                        <%
                            }
                        %>

                        <tr>
                            <th class="py-1">نوع البضاعة</th>
                            <td class="py-1"><%=operation.getGoods().getGoods()%>
                            </td>
                        </tr>


                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <table class="table table-bordered">
                        <tr>
                            <th class="py-1" width="20%">رقم السيارة</th>
                            <td class="py-1"><%=operation.getVehicleNum()%>
                            </td>
                            <th class="py-1" width="20%">رقم المقطورة</th>
                            <td class="py-1"><%=operation.getMaqturaNum()%>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th class="py-1" width="20%">وزن بضائغ الشاحنة</th>
                            <th class="py-1" width="20%">الوزن بالطن</th>
                            <th class="py-1" width="15%">التاريخ</th>
                            <th class="py-1" width="15%">الوقت</th>
                            <th class="py-1">مسئول الوزن</th>
                            <th class="invisible" width="5%"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="py-1">وزنة اولى</th>
                            <td class="py-1"><%=operation.getFirstWeight()%>
                            </td>
                            <td class="py-1"><%=operation.getStartDate()%>
                            </td>
                            <td class="py-1"><%=operation.getStartTime()%>
                            </td>
                            <td class="py-1"><%=operation.getUser1().getName()%>
                            </td>
                            <td class="pt-3 pb-1">
                                <%=operation.getWeightIcon(operation.isFirstWeightAutomatic())%>
                            </td>
                        </tr>
                        <%
                            if (operation.isDone()) {
                        %>
                        <tr>
                            <th class="py-1">وزنة ثانية</th>
                            <td class="py-1"><%=operation.getSecondWeight()%>
                            </td>
                            <td class="py-1"><%=operation.getEndDate()%>
                            </td>
                            <td class="py-1"><%=operation.getEndTime()%>
                            </td>
                            <td class="py-1"><%=operation.getUser2().getName()%>
                            </td>
                            <td class="pt-3 pb-1">
                                <%=operation.getWeightIcon(operation.isSecondWeightAutomatic())%>
                            </td>
                        </tr>
                        <tr>
                            <th class="py-1">الوزن الصافى</th>
                            <td class="py-1"><%=operation.getNetWeight()%>
                            </td>
                            <td class="py-1"> ـــــــــــــ</td>
                            <td class="py-1"> ـــــــــــــ</td>
                            <td class="py-1"> ـــــــــــــ</td>
                            <td class="py-1"> ـــــــــــــ</td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>

                </div>

            </div>


        </div>
    </div>
</div>


