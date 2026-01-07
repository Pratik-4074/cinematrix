"use client";

import React, { useState } from "react";
import { Play, Star } from "lucide-react";
import Navbar from "../components/navbar";
import Footercomponent from "../components/footer";

/* ---------- Types ---------- */
interface Movie {
  id: number;
  title: string;
  genre: string;
  rating: number;
  releaseDate: number;
  image: string;
}

interface Category {
  name: string;
  count: number;
}

/* ---------- Data ---------- */
const moviesData: {
  recommended: Movie[];
  categories: Category[];
} = {
  recommended: [
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
  ],
  categories: [
    { name: "Romance", count: 90 },
    { name: "Action", count: 120 },
    { name: "Drama", count: 150 },
    { name: "Sci-Fi", count: 80 },
    { name: "Comedy", count: 70 },
    { name: "Horror", count: 60 },
  ],
};

/* ---------- Components ---------- */
const MovieCard = ({ movie }: { movie: Movie }) => (
  <div className="rounded-xl overflow-hidden bg-[#111] hover:scale-105 transition">
    <img
      src={movie.image}
      alt={movie.title}
      className="h-72 w-full object-cover"
    />

    <div className="p-3">
      <h3 className="font-semibold">{movie.title}</h3>
      <p className="text-xs text-gray-400">
        {movie.genre} • {movie.releaseDate}
      </p>

      <div className="mt-2 flex items-center gap-1 text-yellow-400">
        <Star size={16} className="fill-current" />
        <span className="text-sm font-medium">{movie.rating}</span>
      </div>
    </div>
  </div>
);

const CategoryCard = ({ category }: { category: Category }) => (
  <div className="bg-[#111] border border-gray-700 rounded-xl py-6 text-center hover:border-red-600 transition cursor-pointer">
    <h3 className="font-bold text-lg">{category.name}</h3>
    <p className="text-xs text-gray-400">{category.count} Movies</p>
  </div>
);

/* ---------- Page ---------- */
export default function Homepage() {
  const [showAll, setShowAll] = useState(false);

  return (
    <div className="min-h-screen bg-black text-white">
      {/* Fixed Navbar */}
      <div className="fixed top-0 left-0 w-full z-50 bg-black/80 backdrop-blur-md">
        <Navbar />
      </div>

      <main className="pt-20">
        {/* Hero */}
        <section className="text-center py-20 px-4">
          <h1 className="text-4xl md:text-5xl font-bold">
            Experience <span className="text-red-600">Cinema</span> Like Never
            Before
          </h1>

          <p className="text-gray-400 max-w-2xl mx-auto mt-4 text-sm">
            Discover, review, and celebrate cinema from blockbusters to indie
            gems.
          </p>

          <div className="flex justify-center gap-4 mt-8">
            <button className="bg-red-600 hover:bg-red-700 px-6 py-2 rounded-md flex items-center gap-2">
              <Play size={16} /> Movies
            </button>
            <button className="bg-red-600 hover:bg-red-700 px-6 py-2 rounded-md flex items-center gap-2">
              <Play size={16} /> TV Shows
            </button>
          </div>
        </section>

        {/* Recommended */}
        <section className="max-w-7xl mx-auto px-4 py-16">
          <h2 className="text-2xl font-bold text-center mb-2">
            Recommended for you
          </h2>

          <div
            className={
              showAll
                ? "grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-6"
                : "flex gap-6 overflow-x-auto pb-6 no-scrollbar"
            }
          >
            {moviesData.recommended.map((movie) => (
              <div
                key={movie.id}
                className={
                  showAll
                    ? ""
                    : "min-w-[220px] max-w-[220px] shrink-0"
                }
              >
                <MovieCard movie={movie} />
              </div>
            ))}
          </div>

          <div className="text-center mt-10">
            <button
              onClick={() => setShowAll(!showAll)}
              className="border border-gray-600 px-6 py-2 rounded hover:border-red-600 hover:text-red-500 transition"
            >
              {showAll ? "Show Less" : "View All"}
            </button>
          </div>
        </section>

        {/* Categories */}
        <section className="max-w-7xl mx-auto px-4 py-16">
          <h2 className="text-2xl font-bold text-center mb-8">
            Movie Categories
          </h2>

          <div className="grid grid-cols-2 md:grid-cols-3 gap-6">
            {moviesData.categories.map((category, index) => (
              <CategoryCard key={index} category={category} />
            ))}
          </div>
        </section>

        
      </main>
      <Footercomponent />
    </div>
    
  );
}
