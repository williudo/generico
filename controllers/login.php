<?php
require_once '../classes/DB.php';

if(isset($_POST['email']) and isset($_POST['senha'])){

	// resgata variáveis do formulário
	$email = isset($_POST['email']) ? $_POST['email'] : '';
	$senha = isset($_POST['senha']) ? $_POST['senha'] : '';

	if (empty($email) || empty($senha))
	{
		echo "Informe email e senha";
		exit;
	}

	// cria o hash da senha
	$senhaHash = hashSenha($senha);

	$pdo = DB::conexao();

	$sql = "SELECT id_cliente, nome FROM clientes WHERE email = :email AND senha = :senha";
	$stmt = $pdo->prepare($sql);

	$stmt->bindParam(':email', $email);
	$stmt->bindParam(':senha', $senhaHash);
	$stmt->execute();

	$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

	if (count($users) <= 0)
	{
		echo "Email ou senha incorretos";
		exit;
	}

	// pega o primeiro usuário
	$user = $users[0];

	session_start();
	$_SESSION['logado'] = true;
	$_SESSION['logado_admin'] = false;
	$_SESSION['user_id'] = $user['id_cliente'];
	$_SESSION['user_nome'] = $user['nome'];

	direciona('/dashboard');
}
?>