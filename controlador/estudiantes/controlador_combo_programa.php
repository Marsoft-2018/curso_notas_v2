<?php 
 include '../../modelo/modelo_estudiantes.php';

 $accion = "";

 if(isset($_POST['accion'])){
    $accion = $_POST['accion'];
 }

 switch ($accion) {
   case "programasProfesor":
        $MR = new Modelo_Estudiantes();
        $idsede  = $_POST['idsede'];
        $idusuario  = $_POST['idusuario'];
        $consulta =$MR->listar_combo_programa_profe($idsede,$idusuario);
        echo json_encode($consulta);
      break;
      default:
        $MR = new Modelo_Estudiantes();
        $idsede  = $_POST['idsede'];
        $consulta =$MR->listar_combo_programa($idsede);
        echo json_encode($consulta);
      break;

     
     
 }


 ?>