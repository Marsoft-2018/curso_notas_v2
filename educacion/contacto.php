<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Contacto</title>
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

	<link rel="stylesheet" href="styles.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	
	<?php include_once 'include/menu.php'; ?>
	<section id="about-home">
		<h2>Página de contáctanos</h2>
		
		</div>
	</section>

 <!-- <section id="blog-container">
 	<div class="blogs">
 		<div class="post">
 			<img src="images/b1.jpg" alt="">
 			<h3>Cursos Basicos</h3>
 			<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Doloribus, inventore consequuntur saepe natus, reprehenderit similique.</p>
 			<a href="post.php">Leer Mas</a>
 		</div>
 		<div class="post">
 			<img src="images/b2.jpg" alt="">
 			<h3>Cursos Basicos</h3>
 			<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Doloribus, inventore consequuntur saepe natus, reprehenderit similique.</p>
 			<a href="post.php">Leer Mas</a>
 		</div>
 		<div class="post">
 			<img src="images/b3.jpg" alt="">
 			<h3>Cursos Basicos</h3>
 			<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Doloribus, inventore consequuntur saepe natus, reprehenderit similique.</p>
 			<a href="post.php">Leer Mas</a>
 		</div>
 		<div class="post">
 			<img src="images/b4.png" alt="">
 			<h3>Cursos Basicos</h3>
 			<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Doloribus, inventore consequuntur saepe natus, reprehenderit similique.</p>
 			<a href="post.php">Leer Mas</a>
 		</div>
 	</div>
 	<div class="cate">
 		<h2>Categorias</h2>
 		<hr>
 		<a href="">Web Development</a>
 		<hr>
 		<a href="">Web Design</a>
 		<hr>
 		<a href="">App Development</a>
 		<hr>
 		<a href="">Frontend Development</a>
 		<hr>
 		<a href="">Backend Development</a>
 		<hr>
 		<a href="">Java</a>
 		<hr>
 		<a href="">PHP</a>
 	</div>
 </section> -->

	
	<!--registration-->
	<section id="registration">
		<div class="reminder">
			<p>Registrate en nuestros programas  ofrecidos</p>
			<h1>Inicio de clases en.:</h1>
			<div class="time">
				<div class="date">
                <span id="days"></span> <br>Dias
				</div>
				<div class="date">
                <span id="hours"></span>  <br>Horas
				</div>
				<div class="date">
                <span id="minutes"></span> <br>Minutos
				</div>
				<div class="date">
                <span id="seconds"></span>  <br>Segundos
				</div>
			</div>
		</div>
		<div class="form">
			<h3>Pre Registro</h3>
			<input type="text" id="" name="" placeholder="Digita tu nombre">
			<input type="text" id="" name="" placeholder="Digita tu Apellidos">

			<input type="text" id="" name="" placeholder="Digita tu Correo">
			<input type="text" id="" name="" placeholder="Digita tu No Celular">
			<div class="btn">
				<a href="" class="yellow">Enviar Datos</a>	
			</div>
		</div>
	</section>

	


    <?php include_once 'include/footer.php' ?>

	<script type="text/javascript" src="app.js"> 
		
	</script>
    <script>
        document.addEventListener('DOMContentLoaded', () => { 

//===
// VARIABLES
//===
const DATE_TARGET = new Date('04/25/2023 0:01 AM');
// DOM for render
const SPAN_DAYS = document.querySelector('span#days');
const SPAN_HOURS = document.querySelector('span#hours');
const SPAN_MINUTES = document.querySelector('span#minutes');
const SPAN_SECONDS = document.querySelector('span#seconds');
// Milliseconds for the calculations
const MILLISECONDS_OF_A_SECOND = 1000;
const MILLISECONDS_OF_A_MINUTE = MILLISECONDS_OF_A_SECOND * 60;
const MILLISECONDS_OF_A_HOUR = MILLISECONDS_OF_A_MINUTE * 60;
const MILLISECONDS_OF_A_DAY = MILLISECONDS_OF_A_HOUR * 24

//===
// FUNCTIONS
//===

/**
* Method that updates the countdown and the sample
*/
function updateCountdown() {
    // Calcs
    const NOW = new Date()
    const DURATION = DATE_TARGET - NOW;
    const REMAINING_DAYS = Math.floor(DURATION / MILLISECONDS_OF_A_DAY);
    const REMAINING_HOURS = Math.floor((DURATION % MILLISECONDS_OF_A_DAY) / MILLISECONDS_OF_A_HOUR);
    const REMAINING_MINUTES = Math.floor((DURATION % MILLISECONDS_OF_A_HOUR) / MILLISECONDS_OF_A_MINUTE);
    const REMAINING_SECONDS = Math.floor((DURATION % MILLISECONDS_OF_A_MINUTE) / MILLISECONDS_OF_A_SECOND);
    // Thanks Pablo Monteserín (https://pablomonteserin.com/cuenta-regresiva/)

    // Render
    SPAN_DAYS.textContent = REMAINING_DAYS;
    SPAN_HOURS.textContent = REMAINING_HOURS;
    SPAN_MINUTES.textContent = REMAINING_MINUTES;
    SPAN_SECONDS.textContent = REMAINING_SECONDS;
}

//===
// INIT
//===
updateCountdown();
// Refresh every second
setInterval(updateCountdown, MILLISECONDS_OF_A_SECOND);
});
</script>
 
</body>
</html>