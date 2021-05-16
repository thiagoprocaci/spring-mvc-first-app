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
        <h2>
            Cadastrar Pessoa
        </h2>
        <br><br>
        <h3>
        ${mensagem}
        </h3>
        <br><br>
        <form method="post" action="<%=request.getContextPath()%>/pessoa/cadastrar" class="form-horizontal">
            <div class="form-group form-group-lg">
                <label for="nome" class="col-sm-2 control-label">Nome:</label>
                <div class="col-sm-10">
                    <input type="text" name="nome" class="form-control" id="nome">
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="cidadePessoa" class="col-sm-2 control-label">Cidade:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="cidadePessoa" id="cidadePessoa"  >
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="dataNascimento" class="col-sm-2 control-label">Data Nascimento:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="dataNascimento" id="dataNascimento">
                </div>
            </div>
            <div style="float:right">
                <button type="submit" class="btn btn-primary">Salvar</button>
            </div>
        </form>

    </div>


    <!-- Latest compiled and minified JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>
</body>
</html>