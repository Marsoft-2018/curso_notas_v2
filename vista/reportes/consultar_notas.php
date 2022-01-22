
 <div class="col-md-12">
    <div class="box box-warning box-solid">
      <div class="box-header with-border">
        <h3 class="box-title">Consultar notas estudiantes</h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group">
                <div class="col-lg-10">
                
                </div>

              </div>
             <table id="tabla_consulta_notas" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Programa</th>
                    <th>Asignatura</th>
                    <th>Definitiva</th>
                   
                  </tr>
                </thead>
             
                </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>


        <script type="text/javascript" src="../js/consultar_notas.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
           listar_consulta_notas();
          
    });

     
    </script>
