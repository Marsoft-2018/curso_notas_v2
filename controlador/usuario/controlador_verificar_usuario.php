<?php 
session_start();

require '../../modelo/modelo_usuario.php';

$MU = new ModeloUsuario();

$usuario = htmlspecialchars($_POST['user'],ENT_QUOTES,'UTF-8');
$password = htmlspecialchars($_POST['pass'],ENT_QUOTES,'UTF-8');

$consulta =$MU->VerificarUsuario($usuario,$password);
$data =json_encode($consulta);

if(count($consulta)>0) {
	echo $data;
	// foreach ($data as $usuario) {
	// 	$_SESSION['S_IDUSUARIO']= $usuario['usuario_id'];
	// 	$_SESSION['S_USER']=$usuario['usuario_nombre'];
	// 	$_SESSION['S_ROL']=$usuario['rol_id'];
	// 	$_SESSION['nombreCompleto'] = $usuario['nombres']." ".$usuario['apellidos'];
	// 	$_SESSION['FOTO']= $usuario['usuario_imagen'];
	// }
} else {
	echo 0;
}



 ?>