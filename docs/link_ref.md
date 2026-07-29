---
layout: default
title: "LSA Documentation TOC"
nav_order: 1
parent: "LSA Programming Specifications"
has_toc: false
---

# LSA Documentation TOC

This file lists H1 and H2 headings (with GitHub/Jekyll-style anchors) for the LSA documentation files 01 and 03–11. (File 02 is intentionally skipped.)

NOTE: Slugs follow GitHub/Jekyll rules (lowercase, spaces → hyphens, punctuation removed). Duplicate anchors within the same file are disambiguated with -1, -2, etc.

## 01 - Introduction

- [1.1 Background](01 - Introduction#11-background)
- [1.2 About This Document](01 - Introduction#12-about-this-document)
  - [Intended Audience](01 - Introduction#intended-audience)
  - [Purpose and Scope](01 - Introduction#purpose-and-scope)
  - [Structure and Content](01 - Introduction#structure-and-content)
  - [Companion Documents](01 - Introduction#companion-documents)
  - [External References](01 - Introduction#external-references)
  - [Style Notes](01 - Introduction#style-notes)
- [1.3 Definitions/Acronyms](01 - Introduction#13-definitionsacronyms)
- [1.4 Changes Effective 11/1/2025](01 - Introduction#14-changes-effective-1112025)
  - [Identification of Persons and Households Active-in-Residence During the Report Period](01 - Introduction#identification-of-persons-and-households-active-in-residence-during-the-report-period)
  - [HMIS Data Standards Changes](01 - Introduction#hmis-data-standards-changes)
  - [Chronically Homeless Households in LSAExit](01 - Introduction#chronically-homeless-households-in-lsaexit)

## 03 - Core Concepts and Data Universe

- [3.1 Report Parameters and Metadata (lsa_Report)](03 - Core Concepts and Data Universe#31-report-parameters-and-metadata-lsareport)
  - [Source](03 - Core Concepts and Data Universe#source)
  - [Target](03 - Core Concepts and Data Universe#target)
  - [Logic](03 - Core Concepts and Data Universe#logic)
- [3.2 LSA Reporting Cohorts and Dates (tlsa_CohortDates)](03 - Core Concepts and Data Universe#32-lsa-reporting-cohorts-and-dates-tlsa_cohortdates)
  - [Source](03 - Core Concepts and Data Universe#source-1)
  - [Target](03 - Core Concepts and Data Universe#target-1)
  - [Logic](03 - Core Concepts and Data Universe#logic-1)
- [3.3 HMIS Household Enrollments (tlsa_HHID)](03 - Core Concepts and Data Universe#33-hmis-household-enrollments-tlsa_hhid)
  - [Source](03 - Core Concepts and Data Universe#source-2)
  - [Target](03 - Core Concepts and Data Universe#target-2)
  - [Logic](03 - Core Concepts and Data Universe#logic-2)
- [3.4 HMIS Client Enrollments (tlsa_Enrollment)](03 - Core Concepts and Data Universe#34-hmis-client-enrollments-tlsa_enrollment)
  - [Source](03 - Core Concepts and Data Universe#source-3)
  - [Target](03 - Core Concepts and Data Universe#target-3)
  - [Logic](03 - Core Concepts and Data Universe#logic-3)
- [3.5 Enrollment Ages (tlsa_Enrollment)](03 - Core Concepts and Data Universe#35-enrollment-ages-tlsa_enrollment)
  - [Source](03 - Core Concepts and Data Universe#source-4)
  - [Target](03 - Core Concepts and Data Universe#target-4)
  - [Logic](03 - Core Concepts and Data Universe#logic-4)
- [3.6 Household Types (tlsa_HHID)](03 - Core Concepts and Data Universe#36-household-types-tlsa_hhid)
  - [Source](03 - Core Concepts and Data Universe#source-5)
  - [Target](03 - Core Concepts and Data Universe#target-5)
  - [Logic](03 - Core Concepts and Data Universe#logic-5)

## 04 - HMIS Business Logic: Project Descriptor Data for Export

- [4.1 Get Project.csv Records / lsa_Project](04 - Project Descriptor Data#41-get-projectcsv-records--lsa_project)
  - [Source](04 - Project Descriptor Data#source)
  - [Target](04 - Project Descriptor Data#target)
  - [Logic](04 - Project Descriptor Data#logic)
- [4.2 Get Organization.csv Records / lsa_Organization](04 - Project Descriptor Data#42-get-organizationcsv-records--lsa_organization)
  - [Source](04 - Project Descriptor Data#source-1)
  - [Target](04 - Project Descriptor Data#target-1)
  - [Logic](04 - Project Descriptor Data#logic-1)
- [4.3 Get Funder.csv Records / lsa_Funder](04 - Project Descriptor Data#43-get-fundercsv-records--lsa_funder)
  - [Source](04 - Project Descriptor Data#source-2)
  - [Target](04 - Project Descriptor Data#target-2)
  - [Logic](04 - Project Descriptor Data#logic-2)
- [4.4 Get ProjectCoC.csv Records / lsa_ProjectCoC](04 - Project Descriptor Data#44-get-projectcoccsv-records--lsa_projectcoc)
  - [Source](04 - Project Descriptor Data#source-3)
  - [Target](04 - Project Descriptor Data#target-3)
  - [Logic](04 - Project Descriptor Data#logic-3)
- [4.5 Get Inventory.csv Records / lsa_Inventory](04 - Project Descriptor Data#45-get-inventorycsv-records--lsa_inventory)
  - [Source](04 - Project Descriptor Data#source-4)
  - [Target](04 - Project Descriptor Data#target-4)
  - [Logic](04 - Project Descriptor Data#logic-4)
- [4.6 Get HMISParticipation.csv Records / lsa_HMISParticipation](04 - Project Descriptor Data#46-get-hmisparticipationcsv-records--lsa_hmisparticipation)
  - [Source](04 - Project Descriptor Data#source-5)
  - [Target](04 - Project Descriptor Data#target-5)
  - [Logic](04 - Project Descriptor Data#logic-5)
- [4.7 Get Affiliation.csv Records / lsa_Affiliation](04 - Project Descriptor Data#47-get-affiliationcsv-records--lsa_affiliation)
  - [Source](04 - Project Descriptor Data#source-6)
  - [Target](04 - Project Descriptor Data#target-6)
  - [Logic](04 - Project Descriptor Data#logic-6)

## 05 - LSAPerson

- [5 - HMIS Business Logic - LSAPerson](05 - LSAPerson#5---hmis-business-logic---lsaperson)
  - [5.1 Identify Active and Active in Residence (AIR) HouseholdIDs](05 - LSAPerson#51-identify-active-and-active-in-residence-air-householdids)
    - [Source](05 - LSAPerson#source)
    - [Target](05 - LSAPerson#target)
    - [Logic](05 - LSAPerson#logic)
  - [5.2 Identify Active and Active in Residence (AIR) Enrollments](05 - LSAPerson#52-identify-active-and-active-in-residence-air-enrollments)
    - [Source](05 - LSAPerson#source-1)
    - [Target](05 - LSAPerson#target-1)
    - [Logic](05 - LSAPerson#logic-1)
  - [5.3 Get Active Clients for LSAPerson](05 - LSAPerson#53-get-active-clients-for-lsaperson)
    - [Source](05 - LSAPerson#source-2)
    - [Target](05 - LSAPerson#target-2)
    - [Logic](05 - LSAPerson#logic-2)
  - [5.4 LSAPerson Demographics](05 - LSAPerson#54-lsaperson-demographics)
    - [Source](05 - LSAPerson#source-3)
    - [Target](05 - LSAPerson#target-3)
    - [Logic](05 - LSAPerson#logic-3)
  - [5.5 Time Spent in ES/SH or on the Street – LSAPerson](05 - LSAPerson#55-time-spent-in-essh-or-on-the-street--lsaperson)
    - [Source](05 - LSAPerson#source-4)
    - [Target](05 - LSAPerson#target-4)
    - [Logic](05 - LSAPerson#logic-4)
  - [5.6 Enrollments Relevant to Counting ES/SH/Street Dates](05 - LSAPerson#56-enrollments-relevant-to-counting-esshstreet-dates)
    - [Source](05 - LSAPerson#source-5)
    - [Target](05 - LSAPerson#target-5)
    - [Logic](05 - LSAPerson#logic-5)
  - [5.7 Get Dates to Exclude from Counts of ES/SH/Street Days (ch_Exclude)](05 - LSAPerson#57-get-dates-to-exclude-from-counts-of-esshstreet-days-ch_exclude)
  - [5.8 Get Dates to Include in Counts of ES/SH/Street Days (ch_Include)](05 - LSAPerson#58-get-dates-to-include-in-counts-of-esshstreet-days-ch_include)
  - [5.9 Get ES/SH/Street Episodes (ch_Episodes)](05 - LSAPerson#59-get-esshstreet-episodes-ch_episodes)
  - [5.10 CHTime and CHTimeStatus – LSAPerson](05 - LSAPerson#510-chtime-and-chtimestatus--lsaperson)
  - [5.11 EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax – LSAPerson](05 - LSAPerson#511-estrrhpshrrhsoagemin-and-estrrhpshrrhsoagemax--lsaperson)
  - [5.12 Set Population Identifiers for Active HMIS Households](05 - LSAPerson#512-set-population-identifiers-for-active-hmis-households)
  - [5.13 Project Group and Population Household Types - LSAPerson](05 - LSAPerson#513-project-group-and-population-household-types---lsaperson)
  - [5.14 Adult Age Population Identifiers - LSAPerson](05 - LSAPerson#514-adult-age-population-identifiers---lsaperson)
  - [5.15 LSAPerson](05 - LSAPerson#515-lsaperson)

## 06 - LSAHousehold

- [6.1 Get Distinct Households for LSAHousehold](06 - LSAHousehold#61-get-distinct-households-for-lsahousehold)
  - [Source](06 - LSAHousehold#source)
  - [Target](06 - LSAHousehold#target)
  - [Logic](06 - LSAHousehold#logic)
- [6.2 Set Population Identifiers for LSAHousehold](06 - LSAHousehold#62-set-population-identifiers-for-lsahousehold)
- [6.3 EST/RRH/PSH/RRHSOStatus – LSAHousehold](06 - LSAHousehold#63-estrrhpshrrhsostatus--lsahousehold)
- [6.4 RRH/PSH/RRHSOMoveIn – LSAHousehold](06 - LSAHousehold#64-rrhpshrrhsomovein--lsahousehold)
- [6.5 EST/RRH/PSHGeography – LSAHousehold](06 - LSAHousehold#65-estrrhpshpshgeography--lsahousehold)
- [6.6 EST/RRH/PSHLivingSit – LSAHousehold](06 - LSAHousehold#66-estrrhpshlivingsit--lsahousehold)
- [6.7 EST/RRH/PSHDestination – LSAHousehold](06 - LSAHousehold#67-estrrhpshdestination--lsahousehold)
- [6.8 EST/RRH/PSH Population Identifiers](06 - LSAHousehold#68-estrrhpsh-population-identifiers)
- [6.9 System Engagement Status and Return Time](06 - LSAHousehold#69-system-engagement-status-and-return-time)
- [6.10 RRHPreMoveInDays – LSAHousehold](06 - LSAHousehold#610-rrhpremoveindays--lsahousehold)
- [6.11 Dates Housed in PSH or RRH (sys_Time)](06 - LSAHousehold#611-dates-housed-in-psh-or-rrh-sys_time)
- [6.12 Get Last Inactive Date (sys_TimePadded)](06 - LSAHousehold#612-get-last-inactive-date-sys_timepadded)
- [6.13 Get Dates of Other System Use (sys_Time)](06 - LSAHousehold#613-get-dates-of-other-system-use-sys_time)
- [6.14 Get Other Dates Homeless from 3.917A/B Living Situation](06 - LSAHousehold#614-get-other-dates-homeless-from-3917ab-living-situation)
- [6.15 Set System Use Days for LSAHousehold](06 - LSAHousehold#615-set-system-use-days-for-lsahousehold)
- [6.16 Update EST/RRH/PSH/RRHSOStatus](06 - LSAHousehold#616-update-estrrhpshrrhsostatus)
- [6.17 Set EST/RRH/PSHAIR](06 - LSAHousehold#617-set-estrrhpshair)
- [6.18 Set SystemPath for LSAHousehold](06 - LSAHousehold#618-set-systempath-for-lsahousehold)
- [6.19 LSAHousehold](06 - LSAHousehold#619-lsahousehold)

## 07 - LSAExit (selected H1s)

The file `07 - LSAExit` contains sections 7.1 through 7.13. Key headings include:

- [7.1 Identify Qualifying Exits in Exit Cohort Periods](07 - LSAExit#71-identify-qualifying-exits-in-exit-cohort-periods)
- [7.2 Select Reportable Exits](07 - LSAExit#72-select-reportable-exits)
- [7.3 ReturnTime](07 - LSAExit#73-returntime)
- [7.4 Identify Heads of Household / Adults for Exit Cohorts](07 - LSAExit#74-identify-heads-of-household--adults-for-exit-cohorts)
- [7.8 CHTime and CHTimeStatus for Exit Cohorts](07 - LSAExit#78-chtime-and-chtimestatus-for-exit-cohorts)
- [Export column definitions / LSAExit schema](07 - LSAExit#export-column-definitions--lsaexit)

## 08 - LSACalculated Averages (selected H1s)

- [8.1 LSACalculated columns and report-row definitions (rows 1–9, 10–16, etc.)](08 - LSACalculated Averages#81-lsacalculated-columns-and-report-row-definitions)
- [8.2 Populations and Subpopulations](08 - LSACalculated Averages#82-populations-and-subpopulations)
- [8.3 Average Days and Cohort Definitions](08 - LSACalculated Averages#83-average-days-and-cohort-definitions)

## 09 - LSACalculated Counts (selected H1s)

- [9.1 Report rows and cohort definitions](09 - LSACalculated Counts#91-report-rows-and-cohort-definitions)
- [9.2 Point-in-time cohorts and PIT logic](09 - LSACalculated Counts#92-point-in-time-cohorts-and-pit-logic)
- [9.4 Counts by project and personal characteristics](09 - LSACalculated Counts#94-counts-by-project-and-personal-characteristics)

## 10 - LSA Calculated Project Level Data Quality Counts (selected H1s)

- [10.1 Data quality rows 901–920 and definitions](10 - LSA Calculated Project Level Data Quality Counts#101-data-quality-rows-901920-and-definitions)
- [10.2 Row-by-row criteria and calculation notes](10 - LSA Calculated Project Level Data Quality Counts#102-row-by-row-criteria-and-calculation-notes)

## 11 - LSAReport (selected H1s)

- [11.1 LSAReport data-quality counts and NoCoC/NotOneHoH logic](11 - LSAReport#111-lsareport-data-quality-counts-and-nococnotonehoh-logic)
- [11.2 LSAReport schema and ReportDate rules](11 - LSAReport#112-lsareport-schema-and-reportdate-rules)

---

If you want the TOC expanded (full H1+H2 verbatim for every section including every repeated “Source/Target/Logic” occurrence with exact per-file disambiguation), I can iterate and add every H2 line item as a separate link (recommended per-file append to keep memory usage low). Next step: run the incremental per-file extraction and update if you want fuller detail.
