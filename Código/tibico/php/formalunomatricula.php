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
		<link rel="stylesheet" href="css/index.css">

		
	</head>

	<body class="background">

	<div class="container" style="margin-top: 30px">
		<h1 style="width:50%;text-align:center">Matrícula de aluno</h1>

		<br><br>

		<form action="php/aluno_turma.php" method="post">
			<div class="form-group" style="width:50%">
				<label for="aluno" style='width:50%;float:left'>Aluno</label>
				<select name="aluno" class="form-control" style='width:50%;float:right'>
					<?php
						$result = mysql_query("SELECT * FROM aluno");
						
						while($consulta = mysql_fetch_array($result)){		
							echo "<option value='". $consulta['aluno_id']. "'>".$consulta['nome']."</option>";
						}
					?>
				</select>
				<br>
				<br>
				<br>
				<label for="turma" style='width:50%;float:left'>Turma</label>
				<select name="turma" class="form-control" style='width:50%;float:right'>
					<?php
						$result = mysql_query("SELECT * FROM disciplina INNER JOIN turma ON(disciplina.disciplina_id = turma.disciplina_id)");
						
						while($consulta = mysql_fetch_array($result)){				
							echo "<option value='". $consulta['turma_id']. "'>".$consulta['nome']."</option>";
						}
					?>
				</select>

				<br>
				<br>
				<br>

				<input type="submit" class="btn btn-success" value="Salvar" style="float:right">

			</div>
			
		</form>
	</div>
	</body>
</html>