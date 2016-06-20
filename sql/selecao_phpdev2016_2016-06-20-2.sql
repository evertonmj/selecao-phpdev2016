CREATE DATABASE  IF NOT EXISTS `selecao_phpdev2016` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `selecao_phpdev2016`;
-- MySQL dump 10.13  Distrib 5.6.24, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: selecao_phpdev2016
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.15.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='Animal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (8,'Dengs','S',1.000,'gato','2016-06-19 13:06:54',5,''),(9,'Tito','S',1.000,'tartaruga','2016-06-19 13:55:19',5,'');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_vacina`
--

DROP TABLE IF EXISTS `animal_vacina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='AnimalVacina||Agenda de Vacinação';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_vacina`
--

LOCK TABLES `animal_vacina` WRITE;
/*!40000 ALTER TABLE `animal_vacina` DISABLE KEYS */;
INSERT INTO `animal_vacina` VALUES (2,8,2,'2016-06-30','2016-06-20 10:57:49',1,'0000-00-00 00:00:00'),(41,8,2,'2017-01-02',NULL,1,'2016-06-20 16:02:37');
/*!40000 ALTER TABLE `animal_vacina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proprietario`
--

DROP TABLE IF EXISTS `proprietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proprietario` (
  `pro_int_codigo` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_var_nome` varchar(255) DEFAULT NULL,
  `pro_var_email` varchar(255) DEFAULT NULL,
  `pro_var_telefone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pro_int_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietario`
--

LOCK TABLES `proprietario` WRITE;
/*!40000 ALTER TABLE `proprietario` DISABLE KEYS */;
INSERT INTO `proprietario` VALUES (5,'Everton','evertonmj@gmail.com','71981184851'),(6,'Deise Luz','deise.santo@gmail.com','7191919191919');
/*!40000 ALTER TABLE `proprietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='Usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Joe','joe@doe.com','A','2016-03-25 16:23:14');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacina`
--

DROP TABLE IF EXISTS `vacina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacina` (
  `vac_int_codigo` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Código',
  `vac_var_nome` varchar(50) NOT NULL COMMENT 'Nome',
  `vac_dti_inclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Inclusão',
  PRIMARY KEY (`vac_int_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='Vacina';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacina`
--

LOCK TABLES `vacina` WRITE;
/*!40000 ALTER TABLE `vacina` DISABLE KEYS */;
INSERT INTO `vacina` VALUES (1,'Vanguard','2016-03-25 18:03:35'),(2,'Anti-rábica','2016-03-25 18:03:44'),(3,'Leshimune','2016-03-25 18:04:15');
/*!40000 ALTER TABLE `vacina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_animal`
--

DROP TABLE IF EXISTS `vw_animal`;
/*!50001 DROP VIEW IF EXISTS `vw_animal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_animal` AS SELECT 
 1 AS `ani_int_codigo`,
 1 AS `ani_var_nome`,
 1 AS `ani_dec_peso`,
 1 AS `ani_var_raca`,
 1 AS `ani_cha_vivo`,
 1 AS `ani_var_vivo`,
 1 AS `ani_dti_inclusao`,
 1 AS `ani_dtf_inclusao`,
 1 AS `pro_int_codigo`,
 1 AS `pro_var_nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_animal_vacina`
--

DROP TABLE IF EXISTS `vw_animal_vacina`;
/*!50001 DROP VIEW IF EXISTS `vw_animal_vacina`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_animal_vacina` AS SELECT 
 1 AS `anv_int_codigo`,
 1 AS `ani_int_codigo`,
 1 AS `vac_int_codigo`,
 1 AS `anv_dat_programacao`,
 1 AS `anv_dti_aplicacao`,
 1 AS `anv_dti_inclusao`,
 1 AS `usu_int_codigo`,
 1 AS `ani_var_nome`,
 1 AS `vac_var_nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_proprietario`
--

DROP TABLE IF EXISTS `vw_proprietario`;
/*!50001 DROP VIEW IF EXISTS `vw_proprietario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_proprietario` AS SELECT 
 1 AS `pro_int_codigo`,
 1 AS `pro_var_nome`,
 1 AS `pro_var_email`,
 1 AS `pro_var_telefone`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_usuario`
--

DROP TABLE IF EXISTS `vw_usuario`;
/*!50001 DROP VIEW IF EXISTS `vw_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_usuario` AS SELECT 
 1 AS `usu_int_codigo`,
 1 AS `usu_var_nome`,
 1 AS `usu_var_email`,
 1 AS `usu_cha_status`,
 1 AS `usu_var_status`,
 1 AS `usu_dti_inclusao`,
 1 AS `usu_dtf_inclusao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vacina`
--

DROP TABLE IF EXISTS `vw_vacina`;
/*!50001 DROP VIEW IF EXISTS `vw_vacina`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_vacina` AS SELECT 
 1 AS `vac_int_codigo`,
 1 AS `vac_var_nome`,
 1 AS `vac_dti_inclusao`,
 1 AS `vac_dtf_inclusao`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'selecao_phpdev2016'
--

--
-- Dumping routines for database 'selecao_phpdev2016'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_animalvacina_aplica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_animalvacina_aplica`(IN p_anv_int_codigo INT(11), IN p_ani_int_codigo INT(11), IN p_usu_int_codigo INT(11), IN p_aplica CHAR(1), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_animalvacina_del` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_animalvacina_del`(IN p_anv_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_animalvacina_ins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_animalvacina_ins`(IN p_ani_int_codigo INT(11), IN p_vac_int_codigo INT(11), IN p_anv_dat_programacao DATE, IN p_usu_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT, INOUT p_insert_id INT(11))
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
  IF p_ani_int_codigo IS NULL THEN
    SET p_msg = concat(p_msg, 'Animal não informado.<br />');
  END IF;
  IF p_vac_int_codigo IS NULL THEN
    SET p_msg = concat(p_msg, 'Vacina não informada.<br />');
  END IF;
  IF p_anv_dat_programacao IS NULL THEN 
	SET p_msg = concat(p_msg, 'Data de programação não informada.<br />');
  END IF;

  IF p_msg = '' THEN

    START TRANSACTION;

    INSERT INTO animal_vacina (ani_int_codigo, vac_int_codigo, anv_dat_programacao, usu_int_codigo) 
    VALUES (p_ani_int_codigo, p_vac_int_codigo, p_anv_dat_programacao, p_usu_int_codigo);

    COMMIT;

    SET p_status = TRUE;
    SET p_msg = 'Um novo registro foi inserido com sucesso.';
    SET p_insert_id = LAST_INSERT_ID();

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_animal_del` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_animal_del`(IN p_ani_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_animal_ins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_animal_ins`(IN p_ani_var_nome VARCHAR(50), IN p_ani_dec_peso DECIMAL(8,3), IN p_ani_var_raca VARCHAR(50), IN p_ani_cha_vivo CHAR(1), IN p_pro_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT, INOUT p_insert_id INT(11))
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_animal_upd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_animal_upd`(IN p_ani_int_codigo INT(11), IN p_ani_var_nome VARCHAR(50), IN p_ani_dec_peso DECIMAL(8,3), IN p_ani_var_raca VARCHAR(50), IN p_ani_var_vivo CHAR(1), IN p_pro_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_proprietario_del` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_proprietario_del`(IN p_pro_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_proprietario_ins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_proprietario_ins`(IN p_pro_var_nome VARCHAR(255), IN p_pro_var_email VARCHAR(255), IN p_pro_var_telefone VARCHAR(255), INOUT p_status BOOLEAN, INOUT p_msg TEXT, INOUT p_insert_id INT(11))
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_proprietario_upd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_proprietario_upd`(IN p_pro_int_codigo INT(11), IN p_pro_var_nome VARCHAR(255), IN p_pro_var_email VARCHAR(255), IN p_pro_var_telefone VARCHAR(255), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_del` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_del`(IN p_usu_int_codigo INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_ins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_ins`(IN p_usu_var_nome VARCHAR(50), IN p_usu_var_email VARCHAR(100), IN p_usu_cha_status CHAR(1), INOUT p_status BOOLEAN, INOUT p_msg TEXT, INOUT p_insert_id INT(11))
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_upd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_upd`(IN p_usu_int_codigo INT(11), IN p_usu_var_nome VARCHAR(50), IN p_usu_var_email VARCHAR(100), IN p_usu_cha_status CHAR(1), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_animal`
--

/*!50001 DROP VIEW IF EXISTS `vw_animal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vw_animal` AS select `animal`.`ani_int_codigo` AS `ani_int_codigo`,`animal`.`ani_var_nome` AS `ani_var_nome`,`animal`.`ani_dec_peso` AS `ani_dec_peso`,`animal`.`ani_var_raca` AS `ani_var_raca`,`animal`.`ani_cha_vivo` AS `ani_cha_vivo`,(case `animal`.`ani_cha_vivo` when 'S' then 'Sim' when 'N' then 'Não' end) AS `ani_var_vivo`,`animal`.`ani_dti_inclusao` AS `ani_dti_inclusao`,date_format(`animal`.`ani_dti_inclusao`,'%d/%m/%Y %H:%i:%s') AS `ani_dtf_inclusao`,`animal`.`pro_int_codigo` AS `pro_int_codigo`,`p`.`pro_var_nome` AS `pro_var_nome` from (`animal` left join `proprietario` `p` on((`p`.`pro_int_codigo` = `animal`.`pro_int_codigo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_animal_vacina`
--

/*!50001 DROP VIEW IF EXISTS `vw_animal_vacina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_animal_vacina` AS select `animal_vacina`.`anv_int_codigo` AS `anv_int_codigo`,`animal_vacina`.`ani_int_codigo` AS `ani_int_codigo`,`animal_vacina`.`vac_int_codigo` AS `vac_int_codigo`,date_format(`animal_vacina`.`anv_dat_programacao`,'%d/%m/%Y %H:%i:%s') AS `anv_dat_programacao`,date_format(`animal_vacina`.`anv_dti_aplicacao`,'%d/%m/%Y %H:%i:%s') AS `anv_dti_aplicacao`,date_format(`animal_vacina`.`anv_dti_inclusao`,'%d/%m/%Y %H:%i:%s') AS `anv_dti_inclusao`,`animal_vacina`.`usu_int_codigo` AS `usu_int_codigo`,`animal`.`ani_var_nome` AS `ani_var_nome`,`vacina`.`vac_var_nome` AS `vac_var_nome` from ((`animal_vacina` left join `animal` on((`animal`.`ani_int_codigo` = `animal_vacina`.`ani_int_codigo`))) left join `vacina` on((`vacina`.`vac_int_codigo` = `animal_vacina`.`vac_int_codigo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_proprietario`
--

/*!50001 DROP VIEW IF EXISTS `vw_proprietario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vw_proprietario` AS select `proprietario`.`pro_int_codigo` AS `pro_int_codigo`,`proprietario`.`pro_var_nome` AS `pro_var_nome`,`proprietario`.`pro_var_email` AS `pro_var_email`,`proprietario`.`pro_var_telefone` AS `pro_var_telefone` from `proprietario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vw_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vw_usuario` AS select `usuario`.`usu_int_codigo` AS `usu_int_codigo`,`usuario`.`usu_var_nome` AS `usu_var_nome`,`usuario`.`usu_var_email` AS `usu_var_email`,`usuario`.`usu_cha_status` AS `usu_cha_status`,(case `usuario`.`usu_cha_status` when 'A' then 'Ativo' when 'I' then 'Inativo' end) AS `usu_var_status`,`usuario`.`usu_dti_inclusao` AS `usu_dti_inclusao`,date_format(`usuario`.`usu_dti_inclusao`,'%d/%m/%Y %H:%i:%s') AS `usu_dtf_inclusao` from `usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vacina`
--

/*!50001 DROP VIEW IF EXISTS `vw_vacina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `vw_vacina` AS select `vacina`.`vac_int_codigo` AS `vac_int_codigo`,`vacina`.`vac_var_nome` AS `vac_var_nome`,`vacina`.`vac_dti_inclusao` AS `vac_dti_inclusao`,date_format(`vacina`.`vac_dti_inclusao`,'%d/%m/%Y %H:%i:%s') AS `vac_dtf_inclusao` from `vacina` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-20 13:08:58
