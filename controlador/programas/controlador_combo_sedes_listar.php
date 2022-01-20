<?php 
 include '../../modelo/modelo_programas.php';

 $accion = "";

 if(isset($_POST['accion'])){
    $accion = $_POST['accion'];
 }

 switch ($accion) {
   case "sedesProfesor":
      $MR = new Modelo_Programas();
        $consulta =$MR->listar_combo_sedes_profesor($_POST['idUsuario']);
        echo json_encode($consulta);
      break;
      default:

         $MR = new Modelo_Programas();
        $consulta =$MR->listar_combo_sedes();
        echo json_encode($consulta);
      break;

     
     
 }

//echo json_encode($consulta);




 ?>