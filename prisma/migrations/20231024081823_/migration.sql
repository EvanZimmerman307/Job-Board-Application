-- DropForeignKey
ALTER TABLE `Application` DROP FOREIGN KEY `Application_candidateID_fkey`;

-- DropForeignKey
ALTER TABLE `Application` DROP FOREIGN KEY `Application_jobID_fkey`;

-- DropForeignKey
ALTER TABLE `CandidateSkill` DROP FOREIGN KEY `CandidateSkill_candidateID_fkey`;

-- DropForeignKey
ALTER TABLE `CompanySpecialty` DROP FOREIGN KEY `CompanySpecialty_companyID_fkey`;

-- DropForeignKey
ALTER TABLE `JobPosting` DROP FOREIGN KEY `JobPosting_companyID_fkey`;

-- DropForeignKey
ALTER TABLE `JobPostingBenefit` DROP FOREIGN KEY `JobPostingBenefit_jobID_fkey`;

-- DropForeignKey
ALTER TABLE `JobPostingSkill` DROP FOREIGN KEY `JobPostingSkill_jobID_fkey`;

-- DropForeignKey
ALTER TABLE `MobileNumber` DROP FOREIGN KEY `MobileNumber_candidateId_fkey`;
