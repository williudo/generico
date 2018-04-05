<?php
/**
 * Hash da senha
 */
function hashSenha($str)
{
    return sha1(md5($str));
}
 
 
/**
 * Verifica se o usuário está logado
 */
function logado()
{
    if (!isset($_SESSION['logado']) || $_SESSION['logado'] !== true)
    {
        return false;
    }
 
    return true;
}

/**
 * Verifica se o usuário está logado
 */
function logadoAdmin()
{
    if (!isset($_SESSION['logado_admin']) || $_SESSION['logado_admin'] !== true)
    {
        return false;
    }
 
    return true;
}

function direciona($vai, $prefixo = '') {
	if (!headers_sent()) {	
		header("Location: ".$prefixo.$vai);
	}

	echo"<script language= 'JavaScript'>location.href='".$prefixo.$vai."'</script>";
	echo"<meta http-equiv='refresh' content='1; url=".$prefixo.$vai."'>";
	exit;
}


function retornaErro($titulo, $mensagem)
{
	return '<div class="alert alert-danger" role="alert"><b>'.$titulo.'</b><br>'.$mensagem.'</div>';
}

function retornaErros($erros)
{	
	$retorno = '<div class="alert alert-danger" role="alert">';
	foreach($erros as $err)
	{
		
		$retorno .= '<b>'.$err['titulo'].'</b><br>'.$err['mensagem'].'<br>';
	}
	$retorno .= '</div>';

	return $retorno;
}

?>