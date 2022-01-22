<?php 
 include '../../modelo/modelo_consultas.php';

 $MR = new Modelo_Consultas();
  $idusuario = htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8');
  
 $consulta =$MR->Consultar_Notas_Estudiante($idusuario);
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