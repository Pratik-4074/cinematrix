import { prisma } from '@/lib/prisma';
import fs from 'fs';
import path from 'path';
import csv from 'csv-parser';

async function main() {
    const filePath = path.join(process.cwd(), 'datasets/movies.csv');
    type MovieRecord = {
        id: number;
        title: string;
        originalTitle: string;
        overview: string | null;
        tagline: string | null;
        status: string | null;
        releaseDate: Date | null;
        runtime: number | null;
        budget: number | null;
        revenue: number | null;
        adult: boolean;
        homepage: string | null;
        imdbId: string | null;
        popularity: number | null;
        voteAverage: number | null;
        voteCount: number | null;
        posterPath: string | null;
        backdropPath: string | null;
    };

    const records: MovieRecord[] = [];

    await new Promise<void>((resolve, reject) => {
        fs.createReadStream(filePath)
            .pipe(csv())
            .on('data', (row) => {
                records.push({
                    id: Number(row.id),
                    title: row.title,
                    originalTitle: row.originalTitle || null,
                    overview: row.overview || null,
                    tagline: row.tagline || null,
                    status: row.status || null,
                    releaseDate: row.releaseDate ? new Date(row.releaseDate) : null,
                    runtime: row.runtime ? Number(row.runtime) : null,
                    budget: row.budget ? Number(row.budget) : null,
                    revenue: row.revenue ? Number(row.revenue) : null,
                    adult: row.adult === 'True',
                    homepage: row.homepage || null,
                    imdbId: row.imdbId || null,
                    popularity: row.popularity ? Number(row.popularity) : null,
                    voteAverage: row.voteAverage ? Number(row.voteAverage) : null,
                    voteCount: row.voteCount ? Number(row.voteCount) : null,
                    posterPath: row.posterPath || null,
                    backdropPath: row.backdropPath || null,
                });
            })
            .on('end', () => {
                console.log(`Parsed ${records.length} rows from CSV.`);
                resolve();
            })
            .on('error', (err) => reject(err));
    });

    if (records.length === 0) {
        console.log('No data to insert.');
        return;
    }

    const result = await prisma.movie.createMany({
        data: records,
        skipDuplicates: true,
    });

    console.log(`Inserted ${result.count} rows into the database.`);
}

main()
    .catch((e) => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
