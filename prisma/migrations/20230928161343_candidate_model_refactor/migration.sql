/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `User`;

-- CreateTable
CREATE TABLE `Candidate` (
    `candidateId` VARCHAR(191) NOT NULL,
    `fullName` VARCHAR(191) NOT NULL,
    `phoneNumber` VARCHAR(191) NOT NULL,
    `passwordHash` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Candidate_phoneNumber_key`(`phoneNumber`),
    PRIMARY KEY (`candidateId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
