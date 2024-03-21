<%--
  Created by IntelliJ IDEA.
  User: mustafa
  Date: 2/3/2019
  Time: 7:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    System.out.println();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>طباعة</title>
    <link rel="stylesheet" href="css/bootstrap-rtl.min.css"/>
    <link rel="stylesheet" href="css/droid-arabic-kufi.css"/>
    <link rel="stylesheet" href="css/all.min.css"/>
    <link rel="stylesheet" href="css/custom.css"/>
</head>
<body>
<jsp:include page='weight_card.jsp?n=<%=request.getParameter("n")%>'/>
</body>
</html>
