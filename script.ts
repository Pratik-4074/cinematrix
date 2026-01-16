import { prisma } from './lib/prisma';
import { writeFileSync } from 'fs';

async function main() {
    const topMovies = await prisma.movie.findMany({
        orderBy: { voteCount: 'desc' },
        take: 50,
        include: {
            genres: { include: { genre: true } },
            keywords: { include: { keyword: true } },
            spokenLanguages: { include: { language: true } },
            originalLanguages: { include: { language: true } },
            productionCompanies: { include: { company: true } },
            productionCountries: { include: { country: true } },
            cast: { include: { person: true } },
            director: { include: { person: true } },
        },
    });

    // Convert BigInt to string for JSON
    const jsonData = JSON.stringify(
        topMovies,
        (_key, value) => (typeof value === 'bigint' ? value.toString() : value),
        2,
    );

    writeFileSync('topMovies.json', jsonData, { encoding: 'utf-8' });

    console.log('✅ Top 50 movies saved with all attributes in topMovies.json');
}

main()
    .then(async () => {
        await prisma.$disconnect();
    })
    .catch(async (e) => {
        console.error(e);
        await prisma.$disconnect();
        process.exit(1);
    });
