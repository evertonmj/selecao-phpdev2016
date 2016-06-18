<?php
class Proprietario{
	private $pro_int_codigo;
	private $pro_var_nome;
	private $pro_var_email;
	private $pro_var_telefone;


	public function getPro_int_codigo() {
		return $this->pro_int_codigo;
	}

	public function setPro_int_codigo($pro_int_codigo) {
		$this->pro_int_codigo = $pro_int_codigo;
	}

	public function getPro_var_nome() {
		return $this->pro_var_nome;
	}

	public function setPro_var_nome($pro_var_nome) {
		$this->pro_var_nome = $pro_var_nome;
	}

	public function getPro_var_email() {
		return $this->pro_var_email;
	}

	public function setPro_var_email($pro_var_email) {
		$this->pro_var_email = $pro_var_email;
	}

	public function getPro_var_telefone() {
		return $this->pro_var_telefone;
	}

	public function setPro_var_telefone($pro_var_telefone) {
		$this->pro_var_telefone = $pro_var_telefone;
	}

}
