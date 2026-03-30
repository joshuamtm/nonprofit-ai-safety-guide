/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        // MTM Brand — refined for depth
        'mtm-primary': '#0e8da0',
        'mtm-primary-light': '#14b8cc',
        'mtm-accent': '#d97a1e',
        'mtm-accent-light': '#f0a050',
        'mtm-navy': '#0f2b4a',
        'mtm-navy-light': '#1c4470',
        'mtm-soft-blue': '#4a6e82',
        'mtm-cream': '#faf6ef',
        'mtm-surface': '#f5f2ed',
        'mtm-white': '#fdfcfa',
        'mtm-border': '#e2ddd5',
        // Ratings — authoritative, not neon
        'rating-recommended': '#0d7a3e',
        'rating-recommended-light': '#e8f5ee',
        'rating-caution': '#b36b00',
        'rating-caution-light': '#fef3e2',
        'rating-not-recommended': '#b92525',
        'rating-not-recommended-light': '#fde8e8',
        'rating-under-review': '#5c6370',
        'rating-under-review-light': '#f0f0f2',
      },
      fontFamily: {
        display: ['Fraunces', 'Georgia', 'serif'],
        sans: ['DM Sans', '-apple-system', 'BlinkMacSystemFont', 'sans-serif'],
        mono: ['JetBrains Mono', 'Menlo', 'monospace'],
      },
      borderRadius: {
        'mtm-sm': '6px',
        'mtm-md': '10px',
        'mtm-lg': '14px',
        'mtm-xl': '20px',
      },
      boxShadow: {
        'mtm-card': '0 1px 3px rgba(15, 43, 74, 0.04), 0 1px 2px rgba(15, 43, 74, 0.06)',
        'mtm-hover': '0 8px 25px rgba(15, 43, 74, 0.08), 0 2px 6px rgba(15, 43, 74, 0.04)',
        'mtm-float': '0 20px 60px rgba(15, 43, 74, 0.12), 0 4px 12px rgba(15, 43, 74, 0.06)',
      },
      backgroundImage: {
        'noise': "url(\"data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.85' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.03'/%3E%3C/svg%3E\")",
      },
      animation: {
        'fade-in': 'fadeIn 0.5s ease-out',
        'slide-up': 'slideUp 0.5s ease-out',
        'slide-in-right': 'slideInRight 0.4s ease-out',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { opacity: '0', transform: 'translateY(16px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        slideInRight: {
          '0%': { opacity: '0', transform: 'translateX(-12px)' },
          '100%': { opacity: '1', transform: 'translateX(0)' },
        },
      },
    },
  },
  plugins: [],
}
