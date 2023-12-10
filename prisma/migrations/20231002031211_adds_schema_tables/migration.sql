-- CreateTable
CREATE TABLE `Company` (
    `companyID` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `industry` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `companySize` VARCHAR(191) NOT NULL,
    `state` VARCHAR(191) NOT NULL,
    `country` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`companyID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CompanySpecialty` (
    `companyID` VARCHAR(191) NOT NULL,
    `specialty` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `CompanySpecialty_specialty_key`(`specialty`),
    INDEX `CompanySpecialty_companyID_idx`(`companyID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `JobPosting` (
    `jobID` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `salary` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `jobPostURL` VARCHAR(191) NOT NULL,
    `location` VARCHAR(191) NOT NULL,
    `experienceLevel` VARCHAR(191) NOT NULL,
    `workType` VARCHAR(191) NOT NULL,
    `companyID` VARCHAR(191) NOT NULL,

    INDEX `JobPosting_companyID_idx`(`companyID`),
    PRIMARY KEY (`jobID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `JobPostingSkill` (
    `jobID` VARCHAR(191) NOT NULL,
    `skill` VARCHAR(191) NOT NULL,

    INDEX `JobPostingSkill_jobID_idx`(`jobID`),
    PRIMARY KEY (`jobID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `JobPostingBenefit` (
    `jobID` VARCHAR(191) NOT NULL,
    `benefit` VARCHAR(191) NOT NULL,

    INDEX `JobPostingBenefit_jobID_idx`(`jobID`),
    PRIMARY KEY (`jobID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Post` (
    `jobID` VARCHAR(191) NOT NULL,
    `companyID` VARCHAR(191) NOT NULL,

    INDEX `Post_jobID_idx`(`jobID`),
    INDEX `Post_companyID_idx`(`companyID`),
    PRIMARY KEY (`jobID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CandidateSkill` (
    `candidateID` VARCHAR(191) NOT NULL,
    `skill` VARCHAR(191) NOT NULL,

    INDEX `CandidateSkill_candidateID_idx`(`candidateID`),
    PRIMARY KEY (`candidateID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Application` (
    `applicationID` VARCHAR(191) NOT NULL,
    `resume` VARCHAR(191) NOT NULL,
    `jobID` VARCHAR(191) NOT NULL,
    `candidateID` VARCHAR(191) NOT NULL,

    INDEX `Application_candidateID_idx`(`candidateID`),
    INDEX `Application_jobID_idx`(`jobID`),
    PRIMARY KEY (`applicationID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
