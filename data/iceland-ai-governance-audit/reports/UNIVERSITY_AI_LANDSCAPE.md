# Iceland University AI Landscape: Complete Audit

**PANOPTICON REVERSE -- Deep Research Report**
**Date:** 2026-03-08
**Method:** 3 parallel research agents (RU, HI, all other HEIs)
**Scope:** Every Icelandic higher education institution

---

## EXECUTIVE SUMMARY

Iceland's AI research capability is concentrated almost entirely at two institutions: **Reykjavik University (RU)** and **University of Iceland (HI)**. Together they hold all Rannis AI grants (8/8 in 2024-2025), all SIM consortium membership, all doctoral programs in computing, and ~40-50 AI-active researchers. The remaining institutions (UNAK, Bifrost, Holar, LHI, LBHI) have zero confirmed AI research output, zero competitive AI grants, and at most one or two faculty members discussing AI from non-technical perspectives.

**Critical finding for PANOPTICON:** No faculty member at any Icelandic university is researching AI's macroeconomic labor market effects in quantitative terms. The closest is the BIAS project (HI, Horizon Europe) on AI bias in recruitment/management, and two RU MSc theses using qualitative interviews.

---

## PART I: REYKJAVIK UNIVERSITY (RU)

### 1.1 CADIA (Center for Analysis and Design of Intelligent Agents)

Founded 2005, co-founded by Kristinn Thorisson. Self-describes as "Iceland's only AI lab."

**Faculty Roster (confirmed 2025):**

| Name | Title | Research Focus | Key 2024-2025 Output |
|------|-------|----------------|---------------------|
| **Yngvi Bjornsson** | Professor, CADIA Director | General Game Playing, MCTS, ML for game AI | Three-time GGP world champion; leads lab |
| **Stephan Schiffel** | Assistant Professor | Game playing, state-space search, heuristics | Aug 2025: "Framework for Generating State-Space Graphs" |
| **Hannes Hogni Vilhjalmsson** | Professor | Computational social behavior, virtual humans, social AI | IVA '24 paper "Modifying Gesture Style with Impression Words"; Doctoral Consortium Chair IVA 2024 |
| **Stefan Olafsson** | Assistant Professor | Conversational agents, healthcare AI, dialog management, LLMs | PhD Personal Health Informatics (Northeastern 2021); co-signed Iceland AI Action Plan critique 2024 |
| **Elin Carstensdottir** | Lektor | Interactive narrative, video games, social behavior modeling | Recent hire from UC Santa Cruz |
| **Hrafn Loftsson** | Associate Professor | NLP, Icelandic morphology, POS tagging, clinical/legal NLP | LREC-COLING 2024: text quality filtering, sentiment analysis; NoDaLiDa 2025: legal LLM alignment |

**Additional CS faculty with AI relevance:**
- **Anna Sigridur Islind** (Professor) -- AI/ML for healthcare, XAI, human-AI co-design. Led Sleep Revolution (EU Horizon 2020, EUR15M, concluded 2024). Dec 2024: "Human-AI Collaboration: From Explainable AI to Co-Creating Meaning." Leads CISDAS research center.
- **Bjorn Thor Jonsson** (Professor) -- multimedia retrieval
- **Anna Ingolfsdottir** (Professor) -- co-director ICE-TCS (theoretical CS)

**CADIA Research Clusters (2024-2026):**
1. General Game Playing and Game AI (Bjornsson, Schiffel)
2. Social/Expressive Virtual Agents (Vilhjalmsson)
3. Healthcare Conversational AI (Olafsson) -- LLMs, dialog management, safety
4. NLP for Icelandic (Loftsson) -- legal LLMs, quality filtering, morphology
5. Interactive Narrative/Game Design AI (Carstensdottir)
6. Digital Health AI (Islind) -- sleep apnea ML, XAI, co-design

**Funding:**
- CCP Games: Funds dedicated academic position at RU CS (ongoing 2024)
- EDIH-IS (EU): ISK 250M+ to consortium including RU; funds MSc AI education
- Rannis STPC grants (historical + ongoing)

### 1.2 Language and Voice Lab (LVL)

Founded 2016, housed within CADIA. Primary mission: Icelandic speech and language technology.

**Key Personnel:**

| Name | Role | Focus |
|------|------|-------|
| **Jon Gudnason** | Associate Professor, LVL Director | ASR, TTS, voice health, Icelandic speech corpora |
| **Hrafn Loftsson** | Associate Professor | NLP, Icelandic text processing (shared with CADIA) |
| **Stefan Olafsson** | Lecturer | Conversational AI, healthcare NLP (shared with CADIA) |

**Note:** Judy Fong -- NOT found in current faculty listings. Status unknown.

**HuggingFace Output (active through April 2025):**

| Model/Dataset | Type | Downloads |
|--------------|------|-----------|
| wav2vec2-large-xlsr-53-icelandic-ep30-967h | ASR | 120,000 |
| whisper-large-icelandic-62640-steps-967h | Whisper ASR | 130 |
| talromur [c-h] fastspeech2 (6 voices) | TTS | active |
| samromur_milljon | 967h corpus (1M clips) | 309 |
| samromur_synthetic | Synthetic speech | 53,600 |
| raddromur_asr | Read speech | 13,000 |

**GitHub:** github.com/cadia-lvl -- 98 repos. Most recent: ebs (Dec 2025), Spjallromur-pyannote (Mar 2025).

**2024 Publication:** "Samromur Milljon: An ASR Corpus of One Million Verified Read Prompts in Icelandic" -- LREC-COLING 2024.

### 1.3 IIIM (Icelandic Institute for Intelligent Machines)

**Status: ACTIVE** (confirmed March 2025 blog post)
**Formally independent** non-profit, **functionally intertwined** with RU via Thorisson's dual role.

**Full Staff Roster (2025):**

| Name | Title | Focus |
|------|-------|-------|
| **Kristinn R. Thorisson** | Managing Director / RU Professor | AGI, AERA architecture, cognitive systems |
| **Goncalo De Carvalho** | Senior Researcher | AI systems, software |
| **Mario Correia** | Researcher | Systems engineering, predictive modeling |
| **Arash Sheikhlar** | AI Developer | Robotics, RL, fuzzy logic (PhD RU/CADIA) |
| **Marta A. Torrent** | Researcher | AI applications, policy commentary |
| **Jeff Thompson** | Senior Research Scientist | Causal reasoning, self-programming (MIT background) |
| **Sander Kaatee** | Software Engineer | AI applications |
| **Jacky Mallett** | Affiliate | Distributed systems, HPC (MIT 2005) |
| **Pei Wang** | Affiliate | NARS (Temple University) |
| **Agust Hlynur Holmgeirsson** | Programmer/SysAdmin | Systems (founding CADIA sysadmin) |

**Effective size:** ~8 active + 2 affiliates.

**Recent Publications (2024):**
- "Causal Generalization via Goal-Driven Analogy" (AGI 2024) -- **Kurzweil Best Paper Award**
- "Argument-Driven Planning & Autonomous Explanation Generation" (AGI 2024) -- **AGI Society Best Paper Prize**
- "SocialInsight: Agent-Based Simulation for Substance Abuse Prevention" (IIIM Technical Report)
- Policy commentary on Iceland AI Action Plan

**AGI-25 Conference (Aug 10-13, 2025, RU):**
18th International AGI Conference. 72 papers from 179 submissions. Keynotes: Thorisson, Ben Goertzel, Richard Sutton (2024 Turing Award), Joscha Bach. Published in Springer LNAI.

**Flagship: AERA** (Autonomous Empirical Reasoning Architecture) -- constructivist AGI system, active since ~2010.

### 1.4 RU AI Education Programs

| Degree | Name | Status |
|--------|------|--------|
| **MSc** | Artificial Intelligence | NEW -- launched Fall 2025 (120 ECTS) |
| **MSc** | AI and Language Technology | Joint with HI; full tuition scholarships |
| **MSc** | Data Science | 120 ECTS |
| **MSc** | Digital Health | Led by Islind |
| **MSc** | Computer Science | AI emphasis track since Fall 2023 |

**Scale:** ~800 students, ~20 permanent faculty, ~100 PhD students (mostly international).

### 1.5 AI-Relevant Theses (RU, Skemman, 2023-2025)

| Title | Author | Year | Supervisor | Dept |
|-------|--------|------|------------|------|
| "The impact of AI on HRM: from Icelandic HR perspectives" | Elin Thorleifsdottir | Oct 2023 | Freyr Halldorsson | Business |
| "AI in the Icelandic financial sector: current use, impact, future trajectory" | Asgeirr Jonsson & Daniel Arnason | June 2024 | Ender Demir | Business |
| "Balancing legal liability and AI innovation: assessing the AI Liability Directive" | Unknown | 2023 | Unknown | Law |

### 1.6 Industry Connections

| Company | Type | AI Relevance |
|---------|------|-------------|
| CCP Games | Funds academic position at RU CS | Game AI; Project Discovery |
| EDIH-IS | EU digital innovation hub; RU co-lead | AI education, Women in AI |
| Almannaromur | Language Technology center | Co-organizer Samromur with LVL |
| Kara Connect | Psychotherapy platform | IIIM whitepaper on AI data generation |

**Gap:** No formal RU-Mideind or RU-Lucinity research partnerships confirmed.

---

## PART II: UNIVERSITY OF ICELAND (HI)

### 2.1 NLP Lab at IHPC

Housed inside IHPC Simulation and Data Labs. Not the legacy HI NLP group -- newer infrastructure oriented around TrustLLM.

**Named Researchers:**

| Name | Role | Current Focus |
|------|------|---------------|
| **Hafsteinn Einarsson** | Head / Assistant Professor | NLP, interpretable ML, Icelandic language tech |
| **Annika Simonsen** | PhD Student | TrustLLM -- neural alignment, low-resource Germanic |
| **Hans Erik Stenlund** | PhD Student | TrustLLM -- trustworthy open LLMs |
| **Vesteinn Snaebjarnason** | PhD (Copenhagen/Pioneer Centre) | IceBERT author, multimodal NLP. Developed IceBERT while split Mideind/HI |

### 2.2 Anton Karl Ingason -- Computational Linguistics

**Role:** Professor, Faculty of Humanities, HI
**Key 2024-2025 output:**
- IcePaHC v2024.03 -- first major update in 13 years; CC BY licensed
- Improved Icelandic phrase parsing using Stanford Stanza + IceBERT (F1 90.38%)
- LREC-COLING 2024: "Automatic Extraction of Language-Specific Biomarkers of Healthy Aging"
- NoDaLiDa 2025: CEFR-scale Icelandic language proficiency classification
- Ongoing: Althingi parliament corpus for sociolinguistic research

**Note:** IceNLP hosted at CLARIN Iceland; available but not in active development. IcePaHC is the active successor.

### 2.3 Steinunn Rut Fridriksdottir

**Role:** PhD student, CS, HI. Advisors: likely Hafsteinn Einarsson.
**Research:** Knowledge graph construction for Icelandic; bias/prejudice in language models. Teaches Python + NLP intro at HI.
**Key work:** "Bootstrapping Icelandic Knowledge Graph Data" (2022); 2024 LREC-COLING joint paper.

### 2.4 IHPC (Icelandic High Performance Computing)

**Infrastructure:**
- **Local cluster (IREI):** 6,528 cores, 21 NVIDIA A100 GPUs, 628 teraflops
- **EuroHPC access:** Iceland is founding LUMI consortium member (Finland-based, 11,912 AMD MI250X GPUs total)

**Key Personnel:**

| Name | Title | Appointment | Focus |
|------|-------|-------------|-------|
| **Morris Riedel** | Full Professor | **Joint HI / Juelich Supercomputing Centre (JSC)** | HPC/AI, distributed ML, remote sensing |
| **Gabriele Cavallaro** | Associate Professor (since 2024) | **Joint HI / JSC** | Remote sensing ML, quantum ML, Earth observation. Also Visiting Prof at ESA Phi-Lab. Working on Prithvi-EO-2.0 (NASA/IBM) |
| **Lotta Maria Ellingsen** | Associate Professor | HI | Brain image analysis, deep learning, Alzheimer's |

**PhD students (Cavallaro/Riedel group at HI):** Amer Delilbasic, Joseph Xavier Arnold, Kennedy Adriko, Saby Hashim, Sayan Mandal, Stefano Maurogiovanni, Surbhi Sharma -- all joint HI/JSC.

**13 Simulation and Data Labs, AI-active ones:**
- NLP Lab (Einarsson)
- Remote Sensing SDL (Cavallaro)
- Health & Medicine SDL (Riedel)
- Neuroscience SDL (Ellingsen)

**Key structural observation:** HI's AI infrastructure credibility partly rests on German federal research infrastructure. The Riedel/Cavallaro JSC appointments are the foundation.

### 2.5 TrustLLM -- HI's Major EU Project

- **CORDIS:** 101135671
- **Title:** "Democratize Trustworthy and Efficient Large Language Model Technology for Europe"
- **Duration:** Nov 2023 -- Oct 2026
- **Total EU budget:** EUR 6,929,701
- **HI share:** EUR 627,427
- **Mideind share:** separate partner in same consortium
- **Consortium:** Linkoping (coordinator), Fraunhofer, JSC, Mideind, HI, Copenhagen, NTNU, TNO, others

### 2.6 CS Department Faculty (AI-relevant)

| Name | Title | Research Area |
|------|-------|--------------|
| Hafsteinn Einarsson | Assistant Professor | NLP, interpretable ML |
| Morris Riedel | Full Professor | HPC/AI, distributed ML |
| Gabriele Cavallaro | Associate Professor (2024) | Remote sensing ML, quantum ML |
| Lotta Maria Ellingsen | Associate Professor | Brain imaging, deep learning |
| Kristinn Andersen | Professor | Robotics, AI, computer vision |
| Helmut Neukirchen | Professor | HPC/ML, Big Data, cybersecurity |

### 2.7 BIAS Project -- DIRECTLY RELEVANT TO PANOPTICON

**PI:** Gudbjorg Linda Rafnsdottir, Professor of Sociology AND Pro-Rector of Science, HI
**Project:** BIAS -- "Mitigating Diversity Biases of AI in the Labour Market"
**Funder:** Horizon Europe
**Partners:** 9 European organizations
**Focus:** How NLP systems in recruitment and employee monitoring introduce bias; development of "Debiaser" tool; gender digital gap; AI discrimination in management

**This is the only Icelandic university research project explicitly studying AI bias in the labor market.** Rafnsdottir is the most senior AI-labor researcher in Iceland. Contact target for PANOPTICON.

### 2.8 Arnastofnun (Arni Magnusson Institute)

**Status:** Independent institute with own budget, but on HI campus. Five-year collaboration agreement with HI renewed Dec 2025.

**IGC-2024 Builders:**
- **Steinthor Steingrimsson** -- Research Assistant Professor. Most prolific corpus builder. [steinst.is](https://steinst.is/)
- **Starkadur Barkarson** -- Co-author on corpus work
- **Einar Freyr Sigurdsson** -- IcePaHC co-author, NoDaLiDa 2025 LLM benchmark paper

**Key 2025 work:** Steingrimsson + Hafsteinsson: "The Case for a Centralized Icelandic NLP Platform" (NoDaLiDa 2025) -- argues current NLP resources are fragmented at elite institutions, advocates open API-accessible infrastructure.

### 2.9 SIM Consortium

**Members:** HI, RU, Arnastofnun, Blindrafelagid, RUV, Creditinfo, Mideind, Tiro ehf.
**March 2024:** Steering group proposed creating a **new combined language technology and AI institution** -- awaiting government decision.

### 2.10 Other HI Departments Touching AI

- **Medical Faculty:** Medical imaging curriculum includes AI analysis
- **Neuroscience SDL (IHPC):** Ellingsen's 3D brain imaging
- **MA Language Technology (Humanities):** Feeds NLP lab pipeline
- **Computational Social Science:** SICSS Iceland hosted at HI Aug 2024
- **Law:** No AI law research confirmed. EU AI Act implementation driven by government, not academia.
- **Economics:** No confirmed HI economist doing AI+labor econometrics. **This is a gap.**

### 2.11 EU Projects (HI, AI-relevant)

| Project | Budget (HI) | Period | Domain |
|---------|-------------|--------|--------|
| TrustLLM (HORIZON) | EUR 627K | 2023-2026 | LLMs, Germanic languages |
| EuroCC2 (EuroHPC JU) | Undisclosed | Ongoing | HPC/AI national competence |
| BIAS (Horizon Europe) | Undisclosed | Ongoing | AI bias, labor market |
| CoE RAISE (H2020) | Undisclosed | 2021-2024 | AI/simulation engineering |

### 2.12 Rannis AI Grants at HI (2024-2025)

- 2025: Hybrid Quantum/Earth Observation (19.9M ISK), LLM Icelandic Acquisition (10.0M ISK), Language/Complex Systems (14.2M ISK)
- 2024: AI+DFT ammonia synthesis (21.6M ISK), Sketch UI for Spreadsheets (21.0M ISK)

---

## PART III: ALL OTHER INSTITUTIONS

### 3.1 UNAK (University of Akureyri)

| Dimension | Finding |
|-----------|---------|
| **CS Program** | Exists but is RU's program delivered remotely. UNAK has NO independent CS faculty. Coordinator: Daniel Johannsson |
| **AI Faculty** | 0 dedicated. Jorunn Elidottir (EdFac) published one ChatGPT attitudes survey (2024-2025) |
| **AI PM** | Magnus Smari Smarason hired Jan 2024 (2-year term) -- administrative/implementation role |
| **AI Courses** | "Kynnumst gervigreind" (3-hour intro, Feb 2025, 5,000 ISK) |
| **AI Policy** | First Icelandic university with comprehensive AI use policy |
| **Rannis AI Grants** | 0 |
| **SIM Membership** | No |
| **Skemman AI Theses** | ~0 confirmed |
| **Strengths** | Regional relevance, applied education, Arctic/social research, institutional willingness (PM hire, policy) |
| **Missing** | Independent CS faculty, doctoral programs, computing grants, AI lab, SIM membership |

**Realistic Paths to AI Research:**
1. Cross-faculty AI-society research through existing social science/law/education faculties (PANOPTICON-adjacent)
2. Rannis application for AI + social science grant
3. Deepen RU partnership to add AI/data science modules
4. Hire one computational social science faculty member

### 3.2 Bifrost University

| Dimension | Finding |
|-----------|---------|
| **AI Courses** | 0 |
| **AI Research** | 0 |
| **Edda Blumenstein** | Assistant Professor. No research profile, no publications listed. SA Menntadagur panelist = commentator role |
| **AI Policy** | AI task force formed spring 2023 (institutional governance, not research) |
| **Rannis AI Grants** | 0 |
| **Skemman AI Theses** | 0 |

### 3.3 Holar University

- Merged into HI consortium Jan 2026 ("University of Iceland at Holar")
- Focus: aquaculture, equine studies, tourism
- Zero AI activity. Merger gives formal HI umbrella but disciplinary focus unchanged.

### 3.4 LHI (Iceland University of the Arts)

- Hugarflug 2025 conference themes AI ("unstable systems, technological advancements")
- One architecture + GenAI paper (Dec 2025)
- New program in digital creation with RU launching Autumn 2026
- No dedicated AI research capability currently

### 3.5 LBHI (Agricultural University of Iceland)

- Remote Sensing and Geoinformatics unit -- closest to computational methods among small HEIs
- Faculty: Mariana Verdonen (PostDoc, environmental remote sensing), Johanna Gisladottir (Asst Prof, geospatial)
- No confirmed AI/ML publications
- Strategic Plan 2024-2028 signals research expansion ambition

---

## PART IV: CROSS-INSTITUTIONAL ANALYSIS

### 4.1 The Concentration Problem

| Metric | RU | HI | All Others Combined |
|--------|----|----|-------------------|
| AI-active faculty | ~10-15 | ~8-12 | ~0-1 |
| AI doctoral students | ~15-20 | ~10-15 | 0 |
| Rannis AI grants (2024-2025) | 3 | 5 | 0 |
| HuggingFace models | 17 (LVL) | 15 (Mideind consortium) | 0 |
| GitHub AI repos | 98 (cadia-lvl) + 55 (Mideind) | IHPC + Arnastofnun | 0 |
| SIM consortium | Yes | Yes | No |
| MSc AI programs | 4 (AI, AI+LT, Data Science, Digital Health) | 1 (joint with RU) | 0 |
| PhD programs in computing | Yes | Yes | 0 |
| EU AI grants active | EDIH-IS | TrustLLM, BIAS, EuroCC2 | 0 |

### 4.2 Key People Matrix

| Name | Institution | Category | PANOPTICON Relevance |
|------|------------|----------|---------------------|
| Gudbjorg Linda Rafnsdottir | HI (Pro-Rector) | RESEARCHER | **HIGH** -- BIAS project on AI bias in labor market |
| Hafsteinn Einarsson | HI (IHPC NLP Lab) | BUILDER | MEDIUM -- Icelandic LLMs, interpretable ML |
| Kristinn R. Thorisson | RU/IIIM | BUILDER/HYBRID | MEDIUM -- AGI discourse, policy commentary |
| Stefan Olafsson | RU/CADIA | BUILDER/HYBRID | MEDIUM -- co-signed AI Action Plan critique |
| Anton Karl Ingason | HI (Humanities) | BUILDER | LOW -- computational linguistics, corpora |
| Steinthor Steingrimsson | Arnastofnun | BUILDER | LOW -- NLP platform advocacy, IGC corpus |
| Anna Sigridur Islind | RU/CADIA | BUILDER | LOW -- digital health, XAI |
| Morris Riedel | HI/JSC | BUILDER (infra) | LOW -- HPC infrastructure |
| Hrafn Loftsson | RU/LVL | BUILDER | LOW -- legal NLP, quality filtering |
| Jon Gudnason | RU/LVL | BUILDER | LOW -- speech tech, Samromur |

### 4.3 The AI-Labor Research Gap

**No Icelandic academic is doing quantitative AI+labor market research.** The landscape:

| What Exists | Where | Limitation |
|-------------|-------|-----------|
| BIAS project (AI bias in hiring/management) | HI, Horizon Europe | Focuses on bias/discrimination, not displacement |
| 2 MSc theses (qualitative interviews on AI+HRM, AI+FinTech) | RU Business | Qualitative, small samples |
| Halldorsson 2025 thesis (AI + labor, skills) | Skemman (unknown inst.) | First Icelandic corroboration of PANOPTICON hypothesis |
| Jorunn Elidottir ChatGPT attitudes survey | UNAK EdFac | 23 instructors, education-only |

**What Does Not Exist:**
- Econometric analysis of AI exposure by occupation in Iceland
- Quantitative displacement measurement (like Humlum & Vestergaard for Denmark)
- Welfare system data linked to AI-exposed occupations
- Union-commissioned research on technology and employment

**PANOPTICON implication:** This investigation may be the first systematic quantitative analysis of AI + labor market + welfare state in Iceland. There is no competing academic work.

### 4.4 The UNAK Question

**Current state:** UNAK has institutional willingness (AI PM hire, policy, EdFac paper) but zero independent AI research infrastructure. Its CS program is literally RU content delivered remotely.

**What UNAK CAN do for PANOPTICON:**
- Host the investigation as conceptual/qualitative social science research
- Use existing social science, law, and education faculty for AI-society analysis
- Apply PANOPTICON findings toward a Rannis AI+social science grant

**What UNAK CANNOT provide:**
- Computational infrastructure for ML/data analysis
- AI faculty to co-supervise technical work
- Access to SIM, IIIM, or national AI research networks

**The honest assessment:** PANOPTICON's quantitative work (Hagstofa data extraction, statistical analysis) runs on Python stdlib and doesn't require university computing infrastructure. The conceptual framing (AI + labor + welfare) fits UNAK's social science strengths. The mismatch is in the lack of AI-expert co-supervision, not in infrastructure.

---

## PART V: CONTACT TARGETS

| Priority | Name | Institution | Why |
|----------|------|-------------|-----|
| 1 | **Gudbjorg Linda Rafnsdottir** | HI (Pro-Rector) | Only Icelandic researcher studying AI bias in labor market (BIAS project). Most senior voice. |
| 2 | **Stefan Olafsson** | RU/CADIA | Co-signed AI Action Plan critique. Healthcare AI + policy bridge. |
| 3 | **Steinthor Steingrimsson** | Arnastofnun | NLP platform advocacy paper argues for democratizing AI resources beyond elite institutions. |
| 4 | **Hafsteinn Einarsson** | HI/IHPC NLP Lab | TrustLLM lead at HI. Interpretable ML expertise. |
| 5 | **Kristinn R. Thorisson** | RU/IIIM | AGI discourse, policy commentary, MIT Tech Review profile. |

---

## APPENDIX: SOURCES

### RU Sources
- [CADIA](http://cadia.ru.is/)
- [CADIA Projects](https://projects.cs.ru.is/projects/cadia)
- [LVL HuggingFace](https://huggingface.co/language-and-voice-lab)
- [LVL GitHub (cadia-lvl)](https://github.com/cadia-lvl) -- 98 repos
- [IIIM Homepage](https://www.iiim.is/)
- [IIIM People](https://www.iiim.is/people-4/)
- [IIIM Publications](https://www.iiim.is/publications/)
- [RU MSc AI](https://www.ru.is/en/departments/dcs/artificial-intelligence-msc)
- [AGI-25 Conference](https://agi-conf.org/2025/)
- [EDIH-IS Grant News](https://www.ru.is/en/news/alf-a-billion-to-support-companies-and-institutions-in-digital-transformation)
- [Samromur Milljon LREC-COLING 2024](https://aclanthology.org/2024.lrec-main.1246/)

### HI Sources
- [IHPC NLP Lab](https://www.ihpc.is/labs/natural-language-processing-lab)
- [IHPC About](https://www.ihpc.is/about-us)
- [TrustLLM CORDIS 101135671](https://cordis.europa.eu/project/id/101135671)
- [BIAS Project](https://english.hi.is/research/addressing-artificial-intelligence-ai-management)
- [Gudbjorg Linda Rafnsdottir](https://english.hi.is/staff/glr)
- [Hafsteinn Einarsson](https://english.hi.is/staff/hafsteinne)
- [Anton Karl Ingason](https://linguist.is/)
- [Arnastofnun](https://www.arnastofnun.is/en/institute)
- [IGC-2024](https://igc.arnastofnun.is/)
- [Rannis 2024-2025](https://en.rannis.is/news/)
- [SIM Consortium](https://icelandic-lt.gitlab.io/)

### Other Institutions
- [UNAK CS Program](https://www.unak.is/is/namid/namsframbod/grunnnam/tolvunarfraedi)
- [UNAK AI PM hire (MBL)](https://www.mbl.is/frettir/innlent/2024/12/03/ha_ridur_a_vad_gervigreindar/)
- [Bifrost AI Policy](https://www.bifrost.is/um-haskolann/frettir-og-tilkynningar/svona-notum-vid-gervigreind)
- [Holar-HI Consortium](https://english.hi.is/news/ui-and-holar-university-college-agree-form-consortium)
- [Nordregio 2025 UNAK](https://pub.nordregio.org/r-2025-10-higher-education-beyond-major-urban-areas-in-the-nordics/3-4-university-of-akureyri-iceland-.html)
- [Anthropic Iceland Education Pilot](https://www.anthropic.com/news/anthropic-and-iceland-announce-one-of-the-world-s-first-national-ai-education-pilots)

---

*PANOPTICON REVERSE -- University AI Landscape Report*
*3-agent research swarm, 2026-03-08*
*Key finding: ~40-50 AI researchers at 2 institutions. Zero quantitative AI+labor research anywhere in Iceland. PANOPTICON may be the first.*
