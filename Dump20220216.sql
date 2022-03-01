-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: furniturestore
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `idcustomer` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `adress` blob,
  `personalnumber` blob,
  `telephone` blob,
  `email` varchar(45) DEFAULT NULL,
  `cardnumber` blob,
  PRIMARY KEY (`idcustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (3,'Toros','Crypto',_binary '˝æ\Œ\Ïq}\ZØä\Â•\"\⁄\’',_binary '\…ﬂö»ìA\'ú\À\≈\√\›e1B',_binary '®@#ex%\Ô≥\'\ÏA- ≤','coin@email.com',_binary '5DÉZã\Ì˙®àå¢\–u:\Œ\«SAÛ u{J°øØ\ƒ.'),(4,'Musse','Pigg',_binary ':∂™>£§Û^yuQﬂ™\ÿ',_binary '\Â0ha≤ª$>É>\›u\…Q',_binary '˝\“_H⁄≤É\ 7ñ->\À','musse@email.com',_binary '∆û®ˆFÉí¿d∫o=\«SAÛ u{J°øØ\ƒ.'),(5,'Long','Ben',_binary '}á„±ãª%ÄIx\„Iè´ëÜ',_binary 'Mñ\Œ\„êt8˛\Ÿ ó\›B',_binary '\ \Ëg\nx∂ø^!´æÆ','long@email.com',_binary '\÷\ÿu˝Ùz\·≥∫…ØG°\«SAÛ u{J°øØ\ƒ.');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customerallpurchases`
--

DROP TABLE IF EXISTS `customerallpurchases`;
/*!50001 DROP VIEW IF EXISTS `customerallpurchases`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerallpurchases` AS SELECT 
 1 AS `FKcustomer`,
 1 AS `firstname`,
 1 AS `surname`,
 1 AS `idcustomer`,
 1 AS `totalPurchase`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `delieverydate` date NOT NULL,
  `delieverd` varchar(45) DEFAULT 'NO',
  `FKpurchaseorder` int DEFAULT NULL,
  `idorder` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idorder`),
  KEY `FKpurchaseorder_idx` (`FKpurchaseorder`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('2022-02-18','NO',NULL,1),('2022-02-25','NO',1,2),('2022-02-25','NO',5,3),('2022-02-25','NO',10,4),('2022-02-25','NO',15,5),('2022-02-25','NO',16,6),('2022-02-25','NO',20,7),('2022-02-26','NO',22,8),('2022-02-26','NO',23,9);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersnotdelieverd`
--

DROP TABLE IF EXISTS `ordersnotdelieverd`;
/*!50001 DROP VIEW IF EXISTS `ordersnotdelieverd`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersnotdelieverd` AS SELECT 
 1 AS `idpurchaseorder`,
 1 AS `purchaseorderdate`,
 1 AS `orderamount`,
 1 AS `quantity`,
 1 AS `FKcustomer`,
 1 AS `FKpurchaseorder`,
 1 AS `delieverydate`,
 1 AS `delieverd`,
 1 AS `adress`,
 1 AS `telephone`,
 1 AS `firstname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `FKidpurchase` int DEFAULT NULL,
  `payment` varchar(45) DEFAULT 'CASH',
  KEY `FKpurchaseorder_idx` (`FKidpurchase`),
  CONSTRAINT `FKidpurchase` FOREIGN KEY (`FKidpurchase`) REFERENCES `purchaseorder` (`idpurchaseorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'CASH'),(2,'CASH'),(3,'CASH'),(4,'CASH'),(5,'CASH'),(6,'CASH'),(7,'CASH'),(8,'CASH'),(9,'CASH'),(10,'CASH'),(11,'CASH'),(12,'CASH'),(13,'CASH'),(14,'CASH'),(15,'CASH'),(16,'CASH'),(17,'CASH'),(18,'CASH'),(19,'CASH'),(20,'CARD'),(21,'INTERNET'),(22,'INTERNET'),(23,'INTERNET');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idproducts` int NOT NULL AUTO_INCREMENT,
  `productname` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `stockstatus` int NOT NULL,
  `price` int NOT NULL,
  `supplierprice` int NOT NULL,
  `supplier` int NOT NULL,
  PRIMARY KEY (`idproducts`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'fluffig','matta',8,300,150,1),(2,'fyrkantig','bord',5,900,450,1),(3,'mjuk','sang',4,5000,2500,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorder` (
  `idpurchaseorder` int NOT NULL,
  `purchaseorderdate` date NOT NULL,
  `delieverydate` date NOT NULL,
  `quantity` int NOT NULL,
  `orderamount` int NOT NULL,
  `FKseller` int DEFAULT NULL,
  `FKproduct` int DEFAULT NULL,
  `FKcustomer` int DEFAULT NULL,
  PRIMARY KEY (`idpurchaseorder`),
  UNIQUE KEY `idpurchaseorder_UNIQUE` (`idpurchaseorder`),
  KEY `seller_idx` (`FKseller`),
  KEY `product_idx` (`FKproduct`),
  KEY `customer_idx` (`FKcustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES (1,'2022-02-15','2022-02-18',1,5000,8,3,3),(2,'2022-02-15','2022-02-18',10,50000,8,3,3),(3,'2022-02-15','2022-02-18',10,50000,8,3,3),(4,'2022-02-15','2022-02-18',1,5000,8,3,3),(5,'2022-02-15','2022-02-18',1,5000,8,3,3),(6,'2022-02-15','2022-02-18',8,40000,8,3,3),(7,'2022-02-15','2022-02-18',5,25000,8,3,3),(8,'2022-02-15','2022-02-25',5,25000,8,3,3),(9,'2022-02-15','2022-02-18',5,25000,8,3,3),(10,'2022-02-15','2022-02-25',6,30000,8,3,3),(11,'2022-02-15','2022-02-18',1,5000,9,3,3),(12,'2022-02-15','2022-02-18',1,5000,10,3,3),(13,'2022-02-15','2022-02-18',1,5000,9,3,4),(14,'2022-02-15','2022-02-18',1,5000,9,3,5),(15,'2022-02-15','2022-02-25',1,5000,9,3,5),(16,'2022-02-15','2022-02-25',20,100000,9,3,5),(17,'2022-02-15','2022-02-18',1,5000,9,3,5),(18,'2022-02-15','2022-02-18',1,900,9,2,5),(19,'2022-02-15','2022-02-18',1,300,9,1,5),(20,'2022-02-15','2022-02-25',8,2400,9,1,5),(21,'2022-02-16','2022-02-19',8,7200,9,2,5),(22,'2022-02-16','2022-02-26',8,7200,9,2,5),(23,'2022-02-16','2022-02-26',5,4500,9,2,5);
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `purchaseorderwithproductinfo`
--

DROP TABLE IF EXISTS `purchaseorderwithproductinfo`;
/*!50001 DROP VIEW IF EXISTS `purchaseorderwithproductinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `purchaseorderwithproductinfo` AS SELECT 
 1 AS `idpurchaseorder`,
 1 AS `purchaseorderdate`,
 1 AS `quantity`,
 1 AS `orderamount`,
 1 AS `FKproduct`,
 1 AS `idproducts`,
 1 AS `productname`,
 1 AS `category`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `purchasewithorderandsupplieorder`
--

DROP TABLE IF EXISTS `purchasewithorderandsupplieorder`;
/*!50001 DROP VIEW IF EXISTS `purchasewithorderandsupplieorder`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `purchasewithorderandsupplieorder` AS SELECT 
 1 AS `idpurchaseorder`,
 1 AS `purchaseorderdate`,
 1 AS `POdelievery`,
 1 AS `quantity`,
 1 AS `POidproduct`,
 1 AS `idPorder`,
 1 AS `Odelievery`,
 1 AS `delieverd`,
 1 AS `idsupplieorder`,
 1 AS `supplieorderdate`,
 1 AS `SOdelievery`,
 1 AS `SOidproduct`,
 1 AS `productname`,
 1 AS `category`,
 1 AS `idproducts`,
 1 AS `FKorder`,
 1 AS `idorder`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `idstaff` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `adress` blob,
  `personalnumber` blob,
  `telephone` blob,
  `email` varchar(45) NOT NULL,
  `jobrole` varchar(45) NOT NULL DEFAULT 'seller',
  PRIMARY KEY (`idstaff`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (8,'Kalle','Anka',_binary 'Lú\'\’˘\¬«ómc\ÈLy∏\‡',_binary 'Pπ<\”\À\rÍ¶¥ûQ™õgbÆ',_binary ' Ωv[j´âî\Ô\Âß8\Á§','anka@email.com','seller'),(9,'Boll','Plank',_binary '†⁄£*¯E•éPƒÉ\ŒÒ\’;',_binary 'd]{\≈á£¿Ük∫0o',_binary ')ÙwªxÙRMˇ\‰mVA^','boll@email.com','seller');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplieorder`
--

DROP TABLE IF EXISTS `supplieorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplieorder` (
  `idsupplieorder` int NOT NULL,
  `supplieorderdate` date DEFAULT NULL,
  `delieverydate` date DEFAULT NULL,
  `quantity` int NOT NULL,
  `orderamount` int NOT NULL,
  `supplierprice` int NOT NULL,
  `card` int DEFAULT NULL,
  `FKbuyer` int DEFAULT NULL,
  `FKproduct` int DEFAULT NULL,
  `FKsupplier` int DEFAULT NULL,
  `FKorder` int DEFAULT NULL,
  PRIMARY KEY (`idsupplieorder`),
  UNIQUE KEY `idsupplieorder_UNIQUE` (`idsupplieorder`),
  KEY `FKbuyer_idx` (`FKbuyer`),
  KEY `FKproduct_idx` (`FKproduct`),
  KEY `FKsupplier_idx` (`FKsupplier`),
  KEY `FKorder_idx` (`FKorder`),
  CONSTRAINT `FKbuyer` FOREIGN KEY (`FKbuyer`) REFERENCES `staff` (`idstaff`),
  CONSTRAINT `FKorder` FOREIGN KEY (`FKorder`) REFERENCES `orders` (`idorder`),
  CONSTRAINT `FKproduct` FOREIGN KEY (`FKproduct`) REFERENCES `products` (`idproducts`),
  CONSTRAINT `FKsupplier` FOREIGN KEY (`FKsupplier`) REFERENCES `supplier` (`idsupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplieorder`
--

LOCK TABLES `supplieorder` WRITE;
/*!40000 ALTER TABLE `supplieorder` DISABLE KEYS */;
INSERT INTO `supplieorder` VALUES (1,'2022-02-15','2022-02-22',10,25000,2500,25000,8,3,1,NULL),(2,'2022-02-15','2022-02-22',10,25000,2500,25000,8,3,1,NULL),(3,'2022-02-15','2022-02-22',10,25000,2500,25000,8,3,1,NULL),(4,'2022-02-15','2022-02-22',10,25000,2500,25000,8,3,1,2),(5,'2022-02-15','2022-02-22',10,25000,2500,25000,8,3,1,3),(6,'2022-02-15','2022-02-22',5,12500,2500,12500,8,3,1,4),(7,'2022-02-15','2022-02-22',5,12500,2500,12500,8,3,1,5),(8,'2022-02-15','2022-02-22',21,52500,2500,52500,8,3,1,6),(9,'2022-02-15','2022-02-22',9,1350,150,1350,8,1,1,7),(10,'2022-02-16','2022-02-23',2,900,450,900,8,2,1,NULL),(11,'2022-02-16','2022-02-23',9,4050,450,4050,8,2,1,8),(12,'2022-02-16','2022-02-23',6,2700,450,2700,8,2,1,9);
/*!40000 ALTER TABLE `supplieorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idsupplier` int NOT NULL AUTO_INCREMENT,
  `companyname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Bord AB','bord@email.com','07022500121');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'furniturestore'
--
/*!50003 DROP PROCEDURE IF EXISTS `newCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newCustomer`(in firstname varchar(40), surname varchar(40), 
adress varchar(50), personalnumber bigint, telephone bigint, email varchar(40),
cardnumber bigint)
BEGIN
set @salt = 'salt';
set @key = 'key';
set @personalnumber = aes_encrypt(concat(personalnumber, @salt), @key);
set @adress = aes_encrypt(adress, @key);
set @telephone = aes_encrypt(telephone, @key);
set @cardnumber = aes_encrypt(cardnumber, @key);
insert into customer(firstname, surname, adress, personalnumber, telephone, email
, cardnumber)
values(firstname, surname, @adress, @personalnumber, @telephone, email, @cardnumber);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newStaff`(in firstname varchar(40), surname varchar(40), 
adress varchar(50), personalnumber bigint, telephone bigint, email varchar(40))
BEGIN
set @salt = 'salt';
set @key = 'key';
set @personalnumber = aes_encrypt(concat(personalnumber, @salt), @key);
set @adress = aes_encrypt(adress, @key);
set @telephone = aes_encrypt(telephone, @key);

insert into staff(firstname, surname, adress, personalnumber, telephone, email)
values(firstname, surname, @adress, @personalnumber, @telephone, email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `order`(in delieverydate date, delieverd varchar(50))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK; 
    END;
start transaction;
select @idpurchaseorder:=max(idpurchaseorder) from purchaseorder;
insert into orders(delieverydate, delieverd, FKpurchaseorder)
values(delieverydate, delieverd, @idpurchaseorder);
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `purchaseorder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `purchaseorder`(
in purchaseorderdate date, quantity int, payment varchar(40), FKseller int, FKproduct int , FKcustomer int)
BEGIN
-- DECLARE EXIT HANDLER FOR SQLEXCEPTION
-- BEGIN
  -- ROLLBACK; 
-- END;
start transaction;
select @idpurchaseorder:=max(idpurchaseorder)+1 from purchaseorder;
-- controlling stock
set @stockstatus = (select stockstatus from products where idproducts = FKproduct);

if (@stockstatus - quantity < 0) then
set @quantity = quantity + 1;
set @delieverydate = purchaseorderdate + 10;
set @price = (select (price) from products where FKproduct = idproducts);
set @orderamount = @price * quantity;
insert into purchaseorder(idpurchaseorder, purchaseorderdate, delieverydate, quantity, orderamount, FKseller, FKproduct, FKcustomer)
values(@idpurchaseorder, purchaseorderdate, @delieverydate, quantity, @orderamount, FKseller, FKproduct, FKcustomer);
insert into payment(payment, FKidpurchase)
values (payment, @idpurchaseorder);
update products set stockstatus = stockstatus - quantity where idproducts = FKproduct;
call furniturestore.order(@delieverydate, 'NO');
call furniturestore.supplieorder(purchaseorderdate, @quantity,'8', FKproduct,'1');
end if;

set @delieverydate = purchaseorderdate + 3;
set @price = (select (price) from products where FKproduct = idproducts);
set @orderamount = @price * quantity;
insert into purchaseorder(idpurchaseorder, purchaseorderdate, delieverydate, quantity, orderamount, FKseller, FKproduct, FKcustomer)
values(@idpurchaseorder, purchaseorderdate, @delieverydate, quantity, @orderamount, FKseller, FKproduct, FKcustomer);
insert into payment(payment, FKidpurchase)
values (payment, @idpurchaseorder);
update products set stockstatus = stockstatus - quantity where idproducts = FKproduct;

commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `supplieorder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `supplieorder`(in supplieorderdate date, quantity int, FKbuyer int, Fkproduct int, 
FKsupplier int)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK; 
END;
start transaction;
set @delieverydate = supplieorderdate + 7;
set @supplierprice = (select (supplierprice) from products where FKproduct = idproducts);
set @orderamount = @supplierprice * quantity;
set @cardPayment = @orderamount;
select @idsupplieorder:=max(idsupplieorder)+1 from supplieorder;
select @FKorder:=max(idorder) from orders;
insert into supplieorder(idsupplieorder, supplieorderdate, delieverydate, quantity, orderamount, supplierprice, card, FKbuyer, FKproduct, FKsupplier, FKorder)
values(@idsupplieorder, supplieorderdate, @delieverydate, quantity, @orderamount, @supplierprice, @cardPayment, FKbuyer, FKproduct, FKsupplier, @FKorder);

-- update stockstatus
select @quantity:=max(quantity) from supplieorder where idsupplieorder = @idsupplieorder;
select @FKproduct:=max(FKproduct) from supplieorder where idsupplieorder = @idsupplieorder;
update products set stockstatus = stockstatus + @quantity where idproducts = @FKproduct;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewCustomers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `viewCustomers`()
BEGIN
set @key = 'key';
set @salt = 'salt';
select idcustomer, firstname, surname, cast(aes_decrypt(adress, @key) as char(100))
as adress, replace(cast(aes_decrypt(personalnumber, @key) as char(100)), @salt, '')
as personalnumber, cast(aes_decrypt(telephone, @key) as char(100))
as telephone, email, cast(aes_decrypt(cardnumber, @key) as char(100))
as cardnumber from customer;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `viewStaff`()
BEGIN
set @key = 'key';
set @salt = 'salt';
select idstaff, firstname, surname, cast(aes_decrypt(adress, @key) as char(100))
as adress, replace(cast(aes_decrypt(personalnumber, @key) as char(100)), @salt, '')
as personalnumber, cast(aes_decrypt(telephone, @key) as char(100))
as telephone, email, jobrole from staff;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customerallpurchases`
--

/*!50001 DROP VIEW IF EXISTS `customerallpurchases`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerallpurchases` AS select `purchaseorder`.`FKcustomer` AS `FKcustomer`,`customer`.`firstname` AS `firstname`,`customer`.`surname` AS `surname`,`customer`.`idcustomer` AS `idcustomer`,sum(`purchaseorder`.`orderamount`) AS `totalPurchase` from (`purchaseorder` join `customer`) where (`purchaseorder`.`FKcustomer` = `customer`.`idcustomer`) group by `purchaseorder`.`FKcustomer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordersnotdelieverd`
--

/*!50001 DROP VIEW IF EXISTS `ordersnotdelieverd`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersnotdelieverd` AS select `purchaseorder`.`idpurchaseorder` AS `idpurchaseorder`,`purchaseorder`.`purchaseorderdate` AS `purchaseorderdate`,`purchaseorder`.`orderamount` AS `orderamount`,`purchaseorder`.`quantity` AS `quantity`,`purchaseorder`.`FKcustomer` AS `FKcustomer`,`orders`.`FKpurchaseorder` AS `FKpurchaseorder`,`orders`.`delieverydate` AS `delieverydate`,`orders`.`delieverd` AS `delieverd`,`customer`.`adress` AS `adress`,`customer`.`telephone` AS `telephone`,`customer`.`firstname` AS `firstname` from ((`purchaseorder` join `orders`) join `customer`) where ((`orders`.`FKpurchaseorder` = `purchaseorder`.`idpurchaseorder`) and (`orders`.`delieverd` = 'NO') and (`purchaseorder`.`FKcustomer` = `customer`.`idcustomer`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `purchaseorderwithproductinfo`
--

/*!50001 DROP VIEW IF EXISTS `purchaseorderwithproductinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `purchaseorderwithproductinfo` AS select `purchaseorder`.`idpurchaseorder` AS `idpurchaseorder`,`purchaseorder`.`purchaseorderdate` AS `purchaseorderdate`,`purchaseorder`.`quantity` AS `quantity`,`purchaseorder`.`orderamount` AS `orderamount`,`purchaseorder`.`FKproduct` AS `FKproduct`,`products`.`idproducts` AS `idproducts`,`products`.`productname` AS `productname`,`products`.`category` AS `category`,`products`.`price` AS `price` from (`purchaseorder` join `products`) where (`purchaseorder`.`FKproduct` = `products`.`idproducts`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `purchasewithorderandsupplieorder`
--

/*!50001 DROP VIEW IF EXISTS `purchasewithorderandsupplieorder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `purchasewithorderandsupplieorder` AS select `purchaseorder`.`idpurchaseorder` AS `idpurchaseorder`,`purchaseorder`.`purchaseorderdate` AS `purchaseorderdate`,`purchaseorder`.`delieverydate` AS `POdelievery`,`purchaseorder`.`quantity` AS `quantity`,`purchaseorder`.`FKproduct` AS `POidproduct`,`orders`.`FKpurchaseorder` AS `idPorder`,`orders`.`delieverydate` AS `Odelievery`,`orders`.`delieverd` AS `delieverd`,`supplieorder`.`idsupplieorder` AS `idsupplieorder`,`supplieorder`.`supplieorderdate` AS `supplieorderdate`,`supplieorder`.`delieverydate` AS `SOdelievery`,`supplieorder`.`FKproduct` AS `SOidproduct`,`products`.`productname` AS `productname`,`products`.`category` AS `category`,`products`.`idproducts` AS `idproducts`,`supplieorder`.`FKorder` AS `FKorder`,`orders`.`idorder` AS `idorder` from (((`purchaseorder` join `orders`) join `supplieorder`) join `products`) where ((`purchaseorder`.`idpurchaseorder` = `orders`.`FKpurchaseorder`) and (`orders`.`idorder` = `supplieorder`.`FKorder`) and (`purchaseorder`.`FKproduct` = `products`.`idproducts`)) group by `supplieorder`.`idsupplieorder` */;
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

-- Dump completed on 2022-02-16 11:27:37
