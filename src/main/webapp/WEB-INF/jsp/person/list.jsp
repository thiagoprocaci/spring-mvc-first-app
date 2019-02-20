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
        Person List
    </h1>


    <table>
     <tr>
        <th>
            Edit
        </th>
        <th>
            Name
        </th>
        <th>
            Age
        </th>
        <th>
            City
        </th>
        <th>
            Skills Amount
        </th>
      </tr>
      <c:forEach var="person" items="${personList}">
       <tr>
            <td>
                <a href="<%=request.getContextPath()%>/person/edit?name=${person.name}">Edit</a>
            </td>
            <td>
                <c:if test="${fn:length(person.skills) gt 0}">
                    <font color="red"><c:out value="${person.name}" /></font>
                </c:if>
                 <c:if test="${fn:length(person.skills) eq 0}">
                    <c:out value="${person.name}" />
                </c:if>
            </td>
            <td>
                <c:out value="${person.age}" />
            </td>
            <td>
                <c:out value="${person.city}" />
            </td>
            <td>
                 ${fn:length(person.skills)}

            </td>
        </tr>
      </c:forEach>
     </table>


      <a href="<%=request.getContextPath()%>/person/create">Add Person</a>
</center>
</body>
</html>