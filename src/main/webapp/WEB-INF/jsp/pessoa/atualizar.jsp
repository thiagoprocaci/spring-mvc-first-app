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

</head>
<body>
    <div class="container">
        <h3>
            <c:out value="${pessoa.nome}" />
        </h3>

        <form method="post" action="<%=request.getContextPath()%>/pessoa/atualizar" class="form-horizontal">
            <div class="form-group">
                    <label for="vacinado">Vacinado:</label>
                   <select class="form-control" name="vacinado" style="width:400px">
                          <c:if test="${pessoa.vacinado}">
                              <option value="S" selected>Sim</option>
                              <option value="N">Não</option>
                          </c:if>
                          <c:if test="${not pessoa.vacinado}">
                              <option value="S" >Sim</option>
                              <option value="N" selected>Não</option>
                          </c:if>
                      </select>
                 </div>
            </div>
            <input type="hidden" name="id" value="${pessoa.id}">

            <button type="submit" class="btn btn-primary" style="margin-left:300px">Salvar</button>

        </form>

    </div>


    <!-- Latest compiled and minified JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>
</body>
</html>