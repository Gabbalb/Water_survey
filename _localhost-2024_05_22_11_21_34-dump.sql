-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: sondaggio_acqua
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `domande`
--

DROP TABLE IF EXISTS `domande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domande` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `domanda` text DEFAULT NULL,
                           `id_form` int(11) DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `form_id` (`id_form`),
                           CONSTRAINT `form_id` FOREIGN KEY (`id_form`) REFERENCES `form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domande`
--

LOCK TABLES `domande` WRITE;
/*!40000 ALTER TABLE `domande` DISABLE KEYS */;
INSERT INTO `domande` VALUES (1,'The water I use in my home is managed sustainably.',1),(2,'I am concerned about the environmental impact of my water consumption.',1),(3,'I believe my water provider practices environmentally responsible resource management.',1),(4,'I think current government policies are effective in protecting water resources.',1),(5,'I am willing to reduce my water consumption to contribute to environmental sustainability.',1),(6,'I use devices and practices that are efficient in saving water in my home (e.g., low-flow faucets, short showers).',2),(7,'I think the price I pay for water accurately reflects the real cost of its supply and treatment.',2),(8,'I believe my community is doing enough to educate citizens on the importance of water conservation.',2),(9,'I consider the quality of water in my home to be adequate for daily consumption without additional treatment.',2),(10,'I am aware of local policies regarding water conservation and follow them closely.',2),(11,'I know the primary source of the water I use in my home (e.g., groundwater, lake, river).',3),(12,'I believe the water I use comes from a safe and clean source.',3),(13,'I am concerned about the future availability of water in my region.',3),(14,'I think my community has an effective plan to address potential water shortages.',3),(15,'I am informed about the available alternatives for water supply in my area.',3);
/*!40000 ALTER TABLE `domande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `titolo` varchar(255) DEFAULT NULL,
                        `descrizione` text DEFAULT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES (1,'Sustainability','This form assesses the sustainability practices and environmental impact awareness related to your water usage.'),(2,'Water Usage','This form evaluates your water usage practices and perceptions about water pricing and community education on water conservation.'),(3,'Water Supply','This form examines your knowledge and perceptions about the sources and safety of your water supply.');
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `nome_province` varchar(255) DEFAULT NULL,
                            `sigla_province` varchar(255) DEFAULT NULL,
                            `regione_province` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Agrigento','AG','Sicilia'),(2,'Alessandria','AL','Piemonte'),(3,'Ancona','AN','Marche'),(4,'Arezzo','AR','Toscana'),(5,'Ascoli Piceno','AP','Marche'),(6,'Asti','AT','Piemonte'),(7,'Avellino','AV','Campania'),(8,'Bari','BA','Puglia'),(9,'Barletta-Andria-Trani','BT','Puglia'),(10,'Belluno','BL','Veneto'),(11,'Benevento','BN','Campania'),(12,'Bergamo','BG','Lombardia'),(13,'Biella','BI','Piemonte'),(14,'Bologna','BO','Emilia-Romagna'),(15,'Bolzano','BZ','Trentino-Alto Adige'),(16,'Brescia','BS','Lombardia'),(17,'Brindisi','BR','Puglia'),(18,'Cagliari','CA','Sardegna'),(19,'Caltanissetta','CL','Sicilia'),(20,'Campobasso','CB','Molise'),(21,'Carbonia-Iglesias','CI','Sardegna'),(22,'Caserta','CE','Campania'),(23,'Catania','CT','Sicilia'),(24,'Catanzaro','CZ','Calabria'),(25,'Chieti','CH','Abruzzo'),(26,'Como','CO','Lombardia'),(27,'Cosenza','CS','Calabria'),(28,'Cremona','CR','Lombardia'),(29,'Crotone','KR','Calabria'),(30,'Cuneo','CN','Piemonte'),(31,'Enna','EN','Sicilia'),(32,'Fermo','FM','Marche'),(33,'Ferrara','FE','Emilia-Romagna'),(34,'Firenze','FI','Toscana'),(35,'Foggia','FG','Puglia'),(36,'Forlì-Cesena','FC','Emilia-Romagna'),(37,'Frosinone','FR','Lazio'),(38,'Genova','GE','Liguria'),(39,'Gorizia','GO','Friuli-Venezia Giulia'),(40,'Grosseto','GR','Toscana'),(41,'Imperia','IM','Liguria'),(42,'Isernia','IS','Molise'),(43,'L\'Aquila','AQ','Abruzzo'),(44,'La Spezia','SP','Liguria'),(45,'Latina','LT','Lazio'),(46,'Lecce','LE','Puglia'),(47,'Lecco','LC','Lombardia'),(48,'Livorno','LI','Toscana'),(49,'Lodi','LO','Lombardia'),(50,'Lucca','LU','Toscana'),(51,'Macerata','MC','Marche'),(52,'Mantova','MN','Lombardia'),(53,'Massa e Carrara','MS','Toscana'),(54,'Matera','MT','Basilicata'),(55,'Medio Campidano','VS','Sardegna'),(56,'Messina','ME','Sicilia'),(57,'Milano','MI','Lombardia'),(58,'Modena','MO','Emilia-Romagna'),(59,'Monza e Brianza','MB','Lombardia'),(60,'Napoli','NA','Campania'),(61,'Novara','NO','Piemonte'),(62,'Nuoro','NU','Sardegna'),(63,'Ogliastra','OG','Sardegna'),(64,'Olbia-Tempio','OT','Sardegna'),(65,'Oristano','OR','Sardegna'),(66,'Padova','PD','Veneto'),(67,'Palermo','PA','Sicilia'),(68,'Parma','PR','Emilia-Romagna'),(69,'Pavia','PV','Lombardia'),(70,'Perugia','PG','Umbria'),(71,'Pesaro e Urbino','PU','Marche'),(72,'Pescara','PE','Abruzzo'),(73,'Piacenza','PC','Emilia-Romagna'),(74,'Pisa','PI','Toscana'),(75,'Pistoia','PT','Toscana'),(76,'Pordenone','PN','Friuli-Venezia Giulia'),(77,'Potenza','PZ','Basilicata'),(78,'Prato','PO','Toscana'),(79,'Ragusa','RG','Sicilia'),(80,'Ravenna','RA','Emilia-Romagna'),(81,'Reggio Calabria(metropolitana)','RC','Calabria'),(82,'Reggio Emilia','RE','Emilia-Romagna'),(83,'Rieti','RI','Lazio'),(84,'Rimini','RN','Emilia-Romagna'),(85,'Roma','RM','Lazio'),(86,'Rovigo','RO','Veneto'),(87,'Salerno','SA','Campania'),(88,'Sassari','SS','Sardegna'),(89,'Savona','SV','Liguria'),(90,'Siena','SI','Toscana'),(91,'Siracusa','SR','Sicilia'),(92,'Sondrio','SO','Lombardia'),(93,'Taranto','TA','Puglia'),(94,'Teramo','TE','Abruzzo'),(95,'Terni','TR','Umbria'),(96,'Torino','TO','Piemonte'),(97,'Trapani','TP','Sicilia'),(98,'Trento','TN','Trentino-Alto Adige'),(99,'Treviso','TV','Veneto'),(100,'Trieste','TS','Friuli-Venezia Giulia'),(101,'Udine','UD','Friuli-Venezia Giulia'),(102,'Aosta','AO','Valle d\'Aosta'),(103,'Varese','VA','Lombardia'),(104,'Venezia','VE','Veneto'),(105,'Verbano-Cusio-Ossola','VB','Piemonte'),(106,'Vercelli','VC','Piemonte'),(107,'Verona','VR','Veneto'),(108,'Vibo Valentia','VV','Calabria'),(109,'Vicenza','VI','Veneto'),(110,'Viterbo','VT','Lazio');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risposte`
--

DROP TABLE IF EXISTS `risposte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risposte` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `id_utente` int(11) DEFAULT NULL,
                            `id_form` int(11) DEFAULT NULL,
                            `id_domanda` int(11) DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `id_domanda` (`id_domanda`),
                            KEY `id_form` (`id_form`),
                            KEY `id_users` (`id_utente`),
                            CONSTRAINT `id_domanda` FOREIGN KEY (`id_domanda`) REFERENCES `domande` (`id`),
                            CONSTRAINT `id_form` FOREIGN KEY (`id_form`) REFERENCES `form` (`id`),
                            CONSTRAINT `id_users` FOREIGN KEY (`id_utente`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Risposte ai form';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risposte`
--

LOCK TABLES `risposte` WRITE;
/*!40000 ALTER TABLE `risposte` DISABLE KEYS */;
/*!40000 ALTER TABLE `risposte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
                         `id` int(11) NOT NULL AUTO_INCREMENT,
                         `nome` varchar(255) DEFAULT NULL,
                         `cognome` varchar(255) DEFAULT NULL,
                         `mail` varchar(255) DEFAULT NULL,
                         `username` varchar(255) DEFAULT NULL,
                         `password` varchar(255) DEFAULT NULL,
                         `area_id` int(11) DEFAULT NULL,
                         `id_permesso` int(11) DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `username_index` (`username`),
                         KEY `area_id` (`area_id`),
                         CONSTRAINT `area_id` FOREIGN KEY (`area_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Lista degli utenti registrati';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,'admin@company.com','admin','$2y$10$HuquAHySlYwtGzL4qN0Qs.P/4PAyyXreG11cna45TvlWtNZFKrgGK',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 11:21:34
