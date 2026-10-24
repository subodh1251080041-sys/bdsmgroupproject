-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: SteamDB
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer` (
  `Developer_ID` int NOT NULL,
  `Developer_Name` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Developer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer`
--

LOCK TABLES `developer` WRITE;
/*!40000 ALTER TABLE `developer` DISABLE KEYS */;
INSERT INTO `developer` VALUES (1,'FromSoftware','info@fromsoftware.jp','Japan'),(2,'Team Cherry','info@teamcherry.com.au','Australia'),(3,'Quantic Dream','contact@quanticdream.com','France'),(4,'Capcom','info@capcom.co.jp','Japan'),(5,'Naughty Dog','contact@naughtydog.com','USA'),(6,'Kojima Productions','info@kojimaproductions.jp','Japan'),(7,'Insomniac Games','contact@insomniac.games','USA'),(8,'Rockstar North','north@rockstargames.com','UK'),(9,'Hazelight Studios','hello@hazelight.se','Sweden'),(10,'Aggro Crab','hello@aggrocrab.com','USA'),(11,'Turn 10 Studios','contact@turn10studios.com','USA'),(12,'Playground Games','info@playground-games.com','UK'),(13,'EA Vancouver','contact@ea.com','Canada'),(14,'Codemasters','contact@codemasters.com','UK');
/*!40000 ALTER TABLE `developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `Game_ID` int NOT NULL,
  `Game_Name` varchar(150) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `Release_Date` date DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Developer_ID` int NOT NULL,
  `Publisher_ID` int NOT NULL,
  PRIMARY KEY (`Game_ID`),
  KEY `Developer_ID` (`Developer_ID`),
  KEY `Publisher_ID` (`Publisher_ID`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`Developer_ID`) REFERENCES `developer` (`Developer_ID`),
  CONSTRAINT `game_ibfk_2` FOREIGN KEY (`Publisher_ID`) REFERENCES `publisher` (`Publisher_ID`),
  CONSTRAINT `game_chk_1` CHECK ((`Price` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'Elden Ring','Open-world action RPG set in the Lands Between.','Action RPG','2022-02-25',49.99,1,1),(2,'Hollow Knight','Hand-drawn metroidvania in the ruined insect kingdom of Hallownest.','Metroidvania','2017-02-24',14.99,2,2),(3,'Sekiro: Shadows Die Twice','Samurai action-adventure set in Sengoku-era Japan.','Action-Adventure','2019-03-22',59.99,1,3),(4,'Detroit: Become Human','Branching sci-fi story about androids in Detroit.','Adventure','2020-06-18',39.99,3,4),(5,'Resident Evil 2','Remake of the survival horror classic in Raccoon City.','Survival Horror','2019-01-25',39.99,4,5),(6,'Resident Evil 3','Jill Valentine escapes Raccoon City and the Nemesis.','Survival Horror','2020-04-03',39.99,4,5),(7,'Resident Evil 7: Biohazard','First-person horror in a Louisiana plantation house.','Survival Horror','2017-01-24',29.99,4,5),(8,'Resident Evil Village','Ethan Winters searches for his daughter in a mysterious village.','Survival Horror','2021-05-07',39.99,4,5),(9,'The Last of Us Part I','Remake of the post-apocalyptic story of Joel and Ellie.','Action-Adventure','2023-03-28',59.99,5,6),(10,'Death Stranding','Delivery-driven action game in a fractured America.','Action','2020-07-14',39.99,6,7),(11,'Marvel\'s Spider-Man Remastered','Open-world superhero game starring Peter Parker.','Action-Adventure','2022-08-12',59.99,7,6),(12,'Grand Theft Auto V','Open-world crime action-adventure in Los Santos.','Action','2015-04-14',29.99,8,8),(13,'It Takes Two','Co-op-only platformer about a couple turned into dolls.','Co-op Adventure','2021-03-26',39.99,9,9),(14,'A Way Out','Co-op-only prison break adventure.','Co-op Adventure','2018-03-23',29.99,9,9),(15,'Heavy Rain','Interactive thriller about the Origami Killer.','Adventure','2019-06-24',49.99,3,4),(16,'PEAK','Co-op mountain climbing game where survival is the goal.','Co-op Survival','2025-06-16',7.99,10,10),(17,'Forza Motorsport','Circuit racing simulation with realistic driving physics.','Racing','2023-10-05',69.99,11,11),(18,'Forza Horizon 6','Open-world racing festival set in Japan.','Racing','2026-05-19',69.99,12,11),(19,'EA Sports FC 26','Annual football simulation with licensed leagues and clubs.','Sports','2025-09-26',69.99,13,9),(20,'F1 26','2026 season content expansion for EA Sports F1 25.','Racing','2026-05-28',29.99,14,9);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_library`
--

DROP TABLE IF EXISTS `game_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_library` (
  `Library_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  `Game_ID` int NOT NULL,
  `Date_Added` date NOT NULL,
  `Ownership_Status` varchar(20) NOT NULL,
  PRIMARY KEY (`Library_ID`),
  UNIQUE KEY `User_ID` (`User_ID`,`Game_ID`),
  KEY `Game_ID` (`Game_ID`),
  CONSTRAINT `game_library_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `game_library_ibfk_2` FOREIGN KEY (`Game_ID`) REFERENCES `game` (`Game_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_library`
--

LOCK TABLES `game_library` WRITE;
/*!40000 ALTER TABLE `game_library` DISABLE KEYS */;
INSERT INTO `game_library` VALUES (1,1,1,'2023-03-02','Owned'),(2,1,3,'2023-05-14','Owned'),(3,2,12,'2022-12-20','Owned'),(4,2,9,'2023-04-10','Owned'),(5,3,5,'2023-02-11','Owned'),(6,3,7,'2023-02-11','Owned'),(7,3,8,'2023-06-18','Owned'),(8,4,2,'2022-07-15','Owned'),(9,4,13,'2022-09-03','Owned'),(10,5,10,'2022-01-10','Owned'),(11,5,14,'2022-01-10','Owned'),(12,6,11,'2022-10-05','Owned'),(13,7,4,'2023-04-01','Owned'),(14,8,6,'2024-02-14','Owned'),(15,9,12,'2023-09-12','Owned'),(16,10,1,'2022-03-05','Owned'),(17,10,3,'2022-05-18','Owned'),(18,11,13,'2021-07-04','Owned'),(19,12,16,'2025-07-02','Owned'),(20,13,16,'2025-07-20','Owned'),(21,14,17,'2023-12-26','Owned'),(22,15,18,'2026-05-21','Owned'),(23,16,19,'2025-10-02','Owned'),(24,17,20,'2026-06-05','Owned'),(25,18,9,'2024-04-22','Owned'),(26,19,2,'2024-06-15','Owned'),(27,20,16,'2025-08-01','Owned'),(28,21,16,'2025-08-10','Gifted'),(29,22,12,'2024-08-03','Gifted'),(30,21,1,'2024-08-05','Family Shared');
/*!40000 ALTER TABLE `game_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `Publisher_ID` int NOT NULL,
  `Publisher_Name` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Publisher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Bandai Namco Entertainment','pub@bandainamco.com','Japan'),(2,'Team Cherry','pub@teamcherry.com.au','Australia'),(3,'Activision','pub@activision.com','USA'),(4,'Quantic Dream','pub@quanticdream.com','France'),(5,'Capcom Co., Ltd.','pub@capcom.co.jp','Japan'),(6,'Sony Interactive Entertainment','pub@sony.com','USA'),(7,'505 Games','pub@505games.com','Italy'),(8,'Rockstar Games','pub@rockstargames.com','USA'),(9,'Electronic Arts','pub@ea.com','USA'),(10,'Landfall Publishing','pub@landfall.se','Sweden'),(11,'Xbox Game Studios','pub@xbox.com','USA');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `Transaction_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  `Game_ID` int NOT NULL,
  `Purchase_Date` date NOT NULL,
  `Purchase_Price` decimal(10,2) DEFAULT NULL,
  `Payment_Status` varchar(20) NOT NULL,
  PRIMARY KEY (`Transaction_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Game_ID` (`Game_ID`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`Game_ID`) REFERENCES `game` (`Game_ID`),
  CONSTRAINT `purchase_chk_1` CHECK ((`Purchase_Price` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1001,1,1,'2023-03-02',59.99,'Completed'),(1002,1,3,'2023-05-14',29.99,'Completed'),(1003,2,12,'2022-12-20',14.99,'Completed'),(1004,2,9,'2023-04-10',59.99,'Completed'),(1005,3,5,'2023-02-11',14.99,'Completed'),(1006,3,7,'2023-02-11',7.49,'Completed'),(1007,3,8,'2023-06-18',19.99,'Completed'),(1008,4,2,'2022-07-15',7.49,'Completed'),(1009,4,13,'2022-09-03',19.99,'Completed'),(1010,5,10,'2022-01-10',19.99,'Completed'),(1011,5,14,'2022-01-10',7.49,'Completed'),(1012,6,11,'2022-10-05',59.99,'Completed'),(1013,7,4,'2023-04-01',19.99,'Completed'),(1014,7,15,'2023-06-10',24.99,'Refunded'),(1015,8,6,'2024-02-14',19.99,'Completed'),(1016,9,12,'2023-09-12',29.99,'Completed'),(1017,10,1,'2022-03-05',59.99,'Completed'),(1018,10,3,'2022-05-18',39.99,'Completed'),(1019,11,13,'2021-07-04',19.99,'Completed'),(1020,11,10,'2021-08-20',39.99,'Pending'),(1021,12,16,'2025-07-02',7.99,'Completed'),(1022,13,16,'2025-07-20',7.99,'Completed'),(1023,14,17,'2023-12-26',34.99,'Completed'),(1024,15,18,'2026-05-20',69.99,'Failed'),(1025,15,18,'2026-05-21',69.99,'Completed'),(1026,16,19,'2025-10-02',69.99,'Completed'),(1027,17,20,'2026-06-05',29.99,'Completed'),(1028,18,9,'2024-04-22',39.99,'Completed'),(1029,19,2,'2024-06-15',9.99,'Completed'),(1030,20,16,'2025-08-01',7.99,'Completed');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `Review_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  `Game_ID` int NOT NULL,
  `Rating` int DEFAULT NULL,
  `Review_Text` varchar(500) DEFAULT NULL,
  `Review_Date` date NOT NULL,
  PRIMARY KEY (`Review_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Game_ID` (`Game_ID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Game_ID`) REFERENCES `game` (`Game_ID`),
  CONSTRAINT `review_chk_1` CHECK ((`Rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,5,'Stunning open world and brutal bosses. A masterpiece.','2023-05-10'),(2,1,3,5,'Tight combat and a great atmosphere.','2023-07-01'),(3,2,12,5,'Huge world and a fun story. Still great years later.','2023-01-15'),(4,2,9,5,'The remake looks gorgeous and the story hits hard.','2023-05-02'),(5,3,5,4,'Tense and polished remake with great sound design.','2023-03-01'),(6,3,7,3,'Scary start but the second half is weaker.','2023-03-20'),(7,3,8,4,'Great setting and boss encounters.','2023-07-10'),(8,4,2,5,'Beautiful art and a perfect difficulty curve.','2022-08-20'),(9,4,13,5,'The best co-op game I have played, so inventive.','2022-10-01'),(10,5,10,4,'Slow but unique and relaxing once it clicks.','2022-02-18'),(11,5,14,4,'Short but a great co-op experience.','2022-02-25'),(12,6,11,5,'Swinging through the city feels fantastic.','2022-11-10'),(13,7,4,4,'Choices really matter, great branching story.','2023-04-20'),(14,8,6,3,'Fun but shorter and less scary than RE2.','2024-03-05'),(15,9,12,4,'Great fun with friends in online mode.','2023-10-02'),(16,10,1,5,'Open-world done right. A new benchmark.','2022-04-12'),(17,10,3,5,'Hard but incredibly rewarding.','2022-06-20'),(18,11,13,5,'Played it with my partner, we loved every level.','2021-07-25'),(19,12,16,5,'Hilarious and tense with friends. Great value.','2025-07-10'),(20,13,16,4,'Very fun, fails are half the entertainment.','2025-08-01'),(21,14,17,3,'Looks great but lacks content compared to past titles.','2024-01-05'),(22,15,18,5,'Japan setting is superb. Best Horizon yet.','2026-06-02'),(23,16,19,2,'Too many microtransactions, gameplay feels similar to last year.','2025-10-20'),(24,17,20,3,'Needed the base game and the DLC feels thin for the price.','2026-06-20'),(25,18,9,5,'Picked it up on sale and it is absolutely worth it.','2024-05-15'),(26,19,2,5,'Amazing metroidvania with a haunting soundtrack.','2024-07-10'),(27,20,16,5,'Perfect co-op game, highly recommend.','2025-08-15');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_ID` int NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Registration_Date` date NOT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'aarav001','Aarav Sharma','aaravsharma@gmail.com','India','2020-01-12'),(2,'soumya','Souyma Patil','Souymapatil@gmail.com','India','2020-05-23'),(3,'rahul_k','Rahul Kulkarni','rahulkulkarni@gmail.com','India','2021-02-14'),(4,'sneh','Sneha Mehta','snehamehta@gmail.com','India','2019-11-03'),(5,'vikrams','Vikram Singh','vikram@gmail.com','India','2021-06-30'),(6,'john92','John Smith','johnsmith@gmail.com','USA','2019-08-19'),(7,'Ada','Ada Wong','adawong@gmail.com','China','2022-01-05'),(8,'hailH','Adolf ','adolf@gmail.com','Germany','2022-09-17'),(9,'yuki_t','Yuki Tsunoda','yukitsunoda@gmail.com','Japan','2021-03-28'),(10,'carlos','Carlos Ramirez','carlosramirez@gmail.com','Brazil','2020-10-10'),(11,'leon','Leon Kennedy','leonkennedy@gmail.com','USA','2021-04-02'),(12,'ethanw','Ethan Winters','ethanwinters@gmail.com','USA','2021-09-02'),(13,'blackcat','Felicia','felicia@gmail.com','France','2020-04-02'),(14,'anne','Annerosse','anne@gmail.com','Poland','2023-06-21'),(15,'olivia','Olivia Winters','oliviawinters@gmail.com','Canada','2023-12-01'),(16,'veronica','Claire Redfield','claireredfield@gmail.com','Australia','2024-01-15'),(17,'ishaan','Ishaan Joshi','ishaanjoshi@gmail.com','India','2022-04-04'),(18,'meera_n','Meera Nair','meeranair@gmail.com','India','2020-03-30'),(19,'arjun','Arjun Deshmukh','arjun@gmail.com','India','2024-05-20'),(20,'tom_h','Tom Hughes','tomhughes@gmail.com','UK','2024-07-25'),(21,'lara','Lara Croft','laracroft@gmail.com','UK','2024-07-25'),(22,'lucasg','Lucas Grey','lucas@gmail.com','USA','2024-07-30'),(23,'diego_f','Diego Fernandez','diegofernandez@gmail.com','Spain','2025-01-10'),(24,'kami','Kim Dojka','kimdojka@gmail.com','South Korea','2025-02-18'),(25,'raj_p','Raj Patel','rajpatel@gmail.com','India','2025-03-05');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-24 13:41:59
