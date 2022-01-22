<?php 
class Modelo_Consultas {
		private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}

	 function Consultar_Notas_Estudiante($idusuario) {
	 		$sql = "SELECT	CONCAT(e.`nombres`,' ',e.`apellidos`)
AS nombre, p.`nombre_programa`, a.`nombre_modulo`,ROUND(AVG(c.`nota`),1) AS definitiva

FROM estudiantes e 

INNER JOIN matriculas m ON m.`documento` = e.`documento`  
INNER JOIN programa p ON p.`programa_id` = m.`idprograma`
INNER JOIN calificaciones c ON c.`idMatricula` = m.`id`
INNER JOIN asignaturas a ON a.`id` = c.`idasignatura`
WHERE e.`idusuario` = '$idusuario'
GROUP BY a.`id`";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
 		}
}