<!DOCTYPE html>

<?php 
	header("Content-type: text/html; charset=utf-8");

	$conecta = mysql_connect("localhost", "root", "root");
	mysql_select_db("tibico", $conecta);
	mysql_set_charset("utf8");
	
	if($conecta == true){
		//print("Conexão Okay!". "<br>");
	}else{
		print("Erro ao conectar ". mysql_error());
	}
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
		<form action="php/aluno_turma.php" method="post">
			<div class="form-group">
				<label for="aluno">Aluno</label>
				<select name="aluno" class="form-control">
					<?php
						$result = mysql_query("SELECT * FROM aluno");
						
						while($consulta = mysql_fetch_array($result)){		
							echo "<option value='". $consulta['aluno_id']. "'>".$consulta['nome']."</option>";
						}
					?>
				</select>
				<br>
				<label for="turma">Turma</label>
				<select name="turma" class="form-control">
					<?php
						$result = mysql_query("SELECT * FROM disciplina INNER JOIN turma ON(disciplina.disciplina_id = turma.disciplina_id)");
						
						while($consulta = mysql_fetch_array($result)){				
							echo "<option value='". $consulta['turma_id']. "'>".$consulta['nome']."</option>";
						}
					?>
				</select>
			</div>
			<input type="submit" class="btn btn-success" value="Salvar">
		</form>
	</div>
	</body>
</html>