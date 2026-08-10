import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

function createLexicalTextNode(text: string) {
  return {
    root: {
      type: 'root',
      format: '',
      indent: 0,
      version: 1,
      children: text.split('\n\n').map((paragraph) => ({
        type: 'paragraph',
        format: '',
        indent: 0,
        version: 1,
        children: [
          {
            type: 'text',
            detail: 0,
            format: 0,
            mode: 'normal',
            style: '',
            text: paragraph,
            version: 1,
          },
        ],
      })),
    },
  }
}

async function populatePrivacyPage() {
  const payload = await getPayload({ config: configPromise })

  const result = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'privacy-policy',
      },
    },
    limit: 1,
  })

  const doc = result.docs?.[0]
  if (doc) {
    console.log(`Found privacy-policy page (ID: ${doc.id}), populating sections array...`)
    await payload.update({
      collection: 'pages',
      id: doc.id,
      context: {
        disableRevalidate: true,
      },
      data: {
        title: 'Privacy Policy',
        privacyPolicyPage: {
          title: 'Privacy Policy',
          effectiveDate: 'Effective as of April 5, 2025',
          sections: [
            {
              heading: '1. Introduction',
              content: createLexicalTextNode(
                'This Privacy Policy explains how Novel Signature Homes (“Company,” “we,” “us,” or “our”) collects, uses, discloses, and protects personal information of users of our website novelsignaturehomes.com (the “Website”). We are a luxury real estate firm operating in the USA, and we are committed to protecting your privacy. This policy applies to all visitors, clients, and any other individuals (“you” or “your”) who use our Website or services. It is designed to comply with applicable privacy laws, including the EU General Data Protection Regulation (GDPR) and the California Consumer Privacy Act (CCPA), as amended. By using our Website, you agree to the collection and use of information in accordance with this Privacy Policy. If you do not agree, please refrain from using the Website.'
              ),
            },
            {
              heading: '2. Information We Collect',
              content: createLexicalTextNode(
                'We collect personal information that you provide to us directly, information collected automatically through technology, and information from third parties as needed. The types of personal data we may collect now or in the future include:\n\n' +
                  '• Contact and Identity Information: Name, email address, telephone number, postal address, and other identifiers you provide.\n' +
                  '• Property and Preference Information: Details you provide related to your real estate needs or preferences.\n' +
                  '• Transactional Information: Records of communications and transactions with us.\n' +
                  '• Device and Technical Data: IP address, browser type, operating system, and interaction logs.\n' +
                  '• Cookies and Tracking Data: Cookies, web beacons, Google Analytics, Microsoft Clarity, and Facebook Pixel.\n' +
                  '• CRM and Communications Data: Contact details and inquiry history stored in our CRM.\n' +
                  '• Third-Party Sources: Details received from social media or referral partners with your consent.\n\n' +
                  'We do not intentionally collect any sensitive personal information through our Website at this time.'
              ),
            },
            {
              heading: '3. How We Use Your Information',
              content: createLexicalTextNode(
                'We use the collected personal information for business and commercial purposes, including:\n\n' +
                  '• Providing and Improving Services\n' +
                  '• Customer Relationship Management (CRM)\n' +
                  '• Marketing and Newsletters\n' +
                  '• Analytics and Website Improvement\n' +
                  '• Advertising and Retargeting\n' +
                  '• Online Consultations and Appointments\n' +
                  '• Legal and Security Purposes\n' +
                  '• Enforcing Terms and Policies\n' +
                  '• Business Transfers'
              ),
            },
            {
              heading: '4. Legal Bases for Processing (GDPR Compliance)',
              content: createLexicalTextNode(
                'If you are located in the EEA or UK, we process your personal information under the following legal bases:\n\n' +
                  '• Consent\n' +
                  '• Performance of a Contract\n' +
                  '• Legitimate Interests\n' +
                  '• Legal Obligation'
              ),
            },
            {
              heading: '5. Disclosure of Your Information (How We Share Data)',
              content: createLexicalTextNode(
                'We respect your privacy and will not sell your personal information to third parties. We share data only:\n\n' +
                  '• Within Our Organization\n' +
                  '• Service Providers and Processors (IT & Hosting, Analytics, Advertising Partners, Email Marketing, Professional Advisors)\n' +
                  '• Business Partners (with explicit consent)\n' +
                  '• Legal Requirements and Protection\n' +
                  '• Corporate Transactions'
              ),
            },
            {
              heading: '6. Cookies and Tracking Technologies',
              content: createLexicalTextNode(
                'For information about how we use cookies and similar tracking technologies on our Website, please see our detailed Cookie Policy. We use cookies to make our site function, understand usage, and serve personalized content.'
              ),
            },
            {
              heading: '7. Data Retention',
              content: createLexicalTextNode(
                'We retain personal information for as long as necessary to fulfill the purposes for which it was collected, or as required by law. When data is no longer needed, we delete, anonymize, or securely destroy it.'
              ),
            },
            {
              heading: '8. Data Security',
              content: createLexicalTextNode(
                'We implement reasonable security measures (HTTPS/TLS encryption, firewalls, access controls) to protect your personal information. However, no method of transmission over the internet is 100% secure.'
              ),
            },
            {
              heading: '9. International Data Transfers',
              content: createLexicalTextNode(
                'Novel Signature Homes is based in the USA. If accessing from outside the USA, your information will be transferred to and processed in the United States with appropriate safeguards under applicable law.'
              ),
            },
            {
              heading: '10. Your Rights and Choices',
              content: createLexicalTextNode(
                'Your privacy rights depend on your jurisdiction. We respect all applicable rights under GDPR (EU/UK) and CCPA/CPRA (California), as well as other applicable state/national privacy laws.'
              ),
            },
            {
              heading: '11. Rights of Individuals in the EEA/UK (GDPR)',
              content: createLexicalTextNode(
                'EEA and UK individuals have rights including: Right to Be Informed, Right of Access, Right to Rectification, Right to Erasure, Right to Restrict Processing, Right to Object, Right Not to Be Subject to Automated Decision-Making, Right to Withdraw Consent, and Right to Lodge a Complaint.'
              ),
            },
            {
              heading: '12. Rights of California Residents (CCPA/CPRA)',
              content: createLexicalTextNode(
                'California residents have rights including: Right to Know, Right to Delete, Right to Opt-Out of Sale or Sharing, Right to Correct, Right to Limit Use of Sensitive Personal Information, and Right to Non-Discrimination.'
              ),
            },
            {
              heading: '13. Contact Information (Terms of Use)',
              content: createLexicalTextNode(
                'Novel Signature Homes\n\nEmail: info@novelsignaturehomes.com\nPhone: +1(606)-707-5050'
              ),
            },
          ],
        },
      } as any,
    })
    console.log('Successfully populated Privacy Policy sections array!')
  }

  process.exit(0)
}

populatePrivacyPage().catch((err) => {
  console.error('Error populating Privacy Policy page:', err)
  process.exit(1)
})
