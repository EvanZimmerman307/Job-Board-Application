/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `Candidate` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `email` to the `Candidate` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Candidate` ADD COLUMN `email` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Candidate_email_key` ON `Candidate`(`email`);
