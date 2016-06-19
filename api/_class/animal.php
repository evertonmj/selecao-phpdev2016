<?php
class Animal{
	private $ani_int_codigo;
	private $ani_var_nome;
	private $ani_cha_vivo;
	private $ani_dec_peso;
	private $ani_var_raca;
	private $pro_int_codigo;

	public function getAni_int_codigo() {
		return $this->ani_int_codigo;
	}

	public function setAni_int_codigo($ani_int_codigo) {
		$this->ani_int_codigo = $ani_int_codigo;
	}

	public function getAni_var_nome() {
		return $this->ani_var_nome;
	}

	public function setAni_var_nome($ani_var_nome) {
		$this->ani_var_nome = $ani_var_nome;
	}

	public function getAni_cha_vivo() {
		return $this->ani_cha_vivo;
	}

	public function setAni_cha_vivo($ani_cha_vivo) {
		$this->ani_cha_vivo = $ani_cha_vivo;
	}

	public function getAni_dec_peso() {
		return $this->ani_dec_peso;
	}

	public function setAni_dec_peso($ani_dec_peso) {
		$this->ani_dec_peso = $ani_dec_peso;
	}

	public function getAni_var_raca() {
		return $this->ani_var_raca;
	}

	public function setAni_var_raca($ani_var_raca) {
		$this->ani_var_raca = $ani_var_raca;
	}

	public function getPro_int_codigo() {
		return $this->pro_int_codigo;
	}

	public function setPro_int_codigo($pro_int_codigo) {
		$this->pro_int_codigo = $pro_int_codigo;
	}

}
