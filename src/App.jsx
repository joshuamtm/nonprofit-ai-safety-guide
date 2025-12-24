import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Layout from './components/layout/Layout'
import Home from './pages/Home'
import Directory from './pages/Directory'
import ToolPage from './pages/ToolPage'
import Methodology from './pages/Methodology'
import RequestReview from './pages/RequestReview'
import PolicyGenerator from './pages/PolicyGenerator'
import About from './pages/About'

function App() {
  return (
    <Router>
      <Layout>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/directory" element={<Directory />} />
          <Route path="/tool/:id" element={<ToolPage />} />
          <Route path="/methodology" element={<Methodology />} />
          <Route path="/request-review" element={<RequestReview />} />
          <Route path="/policy-generator" element={<PolicyGenerator />} />
          <Route path="/about" element={<About />} />
        </Routes>
      </Layout>
    </Router>
  )
}

export default App
