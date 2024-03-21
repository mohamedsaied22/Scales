<%@ page import="helpers.HibernateHelper" %>
<%@ page import="elements.User" %><%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 1/5/2019
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) request.getSession().getAttribute("user");
%>
<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-dark no-print" dir="">


    <img src="photos/New%20Logo/sescotrans_logo.png" height="59" alt="" class="mr-3">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="form-inline mr-auto my-2 my-lg-0">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item text-white mr-2 table-style"><i class="fas fa-2x fa-user-tie"></i> <span
                    class="my-auto table-cell-style pr-2 font-weight-bold"><%=user.getName()%></span></li>
        </ul>

    </div>
    <div class="dropdown ml-2 mr-auto">
        <button
                class="btn btn-outline-primary dropdown-toggle my-2 my-sm-0 mr-2"
                id="dropdownSettingsButton" type="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
            الإعدادات
        </button>
        <div class="dropdown-menu dropdown-menu-right"
             aria-labelledby="dropdownSettingsButton">
            <h6 class="dropdown-header">
                الإعدادات
            </h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item link_" data-toggle="modal"
               data-target="#change_password_modal">تغيير كلمة المرور</a>
        </div>
    </div>
    <form class="form-inline my-2 my-lg-0" action="Controller" method="post">
        <input type="hidden" name="n" value="2">
        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">تسجيل الخروج</button>
    </form>
    <%--<div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>--%>
</nav>

<!-- Modal Change Password -->
<div class="modal fade" id="change_password_modal" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">تغيير كلمة المرور</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="change_password_form" class="needs-validation" novalidate>
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="current_password"
                               class="col-xl-4 text-center col-form-label">كلمة المرور الحالية:</label>
                        <div class="col-xl-8">
                            <input type="password" class="form-control" id="current_password"
                                   name="current_password" placeholder="كلمة المرور الحالية" required>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="new_password"
                               class="col-xl-4 text-center px-0 col-form-label">كلمة المرور الجديدة:</label>
                        <div class="col-xl-8">
                            <input type="password" class="form-control" id="new_password"
                                   name="new_password" placeholder="كلمة المرور الجديدة" required>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="re_new_password"
                               class="col-xl-4 text-center px-0 col-form-label">كلمة المرور الجديدة:</label>
                        <div class="col-xl-8">
                            <input type="password" class="form-control" id="re_new_password"
                                   name="re_new_password" placeholder="كلمة المرور الجديدة" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-primary"
                            id="change_password_button"
                            onclick="changePassword();">حفظ</button>
                    <button type="button" class="btn btn-secondary mx-2"
                            data-dismiss="modal">إلغاء</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End of Modal -->