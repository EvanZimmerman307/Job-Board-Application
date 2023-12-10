-- CreateTable
CREATE TABLE `MobileNumber` (
    `mobileNumberId` VARCHAR(191) NOT NULL,
    `number` VARCHAR(191) NOT NULL,
    `candidateId` VARCHAR(191) NOT NULL,

    INDEX `MobileNumber_candidateId_idx`(`candidateId`),
    PRIMARY KEY (`mobileNumberId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
