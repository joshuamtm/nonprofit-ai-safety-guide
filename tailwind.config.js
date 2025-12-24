/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        // MTM Brand Colors
        'mtm-primary': '#1ab1d2',
        'mtm-accent': '#f18f38',
        'mtm-navy': '#1c487b',
        'mtm-soft-blue': '#5a7a8f', // Darkened for WCAG AA compliance (was #85abbd)
        'mtm-cream': '#fef4e3',
        'mtm-white': '#fafdfe',
        // Rating Colors
        'rating-recommended': '#22c55e',
        'rating-caution': '#f59e0b',
        'rating-not-recommended': '#ef4444',
        'rating-under-review': '#6b7280',
      },
      fontFamily: {
        sans: ['-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', 'sans-serif'],
      },
      borderRadius: {
        'mtm-sm': '4px',
        'mtm-md': '6px',
        'mtm-lg': '8px',
      },
      boxShadow: {
        'mtm-card': '0 2px 4px rgba(0, 0, 0, 0.08)',
        'mtm-hover': '0 4px 8px rgba(0, 0, 0, 0.12)',
      },
    },
  },
  plugins: [],
}
