<?php 
	include("conexao.php");

	$professor_id = $_REQUEST['professor'];
	$calendario_id = $_REQUEST['calendario'];
	$disciplina_id = $_REQUEST['disciplina'];
	$numVagas = $_REQUEST['vagas'];
	$situacao = 'Em andamento';

	$query = "INSERT INTO turma(professor_id, calendario_id, numVagas, situacao, disciplina_id) 
	VALUES($professor_id, $calendario_id, $numVagas, '$situacao', $disciplina_id)";
	mysql_query($query) or die(mysql_error()."Deu erro!");

	header("location: abrir_turma.php");

?>