<?php 
	include 'conexao.php';

	$aluno_id = $_POST['aluno'];
	$turma_id = $_POST['turma'];

	// echo "$aluno_id, $turma_id";

	echo "INSERT INTO aluno_turma (aluno_id, turma_id) VALUES($aluno_id, $turma_id)";
	$result = mysql_query("INSERT INTO aluno_turma (aluno_id, turma_id) VALUES($aluno_id, $turma_id)") or die(mysql_error());
	header("location:../pagematricula.php");

	echo "<div class='alert alert-success'>	<strong>Successo!</strong> Aluno cadastrado na turma com sucesso.</div>";

?>