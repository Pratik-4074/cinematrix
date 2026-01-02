-- CreateEnum
CREATE TYPE "InteractionType" AS ENUM ('CLICK', 'WATCHLIST', 'SEARCH', 'WATCHED');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "avatarUrl" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Movie" (
    "id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "originalTitle" TEXT NOT NULL,
    "overview" TEXT,
    "tagline" TEXT,
    "status" TEXT,
    "releaseDate" TIMESTAMP(3),
    "runtime" INTEGER,
    "budget" INTEGER,
    "revenue" INTEGER,
    "adult" BOOLEAN NOT NULL DEFAULT false,
    "homepage" TEXT,
    "imdbId" TEXT,
    "originalLanguage" TEXT NOT NULL,
    "popularity" DOUBLE PRECISION,
    "voteAverage" DOUBLE PRECISION,
    "voteCount" INTEGER,
    "posterPath" TEXT,
    "backdropPath" TEXT,

    CONSTRAINT "Movie_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TVShow" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "numberOfSeasons" INTEGER,
    "numberOfEpisodes" INTEGER,
    "originalLanguage" TEXT NOT NULL,
    "voteCount" INTEGER,
    "voteAverage" DOUBLE PRECISION,
    "overview" TEXT,
    "adult" BOOLEAN NOT NULL DEFAULT false,
    "backdropPath" TEXT,
    "firstAirDate" TIMESTAMP(3),
    "lastAirDate" TIMESTAMP(3),
    "homepage" TEXT,
    "inProduction" BOOLEAN NOT NULL,
    "originalName" TEXT NOT NULL,
    "popularity" DOUBLE PRECISION,
    "posterPath" TEXT,
    "type" TEXT,
    "status" TEXT,
    "tagline" TEXT,
    "episodeRunTime" INTEGER,

    CONSTRAINT "TVShow_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Person" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "originalName" TEXT NOT NULL,
    "knownForDepartment" TEXT NOT NULL,
    "gender" INTEGER,
    "adult" BOOLEAN NOT NULL,
    "popularity" DOUBLE PRECISION,
    "profilePath" TEXT,

    CONSTRAINT "Person_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Creator" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Creator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Genre" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Genre_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MovieGenre" (
    "movieId" INTEGER NOT NULL,
    "genreId" INTEGER NOT NULL,

    CONSTRAINT "MovieGenre_pkey" PRIMARY KEY ("movieId","genreId")
);

-- CreateTable
CREATE TABLE "TVShowGenre" (
    "tvShowId" INTEGER NOT NULL,
    "genreId" INTEGER NOT NULL,

    CONSTRAINT "TVShowGenre_pkey" PRIMARY KEY ("tvShowId","genreId")
);

-- CreateTable
CREATE TABLE "Keyword" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Keyword_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MovieKeyword" (
    "movieId" INTEGER NOT NULL,
    "keywordId" INTEGER NOT NULL,

    CONSTRAINT "MovieKeyword_pkey" PRIMARY KEY ("movieId","keywordId")
);

-- CreateTable
CREATE TABLE "Language" (
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Language_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "MovieSpokenLanguage" (
    "movieId" INTEGER NOT NULL,
    "languageCode" TEXT NOT NULL,

    CONSTRAINT "MovieSpokenLanguage_pkey" PRIMARY KEY ("movieId","languageCode")
);

-- CreateTable
CREATE TABLE "TVShowSpokenLanguage" (
    "tvShowId" INTEGER NOT NULL,
    "languageCode" TEXT NOT NULL,

    CONSTRAINT "TVShowSpokenLanguage_pkey" PRIMARY KEY ("tvShowId","languageCode")
);

-- CreateTable
CREATE TABLE "TVShowLanguage" (
    "tvShowId" INTEGER NOT NULL,
    "languageCode" TEXT NOT NULL,

    CONSTRAINT "TVShowLanguage_pkey" PRIMARY KEY ("tvShowId","languageCode")
);

-- CreateTable
CREATE TABLE "ProductionCompany" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ProductionCompany_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MovieProductionCompany" (
    "movieId" INTEGER NOT NULL,
    "companyId" INTEGER NOT NULL,

    CONSTRAINT "MovieProductionCompany_pkey" PRIMARY KEY ("movieId","companyId")
);

-- CreateTable
CREATE TABLE "TVShowProductionCompany" (
    "tvShowId" INTEGER NOT NULL,
    "companyId" INTEGER NOT NULL,

    CONSTRAINT "TVShowProductionCompany_pkey" PRIMARY KEY ("tvShowId","companyId")
);

-- CreateTable
CREATE TABLE "ProductionCountry" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ProductionCountry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OriginCountry" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "OriginCountry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MovieProductionCountry" (
    "movieId" INTEGER NOT NULL,
    "countryId" INTEGER NOT NULL,

    CONSTRAINT "MovieProductionCountry_pkey" PRIMARY KEY ("movieId","countryId")
);

-- CreateTable
CREATE TABLE "TVShowProductionCountry" (
    "tvShowId" INTEGER NOT NULL,
    "countryId" INTEGER NOT NULL,

    CONSTRAINT "TVShowProductionCountry_pkey" PRIMARY KEY ("tvShowId","countryId")
);

-- CreateTable
CREATE TABLE "TVShowOriginCountry" (
    "tvShowId" INTEGER NOT NULL,
    "countryId" INTEGER NOT NULL,

    CONSTRAINT "TVShowOriginCountry_pkey" PRIMARY KEY ("tvShowId","countryId")
);

-- CreateTable
CREATE TABLE "Network" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Network_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TVShowNetwork" (
    "tvShowId" INTEGER NOT NULL,
    "networkId" INTEGER NOT NULL,

    CONSTRAINT "TVShowNetwork_pkey" PRIMARY KEY ("tvShowId","networkId")
);

-- CreateTable
CREATE TABLE "MovieCast" (
    "movieId" INTEGER NOT NULL,
    "personId" INTEGER NOT NULL,
    "castId" INTEGER NOT NULL,
    "character" TEXT,
    "castOrder" INTEGER,

    CONSTRAINT "MovieCast_pkey" PRIMARY KEY ("movieId","personId")
);

-- CreateTable
CREATE TABLE "MovieDirector" (
    "movieId" INTEGER NOT NULL,
    "personId" INTEGER NOT NULL,

    CONSTRAINT "MovieDirector_pkey" PRIMARY KEY ("movieId","personId")
);

-- CreateTable
CREATE TABLE "TVShowCast" (
    "tvShowId" INTEGER NOT NULL,
    "personId" INTEGER NOT NULL,
    "character" TEXT,
    "castOrder" INTEGER,

    CONSTRAINT "TVShowCast_pkey" PRIMARY KEY ("tvShowId","personId")
);

-- CreateTable
CREATE TABLE "TVShowCreator" (
    "tvShowId" INTEGER NOT NULL,
    "creatorId" INTEGER NOT NULL,

    CONSTRAINT "TVShowCreator_pkey" PRIMARY KEY ("tvShowId","creatorId")
);

-- CreateTable
CREATE TABLE "MovieFeature" (
    "movieId" INTEGER NOT NULL,
    "featureVector" BYTEA NOT NULL,
    "modelVersion" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MovieFeature_pkey" PRIMARY KEY ("movieId")
);

-- CreateTable
CREATE TABLE "TVShowFeature" (
    "tvShowId" INTEGER NOT NULL,
    "featureVector" BYTEA NOT NULL,
    "modelVersion" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TVShowFeature_pkey" PRIMARY KEY ("tvShowId")
);

-- CreateTable
CREATE TABLE "Rating" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "movieId" INTEGER,
    "tvShowId" INTEGER,
    "rating" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Rating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Watchlist" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Watchlist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WatchlistMovie" (
    "watchlistId" TEXT NOT NULL,
    "movieId" INTEGER NOT NULL,

    CONSTRAINT "WatchlistMovie_pkey" PRIMARY KEY ("watchlistId","movieId")
);

-- CreateTable
CREATE TABLE "WatchlistTVShow" (
    "watchlistId" TEXT NOT NULL,
    "tvShowId" INTEGER NOT NULL,

    CONSTRAINT "WatchlistTVShow_pkey" PRIMARY KEY ("watchlistId","tvShowId")
);

-- CreateTable
CREATE TABLE "UserInteraction" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "movieId" INTEGER,
    "tvShowId" INTEGER,
    "type" "InteractionType" NOT NULL,
    "value" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserInteraction_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "MovieGenre" ADD CONSTRAINT "MovieGenre_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieGenre" ADD CONSTRAINT "MovieGenre_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES "Genre"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowGenre" ADD CONSTRAINT "TVShowGenre_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowGenre" ADD CONSTRAINT "TVShowGenre_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES "Genre"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieKeyword" ADD CONSTRAINT "MovieKeyword_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieKeyword" ADD CONSTRAINT "MovieKeyword_keywordId_fkey" FOREIGN KEY ("keywordId") REFERENCES "Keyword"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieSpokenLanguage" ADD CONSTRAINT "MovieSpokenLanguage_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieSpokenLanguage" ADD CONSTRAINT "MovieSpokenLanguage_languageCode_fkey" FOREIGN KEY ("languageCode") REFERENCES "Language"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowSpokenLanguage" ADD CONSTRAINT "TVShowSpokenLanguage_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowSpokenLanguage" ADD CONSTRAINT "TVShowSpokenLanguage_languageCode_fkey" FOREIGN KEY ("languageCode") REFERENCES "Language"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowLanguage" ADD CONSTRAINT "TVShowLanguage_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowLanguage" ADD CONSTRAINT "TVShowLanguage_languageCode_fkey" FOREIGN KEY ("languageCode") REFERENCES "Language"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieProductionCompany" ADD CONSTRAINT "MovieProductionCompany_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieProductionCompany" ADD CONSTRAINT "MovieProductionCompany_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "ProductionCompany"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowProductionCompany" ADD CONSTRAINT "TVShowProductionCompany_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowProductionCompany" ADD CONSTRAINT "TVShowProductionCompany_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "ProductionCompany"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieProductionCountry" ADD CONSTRAINT "MovieProductionCountry_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieProductionCountry" ADD CONSTRAINT "MovieProductionCountry_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "ProductionCountry"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowProductionCountry" ADD CONSTRAINT "TVShowProductionCountry_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowProductionCountry" ADD CONSTRAINT "TVShowProductionCountry_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "ProductionCountry"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowOriginCountry" ADD CONSTRAINT "TVShowOriginCountry_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowOriginCountry" ADD CONSTRAINT "TVShowOriginCountry_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "OriginCountry"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowNetwork" ADD CONSTRAINT "TVShowNetwork_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowNetwork" ADD CONSTRAINT "TVShowNetwork_networkId_fkey" FOREIGN KEY ("networkId") REFERENCES "Network"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieCast" ADD CONSTRAINT "MovieCast_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieCast" ADD CONSTRAINT "MovieCast_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Person"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieDirector" ADD CONSTRAINT "MovieDirector_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieDirector" ADD CONSTRAINT "MovieDirector_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Person"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowCast" ADD CONSTRAINT "TVShowCast_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowCast" ADD CONSTRAINT "TVShowCast_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Person"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowCreator" ADD CONSTRAINT "TVShowCreator_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowCreator" ADD CONSTRAINT "TVShowCreator_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES "Creator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieFeature" ADD CONSTRAINT "MovieFeature_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TVShowFeature" ADD CONSTRAINT "TVShowFeature_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rating" ADD CONSTRAINT "Rating_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rating" ADD CONSTRAINT "Rating_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rating" ADD CONSTRAINT "Rating_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Watchlist" ADD CONSTRAINT "Watchlist_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WatchlistMovie" ADD CONSTRAINT "WatchlistMovie_watchlistId_fkey" FOREIGN KEY ("watchlistId") REFERENCES "Watchlist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WatchlistMovie" ADD CONSTRAINT "WatchlistMovie_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WatchlistTVShow" ADD CONSTRAINT "WatchlistTVShow_watchlistId_fkey" FOREIGN KEY ("watchlistId") REFERENCES "Watchlist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WatchlistTVShow" ADD CONSTRAINT "WatchlistTVShow_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserInteraction" ADD CONSTRAINT "UserInteraction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserInteraction" ADD CONSTRAINT "UserInteraction_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserInteraction" ADD CONSTRAINT "UserInteraction_tvShowId_fkey" FOREIGN KEY ("tvShowId") REFERENCES "TVShow"("id") ON DELETE SET NULL ON UPDATE CASCADE;
