<%@ page import="elements.User" %>
<%@ page import="helpers.HibernateHelper" %>
<%@ page import="elements.Role" %><%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 1/26/2019
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HibernateHelper hibernateHelper = new HibernateHelper(request, response);
    User user = (User) request.getSession().getAttribute("user");
    Role manager = (Role) hibernateHelper.retreiveData(Role.class, (long) 1);
    Role weightUser = (Role) hibernateHelper.retreiveData(Role.class, (long) 2);
%>

<html dir="rtl">
<head>
    <title>سيسكو ترانس</title>
    <link rel="shortcut icon" href="photos/New%20Logo/cropped-Untitled-1-1-32x32.png">
    <link rel="stylesheet" href="css/bootstrap-rtl.min.css"/>
    <link rel="stylesheet" href="css/droid-arabic-kufi.css"/>
    <link rel="stylesheet" href="css/all.min.css"/>
    <link rel="stylesheet" href="css/daterangepicker.css"/>
    <link rel="stylesheet" href="css/nav.css"/>
    <link rel="stylesheet" href="css/toastr.css"/>
    <link rel="stylesheet" href="css/custom.css"/>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container-fluid mt-4 pt-5">
    <div class="row">
        <nav class="col-2 d-none d-block bg-light sidebar sidebar-sticky no-print">
            <div class="nav flex-column mt-4 nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <%
                    if (user.getRole().getId() == weightUser.getId()) {
                %>
                <a class="nav-link" id="demo" data-toggle="pill" role="tab" aria-selected="false">وزنة أولى</a>
                <a class="nav-link" id="demo2" data-toggle="pill" role="tab" aria-selected="false">وزنة ثانية</a>
                <a class="nav-link" id="tax" data-toggle="pill" role="tab" aria-selected="false">غرامة سلامة وصحة مهنية</a>
                <%
                } else if (user.getRole().getId() == manager.getId()) {
                %>
                <a class="nav-link" id="create_user" data-toggle="pill" role="tab" aria-selected="false">انشاء حساب</a>
                <a class="nav-link" id="create_client" data-toggle="pill" role="tab" aria-selected="false">انشاء عميل</a>
                <%--<a class="nav-link" id="create_ship" data-toggle="pill" role="tab" aria-selected="false">انشاء مركب</a>--%>
                <a class="nav-link" id="create_goods" data-toggle="pill" role="tab" aria-selected="false">انشاء بضاعة</a>
                <a class="nav-link" id="opening_balance" data-toggle="pill" role="tab" aria-selected="false">الرصيد الافتتاحى</a>
                <a class="nav-link" id="client_balance_report" data-toggle="pill" role="tab" aria-selected="false">تقرير أرصدة عملاء</a>
                <%
                }
                %>
                <a class="nav-link" id="vehicle_report" data-toggle="pill" role="tab" aria-selected="false">تقرير السيارات</a>
                <a class="nav-link" id="amount_report" data-toggle="pill" role="tab" aria-selected="false">تقرير الكميات</a>
            </div>
            <%--
            <div class="sidebar-sticky mt-4">


                <ul class="nav nav-pills flex-column">
                    <%
                        if (user.getRole().getId() == weightUser.getId()) {
                    %>

                    <li class="nav-item">
                        <a class="nav-link link text-center" id="demo"><i
                                class="fas fa-angle-double-left"></i>
                            وزنة أولى</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link text-center" id="demo2"><i
                                class="fas fa-angle-double-left"></i> وزنة ثانية</a>
                    </li>
                    <%
                    } else if (user.getRole().getId() == manager.getId()) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link link text-center" id="create_user"><i
                                class="fas fa-angle-double-left"></i>
                            انشاء حساب </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link text-center" id="create_client"><i
                                class="fas fa-angle-double-left"></i> انشاء عميل</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link text-center" id="create_ship"><i
                                class="fas fa-angle-double-left"></i> انشاء مركب</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link text-center" id="create_goods"><i
                                class="fas fa-angle-double-left"></i> انشاء بضاعة</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link text-center" id="client_balance_report"><i
                                class="fas fa-angle-double-left"></i> تقرير أرصدة عملاء </a>
                    </li>
                    <%
                        }
                    %>
                    <li class="nav-item">
                        <a class="nav-link link text-center" id="vehicle"><i
                                class="fas fa-angle-double-left"></i> تقرير السيارات </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link text-center" id="amount_report"><i
                                class="fas fa-angle-double-left"></i> تقرير الكميات </a>
                    </li>
                </ul>
            </div>--%>
        </nav>
        <div class="col-10">
            <div id="content_place" class="mx-3 no-margin-print">

            </div>
        </div>
    </div>
</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootbox.all.min.js"></script>
<script src="js/enable_disable_elements.js"></script>
<script src="js/print_div.js"></script>
<script src="js/weight_card.js"></script>
<script src="js/sortTable.js"></script>
<script src="js/filterTable.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/daterangepicker.js"></script>
<script src="js/toastr.min.js"></script>
<script src="js/toastr_functions.js"></script>
<script src="js/d3.min.js"></script>
<script type="text/javascript" src="js/Google_Charts_loader.js"></script>
<script type="text/javascript" src="js/Google_Charts.js"></script>
<script src="js/dashboard.js"></script>


</body>
</html>

