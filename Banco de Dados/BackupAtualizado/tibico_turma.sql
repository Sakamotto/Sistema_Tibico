-- MySQL dump 10.13  Distrib 5.7.12, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: tibico
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

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
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `turma_id` int(11) NOT NULL AUTO_INCREMENT,
  `professor_id` int(11) NOT NULL,
  `calendario_id` int(11) NOT NULL,
  `numVagas` int(11) NOT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  `disciplina_id` int(11) NOT NULL,
  PRIMARY KEY (`turma_id`),
  KEY `professor_turma_fk` (`professor_id`),
  KEY `calendario_turma_fk` (`calendario_id`),
  KEY `disciplina_turma_fk` (`disciplina_id`),
  CONSTRAINT `calendario_turma_fk` FOREIGN KEY (`calendario_id`) REFERENCES `calendario` (`calendario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `disciplina_turma_fk` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`disciplina_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professor_turma_fk` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,1,1,40,'Em andamento',2),(2,2,1,30,'Em andamento',6),(3,84,1,5,'Em andamento',3),(4,1,1,7,'Em andamento',2),(5,1,1,7,'Em andamento',2),(6,1,1,7,'Em andamento',2);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-20 20:18:11
