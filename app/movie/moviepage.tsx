"use client";

import { useState } from "react";
import Navbar from "../components/navbar";
import Footercomponent from "../components/footer";
import { Star } from "lucide-react";

const movies = [
  {
    id: 1,
    title: "Inception",
    genre: "Sci-Fi",
    rating: 8.8,
    releaseDate: 2010,
    image:
      "https://image.tmdb.org/t/p/w500/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg",
  },
  {
    id: 2,
    title: "Titanic",
    genre: "Romance",
    rating: 7.9,
    releaseDate: 1997,
    image:
      "https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
  },
  {
    id: 3,
    title: "Forrest Gump",
    genre: "Drama",
    rating: 8.8,
    releaseDate: 1994,
    image:
      "https://image.tmdb.org/t/p/w500/saHP97rTPS5eLmrLQEcANmKrsFl.jpg",
  },
  {
    id: 4,
    title: "Dune",
    genre: "Sci-Fi",
    rating: 8.0,
    releaseDate: 2021,
    image:
      "https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
  },
  {
    id: 5,
    title: "The Conjuring",
    genre: "Horror",
    rating: 7.5,
    releaseDate: 2013,
    image:
      "https://image.tmdb.org/t/p/w500/wVYREutTvI2tmxr6ujrHT704wGF.jpg",
  },
  {
    id: 6,
    title: "Get Out",
    genre: "Horror",
    rating: 7.8,
    releaseDate: 2017,
    image:
      "https://image.tmdb.org/t/p/w500/qbaqA2m6rH6cHn9d2VYfKEQk.jpg",
  },
  {
    id: 7,
    title: "The Hangover",
    genre: "Comedy",
    rating: 7.7,
    releaseDate: 2009,
    image:
      "https://image.tmdb.org/t/p/w500/uluhlXubGu1VxU63X9VHCLWDAYP.jpg",
  },
  {
    id: 8,
    title: "Superbad",
    genre: "Comedy",
    rating: 7.6,
    releaseDate: 2007,
    image:
      "https://image.tmdb.org/t/p/w500/ek8e8txUyUwd2BNqj6lFEerJfbq.jpg",
  },
  {
    id: 9,
    title: "The Dark Knight",
    genre: "Action",
    rating: 9.0,
    releaseDate: 2008,
    image:
      "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
  },
  {
    id: 10,
    title: "Interstellar",
    genre: "Sci-Fi",
    rating: 8.6,
    releaseDate: 2014,
    image:
      "https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
  },
  {
    id: 11,
    title: "Joker",
    genre: "Crime",
    rating: 8.4,
    releaseDate: 2019,
    image:
      "https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
  },
  {
    id: 12,
    title: "Parasite",
    genre: "Thriller",
    rating: 8.6,
    releaseDate: 2019,
    image:
      "https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
  },
  {
    id: 13,
    title: "It",
    genre: "Horror",
    rating: 7.3,
    releaseDate: 2017,
    image:
      "https://image.tmdb.org/t/p/w500/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg",
  },
  {
    id: 14,
    title: "Deadpool",
    genre: "Comedy",
    rating: 8.0,
    releaseDate: 2016,
    image:
      "https://image.tmdb.org/t/p/w500/inVq3FRqcYIRl2la8iZikYYxFNR.jpg",
  },
];

const genres = [
  "All Movies",
  "Drama",
  "Romance",
  "Sci-Fi",
  "Horror",
  "Comedy",
  "Action",
];

export default function Moviepage() {
  const [activeGenre, setActiveGenre] = useState("All Movies");
  const [showAll, setShowAll] = useState(false);

  const filteredMovies =
    activeGenre === "All Movies"
      ? movies
      : movies.filter((movie) => movie.genre === activeGenre);

  const displayedMovies = showAll
    ? filteredMovies
    : filteredMovies.slice(0, 12);

  return (
    <div className="bg-black min-h-screen text-white">
      {/* Fixed Navbar */}
      <div className="fixed top-0 left-0 w-full z-50 bg-black/80 backdrop-blur-md">
        <Navbar />
      </div>

      {/* Page Content */}
      <main className="pt-20">
        <section className="px-6 py-16">
          <div className="max-w-7xl mx-auto">
            <h1 className="text-4xl md:text-5xl font-bold">
              Discover Your Favorite{" "}
              <span className="text-red-600">Movie</span> Like Never Before
            </h1>

            <p className="text-gray-400 mt-4 max-w-xl">
              Experience your favorite movie a new, with fresh eyes and deeper
              meaning like never before.
            </p>

            {/* Genres */}
            <div className="flex flex-wrap gap-3 mt-10">
              {genres.map((genre) => (
                <button
                  key={genre}
                  onClick={() => {
                    setActiveGenre(genre);
                    setShowAll(false);
                  }}
                  className={`px-5 py-2 rounded-xl border text-sm transition
                    ${
                      activeGenre === genre
                        ? "bg-red-600 border-red-600 text-white"
                        : "border-gray-600 text-gray-300 hover:border-white"
                    }`}
                >
                  {genre}
                </button>
              ))}
            </div>

            {/* Movies */}
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6 mt-12">
              {displayedMovies.map((movie) => (
                <div
                  key={movie.id}
                  className="bg-zinc-900 rounded-2xl overflow-hidden hover:scale-[1.03] transition"
                >
                  <img
                    src={movie.image}
                    alt={movie.title}
                    className="h-64 w-full object-cover"
                  />

                  <div className="p-4">
                    <h3 className="font-semibold text-lg">{movie.title}</h3>

                    <p className="text-sm text-gray-400">
                      {movie.genre} • {movie.releaseDate}
                    </p>

                    <div className="mt-3 flex items-center gap-1 text-yellow-400">
                      <Star size={16} className="fill-current" />
                      <span className="text-sm font-medium">
                        {movie.rating}
                      </span>
                    </div>
                  </div>
                </div>
              ))}
            </div>

            {/* View All */}
            {filteredMovies.length > 12 && (
              <div className="flex justify-center mt-14">
                <button
                  onClick={() => setShowAll(!showAll)}
                  className="px-6 py-2 border border-gray-500 rounded-full hover:bg-white hover:text-black transition"
                >
                  {showAll ? "Show Less" : "View All"}
                </button>
              </div>
            )}
          </div>
        </section>

        
      </main>
      <Footercomponent />
    </div>
  );
}
