import { createContext, useContext, useState } from 'react'

const CompareContext = createContext()

export function CompareProvider({ children }) {
  const [compareList, setCompareList] = useState([])
  const MAX_COMPARE = 3

  const addToCompare = (tool) => {
    if (compareList.length < MAX_COMPARE && !compareList.find(t => t.id === tool.id)) {
      setCompareList([...compareList, tool])
    }
  }

  const removeFromCompare = (toolId) => {
    setCompareList(compareList.filter(t => t.id !== toolId))
  }

  const isInCompare = (toolId) => {
    return compareList.some(t => t.id === toolId)
  }

  const clearCompare = () => {
    setCompareList([])
  }

  return (
    <CompareContext.Provider value={{
      compareList,
      addToCompare,
      removeFromCompare,
      isInCompare,
      clearCompare,
      canAddMore: compareList.length < MAX_COMPARE
    }}>
      {children}
    </CompareContext.Provider>
  )
}

export function useCompare() {
  const context = useContext(CompareContext)
  if (!context) {
    throw new Error('useCompare must be used within a CompareProvider')
  }
  return context
}
