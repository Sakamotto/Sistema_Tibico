<!DOCTYPE html>

<?php 
	include("conexao.php");
?>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">

		<title>Cadastro de Avaliação</title>

		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../css/index.css">
	</head>

	<body class="background">

	<div class="container" style="margin-top: 30px; width: 500px">

			<h1 style="text-align:center">Cadastro de Avaliação</h1>

			<br><br>

			<form action="cadastrar_avaliacao.php" method="post">
				<div class="form-group">
					<label for="turma" style="width:50%;float:left">Turma:</label></div>
					<select name="turma" class="form-control" style="width:50%;float:right">
						<?php
							$result = mysql_query("SELECT * FROM disciplina INNER JOIN turma ON(disciplina.disciplina_id = turma.disciplina_id)");
							
							while($consulta = mysql_fetch_array($result)){				
								echo "<option value='". $consulta['turma_id']. "'>".$consulta['nome']."</option></div>";
							}
						?>
					</select>

					<br><br>

					<label for="peso" style="width:50%;float:left">Peso:</label>
					<input type="text" name="peso" id="peso" style="width:50%;float:right">

					<br><br>

					<label for="nome" style="width:50%;float:left">Nome da avaliação:</label>
					<input type="text" name="nome" id="nome" style="width:50%;float:right">

					<br><br>

					<input type="submit" class="btn btn-success" value="Salvar" style="float:right">	
				</div>
				
			</form>
		</div>

	

		
	</body>
</html>