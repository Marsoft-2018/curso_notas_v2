var t_consulta_notas;
function listar_consulta_notas(){
	var idusuario = $("#txtidprincipal").val();
	
	
     t_consulta_notas = $("#tabla_consulta_notas").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controlador/consultas/listar_consulta_notas.php",
            type:'POST',
            data: {
            	idusuario:idusuario
            }
           
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            
            {"data":"nombre_programa"},
            {"data":"nombre_modulo"},
            {"data":"definitiva"},
                     
        
      ],

        "language":idioma_espanol,
        select: true
    });

    document.getElementById("tabla_matriculas_filter").style.display="none";

	      $('input.global_filter').on( 'keyup click', function () {
	        filterGlobal();
	    } );
	    $('input.column_filter').on( 'keyup click', function () {
	        filterColumn( $(this).parents('tr').attr('data-column') );
	    });
    }