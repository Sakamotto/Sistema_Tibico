<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title></title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/index.css">

		
	</head>

	<body class="background">

		<form action="php/conexao.php" method="post">
			Aluno:
			<input type="text" name="alunonome" value="aluno">
			<br>


			Turma: <select name="turma">

				<?php
					header("Content-type: text/html; charset=utf-8");

					$conecta = mysql_connect("localhost", "root", "");
					mysql_select_db("tibico", $conecta);
					mysql_set_charset("utf8");
					
					if($conecta == true){
						print("Conexão Okay!". "<br>");
					}else{
						print("Erro ao conectar ". mysql_error());
					}

					$result = mysql_query("SELECT * FROM turma INNER JOIN disciplina ON turma.disciplina_id = disciplina.disciplina_id");
					$i = 1;

					
							while($consulta = mysql_fetch_array($result)){
						
								echo "<option value='". $i . "'>".$consulta['nome']."</option>";
							//print("Descrição: ". $consulta["turma_id"]. "<br>");
						}
						
					mysql_free_result($result);

					mysql_close($conecta);
				?>

				</select>
			<br><br>
			<input type="submit">
		</form>
	</body>
</html>