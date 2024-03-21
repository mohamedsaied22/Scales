<%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 2/17/2019
  Time: 9:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<input type="hidden" id="startDate" name="startDate"/>
<input type="hidden" id="endDate" name="endDate"/>
<input type="hidden" id="startTime" name="startTime"/>
<input type="hidden" id="endTime" name="endTime"/>
<div class="row mt-2 mx-auto">

    <div class="col-2 px-auto py-2">
        <label>الفترة: </label>
    </div>
    <div class="col-10">
        <div id="reportrange"
             style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
            <i class="fa fa-calendar"></i>&nbsp;
            <span></span> <i class="fa fa-caret-down"></i>
        </div>
    </div>

</div>
