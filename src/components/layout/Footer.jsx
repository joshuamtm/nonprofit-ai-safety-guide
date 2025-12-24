import { Link } from 'react-router-dom'

export default function Footer() {
  return (
    <footer className="bg-mtm-cream border-t border-gray-200">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          {/* Brand */}
          <div className="col-span-1 md:col-span-2">
            <div className="flex items-center gap-3 mb-4">
              <div className="w-10 h-10 bg-mtm-primary rounded-lg flex items-center justify-center">
                <span className="text-white font-bold text-xl">AI</span>
              </div>
              <div>
                <span className="text-mtm-navy font-semibold text-lg">Trusted AI Tools</span>
                <span className="text-mtm-soft-blue text-sm block -mt-1">by Meet the Moment</span>
              </div>
            </div>
            <p className="text-gray-600 text-sm max-w-md">
              A searchable directory of AI tools evaluated against a nonprofit-specific rubric
              for safety, privacy, and responsibility.
            </p>
          </div>

          {/* Quick Links */}
          <div>
            <h3 className="text-mtm-navy font-semibold mb-4">Quick Links</h3>
            <ul className="space-y-2">
              <li>
                <Link to="/directory" className="text-gray-600 hover:text-mtm-primary text-sm">
                  Browse Directory
                </Link>
              </li>
              <li>
                <Link to="/methodology" className="text-gray-600 hover:text-mtm-primary text-sm">
                  Our Methodology
                </Link>
              </li>
              <li>
                <Link to="/policy-generator" className="text-gray-600 hover:text-mtm-primary text-sm">
                  Policy Generator
                </Link>
              </li>
              <li>
                <Link to="/request-review" className="text-gray-600 hover:text-mtm-primary text-sm">
                  Request a Review
                </Link>
              </li>
            </ul>
          </div>

          {/* Contact */}
          <div>
            <h3 className="text-mtm-navy font-semibold mb-4">Contact</h3>
            <ul className="space-y-2">
              <li>
                <a
                  href="https://mtm.now"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-gray-600 hover:text-mtm-primary text-sm"
                >
                  mtm.now
                </a>
              </li>
              <li>
                <a
                  href="mailto:info@mtm.now"
                  className="text-gray-600 hover:text-mtm-primary text-sm"
                >
                  info@mtm.now
                </a>
              </li>
            </ul>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="border-t border-gray-300 mt-8 pt-8">
          <div className="flex flex-col md:flex-row justify-between items-center gap-4">
            <p className="text-gray-500 text-sm">
              &copy; {new Date().getFullYear()} Meet the Moment. All rights reserved.
            </p>
            <p className="text-gray-400 text-xs max-w-2xl text-center md:text-right">
              This directory provides informational guidance and is not legal, security, or
              compliance advice. Organizations should conduct their own due diligence.
            </p>
          </div>
        </div>
      </div>
    </footer>
  )
}
