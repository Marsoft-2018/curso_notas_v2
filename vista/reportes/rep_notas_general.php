
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@600&family=Montserrat:wght@600;700&family=Quicksand:wght@500&display=swap" rel="stylesheet">
    <style>
        *{
            font-family: 'Dosis', sans-serif;
            font-family: 'Montserrat', sans-serif;
            font-family: 'Quicksand', sans-serif;
        }
        table{
            border-collapse: collapse;
            width: 100%;
        }

        table th, td{
            border: 1px solid #000;
        }
        header{
            display: flex;
            justify-content: flex-start;
            margin-bottom: 20px;

        }
        header .membrete{
            flex-grow: 1;
            width: 10%;
            display:flex;
        }
        .membrete img{
            width: 70px;
        }
        header .membrete p{
            font-size: 0.5em;
            text-align: justify;

        }

        header .encabezado{
            flex-grow: 3;
        }

        header .encabezado h1, h2, h3{
            margin: 0px;
            padding: 1px;
            padding-left: 20px;
        }
        .datos{
            display: flex;
            justify-content: space-between;
        }
        .datos span{
            text-transform: uppercase;
        }
    </style>
</head>
<body>
    <?php
        include '../../modelo/modelo_calificacion.php';
        include '../../modelo/modelo_programas.php';
        include '../../modelo/modelo_asignaturas.php';
        $programa = "ENfermería";
        $semestre = "1";
        $jornada = "Mañana";
    ?>
    <header>
        <div class="membrete">
            <img src="../../plantilla/dist/img/escudo.jpg" alt="">
            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Perferendis dignissimos at magni quibusdam doloribus cum, doloremque </p>
        </div>
        <div class="encabezado">
            <h2>REPORTE GENERAL DE CALIFICACIONES</h2>
            <div class="datos">
                <h3>Programa: <span><?php echo $programa ?></span></h3>
                <h3>Semetre: <span><?php echo $semestre ?></span></h3>
                <h3>Jornada: <span><?php echo $jornada ?></span></h3>
            </div>
        </div>
        
        
    </header>
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
                </tr>            
            <?php
                }
            ?>
        </tbody>
    </table>
</body>
</html>