import Navbar from "../components/navbar";
import Footercomponent from "../components/footer";
import { Mail, Phone, Clapperboard } from "lucide-react";

export default function Aboutpage() {
  return (
    <div className="min-h-screen bg-black text-white">
      <div className="fixed top-0 left-0 w-full z-50 bg-black">
      <Navbar />
      </div>
      {/* Main Content */}
      <div className="max-w-6xl mx-auto px-6 py-16 space-y-10 mt-5">

        {/* Top Contact Cards */}
        <div className="grid md:grid-cols-2 gap-8">
          {/* Email Card */}
          <div className="border border-gray-400/40 rounded-2xl p-8 bg-[linear-gradient(to_bottom,rgba(255,255,255,0.32)_20%,rgba(255,255,255,0.32)_100%)]"

>
            <Mail className="text-red-600 mx-auto mb-4" size={28} />
            <p className="text-center font-semibold">
              cinematrix.co.in
            </p>
            <p className="text-center font-semibold">
              cinematrix@gmail.com
            </p>
          </div>

          {/* Phone Card */}
          <div className="border border-gray-400/40 rounded-2xl p-8 bg-[linear-gradient(to_bottom,rgba(255,255,255,0.32)_20%,rgba(255,255,255,0.32)_100%)]">
            <Phone className="text-red-600 mx-auto mb-4" size={28} />
            <p className="text-center font-semibold">+977 9876543210</p>
            <p className="text-center font-semibold">+977 9876543219</p>
          </div>
        </div>

        {/* About Section */}
        <div className="border border-gray-400/40 rounded-2xl p-8 bg-[linear-gradient(to_bottom,rgba(255,255,255,0.32)_20%,rgba(255,255,255,0.32)_100%)]">
          <h2 className="text-3xl font-bold mb-6">About Cinamtrix</h2>

          <div className="space-y-6 text-gray-200 leading-relaxed">
            <p className="flex font-semibold gap-2">
              <Clapperboard className="text-black mt-1" size={20} />
              At Cinematrix, we believe cinema is more than just entertainment—it's
              an emotion, a legacy, and a powerful storytelling medium that shapes
              how we see the world.
            </p>

            <p className="flex font-semibold gap-2">
              <Clapperboard className="text-black mt-1" size={20} />
              Fueled by a genuine passion for films, ReelTalks is your go-to hub
              for discovering compelling stories, in-depth reviews, and exclusive
              behind-the-scenes insights that dive deeper into the soul of cinema.
            </p>

            <p className="flex font-semibold gap-2">
             <Clapperboard className="text-black mt-1" size={20} />
              Whether you're a casual viewer or a dedicated cinephile, ReelTalks
              brings you closer to the art of filmmaking—from celebrated
              blockbusters to hidden indie treasures.
            </p>

            <p className="text-center font-semibold text-white pt-4">
              Join the conversation. Feel the reel. Live the story.
            </p>
          </div>

          {/* Contact Form */}
          <div className="mt-10 max-w-md mx-auto space-y-5">
            <input
              type="text"
              placeholder="Your Name..."
              className="w-full bg-gray-700/40 border border-gray-500/30 rounded-xl px-4 py-3 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-red-600"
            />

            <input
              type="email"
              placeholder="Email Address..."
              className="w-full bg-gray-700/40 border border-gray-500/30 rounded-xl px-4 py-3 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-red-600"
            />

            <textarea
              rows={4}
              placeholder="Your Message..."
              className="w-full bg-gray-700/40 border border-gray-500/30 rounded-xl px-4 py-3 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-red-600"
            />

            <button className="w-full bg-red-700 hover:bg-red-800 transition rounded-xl py-3 font-semibold">
              Send Message
            </button>
          </div>
        </div>
      </div>

      <Footercomponent />
    </div>
  );
}
