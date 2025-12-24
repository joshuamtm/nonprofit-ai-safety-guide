import { useState } from 'react'
import { Download, RefreshCw, FileText, Copy, Check } from 'lucide-react'
import Button from '../ui/Button'
import PolicyPreview from './PolicyPreview'
import { generatePolicyDocument } from '../../lib/policyGenerator'

export default function ResultsStep({ answers, onRestart }) {
  const [copied, setCopied] = useState(false)
  const [downloading, setDownloading] = useState(false)

  const policy = generatePolicyDocument(answers)

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(policy.plainText)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch (err) {
      console.error('Failed to copy:', err)
    }
  }

  const handleDownload = async () => {
    setDownloading(true)
    try {
      // Dynamic import for docx library
      const { Document, Packer, Paragraph, TextRun, HeadingLevel } = await import('docx')
      const { saveAs } = await import('file-saver')

      const doc = new Document({
        sections: [
          {
            properties: {},
            children: [
              new Paragraph({
                text: 'AI Tool Usage Policy',
                heading: HeadingLevel.TITLE,
              }),
              new Paragraph({
                text: `Generated: ${new Date().toLocaleDateString()}`,
                spacing: { after: 400 },
              }),
              ...policy.sections.flatMap((section) => [
                new Paragraph({
                  text: section.title,
                  heading: HeadingLevel.HEADING_1,
                  spacing: { before: 400 },
                }),
                ...section.content.map(
                  (text) =>
                    new Paragraph({
                      children: [new TextRun(text)],
                      spacing: { after: 200 },
                    })
                ),
              ]),
              new Paragraph({
                children: [
                  new TextRun({
                    text: '\n\nDISCLAIMER: ',
                    bold: true,
                  }),
                  new TextRun(
                    'This policy template is provided for guidance only and does not constitute legal advice. Please consult with your legal team before implementation.'
                  ),
                ],
                spacing: { before: 600 },
              }),
            ],
          },
        ],
      })

      const blob = await Packer.toBlob(doc)
      saveAs(blob, 'ai-usage-policy.docx')
    } catch (err) {
      console.error('Failed to generate document:', err)
    } finally {
      setDownloading(false)
    }
  }

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-xl font-semibold text-mtm-navy">
            Your AI Policy Recommendations
          </h2>
          <p className="text-gray-600">
            Based on your selections, here's a customized policy framework.
          </p>
        </div>
        <Button variant="outline" onClick={onRestart}>
          <RefreshCw className="w-4 h-4 mr-2" />
          Start Over
        </Button>
      </div>

      {/* Summary badges */}
      <div className="flex flex-wrap gap-2 mb-6">
        <span className="px-3 py-1 bg-mtm-navy/10 text-mtm-navy rounded-full text-sm font-medium">
          {answers.dataTypes.length} data type{answers.dataTypes.length !== 1 ? 's' : ''} selected
        </span>
        <span className="px-3 py-1 bg-mtm-primary/10 text-mtm-primary rounded-full text-sm font-medium capitalize">
          {answers.riskLevel} risk tolerance
        </span>
      </div>

      {/* Policy preview */}
      <PolicyPreview policy={policy} />

      {/* Action buttons */}
      <div className="mt-6 flex flex-col sm:flex-row gap-3">
        <Button onClick={handleDownload} disabled={downloading} className="flex-1">
          {downloading ? (
            <>
              <RefreshCw className="w-4 h-4 mr-2 animate-spin" />
              Generating...
            </>
          ) : (
            <>
              <Download className="w-4 h-4 mr-2" />
              Download as Word Doc
            </>
          )}
        </Button>
        <Button variant="outline" onClick={handleCopy} className="flex-1">
          {copied ? (
            <>
              <Check className="w-4 h-4 mr-2" />
              Copied!
            </>
          ) : (
            <>
              <Copy className="w-4 h-4 mr-2" />
              Copy to Clipboard
            </>
          )}
        </Button>
      </div>

      {/* Recommended tools callout */}
      <div className="mt-8 p-4 bg-mtm-primary/5 rounded-mtm-lg border border-mtm-primary/20">
        <div className="flex items-start gap-3">
          <FileText className="w-5 h-5 text-mtm-primary flex-shrink-0 mt-0.5" />
          <div>
            <h4 className="font-medium text-mtm-navy">Next Steps</h4>
            <p className="text-sm text-gray-600 mt-1">
              Browse our{' '}
              <a href="/directory" className="text-mtm-primary hover:underline">
                Tool Directory
              </a>{' '}
              to find AI tools that match your policy requirements. Filter by rating to see which
              tools are pre-approved for your risk level.
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}
