import { prisma } from './lib/prisma';

async function main() {
    const movieVectors = await prisma.movieFeatureVector.findMany({
        select: {
            movieId: true,
            combinedVector: true,
        },
    });

    movieVectors.forEach((r) => {
        console.log({
            movieId: r.movieId,
            combinedVectorBytes: r.combinedVector?.length,
        });
    });
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
