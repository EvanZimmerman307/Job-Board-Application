/*
  Warnings:

  - The primary key for the `Application` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Candidate` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `candidateID` on the `Candidate` table. All the data in the column will be lost.
  - The primary key for the `CandidateSkill` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `candidateSkills` on the `CandidateSkill` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `CandidateSkill` table. All the data in the column will be lost.
  - The primary key for the `Company` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `CompanySpecialty` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `CompanySpecialty` table. All the data in the column will be lost.
  - The primary key for the `JobPosting` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `postJobID` on the `JobPosting` table. All the data in the column will be lost.
  - The primary key for the `JobPostingBenefit` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `benefits` on the `JobPostingBenefit` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `JobPostingBenefit` table. All the data in the column will be lost.
  - The primary key for the `JobPostingSkill` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `JobPostingSkill` table. All the data in the column will be lost.
  - You are about to drop the column `jobSkills` on the `JobPostingSkill` table. All the data in the column will be lost.
  - The primary key for the `MobileNumber` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `candidateID` on the `MobileNumber` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `MobileNumber` table. All the data in the column will be lost.
  - You are about to drop the column `mobileNumber` on the `MobileNumber` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `Candidate` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[specialty]` on the table `CompanySpecialty` will be added. If there are existing duplicate values, this will fail.
  - The required column `candidateId` was added to the `Candidate` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `email` to the `Candidate` table without a default value. This is not possible if the table is not empty.
  - Added the required column `passwordHash` to the `Candidate` table without a default value. This is not possible if the table is not empty.
  - Added the required column `skill` to the `CandidateSkill` table without a default value. This is not possible if the table is not empty.
  - Added the required column `companyID` to the `JobPosting` table without a default value. This is not possible if the table is not empty.
  - Added the required column `benefit` to the `JobPostingBenefit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `skill` to the `JobPostingSkill` table without a default value. This is not possible if the table is not empty.
  - Added the required column `candidateId` to the `MobileNumber` table without a default value. This is not possible if the table is not empty.
  - The required column `mobileNumberId` was added to the `MobileNumber` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `number` to the `MobileNumber` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Application_applicationID_key` ON `Application`;

-- DropIndex
DROP INDEX `Candidate_candidateID_key` ON `Candidate`;

-- DropIndex
DROP INDEX `Company_companyID_key` ON `Company`;

-- DropIndex
DROP INDEX `JobPosting_jobID_key` ON `JobPosting`;

-- DropIndex
DROP INDEX `JobPosting_postJobID_key` ON `JobPosting`;

-- DropIndex
DROP INDEX `MobileNumber_candidateID_idx` ON `MobileNumber`;

-- DropIndex
DROP INDEX `Post_jobID_key` ON `Post`;

-- AlterTable
ALTER TABLE `Application` DROP PRIMARY KEY,
    MODIFY `applicationID` VARCHAR(191) NOT NULL,
    MODIFY `jobID` VARCHAR(191) NOT NULL,
    MODIFY `candidateID` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`applicationID`);

-- AlterTable
ALTER TABLE `Candidate` DROP PRIMARY KEY,
    DROP COLUMN `candidateID`,
    ADD COLUMN `candidateId` VARCHAR(191) NOT NULL,
    ADD COLUMN `email` VARCHAR(191) NOT NULL,
    ADD COLUMN `passwordHash` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`candidateId`);

-- AlterTable
ALTER TABLE `CandidateSkill` DROP PRIMARY KEY,
    DROP COLUMN `candidateSkills`,
    DROP COLUMN `id`,
    ADD COLUMN `skill` VARCHAR(191) NOT NULL,
    MODIFY `candidateID` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`candidateID`);

-- AlterTable
ALTER TABLE `Company` DROP PRIMARY KEY,
    MODIFY `companyID` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`companyID`);

-- AlterTable
ALTER TABLE `CompanySpecialty` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    MODIFY `companyID` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `JobPosting` DROP PRIMARY KEY,
    DROP COLUMN `postJobID`,
    ADD COLUMN `companyID` VARCHAR(191) NOT NULL,
    MODIFY `jobID` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`jobID`);

-- AlterTable
ALTER TABLE `JobPostingBenefit` DROP PRIMARY KEY,
    DROP COLUMN `benefits`,
    DROP COLUMN `id`,
    ADD COLUMN `benefit` VARCHAR(191) NOT NULL,
    MODIFY `jobID` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`jobID`);

-- AlterTable
ALTER TABLE `JobPostingSkill` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `jobSkills`,
    ADD COLUMN `skill` VARCHAR(191) NOT NULL,
    MODIFY `jobID` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`jobID`);

-- AlterTable
ALTER TABLE `MobileNumber` DROP PRIMARY KEY,
    DROP COLUMN `candidateID`,
    DROP COLUMN `id`,
    DROP COLUMN `mobileNumber`,
    ADD COLUMN `candidateId` VARCHAR(191) NOT NULL,
    ADD COLUMN `mobileNumberId` VARCHAR(191) NOT NULL,
    ADD COLUMN `number` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`mobileNumberId`);

-- AlterTable
ALTER TABLE `Post` MODIFY `jobID` VARCHAR(191) NOT NULL,
    MODIFY `companyID` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`jobID`);

-- CreateIndex
CREATE UNIQUE INDEX `Candidate_email_key` ON `Candidate`(`email`);

-- CreateIndex
CREATE UNIQUE INDEX `CompanySpecialty_specialty_key` ON `CompanySpecialty`(`specialty`);

-- CreateIndex
CREATE INDEX `JobPosting_companyID_idx` ON `JobPosting`(`companyID`);

-- CreateIndex
CREATE INDEX `MobileNumber_candidateId_idx` ON `MobileNumber`(`candidateId`);

-- CreateIndex
CREATE INDEX `Post_jobID_idx` ON `Post`(`jobID`);
