/*
  Warnings:

  - The primary key for the `Application` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `applicationID` on the `Application` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `jobID` on the `Application` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `candidateID` on the `Application` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - The primary key for the `Candidate` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `candidateId` on the `Candidate` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Candidate` table. All the data in the column will be lost.
  - You are about to drop the column `passwordHash` on the `Candidate` table. All the data in the column will be lost.
  - The primary key for the `CandidateSkill` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `skill` on the `CandidateSkill` table. All the data in the column will be lost.
  - You are about to alter the column `candidateID` on the `CandidateSkill` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - The primary key for the `Company` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `companyID` on the `Company` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `companyID` on the `CompanySpecialty` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - The primary key for the `JobPosting` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `companyID` on the `JobPosting` table. All the data in the column will be lost.
  - You are about to alter the column `jobID` on the `JobPosting` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - The primary key for the `JobPostingBenefit` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `benefit` on the `JobPostingBenefit` table. All the data in the column will be lost.
  - You are about to alter the column `jobID` on the `JobPostingBenefit` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - The primary key for the `JobPostingSkill` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `skill` on the `JobPostingSkill` table. All the data in the column will be lost.
  - You are about to alter the column `jobID` on the `JobPostingSkill` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - The primary key for the `MobileNumber` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `candidateId` on the `MobileNumber` table. All the data in the column will be lost.
  - You are about to drop the column `mobileNumberId` on the `MobileNumber` table. All the data in the column will be lost.
  - You are about to drop the column `number` on the `MobileNumber` table. All the data in the column will be lost.
  - The primary key for the `Post` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `jobID` on the `Post` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `companyID` on the `Post` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - A unique constraint covering the columns `[applicationID]` on the table `Application` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[candidateID]` on the table `Candidate` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[companyID]` on the table `Company` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[jobID]` on the table `JobPosting` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[postJobID]` on the table `JobPosting` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[jobID]` on the table `Post` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `candidateID` to the `Candidate` table without a default value. This is not possible if the table is not empty.
  - Added the required column `candidateSkills` to the `CandidateSkill` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `CandidateSkill` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `CompanySpecialty` table without a default value. This is not possible if the table is not empty.
  - Added the required column `postJobID` to the `JobPosting` table without a default value. This is not possible if the table is not empty.
  - Added the required column `benefits` to the `JobPostingBenefit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `JobPostingBenefit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `JobPostingSkill` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jobSkills` to the `JobPostingSkill` table without a default value. This is not possible if the table is not empty.
  - Added the required column `candidateID` to the `MobileNumber` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `MobileNumber` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mobileNumber` to the `MobileNumber` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Candidate_email_key` ON `Candidate`;

-- DropIndex
DROP INDEX `CompanySpecialty_specialty_key` ON `CompanySpecialty`;

-- DropIndex
DROP INDEX `JobPosting_companyID_idx` ON `JobPosting`;

-- DropIndex
DROP INDEX `MobileNumber_candidateId_idx` ON `MobileNumber`;

-- DropIndex
DROP INDEX `Post_jobID_idx` ON `Post`;

-- AlterTable
ALTER TABLE `Application` DROP PRIMARY KEY,
    MODIFY `applicationID` INTEGER NOT NULL,
    MODIFY `jobID` INTEGER NOT NULL,
    MODIFY `candidateID` INTEGER NOT NULL,
    ADD PRIMARY KEY (`applicationID`);

-- AlterTable
ALTER TABLE `Candidate` DROP PRIMARY KEY,
    DROP COLUMN `candidateId`,
    DROP COLUMN `email`,
    DROP COLUMN `passwordHash`,
    ADD COLUMN `candidateID` INTEGER NOT NULL,
    ADD PRIMARY KEY (`candidateID`);

-- AlterTable
ALTER TABLE `CandidateSkill` DROP PRIMARY KEY,
    DROP COLUMN `skill`,
    ADD COLUMN `candidateSkills` VARCHAR(191) NOT NULL,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    MODIFY `candidateID` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Company` DROP PRIMARY KEY,
    MODIFY `companyID` INTEGER NOT NULL,
    ADD PRIMARY KEY (`companyID`);

-- AlterTable
ALTER TABLE `CompanySpecialty` ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    MODIFY `companyID` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `JobPosting` DROP PRIMARY KEY,
    DROP COLUMN `companyID`,
    ADD COLUMN `postJobID` INTEGER NOT NULL,
    MODIFY `jobID` INTEGER NOT NULL,
    ADD PRIMARY KEY (`jobID`);

-- AlterTable
ALTER TABLE `JobPostingBenefit` DROP PRIMARY KEY,
    DROP COLUMN `benefit`,
    ADD COLUMN `benefits` VARCHAR(191) NOT NULL,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    MODIFY `jobID` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `JobPostingSkill` DROP PRIMARY KEY,
    DROP COLUMN `skill`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `jobSkills` VARCHAR(191) NOT NULL,
    MODIFY `jobID` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `MobileNumber` DROP PRIMARY KEY,
    DROP COLUMN `candidateId`,
    DROP COLUMN `mobileNumberId`,
    DROP COLUMN `number`,
    ADD COLUMN `candidateID` INTEGER NOT NULL,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `mobileNumber` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Post` DROP PRIMARY KEY,
    MODIFY `jobID` INTEGER NOT NULL,
    MODIFY `companyID` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Application_applicationID_key` ON `Application`(`applicationID`);

-- CreateIndex
CREATE UNIQUE INDEX `Candidate_candidateID_key` ON `Candidate`(`candidateID`);

-- CreateIndex
CREATE UNIQUE INDEX `Company_companyID_key` ON `Company`(`companyID`);

-- CreateIndex
CREATE UNIQUE INDEX `JobPosting_jobID_key` ON `JobPosting`(`jobID`);

-- CreateIndex
CREATE UNIQUE INDEX `JobPosting_postJobID_key` ON `JobPosting`(`postJobID`);

-- CreateIndex
CREATE INDEX `MobileNumber_candidateID_idx` ON `MobileNumber`(`candidateID`);

-- CreateIndex
CREATE UNIQUE INDEX `Post_jobID_key` ON `Post`(`jobID`);
