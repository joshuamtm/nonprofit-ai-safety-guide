import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Layout from './components/layout/Layout'
import Home from './pages/Home'
import Directory from './pages/Directory'
import ToolPage from './pages/ToolPage'
import Methodology from './pages/Methodology'
import RequestReview from './pages/RequestReview'
import PolicyGenerator from './pages/PolicyGenerator'
import About from './pages/About'
import Compare from './pages/Compare'
import { CompareProvider } from './context/CompareContext'
import CompareBar from './components/tools/CompareBar'

function App() {
  return (
    <Router>
      <CompareProvider>
        <Layout>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/directory" element={<Directory />} />
            <Route path="/tool/:id" element={<ToolPage />} />
            <Route path="/methodology" element={<Methodology />} />
            <Route path="/request-review" element={<RequestReview />} />
            <Route path="/policy-generator" element={<PolicyGenerator />} />
            <Route path="/about" element={<About />} />
            <Route path="/compare" element={<Compare />} />
          </Routes>
        </Layout>
        <CompareBar />
      </CompareProvider>
    </Router>
  )
}

export default App
