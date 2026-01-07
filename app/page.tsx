import Aboutpage from "./About/Aboutpage";
import Navbar from "./components/navbar";
import CineMatrixNavbar from "./components/navbar";
import Homepage from "./home/page";
import LoginupPage from "./Login/Loginpage";
import Moviepage from "./Moviepage/moviepage";
import SignupPage from "./Signup/Signuppage";

const BASE_URL = process.env.NEXT_PUBLIC_BASE_URL;

export default async function Home() {
    const res = await fetch(`${BASE_URL}/api/about`);
    const { aboutText } = await res.json();

    return (
        <Homepage />
    );
}
