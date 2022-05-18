CREATE DATABASE pharmacy_online;
USE pharmacy_online;
CREATE TABLE `pharmacy_online`.`user`(
  `id` BIGINT NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  `passWord` VARCHAR(45) NOT NULL,
  `fullName` VARCHAR(100) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phoneNumber` VARCHAR(15) NOT NULL,
  `creationDate` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC) VISIBLE,
  UNIQUE INDEX `phoneNumber_UNIQUE` (`phoneNumber` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);
CREATE TABLE `pharmacy_online`.`order` (
  `id` BIGINT NOT NULL,
  `grandTotal` DOUBLE NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `creationDate` DATE NOT NULL,
  `userId` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  FOREIGN KEY (`userId`) REFERENCES `user` (`id`));
  CREATE TABLE `pharmacy_online`.`drug` (
  `id` BIGINT NOT NULL,
  `drugName` VARCHAR(100) NOT NULL,
  `drugContent` DOUBLE NOT NULL,
  `quantity` INT NOT NULL,
  `pricePerPill` DOUBLE NOT NULL,
  `dosagePerDay` VARCHAR(200) NOT NULL,
  `usage` VARCHAR(200) NOT NULL,
  `totalDosage5Days` INT NOT NULL,
  `dosageForm` VARCHAR(45) NOT NULL,
  `productionDate` DATE NOT NULL,
  `expirationDate` DATE NOT NULL,
  `note` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);
CREATE TABLE `pharmacy_online`.`order_item` (
  `id` BIGINT NOT NULL,
  `drugId` BIGINT NOT NULL,
  `drugName` VARCHAR(200) NOT NULL,
  `drugContent` DOUBLE NOT NULL,
  `quantity` INT NOT NULL,
  `pricePerPill` DOUBLE NOT NULL,
  `totalPrice` DOUBLE NOT NULL,
  `orderId` BIGINT NOT NULL,
  `creationDate` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
 FOREIGN KEY (`drugId`) REFERENCES `drug` (`id`),
  FOREIGN KEY (`orderId`) REFERENCES `order` (`id`)
 );

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

