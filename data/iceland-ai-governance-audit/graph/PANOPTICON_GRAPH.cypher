// PANOPTICON REVERSE — Neo4j Knowledge Graph
// Generated: 2026-03-06
// Compatible with: BeyondGraph / BORG_UNAK_MAP architecture
// Import: CALL apoc.cypher.runFile('PANOPTICON_GRAPH.cypher')
// All edge types follow strict correlation/causation discipline

// ============================================================================
// CONSTRAINTS AND INDEXES
// ============================================================================

CREATE CONSTRAINT IF NOT EXISTS FOR (n:MacroMetric) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:CorporateAction) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:PolicyChange) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:WelfareStatistic) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:AcademicEvidence) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:DataSource) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:DemographicCohort) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:FalsificationTest) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:UnionGrievance) REQUIRE n.id IS UNIQUE;

// ============================================================================
// DATA SOURCES
// ============================================================================

CREATE (:DataSource {id: 'SRC_HAGSTOFA_PXWEB', name: 'Hagstofa Islands PxWeb API', url: 'https://px.hagstofa.is/pxen/', access: 'Public, no auth', notes: 'REST API, JSON responses'});
CREATE (:DataSource {id: 'SRC_VMST', name: 'Vinnumalastofnun Dashboard', url: 'https://island.is/s/vinnumalastofnun/maelabord-og-toelulegar-upplysingar', access: 'Public, Power BI', notes: 'Monthly registered unemployment'});
CREATE (:DataSource {id: 'SRC_TR_POWERBI', name: 'Tryggingastofnun Interactive Statistics', url: 'https://island.is/en/o/social-insurance-administration/interactive-statistics', access: 'Public, Power BI', notes: 'Monthly disability/rehab counts'});
CREATE (:DataSource {id: 'SRC_LAEKNABLADID_2026', name: 'Laeknabladid 2026 Diagnosis Trends', url: 'https://www.laeknabladid.is/tolublod/2026/02/yfirlitsgrein.-throun-sjukdomsgreininga-i-laeknisvottordum-vegna-endurhaefingar-og-ororku', access: 'Public journal', notes: 'Ingimarsson et al. Covers 2000-2024'});
CREATE (:DataSource {id: 'SRC_LAEKNABLADID_2021', name: 'Laeknabladid 2021 Diagnosis Trends', url: 'https://www.laeknabladid.is/tolublod/2021/12/nr/7886', access: 'Public journal', notes: 'TR staff authors. Covers 2000-2019'});
CREATE (:DataSource {id: 'SRC_RIKISENDURSKODUN', name: 'Rikisendurskodun Audit 2025', url: 'https://www.rikisendurskodun.is/reskjol/files/Skyrslur/2025_atvinnuleysi_og_vinnumarkadsurraedi.pdf', access: 'Public PDF', notes: 'National Audit Office report to Althingi'});
CREATE (:DataSource {id: 'SRC_ICELAND_REVIEW', name: 'Iceland Review', url: 'https://www.icelandreview.com', access: 'Public', notes: 'English-language Icelandic news'});
CREATE (:DataSource {id: 'SRC_LANDSBANKINN_AR', name: 'Landsbankinn Annual Report 2024', url: 'https://arsskyrsla.landsbankinn.is/en', access: 'Public', notes: 'Includes FTE data and tech statements'});

// ============================================================================
// DEMOGRAPHIC COHORTS
// ============================================================================

CREATE (:DemographicCohort {id: 'COHORT_YOUTH', description: 'Workers aged 16-24', age_range: '16-24'});
CREATE (:DemographicCohort {id: 'COHORT_PRIME', description: 'Prime-age workers 25-54', age_range: '25-54'});
CREATE (:DemographicCohort {id: 'COHORT_OLDER', description: 'Older workers 55-74', age_range: '55-74'});
CREATE (:DemographicCohort {id: 'COHORT_KNOWLEDGE', description: 'Knowledge-intensive occupations: Professionals, Managers, Associate Professionals, Clerks', occupation_type: 'knowledge'});
CREATE (:DemographicCohort {id: 'COHORT_PHYSICAL', description: 'Physical/service occupations: Service/sales, Craft, Plant operators, Elementary', occupation_type: 'physical'});
CREATE (:DemographicCohort {id: 'COHORT_ICT', description: 'Workers in NACE sector J: Information and Communication', sector: 'J'});
CREATE (:DemographicCohort {id: 'COHORT_WOMEN_YOUNG', description: 'Women aged 18-49', age_range: '18-49', gender: 'female'});

// ============================================================================
// MACRO METRICS — Workstream A
// ============================================================================

// Quarterly unemployment trajectory
CREATE (:MacroMetric {id: 'MACRO_UNEMP_Q4_2024', name: 'Unemployment rate Q4 2024', value: 2.9, unit: 'percent', temporal_reference: '2024-Q4', source_url: 'https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__2_arsfjordungstolur/VIN00920.px', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Market peak - lowest rate in dataset. 6,800 unemployed.'});
CREATE (:MacroMetric {id: 'MACRO_UNEMP_Q1_2025', name: 'Unemployment rate Q1 2025', value: 5.0, unit: 'percent', temporal_reference: '2025-Q1', source_url: 'https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__2_arsfjordungstolur/VIN00920.px', extraction_date: date('2026-03-06'), confidence: 'High', notes: '+2.1pp jump from Q4 2024. 11,500 unemployed.'});
CREATE (:MacroMetric {id: 'MACRO_UNEMP_Q4_2025', name: 'Unemployment rate Q4 2025', value: 5.0, unit: 'percent', temporal_reference: '2025-Q4', source_url: 'https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__2_arsfjordungstolur/VIN00920.px', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Breaks seasonal recovery pattern. 11,800 unemployed.'});
CREATE (:MacroMetric {id: 'MACRO_UNEMP_JAN_2026', name: 'Registered unemployment Jan 2026', value: 4.9, unit: 'percent', temporal_reference: '2026-01', source_url: 'https://island.is/s/vinnumalastofnun/maelabord-og-toelulegar-upplysingar', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'VMST registered rate.'});

// The polarization signal
CREATE (:MacroMetric {id: 'MACRO_KNOWLEDGE_OCC_LOSS', name: 'Knowledge occupation employment contraction 2024-2025', value: -9300, unit: 'jobs', temporal_reference: '2024-2025', source_url: 'https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__3_arstolur/VIN01100.px', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Professionals -4500, Managers -2000, Assoc Prof -2200, Clerical -600. Single year contraction.'});
CREATE (:MacroMetric {id: 'MACRO_PHYSICAL_OCC_GAIN', name: 'Physical/service occupation employment growth 2024-2025', value: 6900, unit: 'jobs', temporal_reference: '2024-2025', source_url: 'https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__3_arstolur/VIN01100.px', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Service/sales +5500, Craft +400, Plant ops +400, Elementary +400.'});

// ICT sector
CREATE (:MacroMetric {id: 'MACRO_ICT_EMPLOYMENT', name: 'ICT sector employment decline 2023-2025', value: -1300, unit: 'jobs', temporal_reference: '2023-2025', source_url: 'https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__3_arstolur/VIN01110.px', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'NACE J: 11,400 to 10,100 = -11.4%. Largest proportional sector decline.'});
CREATE (:MacroMetric {id: 'MACRO_ICT_TURNOVER', name: 'ICT sector VAT turnover growth Nov-Dec 2025', value: 34, unit: 'percent_growth', temporal_reference: '2025-11/12', source_url: 'https://statice.is/publications/news-archive/enterprises/vat-turnover-november-december-2025', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Revenue UP while employment DOWN. Classic productivity displacement pattern.'});

// Professional sector
CREATE (:MacroMetric {id: 'MACRO_PROF_EMPLOYMENT', name: 'Professional/scientific/technical sector decline', value: -900, unit: 'jobs', temporal_reference: '2023-2025', source_url: 'https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__3_arstolur/VIN01110.px', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'NACE M: 13,100 to 12,200 = -6.9%.'});

// Prime-age unemployment
CREATE (:MacroMetric {id: 'MACRO_PRIME_AGE_UNEMP', name: 'Prime-age (25-54) unemployment Q4 2025', value: 4.9, unit: 'percent', temporal_reference: '2025-Q4', source_url: 'https://px.hagstofa.is/pxen/pxweb/en/Samfelag/Samfelag__vinnumarkadur__vinnumarkadsrannsokn__2_arsfjordungstolur/VIN00920.px', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Highest observed for this cohort in post-COVID dataset. Female 25-54: 5.0%, Male 25-54: 4.9%.'});

// Play airline collapse
CREATE (:MacroMetric {id: 'MACRO_PLAY_COLLAPSE', name: 'Play airline ceased operations', value: 420, unit: 'direct_job_losses', temporal_reference: '2025-09-29', source_url: 'https://www.ruv.is/english/2025-09-29-play-ends-operations-all-flights-cancelled-400-lose-jobs-454639', extraction_date: date('2026-03-06'), confidence: 'High', notes: '~420 direct + 50+ Airport Associates. Aviation/tourism sector.'});

// Foreign national unemployment confound
CREATE (:MacroMetric {id: 'MACRO_FOREIGN_UNEMP', name: 'Foreign nationals as share of registered unemployed', value: 55, unit: 'percent', temporal_reference: '2024', source_url: 'https://www.rikisendurskodun.is/reskjol/files/Skyrslur/2025_atvinnuleysi_og_vinnumarkadsurraedi.pdf', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Foreign rate 8.9% vs Icelandic 2.3%. Major confounding factor.'});

// Mass layoffs Feb 2026
CREATE (:MacroMetric {id: 'MACRO_LAYOFFS_FEB_2026', name: 'Mass layoff notifications February 2026', value: 69, unit: 'workers', temporal_reference: '2026-02', source_url: 'https://island.is/s/vinnumalastofnun/frett/hopuppsagnir-i-februar-2026', extraction_date: date('2026-03-06'), confidence: 'High', notes: '24 IT sector + 45 scientific research. Knowledge-sector layoffs.'});

// ============================================================================
// WELFARE STATISTICS — Workstream B
// ============================================================================

CREATE (:WelfareStatistic {id: 'WELFARE_SYSTEM_SHARE_2000', name: 'Disability/rehabilitation share of labour market 2000', value: 6.3, unit: 'percent', temporal_reference: '2000-01', source_url: 'https://www.laeknabladid.is/tolublod/2026/02/yfirlitsgrein.-throun-sjukdomsgreininga-i-laeknisvottordum-vegna-endurhaefingar-og-ororku', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Ingimarsson, Laeknabladid 2026.'});
CREATE (:WelfareStatistic {id: 'WELFARE_SYSTEM_SHARE_2024', name: 'Disability/rehabilitation share of labour market 2024', value: 9.4, unit: 'percent', temporal_reference: '2024-01', source_url: 'https://www.laeknabladid.is/tolublod/2026/02/yfirlitsgrein.-throun-sjukdomsgreininga-i-laeknisvottordum-vegna-endurhaefingar-og-ororku', extraction_date: date('2026-03-06'), confidence: 'High', notes: '49% relative increase over 24 years.'});
CREATE (:WelfareStatistic {id: 'WELFARE_PSYCH_SHARE', name: 'Psychiatric diagnosis share of recipients Jan 2025', value: 67, unit: 'percent_approximate', temporal_reference: '2025-01', source_url: 'https://www.icelandreview.com/news/disability-pensions-rise-sharply-in-iceland/', extraction_date: date('2026-03-06'), confidence: 'Medium', notes: 'Approximately two-thirds. Includes any psychiatric diagnosis (primary or secondary).'});
CREATE (:WelfareStatistic {id: 'WELFARE_DIAGNOSIS_GROWTH', name: 'High-growth diagnosis cluster 2000-2024', value: 179, unit: 'percent_relative_increase', temporal_reference: '2000-2024', source_url: 'https://www.laeknabladid.is/tolublod/2026/02/yfirlitsgrein.-throun-sjukdomsgreininga-i-laeknisvottordum-vegna-endurhaefingar-og-ororku', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Anxiety, depression, neurodevelopmental, burnout, pain, post-viral. vs 26% for other categories.'});
CREATE (:WelfareStatistic {id: 'WELFARE_YOUNG_WOMEN_GROWTH', name: 'Disability prevalence growth women 18-49', value: 79, unit: 'percent_relative_increase', temporal_reference: '2000-2024', source_url: 'https://www.laeknabladid.is/tolublod/2026/02/yfirlitsgrein.-throun-sjukdomsgreininga-i-laeknisvottordum-vegna-endurhaefingar-og-ororku', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'From 4.7% to 8.4%. Steepest demographic acceleration.'});
CREATE (:WelfareStatistic {id: 'WELFARE_REHAB_EXPENDITURE', name: 'Rehabilitation pension expenditure growth', value: 40, unit: 'percent_yoy', temporal_reference: '2023-2024', source_url: 'https://lifdununa.is/grein/taeplega-84-000-fengu-greitt-fra-tr-arid-2024/', extraction_date: date('2026-03-06'), confidence: 'Medium', notes: 'ISK 15bn to 21bn. Suggests accelerating new entrant inflows.'});
CREATE (:WelfareStatistic {id: 'WELFARE_RECIPIENTS_2024', name: 'Combined disability and rehabilitation recipients 2024', value: 27650, unit: 'persons', temporal_reference: '2024', source_url: 'https://lifdununa.is/grein/taeplega-84-000-fengu-greitt-fra-tr-arid-2024/', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Disability 20,767 + Rehabilitation 6,883.'});

// ============================================================================
// CORPORATE ACTIONS — Workstream C
// ============================================================================

CREATE (:CorporateAction {id: 'CORP_LANDSBANKINN_AI', name: 'Landsbankinn digital transformation and FTE reduction', action_type: 'AI_Integration', company: 'Landsbankinn', sector_nace: 'K64', temporal_reference: '2023-2024', source_url: 'https://arsskyrsla.landsbankinn.is/en', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'FTE 849 to 811 (-38, -4.5%). Bank states: FTE decreased in tandem with technological advancements. Chatbot Elli handles 60% of web queries.'});
CREATE (:CorporateAction {id: 'CORP_ISLANDSBANKI_AI', name: 'Islandsbanki AI assistant Sam and Copilot deployment', action_type: 'AI_Integration', company: 'Islandsbanki', sector_nace: 'K64', temporal_reference: '2024', source_url: 'https://www.islandsbanki.is/en/landing/about/annual-and-sustainability-report-2024', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Internal AI assistant Sam, Microsoft Copilot integration, automated lending. Cut 20 employees citing tech + regulatory changes.'});
CREATE (:CorporateAction {id: 'CORP_ARION_COUNTER', name: 'Arion Bank headcount increase despite AI positioning', action_type: 'AI_Integration', company: 'Arion banki', sector_nace: 'K64', temporal_reference: '2024', source_url: 'https://www.arionbanki.is/english/about-us/arion-banks-reports/', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'FTE 822 to 858 (+36, +4.4%). COUNTER-EVIDENCE: headcount grew while bank positioned AI as efficiency driver.'});

// ============================================================================
// POLICY CHANGES
// ============================================================================

CREATE (:PolicyChange {id: 'POLICY_AI_ACTION_PLAN', name: 'Iceland AI Action Plan 2025-2027', policy_type: 'National_Strategy', temporal_reference: '2024-11', source_url: 'https://www.stjornarradid.is/library/04-Raduneytin/Menningar---nyskopunar--og-haskolaraduneytid/Iceland%27s%20AI%20Action%20Plan%20electronic%20version.pdf', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Claims 55% jobs affected (borrowed international estimate). Claims 30% public sector time automatable (McKinsey figure). 8% feel trained (unverified). Iceland has NO measured baseline adoption rate.'});
CREATE (:PolicyChange {id: 'POLICY_DISABILITY_REFORM', name: 'Disability/rehabilitation system reform September 2025', policy_type: 'Welfare_Reform', temporal_reference: '2025-09-01', source_url: 'https://island.is/en/news/changes-in-disability-and-rehabilitation-1st-of-september-2025', extraction_date: date('2026-03-06'), confidence: 'High', notes: '11 major changes. Disability grant category eliminated (inflates pension headcount). Creates measurement discontinuity.'});
CREATE (:PolicyChange {id: 'POLICY_RIKISKAUP_DISSOLVED', name: 'Rikiskaup dissolved into FMA', policy_type: 'Institutional_Restructuring', temporal_reference: '2024-08-01', source_url: 'https://island.is/en/o/central-public-procurement', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Central Public Procurement absorbed into Financial Management Authority.'});
CREATE (:PolicyChange {id: 'POLICY_PLAY_COLLAPSE', name: 'Play airline ceases operations', policy_type: 'Market_Event', temporal_reference: '2025-09-29', source_url: 'https://www.ruv.is/english/2025-09-29-play-ends-operations-all-flights-cancelled-400-lose-jobs-454639', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Bankruptcy. ~420 direct employees + 50+ Airport Associates. Major confound for unemployment analysis.'});

// ============================================================================
// UNION GRIEVANCES / DISCOURSE VACUUM — Workstream D
// ============================================================================

CREATE (:UnionGrievance {id: 'UNION_DISCOURSE_VACUUM', name: 'Near-complete absence of union AI engagement in Iceland', temporal_reference: '2024-2026', source_url: 'https://island.is/samradsgatt/mal/3862', extraction_date: date('2026-03-07'), confidence: 'High', notes: 'BHM submitted generic 2-page response to AI Action Plan consultation (S-223/2024) demanding consultation platform but providing no data or analysis. Zero submissions from ASI, VR, Efling, SFR, BSRB. Zero AI position papers from any union. Term reikniritsstjornun (algorithmic management) yields zero results in Icelandic discourse.'});
CREATE (:UnionGrievance {id: 'UNION_ICELAND_EWCS_EXCLUDED', name: 'Iceland excluded from EWCS 2024 and Eurostat AI survey', temporal_reference: '2024', source_url: 'https://www.eurofound.europa.eu/en/publications/2025/european-working-conditions-survey-2024-first-findings', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Both the primary worker conditions survey AND the enterprise AI adoption survey exclude Iceland. Country is flying blind on both sides.'});

// ============================================================================
// ACADEMIC EVIDENCE
// ============================================================================

CREATE (:AcademicEvidence {id: 'ACAD_HUMLUM_2025', name: 'Humlum & Vestergaard 2025: Null LLM effects in Denmark', finding: 'Null effects on earnings and hours from ChatGPT adoption', methodology: 'DiD with Danish admin registers', temporal_reference: '2025', source_url: 'https://www.nber.org/papers/w33777', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Strongest comparable Nordic study. Rules out effects larger than 2% two years post-adoption. CONTRADICTS displacement hypothesis.'});
CREATE (:AcademicEvidence {id: 'ACAD_FRANK_2025', name: 'Frank Ahn Moro 2025: AI exposure predicts unemployment', finding: 'AI exposure accounts for 18% additional variation in unemployment risk', methodology: 'Ensemble AI exposure model', temporal_reference: '2025', source_url: 'https://doi.org/10.1093/pnasnexus/pgaf107', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Computer/mathematical occupations most affected. Young workers 22-25 in exposed occupations: -13% employment.'});
CREATE (:AcademicEvidence {id: 'ACAD_ACEMOGLU_2025', name: 'Acemoglu 2025: Modest aggregate AI effects', finding: 'TFP gains likely 0.53-0.66% over 10 years', methodology: 'Structural macro model', temporal_reference: '2025', source_url: 'https://doi.org/10.1093/epolic/eiae042', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Only ~20% of tasks profitably automatable. Warns against alarmism. CONTRADICTS large-displacement scenarios.'});
CREATE (:AcademicEvidence {id: 'ACAD_THORLACIUS_2010', name: 'Thorlacius et al 2010: Disability diagnosis trends Iceland', finding: 'Mental disorders doubled as primary disability diagnosis 1990-2007', methodology: 'Administrative data analysis', temporal_reference: '2010', source_url: 'https://pubmed.ncbi.nlm.nih.gov/20433325/', extraction_date: date('2026-03-06'), confidence: 'High', notes: 'Concludes: alteration in social conditions lowering threshold. 35-year secular trend predating AI.'});
CREATE (:AcademicEvidence {id: 'ACAD_INGIMARSSON_2026', name: 'Ingimarsson 2026: Diagnosis trends 2000-2024', finding: '179% increase in anxiety/depression/neurodevelopmental cluster vs 26% other', methodology: 'TR administrative data review', temporal_reference: '2026', source_url: 'https://www.laeknabladid.is/tolublod/2026/02/yfirlitsgrein.-throun-sjukdomsgreininga-i-laeknisvottordum-vegna-endurhaefingar-og-ororku', extraction_date: date('2026-03-06'), confidence: 'High', notes: '6.3% to 9.4% of labour market. Younger cohort growing faster than older.'});
CREATE (:AcademicEvidence {id: 'ACAD_THORLEIFSDOTTIR_2023', name: 'Thorleifsdottir 2023: AI in HRM Iceland', finding: 'All 10 HR managers used ChatGPT for work despite initially denying AI use', methodology: 'Qualitative interviews', temporal_reference: '2023', source_url: 'https://skemman.is/handle/1946/45903', extraction_date: date('2026-03-06'), confidence: 'Medium', notes: 'Small n but only Iceland-specific AI worker study. Shadow AI signature: declared no AI use, then described ChatGPT for professional writing.'});

// ============================================================================
// FALSIFICATION TESTS
// ============================================================================

CREATE (:FalsificationTest {id: 'FA1', name: 'Physical vs knowledge sector concentration', workstream: 'A', result: 'MIXED', evidence: 'Physical sectors +8000 jobs. But ICT -1300, Professional -900. Knowledge occupations -9300 in single year. Physical growth does NOT explain knowledge contraction.', implication: 'Hypothesis partially supported at occupation level'});
CREATE (:FalsificationTest {id: 'FA2', name: 'Seasonality explanation', workstream: 'A', result: 'PARTIAL', evidence: 'Q1 2025 spike has seasonal component. Q4 2025 at 5.0% breaks recovery pattern. Unemployment floor has risen structurally.', implication: 'Structural signal present beyond seasonality'});
CREATE (:FalsificationTest {id: 'FA3', name: 'Age distribution skew', workstream: 'A', result: 'MIXED', evidence: 'Youth dominates rate increases. But 25-54 hit 4.9% Q4 2025 (unprecedented). 30-49 group is 55% of all long-term unemployed.', implication: 'Youth dominates but prime-age signal notable'});
CREATE (:FalsificationTest {id: 'FB1', name: 'Psychiatric diagnoses rising faster', workstream: 'B', result: 'CONFIRMED', evidence: '179% growth in psychiatric cluster vs 26% other. 2/3 of recipients have psychiatric diagnoses.', implication: 'Stress vector NOT falsified'});
CREATE (:FalsificationTest {id: 'FB2', name: 'Aging vs working-age explanation', workstream: 'B', result: 'PARTIALLY_FALSIFIED', evidence: 'Younger cohort 18-49 growing +57% vs older 50-66 +27%. Women 18-49: +79%.', implication: 'Demographic aging explanation weakened'});
CREATE (:FalsificationTest {id: 'FB3', name: 'September 2025 reform discontinuity', workstream: 'B', result: 'CONFIRMED', evidence: 'Disability grant eliminated, all transferred to pension. New categories. Post-Sept 2025 data not comparable.', implication: 'Exercise caution with post-reform comparisons'});
CREATE (:FalsificationTest {id: 'FC1', name: 'AI to headcount reduction sequence', workstream: 'C', result: 'PARTIALLY_CONFIRMED', evidence: 'Landsbankinn: -38 FTE with explicit tech attribution. Islandsbanki: -20, tech cited. Arion: +36 counter-evidence. Net banking: ~22 positions.', implication: 'Weak corporate-level evidence; does not explain 9300 occupation contraction'});
CREATE (:FalsificationTest {id: 'FC3', name: 'Iceland AI adoption at/above EU', workstream: 'C', result: 'UNKNOWN', evidence: 'Iceland EXCLUDED from Eurostat isoc_eb_ai survey. No measured baseline exists.', implication: 'Adoption premise cannot be verified'});
CREATE (:FalsificationTest {id: 'FD1', name: 'Iceland below Nordic on algorithmic management', workstream: 'D', result: 'UNTESTABLE', evidence: 'Iceland excluded from EWCS 2024. No alternative data source.', implication: 'Cannot assess AI management deployment'});
CREATE (:FalsificationTest {id: 'FD2', name: 'Work intensity flat (cognitive pressure unsupported)', workstream: 'D', result: 'PARTIAL_FLAG', evidence: 'Burnout elevated and worsening (Prosent: ~1/3 exhausted). But no AI causation variable measured.', implication: 'Cognitive pressure claim unsupported but not falsified'});

// ============================================================================
// RELATIONSHIPS — Temporal, Correlational, Causal, and Contradictory
// ============================================================================

// Source relationships
MATCH (m:MacroMetric {id: 'MACRO_ICT_EMPLOYMENT'}), (s:DataSource {id: 'SRC_HAGSTOFA_PXWEB'}) CREATE (m)-[:SOURCED_FROM]->(s);
MATCH (m:MacroMetric {id: 'MACRO_KNOWLEDGE_OCC_LOSS'}), (s:DataSource {id: 'SRC_HAGSTOFA_PXWEB'}) CREATE (m)-[:SOURCED_FROM]->(s);
MATCH (w:WelfareStatistic {id: 'WELFARE_DIAGNOSIS_GROWTH'}), (s:DataSource {id: 'SRC_LAEKNABLADID_2026'}) CREATE (w)-[:SOURCED_FROM]->(s);
MATCH (c:CorporateAction {id: 'CORP_LANDSBANKINN_AI'}), (s:DataSource {id: 'SRC_LANDSBANKINN_AR'}) CREATE (c)-[:SOURCED_FROM]->(s);

// Cohort relationships
MATCH (m:MacroMetric {id: 'MACRO_KNOWLEDGE_OCC_LOSS'}), (c:DemographicCohort {id: 'COHORT_KNOWLEDGE'}) CREATE (m)-[:AFFECTS_COHORT]->(c);
MATCH (m:MacroMetric {id: 'MACRO_PHYSICAL_OCC_GAIN'}), (c:DemographicCohort {id: 'COHORT_PHYSICAL'}) CREATE (m)-[:AFFECTS_COHORT]->(c);
MATCH (m:MacroMetric {id: 'MACRO_ICT_EMPLOYMENT'}), (c:DemographicCohort {id: 'COHORT_ICT'}) CREATE (m)-[:AFFECTS_COHORT]->(c);
MATCH (m:MacroMetric {id: 'MACRO_PRIME_AGE_UNEMP'}), (c:DemographicCohort {id: 'COHORT_PRIME'}) CREATE (m)-[:AFFECTS_COHORT]->(c);
MATCH (w:WelfareStatistic {id: 'WELFARE_YOUNG_WOMEN_GROWTH'}), (c:DemographicCohort {id: 'COHORT_WOMEN_YOUNG'}) CREATE (w)-[:AFFECTS_COHORT]->(c);

// Temporal precedence (corporate AI -> macro effects)
MATCH (c:CorporateAction {id: 'CORP_LANDSBANKINN_AI'}), (m:MacroMetric {id: 'MACRO_ICT_EMPLOYMENT'})
CREATE (c)-[:PRECEDED {months_gap: 12, mechanism: 'Bank AI/chatbot deployment precedes ICT sector employment decline'}]->(m);

MATCH (c:CorporateAction {id: 'CORP_ISLANDSBANKI_AI'}), (m:MacroMetric {id: 'MACRO_ICT_EMPLOYMENT'})
CREATE (c)-[:PRECEDED {months_gap: 12, mechanism: 'AI assistant and Copilot deployment precedes sector employment decline'}]->(m);

// Play collapse -> unemployment (CAUSAL - non-AI explanation)
MATCH (p:PolicyChange {id: 'POLICY_PLAY_COLLAPSE'}), (m:MacroMetric {id: 'MACRO_UNEMP_Q4_2025'})
CREATE (p)-[:EXPLAINS {mechanism: 'Airline bankruptcy directly displaced ~470+ workers into unemployment', evidence_strength: 'High'}]->(m);

// AI Action Plan -> Corporate adoption (policy signal)
MATCH (p:PolicyChange {id: 'POLICY_AI_ACTION_PLAN'}), (c:CorporateAction {id: 'CORP_LANDSBANKINN_AI'})
CREATE (p)-[:CORRELATES_WITH {r_value: null, method: 'Temporal co-occurrence. Government AI strategy parallels corporate AI deployment.'}]->(c);

// Correlations between macro employment and welfare
MATCH (m:MacroMetric {id: 'MACRO_KNOWLEDGE_OCC_LOSS'}), (w:WelfareStatistic {id: 'WELFARE_SYSTEM_SHARE_2024'})
CREATE (m)-[:CORRELATES_WITH {r_value: null, method: 'Both show 2024-2025 stress on knowledge workers / welfare system. Temporal co-occurrence only. Occupation link between job losers and welfare entrants NOT established.'}]->(w);

// ICT revenue vs ICT employment (the productivity displacement signal)
MATCH (t:MacroMetric {id: 'MACRO_ICT_TURNOVER'}), (e:MacroMetric {id: 'MACRO_ICT_EMPLOYMENT'})
CREATE (t)-[:CORRELATES_WITH {r_value: null, method: 'ICT revenue +34% while ICT employment -11.4%. Revenue up, jobs down = productivity displacement pattern. Correlation, not confirmed AI causation.'}]->(e);

// Contradiction: Arion Bank growth
MATCH (c:CorporateAction {id: 'CORP_ARION_COUNTER'}), (m:MacroMetric {id: 'MACRO_ICT_EMPLOYMENT'})
CREATE (c)-[:CONTRADICTS {basis: 'Arion Bank added 36 FTE while positioning AI. Not all financial institutions reduce headcount with AI adoption.'}]->(m);

// Contradiction: Denmark null result
MATCH (a:AcademicEvidence {id: 'ACAD_HUMLUM_2025'}), (m:MacroMetric {id: 'MACRO_KNOWLEDGE_OCC_LOSS'})
CREATE (a)-[:CONTRADICTS {basis: 'Strongest comparable Nordic study found null LLM employment effects in Denmark with gold-standard methodology. Iceland knowledge-occupation contraction may have non-AI explanations.'}]->(m);

// Contradiction: Acemoglu modest effects
MATCH (a:AcademicEvidence {id: 'ACAD_ACEMOGLU_2025'}), (m:MacroMetric {id: 'MACRO_KNOWLEDGE_OCC_LOSS'})
CREATE (a)-[:CONTRADICTS {basis: 'Structural macro model predicts only 0.53-0.66% TFP gain over 10 years. A 9300-job knowledge-occupation contraction in one year exceeds modeled AI displacement rate significantly.'}]->(m);

// Long-term welfare trend predates AI
MATCH (a:AcademicEvidence {id: 'ACAD_THORLACIUS_2010'}), (w:WelfareStatistic {id: 'WELFARE_PSYCH_SHARE'})
CREATE (a)-[:EXPLAINS {mechanism: 'Psychiatric diagnosis growth began 1990, 35 years before significant AI adoption. Social conditions and threshold changes are the established explanation.', evidence_strength: 'High'}]->(w);

// Academic evidence supporting displacement
MATCH (a:AcademicEvidence {id: 'ACAD_FRANK_2025'}), (m:MacroMetric {id: 'MACRO_KNOWLEDGE_OCC_LOSS'})
CREATE (a)-[:CORRELATES_WITH {r_value: 0.57, method: 'AI exposure predicts unemployment with r=0.57 in US data. Iceland knowledge-occupation contraction is consistent with this finding.'}]->(m);

// Falsification test relationships
MATCH (f:FalsificationTest {id: 'FA1'}), (m:MacroMetric {id: 'MACRO_KNOWLEDGE_OCC_LOSS'}) CREATE (m)-[:TESTED_BY]->(f);
MATCH (f:FalsificationTest {id: 'FB1'}), (w:WelfareStatistic {id: 'WELFARE_PSYCH_SHARE'}) CREATE (w)-[:TESTED_BY]->(f);
MATCH (f:FalsificationTest {id: 'FB2'}), (w:WelfareStatistic {id: 'WELFARE_YOUNG_WOMEN_GROWTH'}) CREATE (w)-[:TESTED_BY]->(f);
MATCH (f:FalsificationTest {id: 'FC1'}), (c:CorporateAction {id: 'CORP_LANDSBANKINN_AI'}) CREATE (c)-[:TESTED_BY]->(f);

// ============================================================================
// TERMINAL QUERY — The Full Causal Chain Test
// ============================================================================

// Find all AI Integration actions followed within 6-12 months by
// sector job loss + psychological disability claim from same demographic cohort
// NOTE: This query is structurally valid but expected to return LIMITED results
// due to the missing occupation-level link between welfare and employment data.

// MATCH (corp:CorporateAction {action_type: 'AI_Integration'})-[:PRECEDED {months_gap: mg}]->(job:MacroMetric)
// WHERE 6 <= mg <= 12
//   AND (job.name CONTAINS 'employment' OR job.name CONTAINS 'unemployment' OR job.name CONTAINS 'contraction')
// MATCH (job)-[:CORRELATES_WITH]->(welfare:WelfareStatistic)
// WHERE welfare.name CONTAINS 'psychiatric' OR welfare.name CONTAINS 'diagnosis'
// OPTIONAL MATCH (corp)-[:AFFECTS_COHORT]->(cohort:DemographicCohort)
// OPTIONAL MATCH (job)-[:AFFECTS_COHORT]->(cohort)
// RETURN corp.name AS ai_action,
//        corp.company AS company,
//        corp.temporal_reference AS ai_date,
//        job.name AS job_metric,
//        job.value AS job_value,
//        mg AS months_between,
//        welfare.name AS welfare_indicator,
//        welfare.value AS welfare_value,
//        cohort.description AS affected_cohort
// ORDER BY mg ASC;

// ============================================================================
// SUMMARY STATISTICS QUERY — Original corpus (Workstreams A-D)
// ============================================================================

// MATCH (n) RETURN labels(n)[0] AS type, count(n) AS count ORDER BY count DESC;
// Expected: ~35 nodes, ~25 relationships


// ============================================================================
// ============================================================================
// UNAK RESEARCH EXTENSION — GLOBAL & EUROPEAN AI CONTEXT
// Generated: 2026-03-09
// Source: UNAK Q1 2026 AI Landscape Report research project
// Orchestrator: Magnus Smari Smarason, MA
// Coverage: EU governance, Nordic strategies, benchmarks, institutions,
//           evidence gaps, international comparisons
// New node types: GovernanceFramework, InstitutionalCapacity, BenchmarkEvidence,
//                 ResearchProject, EvidenceGap, InternationalComparison
// ============================================================================
// ============================================================================


// ============================================================================
// NEW CONSTRAINTS
// ============================================================================

CREATE CONSTRAINT IF NOT EXISTS FOR (n:GovernanceFramework) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:InstitutionalCapacity) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:BenchmarkEvidence) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:ResearchProject) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:EvidenceGap) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT IF NOT EXISTS FOR (n:InternationalComparison) REQUIRE n.id IS UNIQUE;


// ============================================================================
// NEW DATA SOURCES
// ============================================================================

CREATE (:DataSource {id: 'SRC_EU_AI_ACT', name: 'EU Artificial Intelligence Act', url: 'https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=OJ:L_202401689', access: 'Public — OJ L 2024/1689', notes: 'Force 01 Aug 2024. Prohibited uses 02 Feb 2025. GPAI 02 Aug 2025. High-risk 02 Aug 2026.'});
CREATE (:DataSource {id: 'SRC_BIS_WP1325', name: 'BIS Working Paper 1325 — AI and Firm Productivity', url: 'https://www.bis.org/publ/work1325.htm', access: 'Public PDF', notes: 'Aldasoro et al. 2026. 12,000 EU firms. +4% productivity. Skill-biased labour reallocation.'});
CREATE (:DataSource {id: 'SRC_ANTHROPIC_INDEX', name: 'Anthropic Economic Index 2025', url: 'https://www.anthropic.com/news/economic-index', access: 'Public report', notes: 'Claude API task analysis. 94% augmentation vs 33% task automation in practice. Computer/math occupations dominant.'});
CREATE (:DataSource {id: 'SRC_HLE_NATURE', name: 'Humanity\'s Last Exam — Nature Vol 649, 2026', url: 'https://doi.org/10.1038/s41586-025-09962-4', access: 'Open access', notes: 'Phan et al. (Center for AI Safety / Scale AI). 2,500 expert-level questions. Published 28 Jan 2026.'});
CREATE (:DataSource {id: 'SRC_NORDREGIO_2025', name: 'Nordregio 2025: Nordic Higher Education Beyond Major Urban Areas', url: 'https://doi.org/10.6027/R2025:10.1403-2503', access: 'Public PDF', notes: 'Report 2025:10. Profiles UNAK as strategic regional university with distance education model. Contains NO evaluation of AI governance at UNAK.'});
CREATE (:DataSource {id: 'SRC_UNAK_AI_POLICY', name: 'UNAK Guiding Policy on Responsible Use of AI', url: 'https://www.unak.is/is/haskolinn/stjornskipulag/stefnur-og-aaetlanir/stefna-um-abyrga-notkun-gervigreindar', access: 'Public', notes: 'Approved by University Council 30 Oct 2025. Five guiding values. Appendix A (practical guidelines), Appendix B (data security). Review scheduled April 2026.'});
CREATE (:DataSource {id: 'SRC_NORDFORSK_2025', name: 'NordForsk Nordic-Baltic AI Initiative 2025', url: 'https://www.nordforsk.org/programmes-and-calls/programmes/nordic-baltic-ai-initiative', access: 'Public', notes: 'NOK 300M fund. 216 applications. 17 projects funded. Open-ended thematic scope. 5 Nordic + 3 Baltic countries.'});
CREATE (:DataSource {id: 'SRC_NORDIC_AIR', name: 'Nordic AIR Partnership MoU Feb 2026', url: 'https://wasp-sweden.org/nordic-air', access: 'Public announcement', notes: 'WASP (SE) + FCAI (FI) + Pioneer Centre (DK) + NORA (NO) + CADIA (IS). Signed 26 Feb 2025. Cross-Nordic AI research coordination.'});
CREATE (:DataSource {id: 'SRC_IMF_WP067', name: 'IMF Working Paper 067/2025 — AI and Labour Market', url: 'https://www.imf.org/en/Publications/WP/Issues/2025/04/07/Artificial-Intelligence-and-the-Labor-Market-558765', access: 'Public PDF', notes: 'High-skill occupations 3-5× more exposed. 40% of global employment affected (moderate exposure). Advanced economies more exposed.'});
CREATE (:DataSource {id: 'SRC_EWCS_2024', name: 'European Working Conditions Survey 2024', url: 'https://www.eurofound.europa.eu/en/publications/2025/european-working-conditions-survey-2024-first-findings', access: 'Public', notes: '35 EU/EEA countries. Iceland EXCLUDED. 12% EU workers use AI at work. Only Norway and Switzerland added as non-EU Nordic.'});
CREATE (:DataSource {id: 'SRC_EUROSTAT_ISOC_AI', name: 'Eurostat Enterprise AI Adoption Survey (isoc_eb_ai)', url: 'https://ec.europa.eu/eurostat/web/digital-economy-and-society/database', access: 'Public', notes: 'Annual enterprise survey. Iceland EXCLUDED (not EEA statistical participant for this survey). No Icelandic baseline exists.'});
CREATE (:DataSource {id: 'SRC_EP_AI_RESOLUTION', name: 'European Parliament Resolution on AI Governance Dec 2025', url: 'https://www.europarl.europa.eu/doceo/document/A-10-2025-0001_EN.html', access: 'Public', notes: 'Adopted 17 Dec 2025. 412-155 vote. Calls for mandatory human oversight, red lines on autonomous weapons, algorithmic transparency.'});


// ============================================================================
// GOVERNANCE FRAMEWORK NODES
// ============================================================================

CREATE (:GovernanceFramework {
  id: 'GOV_EU_AI_ACT_PHASE1',
  name: 'EU AI Act — Prohibited Uses (Phase 1)',
  framework: 'EU AI Act',
  jurisdiction: 'EU27',
  status: 'In force',
  temporal_reference: '2025-02-02',
  scope: 'Social scoring, real-time biometric surveillance, manipulation systems, predictive policing banned',
  iceland_status: 'EEA member but not yet bound — Act under EEA Joint Committee scrutiny',
  source_id: 'SRC_EU_AI_ACT',
  notes: 'Prohibited practices effective 6 months after force date. Most critical prohibitions for labour contexts.'
});

CREATE (:GovernanceFramework {
  id: 'GOV_EU_AI_ACT_PHASE2',
  name: 'EU AI Act — GPAI Obligations (Phase 2)',
  framework: 'EU AI Act',
  jurisdiction: 'EU27',
  status: 'In force',
  temporal_reference: '2025-08-02',
  scope: 'General-purpose AI model providers must document capabilities, provide technical documentation, comply with copyright law',
  iceland_status: 'Not yet bound — awaiting EEA annexation',
  source_id: 'SRC_EU_AI_ACT',
  notes: 'Applies to foundation model providers (Anthropic, OpenAI, Google, Meta). Systemic risk models (>10^25 FLOPs) face additional requirements.'
});

CREATE (:GovernanceFramework {
  id: 'GOV_EU_AI_ACT_PHASE3',
  name: 'EU AI Act — High-Risk AI Obligations (Phase 3)',
  framework: 'EU AI Act',
  jurisdiction: 'EU27',
  status: 'Pending',
  temporal_reference: '2026-08-02',
  scope: 'Employment AI (hiring, promotion, performance monitoring), education AI, critical infrastructure AI',
  iceland_status: 'Expected EEA incorporation before Aug 2026 — no confirmed timeline',
  source_id: 'SRC_EU_AI_ACT',
  notes: 'Annex III systems require conformity assessments, human oversight, transparency. Employment systems directly relevant to Iceland labour context.'
});

CREATE (:GovernanceFramework {
  id: 'GOV_ICELAND_AI_ACTION_PLAN',
  name: 'Iceland National AI Action Plan 2025-2027',
  framework: 'National Strategy',
  jurisdiction: 'Iceland',
  status: 'Active',
  temporal_reference: '2024-11',
  scope: 'AI adoption, public sector, innovation, skills',
  iceland_status: 'In force',
  evidence_quality: 'LOW — relies entirely on borrowed international estimates. No measured Icelandic baseline.',
  source_id: 'SRC_HAGSTOFA_PXWEB',
  notes: 'Claims 55% jobs affected (WEF figure applied without local validation). Claims 30% public sector time automatable (McKinsey figure). Contains no measurement framework. Augmentation framing contradicted by government AI deployment that replaced admin positions.'
});

CREATE (:GovernanceFramework {
  id: 'GOV_NORWAY_AI',
  name: 'Norway National AI Strategy — Updated 2024',
  framework: 'National Strategy',
  jurisdiction: 'Norway',
  status: 'Active',
  temporal_reference: '2024',
  scope: 'Sectoral deployment, data access, welfare AI safety, worker conditions',
  union_integration: 'YES — tripartite consultation embedded. LO/NHO AI framework agreement in force.',
  source_id: 'SRC_EWCS_2024',
  notes: 'Gold standard Nordic model. Includes co-determination requirements for AI systems affecting workers. Direct contrast with Iceland.'
});

CREATE (:GovernanceFramework {
  id: 'GOV_DENMARK_AI',
  name: 'Denmark Digital Strategy + AI Hub',
  framework: 'National Strategy',
  jurisdiction: 'Denmark',
  status: 'Active',
  temporal_reference: '2024',
  scope: 'Pioneer Centre for AI, sectoral AI deployment, welfare AI',
  union_integration: 'YES — DA/FH agreement on algorithmic management notification obligations.',
  source_id: 'SRC_EWCS_2024',
  notes: 'Pioneer Centre for AI is the flagship Nordic research hub. Denmark among highest EU AI adoption rates.'
});

CREATE (:GovernanceFramework {
  id: 'GOV_FINLAND_AI',
  name: 'Finland AuroraAI Programme + FCAI',
  framework: 'National Strategy',
  jurisdiction: 'Finland',
  status: 'Active',
  temporal_reference: '2024',
  scope: 'Public service AI, human-centric design, FCAI research hub',
  union_integration: 'PARTIAL — SAK guidelines on AI at work (non-binding).',
  source_id: 'SRC_EWCS_2024',
  notes: 'FCAI (Finnish Center for Artificial Intelligence) is NordForsk partner. AuroraAI is the most ambitious public-sector AI integration project in Nordics.'
});

CREATE (:GovernanceFramework {
  id: 'GOV_SWEDEN_AI',
  name: 'Sweden AI Strategy + WASP',
  framework: 'National Strategy',
  jurisdiction: 'Sweden',
  status: 'Active',
  temporal_reference: '2024',
  scope: 'WASP research programme, AI Commission, innovation focus',
  union_integration: 'YES — LO Sweden guidelines on AI use in collective agreements.',
  source_id: 'SRC_EWCS_2024',
  notes: 'WASP (Wallenberg AI, Autonomous Systems and Software Program) is the largest AI research initiative in Nordic region. WASP is Nordic AIR lead partner.'
});


// ============================================================================
// INSTITUTIONAL CAPACITY NODES
// ============================================================================

CREATE (:InstitutionalCapacity {
  id: 'INST_UNAK',
  name: 'University of Akureyri (UNAK)',
  institution_type: 'Regional University',
  location: 'Akureyri, Iceland',
  ai_policy: 'Guiding Policy on Responsible Use of AI',
  ai_policy_date: date('2025-10-30'),
  ai_policy_precedence: 'FIRST Icelandic university to adopt AI governance at council level (2 weeks before RU)',
  ai_capacity: 'LOW — No AI/ML research groups. No computer science department. Education-focused.',
  eu_governance_role: 'HIGH POTENTIAL — Only non-Reykjavik institution. Regional perspective. EU AI Act compliance expertise would be genuinely differentiated.',
  auto_mare_role: 'Principal investigator on AUTO-MARE (NordForsk-funded, autonomous marine systems)',
  aifa_ice_status: 'EXCLUDED — Not a founding partner. HI and RU hold all capacity.',
  source_id: 'SRC_UNAK_AI_POLICY',
  notes: 'AI policy has 5 guiding values. Appendix A: practical guidelines. Appendix B: data security. Review April 2026. AUTO-MARE is UNAK\'s only active AI research role.'
});

CREATE (:InstitutionalCapacity {
  id: 'INST_AIFA_ICE',
  name: 'AIFA-ICE — Icelandic AI and HPC Center',
  institution_type: 'National AI Infrastructure',
  location: 'Reykjavik, Iceland',
  founding_partners: 'HI (University of Iceland), RU (Reykjavik University)',
  budget: 'ISK 1.4 billion initial allocation',
  capacity_focus: 'HPC, foundation model research, AI safety research',
  unak_exclusion: 'Structural — UNAK lacks technical AI capacity to be a co-equal partner',
  source_id: 'SRC_NORDFORSK_2025',
  notes: 'All 8 Rannis AI grants to date have gone to HI or RU. AIFA-ICE concentrates national AI capacity in Reykjavik. Iceland has ~35 people building AI.'
});

CREATE (:InstitutionalCapacity {
  id: 'INST_NORDIC_AIR',
  name: 'Nordic AIR Partnership',
  institution_type: 'International Research Consortium',
  members: 'WASP (SE), FCAI (FI), Pioneer Centre (DK), NORA (NO), CADIA (IS)',
  mou_date: date('2025-02-26'),
  scope: 'Cross-Nordic AI research coordination, talent mobility, joint PhD programmes',
  iceland_member: 'CADIA (HI-based). UNAK not included.',
  source_id: 'SRC_NORDIC_AIR',
  notes: 'MoU signed Feb 26, 2025. Represents institutionalization of Nordic AI research cooperation. Iceland participates only through HI.'
});

CREATE (:InstitutionalCapacity {
  id: 'INST_RU',
  name: 'Reykjavik University (RU)',
  institution_type: 'Private University',
  location: 'Reykjavik, Iceland',
  ai_capacity: 'HIGH — Computer science, data science, AI research groups',
  ai_policy: 'AI use policy adopted November 2025',
  ai_policy_date: 'November 2025',
  aifa_ice_status: 'FOUNDING PARTNER',
  rannis_ai_grants: 'Multiple — exact count not verified',
  source_id: 'SRC_UNAK_AI_POLICY',
  notes: 'RU AI policy adopted approximately 2 weeks AFTER UNAK (Oct 30). RU is the primary private AI research hub in Iceland.'
});

CREATE (:InstitutionalCapacity {
  id: 'INST_HI',
  name: 'University of Iceland (HI / Háskóli Íslands)',
  institution_type: 'Public University',
  location: 'Reykjavik, Iceland',
  ai_capacity: 'HIGH — CADIA research centre, computer science, data science',
  ai_policy: 'University-level AI guidelines in force',
  aifa_ice_status: 'FOUNDING PARTNER',
  nordic_air_member: 'YES — CADIA is Iceland\'s Nordic AIR representative',
  rannis_ai_grants: 'Multiple',
  source_id: 'SRC_NORDIC_AIR',
  notes: 'HI is Iceland\'s largest and most research-intensive university. CADIA (Center for Analysis and Design of Intelligent Agents) is the flagship AI research centre.'
});


// ============================================================================
// BENCHMARK EVIDENCE NODES
// ============================================================================

CREATE (:BenchmarkEvidence {
  id: 'BENCH_ARC_AGI',
  name: 'ARC-AGI Benchmark',
  benchmark_type: 'Abstract Reasoning / AGI Proxy',
  baseline_score: 5.0,
  baseline_model: 'GPT-4o',
  baseline_year: 2023,
  frontier_score: 87.5,
  frontier_model: 'o3 (high compute)',
  frontier_year: 2025,
  improvement_pp: 82.5,
  unit: 'percent_correct',
  governance_relevance: 'Demonstrates qualitative capability jump in abstract reasoning — relevant for evaluating AI systems that reason about novel situations',
  source_id: 'SRC_ANTHROPIC_INDEX',
  notes: 'ARC-AGI designed by François Chollet to test human-like flexible reasoning. o3 passes at high compute but economically unviable at that cost level.'
});

CREATE (:BenchmarkEvidence {
  id: 'BENCH_SWE_BENCH',
  name: 'SWE-bench Verified',
  benchmark_type: 'Software Engineering / Agentic Task Completion',
  baseline_score: 20.0,
  baseline_model: 'Frontier models circa 2023',
  baseline_year: 2023,
  frontier_score: 80.9,
  frontier_model: 'Claude Opus 4.5',
  frontier_year: 2025,
  improvement_pp: 60.0,
  unit: 'percent_tasks_completed',
  governance_relevance: 'ICT sector automation risk — software engineering is a knowledge occupation. +60pp in <2 years is directly relevant to Iceland ICT employment decline.',
  source_id: 'SRC_ANTHROPIC_INDEX',
  notes: 'SWE-bench measures real GitHub issue resolution. Claude Opus 4.5 at 80.9%. Note: 76.8% = Kimi K2.5 (Moonshot AI) — not Claude. Correction verified in fact-check phase.'
});

CREATE (:BenchmarkEvidence {
  id: 'BENCH_GPQA',
  name: 'GPQA Diamond',
  benchmark_type: 'Expert Knowledge (PhD-level science)',
  baseline_score: 55.0,
  baseline_model: 'GPT-4o (approx)',
  baseline_year: 2024,
  frontier_score: 94.3,
  frontier_model: 'Gemini 3.1 Pro',
  frontier_year: 2025,
  improvement_pp: 39.3,
  unit: 'percent_correct',
  governance_relevance: 'Measures expert-level academic knowledge. Exceeds PhD-level human expert performance (~65%). Relevant for higher education impact assessment.',
  source_id: 'SRC_HLE_NATURE',
  notes: 'GPQA Diamond questions require PhD-level expertise in biology, chemistry, physics. Frontier models now surpass the average domain expert.'
});

CREATE (:BenchmarkEvidence {
  id: 'BENCH_HLE',
  name: 'Humanity\'s Last Exam (HLE)',
  benchmark_type: 'Frontier Expert Knowledge',
  baseline_score: 2.7,
  baseline_model: 'GPT-4o',
  baseline_year: 2024,
  frontier_score: 25.3,
  frontier_model: 'GPT-5 (paper); ~37.5% on live leaderboard Mar 2026',
  frontier_year: 2025,
  improvement_pp: 22.6,
  unit: 'percent_correct',
  n_questions: 2500,
  subjects_covered: '100+ disciplines including mathematics, sciences, humanities',
  calibration_finding: 'ALL models show >70% calibration error (GPT-4o: 89%). Models do not know what they do not know.',
  governance_relevance: 'CRITICAL for higher education: calibration failure means AI systems confidently give wrong answers to expert questions. Human oversight is non-optional, not optional.',
  nature_doi: 'https://doi.org/10.1038/s41586-025-09962-4',
  nature_citation: 'Phan, L. et al. (2026). A benchmark of expert-level academic questions to assess AI capabilities. Nature, 649, 1139–1143.',
  source_id: 'SRC_HLE_NATURE',
  notes: 'Published 28 Jan 2026. Nature Vol 649. Center for AI Safety and Scale AI. Designed to remain challenging even as model capabilities increase. Supersedes MMLU as difficulty ceiling benchmark.'
});


// ============================================================================
// RESEARCH PROJECT NODES
// ============================================================================

CREATE (:ResearchProject {
  id: 'PROJ_AUTO_MARE',
  name: 'AUTO-MARE — Autonomous Marine Systems Research',
  lead_institution: 'UNAK',
  partners: 'Norwegian and other Nordic partners (specifics not public)',
  funder: 'NordForsk Nordic-Baltic AI Initiative',
  funding_amount: 'Part of NOK 300M NordForsk envelope',
  domain: 'Marine autonomous systems, robotics, Nordic coastal logistics',
  ai_relevance: 'HIGH — Computer vision, sensor fusion, navigation AI for autonomous vessels',
  iceland_relevance: 'Fishing sector, coastal surveillance, maritime safety',
  source_id: 'SRC_NORDFORSK_2025',
  notes: 'Only confirmed UNAK AI research role in Nordic infrastructure. Evidence that UNAK has genuine technical AI competence in applied domain even without theoretical AI capacity.'
});

CREATE (:ResearchProject {
  id: 'PROJ_NORDFORSK_AI',
  name: 'NordForsk Nordic-Baltic AI Initiative — 17 Funded Projects',
  lead_institution: 'NordForsk',
  scope: '5 Nordic + 3 Baltic countries',
  total_applications: 216,
  funded_projects: 17,
  budget: 'NOK 300 million',
  thematic_scope: 'Open-ended — covers foundation models, safety, labour, healthcare, climate',
  source_id: 'SRC_NORDFORSK_2025',
  notes: 'Oversubscribed 12:1. Represents primary Nordic AI research coordination mechanism. Iceland participates through AUTO-MARE (UNAK) and HI/RU projects.'
});

CREATE (:ResearchProject {
  id: 'PROJ_OPENEUROLLM',
  name: 'OpenEuroLLM — European Foundation Model Project',
  lead_institution: 'Multi-institutional EU consortium',
  funder: 'EU Horizon + EuroHPC',
  scope: 'Open-source European multilingual foundation model',
  languages: '24+ EU languages including Nordic languages',
  iceland_relevance: 'Icelandic is a small language with limited training data — risk of underrepresentation in European foundation models',
  source_id: 'SRC_EU_AI_ACT',
  notes: 'Part of EU strategic AI sovereignty agenda. OpenEuroLLM aims to reduce dependence on US/Chinese foundation models. Icelandic language inclusion unconfirmed.'
});


// ============================================================================
// EVIDENCE GAP NODES — The Six "Flying Blind" Pillars
// ============================================================================

CREATE (:EvidenceGap {
  id: 'GAP_EWCS_EXCLUSION',
  name: 'Iceland excluded from EWCS 2024',
  gap_type: 'Survey Exclusion',
  pillar: 1,
  impact: 'Cannot measure: AI use at work, algorithmic management prevalence, worker conditions under AI, work intensity',
  comparators_included: 'All EU27 + Norway + Switzerland',
  workaround: 'None. No domestic equivalent survey exists.',
  cost_of_gap: 'Iceland cannot compare to EU 12% AI-at-work baseline. Cannot detect if Iceland is above or below.',
  source_id: 'SRC_EWCS_2024',
  notes: 'EWCS is the authoritative European source for working conditions. Iceland is EFTA/EEA but opted out or was not included. Eurofound has no Iceland field office.'
});

CREATE (:EvidenceGap {
  id: 'GAP_EUROSTAT_AI_EXCLUSION',
  name: 'Iceland excluded from Eurostat AI adoption survey',
  gap_type: 'Survey Exclusion',
  pillar: 1,
  impact: 'Cannot measure: enterprise AI adoption rate, AI investment, AI use by sector',
  comparators_included: 'EU27 member states',
  workaround: 'None. Iceland AI Action Plan borrowed EU/international figures without local validation.',
  cost_of_gap: 'National AI strategy built on statistics that do not apply to Iceland.',
  source_id: 'SRC_EUROSTAT_ISOC_AI',
  notes: 'isoc_eb_ai survey is EU member state only. EEA countries Norway and Liechtenstein also sometimes included — Iceland is not. Creates fundamental evidence vacuum for national policy.'
});

CREATE (:EvidenceGap {
  id: 'GAP_WELFARE_OCCUPATION',
  name: 'Prior occupation of welfare claimants not public',
  gap_type: 'Administrative Data Barrier',
  pillar: 6,
  impact: 'Cannot trace: whether displaced workers (esp. knowledge/ICT sector) enter disability/rehabilitation system',
  data_holder: 'Tryggingastofnun (TR)',
  legal_barrier: 'Data protection — individual-level occupation data not in public aggregate tables',
  workaround: 'Would require either: (1) TR special data agreement, (2) Hagstofa linked register analysis, (3) FOIA-style data request',
  cost_of_gap: 'The causal chain AI→displacement→welfare CANNOT be closed. System cannot detect harm.',
  source_id: 'SRC_TR_POWERBI',
  notes: 'This is the core welfare black box finding. The system absorbs workers but cannot identify their origin or track whether interventions work.'
});

CREATE (:EvidenceGap {
  id: 'GAP_NO_AI_ADOPTION_SURVEY',
  name: 'No domestic AI adoption survey',
  gap_type: 'Measurement Absence',
  pillar: 1,
  impact: 'Cannot measure: national AI adoption rate, sectoral deployment, SME vs large enterprise divergence',
  responsible_institution: 'None — gap unowned',
  cost_of_gap: 'Iceland AI Action Plan is empirically unmoored. Claims like "8% feel trained" are unverified.',
  source_id: 'SRC_HAGSTOFA_PXWEB',
  notes: 'Hagstofa does not run an AI adoption survey. No Ministry of Industry survey exists. AI Action Plan monitoring framework does not include a baseline adoption measurement mechanism.'
});

CREATE (:EvidenceGap {
  id: 'GAP_MEASUREMENT_GAP_17PCT',
  name: '17% measurement gap between Hagstofa and VMST',
  gap_type: 'Statistical Methodology Divergence',
  pillar: 1,
  hagstofa_method: 'Labour Force Survey (LFS) — ILO definition, sample survey',
  vmst_method: 'Administrative register — benefit claimants only',
  gap_size: '17 percent of unemployed population not captured by VMST',
  impact: 'VMST consistently undercounts. Audit Office confirmed gap in 2025 report. Policy interventions calibrated against wrong baseline.',
  source_id: 'SRC_RIKISENDURSKODUN',
  notes: 'Rikisendurskodun 2025 audit explicitly identified this gap. Non-claimants (ineligible, exhausted benefits, discouraged workers) absent from VMST. Creates systematic undercount.'
});

CREATE (:EvidenceGap {
  id: 'GAP_UNAK_AIFA_EXCLUSION',
  name: 'UNAK structurally excluded from AIFA-ICE',
  gap_type: 'Institutional Exclusion',
  pillar: 5,
  impact: 'National AI infrastructure concentrates in Reykjavik. Regional universities have no participation path.',
  structural_reason: 'UNAK lacks HPC infrastructure and AI research staff to be co-equal partner',
  governance_opportunity: 'EU AI Act compliance expertise (ethics, governance, responsible use) is NOT a technical capacity gap',
  source_id: 'SRC_UNAK_AI_POLICY',
  notes: 'This gap is strategic, not permanent. UNAK AI policy (Oct 30, 2025) gives it a governance credential. Value proposition: provide compliance/ethics layer that HI/RU technical partners cannot.'
});


// ============================================================================
// INTERNATIONAL COMPARISON NODES
// ============================================================================

CREATE (:InternationalComparison {
  id: 'COMP_NORDIC_GOVERNANCE',
  name: 'Nordic AI Governance Comparison — 5-Country Matrix',
  dimension: 'Union AI Framework',
  iceland: 'None — zero union submissions, zero AI collective agreement provisions',
  norway: 'Full — LO/NHO AI framework agreement, tripartite consultation embedded',
  denmark: 'Full — DA/FH algorithmic management notification obligations',
  finland: 'Partial — SAK non-binding guidelines',
  sweden: 'Full — LO Sweden AI provisions in collective agreements',
  verdict: 'Iceland is the outlier. All four other Nordic states have union AI frameworks. Iceland has none.',
  source_id: 'SRC_EWCS_2024',
  notes: 'Data from UNAK landscape report Phase 2 research. Nordic governance comparison table, Section 3.2.'
});

CREATE (:InternationalComparison {
  id: 'COMP_NORDIC_ADOPTION',
  name: 'Nordic AI Adoption Rates — Enterprise Survey',
  dimension: 'Enterprise AI Adoption',
  iceland: 'UNKNOWN — excluded from Eurostat isoc_eb_ai',
  norway: '~28% of enterprises use AI (Eurostat 2024)',
  denmark: '~33% of enterprises use AI — highest in Nordics (Eurostat 2024)',
  finland: '~27% of enterprises use AI (Eurostat 2024)',
  sweden: '~25% of enterprises use AI (Eurostat 2024)',
  eu_average: '~13.5% of enterprises use AI (Eurostat 2024)',
  verdict: 'Iceland cannot be positioned on this scale. Flying blind.',
  source_id: 'SRC_EUROSTAT_ISOC_AI',
  notes: 'These are [MEASURED] figures from Eurostat. Iceland\'s absence is not a rounding error — it is a structural exclusion from the measurement system.'
});

CREATE (:InternationalComparison {
  id: 'COMP_EU_AI_ACT_EEA',
  name: 'EU AI Act EEA Incorporation Status',
  dimension: 'Regulatory Binding',
  eu_status: 'In force Aug 2024. Phased obligations through 2026.',
  iceland_status: 'EEA member. Act referred to EEA Joint Committee. Not yet incorporated. No binding timeline.',
  norway_status: 'Same EEA mechanism as Iceland. Under scrutiny.',
  liechtenstein_status: 'Same EEA mechanism.',
  practical_impact: 'Icelandic companies deploying AI systems in EU market must comply regardless of Iceland binding status. EEA incorporation creates certainty.',
  source_id: 'SRC_EU_AI_ACT',
  notes: 'EEA annexation typically takes 12-36 months after EU force date. Iceland is not outside EU AI Act in practice — Icelandic exporters to EU market face compliance requirements now.'
});

CREATE (:InternationalComparison {
  id: 'COMP_AI_WORKERS',
  name: 'AI Workers at Work — EU vs Iceland',
  dimension: 'Worker AI Use',
  eu_rate: '12% of EU workers use AI at work (EWCS 2024)',
  iceland_rate: 'UNKNOWN — excluded from EWCS',
  norway_rate: '~15% (EWCS 2024 — Norway included)',
  range: 'EU range: ~6% (Eastern Europe) to ~20% (Nordics/Netherlands)',
  verdict: 'Iceland cannot be positioned. No domestic survey. Shadow AI use (Thorleifsdottir 2023) suggests actual use exceeds declared use.',
  source_id: 'SRC_EWCS_2024',
  notes: 'The Thorleifsdottir 2023 finding — all 10 HR managers used ChatGPT despite initially denying it — suggests Iceland may have significant undeclared AI use.'
});


// ============================================================================
// NEW ACADEMIC EVIDENCE NODES
// ============================================================================

CREATE (:AcademicEvidence {
  id: 'ACAD_ALDASORO_2026',
  name: 'Aldasoro et al. 2026 (BIS WP 1325): AI Firm Productivity EU',
  finding: '+4% productivity gain in AI-adopting EU firms. Skill-biased labour reallocation not mass displacement.',
  methodology: 'Matched firm survey + balance sheet panel, 12,000 EU firms',
  temporal_reference: '2026',
  source_url: 'https://www.bis.org/publ/work1325.htm',
  extraction_date: date('2026-03-09'),
  confidence: 'High',
  notes: 'Bank for International Settlements. Largest EU firm-level AI productivity study. Finds gains concentrated in high-skill firms. Low-skill firms see limited benefit. Reallocation within firms, not mass layoffs. QUALIFIES displacement narrative.'
});

CREATE (:AcademicEvidence {
  id: 'ACAD_ANTHROPIC_INDEX_2025',
  name: 'Anthropic Economic Index 2025: Task Coverage vs Actual Use',
  finding: '94% of occupations have theoretical AI task coverage. Only 33% of actual Claude API tasks are automation-type (vs augmentation).',
  methodology: 'Claude API task analysis, occupation mapping via O*NET',
  temporal_reference: '2025',
  source_url: 'https://www.anthropic.com/news/economic-index',
  extraction_date: date('2026-03-09'),
  confidence: 'Medium',
  notes: 'Key finding: the gap between theoretical exposure and actual use is enormous. Computer/math occupations dominate API use. Business/financial operations next. This is the investment-sentiment gap in empirical form.'
});

CREATE (:AcademicEvidence {
  id: 'ACAD_PHAN_NATURE_2026',
  name: 'Phan et al. 2026 (Nature): Humanity\'s Last Exam',
  finding: 'AI models fail >70% of expert questions AND are systematically overconfident (calibration error). GPT-4o: 2.7% accuracy, 89% calibration error.',
  methodology: '2,500 expert-level questions, 100+ disciplines, multi-model evaluation',
  temporal_reference: '2026-01-28',
  source_url: 'https://doi.org/10.1038/s41586-025-09962-4',
  extraction_date: date('2026-03-09'),
  confidence: 'High',
  notes: 'Nature Vol 649, pp. 1139-1143. Center for AI Safety and Scale AI. HLE is now the difficulty ceiling for AI capability benchmarking. Calibration finding is governance-critical: AI systems that do not know their limitations require mandatory human oversight for high-stakes decisions.'
});

CREATE (:AcademicEvidence {
  id: 'ACAD_IMF_WP067_2025',
  name: 'IMF Working Paper 067/2025: AI and Labour Market Effects',
  finding: 'High-skill occupations 3-5× more exposed to AI than low-skill. 40% of global employment at moderate/high exposure. Advanced economies more exposed than emerging.',
  methodology: 'Cross-country occupation-level exposure mapping + macro modelling',
  temporal_reference: '2025',
  source_url: 'https://www.imf.org/en/Publications/WP/Issues/2025/04/07/Artificial-Intelligence-and-the-Labor-Market-558765',
  extraction_date: date('2026-03-09'),
  confidence: 'High',
  notes: 'IMF April 2025. Reversal of prior automation literature: AI exposure is HIGH-SKILL-BIASED not low-skill-biased. Iceland as advanced, high-education economy is in highest exposure tier. Consistent with Iceland ICT/professional sector contraction pattern.'
});

CREATE (:AcademicEvidence {
  id: 'ACAD_EIB_2026',
  name: 'EIB Investment Report 2026/02: AI Adoption and Investment',
  finding: 'EU AI investment €75B in 2025. AI-adopting firms 50% more likely to report productivity gains. SME adoption lagging large firms by 15-20pp.',
  methodology: 'EIB Investment Survey, EU-wide, 12,000+ firms',
  temporal_reference: '2026',
  source_url: 'https://www.eib.org/en/publications/20260022-eibis-2025-2026',
  extraction_date: date('2026-03-09'),
  confidence: 'Medium',
  notes: 'European Investment Bank. AI investment concentrated in large firms. SME laggard dynamic is relevant to Iceland\'s SME-dominated economy. AI investment gap between EU leaders and laggards is widening.'
});


// ============================================================================
// NEW RELATIONSHIPS — UNAK Extension
// ============================================================================

// --- Source relationships for new nodes ---
MATCH (g:GovernanceFramework {id: 'GOV_EU_AI_ACT_PHASE1'}), (s:DataSource {id: 'SRC_EU_AI_ACT'}) CREATE (g)-[:SOURCED_FROM]->(s);
MATCH (g:GovernanceFramework {id: 'GOV_EU_AI_ACT_PHASE2'}), (s:DataSource {id: 'SRC_EU_AI_ACT'}) CREATE (g)-[:SOURCED_FROM]->(s);
MATCH (g:GovernanceFramework {id: 'GOV_EU_AI_ACT_PHASE3'}), (s:DataSource {id: 'SRC_EU_AI_ACT'}) CREATE (g)-[:SOURCED_FROM]->(s);
MATCH (i:InstitutionalCapacity {id: 'INST_UNAK'}), (s:DataSource {id: 'SRC_UNAK_AI_POLICY'}) CREATE (i)-[:SOURCED_FROM]->(s);
MATCH (i:InstitutionalCapacity {id: 'INST_NORDIC_AIR'}), (s:DataSource {id: 'SRC_NORDIC_AIR'}) CREATE (i)-[:SOURCED_FROM]->(s);
MATCH (b:BenchmarkEvidence {id: 'BENCH_HLE'}), (s:DataSource {id: 'SRC_HLE_NATURE'}) CREATE (b)-[:SOURCED_FROM]->(s);
MATCH (b:BenchmarkEvidence {id: 'BENCH_SWE_BENCH'}), (s:DataSource {id: 'SRC_ANTHROPIC_INDEX'}) CREATE (b)-[:SOURCED_FROM]->(s);
MATCH (r:ResearchProject {id: 'PROJ_AUTO_MARE'}), (s:DataSource {id: 'SRC_NORDFORSK_2025'}) CREATE (r)-[:SOURCED_FROM]->(s);
MATCH (e:EvidenceGap {id: 'GAP_EWCS_EXCLUSION'}), (s:DataSource {id: 'SRC_EWCS_2024'}) CREATE (e)-[:SOURCED_FROM]->(s);
MATCH (e:EvidenceGap {id: 'GAP_EUROSTAT_AI_EXCLUSION'}), (s:DataSource {id: 'SRC_EUROSTAT_ISOC_AI'}) CREATE (e)-[:SOURCED_FROM]->(s);
MATCH (e:EvidenceGap {id: 'GAP_WELFARE_OCCUPATION'}), (s:DataSource {id: 'SRC_TR_POWERBI'}) CREATE (e)-[:SOURCED_FROM]->(s);
MATCH (a:AcademicEvidence {id: 'ACAD_PHAN_NATURE_2026'}), (s:DataSource {id: 'SRC_HLE_NATURE'}) CREATE (a)-[:SOURCED_FROM]->(s);
MATCH (a:AcademicEvidence {id: 'ACAD_ALDASORO_2026'}), (s:DataSource {id: 'SRC_BIS_WP1325'}) CREATE (a)-[:SOURCED_FROM]->(s);
MATCH (a:AcademicEvidence {id: 'ACAD_ANTHROPIC_INDEX_2025'}), (s:DataSource {id: 'SRC_ANTHROPIC_INDEX'}) CREATE (a)-[:SOURCED_FROM]->(s);
MATCH (a:AcademicEvidence {id: 'ACAD_IMF_WP067_2025'}), (s:DataSource {id: 'SRC_IMF_WP067'}) CREATE (a)-[:SOURCED_FROM]->(s);

// --- EU AI Act phase sequence ---
MATCH (p1:GovernanceFramework {id: 'GOV_EU_AI_ACT_PHASE1'}), (p2:GovernanceFramework {id: 'GOV_EU_AI_ACT_PHASE2'})
CREATE (p1)-[:PRECEDED {months_gap: 6, mechanism: 'Phased EU AI Act implementation — prohibited uses → GPAI obligations'}]->(p2);

MATCH (p2:GovernanceFramework {id: 'GOV_EU_AI_ACT_PHASE2'}), (p3:GovernanceFramework {id: 'GOV_EU_AI_ACT_PHASE3'})
CREATE (p2)-[:PRECEDED {months_gap: 12, mechanism: 'GPAI obligations → High-risk system requirements including employment AI'}]->(p3);

// --- EU AI Act Phase 3 affects ICT and knowledge cohorts (employment AI is high-risk) ---
MATCH (g:GovernanceFramework {id: 'GOV_EU_AI_ACT_PHASE3'}), (c:DemographicCohort {id: 'COHORT_ICT'})
CREATE (g)-[:AFFECTS_COHORT {mechanism: 'Employment AI systems (hiring, performance, promotion) are Annex III high-risk. ICT workers most likely to be subject to algorithmic management.'}]->(c);

MATCH (g:GovernanceFramework {id: 'GOV_EU_AI_ACT_PHASE3'}), (c:DemographicCohort {id: 'COHORT_KNOWLEDGE'})
CREATE (g)-[:AFFECTS_COHORT {mechanism: 'Knowledge workers in AI-mediated performance systems covered by high-risk requirements.'}]->(c);

// --- Evidence gaps explain existing falsification failures ---
MATCH (e:EvidenceGap {id: 'GAP_EWCS_EXCLUSION'}), (f:FalsificationTest {id: 'FD1'})
CREATE (e)-[:EXPLAINS {mechanism: 'FD1 is UNTESTABLE precisely because EWCS exclusion removes the data needed to assess algorithmic management deployment in Iceland.', evidence_strength: 'High'}]->(f);

MATCH (e:EvidenceGap {id: 'GAP_EUROSTAT_AI_EXCLUSION'}), (f:FalsificationTest {id: 'FC3'})
CREATE (e)-[:EXPLAINS {mechanism: 'FC3 returns UNKNOWN because Eurostat AI survey excludes Iceland. The evidence gap IS the falsification result.', evidence_strength: 'High'}]->(f);

MATCH (e:EvidenceGap {id: 'GAP_WELFARE_OCCUPATION'}), (f:FalsificationTest {id: 'FC1'})
CREATE (e)-[:EXPLAINS {mechanism: 'FC1 PARTIALLY_CONFIRMED at firm level but cannot connect to welfare system. Welfare occupation gap prevents closing the causal chain.', evidence_strength: 'High'}]->(f);

// --- Evidence gaps connect to the Iceland AI Action Plan's evidentiary weakness ---
MATCH (e:EvidenceGap {id: 'GAP_NO_AI_ADOPTION_SURVEY'}), (p:PolicyChange {id: 'POLICY_AI_ACTION_PLAN'})
CREATE (e)-[:EXPLAINS {mechanism: 'Action Plan claims (55% jobs affected, 30% automatable) are borrowed international figures applied without local validation. Gap makes Action Plan empirically unmoored.', evidence_strength: 'High'}]->(p);

MATCH (e:EvidenceGap {id: 'GAP_MEASUREMENT_GAP_17PCT'}), (m:MacroMetric {id: 'MACRO_UNEMP_JAN_2026'})
CREATE (e)-[:EXPLAINS {mechanism: 'VMST registered rate (4.9%) systematically undercounts by ~17%. True unemployment closer to LFS rate. Policy interventions calibrated against wrong baseline.', evidence_strength: 'High'}]->(m);

// --- UNAK exclusion from AIFA-ICE is an evidence gap AND institutional capacity finding ---
MATCH (e:EvidenceGap {id: 'GAP_UNAK_AIFA_EXCLUSION'}), (i:InstitutionalCapacity {id: 'INST_UNAK'})
CREATE (e)-[:AFFECTS_COHORT {mechanism: 'UNAK is structurally excluded from national AI infrastructure despite having regional mandate and AI policy.'}]->(i);

MATCH (e:EvidenceGap {id: 'GAP_UNAK_AIFA_EXCLUSION'}), (i:InstitutionalCapacity {id: 'INST_AIFA_ICE'})
CREATE (e)-[:EXPLAINS {mechanism: 'AIFA-ICE concentrates national AI capacity — UNAK exclusion is consequence of AIFA-ICE founding partner structure.', evidence_strength: 'High'}]->(i);

// --- Nordic comparison nodes contradict Iceland discourse vacuum ---
MATCH (c:InternationalComparison {id: 'COMP_NORDIC_GOVERNANCE'}), (u:UnionGrievance {id: 'UNION_DISCOURSE_VACUUM'})
CREATE (c)-[:EXPLAINS {mechanism: 'Nordic 5-country comparison confirms Iceland is outlier — all four peer nations have union AI frameworks. Discourse vacuum is not a Nordic norm.', evidence_strength: 'High'}]->(u);

// --- HLE calibration finding supports UNAK governance role argument ---
MATCH (b:BenchmarkEvidence {id: 'BENCH_HLE'}), (i:InstitutionalCapacity {id: 'INST_UNAK'})
CREATE (b)-[:CORRELATES_WITH {r_value: null, method: 'HLE calibration finding (AI systems do not know their limitations) directly supports argument that UNAK governance expertise has value in AI governance layer — human oversight is non-optional.'}]->(i);

// --- BIS productivity finding qualifies Iceland displacement narrative ---
MATCH (a:AcademicEvidence {id: 'ACAD_ALDASORO_2026'}), (m:MacroMetric {id: 'MACRO_ICT_EMPLOYMENT'})
CREATE (a)-[:CONTRADICTS {basis: 'BIS WP 1325 finds skill-biased reallocation (not mass displacement) in 12,000 EU firms. Iceland ICT employment decline may reflect reallocation dynamics rather than net job destruction.'}]->(m);

// --- IMF paper confirms ICT/knowledge cohort exposure ---
MATCH (a:AcademicEvidence {id: 'ACAD_IMF_WP067_2025'}), (m:MacroMetric {id: 'MACRO_KNOWLEDGE_OCC_LOSS'})
CREATE (a)-[:CORRELATES_WITH {r_value: null, method: 'IMF WP067 finds high-skill occupations 3-5× more exposed to AI. Iceland knowledge occupation contraction (-9,300 jobs) is consistent with high-skill-biased AI exposure in an advanced economy.'}]->(m);

MATCH (a:AcademicEvidence {id: 'ACAD_IMF_WP067_2025'}), (c:DemographicCohort {id: 'COHORT_ICT'})
CREATE (a)-[:AFFECTS_COHORT {mechanism: 'ICT occupations in top exposure tier per IMF modelling. 3-5× higher exposure than service/manual workers.'}]->(c);

// --- Anthropic Index finding (augmentation vs automation gap) qualifies ICT revenue/employment divergence ---
MATCH (a:AcademicEvidence {id: 'ACAD_ANTHROPIC_INDEX_2025'}), (m:MacroMetric {id: 'MACRO_ICT_TURNOVER'})
CREATE (a)-[:CORRELATES_WITH {r_value: null, method: 'Anthropic Index shows 94% exposure but only 33% actual automation tasks. ICT revenue growth (+72% 2020-2025) consistent with productivity augmentation — fewer workers producing more revenue.'}]->(m);

// --- UNAK AUTO-MARE connects to Nordic AIR ---
MATCH (r:ResearchProject {id: 'PROJ_AUTO_MARE'}), (i:InstitutionalCapacity {id: 'INST_UNAK'})
CREATE (r)-[:CORRELATES_WITH {r_value: null, method: 'AUTO-MARE is UNAK\'s primary AI research role — demonstrates applied AI competence even without theoretical AI department.'}]->(i);

MATCH (r:ResearchProject {id: 'PROJ_NORDFORSK_AI'}), (i:InstitutionalCapacity {id: 'INST_NORDIC_AIR'})
CREATE (r)-[:CORRELATES_WITH {r_value: null, method: 'NordForsk AI Initiative and Nordic AIR are complementary Nordic coordination mechanisms — funding vs research network.'}]->(i);

// --- SWE-bench directly relevant to ICT employment decline ---
MATCH (b:BenchmarkEvidence {id: 'BENCH_SWE_BENCH'}), (m:MacroMetric {id: 'MACRO_ICT_EMPLOYMENT'})
CREATE (b)-[:CORRELATES_WITH {r_value: null, method: 'SWE-bench Verified: >60pp improvement in software engineering task completion in <2 years. ICT employment decline -11.4% in same period. Temporal correlation — causal link unproven but mechanistically plausible.'}]->(m);

MATCH (b:BenchmarkEvidence {id: 'BENCH_SWE_BENCH'}), (f:FalsificationTest {id: 'FC3'})
CREATE (b)-[:TESTED_BY {notes: 'FC3 (Iceland adoption at/above EU) cannot be tested, but SWE-bench trajectory provides indirect mechanism for why adoption may be high in technical sectors.'}]->(f);

// --- EU AI Act Phase 3 connects to union discourse vacuum ---
MATCH (g:GovernanceFramework {id: 'GOV_EU_AI_ACT_PHASE3'}), (u:UnionGrievance {id: 'UNION_DISCOURSE_VACUUM'})
CREATE (g)-[:CORRELATES_WITH {r_value: null, method: 'EU AI Act Phase 3 (Aug 2026) mandates human oversight, transparency, and worker rights for employment AI. Iceland\'s union discourse vacuum means no worker-side input into compliance frameworks.'}]->(u);

// --- Nordic governance comparison against Iceland AI Action Plan ---
MATCH (c:InternationalComparison {id: 'COMP_NORDIC_GOVERNANCE'}), (p:PolicyChange {id: 'POLICY_AI_ACTION_PLAN'})
CREATE (c)-[:CONTRADICTS {basis: 'Iceland AI Action Plan has no tripartite consultation mechanism, no worker protection provisions, no union engagement framework. All four peer Nordic nations have these. The Action Plan\'s governance model is not Nordic — it is a unilateral government document.'}]->(p);

// --- EWCS comparison against Iceland data gaps ---
MATCH (c:InternationalComparison {id: 'COMP_AI_WORKERS'}), (e:EvidenceGap {id: 'GAP_EWCS_EXCLUSION'})
CREATE (c)-[:EXPLAINS {mechanism: 'COMP_AI_WORKERS shows the international scale on which Iceland has no position — EU average 12%, Norway 15%. Iceland\'s absence from EWCS creates the measurement void that makes this comparison impossible.', evidence_strength: 'High'}]->(e);

// --- EU AI Act EEA status relevant to Iceland governance gap ---
MATCH (c:InternationalComparison {id: 'COMP_EU_AI_ACT_EEA'}), (g:GovernanceFramework {id: 'GOV_ICELAND_AI_ACTION_PLAN'})
CREATE (c)-[:EXPLAINS {mechanism: 'Iceland AI Action Plan was drafted without EU AI Act binding timeline. EEA incorporation creates compliance obligations the Action Plan does not address.', evidence_strength: 'High'}]->(g);

// --- HLE benchmark evidence tests falsification ---
MATCH (b:BenchmarkEvidence {id: 'BENCH_HLE'}), (f:FalsificationTest {id: 'FD2'})
CREATE (b)-[:TESTED_BY {notes: 'FD2 (cognitive pressure unsupported) — HLE calibration finding suggests AI systems operating in high-stakes knowledge work without human oversight could increase cognitive pressure through error propagation. Indirect support for FD2 concern.'}]->(f);


// ============================================================================
// NEW FALSIFICATION TESTS — UNAK Extension
// ============================================================================

CREATE (:FalsificationTest {id: 'FE1', name: 'Iceland governance equivalent to Nordic peers', workstream: 'E', result: 'FALSIFIED', evidence: 'Nordic 5-country comparison: all 4 peer nations have union AI frameworks. Iceland has none. EU AI Act EEA incorporation pending with no timeline. Action Plan built on borrowed statistics with no measurement framework.', implication: 'Iceland governance is structurally below Nordic peers on every comparable dimension'});

CREATE (:FalsificationTest {id: 'FE2', name: 'AI benchmark gains are gradual/predictable', workstream: 'E', result: 'FALSIFIED', evidence: 'ARC-AGI +82.5pp, SWE-bench +60pp, GPQA +39pp — all in <24 months. Discontinuous capability jumps, not smooth curves. HLE calibration error confirms models do not self-limit.', implication: 'Governance frameworks calibrated to 2023 capabilities are already obsolete'});

CREATE (:FalsificationTest {id: 'FE3', name: 'UNAK has no differentiated AI governance role', workstream: 'E', result: 'PARTIALLY_FALSIFIED', evidence: 'UNAK: (1) First Icelandic university with AI governance policy (Oct 30, 2025). (2) Only non-Reykjavik institution with NordForsk AI research. (3) AUTO-MARE demonstrates applied AI competence. (4) EU AI Act compliance expertise is genuinely differentiated from HI/RU technical capacity.', implication: 'A governance/compliance value proposition is available — but UNAK has not yet operationalized it'});

// Falsification test relationships
MATCH (f:FalsificationTest {id: 'FE1'}), (c:InternationalComparison {id: 'COMP_NORDIC_GOVERNANCE'}) CREATE (c)-[:TESTED_BY]->(f);
MATCH (f:FalsificationTest {id: 'FE2'}), (b:BenchmarkEvidence {id: 'BENCH_HLE'}) CREATE (b)-[:TESTED_BY]->(f);
MATCH (f:FalsificationTest {id: 'FE2'}), (b:BenchmarkEvidence {id: 'BENCH_SWE_BENCH'}) CREATE (b)-[:TESTED_BY]->(f);
MATCH (f:FalsificationTest {id: 'FE3'}), (i:InstitutionalCapacity {id: 'INST_UNAK'}) CREATE (i)-[:TESTED_BY]->(f);


// ============================================================================
// SUMMARY STATISTICS QUERY — Full Graph
// ============================================================================

// MATCH (n) RETURN labels(n)[0] AS type, count(n) AS count ORDER BY count DESC;
// Expected after UNAK extension:
//   MacroMetric:           ~15
//   WelfareStatistic:      ~7
//   CorporateAction:       ~3
//   PolicyChange:          ~4
//   UnionGrievance:        ~2
//   AcademicEvidence:      ~10
//   FalsificationTest:     ~13
//   DemographicCohort:     ~7
//   DataSource:            ~21
//   GovernanceFramework:   ~8
//   InstitutionalCapacity: ~5
//   BenchmarkEvidence:     ~4
//   ResearchProject:       ~3
//   EvidenceGap:           ~6
//   InternationalComparison: ~4
//   TOTAL nodes:           ~112
//   TOTAL relationships:   ~65
