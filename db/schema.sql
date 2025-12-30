CREATE TABLE "User" (
  "id" varchar PRIMARY KEY,
  "name" varchar,
  "email" varchar UNIQUE,
  "passwordHash" varchar,
  "avatarUrl" varchar,
  "createdAt" datetime
);

CREATE TABLE "Movie" (
  "id" int PRIMARY KEY,
  "title" varchar,
  "originalTitle" varchar,
  "overview" text,
  "tagline" varchar,
  "status" varchar,
  "releaseDate" datetime,
  "runtime" int,
  "budget" int,
  "revenue" int,
  "adult" boolean,
  "homepage" varchar,
  "imdbId" varchar,
  "originalLanguage" varchar,
  "popularity" float,
  "voteAverage" float,
  "voteCount" int,
  "posterPath" varchar,
  "backdropPath" varchar
);

CREATE TABLE "TVShow" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "numberOfSeasons" int,
  "numberOfEpisodes" int,
  "originalLanguage" varchar,
  "voteCount" int,
  "voteAverage" float,
  "overview" text,
  "adult" boolean,
  "backdropPath" varchar,
  "firstAirDate" datetime,
  "lastAirDate" datetime,
  "homepage" varchar,
  "inProduction" boolean,
  "originalName" varchar,
  "popularity" float,
  "posterPath" varchar,
  "type" varchar,
  "status" varchar,
  "tagline" varchar,
  "episodeRunTime" int
);

CREATE TABLE "Person" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "originalName" varchar,
  "knownForDepartment" varchar,
  "gender" int,
  "adult" boolean,
  "popularity" float,
  "profilePath" varchar
);

CREATE TABLE "Creator" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Genre" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Keyword" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Language" (
  "code" varchar PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "ProductionCompany" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "ProductionCountry" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "OriginCountry" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Network" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "MovieGenre" (
  "movieId" int,
  "genreId" int,
  PRIMARY KEY ("movieId", "genreId")
);

CREATE TABLE "TVShowGenre" (
  "tvShowId" int,
  "genreId" int,
  PRIMARY KEY ("tvShowId", "genreId")
);

CREATE TABLE "MovieKeyword" (
  "movieId" int,
  "keywordId" int,
  PRIMARY KEY ("movieId", "keywordId")
);

CREATE TABLE "MovieSpokenLanguage" (
  "movieId" int,
  "languageCode" varchar,
  PRIMARY KEY ("movieId", "languageCode")
);

CREATE TABLE "TVShowSpokenLanguage" (
  "tvShowId" int,
  "languageCode" varchar,
  PRIMARY KEY ("tvShowId", "languageCode")
);

CREATE TABLE "TVShowLanguage" (
  "tvShowId" int,
  "languageCode" varchar,
  PRIMARY KEY ("tvShowId", "languageCode")
);

CREATE TABLE "MovieProductionCompany" (
  "movieId" int,
  "companyId" int,
  PRIMARY KEY ("movieId", "companyId")
);

CREATE TABLE "TVShowProductionCompany" (
  "tvShowId" int,
  "companyId" int,
  PRIMARY KEY ("tvShowId", "companyId")
);

CREATE TABLE "MovieProductionCountry" (
  "movieId" int,
  "countryId" int,
  PRIMARY KEY ("movieId", "countryId")
);

CREATE TABLE "TVShowProductionCountry" (
  "tvShowId" int,
  "countryId" int,
  PRIMARY KEY ("tvShowId", "countryId")
);

CREATE TABLE "TVShowOriginCountry" (
  "tvShowId" int,
  "countryId" int,
  PRIMARY KEY ("tvShowId", "countryId")
);

CREATE TABLE "TVShowNetwork" (
  "tvShowId" int,
  "networkId" int,
  PRIMARY KEY ("tvShowId", "networkId")
);

CREATE TABLE "MovieCast" (
  "movieId" int,
  "personId" int,
  "castId" int,
  "character" varchar,
  "castOrder" int,
  PRIMARY KEY ("movieId", "personId")
);

CREATE TABLE "MovieDirector" (
  "movieId" int,
  "personId" int,
  PRIMARY KEY ("movieId", "personId")
);

CREATE TABLE "TVShowCast" (
  "tvShowId" int,
  "personId" int,
  "character" varchar,
  "castOrder" int,
  PRIMARY KEY ("tvShowId", "personId")
);

CREATE TABLE "TVShowCreator" (
  "tvShowId" int,
  "creatorId" int,
  PRIMARY KEY ("tvShowId", "creatorId")
);

CREATE TABLE "MovieFeature" (
  "movieId" int PRIMARY KEY,
  "featureVector" bytea,
  "modelVersion" varchar,
  "createdAt" datetime
);

CREATE TABLE "TVShowFeature" (
  "tvShowId" int PRIMARY KEY,
  "featureVector" bytea,
  "modelVersion" varchar,
  "createdAt" datetime
);

CREATE TABLE "Rating" (
  "id" varchar PRIMARY KEY,
  "userId" varchar,
  "movieId" int,
  "tvShowId" int,
  "rating" int,
  "createdAt" datetime
);

CREATE TABLE "Watchlist" (
  "id" varchar PRIMARY KEY,
  "userId" varchar,
  "name" varchar,
  "createdAt" datetime
);

CREATE TABLE "WatchlistMovie" (
  "watchlistId" varchar,
  "movieId" int,
  PRIMARY KEY ("watchlistId", "movieId")
);

CREATE TABLE "WatchlistTVShow" (
  "watchlistId" varchar,
  "tvShowId" int,
  PRIMARY KEY ("watchlistId", "tvShowId")
);

CREATE TABLE "UserInteraction" (
  "id" varchar PRIMARY KEY,
  "userId" varchar,
  "movieId" int,
  "tvShowId" int,
  "type" varchar,
  "value" int,
  "createdAt" datetime
);

ALTER TABLE "MovieGenre" ADD FOREIGN KEY ("movieId") REFERENCES "Movie" ("id");

ALTER TABLE "MovieGenre" ADD FOREIGN KEY ("genreId") REFERENCES "Genre" ("id");

ALTER TABLE "TVShowGenre" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "TVShowGenre" ADD FOREIGN KEY ("genreId") REFERENCES "Genre" ("id");

ALTER TABLE "MovieKeyword" ADD FOREIGN KEY ("movieId") REFERENCES "Movie" ("id");

ALTER TABLE "MovieKeyword" ADD FOREIGN KEY ("keywordId") REFERENCES "Keyword" ("id");

ALTER TABLE "MovieSpokenLanguage" ADD FOREIGN KEY ("movieId") REFERENCES "Movie" ("id");

ALTER TABLE "MovieSpokenLanguage" ADD FOREIGN KEY ("languageCode") REFERENCES "Language" ("code");

ALTER TABLE "TVShowSpokenLanguage" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "TVShowSpokenLanguage" ADD FOREIGN KEY ("languageCode") REFERENCES "Language" ("code");

ALTER TABLE "TVShowLanguage" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "TVShowLanguage" ADD FOREIGN KEY ("languageCode") REFERENCES "Language" ("code");

ALTER TABLE "MovieProductionCompany" ADD FOREIGN KEY ("movieId") REFERENCES "Movie" ("id");

ALTER TABLE "MovieProductionCompany" ADD FOREIGN KEY ("companyId") REFERENCES "ProductionCompany" ("id");

ALTER TABLE "TVShowProductionCompany" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "TVShowProductionCompany" ADD FOREIGN KEY ("companyId") REFERENCES "ProductionCompany" ("id");

ALTER TABLE "MovieProductionCountry" ADD FOREIGN KEY ("movieId") REFERENCES "Movie" ("id");

ALTER TABLE "MovieProductionCountry" ADD FOREIGN KEY ("countryId") REFERENCES "ProductionCountry" ("id");

ALTER TABLE "TVShowProductionCountry" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "TVShowProductionCountry" ADD FOREIGN KEY ("countryId") REFERENCES "ProductionCountry" ("id");

ALTER TABLE "TVShowOriginCountry" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "TVShowOriginCountry" ADD FOREIGN KEY ("countryId") REFERENCES "OriginCountry" ("id");

ALTER TABLE "TVShowNetwork" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "TVShowNetwork" ADD FOREIGN KEY ("networkId") REFERENCES "Network" ("id");

ALTER TABLE "MovieCast" ADD FOREIGN KEY ("movieId") REFERENCES "Movie" ("id");

ALTER TABLE "MovieCast" ADD FOREIGN KEY ("personId") REFERENCES "Person" ("id");

ALTER TABLE "MovieDirector" ADD FOREIGN KEY ("movieId") REFERENCES "Movie" ("id");

ALTER TABLE "MovieDirector" ADD FOREIGN KEY ("personId") REFERENCES "Person" ("id");

ALTER TABLE "TVShowCast" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "TVShowCast" ADD FOREIGN KEY ("personId") REFERENCES "Person" ("id");

ALTER TABLE "TVShowCreator" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "TVShowCreator" ADD FOREIGN KEY ("creatorId") REFERENCES "Creator" ("id");

ALTER TABLE "MovieFeature" ADD FOREIGN KEY ("movieId") REFERENCES "Movie" ("id");

ALTER TABLE "TVShowFeature" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "Rating" ADD FOREIGN KEY ("userId") REFERENCES "User" ("id");

ALTER TABLE "Rating" ADD FOREIGN KEY ("movieId") REFERENCES "Movie" ("id");

ALTER TABLE "Rating" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "Watchlist" ADD FOREIGN KEY ("userId") REFERENCES "User" ("id");

ALTER TABLE "WatchlistMovie" ADD FOREIGN KEY ("watchlistId") REFERENCES "Watchlist" ("id");

ALTER TABLE "WatchlistMovie" ADD FOREIGN KEY ("movieId") REFERENCES "Movie" ("id");

ALTER TABLE "WatchlistTVShow" ADD FOREIGN KEY ("watchlistId") REFERENCES "Watchlist" ("id");

ALTER TABLE "WatchlistTVShow" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");

ALTER TABLE "UserInteraction" ADD FOREIGN KEY ("userId") REFERENCES "User" ("id");

ALTER TABLE "UserInteraction" ADD FOREIGN KEY ("movieId") REFERENCES "Movie" ("id");

ALTER TABLE "UserInteraction" ADD FOREIGN KEY ("tvShowId") REFERENCES "TVShow" ("id");
