<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<center>
    <h1>
        Person Create
    </h1>

    <form method="post" action="<%=request.getContextPath()%>/person/create">
        Name:

        <input type="text" name="name"  >
        <br><br>
        Age:
        <input type="number" name="age" >
        <br><br>
        City:
        <input type="text" name="city"  >
        <br><br>
        Skills: <br>
        <select name="skillList" multiple>
            <c:forEach var="skill" items="${skills}">
                <option value="${skill}">${skill}</option>
           </c:forEach>
        </select>
        <br><br>

        <input type="submit" value="Save" />
    </form>

</center>
</body>
</html>