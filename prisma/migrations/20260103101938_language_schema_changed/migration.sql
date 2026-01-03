/*
  Warnings:

  - You are about to drop the column `originalLanguage` on the `Movie` table. All the data in the column will be lost.
  - You are about to drop the column `originalLanguage` on the `TVShow` table. All the data in the column will be lost.

*/
-- AlterTable
CREATE SEQUENCE keyword_id_seq;
ALTER TABLE "Keyword" ALTER COLUMN "id" SET DEFAULT nextval('keyword_id_seq');
ALTER SEQUENCE keyword_id_seq OWNED BY "Keyword"."id";

-- AlterTable
ALTER TABLE "Movie" DROP COLUMN "originalLanguage";

-- AlterTable
ALTER TABLE "TVShow" DROP COLUMN "originalLanguage";

-- CreateTable
CREATE TABLE "MovieOriginalLanguage" (
    "movieId" INTEGER NOT NULL,
    "languageCode" TEXT NOT NULL,

    CONSTRAINT "MovieOriginalLanguage_pkey" PRIMARY KEY ("movieId","languageCode")
);

-- CreateTable
CREATE TABLE "TVShowOriginalLanguage" (
    "tvShowId" INTEGER NOT NULL,
    "languageCode" TEXT NOT NULL,

    CONSTRAINT "TVShowOriginalLanguage_pkey" PRIMARY KEY ("tvShowId","languageCode")
);

-- AddForeignKey
ALTER TABLE "MovieOriginalLanguage" ADD CONSTRAINT "MovieOriginalLanguage_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieOriginalLanguage" ADD CONSTRAINT "MovieOriginalLanguage_languageCode_fkey" FOREIGN KEY ("languageCode") REFERENCES "Language"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowOriginalLanguage" ADD CONSTRAINT "TVShowOriginalLanguage_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowOriginalLanguage" ADD CONSTRAINT "TVShowOriginalLanguage_languageCode_fkey" FOREIGN KEY ("languageCode") REFERENCES "Language"("code") ON DELETE RESTRICT ON UPDATE CASCADE;
