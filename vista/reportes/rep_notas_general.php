
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table{
            border-collapse: collapse;
            width: 100%;
        }

        table td{
            border: 1px solid #000;
        }
    </style>
</head>
<body>
    <?php
        //include '../../modelo/modelo_estudiantes.php';
        include '../../modelo/modelo_calificacion.php';
        include '../../modelo/modelo_programas.php';
        include '../../modelo/modelo_asignaturas.php';

    ?>

    <table>
        <thead>
            <tr>
                <th>estudiante</th>
                <?php
                    $objModulos = new Calificacion();
                    $objModulos->idPrograma = $_REQUEST['programa'];
                    $objModulos->idSemestre = $_REQUEST['semestre'];
                    $modulos = $objModulos->listarModulos();  
                     
                    foreach ($modulos as $value) { ?>
                        <th><?php echo $value['nombre_modulo']?></th>

                <?php
                     }
                ?>
                <th>Promedio</th>
                <th>Puesto</th>
            </tr>
        </thead>
        <tbody>
            <?php

                $obj = new Calificacion();
                $obj->idSede = $_REQUEST['sede'];
                $obj->idPrograma = $_REQUEST['programa'];
                $obj->idSemestre = $_REQUEST['semestre'];
                $obj->idJornada = $_REQUEST['jornada'];
                $consulta = $obj->listar_estudiantes();
                foreach ($consulta as $key => $estudiante) { 
                    $promedio = 0;
                    $suma = 0;
                    $cant = 0;
                    ?>
                <tr>
                    <td><?php echo $estudiante['apellidos'].' '.$estudiante['nombres'] ?></td>                    
                        <?php 
                            $objModulos = new Calificacion();
                            $objModulos->idPrograma = $_REQUEST['programa'];
                            $objModulos->idSemestre = $_REQUEST['semestre'];
                            $modulos = $objModulos->listarModulos();  
                             
                            foreach ($modulos as $modulo) { 
                                $objDef = new Calificacion();
                                $objDef->idMatricula = $estudiante['id'];
                                $objDef->idAsignatura = 1;
                                foreach($objDef->definitiva() as $d){
                                    if ($d['definitiva'] == null){
                                        echo "<td>-</td>";
                                    }else{
                                        $suma += $d['definitiva'];
                                        $cant++;
                                        echo "<td>".$d['definitiva']."</td>";
                                    }
                                }
                            }
                        ?>
                    <td><?php 
                        if($cant > 0){
                           echo $promedio = $suma/$cant;
                        }else{
                            echo "-";
                        }
                         ?></td>
                    <td></td>
                </tr>            
            <?php
                }
            ?>
        </tbody>
    </table>
</body>
</html>