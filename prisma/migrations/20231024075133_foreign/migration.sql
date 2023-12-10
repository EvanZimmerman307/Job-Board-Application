-- AddForeignKey
ALTER TABLE `MobileNumber` ADD CONSTRAINT `MobileNumber_candidateId_fkey` FOREIGN KEY (`candidateId`) REFERENCES `Candidate`(`candidateId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CompanySpecialty` ADD CONSTRAINT `CompanySpecialty_companyID_fkey` FOREIGN KEY (`companyID`) REFERENCES `Company`(`companyID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `JobPosting` ADD CONSTRAINT `JobPosting_companyID_fkey` FOREIGN KEY (`companyID`) REFERENCES `Company`(`companyID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `JobPostingSkill` ADD CONSTRAINT `JobPostingSkill_jobID_fkey` FOREIGN KEY (`jobID`) REFERENCES `JobPosting`(`jobID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `JobPostingBenefit` ADD CONSTRAINT `JobPostingBenefit_jobID_fkey` FOREIGN KEY (`jobID`) REFERENCES `JobPosting`(`jobID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Post` ADD CONSTRAINT `Post_jobID_fkey` FOREIGN KEY (`jobID`) REFERENCES `JobPosting`(`jobID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Post` ADD CONSTRAINT `Post_companyID_fkey` FOREIGN KEY (`companyID`) REFERENCES `Company`(`companyID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CandidateSkill` ADD CONSTRAINT `CandidateSkill_candidateID_fkey` FOREIGN KEY (`candidateID`) REFERENCES `Candidate`(`candidateId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Application` ADD CONSTRAINT `Application_candidateID_fkey` FOREIGN KEY (`candidateID`) REFERENCES `Candidate`(`candidateId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Application` ADD CONSTRAINT `Application_jobID_fkey` FOREIGN KEY (`jobID`) REFERENCES `JobPosting`(`jobID`) ON DELETE RESTRICT ON UPDATE CASCADE;
