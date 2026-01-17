import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { cacheLife } from 'next/cache';

const mapMovie = (movie: any) => ({
    id: movie.id,
    title: movie.title,
    overview: movie.overview,
    tagline: movie.tagline,
    releaseDate: movie.releaseDate,
    runtime: movie.runtime,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
    backdropPath: movie.backdropPath,
    posterPath: movie.posterPath,
    director: movie.director[0]?.person.name ?? null,
    cast: movie.cast.map((c: any) => ({
        character: c.character,
        castOrder: c.castOrder,
        actor: c.person.name,
        profilePath: c.person.profilePath,
    })),
    genres: movie.genres.map((g: any) => g.genre.name),
    keywords: movie.keywords.map((k: any) => k.keyword.name),
    originalLanguages: movie.originalLanguages.map((l: any) => l.language.name),
    productionCompanies: movie.productionCompanies.map((c: any) => c.company.name),
    productionCountries: movie.productionCountries.map((c: any) => c.country.name),
});

async function getPopularMovies(page: number) {
    const movies = await prisma.movie.findMany({
        orderBy: { voteCount: 'desc' },
        skip: 50 * (page - 1),
        take: 50,
        select: {
            id: true,
            title: true,
            overview: true,
            tagline: true,
            releaseDate: true,
            runtime: true,
            voteAverage: true,
            voteCount: true,
            backdropPath: true,
            posterPath: true,
            director: { select: { person: { select: { name: true } } } },
            cast: {
                orderBy: { castOrder: 'asc' },
                select: {
                    character: true,
                    castOrder: true,
                    person: { select: { name: true, profilePath: true } },
                },
            },
            genres: { select: { genre: { select: { name: true } } } },
            keywords: { select: { keyword: { select: { name: true } } } },
            originalLanguages: { select: { language: { select: { name: true } } } },
            productionCompanies: { select: { company: { select: { name: true } } } },
            productionCountries: { select: { country: { select: { name: true } } } },
        },
    });
    return movies.map(mapMovie);
}

// separate function for page 1 which uses cache
async function getPopularMoviesPage1() {
    'use cache';
    cacheLife({
        stale: 1 * 86400,
        revalidate: 3 * 86400,
        expire: 7 * 86400,
    });
    return await getPopularMovies(1);
}

export async function GET(req: NextRequest) {
    const searchParams = req.nextUrl.searchParams;
    const sort = searchParams.get('sort');
    const page = Number(searchParams.get('page'));

    if (!sort || !page || page <= 0) {
        return NextResponse.json({ message: 'Missing or invalid sort/page query parameter' }, { status: 400 });
    }

    if (sort == 'popular') {
        try {
            if (page == 1) {
                const moviesData = await getPopularMoviesPage1();
                return NextResponse.json({ moviesData });
            }
            const moviesData = await getPopularMovies(page);
            return NextResponse.json({ moviesData });
        } catch (err) {
            console.error('Error fetching movies:', err);
            return NextResponse.json({ message: 'Internal server error' }, { status: 500 });
        }
    }
    return NextResponse.json({ message: 'Invalid fetch options' }, { status: 400 });
}
