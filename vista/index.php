<?php 
session_start();

if(!isset($_SESSION['S_IDUSUARIO'])){
  header('location: ../Login/index.php');
}



 ?>



<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SISTEMA NOTAS</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../plantilla/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plantilla/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../plantilla/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../plantilla/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../plantilla/dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="../plantilla/bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="../plantilla/bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="../plantilla/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../plantilla/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="../plantilla/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <link rel="stylesheet" href="../plantilla/plugins/DataTables/datatables.min.css">
  <link rel="stylesheet" href="../plantilla/plugins/select2/select2.min.css">
  <link rel="stylesheet" href="../css/calificar.css">     
  

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

  <style type="text/css">
    .swal2-popup{
      font-size: 1.6rem !important;
    }
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index.php" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>APP</b>NOTAS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>NOTAS</b>APP</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
         


          
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img id="img_nav" class="user-image" alt="User Image">
              <span class="hidden-xs"><?php echo $_SESSION['S_USER']; ?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <p>
                  <?php echo $_SESSION['S_USER']; ?>
                </p>
                <img  id="img_subnav" class="img-circle" alt="User Image">

                
              </li>
              <!-- Menu Body -->
             
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat" onclick="AbrirModalEditarContra()">Cambiar Contraseña</a>
                </div>
                <div class="pull-right">
                  <a class="dropdown-item" href="../controlador/usuario/ctrl_cerrar_sesion.php" class="btn btn-default"><i class="fa fa-power-off">Salir</i></a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
    
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img id="img_lateral" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?php echo $_SESSION['S_USER']; ?></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
    
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
    
    </section>
    <!-- /.sidebar -->
     <?php 
        if($_SESSION['S_ROL']=='1') 
        {
            include '../include/menu_principal.php';
        } else if($_SESSION['S_ROL']=='2') 
        {
            include '../include/menu_docente.php';
        } else if($_SESSION['S_ROL']=='3') {
          include '../include/menu_estudiante.php';
        }

        ?>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  

    <!-- Main content -->
    <section class="content">
      <input type="text" id="txtidprincipal" value="<?php echo $_SESSION['S_IDUSUARIO'];?>" hidden>
      <input type="text" id="usuarioprincipal" value="<?php echo $_SESSION['S_USER'];?>" hidden>
      <div class="row" id="contenido_principal">
       <div class="col-md-12">
          <div class="box box-warning box-solid">
             
            <div class="box-header with-border">
              <h3 class="box-title">Contenido Principal</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              The body of the box
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
     </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1
    </div>
    <strong>Copyright &copy; 2022 <a href="">JSYSTEMAS</a>.</strong> DERECHOS RESERVADOS
  </footer>

  <!-- Control Sidebar -->

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<!--Modal edicar contraseña-->
    <div class="modal fade" id="modal_editar_contra" role="dialog">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Editar contraseña</h4>
            </div>
            <div class="modal-body">
              <div class="col-lg-12">
                <input type="" id="txtcontra_bd" hidden="">
                  <label for="contrasena">Contraseña actual:</label>
                  <input type="password" id="txtcontraactual_editar" name="" class="form-control" placeholder="Digite su clave actual"><br>
              </div>

                <div class="col-lg-12">
                  <label for="contrasena">Contraseña nueva:</label>
                  <input type="password" id="txtcontranu_editar" name="" class="form-control" placeholder="Digite su clave nueva"><br>
              </div>
             <div class="col-lg-12">
                  <label for="contrasena">Confirmar Contraseña:</label>
                  <input type="password" id="txtcontrare_editar" name="" class="form-control" placeholder="Confirme su contraseña"><br>
              </div>

            
            </div>
            <div class="modal-footer">
              <button class="btn btn-primary" onclick="Editar_Contrasena()">Modificar</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
          </div>
       </div>
    </div>


<!-- jQuery 3 -->
<script src="../plantilla/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../plantilla/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="../plantilla/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="../plantilla/bower_components/raphael/raphael.min.js"></script>

<!-- Sparkline -->
<script src="../plantilla/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="../plantilla/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plantilla/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="../plantilla/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="../plantilla/bower_components/moment/min/moment.min.js"></script>
<script src="../plantilla/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="../plantilla/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="../plantilla/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="../plantilla/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../plantilla/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../plantilla/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../plantilla/dist/js/demo.js"></script>
<script src="../plantilla/plugins/DataTables/datatables.js"></script>
<script type="text/javascript" src="../plantilla/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="../Login/vendor/sweetalert2/sweetalert2.js"></script>
<script type="text/javascript" src="../js/usuario.js"></script>
<script type="text/javascript" src="../js/distribuir_modulos.js"></script>
<script type="text/javascript" src="../js/estudiantes.js"></script>
<script type="text/javascript" src="../js/matriculas.js"></script>
<script type="text/javascript" src="../js/calificaciones.js"></script>
<!-- <script src="../../js/distribuir_modulos.js"></script> -->
<script type="text/javascript">
  
  TraerDatosUsuario();
</script>



<script type="text/javascript">
  function cargar_contenido(contenedor,contenido){
    $('#'+contenedor).load(contenido);
  }
  var idioma_espanol = {

            select: {
            rows: "%d fila seleccionada"
            },

            "sProcessing":     "Procesando...",
            "sLengthMenu":     "Mostrar MENU registros",
            "sZeroRecords":    "No se encontraron resultados",
            "sEmptyTable":     "Ning&uacute;n dato disponible en esta tabla",
            "sInfo":           "Registros del (_START_ al END_) total de _TOTAL registros",
            "sInfoEmpty":      "Registros del (0 al 0) total de 0 registros",
            "sInfoFiltered":   "(filtrado de un total de MAX registros)",
            "sInfoPostFix":    "",
            "sSearch":         "Buscar:",
            "sUrl":            "",
            "sInfoThousands":  ",",
            "sLoadingRecords": "<b>No se encontraron datos</b>",
            "oPaginate": {
                    "sFirst":    "Primero",
                    "sLast":     "Último",
                    "sNext":     "Siguiente",
                    "sPrevious": "Anterior"
            },
            "oAria": {
                    "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
   } 


 function soloLetras(e) {
    var key = e.keyCode || e.which,
      tecla = String.fromCharCode(key).toLowerCase(),
      letras = " áéíóúabcdefghijklmnñopqrstuvwxyz",
      especiales = [8, 37, 39, 46],
      tecla_especial = false;

    for (var i in especiales) {
      if (key == especiales[i]) {
        tecla_especial = true;
        break;
      }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
      return false;
    }
  }

   function soloNumeros(e) {
    var key = e.keyCode || e.which,
      tecla = String.fromCharCode(key).toLowerCase(),
      letras = "1234567890",
      especiales = [8, 37, 39, 46],
      tecla_especial = false;

    for (var i in especiales) {
      if (key == especiales[i]) {
        tecla_especial = true;
        break;
      }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
      return false;
    }
  }

</script>


</body>
</html>
