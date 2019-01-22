<%@ page import ="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css" integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <h2>
            Person Create
        </h2>

        <form method="post" action="<%=request.getContextPath()%>/person/create" class="form-horizontal">
            <div class="form-group form-group-lg">
                <label for="name" class="col-sm-2 control-label">Name:</label>
                <div class="col-sm-10">
                    <input type="text" name="name" class="form-control" >
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="age" class="col-sm-2 control-label">Age:</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="age" value="${person.age}" >
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="city" class="col-sm-2 control-label">City:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="city" value="${person.city}" >
                </div>
            </div>
            <div style="float:right">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>

    </div>
</body>
</html>