# IT Infrastructure Risk Assessment: Microsoft Dependency at the University of Akureyri
**Prepared by:** Magnús Smári Smárason, AI Project Manager, University of Akureyri
**Date:** 23 February 2026

***
## Executive Summary
The University of Akureyri (UNAK) operates its core IT services — email, identity management, document collaboration, and cloud storage — through the Menntaský tenant, the shared Microsoft 365 environment for Icelandic public universities and educational institutions. Participation in the centrally negotiated state contract with Microsoft is mandatory for state institutions. The university now faces an obligation to procure approximately 70 Microsoft 365 Copilot licences, deepening the institution's dependency on a single foreign vendor and raising significant questions about cost control, IT sovereignty, and long-term strategic flexibility.[^1][^2][^3]

This report presents verified facts drawn from Icelandic government audits, EU regulatory decisions, and recent European case law. It classifies the current Microsoft dependency — particularly the mandated Copilot expansion — as a **high-risk** element of the university's IT infrastructure.

***
## 1. The State Microsoft Contract and Menntaský
### 1.1 Background
In 2018, Iceland's Ministry of Finance and Economic Affairs entered into a centralised agreement with Microsoft covering software licences for all A-division state institutions. Two contracts were signed: one for educational institutions and one for general state agencies. These were renewed for five years in spring 2021.[^1][^4]

The stated objectives were to:

- Reduce costs through collective purchasing
- Improve oversight of software usage and expenditure
- Reduce operational risk and increase standardisation across government IT[^1]

Participation was made compulsory — individual institutions were not given the option to decline.[^1]
### 1.2 Menntaský
Menntaský is the Microsoft 365 cloud tenant shared by Icelandic public universities, including UNAK. It is operated by the University of Iceland's IT division, which handles deployment, migration, the service desk for institutional contacts, and security advisory. Individual schools do not have admin access to the Microsoft portal; instead, changes are managed locally through Active Directory and synced to Azure AD.[^5][^2][^3]

This architecture means that UNAK does not independently control its own cloud environment. Decisions about tenant configuration, security policies, and licensing are made centrally.

***
## 2. Findings from National Audit Office Reports
### 2.1 The 2023 Audit of the Microsoft Contract
In October 2023, the National Audit Office (Ríkisendurskoðun) delivered a special audit report to Parliament on the state's Microsoft contract. Key findings included:[^6][^4][^7]

- **No comprehensive needs assessment** was conducted across institutions before signing the 2018 agreement
- **No alternatives analysis** was carried out to evaluate options other than Microsoft
- **The projected savings of 5.5 billion ISK per year (by 2023) could not be verified** — the Ministry was unable to demonstrate that the expected financial benefit had materialised
- Documentation of the implementation was **inadequate**
- Cases of **wasted expenditure** during implementation were identified
- Unresolved concerns about **security and data protection** remained
### 2.2 The 2025 Rapid Audit on IT Procurement
In March 2025, Ríkisendurskoðun published a rapid audit examining IT procurement across nine major state entities (including Landspítali, Skatturinn, and Háskóli Íslands) for the period 2018–2023. The findings revealed:[^8][^9][^10]

- Annual state IT spending (software, development, operations) is estimated at **12–15 billion ISK**[^11][^8]
- A **small number of vendors dominate** the market: three suppliers hold nearly all custom software contracts, with one vendor commanding approximately 60% of purchases[^10]
- There is **no comprehensive inventory** of the state's bespoke and legacy software[^10]
- **Significant procurement occurs outside competitive bidding**, particularly for maintenance of older systems[^9]
- IT governance across state institutions has been **fragmented, with little to no coordination**[^10]

| Finding | Detail | Source |
|---------|--------|--------|
| Annual IT spend | 12–15 billion ISK | [^8] |
| Vendor concentration (custom software) | 3 vendors hold nearly all contracts; 1 vendor ≈ 60% | [^10] |
| Inventory of bespoke software | Does not exist | [^10] |
| Non-competitive procurement | Substantial, especially for legacy maintenance | [^9] |
| Institutional coordination | Little to none | [^10] |

Ríkisendurskoðun recommended that the Ministry of Finance map the state's software dependencies, strengthen IT governance, and ensure procurement decisions are based on proper analysis of alternatives over the full lifecycle.[^8][^9]

***
## 3. The Copilot Obligation
### 3.1 The Mandate
UNAK is now required to purchase approximately 70 Microsoft 365 Copilot licences. This obligation arises within the framework of the centralised state Microsoft contract, where individual institutions have limited autonomy to refuse bundled products or services.
### 3.2 Copilot Pricing
Microsoft 365 Copilot for education is priced at **$18 per user per month** (announced October 2025, available from December 2025). This is a discounted rate compared to the standard commercial price of $30 per user per month.[^12][^13]

At 70 licences × $18/month, the estimated annual cost is approximately **$15,120/year** (≈ 2.1 million ISK at current exchange rates), on top of existing Microsoft 365 base licence costs.
### 3.3 Copilot ROI Evidence
Independent evidence on the return on investment from Microsoft 365 Copilot deployments is weak:

- A 2025 Gartner survey of 215 IT leaders found that while 94% reported some measurable benefit, **only 6% had completed global rollouts** and **72% remained stuck in pilot phases**[^14]
- A separate Gartner survey found that only **5% of organisations that finished pilots moved to larger deployment**[^15]
- Nearly half of respondents rated Copilot as providing only **"some value, shows promise"**[^15]
- Gartner analysts stated that ROI measurement remains **"quite challenging"** and that risk mitigation efforts required are **"significantly greater" than most organisations planned for**[^15]
- Vendor-funded ROI studies **may overstate benefits** as assumptions lack external validation[^16]
### 3.4 Upcoming Price Increases
Microsoft announced in December 2025 that Microsoft 365 prices will increase globally from **1 July 2026**:[^17]

| Plan | Current Price | New Price (July 2026) | Increase |
|------|--------------|----------------------|----------|
| Microsoft 365 E3 | $36/user/month | $39/user/month | +8.3% |
| Microsoft 365 E5 | $57/user/month | $60/user/month | +5.3% |
| Office 365 E3 | $23/user/month | $26/user/month | +13% |
| Microsoft 365 Business Basic | $6/user/month | $7/user/month | +16.7% |
| Microsoft 365 F1 | $2.25/user/month | $3/user/month | +33% |

These increases apply to commercial, government, and education customers. They will compound the cost of the Copilot add-on.[^18][^17]

***
## 4. EU Legal and Regulatory Context
### 4.1 CJEU Case C-578/23: Self-Induced Lock-In
On 9 January 2025, the Court of Justice of the European Union ruled in Case C-578/23 that **public authorities must actively avoid supplier lock-in**. The case involved the Czech Republic's tax authority, which had awarded a direct contract to IBM based on technical dependency and exclusive intellectual property rights that the authority itself had created through earlier contracting failures.[^19][^20]

The CJEU held that:

- Exceptions for non-competitive procurement must be **interpreted strictly**[^19]
- Authorities **cannot invoke their own prior failures** (e.g., not securing IP rights or interoperability) to justify direct awards[^20]
- Authorities must take **"all reasonable steps"** from the inception of IT projects to prevent lock-in and facilitate future competition[^21][^20]
- The assessment of lock-in must cover the **entire period** between the original contract and subsequent awards[^19]

This ruling has direct relevance to the Icelandic state's Microsoft contract, where the 2023 audit found no alternatives analysis and no structured exit planning.[^4]
### 4.2 EDPS: European Commission's Use of Microsoft 365
In March 2024, the European Data Protection Supervisor found that **the European Commission itself had infringed multiple provisions** of EU data protection law (Regulation 2018/1725) through its use of Microsoft 365. Specifically:[^22][^23]

- The Commission **failed to specify** what personal data types were collected and for what purposes[^23]
- The Commission **could not guarantee** that Microsoft processed data strictly under the Commission's documented instructions[^23]
- The Commission **failed to provide adequate safeguards** for data transferred outside the EU/EEA[^24][^23]

The EDPS ordered the Commission to **suspend all non-compliant data flows to Microsoft** by 9 December 2024. The Commission subsequently undertook extensive remediation to demonstrate compliance.[^22][^23]

If the European Commission — with its legal resources and negotiating power — struggled to maintain data protection compliance while using Microsoft 365, smaller institutions face proportionally greater challenges.
### 4.3 EDPB Coordinated Enforcement on Cloud in the Public Sector
In 2022, the European Data Protection Board launched a coordinated enforcement action involving 22 supervisory authorities investigating the use of cloud services by over 80 public bodies across the EEA. The investigation found widespread challenges with GDPR compliance, and the EDPB issued recommendations that public bodies should:[^25][^26][^27][^28]

- Conduct data protection impact assessments **before** adopting cloud services
- Ensure the roles of controller and processor are clearly defined in contracts
- Involve data protection officers in the selection of cloud providers
- Include detailed data protection requirements in procurement documents
### 4.4 The US CLOUD Act
The US Clarifying Lawful Overseas Use of Data Act (2018) requires US-based technology providers to produce data under their control upon lawful US government request, **regardless of where the data is physically stored**. This means data held by Microsoft in European data centres remains accessible to US authorities. The CLOUD Act is widely recognised as creating a structural conflict with the GDPR, particularly Article 48.[^29][^30][^31][^32]

***
## 5. Real-World Sovereignty Incidents
### 5.1 ICC Prosecutor Email Blocking (2025)
In February 2025, the US government sanctioned Karim Khan, the Chief Prosecutor of the International Criminal Court. As a result, Khan's **official Microsoft email account was blocked**. The ICC reportedly had to migrate the prosecutor to the Swiss-based Proton Mail service.[^33][^34][^35]

Microsoft initially denied blocking the account, but in February 2026, Microsoft asked the UK Parliament to correct the record after one of its senior spokespeople gave testimony containing an **"inaccuracy"** regarding the events. Dutch press reported that Microsoft had told the ICC it would have to remove the sanctioned prosecutor from its services, or Microsoft would terminate email for the entire organisation.[^36]

This incident demonstrates that a foreign government's political decisions can directly disrupt the IT operations of international institutions relying on US-based cloud platforms.
### 5.2 Chinese Institutions Locked Out
The same mechanism was applied to a Chinese genome company and a Chinese university, whose access to Microsoft services was suspended under US sanctions.[^33]

***
## 6. European Institutions Moving Away from Microsoft
Several European public institutions have recently initiated transitions away from Microsoft products, citing sovereignty, cost, and lock-in concerns.

| Institution / Country | Action | Status | Annual Savings |
|----------------------|--------|--------|----------------|
| Schleswig-Holstein (Germany) | Migration to LibreOffice, Open-Xchange | ~80% of workstations migrated[^37] | €15 million/year[^37] |
| Denmark (Ministry of Digitalisation) | Transition to LibreOffice and Linux | Announced summer 2025; full transition targeted by autumn 2025[^38][^39] | Not yet quantified |
| Copenhagen & Aarhus (Denmark) | Phase-out of Microsoft software | Announced 2025[^40] | Not yet quantified |

Denmark's Minister of Digitalisation stated: **"We must never make ourselves so dependent on so few that we can no longer act freely"**.[^38]

Schleswig-Holstein's migration involved a one-time investment of €9 million, which is expected to pay for itself within less than a year against the €15 million in annual licence savings.[^37][^41]

***
## 7. Risk Classification
Based on the evidence presented above, the Microsoft dependency — and particularly the mandated Copilot expansion — is classified as **high risk** across the following dimensions:

| Risk Category | Assessment | Rationale |
|---------------|------------|-----------|
| **Vendor Lock-In** | High | No alternatives analysis conducted; no exit strategy; mandatory participation; deep integration through Menntaský[^4][^1] |
| **Financial Exposure** | High | Copilot adds ~$15,120/year with weak ROI evidence[^14][^15]; base licence prices increasing July 2026[^17]; costs are escalating with no competitive pressure |
| **Data Protection Compliance** | High | EDPS found the European Commission non-compliant using the same platform[^23]; CLOUD Act creates structural GDPR conflict[^30] |
| **Operational Continuity** | High | ICC incident demonstrates service can be disrupted by foreign political decisions[^33][^36]; single platform for identity, email, documents |
| **Institutional Autonomy** | High | UNAK has no admin access to the Microsoft portal[^3]; licensing decisions are made centrally; no ability to refuse bundled products |

***
## 8. Recommendations
The following actions are recommended for consideration:

1. **Conduct a formal needs assessment** for the 70 Copilot licences before procurement, documenting the specific use cases, expected benefits, and measurable success criteria
2. **Request a cost-benefit analysis** from the central contract administrators, including total cost of ownership over the contract period and comparison with alternative AI tools
3. **Map current dependencies** — identify which UNAK functions are wholly dependent on Microsoft 365 and which could operate on alternative platforms
4. **Develop an exit strategy outline** — even if a full transition is not imminent, document what it would take to migrate core functions away from Microsoft, consistent with the anti-lock-in principles established in CJEU C-578/23[^19]
5. **Request a data protection impact assessment** for Copilot deployment, addressing data flows, processing purposes, and CLOUD Act exposure, in line with EDPB recommendations[^26]
6. **Monitor European developments** — track the outcomes of Danish and German transitions for applicable lessons, and evaluate emerging open-source alternatives for specific functions
7. **Raise the issue at the institutional and ministerial level** — the 2025 Ríkisendurskoðun audit explicitly called for stronger IT governance and coordination; UNAK's concerns should be formally communicated as part of that process[^8]

***
## Key
All claims in this report are supported by inline citations. Primary sources include:

- Ríkisendurskoðun, *Samningur ríkisins við Microsoft — stjórnsýsluúttekt* (October 2023)
- Ríkisendurskoðun, *Innkaup ríkisaðila á upplýsingatækni — hraðúttekt* (March 2025)
- CJEU, Case C-578/23, Judgment of 9 January 2025
- EDPS, Decision on the European Commission's use of Microsoft 365 (March 2024)
- EDPB, 2022 Coordinated Enforcement Action Report (January 2023)
- Gartner, 2025 Microsoft 365 Copilot Survey
- Microsoft, Microsoft 365 pricing announcement (December 2025)

---

## References

1. [Útgefið efni > Samningur ríkisins við Microsoft](https://www.rikisend.is/skyrslur/nanar?id=2030) - 23.10.2023. Þann 10. mars 2022 samþykkti Alþingi, með vísan til 17. gr. laga nr. 46/2016 um ríkisend...

2. [Hjálparsíða Háskólans á Akureyri - Confluence - Atlassian](https://unak.atlassian.net/wiki/spaces/LEIB/pages/1186660032/Office+365)

3. [Um verkefnið](https://menntasky.is/um-verkefnid/) - Um verkefnið Menntaskýja verkefnið er rekið af Fjársýslu Ríkisins en þjónustuaðili Menntaskýsins er ...

4. [Samningur ríkisins við Microsoft - stjórnsýsluúttekt](https://www.rikisend.is/reskjol/files/Skyrslur/2023-samningur-rikisins-vid-microsoft.pdf) - Í apríl 2023 tók Umbra við leyfaumsýslu vegna samnings ríkisins við Microsoft. Samhliða þeirri breyt...

5. [Menntaský | Háskóli Íslands](https://hi.is/haskolinn/menntasky) - Háskóli Íslands býður upp á fjölbreytt nám á grunn og framhaldsstigi. Lögð er áhersla á fræðilega ná...

6. [Vanmetið umfang breytinga vegna Microsoft-samnings](https://www.rikisend.is/frettir/nanar?id=2616) - Eftirlitsstofnun Alþingis sem framkvæmir m.a. endurskoðun á ríkisreikningi, fjárhagsendurskoðun, stj...

7. [Gagnrýna undirbúning og sóun vegna samnings ríkisins ...](https://www.ruv.is/frettir/innlent/2023-10-23-gagnryna-undirbuning-og-soun-vegna-samnings-rikisins-vid-microsoft-394808) - Ríkið undirbjó samningaviðræður sínar við Microsoft ekki nógu vel þegar gerður var heildarsamningur ...

8. [Innkaup ríkisaðila á upplýsingatækni (hraðúttekt)](https://www.rikisendurskodun.is/skyrslur/nanar?id=2071) - 02.04.2025. Ríkisendurskoðun ákvað, á grundvelli laga nr. 46/2016 um ríkisendurskoðanda og endurskoð...

9. [Innkaup ríkisaðila á upplýsingatækni](https://www.rikisendurskodun.is/reskjol/files/Skyrslur/2025_innkaup_rikisadila_a_upplysingataekni.pdf) - Innkaup ríkisaðila á upplýsingatækni. HRAÐÚTTEKT. RÍKISENDURSKOÐUNAR. Skýrsla til Alþingis. Mars 202...

10. [Lítil samhæfing við milljarða innkaup á upplýsingatækni](https://vb.is/frettir/litil-samhaefing-vid-milljarda-innkaup-a-upplysingataekni/) - Þrír birgjar eru með nær öll viðskiptin í sérsmíðuðum hugbúnaði fyrir ríkisstofnanir.

11. [616/156 álit: skýrsla Ríkisendurskoðunar um innkaup ...](https://www.althingi.is/altext/156/s/0616.html) - Með bréfi, dags. 31. mars 2025, sendi forseti Alþingis skýrslu Ríkisendurskoðunar um innkaup ríkisað...

12. [New Microsoft 365 Copilot for Education Offering is ...](https://www.thurrott.com/a-i/328438/new-microsoft-365-copilot-for-education-offering-is-coming-in-december) - The new offering will launch in December and be priced at $18 per user per month in the US, which wi...

13. [Microsoft 365 Copilot for education: discounted variant ...](https://www.linkedin.com/posts/licensing-school_its-been-two-years-since-the-release-of-activity-7386308388957351936-MVXg) - It's been two years since the release of Microsoft 365 Copilot, and now Microsoft reveal for the fir...

14. [Microsoft's Copilot Paradox: 94% Report Benefits, 6% ...](https://www.linkedin.com/pulse/microsofts-copilot-paradox-94-report-benefits-6-deploy-louis-columbus-fv4gc) - Gartner's 2025 Microsoft 365 Copilot Survey of 215 IT leaders reveals a stark paradox: 94% report me...

15. [Gartner: Microsoft Copilot hype offset by ROI and readiness ...](https://www.techpartner.news/news/gartner-microsoft-copilot-hype-offset-by-roi-and-readiness-realities-618118) - Of those that had finished pilots, five percent said their organisations were moving to larger deplo...

16. [Enterprise AI ROI: Microsoft Copilot's Growth Playbook - AI CERTs](https://www.aicerts.ai/news/enterprise-ai-roi-microsoft-copilots-growth-playbook/) - Microsoft Copilot has crossed 100 million monthly active users, signaling mainstream acceptance of g...

17. [Microsoft to lift productivity suite prices for businesses, governments](https://www.reuters.com/business/microsoft-lift-productivity-suite-prices-businesses-governments-2025-12-04/) - Microsoft will increase prices for its Microsoft 365 productivity suites globally starting July 2026...

18. [Microsoft 365 Pricing Increase in July 2026](https://office365itpros.com/2025/12/08/microsoft-365-pricing-increase/) - New Microsoft 365 Pricing Goes into Effect on July 1, 2026 ... Equivalent increases apply to other s...

19. [Contracting authorities must actively avoid lock-in with IT ...](https://www.lexgo.lu/en/news-and-articles/13955-contracting-authorities-must-actively-avoid-lock-in-with-it-suppliers) - Contracting authorities must actively avoid lock-in with IT…

20. [Contracting authorities must actively avoid lock-in with IT suppliers](https://www.loyensloeff.com/insights/news--events/news/contracting-authorities-must-actively-avoid-lock-in-with-it-suppliers/) - The CJEU ruled that contracting authorities must actively avoid supplier lock-in. This decision is p...

21. [The Advocate General of the European Court of Justice on lock-in ...](https://haavind.no/en/the-advocate-general-of-the-european-court-of-justice-on-lock-in-effect-in-it-contracts/) - ... C-578/23. The case concerns the right to directly award a contract to an existing IT supplier as...

22. [European Commission's use of Microsoft 365 infringes ...](https://baylos.com/blog/european-commission-s-use-of-microsoft-365-infringes-data-protection-regulation)

23. [European Commission's use of Microsoft 365 infringes data ...](https://www.edps.europa.eu/press-publications/press-news/press-releases/2024/european-commissions-use-microsoft-365-infringes-data-protection-law-eu-institutions-and-bodies_en) - Following its investigation, the EDPS has found that the European Commission (Commission) has infrin...

24. [Data Protection Weekly 10/2024](https://cedpo.eu/data-protection-weekly-10-2024/)

25. [EDPB Coordinated Enforcement Action on Use of Cloud - OneTrust](https://www.onetrust.com/blog/edpb-launches-coordinated-enforcement-action-into-use-of-cloud-services-by-public-bodies/) - The EDPB launched its first coordinated enforcement action on the use of cloud services in the publi...

26. [EDPB Releases Outcome of its Investigation into the Use of Cloud ...](https://www.insideprivacy.com/eu-data-protection/edpb-releases-outcome-of-its-investigation-into-the-use-of-cloud-based-services-by-the-public-sector/) - On January 18, 2023, the European Data Protection Board (“EDPB”) published a report on the outcome o...

27. [Cloud services in the public sector: EDPB report and ...](https://www.dataprotectionauthority.be/citizen/news/2023/01/24/cloud-services-in-the-public-sector-edpb-report-and-observations-by-the-be-dpa) - Elastic website

28. [Launch of coordinated enforcement on use of cloud by public sector](https://www.edpb.europa.eu/news/news/2022/launch-coordinated-enforcement-use-cloud-public-sector_en)

29. [The CLOUD Act and Transatlantic Trust - CSIS](https://www.csis.org/analysis/cloud-act-and-transatlantic-trust) - While the CLOUD Act attempted to clarify government access to extraterritorial data in an expanding ...

30. [CLOUD Act vs. GDPR: The Conflict About Data Access ...](https://www.exoscale.com/blog/cloudact-vs-gdpr/) - That law allows U.S. authorities to demand disclosure of data under a provider's control, regardless...

31. [Prevent CLOUD Act Risks: Secure European Data ...](https://www.kiteworks.com/gdpr-compliance/cloud-act-european-data-protection/) - Learn how to protect European data from US government access under the CLOUD Act with customer-manag...

32. [Why the CLOUD Act poses a real risk to European companies](https://www.netfiles.com/en/blog/cloud-act-a-real-risk-to-european-companies) - What the CLOUD Act means for secure data exchange, why US providers are a risky choice – and which s...

33. [Digital sovereignty: Microsoft arbitrarily blocks access to e-mail ...](https://borncity.com/win/2025/05/19/digital-sovereignty-microsoft-arbitrarily-blocks-access-to-e-mail-cloud-prosecutor-internation-criminal-court-chinese-university-institution/) - [German]Short article of the type “Digital sovereignty: have you finally heard the shot”. Microsoft ...

34. [Microsoft allegedly blocked the email of the Chief ...](https://dig.watch/updates/microsoft-allegedly-blocked-the-email-of-the-chief-prosecutor-of-the-international-criminal-court) - How can a blocked email account spark a global debate on digital sovereignty, tech trust, and the fu...

35. [Microsoft's ICC email block reignites European data ...](https://www.computerweekly.com/opinion/Microsofts-ICC-email-block-reignites-European-data-sovereignty-concerns) - If so, the news that the International Criminal Court (ICC) chief prosecutor and his staff have had ...

36. [Microsoft throws spox under the bus in ICC email flap](https://www.theregister.com/2026/02/18/microsoft_asks_uk_parliament_to_correct_record/) - ... with the International Criminal Court (ICC) in response to US sanctions. ... ICC chief prosecuto...

37. [Hurray! This German State Decides to Save €15 Million ...](https://itsfoss.com/news/german-state-ditch-microsoft/) - Schleswig-Holstein's migration to LibreOffice reaches 80% completion, with a one-time €9 million inv...

38. [Denmark's Digital Ministry shifts from Microsoft to LibreOffice in push ...](https://www.computing.co.uk/news/2025/denmark-digital-ministry-drops-microsoft) - Denmark's Ministry of Digitalisation has announced its decision to transition from Microsoft Office ...

39. [Denmark Wants to Dump Microsoft Software for Linux ...](https://www.pcmag.com/news/denmark-wants-to-dump-microsoft-software-for-linux-libreoffice) - A government ministry in Denmark is preparing to phase out Microsoft software and switch to the open...

40. [Danish government agency to ditch Microsoft software in push for digital independence](https://therecord.media/denmark-digital-agency-microsoft-digital-independence) - Denmark's digital affairs ministry says it plans to switch to the open source LibreOffice software a...

41. [Goodbye, Microsoft: Schleswig-Holstein relies on Open ...](https://www.heise.de/en/news/Goodbye-Microsoft-Schleswig-Holstein-relies-on-Open-Source-and-saves-millions-11105459.html) - Goodbye, Microsoft: Schleswig-Holstein relies on Open Source and saves millions · Almost 80 percent ...

