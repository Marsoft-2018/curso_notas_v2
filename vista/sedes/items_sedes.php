<?php

foreach ($objSedes->listar_sedes_corporacion() as $sede) { 
    ?>
    <button class="btn btn-primary" onclick="cargarSedes('<?php  echo $sede['sede_id'];?>')">
        Ver: <?php echo $sede['sede_nombre']; ?>
    </button>   
<?php 
}

?>