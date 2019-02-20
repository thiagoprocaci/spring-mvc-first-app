<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
 <center>
    <h1>
        Person Edit
    </h1>

    <form method="post" action="<%=request.getContextPath()%>/person/update">
        Name:
        <c:out value="${person.name}" />
        <input type="hidden" name="name" value="${person.name}" >
        <br><br>
        Age:
        <input type="number" name="age" value="${person.age}" >
        <br><br>
        City:
        <input type="text" name="city" value="${person.city}" >
        <br><br>
        Skills: <br>
        <select name="skillList" multiple>
            <c:forEach var="skill" items="${skills}">
                 <c:if test="${fn:contains(person.skills, skill)}">
                    <option value="${skill}" selected>${skill}</option>
                </c:if>
                 <c:if test="${not fn:contains(person.skills, skill)}">
                    <option value="${skill}" >${skill}</option>
                </c:if>
           </c:forEach>
        </select>

                <br><br>
        <input type="submit" value="Save" />
    </form>

    <br><br>

    <form method="post" action="<%=request.getContextPath()%>/person/delete">
      <input type="hidden" name="name" value="${person.name}" >
      <input type="submit" value="Delete" />
    </form>

</center>
</body>
</html>