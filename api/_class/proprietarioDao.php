
<?php
require_once("proprietario.php");

class ProprietarioDao {
    /** @param proprietario $proprietario */
    public function selectByIdForm($proprietario) {
        $ret = array();
        try {
            $mysql = new GDbMysql();
            $mysql->execute("SELECT pro_int_codigo,pro_var_nome,pro_var_email,pro_var_telefone FROM vw_proprietario WHERE pro_int_codigo = ? ", array("i", $proprietario->getPro_int_codigo()), true, MYSQL_ASSOC);
            if ($mysql->fetch()) {
                $ret = $mysql->res;
            }
            $mysql->close();
        } catch (GDbException $e) {
            echo $e->getError();
        }
        return $ret;
    }

    /** @param Proprietario $proprietario */
    public function insert($proprietario) {
        $return = array();
        $param = array("sss",
            $proprietario->getPro_var_nome(),
            $proprietario->getPro_var_email(),
            $proprietario->getPro_var_telefone()
            );

        try{
            $mysql = new GDbMysql();
            $mysql->execute("CALL sp_proprietario_ins(?,?,?, @p_status, @p_msg, @p_insert_id);", $param, false);
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

    /** @param Proprietario $proprietario */
    public function update($proprietario) {

        $return = array();
        $param = array("isss",
            $proprietario->getPro_int_codigo(),
            $proprietario->getPro_var_nome(),
            $proprietario->getPro_var_email(),
            $proprietario->getPro_var_telefone());
        try{
            $mysql = new GDbMysql();
            $mysql->execute("CALL sp_proprietario_upd(?,?,?,?, @p_status, @p_msg);", $param, false);
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

    /** @param Proprietario $proprietario */
    public function delete($proprietario) {

        $return = array();
        $param = array("i",$proprietario->getPro_int_codigo());
        try {
            $mysql = new GDbMysql();
            $mysql->execute("CALL sp_proprietario_del(?, @p_status, @p_msg);", $param, false);
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
