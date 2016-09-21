<!DOCTYPE html>

<?php 
	include("conexao.php");
?>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../css/index.css">
	</head>

	<body class="background">



		<div class="container" style="margin-top: 15%; width: 400px">

			<h3 style="text-align:center">Bem vindo ao Gerenciamento de Turmas</h3>

			<br>

			<a href="abrir_turma.php" class="btn btn-info" role="button" style="margin-bottom:5px;width:100%; height: 40px;">Abrir Turma</a>
			
			<br>
			
			<a href="formchamada_escolherturma.php" class="btn btn-warning" role="button" style="width: 100%;margin-bottom:5px;height: 40px">Realizar Chamada</a>

			<br>

			<a href="formavaliacao.php" class="btn btn-success" role="button" style="width: 100%;margin-bottom:5px;height: 40px"> Cadastrar Avaliação</a>
		</div>
	</body>
</html>