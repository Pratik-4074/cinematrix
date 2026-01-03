import { prisma } from '@/lib/prisma';
import fs from 'fs';
import path from 'path';
import csv from 'csv-parser';

async function main() {}

main()
    .catch((e) => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
