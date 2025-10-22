-- MySQL dump 10.13  Distrib 9.4.0, for macos15.4 (arm64)
--
-- Host: localhost    Database: auctionx
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `history_lelang`
--

DROP TABLE IF EXISTS `history_lelang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history_lelang` (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `id_lelang` int NOT NULL,
  `id_barang` int NOT NULL,
  `id_user` int NOT NULL,
  `penawaran_harga` int NOT NULL,
  PRIMARY KEY (`id_history`),
  KEY `id_barang` (`id_barang`),
  KEY `id_user` (`id_user`),
  KEY `id_lelang` (`id_lelang`),
  CONSTRAINT `history_lelang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE,
  CONSTRAINT `history_lelang_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_masyarakat` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `history_lelang_ibfk_3` FOREIGN KEY (`id_lelang`) REFERENCES `tb_lelang` (`id_lelang`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_lelang`
--

LOCK TABLES `history_lelang` WRITE;
/*!40000 ALTER TABLE `history_lelang` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_lelang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_barang`
--

DROP TABLE IF EXISTS `tb_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_barang` (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tgl` date NOT NULL,
  `harga_awal` int NOT NULL,
  `deskripsi_barang` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_barang`
--

LOCK TABLES `tb_barang` WRITE;
/*!40000 ALTER TABLE `tb_barang` DISABLE KEYS */;
INSERT INTO `tb_barang` VALUES (11,'Mazda MX-5 RF','2023-05-09',240000,'Nimble two-seat open-top with a folding metal roof'),(12,'Nissan GT-R','2023-05-13',900000,'Brutally quick coupe can cope with everyday use'),(13,'Porsche 911','2023-05-12',790000,'A brilliant sports car that easily slots into your daily routine'),(14,'MITSUBISHI PAJERO','2025-10-18',700000,'GC-422-13\r\n234,879\r\nVLUP6X20009078685\r\nPLATINUM BEIGE\r\nDVLA - 10/30/25\r\nInsurance - 9/28/26'),(15,'Mitsubishi Pajero','2025-10-22',25000,'Registration: GC-422-13\r\nYear: 2003\r\nMilieage: 234,879\r\nFaults: To be repaired\r\n');
/*!40000 ALTER TABLE `tb_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_lelang`
--

DROP TABLE IF EXISTS `tb_lelang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_lelang` (
  `id_lelang` int NOT NULL AUTO_INCREMENT,
  `id_barang` int NOT NULL,
  `tgl_dibuka` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_ditutup` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `harga_akhir` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `id_petugas` int NOT NULL,
  `status` enum('dibuka','ditutup') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_lelang`),
  KEY `id_barang` (`id_barang`),
  KEY `id_user` (`id_user`),
  KEY `id_petugas` (`id_petugas`),
  CONSTRAINT `tb_lelang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`) ON DELETE CASCADE,
  CONSTRAINT `tb_lelang_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_masyarakat` (`id_user`),
  CONSTRAINT `tb_lelang_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`id_petugas`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_lelang`
--

LOCK TABLES `tb_lelang` WRITE;
/*!40000 ALTER TABLE `tb_lelang` DISABLE KEYS */;
INSERT INTO `tb_lelang` VALUES (11,11,'2023-05-09 10:04:00','2023-05-24 10:04:00',0,NULL,1,'dibuka'),(12,12,'2023-05-13 10:06:00','2023-05-27 10:06:00',0,NULL,1,'dibuka'),(13,13,'2023-05-12 10:06:00','2023-05-23 10:06:00',0,NULL,1,'dibuka'),(14,14,'2025-10-18 05:05:00','2025-10-19 17:05:00',0,NULL,1,'ditutup'),(15,15,'2025-10-22 00:00:00','2025-10-31 12:00:00',0,NULL,4,'dibuka');
/*!40000 ALTER TABLE `tb_lelang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_level`
--

DROP TABLE IF EXISTS `tb_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_level` (
  `id_level` int NOT NULL AUTO_INCREMENT,
  `level` enum('administrator','petugas') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_level`
--

LOCK TABLES `tb_level` WRITE;
/*!40000 ALTER TABLE `tb_level` DISABLE KEYS */;
INSERT INTO `tb_level` VALUES (1,'administrator'),(2,'petugas');
/*!40000 ALTER TABLE `tb_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_masyarakat`
--

DROP TABLE IF EXISTS `tb_masyarakat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_masyarakat` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `telp` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_masyarakat`
--

LOCK TABLES `tb_masyarakat` WRITE;
/*!40000 ALTER TABLE `tb_masyarakat` DISABLE KEYS */;
INSERT INTO `tb_masyarakat` VALUES (8,'Daniel Kumah','hanson','$2y$12$sRkguIhAPPcvRp21Ygloyu3YEg58IKsONVD1ZMf.nyII27Nlg.j0C','0241309090');
/*!40000 ALTER TABLE `tb_masyarakat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_petugas`
--

DROP TABLE IF EXISTS `tb_petugas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_petugas` (
  `id_petugas` int NOT NULL AUTO_INCREMENT,
  `nama_petugas` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_level` int NOT NULL,
  PRIMARY KEY (`id_petugas`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `id_level` (`id_level`),
  CONSTRAINT `tb_petugas_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_petugas`
--

LOCK TABLES `tb_petugas` WRITE;
/*!40000 ALTER TABLE `tb_petugas` DISABLE KEYS */;
INSERT INTO `tb_petugas` VALUES (1,'admin','admin','$2y$12$sRkguIhAPPcvRp21Ygloyu3YEg58IKsONVD1ZMf.nyII27Nlg.j0C',2),(4,'Hanson','hanson','$2y$12$QxnzdRnZ9QfaCt3Xviunv.TmWpFnkaLsEo7NS/89i6QHqFHVLaK46',1);
/*!40000 ALTER TABLE `tb_petugas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-22 10:31:44
