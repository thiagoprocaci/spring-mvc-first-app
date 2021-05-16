<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css" integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR" crossorigin="anonymous">


</head>
<body>
<div class="container">
    <h2>
        Lista de Pessoas para Vacinação
    </h2>


    <table class="table table-striped">
     <tr>
        <th>
            Ação
        </th>
        <th>
            Nome
        </th>
        <th>
            Idade
        </th>
        <th>
            Cidade
        </th>
      </tr>
      <c:forEach var="pessoa" items="${pessoaList}">
       <tr>
            <td>
                <a href="<%=request.getContextPath()%>/pessoa/atualizar?id=${pessoa.id}">Atualizar</a>
            </td>
            <td>
                <c:out value="${pessoa.nome}" />
            </td>
            <td>
                <c:out value="${pessoa.idade}" />
            </td>
            <td>
                <c:out value="${pessoa.cidade}" />
            </td>
        </tr>
      </c:forEach>
     </table>


      <a href="<%=request.getContextPath()%>/pessoa/cadastrar">Cadastrar Pessoa</a>

      <!-- Latest compiled and minified JavaScript -->
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>
 </div>
</body>
</html>