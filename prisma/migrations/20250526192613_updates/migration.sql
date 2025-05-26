/*
  Warnings:

  - You are about to drop the `complaint` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `supportrequest` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `complaint` DROP FOREIGN KEY `Complaint_userId_fkey`;

-- DropForeignKey
ALTER TABLE `supportrequest` DROP FOREIGN KEY `SupportRequest_handledById_fkey`;

-- DropForeignKey
ALTER TABLE `supportrequest` DROP FOREIGN KEY `SupportRequest_userId_fkey`;

-- DropTable
DROP TABLE `complaint`;

-- DropTable
DROP TABLE `supportrequest`;

-- CreateTable
CREATE TABLE `Complaint` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` ENUM('VIOLENCE', 'DISCRIMINATION', 'THREAT', 'OTHER') NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `location` VARCHAR(191) NULL,
    `eventDate` DATETIME(3) NULL,
    `attachmentUrl` VARCHAR(191) NULL,
    `status` ENUM('RECEIVED', 'IN_REVIEW', 'FORWARDED', 'COMPLETED') NOT NULL DEFAULT 'RECEIVED',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `adminResponse` VARCHAR(191) NULL,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SupportRequest` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` ENUM('JURIDICO', 'PSICOLOGICO') NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `status` ENUM('RECEIVED', 'IN_REVIEW', 'FORWARDED', 'COMPLETED') NOT NULL DEFAULT 'RECEIVED',
    `userId` INTEGER NOT NULL,
    `handledById` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Complaint` ADD CONSTRAINT `Complaint_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SupportRequest` ADD CONSTRAINT `SupportRequest_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SupportRequest` ADD CONSTRAINT `SupportRequest_handledById_fkey` FOREIGN KEY (`handledById`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
