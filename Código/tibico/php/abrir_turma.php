<!DOCTYPE html>

<?php 
	include("conexao.php");
?>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title></title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../css/index.css">
	</head>

	<body class="container-fluid background">
		<div>
			<p style="font-size: 30px; text-align: center; color: white; margin-top: 20px">Abertura de Turmas</p>
		</div>

		<form action="cadastrar_turma.php" method="GET" id="form">
			<div class="row" style="margin-top: 5%">

				<div class="col-sm-3">
					
					<label for="disciplina">Disciplina: </label>
					<select name="disciplina" id="disciplina" class="form-control">
						<?php
							$result = mysql_query("SELECT * FROM disciplina");
							
							while($consulta = mysql_fetch_array($result)){
								echo "<option value='". $consulta['disciplina_id']. "'>".$consulta['nome']."</option>";
							}
						?>				
					</select>

				</div>

				<div class="col-sm-3">
					
					<label for="professor">Professor: </label>
					<select name="professor" id="professor" class="form-control">
						<?php
							$result = mysql_query("SELECT * FROM professor");
							
							while($consulta = mysql_fetch_array($result)){	
								echo "<option value='". $consulta['professor_id']. "'>".$consulta['nome']."</option>";
							}
						?>				
					</select>
				</div>

				<div class="col-sm-3">
					<label for="calendario">Calendario: </label>
					<select name="calendario" id="calendario" class="form-control">
						<?php
							$result = mysql_query("SELECT * FROM calendario");
							
							while($consulta = mysql_fetch_array($result)){
								echo "<option value='". $consulta['calendario_id']. "'>".$consulta['dataInicioPL']."</option>";
							}
						?>				
					</select>
				</div>

				<div class="col-sm-3">
					<label for="vagas">Número de Vagas: </label>
					<input type="number" name="vagas" id="vagas" class="form-control">
				</div>
			</div>

			<div class="row">
				<div class="col-sm-12" style="text-align: center">
					<button type="submit" class="btn btn-success" style="margin-top: 24px">Confirmar</button>
					<!-- <a href="formchamada.php" class="btn btn-warning" role="button" style="width: 300px; height: 40px">Chamada</a> -->
				</div>				
			</div>		
		</form>

	</body>
</html>