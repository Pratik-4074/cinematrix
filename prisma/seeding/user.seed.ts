import { prisma } from '@/lib/prisma';

async function main() {
    const user = await prisma.user.create({
        data: {
            name: 'Test User',
            email: 'test@example.com',
        },
    });

    console.log('Seeded user:', user.email);
}

main()
    .catch((e) => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
