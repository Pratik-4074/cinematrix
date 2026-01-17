'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { Play } from 'lucide-react';

import Navbar from '../components/Navbar';
import MovieCard from '../components/MovieCard';
import CategoryCard from '../components/CategoryCard';
import { useAuth } from '@/context/AuthContext';
import { toast } from 'sonner';

import type { Movie } from '../types';

import moviesData from '../data/movie';

const BASE_URL = process.env.NEXT_PUBLIC_BASE_URL;

export default function Homepage() {
    const [showAll, setShowAll] = useState(false);

    useEffect(() => {
        const timer = setTimeout(() => {
            const message = sessionStorage.getItem('toast');
            if (message) {
                toast.success(message, { duration: 3000 });
                sessionStorage.removeItem('toast');
            }
        }, 100);

        return () => clearTimeout(timer);
    }, []);

    const { session, loading, error, refetch } = useAuth();
    const user = session?.user || null;

    const [movies, setMovies] = useState<Movie[] | null>(null);

    useEffect(() => {
        async function getMovies() {
            if (!session) {
                try {
                    const res = await fetch(`${BASE_URL}/api/movies?sort=popular&limit=50`);
                    const { movies } = await res.json();
                    console.log(movies);
                    setMovies(movies);
                } catch (err) {
                    console.error('Error in fetching movies', err);
                }
            }
        }
    }, [session]);

    return (
        <div>
            <div className="fixed top-0 left-0 z-50 w-full">
                <Navbar />
            </div>

            <main className="pt-20">
                <section className="relative flex h-[50vh] items-center justify-center text-center">
                    <div className="bg-liner-to-b absolute inset-0 from-black/10 via-black/5 to-transparent"></div>

                    {/* Hero Image */}
                    <img src="/hero.png" alt="Hero" className="relative max-h-[80%] w-auto opacity-60" />

                    {/* Text */}
                    <div className="absolute z-20 px-6">
                        <h1 className="text-3xl font-bold text-white md:text-4xl">
                            Experience <span className="text-primary">Cinema</span> Like Never Before
                        </h1>
                        <p className="mx-auto mt-3 max-w-2xl text-sm text-gray-200">
                            Discover, review, and celebrate cinema from blockbusters to indie gems.
                        </p>

                        <div className="mt-6 flex justify-center gap-4">
                            <Link href="/movies">
                                <button className="bg-primary hover:bg-primary-hover flex items-center gap-2 rounded-md px-5 py-2 text-sm md:text-base">
                                    <Play size={16} /> Movies
                                </button>
                            </Link>

                            <Link href="/tv-shows">
                                <button className="bg-primary hover:bg-primary-hover flex items-center gap-2 rounded-md px-5 py-2 text-sm md:text-base">
                                    <Play size={16} /> TV Shows
                                </button>
                            </Link>
                        </div>
                    </div>
                </section>

                <section>
                    <h2 className="mb-2 text-center text-2xl font-semibold">Recommended for you</h2>

                    <div
                        className={
                            showAll
                                ? 'scrollbar-hide grid grid-cols-2 gap-6 py-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5'
                                : 'scrollbar-hide flex gap-6 overflow-x-auto py-3 pb-6'
                        }
                    >
                        {moviesData.recommended.map((movie) => (
                            <div key={movie.id} className={showAll ? '' : 'max-w-[220px] min-w-[220px] shrink-0'}>
                                <MovieCard movie={movie} />
                            </div>
                        ))}
                    </div>

                    <div className="mt-10 text-center">
                        <button
                            onClick={() => setShowAll(!showAll)}
                            className="hover:border-primary cursor-pointer rounded border border-gray-600 px-6 py-2 transition hover:text-red-500"
                        >
                            {showAll ? 'Show Less' : 'View All'}
                        </button>
                    </div>
                </section>

                <section className="py-16">
                    <h2 className="mb-8 text-center text-2xl font-semibold">Movie Categories</h2>

                    <div className="grid grid-cols-2 gap-6 md:grid-cols-3">
                        {moviesData.categories.map((category, index) => (
                            <CategoryCard key={index} category={category} />
                        ))}
                    </div>
                </section>
            </main>
        </div>
    );
}
