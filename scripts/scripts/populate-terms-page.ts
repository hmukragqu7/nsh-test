import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

// Helper to convert formatted content structure into Payload Lexical AST format
function createLexicalContent(paragraphs: Array<{ type?: 'p' | 'ul' | 'h3'; content: Array<{ text: string; bold?: boolean; italic?: boolean; link?: string }> | string }>) {
  const children = paragraphs.map((block) => {
    if (block.type === 'ul' && Array.isArray(block.content)) {
      return {
        type: 'list',
        listType: 'bullet',
        tag: 'ul',
        format: '',
        indent: 0,
        version: 1,
        children: block.content.map((item: any) => ({
          type: 'listitem',
          value: 1,
          format: '',
          indent: 0,
          version: 1,
          children: [
            {
              type: 'text',
              detail: 0,
              format: item.bold ? 1 : 0,
              mode: 'normal',
              style: '',
              text: typeof item === 'string' ? item : item.text,
              version: 1,
            },
          ],
        })),
      }
    }

    const inlineChildren = typeof block.content === 'string'
      ? [
          {
            type: 'text',
            detail: 0,
            format: 0,
            mode: 'normal',
            style: '',
            text: block.content,
            version: 1,
          },
        ]
      : block.content.map((item) => {
          let formatNum = 0
          if (item.bold) formatNum |= 1
          if (item.italic) formatNum |= 2

          if (item.link) {
            return {
              type: 'link',
              fields: {
                linkType: 'custom',
                url: item.link,
                newTab: false,
              },
              format: '',
              indent: 0,
              version: 1,
              children: [
                {
                  type: 'text',
                  detail: 0,
                  format: formatNum,
                  mode: 'normal',
                  style: '',
                  text: item.text,
                  version: 1,
                },
              ],
            }
          }

          return {
            type: 'text',
            detail: 0,
            format: formatNum,
            mode: 'normal',
            style: '',
            text: item.text,
            version: 1,
          }
        })

    return {
      type: 'paragraph',
      format: '',
      indent: 0,
      version: 1,
      children: inlineChildren,
    }
  })

  return {
    root: {
      type: 'root',
      format: '',
      indent: 0,
      version: 1,
      children,
    },
  }
}

async function populateTermsPage() {
  const payload = await getPayload({ config: configPromise })

  console.log('Searching for terms-and-conditions page in Pages collection...')

  const result = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'terms-and-conditions',
      },
    },
    limit: 1,
  })

  let doc = result.docs?.[0]

  const termsData = {
    title: 'Terms and Conditions',
    termsAndConditionsPage: {
      title: 'Terms and Conditions',
      subheading: 'Terms and condition',
      effectiveDate: 'Effective as of April 5, 2025',
      sections: [
        {
          heading: 'Acceptance of the Terms',
          content: createLexicalContent([
            {
              content: [
                { text: 'Welcome to ' },
                { text: 'novelsignaturehomes.com', bold: true },
                { text: ' (the “Website”), operated by Novel Signature Homes (“Company,” “we,” “us,” or “our”). These Terms and Conditions of Use (“Terms”) govern your access to and use of the website, including any content, functionality, and services offered on or through the Website. ' },
                { text: 'By accessing or using our website, you acknowledge that you have read, understood, and agree to be bound by these Terms', bold: true },
                { text: ' (and any applicable laws and regulations). If you do not agree to these Terms, you must not use our Website.' },
              ],
            },
            {
              content: [
                { text: 'These Terms constitute a legally binding agreement between you and Novel Signature Homes. In these Terms, the words “' },
                { text: 'you', bold: true },
                { text: '” and “' },
                { text: 'your', bold: true },
                { text: '” refer to any individual or entity accessing the website. If you are using the website on behalf of a company or other legal entity, you represent that you have authority to bind that entity to these Terms, in which case “you” will refer to that entity.' },
              ],
            },
          ]),
        },
        {
          heading: 'Company Information',
          content: createLexicalContent([
            {
              content: [
                { text: 'Novel Signature Homes is a luxury residential real estate firm based in Texas, USA. We specialize in high-end home construction, buying, and selling services. Our contact information is provided in our ' },
                { text: 'Privacy Policy', link: '/privacy-policy' },
                { text: ' and on our website’s contact page. Throughout these Terms, any reference to the “' },
                { text: 'Site', bold: true },
                { text: '” or “' },
                { text: 'Website', bold: true },
                { text: '” refers to novelsignaturehomes.com and all content within it.' },
              ],
            },
          ]),
        },
        {
          heading: 'Use of the Website',
          content: createLexicalContent([
            {
              content: [
                { text: 'We grant you a ' },
                { text: 'limited, non-exclusive, non-transferable, revocable license', bold: true },
                { text: ' to access and use the Website for your own personal, informational, and non-commercial use, subject to your compliance with these Terms. ' },
                { text: 'Permitted use', bold: true },
                { text: ' of our website includes browsing our property listings, learning about our services, contacting us via provided forms, and availing any features we make available (such as account registration or scheduling consultations, if offered).' },
              ],
            },
            {
              content: [
                { text: 'By using our website, you agree to do so ' },
                { text: 'lawfully and responsibly', bold: true },
                { text: '. You must be at least 18 years of age (or the age of legal majority in your jurisdiction) to use our website. If you are under 18, you may use the website only with involvement of a parent or guardian. You agree not to impersonate any person or entity or misrepresent your identity or affiliation with any person or entity while using the Site.' },
              ],
            },
          ]),
        },
        {
          heading: 'Intellectual Property Rights',
          content: createLexicalContent([
            {
              content:
                'All content and materials on the Website – including but not limited to text, descriptions, property listings, photographs, images, graphics, logos, videos, design/layout, look and feel, software code, and other material – are the intellectual property of Novel Signature Homes or our content providers/licensors, and are protected by copyright, trademark, and other intellectual property laws. Novel Signature Homes and our logos, brand names, and slogans are trademarks or service marks owned by us. All rights, title, and interest in and to the Website and its content are reserved by the Company.',
            },
            {
              content: [
                { text: 'Limited License to Use Content', bold: true },
                { text: ': You may view, download, and print content from the Website solely for your personal and non-commercial use (for example, you may print out a property listing to review it). However, this limited license does not allow you to:' },
              ],
            },
            {
              type: 'ul',
              content: [
                { text: 'Republish or redistribute Website content (such as displaying our listings or articles on another website or service) without prior written permission from us.' },
                { text: 'Copy, reproduce, or duplicate the content for commercial purposes (e.g., using our photos or descriptions to market other services).' },
                { text: 'Modify, translate, or create derivative works of the Website content (except as enabled through site features such as customizable search filters).' },
                { text: 'Remove or alter any copyright, trademark, or other proprietary rights notices contained in the content.' },
                { text: 'Use any illustrations, photographs, video or audio sequences, or any graphics separately from the accompanying text or context provided on our Site.' },
              ] as any,
            },
            {
              content:
                'If we explicitly make certain content available for sharing or further use (for example, providing social media sharing buttons or downloadable brochures), then such content may be used in accordance with the permissions we specify. Otherwise, any use of our content beyond what is allowed in these Terms requires our express written consent.',
            },
            {
              content: [
                { text: 'Your Content', bold: true },
                { text: ': If you submit or post any content to our Website (such as through a feature allowing user testimonials, comments, or profile information), you retain ownership of your content, but you grant Novel Signature Homes a worldwide, royalty-free, sublicensable license to use, reproduce, modify, publish, and display such content as needed to provide the services or as otherwise consistent with the purpose for which you provided it. You are solely responsible for any content you provide and must ensure it does not violate any laws or infringe anyone’s rights. We reserve the right to remove any user-submitted content that we deem to violate these Terms or that is inappropriate, at our sole discretion.' },
              ],
            },
          ]),
        },
        {
          heading: 'How We Use Your Information',
          content: createLexicalContent([
            {
              content:
                'You agree not to use the Website (including any interactive features or services, if offered) in any way that is unlawful, unethical, or in violation of these Terms. The following is a non-exhaustive list of prohibited activities that you must refrain from:',
            },
            {
              type: 'ul',
              content: [
                { text: 'Illegal Activities: You must not use the Website in any manner that violates any applicable federal, state, local, or international law or regulation. This includes all real estate regulations, privacy laws, intellectual property laws, and export laws.' },
                { text: 'Infringement of Rights: Do not upload, post, or transmit any content that infringes or violates the intellectual property rights, privacy rights, or other rights of any party. For example, you should not post images or text that you do not have the rights to use.' },
                { text: 'Disruption and Hacking: You must not attempt to interfere with the proper working of the Website. Prohibited actions include (but are not limited to) introducing viruses, Trojan horses, worms, logic bombs, or any other malicious or technologically harmful material; attempting to gain unauthorized access to the Site or its servers; engaging in any form of hacking, attack (such as a denial-of-service attack), or disruption of any part of the Site or its networks.' },
                { text: 'Scraping and Data Mining: You may not use any robot, spider, crawler, scraper, or other automated means or process to access the Website for any purpose, including monitoring, copying, or collecting data or content from the Site without our express written permission. Additionally, you shall not harvest or collect information about other users of the Site without their consent.' },
                { text: 'Impersonation and Misrepresentation: Do not impersonate or attempt to impersonate Novel Signature Homes, our employees, another user, or any other person or entity. You also must not misrepresent your affiliation with any person or entity or provide false information about yourself.' },
                { text: 'Spam and Unsolicited Communications: You agree not to use the Website to transmit or facilitate the sending of any unauthorized advertising or promotional material (e.g., junk mail, chain letters, spam, or any other similar solicitation).' },
                { text: 'Prohibited Content: You must not post or transmit any content through the Site that is defamatory, obscene, pornographic, indecent, harassing, violent, hateful, inflammatory, or otherwise objectionable. Additionally, you must not use the Site to stalk, harass, or harm another individual.' },
                { text: 'Commercial Use: Unless expressly authorized by us, you cannot use the Site for commercial purposes unrelated to the services offered by Novel Signature Homes. For example, you should not advertise or sell products or services through our Site, or use our Site to promote other businesses.' },
                { text: 'Security Testing: You are not permitted to probe, scan, or test the vulnerability of the Site or any network connected to the Site, nor breach security or authentication measures, without proper authorization.' },
              ] as any,
            },
            {
              content:
                'Violation of any of the above may result in termination of your right to use the Website and may expose you to liability for legal action (both civil and criminal). We reserve the right to report any violations to law enforcement authorities as appropriate and will cooperate with such authorities by disclosing your identity and other information about you, if necessary.',
            },
          ]),
        },
        {
          heading: 'Real Estate Listings and Services',
          content: createLexicalContent([
            {
              content: [
                { text: 'The Website may display ' },
                { text: 'property listings', bold: true },
                { text: ', descriptions of construction projects, images of homes, pricing information, and other details related to real estate that Novel Signature Homes is offering or has worked on. While we strive to ensure that all information on our Website is accurate, ' },
                { text: 'real estate listings are subject to change', bold: true },
                { text: '. For instance, properties may become unavailable, prices may change, specifications may be updated, and there may be inadvertent errors or omissions in the content.' },
              ],
            },
            {
              content: [
                { text: 'No Guarantee of Accuracy', bold: true },
                { text: ': We do not warrant that the content on our Website (including property listings, availability, square footage, prices, or any other details) is complete, up-to-date, or free from mistakes. All information is provided for general informational purposes only and should not be relied upon as the sole basis for making significant decisions. Before making any decisions based on information found on our Site (such as deciding to purchase a property or enter into a contract), ' },
                { text: 'you should verify the information independently', bold: true },
                { text: ' by contacting us or through appropriate professionals (such as a licensed real estate agent, inspector, or attorney).' },
              ],
            },
            {
              content: [
                { text: 'Not an Offer or Contract', bold: true },
                { text: ': Nothing on the Website constitutes a binding offer to sell or lease any property or to provide any service. Any transaction or agreement for real estate services will be documented in a separate written contract. The information on this Website does not form part of any contract unless explicitly incorporated later. Any reliance you place on such information is strictly at your own risk.' },
              ],
            },
            {
              content: [
                { text: 'Consultations and Future Features', bold: true },
                { text: ': If our Website offers the ability to schedule consultations, virtual tours, or other interactive services, those features are provided for your convenience. We will do our best to honor scheduled appointments or consultations, but we cannot guarantee availability for any specific time you request until confirmed by us. We also expect that you will provide accurate information when booking such services (e.g., correct contact information and details of what you are interested in) and show up on time for any scheduled meetings (or cancel in advance if you cannot attend). We reserve the right to cancel or reschedule appointments as needed (we will attempt to notify you in such cases). Any future feature we introduce (like online booking, client portals, etc.) will also be governed by these Terms and any additional terms we provide at launch.' },
              ],
            },
          ]),
        },
        {
          heading: 'Links to Third-Party Websites',
          content: createLexicalContent([
            {
              content: [
                { text: 'Our Website may contain links to third-party websites or services that are not owned or controlled by Novel Signature Homes. For example, we might link to a map service (e.g., Google Maps for property locations), social media pages (like our company’s profile on Instagram or LinkedIn), or external real estate resources. ' },
                { text: 'These links are provided for your convenience only', bold: true },
                { text: '.' },
              ],
            },
            {
              content:
                'We have no control over, and assume no responsibility for, the content, privacy policies, or practices of any third-party websites. Different terms and privacy policies may apply to your use of those websites. The inclusion of any link does not imply endorsement by us of the site or any association with its operators. If you access a third-party site via our Website, you do so at your own risk, and you should review the terms and policies of those sites.',
            },
            {
              content:
                'Novel Signature Homes shall not be liable for any loss or damage that may arise from your use of third-party websites. If you have any concerns about external links or content, please let us know.',
            },
          ]),
        },
        {
          heading: 'Disclaimer of Warranties',
          content: createLexicalContent([
            {
              content: [
                { text: 'The Website and all content, information, and services provided on or through it are provided on an “AS IS” and “AS AVAILABLE” basis', bold: true },
                { text: ', without any warranties of any kind, either express or implied, unless expressly set forth in writing. To the fullest extent permissible pursuant to applicable law, Novel Signature Homes disclaims all warranties, express, implied, or statutory, including but not limited to implied warranties of merchantability, fitness for a particular purpose, title, and non-infringement of intellectual property rights.' },
              ],
            },
            {
              content: 'Without limiting the generality of the above, we do not guarantee that:',
            },
            {
              type: 'ul',
              content: [
                { text: 'The Website will be uninterrupted or error-free: We do not warrant that the operation of the Site will be continuous, timely, secure, or free of errors, viruses, or other harmful components. You assume all risk for any damage to your computer system or loss of data that results from obtaining any content from the Site, including any damages resulting from computer viruses.' },
                { text: 'Content Accuracy: We do not warrant or make any representation regarding the accuracy, reliability, currency, or completeness of the information provided on the Website. The real estate market is dynamic, and information can change quickly. The Site content may include errors or inaccuracies, and we expressly disclaim liability for any such errors to the extent permitted by law.' },
                { text: 'Quality of Services or Outcomes: Any statements about the quality, luxury, or outcomes (for example, potential investment value of a property, or the quality of construction services) are for general informational purposes and do not constitute a warranty or guarantee. Any service or advice we offer outside the Website would be covered by separate agreements. On the Website, nothing shall create a warranty beyond what is stated.' },
              ] as any,
            },
            {
              content: [
                { text: 'Professional Advice', bold: true },
                { text: ': No part of our Website content (including any guides, blog posts, FAQs, or property descriptions) is intended to constitute financial, legal, or real estate advice. You should consult with appropriate professionals for advice tailored to your situation. For example, we always recommend buyers conduct independent inspections and consult a real estate attorney before purchasing a home.' },
              ],
            },
            {
              content:
                'Some jurisdictions do not allow the exclusion of certain warranties. If such laws apply to you, some of the above disclaimers may not apply, and you may have rights in addition to those outlined here. In such cases, any warranties that cannot be fully disclaimed will be limited to the shortest legally permitted duration.',
            },
          ]),
        },
        {
          heading: 'Limitation of Liability',
          content: createLexicalContent([
            {
              content: [
                { text: 'To the maximum extent permitted by applicable law, Novel Signature Homes and its affiliates, and their respective directors, officers, employees, agents, and representatives, shall not be liable for any indirect, incidental, special, consequential, or punitive damages', bold: true },
                { text: ' arising out of or relating to your use of (or inability to use) the Website or any content or services provided on it. This includes, without limitation, damages for personal injury, property damage, loss of profits, loss of data, business interruption, or any other commercial or personal damages or losses, even if foreseeable or even if we have been advised of the possibility of such damages.' },
              ],
            },
            {
              content: [
                { text: 'Direct Damages Cap', bold: true },
                { text: ': To the fullest extent permitted by law, the total liability of Novel Signature Homes (and its affiliates and representatives) for any claims arising out of or relating to these Terms or your use of the Website shall be limited to the amount (if any) you paid us to use the Website or our services in the 12 months preceding the event giving rise to the liability, or US $100, whichever is greater. This means that if you have not paid us any money (for example, if you have only used the free informational parts of our Website), we owe you no damages in relation to your use of the free services, to the extent allowed by law.' },
              ],
            },
            {
              content: [
                { text: 'Exceptions', bold: true },
                { text: ': Nothing in these Terms shall limit or exclude our liability for: (a) death or personal injury caused by our gross negligence or willful misconduct; (b) fraud or fraudulent misrepresentation; or (c) any other liability which cannot be limited or excluded under applicable law. Additionally, some jurisdictions do not allow the exclusion or limitation of certain damages; in those jurisdictions, our liability will be limited to the fullest extent permitted by law.' },
              ],
            },
            {
              content:
                'You agree that any cause of action or claim you may have arising out of or relating to these Terms or the Website must be commenced within one (1) year after the cause of action accrues; otherwise, such cause of action or claim is permanently waived and barred.',
            },
          ]),
        },
        {
          heading: 'Indemnification',
          content: createLexicalContent([
            {
              content: [
                { text: 'You agree to ' },
                { text: 'indemnify, defend, and hold harmless', bold: true },
                { text: ' Novel Signature Homes, its owners, affiliates, licensors, and service providers, and its and their respective officers, directors, employees, and agents (collectively, the “Indemnified Parties”), from and against any and all claims, liabilities, damages, judgments, awards, losses, costs, expenses, or fees (including reasonable attorneys’ fees) that arise out of or relate to your violation of these Terms or your use of the Website.' },
              ],
            },
            {
              content:
                'This includes, for example, your misuse of the Website, your violation of any law or regulation, any content you submit or actions you take that infringe or violate the rights of a third party, or any use of the Website’s content and services other than as expressly authorized in these Terms. We reserve the right, at our own expense, to assume the exclusive defense and control of any matter otherwise subject to indemnification by you (in which event you will cooperate with us in asserting any available defenses). This indemnification obligation will survive termination of your use of the Site and these Terms.',
            },
          ]),
        },
        {
          heading: 'Termination',
          content: createLexicalContent([
            {
              content: [
                { text: 'Termination by Us', bold: true },
                { text: ': We reserve the right to suspend or terminate your access to all or part of our Website at any time, with or without notice, for any reason. This can include, without limitation, if we believe you have violated these Terms, if we cease to operate the Website, or if maintaining your access becomes unlawful or impractical. Where reasonable, we will provide you with notice of termination or suspension, but we are not obligated to do so.' },
              ],
            },
            {
              content: [
                { text: 'Termination by You', bold: true },
                { text: ': You may cease using our Website at any time. If you have an account, you can choose to deactivate it (if that functionality exists) or request that we delete it by contacting us. Termination of your account or stopping use of the Website does not automatically erase data we have collected from you; please see our ' },
                { text: 'Privacy Policy', link: '/privacy-policy' },
                { text: ' for details on how we handle data and how you can request deletion of your personal information.' },
              ],
            },
            {
              content:
                'Upon termination of these Terms for any reason, the provisions that by their nature should survive termination (such as intellectual property rights, disclaimer of warranties, limitations of liability, indemnification, and governing law) will remain in effect.',
            },
          ]),
        },
        {
          heading: 'Governing Law',
          content: createLexicalContent([
            {
              content:
                'These Terms and any dispute or claim arising out of or related to them, or the use of the Website, shall be governed by and construed in accordance with the laws of the State of Texas, USA, without giving effect to any choice or conflict of law provision or rule that would cause the application of the laws of any other jurisdiction. By using our Website, you agree that any legal suit, action, or proceeding arising out of or related to these Terms or the Website shall be instituted exclusively in the state or federal courts located in the State of Texas (and specifically, we default to the courts in Harris County, Texas, where our business operations are based, unless another venue is required by applicable law). You waive any and all objections to the exercise of jurisdiction over you by such courts and to venue in such courts.',
            },
            {
              content:
                'If you access the Website from outside the United States, you are responsible for compliance with local laws. Although our Website may be accessible worldwide, our services are primarily offered in the USA, and our operations are based in Texas. We make no representation that materials on our Site are appropriate or available for use in other locations.',
            },
          ]),
        },
        {
          heading: 'Dispute Resolution',
          content: createLexicalContent([
            {
              content: [
                { text: 'While we do not currently have a mandatory arbitration clause or similar alternative dispute resolution mechanism in these Terms, we encourage you to contact us first to try to resolve any issue informally. Most concerns can be quickly addressed by reaching out to us (see ' },
                { text: 'Contact Information', bold: true },
                { text: ' below). In the event that we cannot resolve a dispute amicably, you and Novel Signature Homes agree to resolve any claim or controversy in accordance with the governing law and jurisdiction clauses above.' },
              ],
            },
            {
              content: [
                { text: 'Class Action Waiver', bold: true },
                { text: ': To the extent permitted by law, you and Novel Signature Homes agree that any proceedings to resolve or litigate any dispute will be conducted solely on an individual basis, and that neither party shall seek to have any dispute heard as a class action, representative action, collective action, or private attorney general action. This means ' },
                { text: 'you waive your right to participate in any class action lawsuit against us', bold: true },
                { text: '.' },
              ],
            },
          ]),
        },
        {
          heading: 'Changes to These Terms',
          content: createLexicalContent([
            {
              content:
                'We may revise or update these Terms from time to time at our sole discretion. If we make changes, we will post the updated Terms on this page and update the “Effective as of” date at the top. In some cases, we may notify you of changes more prominently (such as via a notice on our homepage or via email, if you have provided one), especially if the changes are material. Your continued use of the Website following the posting of revised Terms means that you accept and agree to the changes. If you do not agree with the new Terms, you must stop using the Website.',
            },
            {
              content:
                'We recommend you review these Terms periodically to ensure you understand the terms and conditions that apply to your use of the Website. Any amended Terms will supersede all previous versions.',
            },
          ]),
        },
        {
          heading: 'Miscellaneous',
          content: createLexicalContent([
            {
              content: [
                { text: 'Severability', bold: true },
                { text: ': If any provision of these Terms is held by a court of competent jurisdiction to be invalid, illegal, or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of the Terms will continue in full force and effect. In other words, the invalid portion will be severed and the rest of the agreement remains valid and enforceable.' },
              ],
            },
            {
              content: [
                { text: 'No Waiver', bold: true },
                { text: ': Our failure to enforce any right or provision of these Terms will not be deemed a waiver of such right or provision. Any waiver must be in writing to be effective. A waiver of any breach or default will not be a waiver of any other or subsequent breach or default.' },
              ],
            },
            {
              content: [
                { text: 'Entire Agreement', bold: true },
                { text: ': These Terms (along with our ' },
                { text: 'Privacy Policy', link: '/privacy-policy' },
                { text: ' and ' },
                { text: 'Cookie Policy', link: '/cookie-policy' },
                { text: ', and any additional terms for specific features or services that we may provide on the Website) constitute the entire agreement between you and Novel Signature Homes regarding the Website and supersede all prior and contemporaneous understandings, agreements, representations, and warranties, both written and oral, regarding the Website.' },
              ],
            },
            {
              content: [
                { text: 'Assignment', bold: true },
                { text: ': You may not assign or transfer any of your rights or obligations under these Terms without our prior written consent. We may assign our rights and obligations to a third party (for example, if we undergo a merger or acquisition) without notice to you. These Terms will inure to the benefit of and be binding upon each party’s successors and permitted assigns.' },
              ],
            },
            {
              content: [
                { text: 'Headings', bold: true },
                { text: ': The section headings in these Terms are for convenience only and have no legal or contractual effect.' },
              ],
            },
          ]),
        },
        {
          heading: 'Contact Information (Terms of Use)',
          content: createLexicalContent([
            {
              content:
                'If you have any questions, concerns, or requests regarding this Privacy Policy or our handling of your personal information, please contact us at:',
            },
            {
              content: [
                { text: 'Novel Signature Homes', bold: true },
                { text: '\nEmail: ' },
                { text: 'info@novelsignaturehomes.com', bold: true, link: 'mailto:info@novelsignaturehomes.com' },
                { text: '\nPhone: ' },
                { text: '+1(606)-707-5050', bold: true, link: 'tel:+1(606)-707-5050' },
              ],
            },
          ]),
        },
      ],
    },
  }

  if (doc) {
    console.log(`Updating existing terms-and-conditions page (ID: ${doc.id})...`)
    await payload.update({
      collection: 'pages',
      id: doc.id,
      context: {
        disableRevalidate: true,
      },
      data: termsData as any,
    })
  } else {
    console.log('Creating new terms-and-conditions page document in Pages collection...')
    await payload.create({
      collection: 'pages',
      context: {
        disableRevalidate: true,
      },
      data: {
        slug: 'terms-and-conditions',
        _status: 'published',
        publishedAt: new Date().toISOString(),
        ...termsData,
      } as any,
    })
  }

  console.log('Successfully populated Terms & Conditions page document in Payload CMS!')
  process.exit(0)
}

populateTermsPage().catch((err) => {
  console.error('Error populating Terms & Conditions page:', err)
  process.exit(1)
})
