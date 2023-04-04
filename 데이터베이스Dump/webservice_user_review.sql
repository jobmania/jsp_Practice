-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: webservice
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user_review`
--

DROP TABLE IF EXISTS `user_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `table_id` int NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mod_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subject` varchar(20) DEFAULT NULL,
  `review` text,
  `stars` int DEFAULT NULL,
  `table_name` varchar(25) DEFAULT NULL,
  `cafe_id` int DEFAULT NULL,
  `diner_id` int DEFAULT NULL,
  `gym_id` int DEFAULT NULL,
  `hall_id` int DEFAULT NULL,
  `library_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `cafe_id` (`cafe_id`),
  KEY `diner_id` (`diner_id`),
  KEY `gym_id` (`gym_id`),
  KEY `hall_id` (`hall_id`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `user_review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_review_ibfk_2` FOREIGN KEY (`cafe_id`) REFERENCES `cafe` (`ID`),
  CONSTRAINT `user_review_ibfk_3` FOREIGN KEY (`diner_id`) REFERENCES `diner` (`id`),
  CONSTRAINT `user_review_ibfk_4` FOREIGN KEY (`gym_id`) REFERENCES `gym` (`ID`),
  CONSTRAINT `user_review_ibfk_5` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`id`),
  CONSTRAINT `user_review_ibfk_6` FOREIGN KEY (`library_id`) REFERENCES `library` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_review`
--

LOCK TABLES `user_review` WRITE;
/*!40000 ALTER TABLE `user_review` DISABLE KEYS */;
INSERT INTO `user_review` VALUES (23,14,1,'2023-03-28 09:16:44','2023-03-28 13:45:23','나는 마시써소','연진아 나 지금 되게 신나',5,'diner',NULL,1,NULL,NULL,NULL),(24,14,89,'2023-03-28 09:17:18','2023-03-28 13:45:23','중식당 별로에용~','노맛',2,'diner',NULL,89,NULL,NULL,NULL),(25,14,1,'2023-03-28 10:06:50','2023-03-28 13:45:23','카페','카페글',4,'cafe',1,NULL,NULL,NULL,NULL),(26,14,1,'2023-03-28 10:06:50','2023-03-28 13:45:23','헬스장','3',2,'gym',NULL,NULL,1,NULL,NULL),(28,14,1,'2023-03-28 10:06:50','2023-03-28 13:45:23','도서관글','도서관',3,'library',NULL,NULL,NULL,NULL,1),(29,13,1,'2023-03-28 12:04:41','2023-03-28 13:45:23','개미집인데 개미를 안팜','이름 사기임?',1,'diner',NULL,1,NULL,NULL,NULL),(30,7,9,'2023-03-28 14:14:46','2023-03-28 14:27:15','설렁설렁하자@','설렁 탕탕탕!\r\n설렁 탕탕탕!\r\n설렁 탕탕탕!설렁 탕탕탕!설렁 탕탕탕!\r\n설렁 탕탕탕!설렁 탕탕탕!',4,'diner',NULL,9,NULL,NULL,NULL),(31,13,64,'2023-03-28 14:28:12','2023-03-29 15:19:06','고기집인데 절 옆에 있음 ','근데 산 옆에 있음 ㅋㅋㅋ',1,'diner',NULL,64,NULL,NULL,NULL),(33,14,86,'2023-03-28 15:06:56','2023-03-28 15:06:56','찹쌀 아구찜, 찹쌀 떡 , 콩떡 ','그대는 찹쌀떡 그대는 나의 메밀국수\r\n그대는 나의 땅콩 오징어 노가리\r\n그대는 해장국 그대는 나의그대는 찹쌀떡 그대는 나의 메밀국수\r\n그대는 나의 땅콩 오징어 노가리\r\n그대는 해장국 그대는 나의그대는 찹쌀떡 그대는 나의 메밀국수\r\n그대는 나의 땅콩 오징어 노가리\r\n그대는 해장국 그대는 나의',1,'diner',NULL,86,NULL,NULL,NULL),(34,14,6,'2023-03-28 15:12:03','2023-03-28 15:12:03','가가가!!','가가가!!가가가!!가가가!!가가가!!',2,'diner',NULL,6,NULL,NULL,NULL),(35,14,72,'2023-03-28 15:13:16','2023-03-28 16:26:08','정림3층석탑수정','나는 사랑이 어떻게 이뤄지는지 연구했지\r\n12312321',4,'diner',NULL,72,NULL,NULL,NULL),(36,15,1,'2023-03-29 10:24:12','2023-03-29 10:24:25','아아아ㅎㅎ','123123ㅎㅎㅎ',1,'diner',NULL,1,NULL,NULL,NULL),(38,13,107,'2023-03-29 15:18:19','2023-04-03 09:20:25','한정식 맛있네요!! ','무궁무궁',1,'diner',NULL,107,NULL,NULL,NULL),(39,13,1,'2023-03-29 16:10:11','2023-03-29 16:10:11','작성작성','작성작성',1,'diner',NULL,1,NULL,NULL,NULL),(48,13,79,'2023-03-29 16:42:14','2023-04-03 12:10:34','특별하지 않은 식당 !!','맛없어요',1,'diner',NULL,79,NULL,NULL,NULL),(49,13,1,'2023-03-30 11:50:40','2023-03-30 11:50:40','머야머야','1234123',1,'cafe',1,NULL,NULL,NULL,NULL),(50,13,2,'2023-03-30 11:52:11','2023-03-30 11:52:11','삼정타워 카페 리뷰 ','1241231232132',5,'cafe',2,NULL,NULL,NULL,NULL),(51,13,3,'2023-03-30 15:33:47','2023-04-03 12:24:29','산속에 있어용','차 마시지 좋음',1,'hall',NULL,NULL,NULL,3,NULL),(52,7,99,'2023-03-30 16:27:49','2023-04-03 09:17:57','빨강망토 재미없어요','빨강망토 지루해\r\n빨강망토 지루해',1,'hall',NULL,NULL,NULL,99,NULL),(53,17,102,'2023-04-03 09:19:04','2023-04-03 09:19:04','웅장합니다 !! ','이순신 짱',5,'hall',NULL,NULL,NULL,102,NULL),(54,17,76,'2023-04-03 09:19:26','2023-04-03 09:19:26','맛나는 감자탕','맛나 맛나!',3,'diner',NULL,76,NULL,NULL,NULL),(55,13,2,'2023-04-03 11:53:06','2023-04-03 11:53:06','광안리 대교보면서 회먹어요','좋아용',4,'diner',NULL,2,NULL,NULL,NULL),(56,13,10,'2023-04-03 11:54:46','2023-04-03 11:54:46','메소포타미아 4대문명이죠 ','4대문명은 강과 관련이 있따',4,'hall',NULL,NULL,NULL,10,NULL),(57,13,2,'2023-04-03 11:56:34','2023-04-03 12:06:13','바가지 씌였어요','비추!!! 생선에 물 먹이고 무게 늘림',1,'diner',NULL,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-04  9:15:52
