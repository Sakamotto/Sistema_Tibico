<?php
	header("Content-type: text/html; charset=utf-8");

	$conecta = mysql_connect("localhost", "root", "root");
	mysql_select_db("tibico", $conecta);
	mysql_set_charset("utf8");
	
	if($conecta == false){
		print("Erro ao conectar ". mysql_error());
	}

	// $result = mysql_query("INSERT INTO aluno_turma (aluno_id, turma_id) VALUES (".$_POST['alunonome'].", ".$_POST['turma'].");");

	// mysql_free_result($result);

	// mysql_close($conecta);
?>