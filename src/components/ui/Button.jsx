import { cn } from '../../lib/utils'

const variants = {
  primary: 'bg-mtm-primary text-white hover:bg-opacity-90',
  secondary: 'bg-mtm-accent text-white hover:bg-opacity-90',
  outline: 'border-2 border-mtm-primary text-mtm-primary hover:bg-mtm-primary hover:text-white',
  ghost: 'text-mtm-navy hover:bg-gray-100',
}

const sizes = {
  sm: 'px-3 py-1.5 text-sm',
  md: 'px-6 py-3 text-base',
  lg: 'px-8 py-4 text-lg',
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
        'rounded-mtm-md font-medium transition-all duration-200 inline-flex items-center justify-center gap-2',
        variants[variant],
        sizes[size],
        disabled && 'opacity-50 cursor-not-allowed',
        className
      )}
      disabled={disabled}
      {...props}
    >
      {children}
    </button>
  )
}
