<?php 
require ('../../modelo/modelo_conexion.php');
 $accion = "";
    if(isset($_REQUEST['accion'])){
        $accion = $_REQUEST['accion'];
    }

    switch ($accion) {
        case 'listar':
            $objSedes = new Modelo_Sedes();
            include("../../vista/sedes/items_sedes.php");
            break;
        case 'cargar':
            echo "Estamos en la accion de cargar categorias";
            break;
        case 'nuevo': case "editar":
            echo "Estamos en la accion de $accion categorias";
            break;
        case 'guardar':
            echo "Estamos en la accion de guardar categorias";
            break;
        case 'eliminar':
            echo "Estamos en la accion de eliminar categorias";
            break;
        case 'otra':
            echo "Estamos en la accion de otra categorias";
            break;
        default:
            # code...
            break;
            }
 ?>