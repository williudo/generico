<?php 
session_start();

require '../config/init.php';
if(logado()){
?>

dashboard

<?php
}else{
	direciona('/entrar');
}
?>