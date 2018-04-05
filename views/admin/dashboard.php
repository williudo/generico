<?php 
session_start();

require '../../config/init.php';
if(logadoAdmin()){
?>

admin dashboard

<?php
}else{
	direciona('/admin');
}
?>