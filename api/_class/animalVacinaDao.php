<?php
require_once("animalVacina.php");
require_once("animal.php");
require_once("vacina.php");
require_once("usuario.php");

class AnimalVacinaDao {
    /** @param AnimalVacina $animalVacina */
    public function selectByIdForm($animalVacina) {
        $ret = array();
        try {
            $mysql = new GDbMysql();
            $mysql->execute("SELECT anv_int_codigo,ani_int_codigo,vac_int_codigo,anv_dat_programacao,anv_dti_aplicacao,usu_int_codigo FROM vw_animal_vacina WHERE anv_int_codigo = ? ", array("i", $animalVacina->getAnv_int_codigo()), true, MYSQL_ASSOC);
            if ($mysql->fetch()) {
                $ret = $mysql->res;
            }
            $mysql->close();
        } catch (GDbException $e) {
            echo $e->getError();
        }
        return $ret;
    }

    /** @param AnimalVacina $animalVacina */
    public function insert($animalVacina) {

        $return = array();
        $param = array("iissi",$animalVacina->getAnimal()->getAni_int_codigo(),$animalVacina->getVacina()->getVac_int_codigo(),$animalVacina->getAnv_dat_programacao(),$animalVacina->getAnv_dti_aplicacao(),$animalVacina->getUsuario()->getUsu_int_codigo());
        try{
            $mysql = new GDbMysql();
            $mysql->execute("CALL sp_animal_vacina_ins(?,?,?,?,?, @p_status, @p_msg, @p_insert_id);", $param, false);
            $mysql->execute("SELECT @p_status, @p_msg, @p_insert_id");
            $mysql->fetch();
            $return["status"] = ($mysql->res[0]) ? true : false;
            $return["msg"] = $mysql->res[1];
            $return["insertId"] = $mysql->res[2];
            $mysql->close();
        } catch (GDbException $e) {
            $return["status"] = false;
            $return["msg"] = $e->getError();
        }
        return $return;
    }

    /** @param AnimalVacina $animalVacina */
    public function update($animalVacina) {

        $return = array();
        $param = array("iiissi",$animalVacina->getAnv_int_codigo(),$animalVacina->getAnimal()->getAni_int_codigo(),$animalVacina->getVacina()->getVac_int_codigo(),$animalVacina->getAnv_dat_programacao(),$animalVacina->getAnv_dti_aplicacao(),$animalVacina->getUsuario()->getUsu_int_codigo());
        try{
            $mysql = new GDbMysql();
            $mysql->execute("CALL sp_animal_vacina_upd(?,?,?,?,?,?, @p_status, @p_msg);", $param, false);
            $mysql->execute("SELECT @p_status, @p_msg");
            $mysql->fetch();
            $return["status"] = ($mysql->res[0]) ? true : false;
            $return["msg"] = $mysql->res[1];
            $mysql->close();
        } catch (GDbException $e) {
            $return["status"] = false;
            $return["msg"] = $e->getError();
        }
        return $return;
    }

    /** @param AnimalVacina $animalVacina */
    public function delete($animalVacina) {

        $return = array();
        $param = array("i",$animalVacina->getAnv_int_codigo());
        try {
            $mysql = new GDbMysql();
            $mysql->execute("CALL sp_animal_vacina_del(?, @p_status, @p_msg);", $param, false);
            $mysql->execute("SELECT @p_status, @p_msg");
            $mysql->fetch();
            $return["status"] = ($mysql->res[0]) ? true : false;
            $return["msg"] = $mysql->res[1];
            $mysql->close();
        } catch (GDbException $e) {
            $return["status"] = false;
            $return["msg"] = $e->getError();
        }
        return $return;
    }

    /** @param AnimalVacina $animalVacina */
    public function aplicarVacina($animalVacina) {

        $return = array();
        $param = array("iii",
                        $animalVacina['anv_int_codigo'],
                        $animalVacina['ani_int_codigo'],
                        $animalVacina['usu_int_codigo']);

        try{
            $mysql = new GDbMysql();
            $mysql->execute("CALL sp_animalvacina_aplica(?,?,?,'S', @p_status, @p_msg);", $param, false);
            $mysql->execute("SELECT @p_status, @p_msg");
            $mysql->fetch();
            $return["status"] = ($mysql->res[0]) ? true : false;
            $return["msg"] = $mysql->res[1];
            $mysql->close();
        } catch (GDbException $e) {
            $return["status"] = false;
            $return["msg"] = $e->getError();
        }
        return $return;
    }
}
