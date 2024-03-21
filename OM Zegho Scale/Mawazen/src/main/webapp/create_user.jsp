<%@ page import="helpers.HibernateHelper" %>
<%@ page import="java.util.List" %>
<%@ page import="elements.Role" %><%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 1/24/2019
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HibernateHelper hibernateHelper = new HibernateHelper(request, response);
    List<Role> roles = hibernateHelper.retreiveData("from Role");
%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="page_header.jsp">
    <jsp:param name="title" value="انشاء حساب"/>
</jsp:include>
<form method="post" class="needs-validation mx-3" novalidate>

    <div class="row mt-2">
        <div class="col-1 px-0 py-2">
            <label>الاسم: </label>
        </div>
        <div class="col-5">
            <input type="text" class="form-control" id="name" name="name" placeholder="ادخل الاسم"
                   required>
            <div class="invalid-feedback mb-1">
                لابد من ادخال الاسم
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-1 px-0 py-2">
            <label> الحساب: </label>
        </div>
        <div class="col-5">
            <input type="text" class="form-control" id="username" name="username" placeholder="ادخل اسم الحساب"
                   required>
            <div class="invalid-feedback mb-1">
                لابد من ادخال اسم المستخدم
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-1 px-0 py-2">
            <label>كلمة المرور: </label>
        </div>
        <div class="col-5">
            <input type="password" class="form-control" id="password" name="password" placeholder="ادخل كلمة المرور"
                   required>
            <div class="invalid-feedback mb-1">
                لابد من ادخال كلمة المرور
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-1 px-0 py-2">
            <label>الوظيفة:</label>
        </div>
        <div class="col-5">
            <select class="form-control" id="role" name="role" required>
                <option value="" selected disabled hidden>اختار الوظيفة</option>
                <%
                    for (Role role : roles) {
                %>
                <option value="<%=role.getId()%>"><%=role.getRole()%>
                </option>
                <%
                    }
                %>

            </select>
            <div class="invalid-feedback mb-1">
                لابد من اختيار الوظيفة
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-1 offset-2">
            <button id="new_user_submit" type="button" class="btn btn-success">حـــفـــظ</button>
        </div>
        <div class="col-1">
            <button type="reset" class="btn btn-primary">مـــســـح</button>
        </div>
    </div>


</form>
