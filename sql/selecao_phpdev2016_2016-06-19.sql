# ************************************************************
# Sequel Pro SQL dump
# Versão 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: emendonca.cwny28cumend.us-west-2.rds.amazonaws.com (MySQL 5.5.38)
# Base de Dados: selecao_phpdev2016
# Tempo de Geração: 2016-06-19 14:29:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela animal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `animal`;

CREATE TABLE `animal` (
  `ani_int_codigo` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Código',
  `ani_var_nome` varchar(50) NOT NULL COMMENT 'Nome',
  `ani_cha_vivo` char(1) NOT NULL DEFAULT 'S' COMMENT 'Vivo|S:Sim;N:Não',
  `ani_dec_peso` decimal(8,3) DEFAULT NULL COMMENT 'Peso',
  `ani_var_raca` varchar(50) DEFAULT NULL COMMENT 'Raça',
  `ani_dti_inclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Inclusão',
  `pro_int_codigo` int(11) NOT NULL,
  `ani_var_imagem` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ani_int_codigo`),
  KEY `pro_int_codigo` (`pro_int_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='Animal';

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;

INSERT INTO `animal` (`ani_int_codigo`, `ani_var_nome`, `ani_cha_vivo`, `ani_dec_peso`, `ani_var_raca`, `ani_dti_inclusao`, `pro_int_codigo`, `ani_var_imagem`)
VALUES
	(8,'Dengs','S',1.000,'gato','2016-06-19 10:06:54',5,''),
	(9,'Tito','S',1.000,'tartaruga','2016-06-19 10:55:19',5,'');

/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela animal_vacina
# ------------------------------------------------------------

DROP TABLE IF EXISTS `animal_vacina`;

CREATE TABLE `animal_vacina` (
  `anv_int_codigo` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Codigo',
  `ani_int_codigo` int(11) unsigned NOT NULL COMMENT 'Animal',
  `vac_int_codigo` int(11) unsigned NOT NULL COMMENT 'Vacina',
  `anv_dat_programacao` date NOT NULL COMMENT 'Data Programacao',
  `anv_dti_aplicacao` datetime DEFAULT NULL COMMENT 'Data Aplicacao',
  `usu_int_codigo` int(11) unsigned DEFAULT NULL COMMENT 'Usuario que aplicou',
  `anv_dti_inclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Inclusao',
  PRIMARY KEY (`anv_int_codigo`),
  KEY `FK_animal_vacina_animal_ani_int_codigo` (`ani_int_codigo`),
  KEY `FK_animal_vacina_usuario_usu_int_codigo` (`usu_int_codigo`),
  KEY `FK_animal_vacina_vacina_vac_int_codigo` (`vac_int_codigo`),
  CONSTRAINT `FK_animal_vacina_animal_ani_int_codigo` FOREIGN KEY (`ani_int_codigo`) REFERENCES `animal` (`ani_int_codigo`),
  CONSTRAINT `FK_animal_vacina_usuario_usu_int_codigo` FOREIGN KEY (`usu_int_codigo`) REFERENCES `usuario` (`usu_int_codigo`),
  CONSTRAINT `FK_animal_vacina_vacina_vac_int_codigo` FOREIGN KEY (`vac_int_codigo`) REFERENCES `vacina` (`vac_int_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='AnimalVacina||Agenda de Vacinação';



# Dump da tabela proprietario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proprietario`;

CREATE TABLE `proprietario` (
  `pro_int_codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_var_nome` varchar(255) DEFAULT NULL,
  `pro_var_email` varchar(255) DEFAULT NULL,
  `pro_var_telefone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pro_int_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `proprietario` WRITE;
/*!40000 ALTER TABLE `proprietario` DISABLE KEYS */;

INSERT INTO `proprietario` (`pro_int_codigo`, `pro_var_nome`, `pro_var_email`, `pro_var_telefone`)
VALUES
	(5,'Everton','evertonmj@gmail.com','71981184851'),
	(6,'Deise Luz','deise.santo@gmail.com','7191919191919');

/*!40000 ALTER TABLE `proprietario` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `usu_int_codigo` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Código',
  `usu_var_nome` varchar(50) NOT NULL COMMENT 'Nome',
  `usu_var_email` varchar(100) NOT NULL COMMENT 'Email',
  `usu_cha_status` char(1) NOT NULL DEFAULT 'A' COMMENT 'Status|A:Ativo;I:Inativo',
  `usu_dti_inclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Inclusão',
  PRIMARY KEY (`usu_int_codigo`),
  UNIQUE KEY `UK_usuario_usu_var_email` (`usu_var_email`),
  KEY `IDX_usuario_usu_dti_inclusao` (`usu_dti_inclusao`),
  KEY `IDX_usuario_usu_var_nome` (`usu_var_nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='Usuario';

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;

INSERT INTO `usuario` (`usu_int_codigo`, `usu_var_nome`, `usu_var_email`, `usu_cha_status`, `usu_dti_inclusao`)
VALUES
	(1,'Joe','joe@doe.com','A','2016-03-25 13:23:14');

/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela vacina
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vacina`;

CREATE TABLE `vacina` (
  `vac_int_codigo` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Código',
  `vac_var_nome` varchar(50) NOT NULL COMMENT 'Nome',
  `vac_dti_inclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Inclusão',
  PRIMARY KEY (`vac_int_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='Vacina';

LOCK TABLES `vacina` WRITE;
/*!40000 ALTER TABLE `vacina` DISABLE KEYS */;

INSERT INTO `vacina` (`vac_int_codigo`, `vac_var_nome`, `vac_dti_inclusao`)
VALUES
	(1,'Vanguard','2016-03-25 15:03:35'),
	(2,'Anti-rábica','2016-03-25 15:03:44'),
	(3,'Leshimune','2016-03-25 15:04:15');

/*!40000 ALTER TABLE `vacina` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela vw_animal
# ------------------------------------------------------------

DROP VIEW IF EXISTS `vw_animal`;

CREATE TABLE `vw_animal` (
   `ani_int_codigo` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `ani_var_nome` VARCHAR(50) NOT NULL,
   `ani_dec_peso` DECIMAL(8) NULL DEFAULT NULL,
   `ani_var_raca` VARCHAR(50) NULL DEFAULT NULL,
   `ani_cha_vivo` CHAR(1) NOT NULL DEFAULT 'S',
   `ani_var_vivo` VARCHAR(3) NULL DEFAULT NULL,
   `ani_dti_inclusao` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `ani_dtf_inclusao` VARCHAR(24) NULL DEFAULT NULL,
   `pro_int_codigo` INT(11) NOT NULL,
   `pro_var_nome` VARCHAR(255) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump da tabela vw_proprietario
# ------------------------------------------------------------

DROP VIEW IF EXISTS `vw_proprietario`;

CREATE TABLE `vw_proprietario` (
   `pro_int_codigo` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `pro_var_nome` VARCHAR(255) NULL DEFAULT NULL,
   `pro_var_email` VARCHAR(255) NULL DEFAULT NULL,
   `pro_var_telefone` VARCHAR(255) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump da tabela vw_usuario
# ------------------------------------------------------------

DROP VIEW IF EXISTS `vw_usuario`;

CREATE TABLE `vw_usuario` (
   `usu_int_codigo` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `usu_var_nome` VARCHAR(50) NOT NULL,
   `usu_var_email` VARCHAR(100) NOT NULL,
   `usu_cha_status` CHAR(1) NOT NULL DEFAULT 'A',
   `usu_var_status` VARCHAR(7) NULL DEFAULT NULL,
   `usu_dti_inclusao` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `usu_dtf_inclusao` VARCHAR(24) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump da tabela vw_vacina
# ------------------------------------------------------------

DROP VIEW IF EXISTS `vw_vacina`;

CREATE TABLE `vw_vacina` (
   `vac_int_codigo` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `vac_var_nome` VARCHAR(50) NOT NULL,
   `vac_dti_inclusao` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `vac_dtf_inclusao` VARCHAR(24) NULL DEFAULT NULL
) ENGINE=MyISAM;





# Replace placeholder table for vw_usuario with correct view syntax
# ------------------------------------------------------------

DROP TABLE `vw_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `vw_usuario`
AS SELECT
   `usuario`.`usu_int_codigo` AS `usu_int_codigo`,
   `usuario`.`usu_var_nome` AS `usu_var_nome`,
   `usuario`.`usu_var_email` AS `usu_var_email`,
   `usuario`.`usu_cha_status` AS `usu_cha_status`,(case `usuario`.`usu_cha_status` when 'A' then 'Ativo' when 'I' then 'Inativo' end) AS `usu_var_status`,
   `usuario`.`usu_dti_inclusao` AS `usu_dti_inclusao`,date_format(`usuario`.`usu_dti_inclusao`,'%d/%m/%Y %H:%i:%s') AS `usu_dtf_inclusao`
FROM `usuario`;


# Replace placeholder table for vw_animal with correct view syntax
# ------------------------------------------------------------

DROP TABLE `vw_animal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `vw_animal`
AS SELECT
   `animal`.`ani_int_codigo` AS `ani_int_codigo`,
   `animal`.`ani_var_nome` AS `ani_var_nome`,
   `animal`.`ani_dec_peso` AS `ani_dec_peso`,
   `animal`.`ani_var_raca` AS `ani_var_raca`,
   `animal`.`ani_cha_vivo` AS `ani_cha_vivo`,(case `animal`.`ani_cha_vivo` when 'S' then 'Sim' when 'N' then 'Não' end) AS `ani_var_vivo`,
   `animal`.`ani_dti_inclusao` AS `ani_dti_inclusao`,date_format(`animal`.`ani_dti_inclusao`,'%d/%m/%Y %H:%i:%s') AS `ani_dtf_inclusao`,
   `animal`.`pro_int_codigo` AS `pro_int_codigo`,
   `p`.`pro_var_nome` AS `pro_var_nome`
FROM (`animal` left join `proprietario` `p` on((`p`.`pro_int_codigo` = `animal`.`pro_int_codigo`)));


# Replace placeholder table for vw_vacina with correct view syntax
# ------------------------------------------------------------

DROP TABLE `vw_vacina`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `vw_vacina`
AS SELECT
   `vacina`.`vac_int_codigo` AS `vac_int_codigo`,
   `vacina`.`vac_var_nome` AS `vac_var_nome`,
   `vacina`.`vac_dti_inclusao` AS `vac_dti_inclusao`,date_format(`vacina`.`vac_dti_inclusao`,'%d/%m/%Y %H:%i:%s') AS `vac_dtf_inclusao`
FROM `vacina`;


# Replace placeholder table for vw_proprietario with correct view syntax
# ------------------------------------------------------------

DROP TABLE `vw_proprietario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `vw_proprietario`
AS SELECT
   `proprietario`.`pro_int_codigo` AS `pro_int_codigo`,
   `proprietario`.`pro_var_nome` AS `pro_var_nome`,
   `proprietario`.`pro_var_email` AS `pro_var_email`,
   `proprietario`.`pro_var_telefone` AS `pro_var_telefone`
FROM `proprietario`;

--
-- Dumping routines (PROCEDURE) for database 'selecao_phpdev2016'
--
DELIMITER ;;

# Dump of PROCEDURE sp_animalvacina_aplica
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_animalvacina_aplica` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_animalvacina_aplica`(IN p_anv_int_codigo INT(11), IN p_ani_int_codigo INT(11), IN p_usu_int_codigo INT(11), IN p_aplica CHAR(1), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
    SQL SECURITY INVOKER
    COMMENT 'Procedure de Update'
BEGIN

  DECLARE v_existe boolean;
  DECLARE v_ani_cha_vivo char(1);

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_msg = '';
  SET p_status = FALSE;


    -- VALIDACOES
   SELECT IF(count(1) = 0, FALSE, TRUE)
  INTO v_existe
  FROM animal_vacina
  WHERE anv_int_codigo = p_anv_int_codigo;
  IF NOT v_existe THEN
    SET p_msg = concat(p_msg, 'Registro não encontrado.<br />');
  END IF;

  -- VALIDAÇÕES
  SELECT a.ani_cha_vivo 
  INTO v_ani_cha_vivo
  FROM animal a 
  WHERE a.ani_int_codigo = p_ani_int_codigo;  
  IF v_ani_cha_vivo = 'N' THEN
    SET p_msg = CONCAT(p_msg, 'Não pode ser programada uma vacina para um animal morto. <br />');
   END IF;

  IF p_aplica NOT IN ('S', 'N') THEN
    SET p_msg = CONCAT(p_msg, 'Tipo de Aplicação Inválido. <br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    UPDATE animal_vacina SET
      anv_dti_aplicacao = IF(p_aplica = 'S', CURRENT_TIMESTAMP(), NULL),
      usu_int_codigo = IF(p_aplica = 'S',  p_usu_int_codigo, NULL)
    WHERE anv_int_codigo = p_anv_int_codigo;

    COMMIT;

    SET p_status = TRUE;
    SET p_msg = 'O registro foi alterado com sucesso.';

  END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_animalvacina_del
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_animalvacina_del` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_animalvacina_del`(IN p_anv_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
    SQL SECURITY INVOKER
    COMMENT 'Procedure de Delete'
BEGIN

  DECLARE v_existe BOOLEAN;
  DECLARE v_row_count int DEFAULT 0;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_msg = '';
  SET p_status = FALSE;

  -- VALIDAÇÕES
  SELECT IF(count(1) = 0, FALSE, TRUE)
  INTO v_existe
  FROM animal_vacina
  WHERE anv_int_codigo = p_anv_int_codigo;
  IF NOT v_existe THEN
    SET p_msg = concat(p_msg, 'Registro não encontrado.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    DELETE FROM animal_vacina
    WHERE anv_int_codigo = p_anv_int_codigo;

    SELECT ROW_COUNT() INTO v_row_count;

    COMMIT;

    IF (v_row_count > 0) THEN
      SET p_status = TRUE;
      SET p_msg = 'O Registro foi excluído com sucesso';
    END IF;

  END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_animal_del
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_animal_del` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_animal_del`(IN p_ani_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
    SQL SECURITY INVOKER
    COMMENT 'Procedure de Delete'
BEGIN

  DECLARE v_existe BOOLEAN;
  DECLARE v_row_count int DEFAULT 0;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_msg = '';
  SET p_status = FALSE;

  -- VALIDAÇÕES
  SELECT IF(count(1) = 0, FALSE, TRUE)
  INTO v_existe
  FROM animal
  WHERE ani_int_codigo = p_ani_int_codigo;
  IF NOT v_existe THEN
    SET p_msg = concat(p_msg, 'Registro não encontrado.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    DELETE FROM animal
    WHERE ani_int_codigo = p_ani_int_codigo;

    SELECT ROW_COUNT() INTO v_row_count;

    COMMIT;

    IF (v_row_count > 0) THEN
      SET p_status = TRUE;
      SET p_msg = 'O Registro foi excluído com sucesso';
    END IF;

  END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_animal_ins
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_animal_ins` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_animal_ins`(IN p_ani_var_nome VARCHAR(50), IN p_ani_dec_peso DECIMAL(8,3), IN p_ani_var_raca VARCHAR(50), IN p_ani_cha_vivo CHAR(1), IN p_pro_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT, INOUT p_insert_id INT(11))
    SQL SECURITY INVOKER
    COMMENT 'Procedure de Insert'
BEGIN

  DECLARE v_existe boolean;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_msg = '';
  SET p_status = FALSE;

  -- VALIDAÇÕES
  IF p_ani_var_nome IS NULL THEN
    SET p_msg = concat(p_msg, 'Nome não informado.<br />');
  END IF;
  IF p_ani_cha_vivo IS NULL THEN
    SET p_msg = concat(p_msg, 'Status não informado.<br />');
  ELSE 
    IF p_ani_cha_vivo NOT IN ('S','N') THEN 
      SET p_msg = concat(p_msg, 'Status inválido.<br />');
    END IF;
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    INSERT INTO animal (ani_var_nome, ani_dec_peso, ani_var_raca, ani_cha_vivo, pro_int_codigo) 
    VALUES (p_ani_var_nome, p_ani_dec_peso, p_ani_var_raca, p_ani_cha_vivo, p_pro_int_codigo);

    COMMIT;

    SET p_status = TRUE;
    SET p_msg = 'Um novo registro foi inserido com sucesso.';
    SET p_insert_id = LAST_INSERT_ID();

  END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_animal_upd
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_animal_upd` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_animal_upd`(IN p_ani_int_codigo INT(11), IN p_ani_var_nome VARCHAR(50), IN p_ani_dec_peso DECIMAL(8,3), IN p_ani_var_raca VARCHAR(50), IN p_ani_var_vivo CHAR(1), IN p_pro_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
    SQL SECURITY INVOKER
    COMMENT 'Procedure de Update'
BEGIN

  DECLARE v_existe BOOLEAN;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_msg = '';
  SET p_status = FALSE;

  -- VALIDAÇÕES
  SELECT IF(count(1) = 0, FALSE, TRUE)
  INTO v_existe
  FROM animal
  WHERE ani_int_codigo = p_ani_int_codigo;
  IF NOT v_existe THEN
    SET p_msg = concat(p_msg, 'Registro não encontrado.<br />');
  END IF;

  -- VALIDAÇÕES
  IF p_ani_var_nome IS NULL THEN
    SET p_msg = concat(p_msg, 'Nome não informado.<br />');
  END IF;
  IF p_ani_cha_vivo IS NULL THEN
    SET p_msg = concat(p_msg, 'Status não informado.<br />');
  ELSE 
    IF p_ani_cha_vivo NOT IN ('S','N') THEN 
      SET p_msg = concat(p_msg, 'Status inválido.<br />');
    END IF;
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    UPDATE animal
    SET ani_var_nome = p_ani_var_nome,
        ani_dec_peso = p_ani_dec_peso,
        ani_var_raca = p_ani_var_raca,
        ani_cha_vivo = p_ani_cha_vivo,
        pro_int_codigo = p_pro_int_codigo
    WHERE ani_int_codigo = p_ani_int_codigo;

    COMMIT;

    SET p_status = TRUE;
    SET p_msg = 'O registro foi alterado com sucesso';

  END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_proprietario_del
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_proprietario_del` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_proprietario_del`(IN p_pro_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
    SQL SECURITY INVOKER
    COMMENT 'Procedure de Delete'
BEGIN

  DECLARE v_existe BOOLEAN;
  DECLARE v_row_count int DEFAULT 0;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_msg = '';
  SET p_status = FALSE;

  -- VALIDAÇÕES
  SELECT IF(count(1) = 0, FALSE, TRUE)
  INTO v_existe
  FROM proprietario
  WHERE pro_int_codigo = p_pro_int_codigo;
  IF NOT v_existe THEN
    SET p_msg = concat(p_msg, 'Registro não encontrado.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    DELETE FROM proprietario
    WHERE pro_int_codigo = p_pro_int_codigo;

    SELECT ROW_COUNT() INTO v_row_count;

    COMMIT;

    IF (v_row_count > 0) THEN
      SET p_status = TRUE;
      SET p_msg = 'O Registro foi excluído com sucesso';
    END IF;

  END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_proprietario_ins
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_proprietario_ins` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_proprietario_ins`(IN p_pro_var_nome VARCHAR(255), IN p_pro_var_email VARCHAR(255), IN p_pro_var_telefone VARCHAR(255), INOUT p_status BOOLEAN, INOUT p_msg TEXT, INOUT p_insert_id INT(11))
    SQL SECURITY INVOKER
    COMMENT 'Procedure de Insert'
BEGIN

  DECLARE v_existe boolean;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_msg = '';
  SET p_status = FALSE;

  -- VALIDAÇÕES
  IF p_pro_var_nome IS NULL THEN
    SET p_msg = concat(p_msg, 'Nome não informado.<br />');
  END IF;
    IF p_pro_var_email IS NULL THEN
    SET p_msg = concat(p_msg, 'Email não informado.<br />');
  END IF;
    IF p_pro_var_telefone IS NULL THEN
    SET p_msg = concat(p_msg, 'Telefone não informado.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    INSERT INTO proprietario (pro_var_nome, pro_var_email, pro_var_telefone) 
    VALUES (p_pro_var_nome, p_pro_var_email, p_pro_var_telefone);

    COMMIT;

    SET p_status = TRUE;
    SET p_msg = 'Um novo registro foi inserido com sucesso.';
    SET p_insert_id = LAST_INSERT_ID();

  END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_proprietario_upd
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_proprietario_upd` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_proprietario_upd`(IN p_pro_int_codigo INT(11), IN p_pro_var_nome VARCHAR(255), IN p_pro_var_email VARCHAR(255), IN p_pro_var_telefone VARCHAR(255), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
    SQL SECURITY INVOKER
    COMMENT 'Procedure de Update'
BEGIN

  DECLARE v_existe BOOLEAN;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_msg = '';
  SET p_status = FALSE;

  -- VALIDAÇÕES
  SELECT IF(count(1) = 0, FALSE, TRUE)
  INTO v_existe
  FROM proprietario
  WHERE pro_int_codigo = p_pro_int_codigo;
  IF NOT v_existe THEN
    SET p_msg = concat(p_msg, 'Registro não encontrado.<br />');
  END IF;

  -- VALIDAÇÕES
  IF p_pro_int_codigo IS NULL THEN
    SET p_msg = concat(p_msg, 'Código não informado.<br />');
  END IF;
  IF p_pro_var_nome IS NULL THEN
    SET p_msg = concat(p_msg, 'Nome não informado.<br />');
  END IF;
  IF p_pro_var_email IS NULL THEN
    SET p_msg = concat(p_msg, 'Email não informado.<br />');
  ELSE 
    IF p_pro_var_email NOT REGEXP '^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$' THEN 
      SET p_msg = concat(p_msg, 'Email em formato inválido.<br />');
    END IF;
  END IF;
  IF p_pro_var_telefone IS NULL THEN
    SET p_msg = concat(p_msg, 'Telefone não informado.<br />');
  END IF;

  SELECT IF(COUNT(1) > 0, TRUE, FALSE)
  INTO v_existe
  FROM proprietario
  WHERE pro_var_email = p_pro_var_email
        AND pro_int_codigo <> p_pro_int_codigo;
  IF v_existe THEN
    SET p_msg = concat(p_msg, 'Já existe proprietário com este email.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    UPDATE proprietario
    SET pro_var_nome = p_pro_var_nome,
        pro_var_email = p_pro_var_email,
        pro_var_telefone = p_pro_var_telefone
    WHERE pro_int_codigo = p_pro_int_codigo;

    COMMIT;

    SET p_status = TRUE;
    SET p_msg = 'O registro foi alterado com sucesso';

  END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_usuario_del
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_del` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_usuario_del`(IN p_usu_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
    SQL SECURITY INVOKER
    COMMENT 'Procedure de Delete'
BEGIN

  DECLARE v_existe BOOLEAN;
  DECLARE v_row_count int DEFAULT 0;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_msg = '';
  SET p_status = FALSE;

  -- VALIDAÇÕES
  SELECT IF(count(1) = 0, FALSE, TRUE)
  INTO v_existe
  FROM usuario
  WHERE usu_int_codigo = p_usu_int_codigo;
  IF NOT v_existe THEN
    SET p_msg = concat(p_msg, 'Registro não encontrado.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    DELETE FROM usuario
    WHERE usu_int_codigo = p_usu_int_codigo;

    SELECT ROW_COUNT() INTO v_row_count;

    COMMIT;

    IF (v_row_count > 0) THEN
      SET p_status = TRUE;
      SET p_msg = 'O Registro foi excluído com sucesso';
    END IF;

  END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_usuario_ins
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_ins` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_usuario_ins`(IN p_usu_var_nome VARCHAR(50), IN p_usu_var_email VARCHAR(100), IN p_usu_cha_status CHAR(1), INOUT p_status BOOLEAN, INOUT p_msg TEXT, INOUT p_insert_id INT(11))
    SQL SECURITY INVOKER
    COMMENT 'Procedure de Insert'
BEGIN

  DECLARE v_existe boolean;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_msg = '';
  SET p_status = FALSE;

  -- VALIDAÇÕES
  IF p_usu_var_nome IS NULL THEN
    SET p_msg = concat(p_msg, 'Nome não informado.<br />');
  END IF;
  IF p_usu_var_email IS NULL THEN
    SET p_msg = concat(p_msg, 'Email não informado.<br />');
  ELSE 
    IF p_usu_var_email NOT REGEXP '^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$' THEN 
      SET p_msg = concat(p_msg, 'Email em formato inválido.<br />');
    END IF;
  END IF;
  IF p_usu_cha_status IS NULL THEN
    SET p_msg = concat(p_msg, 'Status não informado.<br />');
  ELSE 
    IF p_usu_cha_status NOT IN ('A','I') THEN 
      SET p_msg = concat(p_msg, 'Status inválido.<br />');
    END IF;
  END IF;

  SELECT IF(COUNT(1) > 0, TRUE, FALSE)
  INTO v_existe
  FROM usuario
  WHERE usu_var_email = p_usu_var_email;
  IF v_existe THEN
    SET p_msg = concat(p_msg, 'Já existe usuário com este email.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    INSERT INTO usuario (usu_var_nome, usu_var_email, usu_cha_status)
    VALUES (p_usu_var_nome, p_usu_var_email, p_usu_cha_status);

    COMMIT;

    SET p_status = TRUE;
    SET p_msg = 'Um novo registro foi inserido com sucesso.';
    SET p_insert_id = LAST_INSERT_ID();

  END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_usuario_upd
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_upd` */;;
/*!50003 SET SESSION SQL_MODE="NO_AUTO_VALUE_ON_ZERO"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_usuario_upd`(IN p_usu_int_codigo INT(11), IN p_usu_var_nome VARCHAR(50), IN p_usu_var_email VARCHAR(100), IN p_usu_cha_status CHAR(1), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
    SQL SECURITY INVOKER
    COMMENT 'Procedure de Update'
BEGIN

  DECLARE v_existe BOOLEAN;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_status = FALSE;
    SET p_msg = 'Erro ao executar o procedimento.';
  END;

  SET p_msg = '';
  SET p_status = FALSE;

  -- VALIDAÇÕES
  SELECT IF(count(1) = 0, FALSE, TRUE)
  INTO v_existe
  FROM usuario
  WHERE usu_int_codigo = p_usu_int_codigo;
  IF NOT v_existe THEN
    SET p_msg = concat(p_msg, 'Registro não encontrado.<br />');
  END IF;

  -- VALIDAÇÕES
  IF p_usu_int_codigo IS NULL THEN
    SET p_msg = concat(p_msg, 'Código não informado.<br />');
  END IF;
  IF p_usu_var_nome IS NULL THEN
    SET p_msg = concat(p_msg, 'Nome não informado.<br />');
  END IF;
  IF p_usu_var_email IS NULL THEN
    SET p_msg = concat(p_msg, 'Email não informado.<br />');
  ELSE 
    IF p_usu_var_email NOT REGEXP '^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$' THEN 
      SET p_msg = concat(p_msg, 'Email em formato inválido.<br />');
    END IF;
  END IF;
  IF p_usu_cha_status IS NULL THEN
    SET p_msg = concat(p_msg, 'Status não informado.<br />');
  ELSE 
    IF p_usu_cha_status NOT IN ('A','I') THEN 
      SET p_msg = concat(p_msg, 'Status inválido.<br />');
    END IF;
  END IF;

  SELECT IF(COUNT(1) > 0, TRUE, FALSE)
  INTO v_existe
  FROM usuario
  WHERE usu_var_email = p_usu_var_email
        AND usu_int_codigo <> p_usu_int_codigo;
  IF v_existe THEN
    SET p_msg = concat(p_msg, 'Já existe usuário com este email.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    UPDATE usuario
    SET usu_var_nome = p_usu_var_nome,
        usu_var_email = p_usu_var_email,
        usu_cha_status = p_usu_cha_status
    WHERE usu_int_codigo = p_usu_int_codigo;

    COMMIT;

    SET p_status = TRUE;
    SET p_msg = 'O registro foi alterado com sucesso';

  END IF;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
