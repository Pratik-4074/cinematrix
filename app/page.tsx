import { Suspense } from 'react';

const BASE_URL = process.env.NEXT_PUBLIC_BASE_URL;

async function AboutText() {
    const res = await fetch(`${BASE_URL}/api/about`);
    const { aboutText } = await res.json();
    return <p className="w-100 text-center text-lg">{aboutText}</p>;
}

function AboutLoading() {
    return <p className="w-100 text-center text-lg">Loading about text...</p>;
}

export default async function Home() {
    return (
        <main className="flex flex-col items-center gap-10">
            <h1 className="mt-5 text-center text-3xl">Welcome To Cinematrix!</h1>
            <Suspense fallback={<AboutLoading />}>
                <AboutText />
            </Suspense>
        </main>
    );
}
