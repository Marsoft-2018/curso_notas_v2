<?php 
 include '../../modelo/modelo_jornadas.php';

 $MR = new Modelo_Jornadas();
 $consulta =$MR->listar_jornadas();
if($consulta) {
	echo json_encode($consulta);
} else {
	echo '{
		"sEcho":1,
		"iTotalRecords":"0",
		"iTotalDisplayRecords":"0",
		"aaData":[]
	}';
}


 ?>