<form action="reportes/rep_notas_general.php" method="POST" target="self">
    <div class="col-md-12">
        <div class="box box-primary box-solid">
            <div class="box-header with-border">
                <h1 class="box-title">MODULO CONSULTA DE CALIFICACIONES</h1>
                <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                </div>
                <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="form-group">
                <div class="col-lg-2">
                    <label for="estatus"><b>Sede:</b></label>
                    <select class="js-example-basic-single  form form-control combo" name="sede" id="cmb_sede_matricula"></select> 
                </div>
                <div class="col-lg-2">
                    <label for="estatus"><b>Programa:</b></label>
                    <select class="js-example-basic-single  form form-control combo" name="programa" id="cmb_programa_matricula"></select> 

                </div>
                <div class="col-lg-2">
                    <label for="estatus"><b>Semestre:</b></label>
                    <select class="js-example-basic-single form form-control combo" name="semestre"  id="cmb_semestre_matricula" onchange="listar_combo_asignaturas_programa()"
                    ></select> 
                </div>
                <div class="col-lg-2">
                    <label for=""><b>Seleccione Jornada:</b></label>
                    <select class="js-example-basic-single  form form-control combo" name="jornada" id="cmb_jornada_matricula">                    
                    </select> 
                </div> 
                <div class="col-lg-2">
                    <button class="btn btn-primary" type="submit">Cargar reporte</button> 
                </div>              
                </div>
            </div>
            <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </div>
</form>
</div>

    <script type="text/javascript">
        $(document).ready(function() {
            listar_combo_sedes();
            listar_combo_semestre();
            listar_combo_jornada();
            $('.js-example-basic-single').select2();
            listar_combo_rol();
            $("#modal_registro").on('shown.bs.modal',function(){
                $("#txt_usu").focus();
            });
        });


       $("#cmb_sede_matricula").change(function(){
            var idsede = $("#cmb_sede_matricula").val();
            listar_combo_programa(idsede);
            //alert(' id ' +idsede);
        })
    </script>