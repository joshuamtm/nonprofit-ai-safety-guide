import { cn } from '../../lib/utils'

const variants = {
  primary: 'bg-mtm-navy text-white hover:bg-mtm-navy-light shadow-mtm-card hover:shadow-mtm-hover',
  secondary: 'bg-mtm-primary text-white hover:bg-mtm-primary-light',
  outline: 'bg-transparent border-2 border-mtm-border text-mtm-navy hover:border-mtm-navy hover:bg-mtm-navy/5',
  ghost: 'bg-transparent text-mtm-navy hover:bg-mtm-navy/5',
  accent: 'bg-mtm-accent text-white hover:bg-mtm-accent-light',
}

const sizes = {
  sm: 'px-3.5 py-1.5 text-sm gap-1.5',
  md: 'px-5 py-2.5 text-sm gap-2',
  lg: 'px-7 py-3.5 text-base gap-2.5',
}

export default function Button({
  variant = 'primary',
  size = 'md',
  children,
  className,
  disabled,
  ...props
}) {
  return (
    <button
      className={cn(
        'inline-flex items-center justify-center font-medium rounded-mtm-md transition-all duration-200',
        variants[variant],
        sizes[size],
        disabled && 'opacity-40 cursor-not-allowed pointer-events-none',
        className
      )}
      disabled={disabled}
      {...props}
    >
      {children}
    </button>
  )
}
