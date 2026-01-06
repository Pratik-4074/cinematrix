import Navbar from "./components/navbar";
import CineMatrixNavbar from "./components/navbar";
import Homepage from "./Home/Homepage";
import LoginupPage from "./Login/Loginpage";
import SignupPage from "./Signup/Signuppage";

const BASE_URL = process.env.NEXT_PUBLIC_BASE_URL;

export default async function Home() {
    const res = await fetch(`${BASE_URL}/api/about`);
    const { aboutText } = await res.json();

    return (
        <SignupPage />
    );
}
