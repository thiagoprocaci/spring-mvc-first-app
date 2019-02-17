<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css" integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR" crossorigin="anonymous">

<body>
    <div class="container">

        <h2>
            Person Edit
        </h2>

        <form method="post" action="<%=request.getContextPath()%>/person/update" class="form-horizontal">
            <div class="form-group form-group-lg">
                <label for="name" class="col-sm-2 control-label">Name:</label>
                <div class="col-sm-10">
                    <p class="form-control-static"><c:out value="${person.name}" /></p>
                    <input type="hidden" name="name" value="${person.name}" id="name" >
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="age" class="col-sm-2 control-label">Age:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="age" value="${person.age}" id="age">
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="city" class="col-sm-2 control-label">City:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="city" value="${person.city}" id="city" >
                </div>
            </div>
            <div style="float:right">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>

        <br><br><br><br>

        <form method="post" action="<%=request.getContextPath()%>/person/delete">
          <div style="float:right">
            <input type="hidden" name="name" value="${person.name}" >
            <button type="submit" class="btn btn-danger">Delete</button>
          </div>
        </form>

    </div>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>
</head>
</body>
</html>