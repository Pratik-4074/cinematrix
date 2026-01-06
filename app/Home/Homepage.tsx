"use client";

import React, { useState } from "react";
import { Play } from "lucide-react";
import Navbar from "../components/navbar";

/* ---------- Types ---------- */
interface Movie {
  id: number;
  title: string;
  genre: string;
  rating: number;
  releaseDate: string;
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
      title: "Good Bad Ugly",
      genre: "Adventure",
      rating: 8.5,
      releaseDate: "2025",
      image:
        "https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=300&h=450&fit=crop",
    },
    {
      id: 2,
      title: "Dragon",
      genre: "Drama/Romance",
      rating: 8.0,
      releaseDate: "2024",
      image:
        "https://images.unsplash.com/photo-1594908900066-3f47337549d8?w=300&h=450&fit=crop",
    },
    {
      id: 3,
      title: "NEEK",
      genre: "Drama/Romance",
      rating: 8.0,
      releaseDate: "2023",
      image:
        "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=300&h=450&fit=crop",
    },
    {
      id: 4,
      title: "Kadhalikka Neramillai",
      genre: "Drama/Romance",
      rating: 8.0,
      releaseDate: "2022",
      image:
        "https://images.unsplash.com/photo-1518676590629-3dcbd9c5a5c9?w=300&h=450&fit=crop",
    },
    {
      id: 5,
      title: "Good Bad Ugly",
      genre: "Adventure",
      rating: 8.5,
      releaseDate: "2021",
      image:
        "https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=300&h=450&fit=crop",
    },
    {
      id: 6,
      title: "Dragon",
      genre: "Drama/Romance",
      rating: 8.0,
      releaseDate: "2020",
      image:
        "https://images.unsplash.com/photo-1594908900066-3f47337549d8?w=300&h=450&fit=crop",
    },
    {
      id: 7,
      title: "NEEK",
      genre: "Drama/Romance",
      rating: 8.0,
      releaseDate: "2019",
      image:
        "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=300&h=450&fit=crop",
    },
    {
      id: 8,
      title: "Kadhalikka Neramillai",
      genre: "Drama/Romance",
      rating: 8.0,
      releaseDate: "2018",
      image:
        "https://images.unsplash.com/photo-1518676590629-3dcbd9c5a5c9?w=300&h=450&fit=crop",
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
      <p className="text-xs text-gray-400">{movie.genre}</p>
      <div className="flex items-center gap-1 text-yellow-400 text-sm">
        ★ {movie.rating}
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
  const [searchQuery, setSearchQuery] = useState("");

  return (
    <div className="min-h-screen bg-black text-white">
      <Navbar />

      {/* Hero */}
      <section className="text-center py-20 px-4">
        <h1 className="text-4xl md:text-5xl font-bold leading-tight">
          Experience <span className="text-red-600">Cinema</span> Like Never
          Before
        </h1>
        <p className="text-gray-400 max-w-2xl mx-auto mt-4 text-sm">
          Join our community of film enthusiasts to discover, review, discuss,
          and celebrate the art of cinema. From blockbuster hits to indie gems,
          explore stories that captivate and inspire.
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
{/* Recommended (Horizontal Scroll) */}
<section className="max-w-7xl mx-auto px-4 py-16">
  <h2 className="text-2xl font-bold text-center mb-2">
    Recommended for you
  </h2>
  <p className="text-center text-gray-400 text-sm mb-8">
    Discover the Recommended Movies in Cinematrix
  </p>

  {/* Horizontal Poster Scroll */}
  <div className="
    flex gap-6 overflow-x-auto scroll-smooth pb-6
    snap-x snap-mandatory no-scrollbar
  ">
    {moviesData.recommended.map((movie) => (
      <div
        key={movie.id}
        className="min-w-[220px] max-w-[220px] shrink-0 snap-start"
      >
        <MovieCard movie={movie} />
      </div>
    ))}
  </div>

  <div className="text-center mt-10">
    <button className="border border-gray-600 px-6 py-2 rounded hover:border-red-600 hover:text-red-500 transition">
      View All
    </button>
  </div>
</section>



      {/* Categories */}
      <section className="max-w-7xl mx-auto px-4 py-16">
        <h2 className="text-2xl font-bold text-center mb-2">
          Movie Categories
        </h2>
        <p className="text-center text-gray-400 text-sm mb-8">
          Explore our extensive collection of films organized by genre
        </p>

        <div className="grid grid-cols-2 md:grid-cols-3 gap-6">
          {moviesData.categories.map((category, index) => (
            <CategoryCard key={index} category={category} />
          ))}
        </div>

        <div className="text-center mt-8">
          <button className="border border-gray-600 px-6 py-2 rounded hover:border-red-600 hover:text-red-500 transition">
            View All
          </button>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-gray-800 mt-20 py-10 px-4">
        <div className="max-w-7xl mx-auto grid md:grid-cols-3 gap-8 text-sm">
          <div>
            <h3 className="font-bold mb-2">CineMatrix</h3>
            <p className="text-gray-400">
              Your premier destination for cinema lovers.
            </p>
          </div>

          <div>
            <h4 className="font-semibold mb-2">Quick Links</h4>
            <ul className="text-gray-400 space-y-1">
              <li>Home</li>
              <li>Movies</li>
              <li>TV Shows</li>
              <li>Submit Review</li>
            </ul>
          </div>

          <div>
            <h4 className="font-semibold mb-2">Categories</h4>
            <ul className="text-gray-400 space-y-1">
              <li>Action</li>
              <li>Romance</li>
              <li>Drama</li>
              <li>Sci-Fi</li>
            </ul>
          </div>

          
        </div>
      </footer>
    </div>
  );
}
