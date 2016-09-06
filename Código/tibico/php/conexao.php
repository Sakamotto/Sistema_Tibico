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

	$result = mysql_query("INSERT INTO aluno_turma (aluno_id, turma_id) VALUES (".$_POST['alunonome'].", ".$_POST['turma'].");");
	//while($consulta = mysql_fetch_array($result)){
	//	print("Descrição: ". $consulta["turma_id"]. "<br>");
	//}
	mysql_free_result($result);

	mysql_close($conecta);


?>