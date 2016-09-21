<?php 
	include("conexao.php");

	$turma_id = $_POST['turma'];
	$peso = $_POST['peso'];
	$nome = $_POST['nome'];
	
	$query = "INSERT INTO avaliacao(nome, peso, turma_id)
			  VALUES('$nome', '$peso', '$turma_id')";

	mysql_query($query) or die(mysql_error()."Deu erro!");

	header("location: formavaliacao.php");

?>