<?php 
require '../../modelo/modelo_asignaturas.php';

$MR = new Modelo_Asignaturas();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$nombre_actual = htmlspecialchars($_POST['nombre_actual'],ENT_QUOTES,'UTF-8');
$nombre_nuevo = htmlspecialchars($_POST['nombre_nuevo'],ENT_QUOTES,'UTF-8');
$cantidad_horas = htmlspecialchars($_POST['cantidad_horas'],ENT_QUOTES,'UTF-8');
$creditos = htmlspecialchars($_POST['creditos'],ENT_QUOTES,'UTF-8');
$consulta =$MR->Modificar_Asignatura($id,$nombre_actual,$nombre_nuevo,$cantidad_horas,$creditos);
echo $consulta;





 ?>