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

	<div class="container" style="margin-top: 30px; width: 500px">

		<h1 style="text-align:center">Chamada</h1>

		<br><br>

		<form action="aula_frequencia.php" method="post">
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

				<label for="data" style="width:50%;float:left">Data:</label>
				<input type="date" name="data" id="data" max="3000-12-31" style="width:50%;float:right"><br><br>

				<label for="aula" style="width:50%;float:left">Quantidade de Aulas:</label>
				<select name="quantidadeAulas" class="form-control" style="width:50%;float:right">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select>

				<br><br>

				<label for="conteudo" style="width:50%;float:left">Conteúdo:</label>
				<input type="text" name="conteudoaula" style="width:50%;float:right">

				<br><br>

				<label for="alunos">Alunos e número de presenças:</label><br>
				<?php
					$result = mysql_query("SELECT * FROM aluno");
					
					while($consulta = mysql_fetch_array($result)){
						echo "<label for='alunos' style='width:50%;float:left'>".$consulta['nome']."</label>".
						"<input type='text' name='aluno_".$consulta['aluno_id']." style='width:50%;float:right''/><br>";
					}
				?>
				<br>
				<input type="submit" class="btn btn-success" value="Salvar" style="float:right">	
			</div>
			
		</form>
	</div>
	</body>
</html>