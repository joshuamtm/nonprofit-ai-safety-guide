import { Link, useLocation } from 'react-router-dom'
import { Menu, X } from 'lucide-react'
import { useState } from 'react'
import { cn } from '../../lib/utils'

const navigation = [
  { name: 'Directory', href: '/directory' },
  { name: 'Methodology', href: '/methodology' },
  { name: 'Policy Generator', href: '/policy-generator' },
]

export default function Header() {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false)
  const location = useLocation()

  const isActive = (href) => location.pathname === href

  return (
    <header className="bg-mtm-white/95 backdrop-blur-md border-b border-mtm-border/40 sticky top-0 z-50">
      <nav className="max-w-6xl mx-auto px-4 sm:px-6">
        <div className="flex justify-between h-16">
          <div className="flex items-center">
            <Link to="/" className="flex items-center gap-3 group">
              <img
                src="/mtm-logo-trans.png"
                alt="Meet the Moment"
                className="h-9 w-auto transition-transform duration-200 group-hover:scale-105"
              />
              <div className="hidden sm:block">
                <span className="font-display text-mtm-navy font-semibold text-lg tracking-tight">AI Safety Guide</span>
                <span className="text-mtm-soft-blue text-xs block -mt-0.5 tracking-wide uppercase">for Nonprofits</span>
              </div>
            </Link>
          </div>

          <div className="hidden md:flex items-center gap-1">
            {navigation.map((item) => (
              <Link
                key={item.name}
                to={item.href}
                className={cn(
                  'px-4 py-2 rounded-mtm-md text-sm font-medium transition-all duration-200',
                  isActive(item.href)
                    ? 'text-mtm-primary bg-mtm-primary/8'
                    : 'text-mtm-soft-blue hover:text-mtm-navy hover:bg-mtm-surface'
                )}
              >
                {item.name}
              </Link>
            ))}
          </div>

          <div className="md:hidden flex items-center">
            <button
              type="button"
              className="text-mtm-soft-blue hover:text-mtm-navy p-2 rounded-mtm-md transition-colors"
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              aria-label="Toggle menu"
            >
              {mobileMenuOpen ? <X size={22} /> : <Menu size={22} />}
            </button>
          </div>
        </div>

        {mobileMenuOpen && (
          <div className="md:hidden border-t border-mtm-border/40 py-3 animate-fade-in">
            <div className="flex flex-col gap-1">
              {navigation.map((item) => (
                <Link
                  key={item.name}
                  to={item.href}
                  className={cn(
                    'px-4 py-2.5 rounded-mtm-md text-sm font-medium transition-colors',
                    isActive(item.href)
                      ? 'text-mtm-primary bg-mtm-primary/8'
                      : 'text-mtm-soft-blue hover:text-mtm-navy hover:bg-mtm-surface'
                  )}
                  onClick={() => setMobileMenuOpen(false)}
                >
                  {item.name}
                </Link>
              ))}
            </div>
          </div>
        )}
      </nav>
    </header>
  )
}
