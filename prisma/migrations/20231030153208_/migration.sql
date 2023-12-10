/*
  Warnings:

  - The primary key for the `Application` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `applicationID` on the `Application` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `BigInt`.
  - You are about to alter the column `jobID` on the `Application` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `BigInt`.
  - You are about to alter the column `candidateID` on the `Application` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `BigInt`.
  - The primary key for the `Candidate` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `candidateId` on the `Candidate` table. All the data in the column will be lost.
  - The primary key for the `Company` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `industry` on the `Company` table. All the data in the column will be lost.
  - You are about to alter the column `companyID` on the `Company` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `BigInt`.
  - You are about to drop the `CandidateSkill` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CompanySpecialty` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `JobPosting` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `JobPostingBenefit` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `JobPostingSkill` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MobileNumber` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `candidateID` to the `Candidate` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Application_candidateID_idx` ON `Application`;

-- DropIndex
DROP INDEX `Application_jobID_idx` ON `Application`;

-- AlterTable
ALTER TABLE `Application` DROP PRIMARY KEY,
    MODIFY `applicationID` BIGINT NOT NULL,
    MODIFY `resume` VARCHAR(191) NULL,
    MODIFY `jobID` BIGINT NOT NULL,
    MODIFY `candidateID` BIGINT NOT NULL,
    ADD PRIMARY KEY (`applicationID`);

-- AlterTable
ALTER TABLE `Candidate` DROP PRIMARY KEY,
    DROP COLUMN `candidateId`,
    ADD COLUMN `candidateID` BIGINT NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`candidateID`);

-- AlterTable
ALTER TABLE `Company` DROP PRIMARY KEY,
    DROP COLUMN `industry`,
    MODIFY `companyID` BIGINT NOT NULL,
    MODIFY `description` VARCHAR(191) NULL,
    MODIFY `companySize` VARCHAR(191) NULL,
    MODIFY `state` VARCHAR(191) NULL,
    MODIFY `country` VARCHAR(191) NULL,
    MODIFY `address` VARCHAR(191) NULL,
    ADD PRIMARY KEY (`companyID`);

-- DropTable
DROP TABLE `CandidateSkill`;

-- DropTable
DROP TABLE `CompanySpecialty`;

-- DropTable
DROP TABLE `JobPosting`;

-- DropTable
DROP TABLE `JobPostingBenefit`;

-- DropTable
DROP TABLE `JobPostingSkill`;

-- DropTable
DROP TABLE `MobileNumber`;

-- CreateTable
CREATE TABLE `Company_industries` (
    `companyID` BIGINT NOT NULL,
    `industry` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`companyID`, `industry`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Company_specialties` (
    `companyID` BIGINT NOT NULL,
    `specialty` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`companyID`, `specialty`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `JobPostings` (
    `jobID` BIGINT NOT NULL,
    `companyID` BIGINT NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `salary` DOUBLE NULL,
    `jobPostURL` VARCHAR(191) NULL,
    `location` VARCHAR(191) NULL,
    `experienceLevel` VARCHAR(191) NULL,
    `workType` VARCHAR(191) NULL,

    PRIMARY KEY (`jobID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `JobPostings_jobSkills` (
    `jobID` BIGINT NOT NULL,
    `jobSkills` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`jobID`, `jobSkills`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `JobPostings_benefits` (
    `jobID` BIGINT NOT NULL,
    `benefits` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`jobID`, `benefits`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Candidate_mobileNumber` (
    `candidateID` BIGINT NOT NULL,
    `mobileNumber` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`candidateID`, `mobileNumber`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Candidate_candidateSkills` (
    `candidateID` BIGINT NOT NULL,
    `candidateSkills` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`candidateID`, `candidateSkills`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Company_industries` ADD CONSTRAINT `Company_industries_companyID_fkey` FOREIGN KEY (`companyID`) REFERENCES `Company`(`companyID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Company_specialties` ADD CONSTRAINT `Company_specialties_companyID_fkey` FOREIGN KEY (`companyID`) REFERENCES `Company`(`companyID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `JobPostings` ADD CONSTRAINT `JobPostings_companyID_fkey` FOREIGN KEY (`companyID`) REFERENCES `Company`(`companyID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `JobPostings_jobSkills` ADD CONSTRAINT `JobPostings_jobSkills_jobID_fkey` FOREIGN KEY (`jobID`) REFERENCES `JobPostings`(`jobID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `JobPostings_benefits` ADD CONSTRAINT `JobPostings_benefits_jobID_fkey` FOREIGN KEY (`jobID`) REFERENCES `JobPostings`(`jobID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Candidate_mobileNumber` ADD CONSTRAINT `Candidate_mobileNumber_candidateID_fkey` FOREIGN KEY (`candidateID`) REFERENCES `Candidate`(`candidateID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Candidate_candidateSkills` ADD CONSTRAINT `Candidate_candidateSkills_candidateID_fkey` FOREIGN KEY (`candidateID`) REFERENCES `Candidate`(`candidateID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Application` ADD CONSTRAINT `Application_candidateID_fkey` FOREIGN KEY (`candidateID`) REFERENCES `Candidate`(`candidateID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Application` ADD CONSTRAINT `Application_jobID_fkey` FOREIGN KEY (`jobID`) REFERENCES `JobPostings`(`jobID`) ON DELETE RESTRICT ON UPDATE CASCADE;
