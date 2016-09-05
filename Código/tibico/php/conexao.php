<?php
	header("Content-type: text/html; charset=utf-8");

	$conecta = mysql_connect("localhost", "root", "");
	mysql_select_db("teste", $conecta);
	mysql_set_charset("utf8");
	
	if($conecta == true){
		print("Conexão Okay!". "<br>");
	}else{
		print("Erro ao conectar ". mysql_error());
	}

	$result = mysql_query("SELECT descricao FROM areaconhecimento");
	while($consulta = mysql_fetch_array($result)){
		print("Descrição: ". $consulta["descricao"]. "<br>");
	}
	mysql_free_result($result);



	mysql_close($conecta);
?>