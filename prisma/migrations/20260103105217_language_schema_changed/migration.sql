/*
  Warnings:

  - The primary key for the `MovieSpokenLanguage` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `languageCode` on the `MovieSpokenLanguage` table. All the data in the column will be lost.
  - The primary key for the `TVShowSpokenLanguage` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `languageCode` on the `TVShowSpokenLanguage` table. All the data in the column will be lost.
  - Added the required column `languageId` to the `MovieSpokenLanguage` table without a default value. This is not possible if the table is not empty.
  - Added the required column `languageId` to the `TVShowSpokenLanguage` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "MovieSpokenLanguage" DROP CONSTRAINT "MovieSpokenLanguage_languageCode_fkey";

-- DropForeignKey
ALTER TABLE "TVShowSpokenLanguage" DROP CONSTRAINT "TVShowSpokenLanguage_languageCode_fkey";

-- AlterTable
ALTER TABLE "MovieSpokenLanguage" DROP CONSTRAINT "MovieSpokenLanguage_pkey",
DROP COLUMN "languageCode",
ADD COLUMN     "languageId" INTEGER NOT NULL,
ADD CONSTRAINT "MovieSpokenLanguage_pkey" PRIMARY KEY ("movieId", "languageId");

-- AlterTable
ALTER TABLE "TVShowSpokenLanguage" DROP CONSTRAINT "TVShowSpokenLanguage_pkey",
DROP COLUMN "languageCode",
ADD COLUMN     "languageId" INTEGER NOT NULL,
ADD CONSTRAINT "TVShowSpokenLanguage_pkey" PRIMARY KEY ("tvShowId", "languageId");

-- CreateTable
CREATE TABLE "spokenLanguage" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "spokenLanguage_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MovieSpokenLanguage" ADD CONSTRAINT "MovieSpokenLanguage_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES "spokenLanguage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowSpokenLanguage" ADD CONSTRAINT "TVShowSpokenLanguage_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES "spokenLanguage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
