import { Link } from 'react-router-dom'

export default function Footer() {
  return (
    <>
      {/* Community Band */}
      <div className="bg-mtm-navy relative overflow-hidden">
        <div className="absolute inset-0 opacity-[0.03]" style={{
          backgroundImage: 'radial-gradient(circle at 20% 50%, rgba(14,141,160,0.4) 0%, transparent 50%), radial-gradient(circle at 80% 50%, rgba(217,122,30,0.3) 0%, transparent 50%)'
        }} />
        <div className="max-w-6xl mx-auto px-4 sm:px-6 py-8 text-center relative z-10">
          <p className="text-white/90 text-base md:text-lg font-display">
            Ready to bring AI into your nonprofit?{' '}
            <a
              href="https://mtm.now/mtm-together"
              target="_blank"
              rel="noopener noreferrer"
              className="text-mtm-primary-light hover:text-white font-semibold underline underline-offset-4 decoration-mtm-primary-light/40 hover:decoration-white/60 transition-colors"
            >
              Join MTM Together
            </a>
            {' '}&mdash; our AI learning community for nonprofits.
          </p>
        </div>
      </div>

      <footer className="bg-mtm-cream border-t border-mtm-border/40">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 py-12">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div className="col-span-1 md:col-span-2">
              <div className="flex items-center gap-3 mb-4">
                <img src="/mtm-logo-trans.png" alt="Meet the Moment" className="h-9 w-auto" />
                <div>
                  <span className="font-display text-mtm-navy font-semibold text-lg tracking-tight">AI Safety Guide</span>
                  <span className="text-mtm-soft-blue text-xs block -mt-0.5 tracking-wide uppercase">for Nonprofits</span>
                </div>
              </div>
              <p className="text-mtm-soft-blue text-sm max-w-md leading-relaxed">
                AI tools evaluated and rated for trust, safety, privacy, and responsibility.
                Built for nonprofits by Meet the Moment.
              </p>
            </div>

            <div>
              <h3 className="font-display text-mtm-navy font-semibold mb-4 text-sm tracking-wide uppercase">Explore</h3>
              <ul className="space-y-2.5">
                {[
                  { to: '/directory', label: 'Browse Directory' },
                  { to: '/methodology', label: 'Our Methodology' },
                  { to: '/policy-generator', label: 'Policy Generator' },
                  { to: '/about', label: 'About' },
                ].map(link => (
                  <li key={link.to}>
                    <Link to={link.to} className="text-mtm-soft-blue hover:text-mtm-primary text-sm transition-colors">
                      {link.label}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>

            <div>
              <h3 className="font-display text-mtm-navy font-semibold mb-4 text-sm tracking-wide uppercase">Contact</h3>
              <ul className="space-y-2.5">
                <li>
                  <a href="https://mtm.now" target="_blank" rel="noopener noreferrer" className="text-mtm-soft-blue hover:text-mtm-primary text-sm transition-colors">
                    mtm.now
                  </a>
                </li>
                <li>
                  <a href="mailto:info@mtm.now" className="text-mtm-soft-blue hover:text-mtm-primary text-sm transition-colors">
                    info@mtm.now
                  </a>
                </li>
              </ul>
            </div>
          </div>

          <div className="border-t border-mtm-border/40 mt-10 pt-8">
            <div className="flex flex-col md:flex-row justify-between items-center gap-4">
              <p className="text-mtm-soft-blue/70 text-sm">
                &copy; {new Date().getFullYear()} Meet the Moment. All rights reserved.
              </p>
              <p className="text-mtm-soft-blue/50 text-xs max-w-2xl text-center md:text-right leading-relaxed">
                This directory provides informational guidance and is not legal, security, or
                compliance advice. Organizations should conduct their own due diligence.
              </p>
            </div>
          </div>
        </div>
      </footer>
    </>
  )
}
