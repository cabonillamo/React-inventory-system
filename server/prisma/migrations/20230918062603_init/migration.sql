-- CreateTable
CREATE TABLE `User` (
    `idUser` INTEGER NOT NULL AUTO_INCREMENT,
    `RoleId` INTEGER NOT NULL,
    `UserName` VARCHAR(191) NOT NULL,
    `Password` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`idUser`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Role` (
    `idRole` INTEGER NOT NULL AUTO_INCREMENT,
    `RoleName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idRole`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Products` (
    `idProduct` INTEGER NOT NULL AUTO_INCREMENT,
    `KindProductId` INTEGER NOT NULL,
    `EntryTypeId` INTEGER NOT NULL,
    `ProductName` VARCHAR(191) NOT NULL,
    `ProductDescription` VARCHAR(191) NOT NULL,
    `ProductPrice` DOUBLE NOT NULL,
    `ProductCount` INTEGER NOT NULL,
    `UnitMeasure` VARCHAR(191) NOT NULL,
    `InitialInventory` INTEGER NOT NULL,
    `InputQuantity` INTEGER NOT NULL,
    `OutputQuantity` INTEGER NOT NULL,
    `FinalInventory` INTEGER NOT NULL,

    PRIMARY KEY (`idProduct`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `KindProduct` (
    `idKindProduct` INTEGER NOT NULL AUTO_INCREMENT,
    `KindProductName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idKindProduct`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EntryType` (
    `idEntryType` INTEGER NOT NULL AUTO_INCREMENT,
    `EntryTypeName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idEntryType`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_RoleId_fkey` FOREIGN KEY (`RoleId`) REFERENCES `Role`(`idRole`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Products` ADD CONSTRAINT `Products_KindProductId_fkey` FOREIGN KEY (`KindProductId`) REFERENCES `KindProduct`(`idKindProduct`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Products` ADD CONSTRAINT `Products_EntryTypeId_fkey` FOREIGN KEY (`EntryTypeId`) REFERENCES `EntryType`(`idEntryType`) ON DELETE RESTRICT ON UPDATE CASCADE;
