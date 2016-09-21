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

			<h3 style="text-align:center">
				<?php



					$turma_id = $_POST['turma'];

					// Criação de cookie com o id da turma.

					setcookie("turma_id", $turma_id);

					$consulta_disciplina = mysql_query("
						SELECT disciplina.nome
						FROM turma 
						INNER JOIN disciplina 
						ON turma.disciplina_id = disciplina.disciplina_id 
						WHERE turma.turma_id = '$turma_id'"
					);

					$nome_disciplina = mysql_fetch_assoc($consulta_disciplina)['nome'];

					echo "Chamada de ".$nome_disciplina;
				?>
			</h3>

			<br><br>

			<form action="aula_frequencia.php" method="post">
				<div class="form-group">
					<label name="turma" id="turma"></label>
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
						$turma_id = $_POST['turma'];
						$result = mysql_query("SELECT * FROM aluno INNER JOIN aluno_turma ON aluno.aluno_id = aluno_turma.aluno_id WHERE aluno_turma.turma_id = '$turma_id'");

						
						
						
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