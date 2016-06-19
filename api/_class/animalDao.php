
<?php
require_once("animal.php");

class AnimalDao {
    /** @param Animal $animal */
    public function selectByIdForm($animal) {
        $ret = array();
        try {
            $mysql = new GDbMysql();
            $mysql->execute("SELECT ani_int_codigo,ani_var_nome,ani_cha_vivo,ani_dec_peso,ani_var_raca FROM vw_animal WHERE ani_int_codigo = ? ", array("i", $animal->getAni_int_codigo()), true, MYSQL_ASSOC);
            if ($mysql->fetch()) {
                $ret = $mysql->res;
            }
            $mysql->close();
        } catch (GDbException $e) {
            echo $e->getError();
        }
        return $ret;
    }

    /** @param Animal $animal */
    public function insert($animal) {

        $return = array();
        $param = array("sdssi",
            $animal->getAni_var_nome(),
            $animal->getAni_dec_peso(),
            $animal->getAni_var_raca(),
            $animal->getAni_cha_vivo(),
            $animal->getPro_int_codigo()
            );
        try{
            $mysql = new GDbMysql();
            $mysql->execute("CALL sp_animal_ins(?,?,?,?,?, @p_status, @p_msg, @p_insert_id);", $param, false);
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

    /** @param Animal $animal */
    public function update($animal) {

        $return = array();
        $param = array("isdssi",
            $animal->getAni_int_codigo(),
            $animal->getAni_var_nome(),
            $animal->getAni_dec_peso(),
            $animal->getAni_var_raca(),
            $animal->getAni_cha_vivo(),
            $animal->getPro_int_codigo()
          );
        try{
            $mysql = new GDbMysql();
            $mysql->execute("CALL sp_animal_upd(?,?,?,?,?,?, @p_status, @p_msg);", $param, false);
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

    /** @param Animal $animal */
    public function delete($animal) {

        $return = array();
        $param = array("i",$animal->getAni_int_codigo());
        try {
            $mysql = new GDbMysql();
            $mysql->execute("CALL sp_animal_del(?, @p_status, @p_msg);", $param, false);
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
