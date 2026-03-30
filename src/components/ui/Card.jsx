import { cn } from '../../lib/utils'

export default function Card({
  children,
  className,
  hover = false,
  padding = true,
  ...props
}) {
  return (
    <div
      className={cn(
        'bg-mtm-white rounded-mtm-lg border border-mtm-border/60 shadow-mtm-card',
        padding && 'p-6',
        hover && 'transition-all duration-300 hover:shadow-mtm-hover hover:-translate-y-0.5',
        className
      )}
      {...props}
    >
      {children}
    </div>
  )
}
