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
        'bg-white rounded-mtm-lg shadow-mtm-card',
        padding && 'p-6',
        hover && 'hover:shadow-mtm-hover transition-shadow duration-200',
        className
      )}
      {...props}
    >
      {children}
    </div>
  )
}
