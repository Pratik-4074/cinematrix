export default function Footercomponent(){

    return(
      
      <footer className="border-t border-gray-800 mt-20 py-10 px-4">
        <div className="max-w-7xl mx-auto grid md:grid-cols-3 gap-8 text-sm">
          <div>
            <h3 className="font-bold mb-2">CineMatrix</h3>
            <p className="text-gray-400">
              Your premier destination for cinema lovers.
            </p>
          </div>

          <div>
            <h4 className="font-semibold mb-2">Quick Links</h4>
            <ul className="text-gray-400 space-y-1">
              <li>Home</li>
              <li>Movies</li>
              <li>TV Shows</li>
              <li>Submit Review</li>
            </ul>
          </div>

          <div>
            <h4 className="font-semibold mb-2">Categories</h4>
            <ul className="text-gray-400 space-y-1">
              <li>Action</li>
              <li>Romance</li>
              <li>Drama</li>
              <li>Sci-Fi</li>
            </ul>
          </div>

          
        </div>
      </footer>
    );
}