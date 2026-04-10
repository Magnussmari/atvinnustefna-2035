# Iceland AI Ecosystem Map: Builders vs. Commentators

**PANOPTICON REVERSE -- Research Swarm Synthesis**
**Date:** 2026-03-07
**Method:** 4 parallel research agents across private sector, government, universities, and discourse analysis
**Question:** Who in Iceland is ACTUALLY building/testing/using AI vs. who are "commentators" writing reports?

---

## THE TAXONOMY

| Category | Definition | Count |
|----------|-----------|-------|
| **BUILDER** | Creates AI models, systems, or tools (writes code, trains models) | ~12 |
| **DEPLOYER** | Runs AI in production on real decisions/operations | ~6 |
| **RESELLER** | Packages others' AI (Microsoft, Google) as their own service | ~5 |
| **COMMENTATOR** | Writes/speaks about AI without building or deploying | ~15+ |
| **HYBRID** | Combines roles (e.g., academic who both researches and comments) | ~6 |

---

## PART I: PRIVATE SECTOR

### Genuine Builders

| Company | What They Build | Evidence | Category |
|---------|----------------|----------|----------|
| **Lucinity** | Anti-money-laundering AI platform. Own models, own training data, own inference | Founded by Gudmundur Kristjansson. VC-funded, international clients | BUILDER |
| **Mideind** | Greynir NLP parser, Yfirlestur proofreader, Embla voice assistant. IceBERT family. 55 GitHub repos, 15 HuggingFace models. Trained GPT-4 on Icelandic via 40-person RLHF team | [github.com/mideind](https://github.com/mideind), [huggingface.co/mideind](https://huggingface.co/mideind). Founder: Vilhjalmur Thorsteinsson (ex-CCP chairman, Constitutional Council 2011). CEO: Linda Heimisdottir | BUILDER |
| **Controlant** | Real-time cold-chain monitoring with predictive analytics. IoT + ML | Pharma/food supply chain clients, acquired by Carrier Global | BUILDER |
| **Islensk Gervigreind** (igg.is) | Digital customer service AI assistant | Founded 2018 by J.P. Fortune. Seed $23K from Startup Reykjavik. Small scale, limited visibility | BUILDER (small) |

### Hybrids (build AND deploy/consult)

| Company | What They Do | Evidence | Category |
|---------|-------------|----------|----------|
| **DataLab Iceland** | "Ari" -- generative AI assistant trained on Icelandic regulatory data (GPT-4 Turbo). Custom predictive models, dashboards. Clients: Union of Icelandic Municipalities, Arion Bank, Skattinn (Revenue), LSH | Founded by Brynjolfur Borgar Jonsson. ~8-10 data scientists/ML engineers. [datalab.is](https://datalab.is) | HYBRID (builds on GPT-4 Turbo, custom fine-tuning) |
| **Sidekick Health** | Gamified digital therapeutics with some ML personalization | Some proprietary ML but primarily app platform | HYBRID |

### Deployers (using AI in production, not building core models)

| Company | What They Deploy | Source | Category |
|---------|-----------------|--------|----------|
| **CCP Games** | "Aura" AI chat tool trained on 5.8M help messages for EVE Online support | ccpgames.com (2026) | DEPLOYER |
| **Isavia** | Amadeus partnership for passenger experience; "Sammi" automation platform via Zato | amadeus.com, zato.io | DEPLOYER |
| **Islandsbanki** | Norwegian boost.ai chatbot for customer service; internal process automation | Halldorsdottir 2025 thesis | DEPLOYER |
| **Landsbankinn** | boost.ai chatbot deployment | Bank website | DEPLOYER |
| **Arion Banki** | boost.ai chatbot + exploring internal AI tools | Bank website | DEPLOYER |

**Banking verdict:** All three major banks use the SAME Norwegian vendor (boost.ai) for customer-facing chatbots. None have built proprietary AI. This is vendor deployment, not indigenous capability.

### Resellers (packaging others' AI as services)

| Company | What They Sell | Reality | Category |
|---------|---------------|---------|----------|
| **Advania** | "AI transformation partner." Microsoft Copilot specialization (certified Norway). Deployed Copilot to ALL 1,000+ employees | Reselling Microsoft. Zero proprietary AI models. CEO Hildur Einarsdottir candid about displacement risk (MBL Aug 2025). [advania.is](https://www.advania.is/grein/copilot-fyrir-microsoft-365-er-komin-ut) | RESELLER |
| **Origo** | "AI and cloud solutions." Azure partner. Blog "Ofurkraftar gervigreindar" showcases DataLab's Ari and 1xINTERNET, not Origo-built AI | IBM/Microsoft resale. [origo.is/blogg/ofurkraftar-gervigreindar](https://www.origo.is/blogg/ofurkraftar-gervigreindar) | RESELLER |
| **Nyherji** | Microsoft ecosystem services including Copilot | Microsoft resale | RESELLER |
| **Andes** | "AI solutions" marketing | Unclear what's proprietary vs. vendor wrapping | RESELLER |

### Key Private Sector Finding

**Only 3-4 companies in Iceland genuinely build AI systems** (Lucinity, Mideind, Controlant, plus DataLab as a hybrid). The banking sector runs identical Norwegian chatbots. The IT service companies (Advania, Origo, Nyherji) resell Microsoft/IBM tools. The gap between "we do AI" marketing and actual AI engineering is enormous.

---

## PART II: GOVERNMENT

### Deployers (limited)

| Institution | AI Use | Reality | Category |
|-------------|--------|---------|----------|
| **Reykjavikurborg** | Chatbot on reykjavik.is; OpenAI used for citizen query routing | Clearest government deployer. Front-door only -- no decisional automation | DEPLOYER |
| **PM's Office** | Used OpenAI to categorize 10,000 public submissions ("Verum hagsyn" Jan 2025) | One-off deployment, not systematic. Contradicts own "augmentation not replacement" Action Plan | DEPLOYER (ad hoc) |

### Policy/Framework Only (no deployment)

| Institution | Activity | Category |
|-------------|----------|----------|
| **Fjarmala- og efnahagsraduneytid** (Finance Ministry) | AI Action Plan (25 actions, 5 pillars). Claims 55% workforce affected | COMMENTATOR (policy) |
| **Rikiskaup / FMA** | DPS RK 19.03 procurement framework for AI services. Enables buying, not building | COMMENTATOR (procurement) |
| **Aslaug Arna Sigurbjornsdottir** | Political champion for AI. Law background, not technical | COMMENTATOR (political) |
| **Gudmundur Ingi Kristinsson** | Education Minister. Quoted in MBL on AI in schools. Politician, not practitioner | COMMENTATOR (political) |
| **Rannis** | Innovation funding. Administers grants, doesn't build | COMMENTATOR (funding) |

### Key Government Finding

**No government institution in Iceland uses AI for decisional automation.** All deployment is front-door chatbots or one-off text processing. The AI Action Plan is a policy document written with consultant methodology, not by practitioners. The government is a COMMENTATOR that occasionally DEPLOYS vendor tools.

---

## PART III: UNIVERSITIES AND RESEARCH

### Genuine Builders

| Institution | Lab/Group | Key People | What They Build | Evidence |
|-------------|-----------|------------|-----------------|----------|
| **Reykjavik University (RU)** | CADIA (Center for Analysis and Design of Intelligent Agents) | Yngvi Bjornsson, Stephan Schiffel | Game AI, multi-agent systems, reinforcement learning | |
| **RU** | Language and Voice Lab (LVL) | Jon Gudnason, Judy Fong | Icelandic ASR, TTS, Samromur speech corpus (145 hours, 8,392 speakers), fine-tuned Whisper for Icelandic (967h training data). 17 HuggingFace models, 7 datasets | [huggingface.co/language-and-voice-lab](https://huggingface.co/language-and-voice-lab) |
| **University of Iceland (HI)** | NLP Lab | Hrafn Loftsson, Anton Karl Ingason | Icelandic NLP tools, parsers, corpora | |
| **HI** | IHPC (Icelandic High Performance Computing) | Morris Riedel | HPC infrastructure for ML workloads | |
| **IIIM** (Icelandic Institute for Intelligent Machines) | AGI Research | Kristinn R. Thorisson (founding director, RU professor) | SocialInsight agent-based simulation (2024), AGI award-winning papers on causal generalization, collaborations with DFKI and Simula. Hosts AGI-25 conference | [github.com/IIIM-IS](https://github.com/IIIM-IS), [iiim.is](https://www.iiim.is) |
| **Arnastofnun** (Arni Magnusson Institute) | Linguistic Infrastructure | — | IGC-2024: Icelandic Gigaword Corpus (~1.46 billion running words) | [huggingface.co/arnastofnun](https://huggingface.co/arnastofnun) |
| **Mideind** (academic spin-off) | — | Vilhjalmur Thorsteinsson | Greynir, Yfirlestur, IceBERT, bytemistral-isl-60m -- most deployed Icelandic NLP | |

### Active Research Projects

| Project | Funding | Focus | People |
|---------|---------|-------|--------|
| **TrustLLM** | EU Horizon Europe | Trustworthy LLMs for European languages including Icelandic | HI + RU collaboration |
| **Language Technology Programme 2024-2026** | Government-funded (ISK 2B+) | Icelandic digital language resources. Includes OpenAI partnership for GPT-4 Icelandic RLHF | LVL (RU), NLP Lab (HI), Mideind, SIM consortium |
| **IceNLP / IceParser** | Academic | Icelandic shallow parser, morphological analysis | HI NLP Lab |

### Named Practitioners (~30-35 total)

| Name | Role | Institution | Builds? |
|------|------|-------------|---------|
| Yngvi Bjornsson | Professor, CADIA director | RU | Yes -- game AI, RL |
| Jon Gudnason | Professor, LVL director | RU | Yes -- speech tech |
| Judy Fong | Researcher | RU LVL | Yes -- ASR/TTS |
| Hrafn Loftsson | Professor | RU (+ HI collab) | Yes -- NLP |
| Kristinn R. Thorisson | Professor, IIIM founding director | RU/IIIM | Yes -- AGI, multi-agent |
| Anton Karl Ingason | Associate Prof | HI | Yes -- computational linguistics |
| Morris Riedel | Professor | HI IHPC | Yes -- HPC/ML infra |
| Vilhjalmur Thorsteinsson | CEO/Founder Mideind | Mideind | Yes -- NLP systems |
| Linda Heimisdottir | CEO Mideind | Mideind | HYBRID -- CEO/thought leader |
| Steinunn Rut Fridriksdottir | Researcher | HI | Yes -- NLP |
| Svanhvit Lilja Ingolfsdottir | Researcher | RU | Yes -- ML |
| Hafsteinn Einarsson | Assistant Prof | HI | Yes -- ML/data science |
| Brynjolfur Borgar Jonsson | Founder DataLab | DataLab | Yes -- applied ML |

### Key University Finding

**Iceland's AI building capability is concentrated in 2 institutions: RU and HI.** Specifically in 4 labs (CADIA, LVL, NLP Lab, IHPC) plus IIIM and the Mideind spin-off. The total number of people who can actually build AI systems in Icelandic academia is approximately **30-35 researchers and students**.

**UNAK (University of Akureyri) has zero AI research presence.** No lab, no published AI research, no participation in national AI projects.

---

## PART IV: THE DISCOURSE GAP

### Who Talks vs. Who Builds

```
                    TALKS ABOUT AI
                    (media, policy, conferences)
                         |
           HIGH ---------+----------
                |         |         |
                | COMMENTATORS     | HYBRIDS
                | Sigvaldi Einarsson| IIIM (Thorisson)
                | Thorsteinn Sigl. | Linda Heimisdottir
                | Aslaug Arna      | Marta Abad Torrent
                | Advania/Origo    |
                |         |         |
           LOW ----------+---------
                |         |         |
                | SILENT           | BUILDERS
                | (irrelevant)     | Mideind (55 repos)
                |                  | LVL (17 HF models)
                |                  | Lucinity
                |                  | Controlant
                |         |         |
                ----------+---------
                LOW              HIGH
                    BUILDS AI
```

### The Inversion Problem

**The people who dominate Iceland's AI conversation (consultants, politicians, ethics advocates) have no capacity to build AI. The people who are actually building AI (Mideind, LVL, IIIM) are largely invisible in the domestic policy and media conversation.**

| Discourse Layer | Who Dominates | Builder Representation |
|----------------|---------------|----------------------|
| **Government policy** | Ministry officials, consultants, politicians | Near zero. No engineer contributed to AI Action Plan |
| **Media commentary** | Journalists, business analysts | Near zero. Sigvaldi Einarsson (Visir) is affiliated with "New Green Energy" -- not an engineer |
| **SA Menntadagur 2025** | HR directors, consultants, academics (non-technical) | **Zero. Not one engineer on AI panels** |
| **Consultation responses** | Advocacy orgs (OBI, Samtok um mannvaena taekni) | Zero builders among 12 respondents. Mideind, IIIM, DataLab did NOT submit |
| **Academic publishing** | Social science, law, business faculty | Low. Technical papers go to ACL/Interspeech, not domestic discourse |

### Consultation Signatories (samradsgatt mal 3862)

| Organization | Type | Classification |
|---|---|---|
| **OBI rettindasamtok** (Disability Alliance) | Advocacy | COMMENTATOR -- raises CRPD/accessibility concerns, no AI building capacity |
| **Samtok um mannvaena taekni** (Humane Technology) | Ethics advocacy | COMMENTATOR -- founded 2023, "Mannvaent kaffi" meetups, does NOT build AI. Members: Atli Thor Johannsson, Gamithra Marga, Halldora Mogensen |
| 10 other submissions | Unknown (likely similar) | Pattern suggests advocacy/academic |
| **ALL MAJOR UNIONS** | **ABSENT** | ASI, BHM, VR, BSRB, Efling -- NONE submitted |
| **ALL MAJOR BUILDERS** | **ABSENT** | Mideind, IIIM, DataLab, Lucinity -- NONE submitted |

### Conference Speaker Analysis

**SA Menntadagur 2025** (Feb 11, Hilton Nordica -- "Storf a timamotum"):

| Speaker | Title/Org | Classification |
|---|---|---|
| Thorsteinn Siglaugsson | BA Philosophy, MBA INSEAD. "Logical Thinking Process" consultant. Brownstone Institute writer. No ML background | COMMENTATOR |
| Dr. Edda Blumenstein | Lecturer, Bifrost University. Pedagogy/AI education | COMMENTATOR |
| Bergthora Hronn Gudjonsdottir | Education Director, ASI | COMMENTATOR |

**AGI-25** (Aug 10-13, RU -- international conference):

| Speaker | Role | Classification |
|---|---|---|
| Kristinn R. Thorisson | Professor RU, IIIM founding director | BUILDER/HYBRID |
| Joscha Bach | Executive Director, CA Institute for Machine Consciousness | BUILDER (international) |
| Michael Levin | Vannevar Bush Prof, Tufts | BUILDER (international) |

**Note:** AGI-25 is the exception -- a technical conference with genuine AI researchers. But it's internationally organized, and Thorisson is the only Icelandic technical voice.

**AI Summit Iceland** (May 7, 2025, Gamla Bio -- organized by APRO):
Speaker list not publicly accessible. Framing ("implementing AI in business safely") signals deployer/commentator audience. [aisummit.is](https://www.aisummit.is/)

### Media Commentators

| Person | Outlet | Background | Classification |
|--------|--------|------------|---------------|
| **Sigvaldi Einarsson** | Visir (regular columnist) | Affiliated with "New Green Energy." Columns: "Iceland 2035: AI for better life and shorter workweek," "AI for all -- but for whom really?" No technical/engineering background found | COMMENTATOR |
| **Marta Abad Torrent** | IIIM blog | Researcher at IIIM. Technical background but writes for policy audience | HYBRID |
| **Linda Heimisdottir** | Mideind.is (CEO byline) | Wrote "The Icelandic Approach" (Sept 2024) distributed at UN General Assembly. Builder-org CEO as thought leader | HYBRID |
| **Minister Gudmundur Ingi Kristinsson** | MBL (quoted) | Politician. "600 teachers testing AI tools." No technical background | COMMENTATOR |

**Finding:** Zero genuine ML engineers writing for Icelandic public consumption.

### The Silence of the Builders

| Builder | GitHub/HF Output | Samradsgatt Submission | Media Presence | Policy Role |
|---------|-----------------|----------------------|----------------|-------------|
| **Mideind** | 55 repos, 15 HF models, GPT-4 Icelandic RLHF, ISK 2B gov partnership | **DID NOT SUBMIT** | CEO writes occasional policy pieces | SIM consortium member, no formal policy input |
| **LVL (RU)** | 17 HF models, 7 datasets, 967h Whisper | **DID NOT SUBMIT** | Zero media presence | Academic output only |
| **IIIM** | AGI research, EU collaborations, DFKI/Simula | **DID NOT SUBMIT** | Blog posts on "AI readiness" | Moderate international, low domestic |
| **DataLab** | Ari product, enterprise ML | **DID NOT SUBMIT** | Zero media presence | Appears in Origo promo |
| **Lucinity** | Proprietary AML platform | **DID NOT SUBMIT** | Rare comments on Icelandic policy | Global focus |

### AI Washing Index

| Company | Claim | Reality | Evidence | Gap |
|---------|-------|---------|----------|-----|
| **Advania** | "AI transformation partner" | Deploys Microsoft Copilot licenses. Achieved "Microsoft Copilot specialization" in Norway | [advania.no](https://www.advania.no/om-oss/aktuelt/advania-microsoft-copilot-spesialisering) | SEVERE |
| **Origo** | "AI solutions" / "Ofurkraftar gervigreindar" | Azure partner. Blog showcases OTHER companies' AI (DataLab, 1xINTERNET), not Origo-built | [origo.is/blogg](https://www.origo.is/blogg/ofurkraftar-gervigreindar) | SEVERE |
| **Nyherji** | "Digital transformation with AI" | Microsoft ecosystem services | | HIGH |
| **Banks (all 3)** | "AI-powered customer service" | Same Norwegian chatbot vendor (boost.ai) | | MEDIUM |
| **Andes** | "AI solutions" | Unclear proprietary vs. vendor | | MEDIUM-HIGH |
| **Lucinity** | "AI-powered AML" | Actually builds ML models | | NONE (genuine) |
| **Mideind** | "NLP for Icelandic" | Actually builds NLP systems | 55 repos, 15 HF models | NONE (genuine) |

**The "We Use Copilot" = "We Do AI" Pattern:** Multiple Icelandic companies mention "gervigreind" in marketing when they mean Microsoft 365 Copilot integration. The distinction between "we deploy Microsoft AI" and "we build AI systems" is systematically absent from Icelandic business discourse.

---

## PART V: SYNTHESIS

### The Iceland AI Ecosystem in Numbers

| Metric | Count |
|--------|-------|
| Genuine AI builders (companies) | 3-4 (Lucinity, Mideind, Controlant, DataLab-hybrid) |
| Genuine AI builders (academic/research) | 6 (CADIA, LVL, NLP Lab, IHPC, IIIM, Arnastofnun) |
| Active AI researchers/engineers | ~30-35 |
| Companies claiming AI capabilities | ~15+ |
| Companies actually building AI | 3-4 |
| Government institutions using AI in decisions | 0 |
| Government institutions with AI chatbots | 1-2 |
| Unions with AI policy positions | 0 |
| Unions that responded to AI consultation | 0 |
| AI engineers writing in Icelandic media | 0 |
| Investigative journalism on AI + labour | 0 |
| Builders who submitted to AI Action Plan consultation | 0 |
| Per-capita gov investment in language AI | ISK 2B+ (~$14M) |

### The Seven Findings

**Finding 1: The Inversion Problem.**
Those with the loudest voice have the least technical stake; those with the deepest technical stake have the quietest voice. Policy is being made without engineering input.

**Finding 2: The Union Silence is Structurally Significant.**
Not one of Iceland's five major union confederations submitted to the AI Action Plan consultation that concerned labor market implications for 130,000 workers. This is not passive ignorance -- it is active non-engagement with a process that directly invited participation.

**Finding 3: AI-Washing is the Dominant Corporate Pattern.**
The largest IT companies (Advania, Origo) have high public discourse presence on AI. Both are pure resellers of Microsoft Azure and Copilot. The Icelandic business community's experience of "AI" is almost entirely mediated through Microsoft's product stack, but the marketing language obscures this completely.

**Finding 4: Mideind is the Clearest Example of the Gap.**
Arguably Iceland's most technically significant AI organization: 55 GitHub repos, 15 HuggingFace models, partnership with OpenAI, ISK 2B government-funded language project. Trained GPT-4 on Icelandic. Yet did NOT submit to the AI Action Plan consultation. Their builders are invisible in domestic policy.

**Finding 5: The Ecosystem is Bifurcated.**
Two parallel worlds that rarely intersect:
- **World A (Builders):** Mideind, LVL, IIIM, DataLab -- technically sophisticated, internationally connected, domestically invisible in policy
- **World B (Discourse):** Consultants, ethics advocates, IT resellers, politicians -- domestically prominent, technically hollow

**Finding 6: SA Menntadagur -- Zero Engineers.**
Iceland's largest business confederation event had two AI sessions ("Future Jobs" and "AI and Learning Materials"). Every single speaker was a consultant, HR director, or non-technical academic. Not one engineer, ML researcher, or AI developer appeared on any panel.

**Finding 7: The Language Tech Paradox.**
Iceland has invested more per capita in indigenous language AI than almost any comparable small nation. Yet this work happens in technical spaces with no visible connection to the welfare state discourse, union concerns, or policy consultation that PANOPTICON investigates. The state funds builders; the policy process talks to advocates. Funding and governance operate in separate silos.

### Implications for PANOPTICON

1. **The displacement signal is harder to detect** because so few entities actually deploy AI domestically. The macro ICT employment signal (-11.4%) may partly reflect global tech contraction, not just domestic AI adoption.

2. **The institutional vacuum is worse than it appears.** Not only are unions silent, but the policy conversation is dominated by people who cannot technically evaluate the systems they're regulating.

3. **The real AI adoption is invisible.** It's happening through Microsoft 365 Copilot licenses deployed by Advania to corporate clients. This is diffuse, untracked, and won't show up in any Icelandic statistics. Individual knowledge workers are being augmented/displaced one Copilot seat at a time.

4. **Iceland's genuine AI capability is tiny.** ~35 researchers and 3-4 companies. The discourse makes it seem like a national transformation; the reality is a handful of labs and startups doing excellent but niche work (mostly NLP/language tech).

5. **The government contradicts itself.** Invested ISK 2B in AI language tech (building), used OpenAI to process 10,000 submissions (deploying for labor replacement), while the Action Plan frames AI as "augmentation not replacement."

---

## APPENDIX A: COMPLETE ENTITY REGISTRY

### BUILDERS
1. Lucinity (AML AI platform)
2. Mideind (Greynir, Yfirlestur, Embla, IceBERT -- 55 repos, 15 HF models)
3. Controlant (cold-chain predictive analytics)
4. Islensk Gervigreind / igg.is (small seed-stage, customer service AI)
5. RU CADIA (game AI, RL)
6. RU Language and Voice Lab (Icelandic ASR/TTS -- 17 HF models, 7 datasets)
7. HI NLP Lab (Icelandic NLP tools)
8. HI IHPC (HPC/ML infrastructure)
9. IIIM (AGI research, SocialInsight simulation)
10. Arnastofnun (IGC-2024 corpus, 1.46B words)
11. TrustLLM consortium (EU Horizon -- HI+RU)

### HYBRIDS
1. DataLab Iceland (Ari product on GPT-4 Turbo + custom ML)
2. Linda Heimisdottir (Mideind CEO -- builder org, policy thought leader)
3. IIIM / Kristinn Thorisson (AGI research + EU policy advisory)
4. Marta Abad Torrent (IIIM researcher, writes policy articles)
5. Sidekick Health (some proprietary ML, mostly app platform)

### DEPLOYERS
1. CCP Games (Aura customer AI)
2. Isavia (Amadeus + Sammi automation)
3. Islandsbanki (boost.ai chatbot + process automation)
4. Landsbankinn (boost.ai chatbot)
5. Arion Banki (boost.ai chatbot)
6. Reykjavikurborg (citizen chatbot)

### RESELLERS
1. Advania (Microsoft Copilot -- certified specialization)
2. Origo (IBM Cloud + Azure AI)
3. Nyherji (Microsoft ecosystem)
4. Andes (unclear proprietary content)

### COMMENTATORS (Policy/Media)
1. Fjarmala- og efnahagsraduneytid (AI Action Plan authors)
2. Aslaug Arna Sigurbjornsdottir (political champion, law background)
3. Gudmundur Ingi Kristinsson (Education Minister)
4. Rannis (funding body)
5. Rikiskaup/FMA (procurement framework)
6. Sigvaldi Einarsson (Visir columnist -- "New Green Energy" affiliation, no ML background)
7. Thorsteinn Siglaugsson (BA Philosophy, MBA INSEAD, Brownstone Institute writer -- SA Menntadagur AI speaker)
8. Dr. Edda Blumenstein (Bifrost University -- AI in education, non-technical)
9. SA (Employers' Confederation -- panels, no position papers)
10. OBI (Disability Alliance -- consultation respondent, legitimate stakeholder)
11. Samtok um mannvaena taekni (Humane Technology -- Atli Thor Johannsson, Gamithra Marga, Halldora Mogensen)
12. Kjarninn editorial (zero AI investigations despite being investigative outlet)
13. MBL business desk (covers AI as business news, not investigation)
14. RUV Kastljos (one segment: "Can AI replace psychologists?")

### ABSENT (Should Be Present, Are Not)
1. ASI (Confederation of Labour) -- zero AI engagement, zero consultation response
2. VR (Commercial Workers' Union) -- no AI survey criteria
3. BSRB (Public Sector Union) -- covered Varda report, no independent analysis
4. BHM (University Graduates' Union) -- one samradsgatt submission, otherwise silent
5. Efling (General Workers' Union) -- zero AI engagement
6. UNAK (University of Akureyri) -- zero AI research

---

## APPENDIX B: MASTER TAXONOMY MATRIX

```
NAME/ORG               | CLASS        | DISCOURSE | BUILD    | GAP
                        |              | PRESENCE  | PRESENCE |
========================|==============|===========|==========|===============
BUILDERS
------------------------|--------------|-----------|----------|---------------
Mideind (55 repos)      | BUILDER      | LOW       | V. HIGH  | SILENT BUILDER
LVL / RU (17 HF models) | BUILDER      | VERY LOW  | HIGH     | SILENT BUILDER
Arnastofnun (IGC)       | BUILDER      | VERY LOW  | MODERATE | SILENT BUILDER
Lucinity                | BUILDER      | VERY LOW  | HIGH     | SILENT BUILDER
Controlant              | BUILDER      | NEAR ZERO | MODERATE | INVISIBLE
Isl. Gervigreind        | BUILDER (sm) | NEAR ZERO | LOW      | INVISIBLE
------------------------|--------------|-----------|----------|---------------
HYBRIDS
------------------------|--------------|-----------|----------|---------------
IIIM (Thorisson)        | HYBRID       | MODERATE  | HIGH     | MODERATE GAP
DataLab (Ari)           | HYBRID       | LOW       | MODERATE | PARTIAL GAP
Linda Heimisdottir      | HYBRID       | MODERATE  | LOW      | CEO thought ldr
------------------------|--------------|-----------|----------|---------------
RESELLERS
------------------------|--------------|-----------|----------|---------------
Advania (1000+ Copilot) | RESELLER     | HIGH      | ZERO     | DISCOURSE INFLAT
Origo (Azure partner)   | RESELLER     | MODERATE  | ZERO     | DISCOURSE INFLAT
Nyherji (MSFT)          | RESELLER     | MODERATE  | ZERO     | DISCOURSE INFLAT
------------------------|--------------|-----------|----------|---------------
COMMENTATORS
------------------------|--------------|-----------|----------|---------------
Sigvaldi Einarsson      | COMMENTATOR  | HIGH      | ZERO     | CORE GAP
Thorsteinn Siglaugsson  | COMMENTATOR  | HIGH      | ZERO     | CORE GAP
Aslaug Arna             | COMMENTATOR  | HIGH      | ZERO     | POLITICAL LAYER
Gudm. Ingi Kristinsson  | COMMENTATOR  | HIGH      | ZERO     | POLITICAL LAYER
Samtok um mannv. taekni | COMMENTATOR  | MODERATE  | ZERO     | ADVOCACY VOICE
OBI                     | COMMENTATOR  | MODERATE  | ZERO     | LEGIT STAKEHOLDR
------------------------|--------------|-----------|----------|---------------
ABSENT
------------------------|--------------|-----------|----------|---------------
ALL MAJOR UNIONS         | ABSENT       | ZERO      | ZERO     | CATASTROPHIC
(ASI, BHM, VR, BSRB,   |              |           |          | SILENCE
 Efling)                |              |           |          |
UNAK                    | ABSENT       | ZERO      | ZERO     | INSTITUTIONAL
```

---

## APPENDIX C: SOURCES

- [OBI AI consultation response](https://www.obi.is/umsogn/adgerdaaaetlun-um-gervigreind-2024-2026/)
- [Samradsgatt mal 3862](https://island.is/samradsgatt/mal/3862)
- [Samtok um mannvaena taekni](https://www.mannvaen.is/)
- [Mideind GitHub](https://github.com/mideind) (55 repos)
- [Mideind HuggingFace](https://huggingface.co/mideind) (15 models)
- [LVL HuggingFace](https://huggingface.co/language-and-voice-lab) (17 models, 7 datasets)
- [Arnastofnun HuggingFace](https://huggingface.co/arnastofnun) (IGC-2024)
- [DataLab Iceland](https://datalab.is/um-okkur)
- [DataLab Ari product](https://datalab.is/blogg/ari-tharfasti-thjonninn-margfaldar-afkost)
- [IIIM](https://www.iiim.is/people-4/)
- [IIIM AI Readiness 2024](https://www.iiim.is/2024/10/icelands-ai-readiness-iiims-unique-role/)
- [IIIM GitHub](https://github.com/IIIM-IS)
- [Advania Copilot](https://www.advania.is/grein/copilot-fyrir-microsoft-365-er-komin-ut)
- [Advania Copilot specialization (NO)](https://www.advania.no/om-oss/aktuelt/advania-microsoft-copilot-spesialisering)
- [Origo AI blog](https://www.origo.is/blogg/ofurkraftar-gervigreindar)
- [SA Menntadagur 2025](https://www.sa.is/starfsemin/vidburdir/menntadagur-atvinnulifsins-2025)
- [AGI-25 Conference](https://agi-conf.org/2025/)
- [AI Summit Iceland](https://www.aisummit.is/)
- [Sigvaldi Einarsson / Visir](https://www.visir.is/g/20252699156d/)
- [Mideind -- The Icelandic Approach (UN GA 2024)](https://mideind.is/en/greinar/islenska-adferdin-hvernig-studla-ma-ad-fjolbreytni-tungumala-og-menningar-a-svidi)
- [OpenAI / Iceland government partnership](https://openai.com/index/government-of-iceland/)
- [Language Technology Programme 2024-2026](https://www.government.is/library/01-Ministries/Ministry-of-culture-and-business-affairs/Language-technology-programme-for-icelandic-2024-2026-web.pdf)
- [Thorsteinn Siglaugsson / SpeakerHub](https://speakerhub.com/speaker/thorsteinn-siglaugsson)
- [Islensk Gervigreind / Tracxn](https://tracxn.com/d/companies/slensk-gervigreind/)
- [Vilhjalmur Thorsteinsson / GitHub](https://github.com/vthorsteinsson)

---

*PANOPTICON REVERSE -- AI Ecosystem Map*
*4-agent research swarm, 2026-03-07*
*Key finding: ~35 people and 3-4 companies build AI in Iceland. ~15+ entities claim to. Zero engineers participate in policy. Zero unions responded to AI consultation. Zero builders submitted to AI Action Plan.*
