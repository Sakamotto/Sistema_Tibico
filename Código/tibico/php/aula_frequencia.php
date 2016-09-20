<?php 
	include 'conexao.php';


	$turma_id = $_POST['turma'];
	$data = $_POST['data'];
	$quantidade_aulas = $_POST['quantidadeAulas'];
	$conteudoaula = $_POST['conteudoaula'];



	// echo "$aluno_id, $turma_id";

	
	$result = mysql_query("INSERT INTO aula (data, quantidadeaulas, conteudo) VALUES('$data', '$quantidade_aulas', '$conteudoaula')") or die(mysql_error());

	// echo "SELECT * FROM tibico.aula";

	$result = mysql_query("SELECT * FROM aula WHERE data='$data'") or die(mysql_error());

	$row = mysql_fetch_assoc($result);
	$id_aula = $row["aula_id"];

	foreach ($_POST as $key => $value) {
		if(preg_match("/aluno_[0-9]*/", $key)) {
			$aluno_id = substr($key, 6);
			$aluno_falta = $quantidade_aulas - $value;

			mysql_query("INSERT INTO frequencia (numfaltas, aluno_id, aula_id) VALUES('$aluno_falta', '$aluno_id', '$id_aula')") or die(mysql_error());

		}
	}

	//header("location:../pagematricula.php");

	echo "<div class='alert alert-success'>	<strong>Successo!</strong> Chamada realizada com sucesso.</div>";

?>