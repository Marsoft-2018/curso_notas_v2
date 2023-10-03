function listarSedes(){
    $.ajax({
        url:"controlador/sedes/ctrolSedes.php",
        type:"POST",
        data:{accion:"listar"},
        success:function(response){
            $("#listSedes").html(response);
        },
        error:function (err) {
            console.log("Eror: "+err);
        }
    });
}