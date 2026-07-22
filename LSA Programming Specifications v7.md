The Longitudinal System Analysis

HMIS Programming Specifications v7

Final ● Effective 11/1/2025

**Table of Contents**

[1\. Introduction 2](#_Toc235605606)

[1.1. Background: Annual Homeless Assessment Report and the Longitudinal System Analysis 2](#_Toc235605607)

[1.2. About This Document 2](#_Toc235605608)

[1.3. Definitions/Acronyms 5](#_Toc235605609)

[1.4. Changes Effective 11/1/2025 7](#_Toc235605610)

[2\. HDX 2.0 Upload 8](#_Toc235605611)

[2.1. Project.csv 8](#_Toc235605612)

[2.2. Organization.csv 8](#_Toc235605613)

[2.3. Funder.csv 8](#_Toc235605614)

[2.4. ProjectCoC.csv 8](#_Toc235605615)

[2.5. Inventory.csv 9](#_Toc235605616)

[2.6. HMISParticipation.csv 9](#_Toc235605617)

[2.7. Affiliation.csv 9](#_Toc235605618)

[2.8. LSAReport.csv 9](#_Toc235605619)

[2.9. LSAPerson.csv 9](#_Toc235605620)

[2.10. LSAHousehold.csv 10](#_Toc235605621)

[2.11. LSAExit.csv 10](#_Toc235605622)

[2.12. LSACalculated.csv 10](#_Toc235605623)

[3\. HMIS Business Logic: Core Concepts 12](#_Toc235605624)

[3.1. Report Parameters and Metadata (lsa\_Report) 14](#_Toc235605625)

[3.2. LSA Reporting Cohorts and Dates (tlsa\_CohortDates) 16](#_Toc235605626)

[3.3. HMIS Household Enrollments (tlsa\_HHID) 17](#_Toc235605627)

[3.4. HMIS Client Enrollments (tlsa\_Enrollment) 25](#_Toc235605628)

[3.5. Enrollment Ages (tlsa\_Enrollment) 29](#_Toc235605629)

[3.6. Household Types (tlsa\_HHID) 31](#_Toc235605630)

[4\. HMIS Business Logic: Project Descriptor Data for Export 34](#_Toc235605631)

[4.1. Get Project.csv Records / lsa\_Project 34](#_Toc235605632)

[4.2. Get Organization.csv Records / lsa\_Organization 35](#_Toc235605633)

[4.3. Get Funder.csv Records / lsa\_Funder 36](#_Toc235605634)

[4.4. Get ProjectCoC.csv Records / lsa\_ProjectCoC 37](#_Toc235605635)

[4.5. Get Inventory.csv Records / lsa\_Inventory 39](#_Toc235605636)

[4.6. Get HMISParticipation.csv Records / lsa\_HMISParticipation 40](#_Toc235605637)

[4.7. Get Affiliation.csv Records / lsa\_Affiliation 41](#_Toc235605638)

[5\. HMIS Business Logic: LSAPerson 43](#_Toc235605639)

[5.1. Identify Active and Active in Residence (AIR) HouseholdIDs 44](#_Toc235605640)

[5.2. Identify Active and Active in Residence (AIR) Enrollments 45](#_Toc235605641)

[5.3. Get Active Clients for LSAPerson 46](#_Toc235605642)

[5.4. LSAPerson Demographics 51](#_Toc235605643)

[5.5. Time Spent in ES/SH or on the Street – LSAPerson 54](#_Toc235605644)

[5.6. Enrollments Relevant to Counting ES/SH/Street Dates 56](#_Toc235605645)

[5.7. Get Dates to Exclude from Counts of ES/SH/Street Days (ch\_Exclude) 57](#_Toc235605646)

[5.8. Get Dates to Include in Counts of ES/SH/Street Days (ch\_Include) 58](#_Toc235605647)

[5.9. Get ES/SH/Street Episodes (ch\_Episodes) 59](#_Toc235605648)

[5.10. CHTime and CHTimeStatus – LSAPerson 60](#_Toc235605649)

[5.11. EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax – LSAPerson 63](#_Toc235605650)

[5.12. Set Population Identifiers for Active HMIS Households 64](#_Toc235605651)

[5.13. Project Group and Population Household Types - LSAPerson 67](#_Toc235605652)

[5.14. Adult Age Population Identifiers - LSAPerson 69](#_Toc235605653)

[5.15. LSAPerson 70](#_Toc235605654)

[6\. HMIS Business Logic: LSAHousehold 71](#_Toc235605655)

[6.1. Get Distinct Households for LSAHousehold 71](#_Toc235605656)

[6.2. Set Population Identifiers for LSAHousehold 76](#_Toc235605657)

[6.3. EST/RRH/PSH/RRHSOStatus – LSAHousehold 79](#_Toc235605658)

[6.4. RRH/PSH/RRHSOMoveIn – LSAHousehold 80](#_Toc235605659)

[6.5. EST/RRH/PSHGeography – LSAHousehold 81](#_Toc235605660)

[6.6. EST/RRH/PSHLivingSit – LSAHousehold 82](#_Toc235605661)

[6.7. EST/RRH/PSHDestination – LSAHousehold 84](#_Toc235605662)

[6.8. EST/RRH/PSH Population Identifiers 85](#_Toc235605663)

[6.9. System Engagement Status and Return Time 87](#_Toc235605664)

[6.10. RRHPreMoveInDays – LSAHousehold 89](#_Toc235605665)

[6.11. Dates Housed in PSH or RRH (sys\_Time) 90](#_Toc235605666)

[6.12. Get Last Inactive Date 92](#_Toc235605667)

[6.13. Get Dates of Other System Use (sys\_Time) 93](#_Toc235605668)

[6.14. Get Other Dates Homeless from 3.917A/B Living Situation 95](#_Toc235605669)

[6.15. Set System Use Days for LSAHousehold 96](#_Toc235605670)

[6.16. Update EST/RRH/PSH/RRHSOStatus 98](#_Toc235605671)

[6.17. Set EST/RRH/PSHAIR 99](#_Toc235605672)

[6.18. Set SystemPath for LSAHousehold 100](#_Toc235605673)

[6.19. LSAHousehold 101](#_Toc235605674)

[7\. HMIS Business Logic: LSAExit 104](#_Toc235605675)

[7.1. Identify Qualifying Exits in Exit Cohort Periods 104](#_Toc235605676)

[7.2. Select Reportable Exits 105](#_Toc235605677)

[7.3. Set ReturnTime for Exit Cohort Households 107](#_Toc235605678)

[7.4. Identify HoH and Adult Members of Exit Cohorts 109](#_Toc235605679)

[7.5. Get Dates to Exclude from Counts of ES/SH/Street Days (ch\_Exclude\_exit) 111](#_Toc235605680)

[7.6. Get Dates to Include in Counts of ES/SH/Street Days (ch\_Include\_exit) 112](#_Toc235605681)

[7.7. Get ES/SH/Street Episodes (ch\_Episodes\_exit) 114](#_Toc235605682)

[7.8. CHTime and CHTimeStatus for Exit Cohorts 115](#_Toc235605683)

[7.9. Set Population Identifiers for Exit Cohort Households 118](#_Toc235605684)

[7.10. Set System Engagement Status for Exit Cohort Households 121](#_Toc235605685)

[7.11. Last Inactive Date for Exit Cohorts 122](#_Toc235605686)

[7.12. Set SystemPath for LSAExit 124](#_Toc235605687)

[7.13. LSAExit 125](#_Toc235605688)

[8\. HMIS Business Logic: LSACalculated Averages 127](#_Toc235605689)

[8.1. LSACalculated Columns 127](#_Toc235605690)

[8.2. Report Rows for LSACalculated Averages 127](#_Toc235605691)

[8.3. Populations for Average Days from LSAHousehold and LSAExit 130](#_Toc235605692)

[8.4. Get Average Days for Length of Time Homeless 133](#_Toc235605693)

[8.5. Get Average Days for Length of Time Homeless by System Path 134](#_Toc235605694)

[8.6. Get Average Days for Cumulative Length of Time Housed in PSH 135](#_Toc235605695)

[8.7. Get Average Days for Length of Time in RRH Projects 136](#_Toc235605696)

[8.8. Get Average Days to Return/Re-engage by Last Project Type 137](#_Toc235605697)

[8.9. Get Average Days to Return/Re-engage by Population 139](#_Toc235605698)

[8.10. Get Average Days to Return/Re-engage by System Path 140](#_Toc235605699)

[8.11. Get Average Days to Return/Re-engage by Exit Destination 141](#_Toc235605700)

[9\. HMIS Business Logic: LSACalculated Counts 144](#_Toc235605701)

[9.1. Report Rows for LSACalculated Counts 144](#_Toc235605702)

[9.2. Identify Active and Point in Time Cohorts for LSACalculated Counts 144](#_Toc235605703)

[9.3. Counts of People and Households by Project and Household Characteristics 145](#_Toc235605704)

[9.4. Get Counts of People by Project and Personal Characteristics 147](#_Toc235605705)

[9.5. Get Counts of Bednights 151](#_Toc235605706)

[9.6. Get OPH Point-in-Time Counts for HIC 153](#_Toc235605707)

[10\. HMIS Business Logic: LSACalculated Project-Level Data Quality Counts 155](#_Toc235605708)

[10.1. Static Column Values 155](#_Toc235605709)

[10.2. DQ - Enrollments Active After Project Operating End Date by Project 155](#_Toc235605710)

[10.3. DQ - Night-by-Night Enrollments with Exit Date Discrepancies by Project 155](#_Toc235605711)

[10.4. DQ - Counts of Households with no EnrollmentCoC by Project 156](#_Toc235605712)

[10.5. DQ – Enrollments in Non-Participating Projects 156](#_Toc235605713)

[10.6. DQ – Enrollments Active in LSA Projects During the Report Period without Exactly One HoH 156](#_Toc235605714)

[10.7. DQ – Enrollments Active in LSA Projects without a Valid Relationship to HoH 157](#_Toc235605715)

[10.8. DQ – Household Entry 157](#_Toc235605716)

[10.9. DQ – Client Entry 157](#_Toc235605717)

[10.10. DQ – Adult/HoH Entry 157](#_Toc235605718)

[10.11. DQ – Client Exit 157](#_Toc235605719)

[10.12. DQ – Disabling Condition 157](#_Toc235605720)

[10.13. DQ – Living Situation 157](#_Toc235605721)

[10.14. DQ – Length of Stay 158](#_Toc235605722)

[10.15. DQ – Date ES/SH/Street Homelessness Started 158](#_Toc235605723)

[10.16. DQ – Times ES/SH/Street Homeless Last 3 Years 158](#_Toc235605724)

[10.17. DQ – Months ES/SH/Street Homeless Last 3 Years 158](#_Toc235605725)

[10.18. DQ – Destination 158](#_Toc235605726)

[10.19. DQ – Date of Birth 159](#_Toc235605727)

[10.20. LSACalculated 159](#_Toc235605728)

[11\. HMIS Business Logic: LSAReport Data Quality and ReportDate 160](#_Toc235605729)

[11.1. Data Quality: HMIS Household Enrollments Not Associated with a CoC 160](#_Toc235605730)

[11.2. Data Quality: Households Excluded from the LSA Due to HoH Errors 160](#_Toc235605731)

[11.3. Data Quality: Enrollments Excluded from the LSA Due to Invalid RelationshipToHoH 161](#_Toc235605732)

[11.4. Data Quality: Invalid Move-In Dates 162](#_Toc235605733)

[11.5. Data Quality: Counts of Clients / HouseholdIDs / EnrollmentIDs 163](#_Toc235605734)

[11.6. Data Quality: SSN Issues 164](#_Toc235605735)

[11.7. Data Quality: Enrollment Data 165](#_Toc235605736)

[11.8. Set LSAReport ReportDate 167](#_Toc235605737)

[11.9. LSAReport 167](#_Toc235605738)

# Introduction

## Background: Annual Homeless Assessment Report and the Longitudinal System Analysis

Every year, the U.S. Department of Housing and Urban Development (HUD) submits an Annual Homeless Assessment Report (AHAR) to the United States Congress. The AHAR is a national-level report that provides information about homeless service providers, people and households experiencing homelessness, and various characteristics of that population. It informs strategic planning for federal, state, and local initiatives designed to prevent and end homelessness.

Nationwide, HUD has tasked Continuums of Care (CoCs) with coordinating homeless services in specific geographic areas. The AHAR is based on data provided annually by these CoCs in the form of three separate aggregate data submissions. US Census and other data are used for contextual analysis.

HUD’s *Notice for Housing Inventory Count (HIC) and Point-in-Time (PIT) Data Collection for Continuum of Care (CoC) Program and the Emergency Solutions Grants (ESG) Program* defines the requirements for two components of continuum-level data used in the AHAR.

**The HIC** provides data related to the capacity and utilization of residential projects dedicated to serving people experiencing homelessness on one night in the last 10 calendar days of January. CoCs provide HIC data to HUD by generating and uploading the report defined by this document, the **Longitudinal System Analysis** (LSA), using the date of the HIC as both the start and end dates.

**The PIT is a** count of sheltered and unsheltered people who are experiencing homelessness on the same night in the last 10 calendar days of January. PIT data are manually entered.

The third component of data provided by CoCs for the AHAR is also submitted to HUD via the LSA using the start and end dates of the fiscal year for which it is being submitted. For people and households served by the CoC during the report period, the LSA includes:

-   Demographic characteristics like age, race/ethnicity, and veteran status;
-   Length of time homeless and patterns of system use;
-   Information specific to populations whose needs and/or eligibility for services may differ from the broader homeless population, such as veterans, people and households experiencing chronic homelessness, and others; and
-   Housing outcomes for those who exit the homeless services system.

The LSA also incorporates follow-up reporting on households and populations who exited the system in three discrete periods: two years prior to the report period, one year prior to the report period, and the first six months of the report period. This includes:

-   Patterns of system use prior to exit;
-   Destination types; and,
-   For those who were served again later by continuum projects, lengths of time between exit and re-engagement or returns to homelessness.

## About This Document

### Intended Audience

This document is intended for software and database developers who produce HMIS reporting and are familiar with relational database concepts, Structured Query Language (SQL), as well as other HMIS technical documentation, particularly the HMIS Data Dictionary and the HMIS CSV Format. The document may also be useful to expert-level HMIS system administrators interested in further understanding LSA logic, how HDX 2.0 uses uploaded data to produce report output, or in using the LSA files exported from HMIS to develop custom local reports.

### Purpose and Scope

The primary purpose of this document is to define LSA business logic and programming specifications for:

-   Selection of project descriptor data for export
-   Identification of client cohorts, household types, and special populations included in the LSA based on HMIS data
-   Grouping clients and households into reporting categories
-   Producing and populating LSA CSV files
-   Validating LSA CSV files

### Structure and Content

**Section 1: Introduction** (this section) outlines general concepts related to the LSA and this document.

**Section 2: HDX 2.0 Upload** describes each of the CSV files that are included in the upload. There are five CSV files specific to the LSA:

-   LSAReport.csv
-   LSAHousehold.csv
-   LSAPerson.csv
-   LSAExit.csv
-   LSACalculated.csv

The LSA upload also includes seven CSV files of Project Descriptor Data Elements (PDDEs) defined in the HMIS CSV Specifications:

-   Organization.csv
-   Project.csv
-   Funder.csv
-   ProjectCoC.csv
-   Inventory.csv
-   Affiliation.csv
-   HMISParticipation.csv

**Sections 3 through 11: HMIS Business Logic** details business logic associated with constructing LSA report output from HMIS data. There is an inherent order of operations to some aspects of the process. For example, household members’ ages must be calculated to determine household types for individual HMIS *HouseholdIDs*. Household types are required to identify distinct combinations of head of household and household type, which is the basis for counting individual households throughout the LSA.

In this document, LSA business logic is described as a series of discrete steps, each with a specific result. Results are cumulative; the ‘output’ of earlier steps serves as input for later steps. The sequence of steps is consistent with the order of operations, but in practice, many could be combined and executed simultaneously. They are separated here to clarify the business logic associated with individual columns.

To avoid repetition, simplify descriptions, and emphasize various aspects of the logic, several of these steps specify the creation of intermediate data constructs (tables) with column names that function as variables in later steps. There is no requirement to use this process or these constructs as long as output is consistent with the logic described here.

### Companion Documents

Working versions of this document and companion documents are available on GitHub in the [LSASampleCode](https://github.com/HMIS/LSASampleCode/) repository, including:

-   LSA Dictionary – a summary of the files, columns, and valid values for each column
-   Sample Code – SQL code written during the development of these specifications and made available as a reference. There is no requirement to use the code.

### External References

This document is comprehensive with respect to the business logic for the LSA upload, but additional references are indicated below. The short-hand terms used to refer to each document are in parentheses following the formal names and are hyperlinked to the documents online.

**FY 2026 HMIS Data Standards: Data Dictionary** ([](https://www.hudexchange.info/resource/3824/hmis-data-dictionary/)[Dictionary](https://files.hudexchange.info/resources/documents/HMIS-Data-Dictionary-2024.pdf)) – The Dictionary defines federal data collection requirements for HMIS applications.

**FY 2026 HMIS CSV Format Specifications** ([](https://www.hudexchange.info/resource/3824/hmis-data-dictionary/)[HMIS CSV](https://www.hudexchange.info/resource/3824/hmis-data-dictionary/)) – Descriptions of LSA business logic reference HMIS fields using the file and column names of the HMIS CSV.

### Style Notes

Throughout this document, descriptions of business logic reference diverse types of data – HMIS fields, report parameters, derived variables, intermediate data constructs, etc. – and many have similar (or identical) names.

To help clarify, many sections include simple graphics to illustrate the flow of the process. Text formatting of variable/field/column names indicates their context. The conventions used are:

**Example**

**Description**

ReportCoC

Report parameters are underlined.

hmis\_Project

HMIS data structures are depicted with the flowchart symbol for ‘database.’

hmis\_Project

HMIS data structures / raw HMIS data are referenced using HMIS CSV file names with an hmis\_ prefix. This assumes the presence/availability of all HMIS data from LookbackDate to ReportEnd.

*ProjectID*

References to HMIS fields / raw HMIS data use HMIS CSV column names and are italicized. *ProjectID* potentially refers to any project record in the HMIS where the operating end date is >= LookbackDate.

lsa\_Project

CSV files included in the LSA upload are represented by the flowchart symbol for ‘document.’

lsa\_Project

The lsa\_ prefix indicates a CSV file included in the LSA upload and that the data therein is the result of a process / business logic defined by this document.

**ProjectID**

References to variables and/or data created or transformed by the processes described in this document – e.g., columns in LSA CSV files or intermediate data constructs – are in bold. **ProjectID** refers only to project records that meet the criteria for inclusion in the uploaded Project.csv file.

tlsa\_Enrollment

Intermediate data constructs are represented by the flowchart symbol for ‘internal storage.’

Vendor Info

The flowchart symbol for ‘manual input’ appears infrequently; it is used to represent user-entered and/or hard-coded values.

## Definitions/Acronyms

The definitions here are intended to serve as a general reference and are not comprehensive with respect to business logic, which is detailed in later sections.

**AO** – Adult-only household; a household in which all household members have valid dates of birth and are age 18 or older.

**AC** – Adult and child household; a household in which at least one household member is age 18 or older and at least one household member is age 17 or younger and both have valid dates of birth; may include household members without valid dates of birth.

**AIR** – When used in column names, ‘AIR’ indicates that a person or household was active in residence/has at least one bed night in the report period.

**Between** – When used to describe business logic, *between* includes the values used in the description. For example, the report start date and the report end date are both “between ReportStart and ReportEnd.”

**CO** – Child-only household; a household in which all household members have valid dates of birth and are age 17 or younger.

**Cohort** – A group of clients who meet the criteria for inclusion in reporting in a specific period. See also “Exit Cohorts."

**Cohort period** – The period that defines a cohort (e.g. “the first six months of the report period.”)

**Continuous** (in reference to a period of homelessness or enrollment) – A period in which relevant system use for a given client is documented in HMIS and is uninterrupted by any period of seven or more contiguous days of a permanently housed situation, no documented system use, or a combination of those.

**Enrollment** – A period in which a client receives services from a given project, beginning with the *Project Start Date* recorded in HMIS and ending on the *Project Exit Date*.

**ES** – Emergency shelter projects. ES clients are considered to be experiencing homelessness while enrolled; any date between ES project entry and the day prior to exit is included in counts of days in ES/SH or on the street for purposes of determining chronic homelessness *as long as there is no conflicting data that identifies the client as enrolled in TH or housed in RRH/PSH*.

**EST** or **ES/SH/TH** – Emergency shelter, safe haven, and/or transitional housing projects; i.e., residential project types in which all clients are homeless while enrolled. Demographics for clients served in these three project types are reported in the combined ES/SH/TH project group.

**Exit Cohorts** – Groups of households who exited from continuum projects and have no record of relevant system use in HMIS during the following 14 days. There are three exit cohort periods – and thus three exit cohorts – included in the LSA.

**HIC** – Housing Inventory Count; a continuum-level report to HUD listing continuum ES, SH, TH, RRH, PSH, and OPH projects and associated bed and unit inventory dedicated to serving people experiencing homelessness on a single night; submitted to HUD annually via an LSA report generated for the date of the HIC.

**HDX/HDX 2.0** – Homelessness Data Exchange; a HUD website that accepts and stores CoC-level reports, including the HIC, the PIT, the SPM report, and the LSA upload.

**Informational value** – For HMIS data elements, a response category defined by the HMIS Data Standards that provides the information collected in each field, e.g. ‘Yes’ and ‘No’ are both informational values for *3.07 Veteran Status*. ‘Client doesn’t know (8), ‘Client prefers not to answer’ (9), and ‘Data not collected (99) are not informational; they are explanations for missing data. Response categories ‘Other’ (17) and ‘No exit interview completed’ (30) for *3.12 Destination* are also not informational.

**Lookback Date** – \[ReportStart – 7 years\]. Projects with operating end dates and enrollments with exit dates that occur prior to the LookbackDate are not relevant to the LSA.

**LOTH** – Length of time homeless. LOTH reporting includes counts of households grouped by total number of days in ES, SH, and TH projects, in RRH and PSH projects prior to moving into housing, and in ES/SH or on the street prior to project entry as identified in *3.917 Living Situation*. Although it is not, by definition, ‘homeless,’ time housed in RRH is also included in LOTH output.

**OPH** – Permanent housing project types other than PSH or RRH; specifically, projects typed in HMIS as *PH – Housing Only* (9) or *PH – Housing with Services (no disability required for entry)* (10). Apart from project descriptor data and point-in-time counts for the HIC, data associated with OPH projects is excluded from the LSA.

**PIT Count** – Point in Time Count; a continuum-level report to HUD, required at least every two years, that reports on the total number of people experiencing sheltered and unsheltered homelessness in the geographic area of the continuum on a single night, usually on a night in the last 10 calendar days of January.

**Population** – As used in this document, a group of people in households with one or more members who have specific characteristics that may indicate that the households have needs and/or eligibility for services that differ from the broader homeless population; for example, households fleeing domestic violence or unaccompanied children. The LSA upload includes population-specific output.

**Project group** – ES, SH, and TH (combined), RRH (only), and PSH (only). Demographics reporting for the active cohort is produced separately for each of these three project groups.

**PSH** – Permanent supportive housing for formerly homeless people.

-   PSH clients who are homeless at project entry based on *3.917 Living Situation* are considered to be experiencing homelessness until a documented *3.20 Housing Move-In Date* or exit, whichever comes first.
-   For clients who were in ES/SH or on the street at project entry, all time between *Approximate Date Started* and move-in is counted in determining chronic homelessness.
-   In general, a client may not be counted as experiencing homeless on any date between PSH move-in and the day prior to exit, regardless of other conflicting enrollment data. The only exception to this is for stays of less than seven days, and only if the dates fall between two dates less than seven days apart on which the client is otherwise documented as being on the street or in ES/SH.

**Report period** – The period of time between the report start date and report end date report parameters.

**RRH** – Rapid Re-Housing projects with the sub-type of ‘Housing with or without Services.’

-   RRH clients who are homeless at project entry based on *3.917 Living Situation* are considered to be experiencing homelessness until a documented *3.20 Housing Move-In Date* or exit, whichever comes first.
-   For clients who were in ES/SH or on the street at project entry, all time between *Approximate Date Started* and move-in is counted in determining chronic homelessness.
-   A client may not be counted as experiencing homelessness on any date between RRH move-in and the day prior to exit, regardless of other conflicting enrollment data. The only exception to this is for stays of less than seven days, and only if the dates fall between two dates less than seven days apart on which the client is otherwise documented as being on the street or in ES/SH.

**RRH-SO** – Rapid Re-Housing projects with the sub-type of ‘Services Only.’ This is a new designation with the HMIS Data Standards effective October 1, 2023. For reporting on FY2023 (which ends September 30,2023), RRH-SO enrollment data, if they exist at all, are incorporated in a limited manner:

-   For RRH-SO clients who were in ES/SH or on the street at project entry, all dates between *Approximate Date Started* and the earliest of move-in, exit, or report end are counted in determining chronic homelessness.
-   People and households served in RRH-SO are included in LSAPerson, LSAHousehold, and LSAExit.

**SH** – Safe Haven projects. All SH clients are considered to be experiencing homelessness while enrolled; any date between SH project entry and the day prior to exit is included in counts of days in ES/SH or on the street for purposes of determining chronic homelessness *as long as there is no conflicting enrollment data that identifies the client as enrolled in TH or housed in RRH/PSH*.

**SPM** – HUD’s System Performance Measures report, a CoC-level report uploaded to or manually entered to the HDX.

**System exit** – An exit from a continuum ES, SH, TH, RRH, or PSH project followed by a period of at least 14 days in which the household is not active in any other continuum ES, SH, TH, RRH, or PSH projects.

**System path** – The distinct combination of project types in which a household was enrolled during a continuous period of system use that overlaps with the report/cohort period, including enrollments prior to the start of the report/cohort period.

**TH** – Transitional housing for homeless people. All TH clients are considered to be experiencing homelessness while enrolled; however, no date between TH project entry and the day prior to exit may be included in counts of days in ES/SH or on the street for purposes of determining chronic homelessness, regardless of other conflicting enrollment data. The only exception to this is for stays of less than seven days, and only if the dates fall between two dates less than seven days apart on which the client is otherwise documented as being on the street or in ES/SH.

**UN** – Unknown household type; includes at least one member without a valid date of birth and does not include both an adult and a child.

## Changes Effective 11/1/2025

This section is limited to a high-level review of changes. Tracked versions of this document and [more detailed information about each change](https://github.com/HMIS/LSASampleCode/issues?q=type%3A%22LSA%20Update%22) are available in the [GitHub repository](https://github.com/HMIS/LSASampleCode).

### Identification of Persons and Households Active-in-Residence During the Report Period

#### Column Names

The columns in LSAPerson and LSAHousehold that identity people and households active in residence during the report period were originally named 'AHAR' because the distinction between 'active' and 'active in residence' was required for the AHAR.

At this point, the column names are confusing -- particularly because the distinction is also critical for the HIC -- so ‘AHAR’ is being replaced with ‘AIR’. This is primarily a find and replace change; it also impacts the counts in Section 9 LSACalculated Counts (formerly called ‘LSACalculated AHAR Counts’).

#### Night-by-Night Shelter

Identification of persons and households active in residence in night-by-night shelter projects now requires a bed night in the report period; this impacts section [5.1 Identify Active and Active in Residence (AIR) HouseholdIDs](#_Get_Active_HouseholdIDs_1) and section [5.2 Identify Active and Active in Residence (AIR) Enrollments](#_Toc29163943).

### HMIS Data Standards Changes

#### Gender

All gender-related reporting has been removed from the LSA. This impacts section [5.4 LSAPerson Demographics](#_LSAPerson_Demographics) and section [9.4 Get Counts of People by Project and Personal Characteristics](#_Toc525229521).

### Chronically Homeless Households in LSAExit

Households in exit cohorts were originally identified as either chronically homeless or not chronically homeless in LSAHousehold and LSAExit columns called HHChronic. An expanded list that allows for more nuanced reporting was introduced for reporting on FY2023, but updates to the programming specifications in section [7.8 CHTime and CHTimeStatus for Exit Cohorts](#_CHTime_and_CHTimeStatus_1) were incomplete at that time. That has been corrected for reporting on FY2025.

# HDX 2.0 Upload

The Longitudinal Systems Analysis (LSA) upload is a .zip file containing a total of 12 CSV files generated by the HMIS application. For the HIC, the same 12 files are submitted, but LSAHousehold and LSAExit may be empty (other than headers) as they do not include any data relevant to the HIC. Files are listed below with a brief description and links to the sections of this document that define the business logic for the file.

A separate data dictionary with a complete list of the columns and values associated with each of these files is available in the [LSA tool kit](https://www.hudexchange.info/resource/5726/lsa-report-specifications-and-tools/) as an Excel workbook.

## Project.csv

The structure of Project is defined by the HMIS CSV; it contains HMIS Data Element *2.02 Project Information* for continuum ES, SH, TH, RRH, PSH, and/or OPH projects active since LookbackDate. It is referenced as lsa\_Project in this document.

See section [4.1Get Project.csv Records / lsa\_Project](#_Get_Project.csv_Records).

## Organization.csv

The structure of Organization is defined by the HMIS CSV; it contains HMIS data element *2.01 Organization Information* for each project included in Project.csv. It is referenced as lsa\_Organization in this document.

See section [4.2 Get Organization.csv Records / lsa\_Organization](#_Get_Organization.csv_Records).

## Funder.csv

The structure of Funder is defined by the HMIS CSV; it contains HMIS data element *2.06 Funding Sources* records active during the report period for each project included in Project.csv.

See section [4.3 Get Funder.csv Records / lsa\_Funder](#_Get_Funder.csv_Records).

## ProjectCoC.csv

The structure of ProjectCoC is defined by the HMIS CSV; it contains HMIS data element *2.03 Continuum of Care Code* records associated with ReportCoC for each project included in Project.csv.

See section [4.4 Get ProjectCoC.csv Records / lsa\_ProjectCoC](#_Get_Inventory.csv_Records) .

## Inventory.csv

The structure of Inventory is defined by the HMIS CSV; it contains HMIS data element *2.07 Bed and Unit Inventory Information* records active during the report period for each project included in Project.csv, except for RRH: Services Only projects.

See section [4.5 Get Inventory.csv Records / lsa\_Inventory](#_Get_Inventory.csv_Records_1).

## HMISParticipation.csv

The structure of HMISParticipation is defined by the HMIS CSV; it contains affiliation records from HMIS data element *2.08 HMIS Participation* records active during the report period for each project included in Project.csv.

See section [4.6 Get HMISParticipation.csv Records / lsa\_HMISParticipation](#_Get_HMISParticipation.csv_Records).

## Affiliation.csv

The structure of Affiliation is defined by the HMIS CSV; it contains HMIS data element *2.02 Project Information* (field 2.02B) records for each RRH project in Project.csv with a subtype of RRH-SSO active during the report period and identified as having a residential affiliation.

See section [4.7 Get Affiliation.csv Records / lsa\_](#_Get_Affiliation.csv_Records)Affiliation.

## LSAReport.csv

LSAReport contains 67 columns, including report metadata, report parameters, and HMIS data quality reporting. The HDX 2.0 uses these data to process the upload file and to assess the reliability of the data.

See:

-   [Section 3.1 Report Parameters and Metadata](#_Report_Parameters_and)
-   [Section 9 HMIS Business Logic: LSAReport Data Quality and ReportDate](#_HMIS_Business_Logic:_4)

## LSAPerson.csv

LSAPerson contains 66 columns and includes reporting on people active during the report period. Columns include the following types of data:

-   -   Identifiers for project types, household types, and populations in which clients were served.
    -   Age categories for all clients; age is the only demographic reported for children who are not heads of household.
    -   Demographics reported for adults and heads of household, including race/ethnicity, veteran status, disability status, and domestic violence status.

Rows represent specific combinations of these data points. Each active client is counted in one row; the sum of **RowTotal** values in the file is equal to the total number of active clients in the report period.

It is critical that all values in this column are integers > 0. The largest possible number of rows – when each row includes a count of one or more people represented by the distinct combination of column values – is limited to the number of active clients. However, there are billions of possible combinations of column values, and including rows that that do not represent any clients would result in files of unmanageable size.

See [Section 5 HMIS Business Logic: LSAPerson](#_HMIS_Business_Logic:_1).

## LSAHousehold.csv

LSAHousehold contains 67 columns and includes reporting on households active during the report period. Columns include the following types of data:

-   -   Identifiers for project types and populations in which each household was served.
    -   Demographics plus living situation, destination, household composition, project geography, and system engagement.
    -   Lengths of time homeless (LOTH) and enrolled in RRH/PSH during the report period and any continuous episode of homelessness prior to ReportStart that overlaps with the report period.

Rows represent specific combinations of these data points. Each active household is counted in one row; the sum of **RowTotal** values in the file is equal to the total number of households active in the report period.

This file may empty (other than headers) for the HIC.

It is critical that all values in the **RowTotal** column are integers > 0. When each row includes a count of one or more households represented by the distinct combination of column values, the total number of rows– is limited to the number of active households. However, the number of possible distinct combinations of column values is massive and including rows that do not represent any households could result in unmanageable file sizes.

See [Section 6: HMIS Business Logic: LSAHousehold](#_HMIS_Business_Logic:_2).

## LSAExit.csv

LSAExit contains 17 columns. The file identifies households with system exits – i.e., exits from a continuum project followed by at least two weeks without an active enrollment – in three distinct periods:

-   Cohort -2 – Begins two years prior to the report start date and ends two years prior to the end date.
-   Cohort -1– Begins one year prior to the report start date and ends one year prior to the end date.
-   Cohort 0 – Begins on the report start date; if the report period is at least six months, the cohort period ends at six months; otherwise, the cohort period is the same as the report period.

Columns include the following types of data:

-   -   Identifiers for project types, household types, and populations in which clients were served;
    -   Destination types; and
    -   For clients that returned to a continuum ES, SH, TH, RRH, or PSH project, the length of time to return.

Rows represent specific combinations of these data points. Unlike LSAHousehold, LSAExit may include more than one row for any given household if the household has qualifying exits in more than one cohort period. Each household is counted in one row for each exit cohort in which they occur. The sum of **RowTotal** values in the file, grouped by Cohort, is equal to the total number of households in each of the respective cohorts. It is critical that all values in this column are integers > 0. The largest possible number of rows – when each row includes a count of one or more households represented by the distinct combination of column values – is limited to the number of active households. However, there are billions of possible distinct combinations of column values and including rows that do not represent any households could result in files of unmanageable size.

This file may be empty (other than headers) for the HIC.

See [Section 7. HMIS Business Logic: LSAExit](#_HMIS_Business_Logic:_5).

## LSACalculated.csv

This file is used to upload calculated values for report output that cannot be derived from the aggregate data.

It is used to populate columns that report on average number of days in:

-   -   System Use – Length of Time Homeless
    -   System Use – Cumulative Length of Time in PSH
    -   System Use – Length of Time in RRH Projects
    -   Returns – Days to Return/Re-engage by Exit Destination
    -   Days to Return/Re-engage by Last Project Type
    -   Days to Return/Re-engage by System Path
    -   Days to Return/Re-engage by Population

The averages are related to data in LSAHousehold and LSAExit; they are not relevant for HIC submissions.

It is also used for counts of persons, households, and bed nights grouped by project IDs and project types, including:

-   -   Counts of households and clients active in residence in the report period and on four specific dates during the report period;
    -   Counts of total bed nights in the report period; and
    -   HMIS data quality issues that may impact the integrity of LSA reporting.

The **Value** column holds the average or count. Other columns identify the report row, household type, population, etc.

See [sections](#_HMIS_Business_Logic:_6) 8-10 for business logic.

# HMIS Business Logic: Core Concepts

The universe of HMIS project, client, and enrollment data used to generate the LSA is broad in scope. It uses systemwide enrollment data for HMIS-participating continuum ES, SH, TH, RRH, and PSH projects and includes project descriptor data for OPH projects. It may include enrollments with exit dates and projects with operating end dates as far back as the LookbackDate (ReportStart – 7 years).

The HMIS data required for the LSA are shown below. The fields relevant to the business logic of the report are listed.

**hmis\_Affiliation**

**hmis\_HMISParticipation**

**hmis\_Client**

PersonalID

SSN

SSNDataQuality

DOB

DOBDataQuality

Race and Ethnicity

VeteranStatus

**hmis\_Enrollment**

EnrollmentID

PersonalID

ProjectID

EntryDate

HouseholdID

RelationshipToHoH

EnrollmentCoC

LivingSituation

RentalSubsidyType

LengthOfStay

PreviousStreetESSH

DateToStreetESSH

TimesHomelessPastThreeYears

MonthsHomelessPastThreeYears

DisablingCondition

MoveInDate

**hmis\_HealthAndDV**

EnrollmentID

InformationDate

DomesticViolenceVictim

CurrentlyFleeing

**hmis\_Services**

EnrollmentID

DateProvided (BedNightDate)

RecordType

**hmis\_Exit**

EnrollmentID

ExitDate

Destination

DestinationSubsidyType

**hmis\_ProjectCoC**

ProjectID

CoCCode

GeographyType

**hmis\_Project**

ProjectID

OperatingEndDate

ContinuumProject

ProjectType

RRHSubTypeMethod

**hmis\_Organization**

**hmis\_Funder**

**hmis\_Inventory**

EnrollmentID

InformationDate

DisabilityType

DisabilityResponse

IndefiniteAndImpairs

**hmis\_Disabilities**

The business logic in this section defines core concepts: report parameters, reporting cohorts, basic criteria for record selection, and identification of household types in various contexts.

Any given enrollment may be relevant for a variety of reporting purposes, each of which has specific criteria, but there is a common set of criteria that applies to the identification of relevant HMIS data in every aspect of LSA reporting.

There are also adjustments to HMIS move-in and exit dates that may be required to resolve conflicts with other HMIS data that apply regardless of how a particular enrollment is being used for reporting.

To simplify subsequent steps and to reduce repetition, the logic associated with selection of valid enrollments and resolution of data conflicts is described here for all HMIS *HouseholdID*s active on or after LookbackDate in HMIS-participating continuum ES/SH/TH/RRH/PSH projects that meet the core criteria.

As described, it is a process that creates records in two ‘temporary tables’ – tlsa\_HHID and tlsa\_Enrollment. They are highly de-normalized and include both HMIS data (e.g., *ProjectID*) and calculated variables (e.g., **HHType**) that are set once in these tables and referenced repeatedly in subsequent steps.

-   A record is created in tlsa\_HHID for each *HouseholdID* with columns for frequently used data, including effective/adjusted move-in and exit dates where relevant (section 3.3).
-   A record is created in tlsa\_Enrollment for each validated *EnrollmentID* with columns for frequently used data, including effective/adjusted move-in and exit dates where relevant (section 3.4).

Household type is determined by the ages of household members. The calculation of age and household type is context-dependent – some processes require household type based on ages at project entry; others require household type based on age at the later of project entry or the start of a given cohort period. As described:

There are multiple age columns in tlsa\_Enrollment (**EntryAge**, **ActiveAge**, etc.) and multiple household type columns in tlsa\_HHID (**EntryHHType**, **ActiveHHType**, etc.). Descriptions of business logic associated with age and household type processes are not repeated in subsequent sections.

hmis\_Client

Report Parameters

tlsa\_CohortDates

lsa\_Report

tlsa\_HHID

hmis\_Exit

hmis\_Enrollment

hmis\_Services

hmis\_Project

hmis\_Exit

hmis\_Disabilities

hmis\_Enrollment

hmis\_HealthAndDV

tlsa\_Enrollment

Insert parameters to LSAReport

*HouseholdIDs* active –LookbackDate -ReportEnd

Get cohort start/end dates

Associated enrollments

Get enrollment ages

Set household types

## Report Parameters and Metadata (lsa\_Report)

lsa\_Report

Report Parameters

Vendor Info

User-entered report parameters are included in LSAReport for upload to HDX 2.0. When they are applied in subsequent steps, their source is represented in graphics using lsa\_Report. References to individual report parameters are always underlined – e.g., ReportStart – in descriptions of business logic.

### Relevant Data

#### Source

User-entered and vendor-provided data.

#### Target

LSAReport

ReportID

ReportStart

ReportEnd

ReportCoC

LSAScope

SoftwareVendor

SoftwareName

VendorContact

VendorEmail

### Logic

#### ReportID

**ReportID** is a system-generated integer that distinctly identifies an instance of LSA output and is repeated in each of the CSV files to confirm that they were produced together.

#### ReportStart

For the annual year-long LSA submitted to HUD, the report start date must be the first day (October 1) of the fiscal year for which the LSA is being produced.

For submission as the HIC, the report start date must be the date of the count.

It must be possible for a user to select any date on or after October 1, 2018.

The data type for the column is date; values should be formatted as ‘yyyy-mm-dd’.

#### ReportEnd

For the annual year-long LSA submitted to HUD, this must be the last day (September 30) of the fiscal year for which the LSA is being produced.

For submission as the HIC, this must be the same as ReportStart, i.e. the date of the count.

It must be possible for a user to select any date >= ReportStart. However, since the LSA is resource-intensive, HMIS vendors may limit the ability of users to specify date ranges beyond one year in length.

The phrase “report period,” in the context of this document, refers to the period between ReportStart and ReportEnd, inclusive of those two dates.

The data type for the column is date; values should be formatted as ‘yyyy-mm-dd’.

#### ReportCoC

**CoC Code** (ReportCoC) – The HUD-assigned code identifying the continuum for which the LSA is being produced. Users must be able to select one CoC from a drop-down list that includes all *2.03 Continuum of Care Codes* for which they are authorized to generate the LSA.

The column is limited to six characters – e.g., ‘XX-999’ – and must match the HDX 2.0 value for the CoC for which the user is uploading data.

#### LSAScope

LSAScope is a user-selected report parameter.

LSAScope Values

Category

1

Systemwide

2

Project-focused

3

HIC

**Systemwide** – LSA reporting procedures must identify projects relevant to the LSA based on project types and business logic defined by this document without requiring the user to select individual projects. (**LSAScope** must be 1 for submissions to HUD.)

**Project-Focused** – Users must be able to specify a subset of one or more HMIS projects such that clients included in reporting are limited to those served in the selected projects. (Reporting on system use and chronic homelessness uses systemwide data regardless of LSAScope.) Projects available to select should be limited to:

Continuum projects (*ContinuumProject* = 1)

ES, SH, TH, RRH, and PSH projects (*ProjectType* in (0,1,2,3,8,13))

**HIC** – The HIC is a single day systemwide report.

#### User-Selected Projects (for Project-Focused LSA)

For a project-focused LSA, the HMIS *ProjectID*s for the projects selected by the user are also a parameter. This parameter is applied when selecting PDDE data for export.

#### SoftwareVendor and SoftwareName

**SoftwareVendor** and **SoftwareName** must be hard-coded to ensure that the values are consistent across all HMIS implementations. Both columns are strings; they may not exceed 50 characters and may not include any of the following: < > \[ \] { }.

#### VendorContact and VendorEmail

Vendors may elect to provide contact information or to populate these columns with ‘n/a.’ In either case, **VendorContact** and **VendorEmail** must be hard-coded by the vendor. Both columns are strings; they may not exceed 50 characters and may not include any of the following: < > \[ \] { }.

## LSA Reporting Cohorts and Dates (tlsa\_CohortDates)

lsa\_Report

tlsa\_CohortDates

A ‘cohort’ refers to a group of clients and/or households who meet specific criteria and were served in a given time frame.

The user-entered LSA report period – ReportStart to ReportEnd – defines the **active cohort**, which includes people and households served in continuum ES, SH, TH, RRH, and PSH projects during that time frame. Reporting in LSAPerson and LSAHousehold is limited to the active cohort.

The LSA is not limited to the active cohort, however; it includes reporting for multiple time frames and cohorts.

LSAExit is limited to reporting on three **exit cohorts**, which include households who:

-   -   Exited from a continuum ES, SH, TH, RRH, or PSH project during three cohort time periods; and
    -   Were not enrolled in any continuum ES, SH, TH, RRH, or PSH project in the 14 days after exit.

Finally, there are four **point-in-time cohorts**, which include people and households active in residence (i.e., with a bed night) in continuum ES, SH, TH, RRH, or PSH projects on four specific dates during the report period. Reporting on these cohorts is limited to counts in LSACalculated.

This section defines the logic associated with deriving the cohort periods based on ReportStart and ReportEnd.

### Relevant Data

#### Source

lsa\_Report

ReportStart

ReportEnd

#### Target

Cohorts and cohort periods are referenced in subsequent steps using an intermediate data construct/temporary table called tlsa\_CohortDates.

tlsa\_CohortDates

Cohort

CohortStart

CohortEnd

### Logic

Point-in-time cohorts are only included if the relevant date falls between ReportStart and ReportEnd and **LSAScope** <> 3 (HIC). Exit cohorts are included only if **LSAScope** <> 3.

Cohort

Cohort Type

CohortStart

CohortEnd

\-2

Exit Minus 2

(ReportStart - 2 years)

(ReportEnd - 2 years)

\-1

Exit Minus 1

(ReportStart - 1 year)

(ReportEnd – 1 year)

0

Exit 0

ReportStart

If \[ReportEnd – 6 months\] <= ReportStart, use ReportEnd

Otherwise, \[ReportEnd – 6 months\]

1

Active

ReportStart

ReportEnd

10

Point in time 10/31

October 31 of ReportStart year

\= **CohortStart**

11

Point in time 1/31

January 31 of ReportEnd year

\= **CohortStart**

12

Point in time 4/30

April 30 of ReportEnd year

\= **CohortStart**

13

Point in time 7/31

July 31 of ReportEnd year

\= **CohortStart**

## HMIS Household Enrollments (tlsa\_HHID)

hmis\_HMISParticipation

lsa\_Report

tlsa\_HHID

hmis\_Exit

hmis\_Enrollment

hmis\_Services

hmis\_Project

Not all the *HouseholdID*s identified in this step will ultimately be used by LSA reporting processes. Subsequent steps define the specific criteria associated with each step. However, all subsequent steps are based on the following assumptions:

1.  Unless otherwise specified, all LSA reporting[\[1\]](#footnote-2) is limited to enrollments that meet the core criteria defined in this step; and
2.  Any reference to **EntryDate**, **MoveInDate** or **ExitDate** (in bold) as a property of tlsa\_HHID or tlsa\_Enrollment is a reference to the effective/adjusted entry, exit and move-in dates consistent with the logic in this step.
3.  References to *EntryDate*, *MoveInDate* and *ExitDate* (italicized) are to raw HMIS data as entered.

### Relevant Data

#### Source

**lsa\_Report**

ReportCoC

LookbackDate

ReportEnd

**hmis\_Organization**

VictimServiceProvider

**hmis\_Project**

ContinuumProject

ProjectID

ProjectType

RRHSubType

OperatingStartDate

OperatingEndDate

**hmis\_HMISParticipation**

HMISParticipationType

HMISParticipationStatusStartDate

HMISParticipationStatusEndDate

**hmis\_Enrollment**

EnrollmentID

PersonalID

ProjectID

HouseholdID

EntryDate

RelationshipToHoH

EnrollmentCoC

MoveInDate

**hmis\_Services**

EnrollmentID

*BedNightDate* (*DateProvided* where *RecordType* = 200)

**hmis\_Exit**

EnrollmentID

ExitDate

#### Target

The logic associated with values for columns with names in **bold** below is described in this step. The business logic associated with other columns is described in subsequent steps.

**tlsa\_HHID**

**Column Description**

**HouseholdID**

Distinct *HouseholdIDs* served in continuum ES/SH/TH/RRH/PSH projects between LookbackDate and ReportEnd

**HoHID**

The unique identifier for the head of household – i.e., the *PersonalID* from the enrollment associated with the *HouseholdID* where *RelationshipToHoH* = 1.

**EnrollmentID**

From hmis\_Enrollment

**ProjectID**

From hmis\_Enrollment

**LSAProjectType**

From hmis\_Project *ProjectType* and *RRHSubType* columns.If *ProjectType* = 13 and *RRHSubType* \= 2, **LSAProjectType** = 13

If *ProjectType* = 13 and *RRHSubType* \= 1, **LSAProjectType** = 15

Otherwise, LSAProjectType = hmis\_Project.*ProjectType*.

**EntryDate**

The effective entry date for the enrollment, which may differ from the recorded *EntryDate* in HMIS for night-by-night ES enrollments. (See logic section for **EntryDate** below.)

**MoveInDate**

The move-in date for RRH/PSH enrollments, which may differ from the recorded *MoveInDate* in HMIS. (See logic section for **MoveInDate** below.)

**ExitDate**

The effective exit date for the HoH enrollment, which may differ from the *ExitDate* recorded in hmis\_Exit. (See logic section for **ExitDate** below.)

**LastBedNight**

If *ProjectType* = 1, the latest *BedNightDate* for the HoH on or before ReportEnd

EntryHHType

For all household enrollments, household type based on household member ages as of their **EntryDate**

ActiveHHType

For all household enrollments, household type as the enrollment might be relevant to reporting on the active cohort. For those active in the report period, this is based on household member ages as of the later of **EntryDate** and ReportStart. For inactive enrollments, which may be relevant to reporting on system use or homelessness prior to the report period, this is always the **EntryHHType**.

Exit1HHType

For all household enrollments, household type as the enrollment might be relevant to reporting on exit cohort -1. For household enrollments where **ExitDate** occurs in the cohort period, household type based on ages as of the later of **EntryDate** and **CohortStart.** For enrollments before and after the cohort period, which may be relevant to reporting on system use or returns, this is always the **EntryHHType**.

Exit2HHType

For all household enrollments, household type as the enrollment might be relevant to reporting on exit cohort -2. For household enrollments where **ExitDate** occurs in the cohort period, household type based on ages as of the later of **EntryDate** and **CohortStart.** For enrollments before and after the cohort period, which may be relevant to reporting on system use or returns, this is always the **EntryHHType**.

ExitCohort

Identifies the cohort period in which the **ExitDate** occurs, if any; set in section [7.1 Identify Qualifying Exits in Exit Cohort Periods](#_Identify_Qualifying_Exits)

**ExitDest**

Exit destination, if relevant

Active

Identifies **HouseholdID**s included in the active cohort

AIR

Active in residence - Identifies the subset of active enrollments with at least one bed night in the report period

PITOctober

Identifies the subset of AIR enrollments with a bed night on October 31 (if within the report period)

PITJanuary

Identifies the subset of AIR enrollments with a bed night on January 31 (if within the report period)

PITApril

Identifies the subset of AIR enrollments with a bed night on April 30 (if within the report period)

PITJuly

Identifies the subset of AIR enrollments with a bed night on July 31 (if within the report period)

ExitCohort

Identifies the exit cohort period, if any, in which the enrollment is relevant; set in section [7.1 Identify Qualifying Exits in Exit Cohort Periods](#_Identify_Qualifying_Exits)

HHChronic

Identifies households with a chronically homeless HoH or adult or other specific patterns of long-term homelessness.

See section [5.12 Set Population Identifiers for Active HMIS Households](#_Set_Population_Identifiers_5)

HHVet

Identifies households with one or more veteran adults

See section [5.12 Set Population Identifiers for Active HMIS Households](#_Set_Population_Identifiers_5)

HHDisability

Identifies households with a disabled HoH or other adult

See section [5.12 Set Population Identifiers for Active HMIS Households](#_Set_Population_Identifiers_5)

HHFleeingDV

Identifies households fleeing or otherwise impacted by domestic violence

See section [5.12 Set Population Identifiers for Active HMIS Households](#_Set_Population_Identifiers_5)

HHAdultAge

Identifies age-related populations (e.g., Senior 55+, Parenting Youth 18-24, Non-Veteran 25+)

See section [5.12 Set Population Identifiers for Active HMIS Households](#_Set_Population_Identifiers_5)

HHParent

Identifies households where at least one household member has a *RelationshipToHoH* of ‘Child’ (2)

See section [5.12 Set Population Identifiers for Active HMIS Households](#_Set_Population_Identifiers_5)

AC3Plus

Identifies AC households with 3 or more household members under 18

See section [5.12 Set Population Identifiers for Active HMIS Households](#_Set_Population_Identifiers_5)

### Logic

#### HMIS Data Requirements and Assumptions

**The HMIS Lead must identify and merge duplicate records for individual clients prior to generating the LSA.** The production of an unduplicated count of people experiencing homelessness is a fundamental purpose of HMIS. As such, it has been a requirement of every version of the HMIS Data Standards since March 2010 that an HMIS application must have functionality that allows the HMIS Lead to de-duplicate records with different *PersonalID*s for the same client. For the LSA, it is particularly critical that HMIS Leads *utilize* this functionality; it is not otherwise possible to produce accurate longitudinal and/or systemwide reporting.

**Unless otherwise specified by this document, reporting procedures must exclude any data which is inconsistent with the HMIS Data Standards and HMIS CSV Specifications.** Both the programming specifications and sample code assume the existence of relational database tables with properties consistent with the HMIS CSV specifications, to include column names, primary keys, foreign keys, and column values limited to those defined for HMIS. Referential integrity is also assumed. There are defined requirements for addressing a limited number of data issues in LSA reporting; however, it is outside the scope of this document to anticipate every potential inconsistency. In systems that – for whatever reason – allow users to create records that are inconsistent with HMIS requirements, it is the responsibility of the vendor to be aware of these exceptions and exclude the records from LSA reporting.

**Deleted data are never used for reporting.** Any record marked as deleted must be excluded from LSA reporting.

**Only data associated with valid enrollments in continuum projects are included in the LSA.** A valid enrollment has, at a minimum, an *EntryDate*, a *PersonalID*, a *ProjectID*, a *HouseholdID*, a valid *RelationshipToHoH*, and an *EnrollmentCoC* associated with the head of household’s *EnrollmentID*. Data not associated with a valid enrollment – including bed nights in systems that allow users to create a record of a bed night without a valid enrollment – are excluded from the LSA.

**For any given *HouseholdID*, there must be exactly one enrollment record where *RelationshipToHoH* = 1**. If the HMIS allows users to create enrollments with no designated HoH and/or with more than one designated HoH:

-   Those enrollments will be excluded from LSA reporting.
-   A count of enrollments with <> 1 HoH will be included in LSAReport.**NotOneHoH**.
-   CoCs may upload LSA file sets where **NotOneHoH** > 0 to HDX 2.0 for local use and review.
-   CoCs may not submit LSA file sets where **NotOneHoH** > 0 to HUD for use in the AHAR. Invalid HoH data must be corrected and a new LSA file set must be uploaded.

**A head of household must be present for the duration of a project stay.** Entry and exit dates for household members will be adjusted if they fall outside of the period between the effective **EntryDate** and **ExitDate** (if any) for the head of household.

**An *ExitDate* must be at least one day later than the *EntryDate*.** Enrollments with a duration of less than a day will be excluded from LSA reporting.

**Households with RRH enrollments in the report period where *MoveInDate* is equal to the *ExitDate* will be counted as housed in RRH.** It is consistent with the RRH model that a project might provide services and/or financial assistance to assist a household in obtaining permanent housing that do not continue past the date that the household moves in. As such, a household is considered housed in RRH on their *MoveInDate* even if it coincides with the *ExitDate*. This is the only circumstance under which a bed night is counted for an *ExitDate*.

**Households with PSH enrollments in the report period where *MoveInDate* is equal to the *ExitDate* will not be counted as housed in PSH.** It is not consistent with the PSH model, which includes long-term residential services, that a household could be considered housed by the project with an exit on the move-in date.

**Regardless of entry, move-in, exit, and/or bed nights recorded in HMIS, anything that occurs outside of date range in which a project is both operating and participating in HMIS is disregarded.** Except for exits, anything that occurs on a project’s operating end date and/or HMIS participation end date is disregarded. Enrollments that span changes in a project’s status will be truncated.

**A night-by-night ES enrollment begins with a bed night.** For any enrollment where there is not a record of a bed night on the entry date:

-   The effective **EntryDate** for the enrollment will be the date of the earliest bed night (after the recorded *EntryDate*) associated with the enrollment.
-   *LivingSituation* will be reported as unknown, if applicable.

**For night-by-night ES enrollments, any *ExitDate* must be one day after the last recorded bed night.** For any exit where there is not a record of a bed night for the preceding date:

-   LSA reporting procedures will use an effective exit date of \[last bed night + 1 day\].
-   *Destination* will be reported as unknown, if applicable.

**Night-by-night ES clients are to be auto-exited after an extended period without a bed night.** For any night-by-night ES enrollment where there is no record of an exit and there is no record of a bed night in the 90 days ending on ReportEnd:

-   LSA reporting procedures will use an effective exit date of \[last bed night + 1 day\].
-   *Destination* will be reported as unknown, if applicable.

#### HMISStart and HMISEnd

**HMISStart** refers to the most recent HMISParticipation.*HMISParticipationStatusStartDate* for the enrollment’s *ProjectID* where *HMISParticipationType* = 1 and:

-   *HMISParticipationStatusStartDate* <= ReportEnd; and
-   *ExitDate* is null or > *HMISParticipationStatusStartDate*; and
-   *HMISParticipationStatusEndDate* is null or (> *EntryDate* AND > LookbackDate).

**HMISEnd** refers to the *HMISParticipationStatusEndDate* associated with **HMISStart;** dates after ReportEnd should be evaluated as NULL**.**

#### BedNightDates, FirstBedNight and LastBedNight

For night-by-night shelter (*ProjectType* = 1) enrollments, a Services record where *RecordType* = 200 is counted as a *BedNightDate* if *DateProvided* is:

-   \>= LookbackDate; and
-   \>=*OperatingStartDate*; and
-   \>= **HMISStart**; and
-   \>=*EntryDate*; and
-   <= ReportEnd; and
-   <*ExitDate* (if not null); and
-   < *OperatingEndDate* (if not null); and
-   < **HMISEnd** (if not null).

**FirstBedNight** is the earliest *BedNightDate* associated with an enrollment.

**LastBedNight** is the latest *BedNightDate* associated with an enrollment.

#### Record Selection

Potentially relevant *HouseholdID*s are those associated with one or more project enrollments that meet the following criteria.

-   *VictimServiceProvider =* 0
-   The project type is relevant to the LSA:
    -   *ProjectType* in (0,1,2,3,8); or
    -   *ProjectType* = 13 and Project.*RRHSubType* in (1,2)
-   ContinuumProject \= 1
-   The project was operating during the relevant period:
    -   *OperatingStartDate* <= ReportEnd
    -   *OperatingEndDate* is NULL; or
    -   *OperatingEndDate* \> LookbackDate and >*OperatingStartDate*
-   *RelationshipToHoH* = 1
-   *EnrollmentCoC* = ReportCoC
-   There is no other enrollment record for the *HouseholdID* where *RelationshipToHoH* = 1
-   *EntryDate* <= ReportEnd
-   EntryDate < *OperatingEndDate* or *OperatingEndDate* is NULL
-   *EntryDate* < **HMISEnd** or **HMISEnd** is NULL
-   *ExitDate* is NULL or:
    -   *ExitDate* > LookbackDate; and
    -   *ExitDate* > *EntryDate*; and
    -   *ExitDate* > **HMISStart**; and
    -   *ExitDate* > *OperatingStartDate*
-   If*ProjectType* = 1, there is at least one *BedNightDate* record for the enrollment (see criteria above).

#### EntryDate

To be included in the LSA, an enrollment must have an *EntryDate* that meets the following criteria:

-   <= ReportEnd
-   < *OperatingEndDate* (if not null)
-   < **HMISEnd** (if not null)

Under some circumstances, the LSA will use an adjusted **EntryDate**:

Priority

Criteria

Effective Entry Date

1

*ProjectType* = 1

**FirstBedNight**

2

*EntryDate* >= **HMISStart**; and

*EntryDate* >= *OperatingStartDate*

*EntryDate*

3

(any other)

The later of *OperatingStartDate/***HMISStart**

#### MoveInDate

The *MoveInDate* is set for the head of household from the HMIS enrollment record only if it occurs on or before the end of the report period and is logically consistent with the project type, the head of household’s entry/exit dates, and the project’s operating/HMIS participation dates. Under some circumstances, the LSA will use an adjusted **MoveInDate**:

Priority

Criteria

Effective Move-In Date

1

*ProjectType* not in (3,13)

NULL

1

*MoveInDate* < *EntryDate*

NULL

1

*MoveInDate* > Exit.*ExitDate*

NULL

1

*MoveInDate* = Exit.*ExitDate* and *ProjectType* = 3

NULL

1

*MoveInDate* > ReportEnd

NULL

1

*MoveInDate* >= *OperatingEndDate* or **HMISEnd**

NULL

2

*MoveInDate* is NULL or

*(MoveInDate* \>= **HMISStart** *and MoveInDate* \>= *OperatingStartDate)*

*MoveInDate*

3

(any other)

The later of *OperatingStartDate*/**HMISStart**

#### ExitDate

If the recorded *ExitDate* (or lack thereof) associated with an enrollment is inconsistent with other data, reporting must be based on an adjusted **ExitDate** consistent with the logic below. If applicable, *Destination* for these enrollments is reported as ‘Data missing or invalid’ (99).

-   An *ExitDate* \> ReportEnd should be evaluated as NULL prior to making any adjustments.
-   Any adjustment that results in an effective **ExitDate** > ReportEnd should be evaluated as NULL.

Priority

Condition

Effective Exit Date

1

LastBedNight = ReportEnd

NULL

2

\[**LastBedNight** + 90 days\] <= ReportEnd

\[**LastBedNight** \+ 1 day\]

2

**LSAProjectType** \= 1 and *ExitDate* < ReportEnd

\[**LastBedNight** \+ 1 day\]

3

**ProjectType** = 13 and *ExitDate* = *MoveInDate* and *ExitDate* = ReportEnd

NULL

4

**ProjectType** = 13 and *ExitDate* = *MoveInDate*

\[*MoveInDate* + 1 day\]

5

*OperatingEndDate* and/or **HMISEnd** *<=* ReportEnd; and

*ExitDate* is null or *ExitDate >* (the earlier of **HMISEnd**/*OperatingEndDate*)

The earlier of *OperatingEndDate*/**HMISEnd**

6

(other)

*ExitDate*

#### ExitDest

The LSA includes reporting on exit destinations for the active and exit cohorts. Destination for inactive enrollments may also be relevant to system engagement status for the active and exit cohorts. If the recorded *ExitDate* (or lack thereof) associated with an enrollment is inconsistent with other data, (see **ExitDate** above), destination is always reported as unknown where relevant. The only exception to this is for RRH exits when the recorded exit date is the same as the **MoveInDate** – the recorded destination is valid under those circumstances.

**ExitDest** should be set based on the first of the criteria below met by the associated data:

-   If tlsa\_HHID.**ExitDate** is null, **ExitDest** = -1
-   If tlsa\_HHID.**ExitDate** <> hmis\_Exit.*ExitDate* and hmis\_Exit.*ExitDate* <> tlsa\_HHID.**MoveInDate**, **ExitDest** = 99
-   If tlsa\_HHID.**ExitDate** is not null and hmis\_Exit.*Destination* is null, **ExitDest** = 99
-   If hmis\_Exit.*Destination* in (8,9), set **ExitDest** = 98
-   If hmis\_Exit.*Destination* in (17,30,99), set **ExitDest** = 99
-   If hmis\_Exit.*Destination* \= 435 and hmis\_Exit.*DestinationSubsidyType* is null, set **ExitDest** \= 99
-   If hmis\_Exit.*Destination* \= 435, set **ExitDest** = hmis\_Exit.*DestinationSubsidyType*
-   Otherwise, set **ExitDest** to hmis\_Exit.*Destination*

Value

Destination

\-1

Not applicable

24

Deceased

98

Data not provided by client

99

Data missing or invalid

101

Emergency shelter, including hotel or motel paid for with emergency shelter voucher, Host Home shelter

116

Place not meant for habitation (e.g., a vehicle, an abandoned building, bus/train/subway station/airport or anywhere outside)

118

Safe Haven

204

Psychiatric hospital or other psychiatric facility

205

Substance abuse treatment facility or detox center

206

Hospital or other residential non-psychiatric medical facility

207

Jail, prison, or juvenile detention facility

215

Foster care home or foster care group home

225

Long-term care facility or nursing home

302

Transitional housing for homeless persons (including homeless youth)

312

Staying or living with family, temporary tenure (e.g. room, apartment, or house)

313

Staying or living with friends, temporary tenure (e.g. room, apartment, or house)

314

Hotel or motel paid for without emergency shelter voucher

327

Moved from one HOPWA funded project to HOPWA TH

329

Residential project or halfway house with no homeless criteria

332

Host Home (non-crisis)

410

Rental by client, no ongoing housing subsidy

411

Owned by client, no ongoing housing subsidy

419

Rental by client - VASH housing subsidy

420

Rental by client - Other ongoing subsidy

421

Owned by client, with ongoing housing subsidy

422

Staying or living with family, permanent tenure

423

Staying or living with friends, permanent tenure

426

Moved from one HOPWA funded project to HOPWA PH

428

Rental by client - GPD TIP housing subsidy

431

Rental by client - RRH or equivalent subsidy

433

Rental by client - HCV voucher (tenant or project based) (not dedicated)

434

Rental by client - Public housing unit

436

Rental by client - Emergency Housing Voucher

437

Rental by client - Family Unification Program Voucher (FUP)

438

Rental by client - Foster Youth to Independence Initiative (FYI)

439

Rental by client - Permanent Supportive Housing

440

Rental by client - Other permanent housing dedicated for formerly homeless persons

## HMIS Client Enrollments (tlsa\_Enrollment)

lsa\_Report

tlsa\_HHID

tlsa\_Enrollment

hmis\_Exit

hmis\_Client

hmis\_Enrollment

hmis\_HealthAndDV

hmis\_Services

### Relevant Data

#### Source

**lsa\_Report**

ReportStart

ReportEnd

**tlsa\_HHID**

HouseholdID

ProjectID

LSAProjectType

EntryDate

MoveInDate

ExitDate

**hmis\_Enrollment**

EnrollmentID

PersonalID

ProjectID

HouseholdID

EntryDate

RelationshipToHoH

DisablingCondition

**hmis\_HealthAndDV**

InformationDate

DomesticViolenceSurvivor

CurrentlyFleeing

**hmis\_Client**

PersonalID

DOB

DOBDataQuality

**hmis\_Services**

EnrollmentID

*BedNightDate* (*DateProvided* where *RecordType* = 200)

**hmis\_Exit**

EnrollmentID

ExitDate

#### Target

The logic associated with values for columns with names in **bold** below is described in this step. The business logic associated with other columns is described in subsequent steps.

**tlsa\_Enrollment**

**Column Description**

**EnrollmentID**

Distinct *EnrollmentIDs* in continuum ES/SH/TH/RRH/PSH projects between LookbackDate and ReportEnd

**PersonalID**

From hmis\_Enrollment

**HouseholdID**

From hmis\_Enrollment, limited to *HouseholdID*s in tlsa\_HHID

**RelationshipToHoH**

From hmis\_Enrollment

**ProjectID**

From tlsa\_HHID

**LSAProjectType**

From tlsa\_HHID

**EntryDate**

From hmis\_Enrollment

**MoveInDate**

Based on tlsa\_HHID – the move-in date for RRH/PSH enrollments, which may differ from the recorded *MoveInDate* in HMIS or for the HoH. (See below.)

**ExitDate**

Based on hmis\_Exit, the effective exit date for the enrollment, which may differ from the *ExitDate* recorded in hmis\_Exit. (See below.)

**LastBedNight**

If **LSAProjectType** = 1, the latest *BedNightDate* for the enrollment on or before ReportEnd

EntryAge

The client’s age as of **EntryDate**

ActiveAge

For enrollments active in the report period, the client’s age as of the later of **EntryDate** and ReportStart. For all other enrollments, this will be the same as **EntryAge**

Exit1Age

For enrollments with an exit date between **CohortStart** and **CohortEnd** for exit cohort -1, client age as of the later of **EntryDate** and **CohortStart** for the relevant cohort period. For all other enrollments, this will be the same as **EntryAge**

Exit2Age

For enrollments with an exit date between **CohortStart** and **CohortEnd** for exit cohort -2, client age as of the later of **EntryDate** and **CohortStart** for the relevant cohort period. For all other enrollments, this will be the same as **EntryAge**

**DisabilityStatus**

From hmis\_Enrollment; used repeatedly in subsequent steps for demographic reporting and to identify households and people included in various populations of interest

**DVStatus**

From hmis\_HealthAndDV; used repeatedly in subsequent steps for demographic reporting and to identify households and people included in various populations of interest

Active

Identifies enrollments that meet the criteria for inclusion in the active cohort

AIR

Active in residence - identifies the subset of active enrollments with at least one bed night in the report period

PITOctober

Identifies the subset of AIR enrollments with a bed night on January 31 (if within the report period)

PITJanuary

Identifies the subset of AIR enrollments with a bed night on April 30 (if within the report period)

PITApril

Identifies the subset of AIR enrollments with a bed night on July 31 (if within the report period)

PITJuly

Identifies the subset of AIR enrollments with a bed night on October 31 (if within the report period)

CH

Identifies enrollment relevant to reporting on chronic homelessness

### Logic

#### Record Selection

An enrollment should be included in tlsa\_Enrollment if:

-   *HouseholdID* meets the selection criteria for inclusion in tlsa\_HHID (HHID)
-   Enrollment.*RelationshipToHoH* in (1,2,3,4,5)
-   Enrollment.*EntryDate* <= ReportEnd
-   Exit.*ExitDate* is NULL or
    -   Exit*.ExitDate* > LookbackDate; and
    -   Exit*.ExitDate* > Enrollment.*EntryDate*; and
    -   Exit.*ExitDate* \> tlsa\_HHID.*EntryDate*.
-   If tlsa\_HHID.**LSAProjectType** = 1, there is at least one *BedNightDate* Services.*RecordType* = 200) record for the enrollment where *DateProvided* is:
    -   Between LookbackDate and the earlier of Enrollment.*ExitDate* or ReportEnd; and
    -   On or after Enrollment.*EntryDate*; and
    -   On or after tlsa\_HHID.**EntryDate**; and
    -   On or before tlsa\_HHID.**ExitDate** (if it is not NULL)

#### EntryDate

For night by night enrollments (tlsa\_HHID.**LSAProjectType** = 1), **EntryDate** is set to the earliest *BedNightDate* for the enrollment that is consistent with the record selection criteria.

For all other enrollments, tlsa\_Enrollment.**EntryDate** should be set to the later of:

-   hmis\_Enrollment.*EntryDate*; or
-   tlsa\_HHID.**EntryDate**.

#### MoveInDate

All requirements for *MoveInDate* that apply to the active household also apply to all household members’ individual enrollments. If the household’s effective *MoveInDate* is logically inconsistent with a household member’s entry/exit dates, additional logic applies to setting the household member’s effective *MoveInDate.*

-   If the household *MoveInDate* is prior to a household member’s *EntryDate*, the effective *MoveInDate* for the household member’s enrollment is the same as their *EntryDate*.
-   If the household *MoveInDate* is after a household member’s *ExitDate*, the household member does not have a *MoveInDate.*
-   If a household member exits the project on the date that the head of household moves in to permanent housing AND the household remains active in the project, the household member does not have a *MoveInDate*.

Condition

Effective Move-In Date

HHID.**MoveInDate** < Enrollment.*EntryDate*

Enrollment.*EntryDate*

HHID.**MoveInDate** > Exit.*ExitDate*

NULL

HHID.**MoveInDate** = Exit.*ExitDate* and HHID.**ExitDate** is NULL

NULL

HHID.**MoveInDate** = Exit.*ExitDate* and HHID.**ExitDate** > Exit.*ExitDate*

NULL

(any other)

HHID.**MoveInDate**

#### Last Bed Night for Night-by-Night Shelter Enrollments

Where tlsa\_HHID.**LSAProjectType** = 1, **LastBedNight** refers to the most recent record (hmis\_Services.*RecordType* = 200) of a bed night that meets the criteria for record selection.

#### ExitDate

All requirements for *ExitDate* that apply to the active household apply to household members. In addition, no household member’s enrollment may continue past the head of household’s actual or effective exit date (tlsa\_HHID.**ExitDate**).

For all project types other than night-by-night ES, if a household member’s enrollment remains active after the household exit date (actual or effective), the effective exit date for the household member is the same as the household’s exit date.

Condition

Effective Exit Date

*ExitDate* > tlsa\_HHID.**ExitDate**

tlsa\_HHID.**ExitDate**

*ExitDate* is NULL and tlsa\_HHID.**ExitDate** is not NULL

tlsa\_HHID.**ExitDate**

*ExitDate* > ReportEnd

NULL

(any other)

*ExitDate*

For night by night ES enrollments (tlsa\_HHID.**LSAProjectType** = 1), **ExitDate** is set to NULL if:

-   hmis\_Enrollment.*ExitDate* is NULL; and
-   tlsa\_HHID.**ExitDate** is NULL; and
-   **\[LastBedNight** + 90 days\] > ReportEnd.

Otherwise, **ExitDate** = \[**LastBedNight** \+ 1 day\].

#### DisabilityStatus

Because it is relevant and used repeatedly in subsequent steps both for demographic reporting and for identification of people and households who are part of specific populations of interest (e.g, Households with a Disabled Adult or Head of Household) , a preliminary enrollment-level value is included in tlsa\_Enrollment.

Enrollment DisablingCondition Value

DisabilityStatus

0

0

1

1

(any other)

NULL

#### DVStatus

Because it is relevant and used repeatedly in subsequent steps both for demographic reporting and for identification of people and households who are part of specific populations of interest (e.g, Households Fleeing Domestic Violence), a preliminary enrollment-level value is included in tlsa\_Enrollment.

It is the minimum DVStatus value in the table below based on *DomesticViolenceSurvivor* and *CurrentlyFleeing* values for any record associated with the enrollment and dated:

-   On or before ReportEnd; and
-   On or after tlsa\_Enrollment.**EntryDate***;* and
-   On or before tlsa\_Enrollment.**ExitDate**, if it is not null.

DomesticViolenceSurvivor

CurrentlyFleeing

DVStatus

1

1

1

1

0

2

1

(any other)

3

0

(n/a)

10

In (8,9)

(n/a)

98

(any other)

(n/a)

NULL

## Enrollment Ages (tlsa\_Enrollment)

lsa\_Report

tlsa\_CohortDates

hmis\_Client

tlsa\_Enrollment

Age is used to determine household type, for demographic reporting, and to identify households and people in reporting populations of interest. This section defines the logic associated with determining client age for all enrollments in all contexts that age may be relevant.

It uses data in tlsa\_CohortDates and hmis\_Client to set age group values for tlsa\_Enrollment.

### Relevant Data

#### Source

**lsa\_Report**

ReportStart

ReportEnd

**tlsa\_CohortDates**

Cohort

CohortStart

CohortEnd

**tlsa\_Enrollment**

EntryDate

RelationshipToHoH

ExitDate

**hmis\_Client**

DOB

DOBDataQuality

#### Target

**tlsa\_Enrollment**

**EntryAge**

**ActiveAge**

**Exit1Age**

**Exit2Age**

### Logic

#### EntryAge

A client’s age at project entry is based on hmis\_Client *DOB* and *DOBDataQuality* and the entry date for the enrollment.

All dates of birth must be validated; a client’s age must be handled as unknown if any of the following are true:

-   -   *DOBDataQuality* is anything other than ‘Full DOB reported’ (1) or ‘Approximate or partial DOB reported’ (2);
    -   *DOB* is missing or set to a system default;
    -   The calculation would result in an age over 105 years old;
    -   *DOB* is later than *EntryDate* for the enrollment; or
    -   RelationshipToHoH = 1 and DOB = EntryDate for the enrollment

The first of the criteria listed below met by the combination of values for *DOB,* *DOBDataQuality,* and **EntryDate** determines the **EntryAge** for each enrollment:

Priority

Condition

AgeGroup

LSA Category

1

*DOBDataQuality* in (8,9)

98

Data not provided

2

*DOBDataQuality* not in (1,2)

99

Missing/invalid

3

*DOB* is missing or set to a system default

99

Missing/invalid

4

*DOB* *\> EntryDate*

99

Missing/invalid

5

*RelationshipToHoH* \= 1 and *DOB* *\= EntryDate*

99

Missing/invalid

6

\[*DOB* *\+* 105 years\] *<=* **EntryDate**

99

Missing/invalid

7

\[*DOB* *\+* 65 years\] *<=* **EntryDate**

65

65 and older

8

\[*DOB* *\+* 55 years\] *<=* **EntryDate**

64

55 to 64

9

\[*DOB* *\+* 45 years\] *<=* **EntryDate**

54

45 to 54 years

10

\[*DOB* *\+* 35 years\] *<=* **EntryDate**

44

35 to 44 years

11

\[*DOB* *\+* 25 years\] *<=* **EntryDate**

34

25 to 34 years

12

\[*DOB* *\+* 22 years\] *<=* **EntryDate**

24

22 to 24 years

13

\[*DOB* *\+* 18 years\] *<=* **EntryDate**

21

18 to 21 years

14

\[*DOB* + 6 years\] *<=* **EntryDate**

17

6 to 17 years

15

\[*DOB* + 3 years\] *<=* **EntryDate**

5

3 to 5 years

16

\[*DOB* + 1 years\] *<=* **EntryDate**

2

1 to 2 years

17

(other)

0

<1 year

#### Once **EntryAge** is set, an additional adjustment may be required so that the date of birth (or lack thereof) used to calculate age is consistent across all enrollments. For any given **PersonalID**, if there is any enrollment in tlsa\_Enrollment where **EntryAge** = 99, **EntryAge** for all enrollments should be set to 99.

#### ActiveAge

**ActiveAge** is calculated for all enrollments. For enrollments active in the report period, it will only differ from **EntryAge** if the **EntryDate** < ReportStart (and may not differ then).

For inactive enrollments, it is equal to **EntryAge.** (Age for inactive enrollments may be needed to report on active client/household history.)

Priority

Condition

AgeGroup

1

**ExitDate** < ReportStart

**EntryAge**

2

**EntryDate** *>=* ReportStart

**EntryAge**

3

**EntryAge** in (98,99)

**EntryAge**

4

\[*DOB* *\+* 65 years\] *<=* ReportStart

65

5

\[*DOB* *\+* 55 years\] *<=* ReportStart

64

6

\[*DOB* *\+* 45 years\] *<=* ReportStart

54

7

\[*DOB* *\+* 35 years\] *<=* ReportStart

44

8

\[*DOB* *\+* 25 years\] *<=* ReportStart

34

9

\[*DOB* *\+* 22 years\] *<=* ReportStart

24

10

\[*DOB* *\+* 18 years\] *<=* ReportStart

21

11

\[*DOB* + 6 years\] *<=* ReportStart

17

12

\[*DOB* + 3 years\] *<=* ReportStart

5

13

\[*DOB* + 1 years\] *<=* ReportStart

2

14

(other)

0

#### Exit1Age/Exit2Age

**Exit1Age/Exit2Age** are set for all enrollments as they apply to reporting on exit cohorts -1 and -2.

Like **ActiveAge**, they will differ from **EntryAge** only when the enrollment meets the time criteria for inclusion in the cohort (**ExitDate** is between **CohortStart** and **CohortEnd** ) AND the **EntryDate** is before the start of the cohort period. Otherwise, the exit age = **EntryAge**.

Priority

Condition

AgeGroup

1

**ExitDate** not between **CohortStart** and **CohortEnd**

**EntryAge**

2

**ExitDate** between **CohortStart** and **CohortEnd** and **EntryDate** *>=* **CohortStart**

**EntryAge**

3

**EntryAge** in (98,99)

**EntryAge**

4

\[*DOB* *\+* 65 years\] *<=* **CohortStart**

65

5

\[*DOB* *\+* 55 years\] *<=* **CohortStart**

64

6

\[*DOB* *\+* 45 years\] *<=* **CohortStart**

54

7

\[*DOB* *\+* 35 years\] *<=* **CohortStart**

44

8

\[*DOB* *\+* 25 years\] *<=* **CohortStart**

34

9

\[*DOB* *\+* 22 years\] *<=* **CohortStart**

24

10

\[*DOB* *\+* 18 years\] *<=* **CohortStart**

21

11

\[*DOB* + 6 years\] *<=* **CohortStart**

17

12

\[*DOB* + 3 years\] *<=* **CohortStart**

5

13

\[*DOB* + 1 years\] *<=* **CohortStart**

2

14

(other)

0

## Household Types (tlsa\_HHID)

tlsa\_HHID

tlsa\_Enrollment

tlsa\_CohortDates

This section defines the logic associated with determining household type for each active household.

It uses the tlsa\_Enrollment **EntryAge**, **ActiveAge**, **Exit1Age**, and **Exit2Age** values set in the previous step to set tlsa\_HHID **EntryHHType, ActiveHHType, Exit1HHType** and **Exit2HHType**.

### Relevant Data

#### Source

**tlsa\_Enrollment**

HouseholdID

EntryDate

ExitDate

EntryAge

ActiveAge

Exit1Age

Exit2Age

**tlsa\_CohortDates**

Cohort

CohortStart

CohortEnd

#### Target

**tlsa\_HHID**

**EntryHHType**

**ActiveHHType**

**Exit1HHType**

**Exit2HHType**

### Logic

Household type for each **HouseholdID** is based on counts of distinct **PersonalID**s in tlsa\_Enrollment by age status – adult, child, or unknown – for enrollments associated with the *HouseholdID*.

Age status is based on the **Entry/Active/Exit1/Exit2Age** value for each enrollment, as shown below.

Age Status

Age

Entry/Active/Exit1/Exit2Age

Adult

18 and over

Between 21 and 65

Child

Under 18

Between 0 and 17

Unknown

Unknown

98 or 99

The criteria below are mutually exclusive; it is not necessary to apply them in priority order.

\# Adults

\# Children

\# Unknown Age

HHType

LSA Value

\>= 1

0

0

AO (Adult-only)

1

\>= 1

\>= 1

(any)

AC (Adult-child)

2

0

\>= 1

0

CO (Child-only)

3

(any)

0

\>= 1

UN (Unknown)

99

0

(any)

\>= 1

UN (Unknown)

99

#### EntryHHType

Calculate for tlsa\_HHID based on **EntryAge** for all records in tlsa\_Enrollment with the same **HouseholdID**.

**EntryHHType** is based on all household members’ age at the time of their own project entry. It is not a point-in-time determination – for households whose members entered at different times, it may differ from the household type as of the head of household’s entry and/or household members’ entry dates.

#### ActiveHHType

If tlsa\_HHID.**EntryDate** is >= ReportStart or tlsa\_HHID.**ExitDate** < ReportStart, **ActiveHHType** = **EntryHHType**.

For all other households, **ActiveHHType** is based on **ActiveAge** values for records in tlsa\_Enrollment with the same **HouseholdID** where **ExitDate** is NULL or **ExitDate** >= ReportStart. In other words, if the household is active in the report period, household type is based only on the ages of household members who were also active in the report period.

**ActiveHHType** is set for all household enrollments, but it is not an indicator that the household meets all of the criteria for inclusion in the active cohort, which are described in section [5.1 Get Active and AIR HouseholdIDs](#_Get_Active_HouseholdIDs_1).

#### Exit1HHType/Exit2HHType

If tlsa\_HHID.**EntryDate** is >= **CohortStart** or tlsa\_HHID.**ExitDate** < **CohortStart**, **Exit(1 or 2)HHType** = **EntryHHType**.

For all other households, **Exit1HHType** is based on **Exit1Age** and **Exit2HHType** is based on **Exit2Age** for all records in tlsa\_Enrollment with the same **HouseholdID** and:

-   tlsa\_Enrollment.EntryDate < CohortEnd; and
-   tlsa\_Enrollment.**ExitDate** is null or tlsa\_Enrollment.**ExitDate** >= **CohortStart**

# HMIS Business Logic: Project Descriptor Data for Export

## Get Project.csv Records / lsa\_Project

lsa\_Project

hmis\_Project

hmis\_ProjectCoC

lsa\_Report

LSAScope = 2 ProjectIDs

Records exported to Project.csv are included in the LSA output and uploaded to HDX 2.0.

LSA business logic in subsequent steps is dependent on the identification of projects that meet the criteria for inclusion. References to lsa\_Project.**ProjectID** are to these projects; references to hmis\_Project records are to all projects in HMIS.

### Relevant Data

#### Source

**lsa\_Report**

ReportStart

ReportEnd

ReportCoC

**hmis\_Project**

(all columns – see below)

**hmis\_ProjectCoC**

CoCCode

#### Target

HDX 2.0 validation of Project.csv is generally consistent with the HMIS CSV specifications; differences are noted in the column descriptions below.

lsa\_Project

Column Description

ProjectID

(See HMIS CSV documentation)

OrganizationID

(See HMIS CSV documentation)

ProjectName

Truncate HMIS value in export if >200 characters

ProjectCommonName

n/a – will not be imported

OperatingStartDate

(See HMIS CSV documentation)

OperatingEndDate

If not NULL, date must be > LookbackDate

ContinuumProject

Must = 1

ProjectType

Must be in (0,1,2,3,8,9,10,13)

HousingType

Must be in (1,2,3) unless *RRHSubType* = 1

RRHSubType

Must be NULL unless *ProjectType* = 13; otherwise, must be in (1,2)

ResidentialAffiliation

Must be NULL unless *RRHSubType* = 1; otherwise, must be in (0,1)

TargetPopulation

(See HMIS CSV documentation)

HOPWAMedAssistedLivingFac

(See HMIS CSV documentation)

PITCount

(See below)

DateCreated

(See HMIS CSV documentation)

DateUpdated

(See HMIS CSV documentation)

UserID

n/a – will not be imported

DateDeleted

NULL

ExportID

Must match **ReportID** in LSAReport.csv

### Logic

#### Record Selection: Systemwide LSA

When the **LSAScope** is Systemwide (1) or HIC (3), export records for projects where:

-   OperatingEndDate is NULL; or
    -   OperatingEndDate > LookbackDate and > OperatingStartDate
-   ContinuumProject = Yes (1)
-   ProjectCoC.*CoCCode* = ReportCoC
-   *ProjectType* is ES (0 or 1), SH (8), TH (2), RRH (13), PSH (3), or OPH (9 or 10)

All project records that meet the criteria above should be included.

The export of PDDE data includes records for permanent housing project types ‘PH – Housing Only’ (9) and ‘PH – Housing with Services (no disability required for entry)’ (10). With the exception of counts of active clients in Section 9.6 when **LSAScope** = 3 (HIC), this is the only context in which data associated with ProjectTypes 9 and 10 are relevant to the LSA.

#### Record Selection: Project-Focused LSA

If the LSA is being generated for a subset of projects, export records for projects where:

-   OperatingEndDate is NULL; or
    -   OperatingEndDate > LookbackDate and > OperatingStartDate
-   ProjectCoC.*CoCCode* = ReportCoC
-   *ProjectID* is in \[list of user-selected *ProjectID*s\]
    -   Section 3.1 requires that the projects available to a user for selection when entering report parameters must be limited to *ProjectType*s ES (0 or 1), SH (8), TH (2), RRH (13), and PSH (3), so records for other project types are never included when **LSAScope** = 2.

#### PITCount

There is no requirement for an HMIS to collect point-in-time counts for non-participating projects, nor is there an HMIS data element defined for this purpose. As such, users generally enter these counts directly into the HDX for the HIC and, as noted above, the value of this column may always be NULL.

However, in systems that do allow manual entry of point-in-time counts, if the **PITCount** column includes a value, the HDX will incorporate it into the HIC if **HMISParticipationType** <> 1 on the date of the HIC.

## Get Organization.csv Records / lsa\_Organization

hmis\_Organization

lsa\_Project

lsa\_Organization

Records exported to Organization.csv are included in the LSA output and uploaded to HDX 2.0.

LSA business logic does not utilize Organization data beyond the export of records.

### Relevant Data

#### Source

**lsa\_Project**

OrganizationID

**hmis\_Organization**

(all columns – see below)

#### Target

HDX 2.0 validation of Organization.csv is generally consistent with the HMIS CSV specifications; differences are noted in the column descriptions below.

lsa\_Organization

Column Description

OrganizationID

(See HMIS CSV documentation)

OrganizationName

Truncate HMIS value in export if >200 characters

VictimServiceProvider

Must be in (0,1) – there must be a valid response in this column

OrganizationCommonName

n/a - will not be imported

DateCreated

(See HMIS CSV documentation)

DateUpdated

(See HMIS CSV documentation)

UserID

n/a - will not be imported

DateDeleted

NULL

ExportID

Must match LSAReport.**ReportID**

### Logic

Export all Organization records where:

-   OrganizationID = lsa\_Project.**OrganizationID**

Validation for Organization.csv will require exactly one record for every *OrganizationID* included in Project.csv. CoCs will be required to make corrections in HMIS if this is not the case.

Populate **ExportID** with LSAReport.**ReportID***;* the data type for **ExportID** is a string, so **ReportID** must be converted appropriately.

**OrganizationCommonName** and **UserID** may be exported as NULL; regardless of their values, they will not be imported into the HDX 2.0.

## Get Funder.csv Records / lsa\_Funder

lsa\_Funder

hmis\_Funder

lsa\_Report

lsa\_Project

Records exported to Funder.csv are included in the LSA output and uploaded to HDX 2.0.

LSA business logic does not utilize Funder data beyond the export of records.

### Relevant Data

#### Source

**lsa\_Project**

ProjectID

**lsa\_Report**

ReportStart

**hmis\_Funder**

(all columns – see below)

#### Target

HDX 2.0 validation of Funder.csv is generally consistent with the HMIS CSV specifications; differences are noted in the column descriptions below.

lsa\_Funder

Column Description

FunderID

(See HMIS CSV documentation)

ProjectID

(See HMIS CSV documentation)

Funder

(See HMIS CSV documentation)

OtherFunder

(See HMIS CSV documentation)

GrantID

n/a - will not be imported

StartDate

(See HMIS CSV documentation)

EndDate

(See HMIS CSV documentation)

DateCreated

(See HMIS CSV documentation)

DateUpdated

(See HMIS CSV documentation)

UserID

n/a - will not be imported

DateDeleted

NULL

ExportID

Must match LSAReport.**ReportID**

### Logic

Export all Funder records where:

-   ProjectID = lsa\_Project.**ProjectID**;
-   *EndDate* is NULL or (*EndDate* >= ReportStart and *EndDate* > *StartDate*)

Validation for Funder.csv includes the requirements that there must be at least one Funder record for every **ProjectID** included in Project.csv that is active during the report period (i.e., where Project.**OperatingEndDate** > ReportStart or Project.**OperatingEndDate** is NULL).

-   If there are no Funder records that meet the criteria for inclusion for any given project that is active during the report period, CoCs will be required to create them.
-   If there are Funder records active during the report period for inactive projects, CoCs will be required to enter an end date for those records that is consistent with Project.**OperatingEndDate**.

Populate **ExportID** with LSAReport.**ReportID***;* the data type for **ExportID** is a string, so **ReportID** must be converted appropriately.

**GrantID** and **UserID** may be exported as NULL; regardless of their values, they will not be imported into the HDX 2.0.

## Get ProjectCoC.csv Records / lsa\_ProjectCoC

lsa\_ProjectCoC

hmis\_ProjectCoC

lsa\_Report

lsa\_Project

Records exported to ProjectCoC.csv are included in the LSA output and uploaded to HDX 2.0.

LSA business logic uses ProjectCoC data to:

-   Select project records for export to Project.csv; and
-   Report on geography type for active households in LSAHousehold.

### Relevant Data

#### Source

**lsa\_Project**

ProjectID

**lsa\_Report**

ReportCoC

**hmis\_ProjectCoC**

(all columns – see below)

#### Target

HDX 2.0 validation of ProjectCoC.csv is generally consistent with the HMIS CSV specifications; differences are noted in the column descriptions below.

lsa\_ProjectCoC

Column Description

ProjectCoCID

(See HMIS CSV documentation)

ProjectID

(See HMIS CSV documentation)

CoCCode

(See HMIS CSV documentation)

Geocode

Not NULL. *Geocode* has a data type of string and must be exported as such / padded with double quotes so that leading zeroes are not omitted.

Address1

(See HMIS CSV documentation)

Address2

(See HMIS CSV documentation)

City

(See HMIS CSV documentation)

State

(See HMIS CSV documentation)

ZIP

Not NULL. Note that *ZIP* has a data type of string and must be exported as such / padded with double quotes so that leading zeroes are not omitted. If ZIP codes are collected with a four-digit suffix, only the first five digits should be exported.

GeographyType

Not NULL / in (1,2,3)

DateCreated

(See HMIS CSV documentation)

DateUpdated

(See HMIS CSV documentation)

UserID

n/a - will not be imported

DateDeleted

NULL

ExportID

Must match LSAReport.**ReportID**

### Logic

There must be exactly one ProjectCoC record for every *ProjectID* included in Project.csv. Export only records where *CoCCode* = ReportCoC.

The HMIS CSV allows NULL values for *Geocode*, *ZIP* and *GeographyType.* However, they are mandatory for the LSA and upload validation will fail if those columns do not contain valid values.

Populate **ExportID** with LSAReport.**ReportID***;* the data type for **ExportID** is a string, so **ReportID** must be converted appropriately.

**UserID** may be exported as NULL; regardless of value, it will not be imported into the HDX 2.0.

## Get Inventory.csv Records / lsa\_Inventory

lsa\_Inventory

hmis\_Inventory

lsa\_Report

lsa\_Project

Records exported to Inventory.csv are included in the LSA output and uploaded to HDX 2.0.

LSA business logic does not utilize Inventory data beyond the export of records.

### Relevant Data

#### Source

**lsa\_Report**

ReportStart

ReportEnd

ReportCoC

**lsa\_Project**

ProjectID

ProjectType

**hmis\_Inventory**

(all columns – see below)

#### Target

HDX 2.0 validation of Inventory.csv is generally consistent with the HMIS CSV specifications; differences are noted in the column descriptions below.

lsa\_Inventory

Column Description

InventoryID

(See HMIS CSV documentation)

ProjectID

(See HMIS CSV documentation)

CoCCode

(See HMIS CSV documentation)

HouseholdType

In (1,3,4)

Availability

NULL unless Project.*ProjectType* in (0,1); otherwise, in (1,2,3)

UnitInventory

(See HMIS CSV documentation)

BedInventory

Total number of beds equal to the sum of the seven columns below

CHVetBedInventory

Count of dedicated beds for chronically homeless veterans; may not be NULL

YouthVetBedInventory

Count of dedicated beds for veterans between 18 and 24; may not be NULL

VetBedInventory

Count of dedicated beds for veterans with no requirements based on CH status or age; may not be NULL

CHYouthBedInventory

Count of dedicated beds for chronically homeless youth between 18 and 24; may not be NULL

YouthBedInventory

Count of dedicated beds for youth between 18 and 24; may not be NULL

CHBedInventory

Count of dedicated beds for chronically homeless clients with no requirements based on veteran status or age; may not be NULL

OtherBedInventory

Count of beds for people experiencing homelessness with no requirements based on CH status, veteran status, or age; may not be NULL

ESBedType

NULL unless Project.*ProjectType* in (0,1); otherwise, in (1,2,3)

InventoryStartDate

< ReportEnd

InventoryEndDate

NULL or >= ReportStart

DateCreated

(See HMIS CSV documentation)

DateUpdated

(See HMIS CSV documentation)

UserID

n/a - will not be imported

DateDeleted

NULL

ExportID

Must match LSAReport.**ReportID**

### Logic

The HMIS CSV allows NULL values for *CHVetBedInventory*, *YouthVetBedInventory*, *VetBedInventory*, *CHYouthBedInventory*, *YouthBedInventory*, *CHBedInventory*, and *OtherBedInventory*. They are mandatory for the LSA and upload validation will fail if those columns do not have valid non-NULL values. If the project does not have beds in a given category, the value should be 0.

*BedInventory* must be equal to the sum of those columns. For projects with no beds dedicated for CH, youth, or veteran populations, *BedInventory* = *OtherBedInventory*.

Export all Inventory records where:

-   ProjectID = lsa\_Project.**ProjectID**;
-   Project.**ProjectType** <> 13 or Project.**RRHSubType** = 2;
-   Inventory.*CoCCode =* ReportCoC; and
-   InventoryEndDate is NULL or (InventoryEndDate >= ReportStart and InventoryEndDate > InventoryStartDate)

Validation for Inventory.csv will require at least one Inventory record for every non-RRH-SO **ProjectID** included in Project.csv that is active during the report period (i.e., where Project.**OperatingEndDate** > ReportStart or Project.**OperatingEndDate** is NULL).

-   If there are no Inventory records that meet the criteria for inclusion for any given project that is active during the report period, CoCs must enter them into HMIS and re-run the LSA.
-   If there are Inventory records active during the report period for inactive projects, CoCs will be required to enter an end date for those records that is consistent with Project.**OperatingEndDate**.

Populate *ExportID* with LSAReport.**ReportID***;* the data type for *ExportID* is a string, so values must be padded with quotes.

*UserID* may be exported as NULL; regardless of its value, it will not be imported into the HDX 2.0.

## Get HMISParticipation.csv Records / lsa\_HMISParticipation

lsa\_HMISParticipation

hmis\_HMISParticipation

lsa\_Report

lsa\_Project

Records exported to HMISParticipation.csv are included in the LSA output and uploaded to HDX 2.0.

### Relevant Data

#### Source

**lsa\_Report**

ReportStart

ReportEnd

ReportCoC

**lsa\_Project**

ProjectID

ProjectType

OperatingStartDate

OperatingEndDate

**hmis\_HMISParticipation**

(all columns – see below)

#### Target

HDX 2.0 validation of HMISParticipation.csv is generally consistent with the HMIS CSV specifications; differences are noted in the column descriptions below.

lsa\_HMISParticipation

Column Description

HMISParticipationID

(See HMIS CSV documentation)

ProjectID

(See HMIS CSV documentation)

HMISParticipationType

(See HMIS CSV documentation)

HMISParticipationStatusStartDate

(See HMIS CSV documentation)

HMISParticipationStatusEndDate

(See HMIS CSV documentation)

DateCreated

(See HMIS CSV documentation)

DateUpdated

(See HMIS CSV documentation)

UserID

n/a - will not be imported

DateDeleted

NULL

ExportID

Must match LSAReport.**ReportID**

### Logic

Export all HMISParticipation records where:

-   ProjectID = lsa\_Project.**ProjectID**;
-   Project.**OperatingEndDate** is null or **OperatingEndDate** > ReportStart

Validation for HMISParticipation.csv will require that HMIS participation status is documented for – at a minimum – all dates in the report period on which the project was operational. If these records do not exist, CoCs must enter them in HMIS and re-run the LSA.

Populate **ExportID** with LSAReport.**ReportID***;* the data type for **ExportID** is a string, so values must be padded with quotes.

**UserID** may be NULL; regardless of its value, it will not be imported into the HDX 2.0.

## Get Affiliation.csv Records / lsa\_Affiliation

lsa\_Affiliation

hmis\_Affiliation

lsa\_Report

lsa\_Project

Records exported to Inventory.csv are included in the LSA output and uploaded to HDX 2.0.

LSA business logic does not utilize Inventory data beyond the export of records.

### Relevant Data

#### Source

**lsa\_Report**

ReportStart

ReportEnd

ReportCoC

**lsa\_Project**

ProjectID

ProjectType

RRHSubType

ResidentialAffiliation

OperatingEndDate

**hmis\_Affiliation**

(all columns – see below)

#### Target

HDX 2.0 validation of Affiliation.csv is generally consistent with the HMIS CSV specifications; differences are noted in the column descriptions below.

lsa\_Affiliation

Column Description

AffiliationID

(See HMIS CSV documentation)

ProjectID

Must match a *ProjectID* in Project.csv where *RRHSubType* = 1 and *ResidentialAffiliation* \= 1

ResProjectID

(See HMIS CSV documentation)

DateCreated

(See HMIS CSV documentation)

DateUpdated

(See HMIS CSV documentation)

UserID

n/a - will not be imported

DateDeleted

NULL

ExportID

Must match LSAReport.**ReportID**

### Logic

Export all Affiliation records where:

-   ProjectID = lsa\_Project.**ProjectID**;
-   Project.**RRHSubType** \= 1; and
-   Project.ResidentialAffiliation = 1; and
-   Project.**OperatingEndDate** is null or **OperatingEndDate** > ReportStart

Validation for Affiliation.csv requires at least one record for every RRH-SO project identified as having a residential affiliation in Project.csv. If these records do not exist, CoCs must enter them in HMIS and re-run the LSA.

Populate **ExportID** with LSAReport.**ReportID***;* the data type for **ExportID** is a string, so values must be padded with quotes.

**UserID** may be exported as NULL; regardless of its value, it will not be imported into the HDX 2.0.

# HMIS Business Logic: LSAPerson

The data type for every column in LSAPerson is integer; no value may be NULL.

#

Column Name

Notes

1

**RowTotal**

A count of distinct PersonalIDs for active clients, grouped by all values in the other columns. Must be > 0.

2

**RaceEthnicity**

See [5.4 LSAPerson Demographics](#_LSAPerson_Demographics)

3

**VetStatus**

See [5.4 LSAPerson Demographics](#_LSAPerson_Demographics)

4

**DisabilityStatus**

See [5.4 LSAPerson Demographics](#_LSAPerson_Demographics)

5

**CHTime**

See [5.5 Time Spent in ES/SH or on the Street](#_Toc34144028)

through [5.10 CHTime and CHTimeStatus](#_CHTime_and_CHTimeStatus)

6

**CHTimeStatus**

See [5.5 Time Spent in ES/SH or on the Street](#_Toc34144028)

through [5.10 CHTime and CHTimeStatus](#_CHTime_and_CHTimeStatus)

7

**DVStatus**

See [5.4 LSAPerson Demographics](#_LSAPerson_Demographics)

8

**ESTAgeMin**

See [5.11 EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax](#_EST/RRH/PSHAgeMin_and_EST/RRH/PSHAg)

9

**ESTAgeMax**

See [5.11 EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax](#_EST/RRH/PSHAgeMin_and_EST/RRH/PSHAg)

10

**HHTypeEST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

11

**HoHEST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

12

**AdultEST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

13

**AIRAdultEST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

14

**HHChronicEST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

15

**HHVetEST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

16

**HHDisabilityEST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

17

**HHFleeingDVEST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

18

**HHAdultAgeAOEST**

See [5.14 Adult Age Population Identifiers](#_Adult_Age_Population)

19

**HHAdultAgeACEST**

See [5.14 Adult Age Population Identifiers](#_Adult_Age_Population)

20

**HHParentEST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

21

**AC3PlusEST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

22

**AIREST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

23

**AIRHoHEST**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

24

**RRHAgeMin**

See [5.11 EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax](#_EST/RRH/PSHAgeMin_and_EST/RRH/PSHAg)

25

**RRHAgeMax**

See [5.11 EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax](#_EST/RRH/PSHAgeMin_and_EST/RRH/PSHAg)

26

**HHTypeRRH**

See [5.12 HHTypeEST/RRH/PSH/ES/SH/TH](#_HHTypeEST/RRH/PSH_-_LSAPerson)

27

**HoHRRH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

28

**AdultRRH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

29

**AIRAdultRRH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

30

**HHChronicRRH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

31

**HHVetRRH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

32

**HHDisabilityRRH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

33

**HHFleeingDVRRH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

34

**HHAdultAgeAORRH**

See [5.14 Adult Age Population Identifiers](#_Adult_Age_Population)

35

**HHAdultAgeACRRH**

See [5.14 Adult Age Population Identifiers](#_Adult_Age_Population)

36

**HHParentRRH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

37

**AC3PlusRRH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

38

**AIRRRH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

39

**AIRHoHRRH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

40

**PSHAgeMin**

See [5.11 EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax](#_EST/RRH/PSHAgeMin_and_EST/RRH/PSHAg)

41

**PSHAgeMax**

See [5.11 EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax](#_EST/RRH/PSHAgeMin_and_EST/RRH/PSHAg)

42

**HHTypePSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

43

**HoHPSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

44

**AdultPSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

45

**AIRAdultPSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

46

**HHChronicPSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

47

**HHVetPSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

48

**HHDisabilityPSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

49

**HHFleeingDVPSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

50

**HHAdultAgeAOPSH**

See [5.14 Adult Age Population Identifiers](#_Adult_Age_Population)

51

**HHAdultAgeACPSH**

See [5.14 Adult Age Population Identifiers](#_Adult_Age_Population)

52

**HHParentPSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

53

**AC3PlusPSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

54

**AIRPSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

55

**AIRHoHPSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

56

**RRHSOAgeMin**

See [5.11 EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax](#_EST/RRH/PSHAgeMin_and_EST/RRH/PSHAg)

57

**RRHSOAgeMax**

See [5.11 EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax](#_EST/RRH/PSHAgeMin_and_EST/RRH/PSHAg)

58

**HHTypeRRHSONoMI**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

59

**HHTypeRRHSOMI**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

60

**HHTypeES**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

61

**HHTypeSH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

62

**HHTypeTH**

See [5.13 Project Group and Population Household Types](#_Set_Population_Identifiers_4)

63

**HIV**

See [5.4 LSAPerson Demographics](#_LSAPerson_Demographics)

64

**SMI**

See [5.4 LSAPerson Demographics](#_LSAPerson_Demographics)

65

**SUD**

See [5.4 LSAPerson Demographics](#_LSAPerson_Demographics)

66

**ReportID**

Must match ReportID in LSAReport; see [4.1 Report Metadata for LSAReport](#_Report_Metadata_for)

## Identify Active and Active in Residence (AIR) HouseholdIDs

lsa\_Report

lsa\_Project

tlsa\_HHID

tlsa\_HHID

This section defines the logic associated with identifying enrollments for heads of household that meet the criteria for inclusion in the active cohort.

It uses data in lsa\_Report and lsa\_Project as parameters applied to tlsa\_HHID. As described, the **Active** column in tlsa\_HHID is set to 1 for each active *HouseholdID*.

References to active **HouseholdID**s and/or any of the columns included in tlsa\_HHID mean records where **Active** = 1 and the column values as they are set in this and subsequent steps.

### Relevant Data

#### Source

**lsa\_Report**

ReportStart

ReportEnd

ReportCoC

**lsa\_Project**

ProjectID

**tlsa\_HHID**

EnrollmentID

LSAProjectType

EntryDate

MoveInDate

ExitDate

#### Target

The logic associated with values for columns with names in **bold** below is described in this step. The business logic associated with other columns is described in subsequent steps.

**tlsa\_HHID**

**Column Description**

**Active**

1 identifies **HouseholdID**s included in the active cohort

**AIR**

1 identifies the subset of **HouseholdID**s in the active cohort where the head of household’s enrollment includes at least one bed night during the report period

### Logic

#### Active

Set **Active** \= 1 for tlsa\_HHID.**HouseholdID**s where:

-   There is a record for the **ProjectID** in lsa\_Project; and
-   **EntryDate** <= ReportEnd; and
-   ExitDate is NULL or ExitDate >= ReportStart

#### AIR

Set **AIR** = 1 for tlsa\_HHID.**HouseholdID**s where:

-   **Active** = 1; and:
-   **ExitDate** \> ReportStart or **ExitDate** is NULL; and
    -   **LSAProjectType** in (0, 2,8); or
    -   **LSAProjectType** \= 1 and **LastBedNight** between ReportStart and ReportEnd; or
    -   LSAProjectType in (3,13) and MoveInDate is not NULL

(Note: RRH-SO projects are considered non-residential and enrollments are excluded from consideration.)

## Identify Active and Active in Residence (AIR) Enrollments

lsa\_Report

tlsa\_HHID

tlsa\_Enrollment

This section defines the logic associated with identifying all active enrollments associated with the active *HouseholdID*s identified in the previous step.

It uses data in lsa\_Report and tlsa\_HHID as parameters applied to tlsa\_Enrollment and sets the **Active** column in tlsa\_Enrollment to 1 for active enrollments.

References in subsequent sections to active enrollments and of the columns in tlsa\_Enrollment mean the column values as they are set in this and subsequent steps.

### Relevant Data

#### Source

**tlsa\_HHID**

HouseholdID

Active

**tlsa\_Enrollment**

EnrollmentID

HouseholdID

EntryDate

MoveInDate

ExitDate

#### Target

The logic associated with values for columns with names in **bold** below is described in this step. The business logic associated with other columns is described in subsequent steps.

**tlsa\_Enrollment**

**Active**

**AIR**

### Logic

#### Active

**Active** = 1 is set to identify the subset of enrollments in tlsa\_Enrollment where:

-   The **HouseholdID** matches a **HouseholdID** in tlsa\_HHID where **Active** = 1
-   **ExitDate** is NULL or **ExitDate** >= ReportStart

#### AIR

**AIR** = 1 is set to identify the subset of enrollments in tlsa\_Enrollment where:

-   The **HouseholdID** matches a **HouseholdID** in tlsa\_HHID where **AIR** = 1; and
-   **EntryDate** <= ReportEnd; and
-   **ExitDate** is NULL or **ExitDate** > ReportStart; and
    -   **LSAProjectType** in (0,2,8); or
    -   **LSAProjectType** \= 1 and **LastBedNight** between ReportStart and ReportEnd; or
    -   **LSAProjectType** in (3,13), **MoveInDate** <= ReportEnd

(Note: RRH-SO projects are considered non-residential and enrollments are excluded from consideration.)

## Get Active Clients for LSAPerson

tlsa\_Enrollment

tlsa\_Person

The tlsa\_Person data construct holds one record for each distinct *PersonalID* in tlsa\_Enrollment where **Active** = 1. It is a client-level version of the aggregate LSAPerson data and is used to set values for each LSA reporting category – **RaceEthnicity**, **VetStatus**, etc. – for each client. It includes all columns from LSAPerson.csv other than **RowTotal** and **ReportID**, as well as several columns which are used as a reference to simplify business logic but do not correlate to a column in LSAPerson.

### Relevant Data

#### Source

tlsa\_Enrollment

PersonalID

Active

#### Target

The logic associated with values for columns with names in **bold** below is described in this step. The business logic associated with other columns is described in subsequent steps.

tlsa\_Person

Column Description

PersonalID

Distinct **PersonalID**s tlsa\_Enrollment where **Active** = 1

The count of **PersonalID**s, grouped by the values in all other columns, is used to populate the **RowTotal** column of LSAPerson.

HoHAdult

(Does not correlate to a column in LSAPerson.csv)

Identifies whether the client was served as an adult, a head of household, or both for any active enrollment (0 = No, 1 = Adult, 2=HoH, 3 = Adult and HoH); used to simplify later steps.

See section [5.4 LSAPerson Demographics](#_LSAPerson_Demographics)

CHStart

(Does not correlate to a column in LSAPerson.csv)

Where **HoHAdult** > 0: \[**LastActive** – 3 years + 1 day\]; used to calculate **CHTime**.

See section [5.5 Time Spent in ES/SH or on the Street – LSAPerson](#_ES/SH/Street_Time_–).

LastActive

(Does not correlate to a column in LSAPerson.csv)

Where **HoHAdult** > 0, the client’s last active date in the report period; used to calculate **CHTime.**

See section [5.5 Time Spent in ES/SH or on the Street – LSAPerson](#_ES/SH/Street_Time_–).

RaceEthnicity

Race and Ethnicity all persons

See section 5.4 LSAPerson Demographics

VetStatus

Veteran Status for adults; not applicable (value = -1) for children

See section 5.4 LSAPerson Demographics

DisabilityStatus

Disability Status for adults and heads of household based on records of *3.08 Disabling Condition* for all active enrollments; not applicable (value = -1) for non-HoH children

See section 5.4 LSAPerson Demographics

CHTime

For adults and heads of household, the total number of days in ES/SH or on the street in the three years prior to the client's last active date in the report period. Based on data from active and inactive enrollments, the count of days excludes any dates housed in continuum TH/RRH/PSH projects, but otherwise includes:

-   Dates between entry and exit in continuum entry-exit ES and SH projects; and
-   Bed-night dates in night-by-night shelters; and
-   Dates between 3.917 *DateToStreetESSH* and *EntryDate* for ES/SH/TH/RRH/PSH projects; and
-   Dates between any RRH/PSH *EntryDate* and the earlier of *MoveInDate* or *ExitDate* when *LivingSituation* is ES/SH/Street; or
-   For people who do not meet the time criteria for chronic homelessness based on the above, may be set based on 3.917 number of months and number of times homeless in the past three years from ES/SH/TH/RRH/PSH enrollments with entry dates in the year ending on the client's last active date.

See sections [5.5](#_ES/SH/Street_Time_–)\-5.10 for associated business logic.

CHTimeStatus

For clients with 365+ days of ES/SH/Street time in the three years prior to their last active date (**CHTime**), specifies whether the date ranges are consistent with the time criteria for chronic homelessness. Otherwise not applicable.

See sections [5.5](#_ES/SH/Street_Time_–)\-5.10 for associated business logic.

DVStatus

DV Status for adults and heads of household based on records of 4.11 Domestic Violence for all active enrollments; not applicable (value = -1) for non-HoH children

See section 5.4 LSAPerson Demographics

ESTAgeMin

The person’s minimum age at the later of ReportStart and *EntryDate* for any active ES/SH/TH enrollment.

ESTAgeMax

The person’s maximum age at the later of ReportStart and *EntryDate* for any active ES/SH/TH enrollment.

HHTypeEST

Household type(s) for active ES/SH/TH enrollments.

HoHEST

Household type(s) for active ES/SH/TH enrollments as a head of household

AdultEST

Household type(s) for active enrollments in ES/SH/TH projects as an adult.

AIRAdultEST

Household type(s) in which adults had at least one ES/SH/TH bed night in the report period.

HHChronicEST

Population identifier; household type(s) in which the person was served in ES/SH/TH projects in household with a chronically homeless adult or HoH.

HHVetEST

Population identifier; household type(s) in which the person was served in ES/SH/TH projects in household with a veteran.

HHDisabilityEST

Population identifier; household type(s) in which the person was served in ES/SH/TH projects in household with a disabled adult or HoH.

HHFleeingDVEST

Population identifier; household type(s) in which the person was served in ES/SH/TH projects in household with an adult or HoH fleeing domestic violence.

HHAdultAgeAOEST

Population identifier based on the combination of adult household members’ ages for ES/SH/TH clients served in AO households.

HHAdultAgeACEST

Population identifier based on the combination of adult household members’ ages for ES/SH/TH clients served in AC households.

HHParentEST

Population identifier; household type(s) in which the person was served in ES/SH/TH projects in a household that includes at least one member whose RelationshipToHoH is 'Child'.

AC3PlusEST

Population identifier; indicates whether or not the person was served in ES/SH/TH projects in an AC household with 3 or more household members under 18.

AIREST

Household type(s) for enrollments with at least one bed night in the report period for ES/SH/TH.

AIRHoHEST

Household type(s) for enrollments with at least one bed night in the report period for ES/SH/TH as head of household.

RRHAgeMin

The person’s minimum age at the later of ReportStart and *EntryDate* for any active RRH enrollment.

RRHAgeMax

The person’s maximum age at the later of ReportStart and *EntryDate* for any active RRH enrollment.

HHTypeRRH

Household type(s) in which the person was served in an RRH project.

HoHRRH

Household type(s) in which the person was served in an RRH project as a head of household

AdultRRH

Household type(s) for active enrollments in RRH projects as an adult.

AIRAdultRRH

Household type(s) in which adults had at least one RRH bed night in the report period.

HHChronicRRH

Population identifier; household type(s) in which the person was served an RRH project in household with a chronically homeless adult or HoH.

HHVetRRH

Population identifier; household type(s) in which the person was served an RRH project in household with a veteran.

HHDisabilityRRH

Population identifier; household type(s) in which the person was served an RRH project in household with a disabled adult or HoH.

HHFleeingDVRRH

Population identifier; household type(s) in which the person was served an RRH project in household with an adult or HoH fleeing domestic violence.

HHAdultAgeAORRH

Population identifier based on the combination of adult household members’ ages for RRH clients served in AO households.

HHAdultAgeACRRH

Population identifier based on the combination of adult household members’ ages for RRH clients served in AO households.

HHParentRRH

Population identifier; household type(s) in which the person was served an RRH project in a household that includes at least one member whose RelationshipToHoH is 'Child'.

AC3PlusRRH

Population identifier; indicates whether or not the person was served an RRH project in an AC household with 3 or more household members under 18.

AIRRRH

Household type(s) for enrollments with at least one bed night in the report period for RRH.

AIRHoHRRH

Household type(s) for enrollments with at least one bed night in the report period for RRH as head of household.

PSHAgeMin

The person’s minimum age at the later of ReportStart and *EntryDate* for any active PSH enrollment.

PSHAgeMax

The person’s maximum age at the later of ReportStart and *EntryDate* for any active PSH enrollment.

HHTypePSH

Household type(s) for PSH enrollments.

HoHPSH

Household type(s) in which the person was served in an PSH project as a head of household

AdultPSH

Household type(s) for active enrollments in PSH projects as an adult.

AIRAdultPSH

Household type(s) in which adults had at least one PSH bed night in the report period.

HHChronicPSH

Population identifier; household type(s) in which the person was served an PSH project in household with a chronically homeless adult or HoH.

HHVetPSH

Population identifier; household type(s) in which the person was served an PSH project in household with a veteran.

HHDisabilityPSH

Population identifier; household type(s) in which the person was served an PSH project in household with a disabled adult or HoH.

HHFleeingDVPSH

Population identifier; household type(s) in which the person was served an PSH project in household with an adult or HoH fleeing domestic violence.

HHAdultAgeAOPSH

Population identifier based on the combination of adult household members’ ages for PSH clients served in AO households.

HHAdultAgeACPSH

Population identifier based on the combination of adult household members’ ages for PSH clients served in AO households.

HHParentPSH

Population identifier; household type(s) in which the person was served an PSH project in a household that includes at least one member whose RelationshipToHoH is 'Child'.

AC3PlusPSH

Population identifier; indicates whether or not the person was served an PSH project in an AC household with 3 or more household members under 18.

AIRPSH

Household type(s) for enrollments with at least one bed night in the report period for PSH.

AIRHoHPSH

Household type(s) for enrollments with at least one bed night in the report period for PSH as head of household.

RRHSOAgeMin

The minimum age at the later of ReportStart and EntryDate for any RRH-SO enrollment.

RRHSOAgeMax

The maximum age at the later of ReportStart and EntryDate for any RRH-SO enrollment.

HHTypeRRHSONoMI

Household type(s) for active enrollments in RRH-SO projects with no move-in date

HHTypeRRHSOMI

Household type(s) for active enrollments in RRH-SO projects with a move-in date

HHTypeES

Household type(s) for active enrollments in ES projects.

HHTypeSH

Household type(s) for active enrollments in SH projects.

HHTypeTH

Household type(s) for active enrollments in TH projects.

HIV

Population identifier for adults with HIV or AIDS and active in residence during the report period

SMI

Population identifier for adults with Serious Mental Illness and active in residence during the report period

SUD

Population identifier for adults with a substance use disorder and active in residence during the report period

SSNValid

Used for data quality reporting in LSAReport; see [section 11.6](#_Data_Quality_:).

### Logic

LSAPerson is the source for demographic reporting produced by the HDX 2.0. Every active client is counted in a single row of LSAPerson. Counts in **RowTotal** are grouped by the values in all other columns. The sum of **RowTotal** values is the total number of clients in the active cohort.

In the intermediate client-level tlsa\_Person, each active client is represented by a single row with *PersonalID* as the primary key.

## LSAPerson Demographics

lsa\_Report

tlsa\_Enrollment

tlsa\_Person

hmis\_Client

hmis\_Disabilities

This step defines the logic associated with LSA reporting on personal characteristics – broadly referred to as demographics – for each active adult/head of household in tlsa\_Person.

It uses data in lsa\_Report and active tlsa\_Enrollment records as parameters applied to hmis\_Client. These data are used to set LSA reporting category values in tlsa\_Person.

### Relevant Data

#### Source

**lsa\_Report**

ReportStart

**tlsa\_Enrollment**

PersonalID

RelationshipToHoH

ActiveAge

Disability Status

DVStatus

**hmis\_Client**

PersonalID

AmIndAKNative

Asian

BlackAfAmerican

HispanicLatinao

MidEastNAfrican

NativeHIPacific

White

RaceNone

VeteranStatus

**hmis\_Disabilities**

EnrollmentID

InformationDate

DisabilityType

DisabilityResponse

IndefiniteAndImpairs

#### Target

See section [5.3 Get Active Clients for LSAPerson](#_Get_Active_Clients) for column descriptions.

tlsa\_Person

HoHAdult

RaceEthnicity

VetStatus

DisabilityStatus

DVStatus

HIV

SMI

SUD

### Logic

#### HoHAdult

**HoHAdult** is used to indicate whether the client was served as an adult, a head of household, or both adult and HoH. Children and people of unknown age who were not served as heads of household are included in reporting on age and in population counts of people, but are not included in other demographic counts. There is no parallel **HoHAdult** column in the LSAPerson file, but it is useful in identifying which columns/records to update.

Value

Category

0

Not HoH or Adult

1

Adult

2

HoH

3

Adult and HoH

#### RaceEthnicity

-   If *RaceNone* is equal to 8 or 9, regardless of any other data, set **RaceEthnicity** = 98.
-   If *RaceNone* is equal to 99, regardless of any other data, set **RaceEthnicity** = 99.
-   If any of the columns listed below have a value of 1, set **RaceEthnicity** to the unique combination of associated LSA values in numeric order. For example, if *Asian* = 1 and *White* = 1, set **RaceEthnicity** to 25.

HMIS CSV Column

LSA Value

AmIndAKNative

1

Asian

2

BlackAfAmerican

3

HispanicLatinao

6

MidEastNAfrican

7

NativeHIPacific

4

White

5

-   If none of the above apply (i.e., if none of the columns listed are set to 1), set **RaceEthnicity** = 99.

#### VetStatus

Assign a value of -1 for all clients under 18 or of unknown age (**HoHAdult** \= in (0,2)).

Crosswalk HMIS *VeteranStatus* values for adults as follows:

HMIS Value

HMIS Category

LSA Value

LSA Category

0

No

0

Not a veteran

1

Yes

1

Veteran

8

Client doesn’t know

98

Data not provided by client

9

Client prefers not to answer

98

Data not provided by client

(any other)

Any other, including NULL

99

Data missing or invalid

#### HIV

Set **HIV** = -1 for:

-   People not sheltered during the report period (i.e., those with no records in tlsa\_Enrollment where **AIR** = 1); and
-   People under 18.

For any person with at least one enrollment where tlsa\_Enrollment.**AIR** = 1, set **HIV** = 1 if one or more of those enrollments has an associated hmis\_Disabilities record where:

-   InformationDate <= ReportEnd
-   DisabilityType = 8
-   DisabilityResponse = 1

Set **HIV** = 0 for all other adults.

#### SMI

Set **SMI** = -1 for:

-   People not sheltered during the report period (i.e., those with no records in tlsa\_Enrollment where **AIR** = 1); and
-   People under 18.

For any person with at least one enrollment where tlsa\_Enrollment.**AIR** = 1, set **SMI** = 1 if one or more of those enrollments has an associated hmis\_Disabilities record where:

-   InformationDate <= ReportEnd
-   DisabilityType = 9
-   DisabilityResponse = 1
-   IndefiniteAndImpairs = 1

Set **SMI** = 0 for all other adults.

#### SUD

Set **SUD** = -1 for:

-   People not sheltered during the report period (i.e., those with no records in tlsa\_Enrollment where **AIR** = 1); and
-   People under 18.

For any person with at least one enrollment where tlsa\_Enrollment.**AIR** = 1, set **SUD** = 1 if one or more of those enrollments has an associated hmis\_Disabilities record where:

-   InformationDate <= ReportEnd
-   DisabilityType = 10
-   *DisabilityResponse* is 1 (Alcohol use disorder), 2 (Drug use disorder), or 3 (Both alcohol and drug use disorders)
-   IndefiniteAndImpairs = 1

Set **SUD** = 0 for all other adults.

#### DisabilityStatus

Assign a value of -1 for all non-heads of household under 18 or of unknown age (**HoHAdult** \= 0).

*DisablingCondition* is an enrollment-level data element in HMIS, but is reported as a person-level characteristic in the LSA. Set the value of tlsa\_Person.**DisabilityStatus** to the first LSA Value in the table below where tlsa\_Enrollment.**DisabilityStatus** for any active enrollment matches.

Priority

Criteria

tlsa\_Person.DisabilityStatus

1

tlsa\_Enrollment.**DisabilityStatus** = 1

1 (Disabled)

2

tlsa\_Person.**HIV** = 1

1 (Disabled)

2

tlsa\_Person.**SMI** = 1

1 (Disabled)

2

tlsa\_Person.**SUD** = 1

1 (Disabled)

3

tlsa\_Enrollment.**DisabilityStatus** = 0

0

4

(Any other)

99

#### DVStatus

Assign a value of -1 for all non-heads of household under 18 or of unknown age (**HoHAdult** \= 0).

*DomesticViolenceSurvivor* is an enrollment-level data element in HMIS but is reported as a person-level characteristic in the LSA. Set the value of of tlsa\_Person.**DVStatus** to the first LSA Value in the table below where tlsa\_Enrollment.**DVStatus** for any active enrollment matches.

Priority

tlsa\_Enrollment.DVStatus

tlsa\_Person.DVStatus

LSA Category

1

1

1

DV survivor, currently fleeing

2

2

2

DV survivor, not currently fleeing

3

3

3

DV survivor, unknown if currently fleeing

4

10

0

No history of DV reported

5

98

98

Data not provided

6

NULL

99

Missing/invalid

## Time Spent in ES/SH or on the Street – LSAPerson

The definition of *chronically homeless* specifies the total length of time spent either in a place not meant for human habitation, a safe haven, or in an emergency shelter relevant to chronic homelessness in months: “continuously for at least 12 months” or on four or more occasions for a total of “at least 12 months“ within a timeframe of 3 years.

Specific to the LSA:

-   All time related to chronic homelessness is counted in days, i.e., “continuously for at least 365 days” or “in four or more episodes for a total of at least 365 days*”*;
-   The three-year timeframe for any given client ends on their last active date in the report period, i.e., it is specific to the client; and
-   The count of days is based on a combination of *3.917(A or B) Living Situation* data and entry/exit dates for enrollments in HMIS-participating ES/SH/TH/RRH/PSH projects.

Although a person must have a disabling condition in order to be considered chronically homeless, the LSA includes reporting on time spent in places not meant for habitation, safe haven, and/or emergency shelter for all heads of household and adults, regardless of the value in **DisabilityStatus**. It is based on constructing a timeline of activity for each person in tlsa\_Person based on HMIS enrollment data in the three years ending on the client’s most recent active date in the report period. This will include active enrollments and, for people with relevant enrollments prior to the report period, inactive enrollments.

The relevant columns in LSAPerson – and in tlsa\_Person – are **CHTime** and **CHTimeStatus**. Because of the complexity, the business logic is broken out into five separate steps defined beginning with this section (5.5) and concluding with [section 5.10](#_CHTime_and_CHTimeStatus). Section numbers associated with each step are shown below in the graphic for the relevant data construct.

hmis\_Exit

hmis\_Enrollment

hmis\_Services

hmis\_Project

hmis\_ProjectCoC

tlsa\_Person (5.5)

tlsa\_Enrollment.CH (5.6)

tlsa\_Person (5.10)

ch\_Exclude (5.7)

ch\_Include (5.8)

ch\_Episodes (5.9)

lsa\_Report

tlsa\_Enrollment

This is three years of enrollment history for every active adult/HoH – it is not limited to active enrollments.

tlsa\_/hmis\_Enrollment

This section defines how to identify the start (**CHStart**) and end (**LastActive**) dates for the three-year period for each adult/HoH in tlsa\_Person based on report parameters in lsa\_Report.

Section 5.6 describes which HMIS enrollments active in that three-year period are relevant. This includes but is not limited to active enrollments for clients with relevant activity prior to the report period. As described, these are identified in tlsa\_Enrollment by setting **CH** = 1.

Section 5.7 defines the logic for establishing, for each adult/HoH in tlsa\_Person, a list of dates on which TH/RRH/PSH enrollment data indicates that the client was NOT on the street or in ES/SH. As described, records of individual dates are inserted to ch\_Exclude.

Section 5.8 specifies how to build, for each adult/HoH in tlsa\_Person, a list of ES/SH/Street dates based on ch\_Enrollment in conjunction with ch\_Exclude. As described, records of individual dates are inserted to ch\_Include.

Section 5.9 describes the business logic associated with identifying ‘occasions’ or an ‘episodes’ – and the length in days for each – given a list of ES/SH/Street dates for a person. As described, this is accomplished by creating records of episodes in ch\_Episode with start and end dates based on ch\_Exclude.

Finally, Section 5.10 describes how to set LSA reporting category values in tlsa\_Person for **CHTime** and **CHTimeStatus** based on a list of episodes with start and end dates (ch\_Episodes) and, for any adult/HoH who does not meet the time-based criteria for chronic homelessness and is missing relevant *3.917 Living Situation* data, update the initial values to reflect missing data.

### Relevant Data

#### Source

**lsa\_Report**

ReportEnd

**tlsa\_Enrollment**

EnrollmentID

PersonalID

ExitDate

LastBedNight

**tlsa\_Person**

HoHAdult

#### Target

See section [5.3 Get Active Clients for LSAPerson](#_Get_Active_Clients) for column descriptions.

**tlsa\_Person**

**CHStart**

**LastActive**

### Logic

The three-year timeframe for each head of household/adult – the CH date range – is identified in tlsa\_Person with dates in the **CHStart** and **LastActive** columns.

The last active date for any given enrollment is:

-   For a night-by-night shelter, the earlier of ReportEnd or \[**LastBedNight** + 1 day\]; and
-   For any other project type, the first non-NULL of **ExitDate** and ReportEnd.

**LastActive** for each record in tlsa\_Person where **HoHAdult** > 0 is the latest active date based on all enrollments.

**CHStart** is (**LastActive** – 3 years) + 1 day.

## Enrollments Relevant to Counting ES/SH/Street Dates

### Relevant Data

#### Source

**lsa\_Report**

ReportEnd

ReportCoC

**tlsa\_Person**

PersonalID

HoHAdult

CHStart

LastActive

**tlsa\_Enrollment**

EntryDate

ExitDate

#### Target

**tlsa\_Enrollment**

**CH**

### Logic

Enrollments relevant to determining whether or not a person meets the time criteria for chronic homelessness include active and inactive enrollments from tlsa\_Enrollment where:

-   tlsa\_Person.**HoHAdult** \> 0 (chronic homelessness is only reported for adults and heads of household)
-   PersonalID \= tlsa\_Person.PersonalID
-   EntryDate <= LastActive
-   ExitDate is NULL or ExitDate > CHStart

## Get Dates to Exclude from Counts of ES/SH/Street Days (ch\_Exclude)

### Relevant Data

#### Source

**tlsa\_Person**

CHStart

LastActive

**tlsa\_Enrollment**

PersonalID

LSAProjectType

EntryDate

MoveInDate

ExitDate

CH

#### Target

**ch\_Exclude**

**Column Description**

**PersonalID**

**PersonalD**

**ExcludeDate**

Distinct dates between **CHStart** and **LastActive** when client was either in TH or housed in RRH/PSH.

### Logic

Any date on which a client was either in TH or housed in RRH/PSH – i.e., known to be in a place other than one not meant for human habitation, a safe haven, or in an emergency shelter – is generally excluded from the count of ES/SH/Street days, even if there is conflicting information – e.g., an ES enrollment active on the date. The only exception to this is for stays of less than seven days, and only if the dates fall between two dates less than seven days apart on which the client is otherwise documented as being on the street or in ES/SH.

To resolve potential data conflicts, dates on which a client is enrolled in TH or housed in RRH/PSH are excluded when identifying ES/SH/Street days based on ES/SH enrollment dates, bed nights, and *3.917 Prior Living Situation* data. For dates between **CHStart** and **LastActive:**

-   For any CH enrollment where **MoveInDate** is not NULL, all dates between **MoveInDate** and the earlier of (**ExitDate** – 1 day) or ReportEnd are excluded.
-   For any CH enrollment where **LSAProjectType** *\=* 2 (TH), all dates between **EntryDate** and the earlier of (**ExitDate** – 1 day) or ReportEnd are excluded.

## Get Dates to Include in Counts of ES/SH/Street Days (ch\_Include)

### Relevant Data

#### Source

**tlsa\_Person**

PersonalID

CHStart

LastActive

**tlsa\_Enrollment**

CH

PersonalID

EnrollmentID

LSAProjectType

EntryDate

MoveInDate

ExitDate

**hmis\_Enrollment**

EnrollmentID

LivingSituation

LengthOfStay

PreviousStreetESSH

DateToStreetESSH

**hmis\_Services**

EnrollmentID

*BedNightDate* (*DateProvided* where *RecordType* = 200)

#### Target

**ch\_Include**

**Column Description**

**PersonalID**

**PersonalD**

**ESSHStreetDate**

Distinct dates between **CHStart** and **LastActive** when client was in ES/SH or on the street; also referred to as ES/SH/Street dates.

### Logic

For each **PersonalID** in tlsa\_Person, any date between **CHStart** and **LastActive** is counted as an **ESSHStreetDate** based on HMIS data if:

-   The date is not excluded because the client was enrolled in a TH project or enrolled and housed in an RRH/PSH project (ch\_Exclude.**ExcludeDate**); and
-   The date is consistent with any set of criteria listed below based on tlsa\_Enrollments where **CH** = 1.

#### Enrollment in Entry/Exit ES or SH

**LSAProjectType** in (0,8); and

ESSHStreetDate >= (later of EntryDate and CHStart)*;* and

**ESSHStreetDate** < (earliest non-NULL value for **ExitDate** or \[**LastActive** \+ 1 day\])

#### Bed Nights in Night-by-Night ES

LSAProjectType = 1; and

**ESSHStreetDate** = *BedNightDate*

*BedNightDate* \>= LookbackDate

*BedNightDate* \>= **EntryDate** for the associated enrollment

tlsa\_Enrollment.**ExitDate** is NULL or *BedNightDate* < tlsa\_Enrollment.**ExitDate**

#### ES/SH/Street Dates from 3.917 Living Situation

For enrollments where **EntryDate** > **CHStart**, dates on which the client was on the street on in ES/SH based on 3.917 are included as **ESSHStreetDate**s if they have not already been excluded or included based on prior criteria.

-   An **ESSHStreetDate** is counted for ES and SH projects (**LSAProjectType** in (0,1,8)) if:
-   *LivingSituation* in (101,118,116); and
-   **ESSHStreetDate** >= *DateToStreetESSH* and < **EntryDate.**
-   For TH, PSH, and RRH projects (**LSAProjectType** in (2,3,13,15)), **ESSHStreetDate**s based on 3.917 are only counted if:
-   The client was in ES/SH or on the street prior to entry:
-   *LivingSituation* in (101,118,116); or
-   LengthOfStay in (10, 11) and PreviousStreetESSH = 1; or
-   *LivingSituation* in (204,205,206,207,215,225) and *LengthOfStay* in (2,3) and *PreviousStreetESSH* = 1
-   **ESSHStreetDate** >= *DateToStreetESSH*; and
    -   LSAProjectType = 2 and ESSHStreetDate < EntryDate; or
    -   **LSAProjectType** in (3,13,15) and
        -   ESSHStreetDate < MoveInDate; or
        -   MoveInDate is NULL and ESSHStreetDate < ExitDate; or
        -   MoveInDate is NULL and ExitDate is NULL and ESSHStreetDate <= LastActive

#### Gaps of Less than Seven Days Between Two ES/SH/Street Dates

Any date that falls between two ES/SH/Street dates that have been identified using the criteria above and are less than 7 days apart is counted as a ES/SH/Street day.

\[Date\] > \[**ESSHStreetDate***1*\]*;* and

\[Date\] < \[**ESSHStreetDate***2*\]; and

(\[ESSHStreetDate*1*\] + 7 days) >= \[ESSHStreetDate*2*\]

For example, if a client has *BedNightDate*s on June 1 and June 5 of the same year, the 3 dates between – June 2, 3, and 4 – are also counted as ES/SH/Street dates.

Note that gaps of less than 7 days between **ESSHStreetDate**s are counted as ES/SH/Street dates regardless of ch\_Exclude dates.

## Get ES/SH/Street Episodes (ch\_Episodes)

(Sections 5.5-5.10 outline the logic associated with counting ES/SH/Street dates. See section [5.5 Time Spent in ES/SH or on the Street](#_Time_Spent_in) for an overview and graphic for the process.)

### Relevant Data

#### Source

**ch\_Include**

PersonalID

ESSHStreetDate

#### Target

ch\_Episodes

Column Description

PersonalID

tlsa\_Person

episodeStart

The first ES/SH/Street date in the series.

episodeEnd

The last ES/SH/Street date in the series.

episodeDays

The number of days between **episodeStart** and **episodeEnd.**

### Logic

For purposes of the LSA, an ‘episode’ is a continuous – i.e., uninterrupted by any period of seven or more contiguous days — series of ES/SH/Street dates.

Each record in ch\_Episodes represents an uninterrupted series of ES/SH/Street dates identified in the previous step. Based on ch\_Include for each HoH/adult in tlsa\_Person:

-   **episodeStart** is any **ESSHStreetDate** where there is no (**ESSHStreetDate** – 1 day) for the same *PersonalID* – i.e., any ES/SH/Street date where there is no information to indicate that the client was in ES/SH or on the street on the day before.
-   **episodeEnd** is the first **ESSHStreetDate** after **episodeStart** where (**ESSHStreetDate** + 1 day) does not exist
-   **episodeDays** is the \[number of days between **episodeStart** and **episodeEnd**\] + 1 day

## CHTime and CHTimeStatus – LSAPerson

(Sections 5.5-5.10 outline the logic associated with counting ES/SH/Street dates; this is the last step. See section [5.5 Time Spent in ES/SH or on the Street](#_Time_Spent_in) for an overview and graphic for the process.)

### Relevant Data

#### Source

**tlsa\_Person**

PersonalID

HoHAdult

**ch\_Episodes**

PersonalID

episodeStart

episodeEnd

episodeDays

**tlsa\_Enrollment**

EnrollmentID

CH

PersonalID

LSAProjectType

**hmis\_Enrollment**

PersonalID

EntryDate

LivingSituation

LengthOfStay

DateToStreetESSH

TimesHomelessPastThreeYears

MonthsHomelessPastThreeYears

#### Target

See section [5.3 Get Active Clients for LSAPerson](#_Get_Active_Clients) for column descriptions.

tlsa\_Person

CHTime

CHTimeStatus

### Logic

There are a total of ten valid combinations of **CHTime** and **CHTimeStatus** values. They are summarized in the table below; detailed logic follows.

Priority

CHTime

CHTimeStatus

Category

1

\-1

\-1

n/a – tlsa\_Person.**HoHAdult** = 0

2

365

1

Client has a ch\_Episode where **episodeDays** >= 365 with an **episodeEnd** in the year ending on **LastActive**

3

365

2

Client has 4 or more episodes and the sum of **episodeDays** for all ch\_Episodes is >= 365.

4

400

2

Based on 3.917 Living Situation for an enrollment with an *EntryDate* in the year ending on **LastActive**, client was on the street or in ES/SH for 12 or more months and in four or more episodes in three years.

5

365

3

The sum of **episodeDays** for all ch\_Episodes is >= 365 but the number of episodes is less than four; no relevant information is missing from records of *3.917 Living Situation*.

5

365

99

The sum of **episodeDays** for all ch\_Episodes is >= 365 but the number of episodes is less than four; relevant information is missing from records of *3.917 Living Situation.*

\--

270

99

Client has a total of 270-364 ESSHStreet days and relevant data is missing from *3.917 Living Situation*

\--

270

\-1

Client has a total of 270-364 ESSHStreet days and is not missing any relevant *3.917 Living Situation* data

\--

0

99

Client has a total of 0-269 ESSHStreet days and relevant data is missing from *3.917 Living Situation*

\--

0

\-1

Client has a total of 270-364 ESSHStreet days and is not missing any relevant *3.917 Living Situation* data

The conditions associated with valid combinations of **CHTime** and **CHTimeStatus** are not all mutually exclusive. **CHTime** and **CHTimeStatus** should be set for the first set of criteria met by records for each person.

1.  Set **CHTime** and **CHTimeStatus** \= -1 where **HoHAdult** \= 0 (the client was not served as a head of household or as an adult).
2.  Set **CHTime** = 365 and **CHTimeStatus** = 1 when there is a single episode where:

-   ch\_Episodes.**episodeDays** >= 365; and
-   ch\_Episodes.**episodeEnd** > (**LastActive** – 1 year)

1.  Set **CHTime** = 365 and **CHTimeStatus** = 2 where:

-   \[SUM of ch\_Episodes.**episodeDays**\] >= 365; and
-   \[COUNT of ch\_Episodes\] >= 4

1.  Set **CHTime** *=* 400 (12 or more months in three years) and **CHTimeStatus** = 2 (4 or more episodes) where:

-   **CHTimeStatus** not in (1,2)
-   There is an enrollment in tlsa\_Enrollment where **CH** \= 1 and:
    -   EntryDate > (LastActive – 1 year)
    -   TimesHomelessPastThreeYears = 4 (Four or more times)
    -   *MonthsHomelessPastThreeYears* in (112, 113) (12 or more than 12 months)

1.  Set **CHTime** = 365 and **CHTimeStatus** = 3 where:

-   \[SUM of ch\_Episodes.**episodeDays**\] >= 365; and
-   \[COUNT of ch\_Episodes\] < 4

1.  Set **CHTime = 270** and **CHTimeStatus** = -1 where \[SUM of ch\_Episodes.**episodeDays**\] between 270 and 364
2.  Set **CHTime = 0** and **CHTimeStatus** = -1 where \[SUM of ch\_Episodes.**episodeDays**\] < 270

After these values are set, there is one additional update to **CHTimeStatus** to identify people who do not meet the time criteria for chronic homelessness and are missing relevant data (i.e., people who might meet the time criteria if data were complete). Set **CHTimeStatus** = 99 for all records in tlsa\_Person where:

-   **CHTime** in (0,270) – The total number of **ESSHStreetDate**s in the three years ending on **LastActive** is less than 365; or
-   **CHTimeStatus** = 3 – The total number of **ESSHStreetDate**s in the three years ending on **LastActive** is at least 365, but they occur in fewer than four episodes;

AND there is at least one enrollment for the **PersonalID** in tlsa\_Enrollment where **CH** = 1 and any of the following are true:

-   *DateToStreetESSH* > **EntryDate**
-   *LivingSituation* in (8,9,99) or is NULL
-   *LengthOfStay* in (8,9,99) or is NULL
-   **LSAProjectType** in (0,1,8) or *LivingSituation* in (101,116,118) and
-   DateToStreetESSH is NULL; or
-   TimesHomelessPastThreeYears in (8,9,99) or is NULL
-   MonthsHomelessPastThreeYears in (8,9,99) or is NULL
-   **LSAProjectType** is not in (0,1,8) and
-   *LengthOfStay* in (2,3) and *LivingSituation* in (204,205,206,207,215,225) and
-   PreviousStreetESSH is NULL or PreviousStreetESSH not in (0,1); or
-   PreviousStreetESSH = 1 and
-   DateToStreetESSH is NULL; or
-   TimesHomelessPastThreeYears in (8,9,99) or is NULL
-   MonthsHomelessPastThreeYears in (8,9,99) or is NULL
-   *LengthOfStay* in (10,11) and
-   PreviousStreetESSH is NULL or PreviousStreetESSH not in (0,1); or
-   PreviousStreetESSH = 1 and
-   DateToStreetESSH is NULL; or
-   TimesHomelessPastThreeYears in (8,9,99) or is NULL
-   MonthsHomelessPastThreeYears in (8,9,99) or is NULL

## EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax – LSAPerson

tlsa\_Enrollment

tlsa\_Person

This section defines the logic associated with setting values for minimum and maximum age columns for each project group – EST, RRH, and PSH – for LSAPerson. These columns indicate:

\[**EST**/**RRH**/**PSH/RRHSO**\]**AgeMin** – The client’s minimum age at the later of ReportStart and **EntryDate** for any active \[EST/RRH/PSH/RRHSO\] enrollment.

\[**EST**/**RRH**/**PSH/RRHSO**\]**AgeMax** – The client’s maximum age at the later of ReportStart and **EntryDate** for any active \[EST/RRH/PSH/ RRHSO\] enrollment.

### Relevant Data

#### Source

**tlsa\_Enrollment**

LSAProjectType

ActiveAge

Active

#### Target

See section [5.3 Get Active Clients for LSAPerson](#_Get_Active_Clients) for column descriptions.

**tlsa\_Person**

**ESTAgeMin**

**ESTAgeMax**

**RRHAgeMin**

**RRHAgeMax**

**PSHAgeMin**

**PSHAgeMax**

**RRHSOAgeMin**

**RRHSOAgeMax**

### Logic

These values are reported for all active clients.

For any client not served in the EST project group – i.e., there is no active enrollment where **LSAProjectType** in (0,1,2,8) – set **ESTAgeMin** and **ESTAgeMax** to -1. Otherwise, based on tlsa\_Enrollment records where **Active** = 1:

-   **ESTAgeMin** = the smallest **ActiveAge** value where **LSAProjectType** in (0,1,2,8)
-   **ESTAgeMax** = the largest **ActiveAge** value where **LSAProjectType** in (0,1,2,8)

For any client not served in RRH (i.e., there is no active enrollment where **LSAProjectType** = 13), set **RRHAgeMin** and **RRHAgeMax** to -1. Otherwise:

-   **RRHAgeMin** = the smallest **ActiveAge** value where **LSAProjectType** = 13
-   RRHAgeMax = the largest ActiveAge value where LSAProjectType = 13

For any client not served in PSH (i.e., there is no active enrollment where **ProjectType** = 3), set **PSHAgeMin** and **PSHAgeMax** to -1. Otherwise:

-   PSHAgeMin = the smallest ActiveAge value where LSAProjectType = 3
-   PSHAgeMax = the largest ActiveAge value where LSAProjectType = 3

For any client not served in RRH-SO (i.e., there is no active enrollment where **LSAProjectType** = 15), set **RRHSOAgeMin** and **RRHSOAgeMax** to -1. Otherwise:

-   RRHSOAgeMin = the smallest ActiveAge value where LSAProjectType = 15
-   RRHSOAgeMax = the largest ActiveAge value where LSAProjectType = 15

Value

AgeGroup

\-1

n/a – not served in project group

0

Less than 1 year

2

1 to 2 years

5

3 to 5 years

17

6 to 17 years

21

18 to 21 years

24

22 to 24 years

34

25 to 34 years

44

35 to 44 years

54

45 to 54 years

64

55 to 64 years

65

65 or older

98

Data not provided

99

Missing/invalid

## Set Population Identifiers for Active HMIS Households

tlsa\_HHID

tlsa\_Enrollment

tlsa\_Person

### Relevant Data

#### Source

**tlsa\_Enrollment**

PersonalID

HouseholdID

RelationshipToHoH

ActiveAge

Active

**tlsa\_Person**

PersonalID

RaceEthnicity

VetStatus

DisabilityStatus

CHTime

CHTimeStatus

DVStatus

**tlsa\_HHID**

ActiveHHType

#### Target

See section [5.3 Get Active Clients for LSAPerson](#_Get_Active_Clients) for column descriptions.

**tlsa\_HHID**

**HHChronic**

**HHVet**

**HHDisability**

**HHFleeingDV**

**HHAdultAge**

**HHParent**

**AC3Plus**

### Logic

#### HHChronic

Limited to active household members (those with records in tlsa\_Enrollment with the same **HouseholdID** where **Active** = 1):

Based on records in tlsa\_Enrollment with the same **HouseholdID** where **Active** = 1, set **HHChronic** to the first value in the table below for which any adult or HoH meets the criteria:

Value

Criteria

Category

**1**

**DisabilityStatus** = 1 and:

-   **CHTime** = 365 and **CHTimeStatus** in (1,2); or
-   CHTime = 400 and CHTimeStatus = 2

Chronically Homeless

**2**

**CHTime** in (365, 400) and **DisabilityStatus** \= 1

Long-Term Homeless with Disability

**3**

**CHTime** in (365, 400) and **DisabilityStatus** = 99

Long-Term Homeless Missing Disability Info

**4**

**CHTime** in (365, 400) and **DisabilityStatus** = 0

Long-Term Homeless without Disability

**5**

**CHTime** = 270 and **CHTimeStatus = 99** and **DisabilityStatus** = 1

Homeless > 6 Months with Disability (missing data)

**6**

**CHTime** = 270 and **CHTimeStatus** <> 99 and **DisabilityStatus** = 1

Homeless > 6 Months with Disability (no missing data)

**9**

**DisabilityStatus** <> 0 and **CHTimeStatus** \= 99

CH Status Unknown (missing data)

**0**

(any other)

Not Chronically Homeless

#### HHVet

Limited to active household members (those with records in tlsa\_Enrollment with the same **HouseholdID** where **Active** = 1):

Based on records in tlsa\_Enrollment with the same **HouseholdID** where **Active** = 1:

**HHVet** = 1 if **ActiveHHType** in (1,2,99) and any adult household member is reported for LSAPerson (in tlsa\_Person) with **VetStatus** = 1.

Otherwise, **HHVet** = 0.

#### HHDisability

Limited to active household members (those with records in tlsa\_Enrollment with the same **HouseholdID** where **Active** = 1):

**HHDisability** = 1 if the head of household or any adult in the household is reported for LSAPerson (in tlsa\_Person) with **DisabilityStatus** = 1.

Otherwise, **HHDisability** = 0.

#### HHFleeingDV

Limited to active household members (those with records in tlsa\_Enrollment with the same **HouseholdID** where **Active** = 1). In priority order:

**HHFleeingDV** = 1 (Households Fleeing Domestic Violence) if the head of household or any adult in the household is reported for LSAPerson (in tlsa\_Person) with **DVStatus** = 1.

**HHFleeingDV** = 2 (Domestic Violence Survivors Not Identified as Currently Fleeing) if the head of household or any adult in the household is reported for LSAPerson (in tlsa\_Person) with **DVStatus** in (2,3).

tlsa\_Person.DVStatus

LSA Category

tlsa\_HHID.HHFleeingDV

1

DV survivor, currently fleeing

1

2

DV survivor, not currently fleeing

2

3

DV survivor, unknown if currently fleeing

2

Otherwise, **HHFleeingDV** = 0.

#### HHAdultAge

Set **HHAdultAge** for each active household to the upload value shown below based on the *first* of the criteria below met by the ActiveAge values in tlsa\_Enrollment for all household members with the same **HouseholdID** where **Active** \= 1:

Priority

Upload Value

Criteria

1

\-1

ActiveHHType not in (1,2)

1

\-1

The maximum of all ActiveAge values is >= 98 (one or more unknown ages)

2

18

The maximum of all ActiveAge values is 21 (all adults are between 18 and 21)

3

24

The maximum of all ActiveAge values is 24 (all adults are under 25)

4

55

The minimum of all ActiveAge values is between 55 and 65 (all members are 55+)

5

25

(all other households)

#### HHParent

Set **HHParent** = 1 if one or more active enrollments associated with the **HouseholdID** has **RelationshipToHoH** = 2.

Otherwise, **HHParent** \= 0.

#### AC3Plus

Set **AC3Plus** = 1 if:

-   -   **HHType** for the active household = 2 (AC); and
    -   The count of distinct **PersonalID**s from active enrollments associated with the **HouseholdID** where enrollment **ActiveAge** between 0 and 17 is >= 3.

Otherwise, **AC3Plus** = 0.

## Project Group and Population Household Types - LSAPerson

tlsa\_Person

tlsa\_Enrollment

tlsa\_HHID

### Relevant Data

#### Source

**tlsa\_HHID**

ActiveHHType

HouseholdID

**tlsa\_Enrollment**

LSAProjectType

HouseholdID

PersonalID

RelationshipToHoH

ActiveAge

Active

AIR

**tlsa\_HHID**

HHChronic

HHVet

HHDisability

HHFleeingDV

HHAdultAge

HHParent

AC3Plus

#### Target

See section [5.3 Get Active Clients for LSAPerson](#_Get_Active_Clients) for column descriptions.

**tlsa\_Person**

**HHTypeEST/RRH/PSH**

**HoHEST/RRH/PSH**

**AdultEST/RRH/PSH**

**AIREST/RRH/PSH**

**AIRHoHEST/RRH/PSH**

**AIRAdultEST/RRH/PSH**

**HHChronicEST/RRH/PSH**

**HHVetEST/RRH/PSH**

**HHDisabilityEST/RRH/PSH**

**HHFleeingDVEST/RRH/PSH**

**HHParentEST/RRH/PSH**

**AC3PlusEST/RRH/PSH**

**HHTypeES/SH/TH**

**HHTypeRRHSONoMI/ HHTypeRRHSOMI**

### Logic

These columns are reported for all active clients and identify the household types, if any, for enrollments that meet the column criteria for each project group.

The criteria associated with project group identifiers is the same:

-   EST – **LSAProjectType** in (0,1,2,8)
-   RRH – LSAProjectType = 13
-   PSH – LSAProjectType = 3
-   RRHSO – LSAProjectType = 15
-   ES – **LSAProjectType** in (0,1)
-   SH– LSAProjectType = 8
-   TH– LSAProjectType = 2

Regardless of the project group in the suffix of the column name, there are only slight differences in logic for these columns:

Column

Criteria

**HHType**(EST/RRH/PSH/ES/SH/TH)

tlsa\_Enrollment.**Active** = 1

**HoH**(EST/RRH/PSH)

tlsa\_Enrollment.**Active** = 1 and **RelationshipToHoH** = 1

**Adult**(EST/RRH/PSH)

tlsa\_Enrollment.**Active** = 1 and **ActiveAge** between 21 and 65.

**AIR**(EST/RRH/PSH)

tlsa\_Enrollment.**AIR** = 1

**AIRHoH**(EST/RRH/PSH)

tlsa\_Enrollment.**AIR** = 1 and **RelationshipToHoH** = 1

**AIRAdult**(EST/RRH/PSH)

tlsa\_Enrollment.**AIR** = 1 and **ActiveAge** between 21 and 65

**HHChronic**(EST/RRH/PSH)

tlsa\_Enrollment.**Active** = 1 and tlsa\_HHID.**HHChronic** \= 1

**HHVet**(EST/RRH/PSH)

tlsa\_Enrollment.**Active** = 1 and tlsa\_HHID.**HHVet** = 1

**HHDisability**(EST/RRH/PSH)

tlsa\_Enrollment.**Active** = 1 and tlsa\_HHID.**HHDisability** = 1

**HHFleeingDV**(EST/RRH/PSH)

tlsa\_Enrollment.**Active** = 1 and tlsa\_HHID.**HHFleeingDV** = 1

**HHParent**(EST/RRH/PSH)

tlsa\_Enrollment.**Active** = 1 and tlsa\_HHID.**HHParent** = 1

**AC3Plus**(EST/RRH/PSH)

tlsa\_Enrollment.**Active** = 1 and tlsa\_HHID.**AC3Plus** = 1

**HHTypeRRHSONoMI**

tlsa\_Enrollment.**Active** = 1 and tlsa\_Enrollment.**MoveInDate** is null

**HHTypeRRHSOMI**

tlsa\_Enrollment.**Active** = 1 and tlsa\_Enrollment.**MoveInDate** is not null

The **AC3Plus**(EST/RRH/PSH) population is limited to the AC household type, so these columns are set to:

Column Values

Household Status

\-1

None - not served in project group

0

Served in the project group but never in an AC3Plus household

1

Served in the project group at least once in an AC3Plus household

For all other columns, household types are reported as shown below based on the tlsa\_HHID.**ActiveHHType**s for all enrollments that meet column criteria. (Note: If calculated correctly, CO household types will not occur in the **Adult**, **AIRAdult**, or **HHVet** columns.)

Column Values

Household Type(s)

HHType(s)

\-1

None - not served in project group

(n/a)

1

AO

1

2

AC

2

3

CO

3

9

UN

99

12

AO and AC

1 and 2

13

AO and CO

1 and 3

19

AO and UN

1 and 99

23

AC and CO

2 and 3

29

AC and UN

2 and 99

39

CO and UN

3 and 99

123

AO, AC, and CO

1,2, and 3

129

AO, AC, and UN

1,2, and 99

139

AO, CO, and UN

1,3, and 99

239

AC, CO, and UN

2,3, and 99

1239

AO, AC, CO, and UN

1,2,3,and 99

## Adult Age Population Identifiers - LSAPerson

tlsa\_Person

tlsa\_Enrollment

tlsa\_HHID

### Relevant Data

#### Source

**tlsa\_Enrollment**

PersonalID

HouseholdID

Active

**tlsa\_HHID**

HouseholdID

LSAProjectType

HHAdultAge

#### Target

See section [5.3 Get Active Clients for LSAPerson](#_Get_Active_Clients) for column descriptions.

**tlsa\_Person**

PersonalID

**HHAdultAgeAOEST/RRH/PSH**

**HHAdultAgeACEST/RRH/PSH**

### Logic

Set the column values based on the first of the criteria below where:

-   tlsa\_HHID.ActiveHHType = 1 (HHAdultAgeAOEST/RRH/PSH)
-   tlsa\_HHID.ActiveHHType = 2 (HHAdultAgeACEST/RRH/PSH)
-   Project type is consistent with project group:
-   EST - **LSAProjectType** in (0,1,2,8)
-   RRH - LSAProjectType = 13
-   PSH - LSAProjectType = 3

Priority

tlsa\_HHID

HHAdultAge(AO/AC)(EST/RRH/PSH)

1

**HHAdultAge** = 18

18

2

**HHAdultAge** = 24

24

3

**HHAdultAge** = 55

55

4

**HHAdultAge** = 25

25

5

(any other, including people not served in the relevant HHType/project group)

\-1

## LSAPerson

tlsa\_Person

lsa\_Person

As noted, tlsa\_Person is a client-level precursor to lsa\_Person / LSAPerson.csv.

**RowTotal** is a count of *PersonalID*s in tlsa\_Person, grouped by all of the other columns in LSAPerson.

# HMIS Business Logic: LSAHousehold

## Get Distinct Households for LSAHousehold

![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAVcAAABhCAMAAABVuxIuAAAAAXNSR0ICQMB9xQAAANJQTFRFAAAAEBAQGBgYDAwMODg4KCgoMDAwICAgQEBAWFhYSEhIf39/eHh4aGhoh4eHl5eXqnSPp6env7+/t7e3woWj39/fx8fH19fXz8/P9bGD9rmQ9bOG9reN97qT9rWK+MOf98Ca98Gd98Cb+c6w+MWj+cut+dC0+Min+dG2+MSi+M2x+cmp+dO598Og+tO5+cus+tjB+9/M+9rE+tzI69fh/OXW/OTT++DO++TU/Onc/ObY++LR7+/v9/f35+fn/Ovg/vXv/vjz/fPr/vr3//37////T/OoxQAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAANPSURBVHja7d3rVtNAFAXgg4KkxFpbKBDLJQpBEJQoVBGrAbTv/0rOJE3JpbnP0GGy9w9Cmlm06+P0TMKUFZouJUMiWjEMo2Oa/e2phqHlPfVkMBj0TbOzSmsbbwZwFZ+dzdcGbfQmcJWQze6Lzi5cJeR3/1X3D1xlpLc6hKuMDA09YFVznfa6cJWRnTW4SmkE63CFa7ard6hEjnRzdY9dFWJp5+qMVQhc4QrXZ+BKcH06V2IR89uAa/JBgmtTV16dsRKl+YFo9QabYCgRXItcKVWFND9AsT1/Q6jXkq6U7Kmz78NN3BV9oHR/5X0gUa+RfbjWnrfSrpEGAde6fYCSfSAyoaXnrfF8RoNrkzS5dIBrOF+lKxGucup1DFe4whWucIUrXOGqgOuWGtHP9Tor2UfERwnX7yLXudvl+oPJnTgsH22Wd1YsI5Gfy2iBq+ueOs6Zbe9Z1h6TO+Fl+dVjucuDgWvWm5ppvrf3LYsVoeveeN59JRi4RvPN/eSc89Ic+Zo/vYe6MLqcD9yyDrdv22es+bH36a+qbfPCcT7bB9aHwy/uVdXS1Lpe+Yt58Lwbhsqa4AHrhXxqOeeTzMWCz6edOuH0M/Lb5qXr3np/BZ5Q6+Qayz2fWq644eWiz1O64fTzT86FirauSw5clXLdnVR3pXpotGiPNHU1V8xJFVfKcqVC8Xa5EvmycBXu6suWdOWjA1u+5V9SrsGDFN2j2cHZliIH1Xd9SQ2y/rZavVKqCIOfExtAj9qBYuIIoV5TrnSdqLeYYHwcxUq4Na71+mvYD/Jd5+Na51r7fKDQlaLj2uZa+fw1qD8iyugDs0PJccmp7PnMW7je0so1PA8Q5arIHyy3dKvXnKd72lcCV7jCFa66uWLeQr3CdWmuqqxza+aqSuCqnivBVbhr4foQRUaVuPKGax3X4uKGa6BXuO6WdC2AhWusXnPW3ehxOQiulV1z191Qr/X7a966G1wbzFslXTFvlTt/LVp3w3lW7esCkYFrzplXg3U3uKJe4QpXuMIVrnCFK1zLueq1zq2Mq2ovCK5whStc4SonuP+WnOB+cXLaAO5vKKVacT9O8cH9Y2UE9zsWHtyfW2RwP3nxGfL/ajcMo2Oa/W3NSP38B1OatyMjq9OUAAAAAElFTkSuQmCC)

This section is required only if **LSAScope** <> 3 (HIC).

The tlsa\_Household data construct holds one record for each distinct combination of **HoHID** and **ActiveHHType** in tlsa\_HHID where **Active** \= 1. It is a household-level version of the aggregate LSAHousehold data and is used to set values for each LSA reporting category for each household. It includes all columns from LSAHousehold.csv other than **RowTotal** and **ReportID**, as well as several columns which are used as a reference to simplify business logic but do not correlate to a column in LSAHousehold.

### Relevant Data

#### Source

**lsa\_Report**

ReportStart

ReportEnd

**tlsa\_HHID**

HoHID

ActiveHHType

Active

#### Target

The logic associated with values for columns with names in **bold** below is described in this step. The business logic associated with other columns is described in subsequent steps.

**tlsa\_Household**

**Column Description**

**HoHID**

*PersonalID* for heads of active households; distinct combinations of **HoHID** and **HHType** serve as a primary key.

**HHType**

The household type

FirstEntry

(Does not correlate to a column in LSAHousehold.csv)

The earliest *EntryDate* for any active enrollment.

LastInactive

(Does not correlate to a column in LSAHousehold.csv)

For households already engaged with the continuum at the start of the report period, the most recent date prior to ReportStart and the start of the household’s period of continuous engagement.

Stat

The household status related to continuum engagement on the first day of the earliest enrollment active during the report period.

StatEnrollmentID

(Does not correlate to a column in LSAPerson.csv)

For households returning or re-engaging with the continuum 15-730 days after an exit prior to ReportStart (**Stat** in (2,3,4)), the *EnrollmentID* for the household’s most recent exit prior to ReportStart.

ReturnTime

For households returning or re-engaging with the continuum 15-730 days after an exit prior to ReportStart (**Stat** in (2,3,4)), the length of time in days between exit and the earliest active enrollment.

HHAdult

Number of people (including the head of household) 18 and older served with the HoH in active HMIS households where **HHType** = tlsa\_Household.**HHType**

HHChild

Number of people (including the head of household) under the age of 18 served with the HoH in active HMIS households where **HHType** = tlsa\_Household.**HHType**

HHNoDOB

Number of people (including the head of household) with no valid date of birth with the HoH in active HMIS households where **HHType** = tlsa\_Household.**HHType**

HHChronic

Identifies whether or not the head of household or any adult household member is chronically homeless or has other specific patterns of long-term homelessness. Based on **DisabilityStatus**, **CHTime**, and **CHTimeStatus** values, as determined for LSAPerson reporting.

HHVet

Identifies whether or not the household includes a veteran. Based on **VetStatus** value, as determined for LSAPerson reporting.

HHDisability

Identifies whether or not the head of household or any adult member was identified as having a disabling condition on any active enrollment.

HHFleeingDV

Identifies whether or not the head of household or any adult member was identified as fleeing domestic violence on any active enrollment. Based on **DVStatus** value, as determined for LSAPerson reporting.

HoHRaceEthnicity

Identifies race and ethnicity for head of household as reported in LSAPerson.

HHAdult

Number of people (including the head of household) 18 and older served with the head of household in the household type reflected in the **HHType** column.

HHChild

Number of people (including the head of household) under the age of 18 served with the head of household in the household type reflected in the **HHType** column.

HHNoDOB

Number of people (including the head of household) with no valid date of birth served with the head of household.

HHAdultAge

The age groups of adult household members. The categories are mutually exclusive (a household can only fall into one group) and inclusive (every household with adults will fall into one group).

HHParent

Identifies whether or not any household member has **RelationshiptoHoH** = 2 (child of the HoH).

ESTStatus

Identifies whether the household was served in ES, SH, and/or TH during the report period or prior to the report period during a period of continuous system use. If served, the status indicates how the enrollment timeframe relates to the report period.

ESTGeography

For households with active EST enrollments (**ESTStatus** > 2) during the report period, the Geography of the most recent project in which the household was enrolled.

ESTLivingSit

For households with active EST enrollments (**ESTStatus** > 2) during the report period, the *LivingSituation* associated with the earliest active enrollment.

ESTDestination

For households who exited an EST enrollment during the report period and were not active in an EST project as of ReportEnd (**ESTStatus** in (12,22)), the *Destination* associated with the most recent exit.

ESTChronic

Population identifier specific to EST; see **HHChronic**.

ESTVet

Population identifier specific to EST; see **HHVet**.

ESTDisability

Population identifier specific to EST; see **HHDisability**.

ESTFleeingDV

Population identifier specific to EST; see **HHFleeingDV.**

ESTAC3Plus

Population identifier; for AC households, specifies whether or not there were at least three household members under the age of 18 served with the HoH in EST.

ESTAdultAge

Population identifier specific to EST; see **HHAdultAge**.

ESTParent

Population identifier specific to EST; see **HHParent**.

RRHStatus

Identifies whether the household was served in RRH during the report period or in an episode of homelessness that overlaps with the report period. If served, the status indicates how the enrollment timeframe relates to the report period.

RRHMoveIn

For households served in RRH during the report period, indicates if the household has a move-in date. If so, indicates whether it was before or during the report period.

RRHGeography

For households with active RRH enrollments (**RRHStatus** > 2) during the report period, the Geography of the most recent project in which the household was enrolled.

RRHLivingSit

For households with active RRH enrollments (**RRHStatus** > 2) during the report period, the *LivingSituation* associated with the earliest active enrollment.

RRHDestination

For households who exited an RRH enrollment during the report period and were not active in an RRH project as of ReportEnd (**RRHStatus** in (12,22)), the Destination associated with the most recent exit.

RRHPreMoveInDays

For households who were housed in RRH at any point in the report period, including those with a *MoveInDate* prior to ReportStart, the total number of days between *EntryDate* and *MoveInDate* for any active RRH enrollment. It differs from other day counts in that it includes all days in RRH prior to move-in, even if the household was simultaneously enrolled in ES/SH/TH/PSH.

RRHChronic

Population identifier specific to RRH; see **HHChronic**.

RRHVet

Population identifier specific to RRH; see **HHVet**.

RRHDisability

Population identifier specific to RRH; see **HHDisability**.

RRHFleeingDV

Population identifier specific to RRH; see **HHFleeingDV.**

RRHAC3Plus

Population identifier; for AC households, specifies whether or not there were at least three household members under the age of 18 served with the HoH in RRH.

RRHAdultAge

Population identifier specific to RRH; see **HHAdultAge**.

RRHParent

Population identifier specific to RRH; see **HHParent**.

PSHStatus

Identifies whether the household was served in PSH during the report period or in an episode of homelessness that overlaps with the report period. If served, the status indicates how the enrollment timeframe relates to the report period.

PSHMoveIn

For households served in PSH during the report period, indicates if the household has a move-in date. If so, indicates whether it was before or during the report period.

PSHGeography

For households with active PSH enrollments (**PSHStatus** > 2) during the report period, the Geography of the most recent project in which the household was enrolled.

PSHLivingSit

For households with active PSH enrollments (**PSHStatus** > 2) during the report period, the *LivingSituation* associated with the earliest active enrollment.

PSHDestination

For households who exited a PSH enrollment during the report period and were not active in PSH as of ReportEnd (**PSHStatus** in (12,22)), the *Destination* associated with the most recent exit.

PSHHousedDays

From active enrollments, days spent housed in PSH. (Note that this differs from other day counts in that it is limited to active enrollments.)

PSHChronic

Population identifier specific to PSH; see **HHChronic**.

PSHVet

Population identifier specific to PSH; see **HHVet**.

PSHDisability

Population identifier specific to PSH; see **HHDisability**.

PSHFleeingDV

Population identifier specific to PSH; see **HHFleeingDV.**

PSHAC3Plus

Population identifier; for AC households, specifies whether or not there were at least three household members under the age of 18 served with the HoH in PSH.

PSHAdultAge

Population identifier specific to PSH; see **HHAdultAge**.

PSHParent

Population identifier specific to PSH; see **HHParent**.

ESDays

Days spent in ES or SH during the report period and/or in any continuous episode of homelessness/system use prior to the report period when the household was not in TH or housed in RRH/PSH.

THDays

Days spent in TH during the report period and/or in any continuous episode of engagement/homelessness prior to report period when the household was not in housed in RRH/PSH.

ESTDays

Days spent in ES/SH/TH in the report period and/or in any continuous episode of homelessness prior to report period when the household was not housed in RRH/PSH.

RRHPSHPreMoveInDays

For households served in RRH and/or PSH, the total number of days spent homeless in RRH/PSH in the report period or in any continuous episode of engagement/homelessness prior to report period when household was not housed in RRH/PSH and not active in ES/SH/TH.

RRHHousedDays

Days spent housed in RRH in the report period and/or in any continuous episode of engagement/homelessness prior to report period when the household was not housed in PSH.

SystemDaysNotPSHHoused

The total number of days spent in ES, SH, TH, RRH, or PSH (pre-move-in) in the report period or in any continuous episode of homelessness prior to the report period while not housed in PSH.

SystemHomelessDays

The combined total number of days in the report period or in any episode of continuous homelessness that overlaps the report period when the household was in ES/SH/TH or was enrolled, but not housed in RRH/PSH (i.e. does not have a move-in date).

Other3917Days

The total number of days in the report period or in any episode of continuous homelessness that overlaps the report period when the household was on the street or in ES/SH based on 3.917 Living Situation records for any System Path enrollment, but was not active in a continuum ES/SH/TH/RRH/PSH project.

TotalHomelessDays

The combined total number of days in the report period or in any episode of continuous homelessness that overlaps the report period when the household was in ES/SH/TH; was enrolled, but not housed in RRH/PSH (i.e. does not have a move-in date); or on the street or in ES/SH based on 3.917 Living Situation records for any System Path enrollment and was not housed in RRH/PSH.

SystemPath

The combinations of system use during the report period and in any continuous period of service prior to the report period – i.e., the ‘path’ through the system. It is not dependent on the sequence of service. System Paths are mutually exclusive.

ESTAIR

Identifies households active in residence for ES/SH/TH in the report period.

RRHAIR

Identifies households active in residence for RRH in the report period.

PSHAIR

Identifies households active in residence for PSH in the report period.

### Logic

For the LSA, each distinct combination of a head of household’s **PersonalID** and **HHType** from all **HouseholdID**s active in the report period is counted as a single household.

Records in the intermediate household-level tlsa\_Household are created for each distinct combination of **ActiveHHType** and **HoHID** in tlsa\_HHID where **Active** = 1.

## Set Population Identifiers for LSAHousehold

tlsa\_Person

tlsa\_Household

tlsa\_Enrollment

tlsa\_HHID

**HHAdult**, **HHChild**, and **HHNoDOB** are used together to report on household composition. The additional household-level population identifiers are used to report on population groups of interest.

### Relevant Data

#### Source

**tlsa\_HHID**

HoHID

HouseholdID

ActiveHHType

HHChronic

HHVet

HHDisability

HHFleeingDV

HHAdultAge

HHParent

AC3Plus

Active

**tlsa\_Enrollment**

HouseholdID

PersonalID

ActiveAge

Active

**tlsa\_Person**

PersonalID

RaceEthnicity

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**tlsa\_Household**

**HHAdult**

**HHChild**

**HHNoDOB**

**HoHRaceEthnicity**

**HHChronic**

**HHVet**

**HHDisability**

**HHFleeingDV**

**HHAdultAge**

**HHParent**

**AC3Plus**

### Logic

#### HHAdult

The value is a count (up to 3) of household members who was served as an adult on *every* associated active enrollment (**ActiveAge** between 21 and 65). Anyone served as both an adult and a child with the same **HoHID**/**ActiveHHType** should be counted as a child. (This is only possible in AC households when a household member turns 18 between enrollments and there is another household member still under 18.)

Value

Category

0

No adult in household

1

1 adult in household

2

2 adults in household

3

3 or more adults in household

If **HHType** is 1 (AO) or 2 (AC), the value in this column must be > 0.

If **HHType** = 3 (CO), the value in this column must = 0.

#### HHChild

The value is a count of all active household members (up to 3) whose **ActiveAge** for *any* associated active enrollment is under 18.

Value

Category

0

No child in household

1

1 child in household

2

2 children in household

3

3 or more children in household

If **HHType** is 1 (AO), the value in this column must = 0.

If **HHType** is 2 (AC) or 3 (CO), the value in this column must be > 0.

#### HHNoDOB

**Note:** If **HHChild** = 3 and **HHType** = 2, the household is counted in the AC Households with 3 or More Children population.

The value is a count of all active household members (up to 3) whose **ActiveAge** is in (98,99).

Value

Category

0

No person without a valid DOB in household

1

1 person without a valid DOB in household

2

2 people without a valid DOB in household

3

3 or more people without a valid DOB in household

If **HHType** is 1 (AO) or 3 (CO), the value in this column must be = 0.

If **HHType** = 99 (UN), the value in this column must be > 0.

#### HoHRaceEthnicity

Set values for **HoHRaceEthnicity** in tlsa\_Household to the **RaceEthnicity** value for the head of household in tlsa\_Person.

#### HHVet, HHDisability, and HHParent

Set the value in tlsa\_Household to the maximum value for the corresponding column in tlsa\_HHID – i.e., if the value is 1 for any **HouseholdID** with the same **HoHID** and **ActiveHHType =** **HHType**, set the value in tlsa\_Household to 1. Otherwise, set the value to 0.

These columns are used to identify populations of interest:

-   Veteran Household (**HHVet** = 1)
-   Household with a Disabled Adult/HoH **(HHDisability** = 1)
-   Parenting Children (**HHType** = 3 and **HHParent** = 1)
-   Parenting Youth 18-24 – (**HHParent** = 1 and **HHType** = 2 and **HHAdultAge** in (18,24))

#### HHFleeingDV

Set **HHFleeingDV** to the first value in the table below that occurs in tlsa\_HHID.**HHFleeingDV** for the same **HoHID** where **ActiveHHType** = **HHType**:

Priority

HHFleeingDV Value

1

1

2

2

3

0

This column is used to identify populations of interest:

-   Households Fleeing Domestic Violence **(HHFleeingDV** = 1)
-   Households of Domestic Violence Survivors Not Currently Fleeing (**HHFleeingDV** = 2)
-   Households with No Reported DV History (**HHFleeingDV** = 0)

#### HHChronic

Set **HHChronic** to the first value in the table below that occurs in tlsa\_HHID.**HHChronic** for the same **HoHID** where **ActiveHHType** = **HHType**:

Value

Category

1

Chronically Homeless

2

Long-Term Homeless with Disability

3

Long-Term Homeless Missing Disability Info

4

Long-Term Homeless without Disability

5

Homeless > 6 Months with Disability (missing data)

6

Homeless > 6 Months with Disability (no missing data)

9

CH Status Unknown (missing data)

0

Not Chronically Homeless

#### HHAdultAge

Set **HHAdultAge** based on the first of the criteria below met by any active tlsa\_HHID record with the same **HoHID** and **ActiveHHType =** **HHType:**

Priority

tlsa\_HHID

tlsa\_Household.HHAdultAge

1

**HHAdultAge** = 18

18

2

**HHAdultAge** = 24

24

3

**HHAdultAge** = 55

55

4

**HHAdultAge** = 25

25

5

(any other)

\-1

The populations for which **HHAdultAge** are relevant are:

-   AO Unaccompanied Youth 18-21– all household members are between the ages of 18 and 21 (**HHType** = 1 and **HHAdultAge** = 18)
-   AO Unaccompanied Youth 22-24 – at least one household member is between 22 and 24; all are between 18 and 24 **(HHType** = 1 and **HHAdultAge** = 24)
-   AO Non-Veteran Households 25+ - at least one household member is over 24 (**HHType** = 1 and **HHVet** = 0 and **HHAdultAge** in (25,55))
-   AO Senior Households 55+ - all household members are 55 or older (**HHType** = 1 and **HHAdultAge** = 55)
-   AC Parenting Youth 18-24 – all adults in the household are between 18 and 24; there are no household members of unknown age (**HHParent** = 1 and **HHType** = 2 and **HHAdultAge** in (18,24))

In general, each distinct combination of **HoHID**/**HHType** is counted in all populations identified for associated **HouseholdID**s. Technically, a non-veteran served alone –once at age 24 and again at 25 – is a member of two populations:

-   Unaccompanied Young Adults 18-24; and
-   Non-Veteran Households 25+.

With a single upload value for **HHAdultAge** in LSAHousehold, it isn’t possible to identify both. Inclusion in youth and senior populations is prioritized over the Non-Veteran Households 25+ population.

## EST/RRH/PSH/RRHSOStatus – LSAHousehold

tlsa\_HHID

tlsa\_Household

### Relevant Data

#### Source

**tlsa\_HHID**

HoHID

HHType

LSAProjectType

EntryDate

ExitDate

Active

ActiveHHType

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**tlsa\_Household**

**ESTStatus**

**RRHStatus**

**PSHStatus**

**RRHSOStatus**

### Logic

Like tlsa\_Person, tlsa\_Household includes columns to indicate the project groups in which each household was served.

The logic and upload values associated with **ESTStatus**, **RRHStatus**, **PSHStatus**, and **RRHSOStatus** are identical, aside from the project group. The following sections use ‘x’ in place of the project group identifier – e.g., **xStatus** instead of **ESTStatus**.

Values are based on:

-   Earliest *EntryDate* for an active enrollment in project group; and
-   A NULL value for *ExitDate* on any active enrollment in the project group OR the latest *ExitDate.*

For every record in tlsa\_Household:

Earliest x *EntryDate*

Latest x *ExitDate*

xStatus Value

NULL

n/a

0

< ReportStart

NULL / there is an active enrollment for x with no *ExitDate*

11

< ReportStart

Between ReportStart and ReportEnd

12

\>= ReportStart

NULL / there is an active enrollment for x with no *ExitDate*

21

\>= ReportStart

Between ReportStart and ReportEnd

22

Note: 2 is also a valid value for **xStatus** but is not assigned until a later step in section [6.16 Update EST/RRH/PSHStatus](#_Toc525229489).

## RRH/PSH/RRHSOMoveIn – LSAHousehold

tlsa\_HHID

tlsa\_Household

### Relevant Data

#### Source

**tlsa\_HHID**

HoHID

HHType

ActiveHHType

MoveInDate

EntryDate

LSAProjectType

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**tlsa\_Household**

**RRHMoveIn**

**PSHMoveIn**

**RRHSOMoveIn**

### Logic

Aside from the project type, the logic and upload values associated with **RRHMoveIn** and **PSHMoveIn** are identical. They are based on **RRHStatus** and **PSHStatus**, respectively, and move-in dates for relevant enrollments.

For all records in tlsa\_Household:

xStatus Value

MoveInDate

xMoveIn Value

<= 2

Any

\-1

\> 2

There is no *MoveInDate*

0

\> 2

Most recent *MoveInDate* is between ReportStart and ReportEnd

1

\> 2

Most recent *MoveInDate* < ReportStart

2

## EST/RRH/PSHGeography – LSAHousehold

lsa\_ProjectCoC

tlsa\_HHID

tlsa\_Household

tlsa\_Household

### Relevant Data

#### Source

**lsa\_ProjectCoC**

ProjectID

GeographyType

**tlsa\_Household**

HoHID

HHType

EST/RRH/PSHStatus

**tlsa\_HHID**

HoHID

ActiveHHType

Active

ProjectID

LSAProjectType

EntryDate

ExitDate

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**tlsa\_Household**

**ESTGeography**

**RRHGeography**

**PSHGeography**

### Logic

Set **xGeography** = -1 for households not served in project group during the report period (**xStatus** < 10).

For households served in the project group during the report period (**xStatus** >= 10), **xGeography** is based on:

-   The active enrollment for the project group with the latest active date in the report period; and
-   The lsa\_ProjectCoC.*GeographyType* for the project.

If a household has more than one project group enrollment on their most recent active date, use the enrollment with the latest *EntryDate*.

HMIS Value

HMIS Response Category

LSA Value

1

Urban

1

2

Suburban

2

3

Rural

3

## EST/RRH/PSHLivingSit – LSAHousehold

tlsa\_Household

tlsa\_HHID

tlsa\_Household

hmis\_Enrollment

tlsa\_Enrollment

### Relevant Data

#### Source

**tlsa\_Household**

HoHID

HHType

EST/RRH/PSHStatus

**tlsa\_HHID**

HoHID

ActiveHHType

Active

LSAProjectType

EntryDate

**tlsa\_Enrollment**

EnrollmentID

EntryDate

**hmis\_Enrollment**

EnrollmentID

PersonalID

EntryDate

LivingSituation

RentalSubsidyType

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**tlsa\_Household**

**ESTLivingSit**

**RRHLivingSit**

**PSHLivingSit**

### Logic

Set **xLivingSit** = -1 for households not served in project group during the report period (**xStatus** < 10).

Set **ESTLivingSit** \= 99 for any household where tlsa\_HHID.**EntryDate** <> hmis\_Enrollment.*EntryDate* (i.e., night-by-night enrollments where the HMIS entry date did not correspond to a *BedNightDate*).

For other households (**xStatus** > 2), **xLivingSit** is based on *LivingSituation* and *RentalSubsidyType* for the enrollment with the earliest *EntryDate* for the project group..

-   If *LivingSituation* in (8,9), set xLivingSit = 98
-   If *LivingSituation* is NULL or 99, set **xLivingSit** \= 99
-   If *LivingSituation* = 435 and *RentalSubsidyType* is null, set **xLivingSit** \= 99
-   If LivingSituation = 435, set **xLivingSit** \= RentalSubsidyType
-   Otherwise, set **xLivingSit** \= *LivingSituation*.

Value

Destination

\-1

Not applicable

98

Data not provided by client

99

Data missing or invalid

101

Emergency shelter, including hotel or motel paid for with emergency shelter voucher, Host Home shelter

116

Place not meant for habitation (e.g., a vehicle, an abandoned building, bus/train/subway station/airport or anywhere outside)

118

Safe Haven

204

Psychiatric hospital or other psychiatric facility

205

Substance abuse treatment facility or detox center

206

Hospital or other residential non-psychiatric medical facility

207

Jail, prison, or juvenile detention facility

215

Foster care home or foster care group home

225

Long-term care facility or nursing home

302

Transitional housing for homeless persons (including homeless youth)

314

Hotel or motel paid for without emergency shelter voucher

329

Residential project or halfway house with no homeless criteria

332

Host Home (non-crisis)

335

Staying or living in a family member’s room, apartment, or house

336

Staying or living in a friend’s room, apartment, or house

410

Rental by client, no ongoing housing subsidy

411

Owned by client, no ongoing housing subsidy

419

Rental by client - VASH housing subsidy

420

Rental by client - Other ongoing subsidy

421

Owned by client, with ongoing housing subsidy

428

Rental by client - GPD TIP housing subsidy

431

Rental by client - RRH or equivalent subsidy

433

Rental by client - HCV voucher (tenant or project based) (not dedicated)

434

Rental by client - Public housing unit

436

Rental by client - Emergency Housing Voucher

437

Rental by client - Family Unification Program Voucher (FUP)

438

Rental by client - Foster Youth to Independence Initiative (FYI)

439

Rental by client - Permanent Supportive Housing

440

Rental by client - Other permanent housing dedicated for formerly homeless persons

## EST/RRH/PSHDestination – LSAHousehold

tlsa\_HHID

tlsa\_Household

### Relevant Data

#### Source

**tlsa\_Household**

HoHID

HHType

EST/RRH/PSHStatus

**tlsa\_HHID**

HoHID

ActiveHHType

Active

ExitDate

ExitDest

LSAProjectType

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**tlsa\_Household**

**ESTDestination**

**RRHDestination**

**PSHDestination**

### Logic

See section [3.3 HMIS Household Enrollments](#_ExitDest) for logic associated with setting destination for individual enrollments.

Set **xDestination** = -1 for households not served in project group and households enrolled in project group at ReportEnd (**xStatus** not in (12,22)).

For households that exited the project group during the report period (**xStatus** in (12,22)), **xDestination** is based on the active enrollment with the most recent **ExitDate** for the project group using the tlsa\_HHID.**ExitDest** value.

## EST/RRH/PSH Population Identifiers

tlsa\_HHID

tlsa\_Household

### Relevant Data

#### Source

**tlsa\_HHID**

HoHID

LSAProjectType

ActiveHHType

HHChronic

HHVet

HHDisability

HHFleeingDV

HHAdultAge

HHParent

AC3Plus

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**tlsa\_Household**

**EST/RRH/PSHChronic**

**EST/RRH/PSHVet**

**EST/RRH/PSHDisability**

**EST/RRH/PSHFleeingDV**

**EST/RRH/PSHAC3Plus**

**EST/RRH/PSHAdultAge**

**EST/RRH/PSHParent**

### Logic

In section 6.2, a household is included in any given population as long as at least one active **HouseholdID** with the same **HoHID**/**ActiveHHType** meets the criteria.

The population identifiers listed here use similar logic, but are specific to project group – they are only set if there is a record in tlsa\_HHID for the **HoHID**/**ActiveHHType** and the project type is consistent with the relevant project group:

-   EST – LSAProjectType in (0,1,2,8)
-   RRH – LSAProjectType = 13
-   PSH – LSAProjectType = 3

There are no project-group-specific columns for **HoHRaceEthnicity** as it is not subject to change with household composition.

#### EST/RRH/PSHAC3Plus

For records in tlsa\_Household where **HHType** = 2 and **HHChild** = 3, set **EST/RRH/PSHAC3Plus** to 1 if there is any active **HouseholdID** in tlsa\_HHID for the **HoHID** where **ActiveHHType** = **2** and **AC3Plus** = 1 and **LSAProjectType** is consistent with the project group. For all other records, set to 0.

#### EST/RRH/PSHVet

If there is any active **HouseholdID** for the **HoHID** where **ActiveHHType** = **HHType** and **HHVet** = 1 and **LSAProjectType** is consistent with the project group, set the value for **EST/RRH/PSHVet** to 1. Otherwise, set to 0.

#### EST/RRH/PSHChronic

If there is any active **HouseholdID** for the **HoHID** where **ActiveHHType** = **HHType** and **HHChronic** = 1 and **LSAProjectType** is consistent with the project group, set the value for **EST/RRH/PSHChronic** to 1. Otherwise, set to 0.

#### EST/RRH/PSHDisability

If there is any active **HouseholdID** for the **HoHID** where **ActiveHHType** = **HHType** and **HHDisability** = 1 and **LSAProjectType** is consistent with the project group, set the value for **EST/RRH/PSHDisability** to 1. Otherwise, set to 0.

#### EST/RRH/PSHFleeingDV

Set **EST/RRH/PSHFleeingDV** to the first value in the table below that occurs in tlsa\_HHID.**HHFleeingDV** for the same **HoHID** where **ActiveHHType** = **HHType** and **LSAProjectType** is consistent with the project group:

Priority

HHFleeingDV Value

1

1

2

2

3

0

#### EST/RRH/PSHParent

If there is any active HHID for the **HoHID** where **ActiveHHType** = **HHType** and **HHParent** \= 1 and **LSAProjectType** is consistent with the project group, set the value for **EST/RRH/PSHParent** to 1. Otherwise, set to 0.

#### EST/RRH/PSHAdultAge

Set **EST/RRH/PSHAdultAge** based on the first of the criteria below met by any active HHID record for the relevant project group with the same **HoHID** where **ActiveHHType** = **HHType**:

Priority

tlsa\_HHID

EST/RRH/PSHAdultAge

1

**HHAdultAge** = 18

18

2

**HHAdultAge** = 24

24

3

**HHAdultAge** = 55

55

4

**HHAdultAge** = 25

25

5

(any other)

\-1

## System Engagement Status and Return Time

tlsa\_HHID

tlsa\_Household

### Relevant Data

#### Source

**tlsa\_Household**

HoHID

HHType

**tlsa\_HHID**

HoHID

EntryDate

ExitDate

ExitDest

ActiveHHType

EnrollmentID

Active

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**tlsa\_Household**

**FirstEntry**

**Stat**

**StatEnrollmentID**

**ReturnTime**

### Logic

System engagement status specifies whether or not active households were actively engaged with continuum ES, SH, TH, RRH, and/or PSH projects in the two years prior to their earliest active date in the report period in the following categories:

Value

Stat

1

First-time homeless

2

Return to continuum 15-730 days after exit to permanent destination

3

Re-engage with continuum 15-730 days after exit to temporary destination

4

Re-engage with continuum 15-730 days after exit to unknown destination

5

Continuous engagement with continuum

#### FirstEntry

A household’s **FirstEntry** is the earliest *EntryDate* associated with any active enrollment.

#### Previous Activity / StatEnrollmentID

**StatEnrollmentID** is the tlsa\_HHID.**EnrollmentID** with the most recent (effective) **ExitDate** where:

-   **HoHID** = tlsa\_Household.**HoHID**
-   **ActiveHHType** \= tlsa\_Household.**HHType**
-   **ExitDate** for the earlier enrollment >= \[**FirstEntry** – 730 days\] and tlsa\_HHID.**ExitDate** < **FirstEntry**

#### ReturnTime

If StatEnrollmentID is NULL, **ReturnTime** = -1

Otherwise, set **ReturnTime** based on the number of days between StatEnrollmentID.**ExitDate** and **FirstEntry**:

Value

Category

\-1

0-14 days

30

15-30 days

60

31-60 days

90

61-90 days

180

91-180 days

365

181-365 days

547

366-547 days

730

548-730 days

#### Stat

If **FirstEntry** < ReportStart, **Stat** = 5 – the active enrollment is part of a period of continuous engagement with the continuum that began prior to the report period. This will include any household whose **EST**/**RRH**/**PSHStatus** is either 11 or 12, which indicate entry prior to the start of the report period

If **FirstEntry** >= ReportStart, it is necessary to look for inactive enrollments for the household in the two years prior to determine status.

Stat is based on **StatEnrollmentID** (if any) and the associated **ExitDate** and **ExitDest**.

Stat

Category

ExitDest

Other Condition

1

First-time homeless

(n/a)

**StatEnrollmentID** is NULL

2

Return 15-730 days after exit to permanent destination

Between 400 and 499

**ReturnTime** between 15 and 730

3

Re-engage 15-730 days after exit to temporary destination

Between 100 and 399

**ReturnTime** between 15 and 730

4

Re-engage 15-730 days after exit to other/unknown destination

< 100

**ReturnTime** between 15 and 730

5

Continuous engagement with continuum

(n/a)

**StatEnrollmentID** is not NULL and **ReturnTime** = -1

## RRHPreMoveInDays – LSAHousehold

tlsa\_HHID

tlsa\_Household

### Relevant Data

#### Source

**tlsa\_Household**

HoHID

HHType

**tlsa\_HHID**

HoHID

ActiveHHType

LSAProjectType

EntryDate

MoveInDate

ExitDate

Active

#### Target

**tlsa\_Household**

**Column Description**

**RRHPreMoveInDays**

Counts of actual days are set in tlsa\_Household; counts of active households are grouped by ranges – e.g., ‘1-7 days’, ‘8-30 days’, etc. – in the corresponding **LSAHousehold** column.

Averages based on the counts of actual days are inserted to LSACalculated. (See section [8.4 Get Average Days for Length of Time in RRH Projects](#_Get_Average_Days_2).)

### Logic

The logic associated with the LSAHousehold.**RRHPreMoveInDays** column differs from others that count days engaged in various parts of the system, referred to collectively as ‘system use days.’ The other counts resolve potential data conflicts so that each day has a single status and is counted only once. For example, days spent in RRH prior to move-in that overlap with days in emergency shelter are counted as ES days.

The **RRHPreMoveInDays** column is a count of distinct dates when a household was enrolled in an RRH housing project but not housed, regardless of other system use data.

For each active HHID where **HoHID**/**ActiveHHType** = tlsa\_Household. **HoHID**/**HHType** and **LSAProjectType** \= 13, set **RRHPreMoveInDays** = a count of the distinct dates between any tlsa\_HHID.**EntryDate** and the earliest associated non-NULL value for:

-   MoveInDate – 1 day
-   ExitDate
-   ReportEnd

## Dates Housed in PSH or RRH (sys\_Time)

tlsa\_Household

tlsa\_HHID

sys\_Time

The primary key for sys\_Time is the unique combination of **HoHID**, **HHType**, and **sysDate** – i.e., no date can be counted with more than one status for any given LSA household.

### Relevant Data

#### Source

**tlsa\_Household**

HoHID

HHType

**tlsa\_HHID**

HoHID

ActiveHHType

LSAProjectType

MoveInDate

ExitDate

Active

#### Target

**sys\_Time**

**Column Description**

**HoHID**

HoHID – tlsa\_Household

**HHType**

HHType – tlsa\_Household

**sysDate**

Distinct dates enrolled in a continuum project and/or Street/ES/SH dates from *3.917 Living Situation*

**sysStatus**

This step identifies dates when the household was:

-   1 = Housed in PSH
-   2 = Housed in RRH

Subsequent steps identify dates:

-   3 = In TH
-   4 = In ES/SH
-   5 = In PSH pre-move-in
-   6 = In RRH pre-move-in
-   7 = Street/ES/SH (3.917)

### Logic

LSAHousehold includes counts of the total number of days that a head of household was either homeless and/or engaged in various parts of the system, referred to collectively as ‘system use days.’ The counts are grouped by the client’s system status – i.e., ‘Days in TH’ or ‘Days Housed in PSH’ – on each relevant date.

Similar to the process of counting days for chronic homelessness, a head of household’s system use status for any given date is assigned in priority order, using the *first* status from the list below for which the HoH meets the identified criteria based on values in tlsa\_HHID and, for night-by-night enrollments, bed night dates in hmis\_Services.

Priority

Status

\[Date\]

1

Housed in PSH

\>= **MoveInDate** and

<= The first non-NULL of (**ExitDate** – 1 day) or ReportEnd

2

Housed in RRH

*\=* **MoveInDate**

2

Housed in RRH

\> **MoveInDate** and

<= The first non-NULL of (**ExitDate** – 1 day) or ReportEnd

3

In TH

\>= **EntryDate** and

<= The first non-NULL of (**ExitDate** – 1 day) or ReportEnd

4

In entry-exit ES/SH

\>= **EntryDate** and

<= The first non-NULL of (**ExitDate** – 1 day) or ReportEnd

4

In night-by-night ES

\= *BedNightDate*

5

Enrolled but not housed in PSH

\>= *EntryDate* and

<= The first non-NULL of (*MoveInDate* – 1 day*), ExitDate,* and ReportEnd

6

Enrolled but not housed in RRH

\>= *EntryDate* and

<= The first non-NULL of (*MoveInDate* – 1 day*), ExitDate,* and ReportEnd

7

Street/ES/SH (3.917)

\>= *DateToStreetESSH* and < *EntryDate*

In the CH process, enrollment dates are relevant regardless of household type or head of household status for the enrollment. However, system use days for a household are only counted for enrollments where the two defining characteristics of a household – **HoHID** and **ActiveHHType** – match tlsa\_Household.

#### Dates Housed in PSH

Dates housed in PSH are counted only for active enrollments.

For each **HoHID**/**HHType** in tlsa\_Household, create a record with a **sysStatus** = 1 in sys\_Time for any \[Date\] <= ReportEnd where:

-   tlsa\_HHID.**HoHID =** tlsa\_Household**.HoHID;** and
-   tlsa\_HHID.**ActiveHHType** \= tlsa\_Household.**HHType**; and
-   tlsa\_HHID.**Active** = 1; and
-   tlsa\_HHID.**LSAProjectType** \= 3; and
-   tlsa\_HHID.**MoveInDate** <= \[Date\]; and
-   tlsa\_HHID.**ExitDate** \> \[Date\] or is NULL

#### Dates Housed in RRH

Dates housed in RRH are counted only for active enrollments. As noted in section 3.3 ([HMIS Data Requirements and Assumptions](#RRHMoveInOnExitDate)) and reflected in the criteria listed below, the *MoveInDate* for an RRH enrollment is counted as a date housed even if it is equal to the *ExitDate*.

For each **HoHID**/**HHType** in tlsa\_Household, create a record with a **sysStatus** = 2 in sys\_Time for any \[Date\] <= ReportEnd where:

-   There is no existing record for the **HoHID**/**HHType**/**Date** in sys\_Time (i.e., the household was not housed in PSH on the date); and
-   tlsa\_HHID.**HoHID =** tlsa\_Household**.HoHID;** and
-   tlsa\_HHID.**ActiveHHType** \= tlsa\_Household.**HHType**; and
-   tlsa\_HHID.**Active** = 1; and
-   LSAProjectType = 13; and
-   **MoveInDate** <= \[Date\]; and
-   **ExitDate** \> \[Date\] or is NULL

## Get Last Inactive Date

tlsa\_HHID

tlsa\_Household

sys\_TimePadded

hmis\_Services

tlsa\_Household

This step identifies, based on active enrollments and potentially relevant inactive enrollments, the date immediately prior to the first day of continuous system engagement for which all system use days are counted – or the household’s last inactive date.

Specifically, this is the latest date in the most recent period of at least seven nights during which a household was not enrolled in a continuum ES, SH, TH, RRH, or PSH project AND was not housed in RRH or PSH. This is the date after which all system use days are reportable.

RRH-SO enrollments are not relevant to **LastInactive**.

### RelevantData

#### Source

**tlsa\_Household**

HoHID

HHType

FirstEntry

**tlsa\_HHID**

HoHID

ActiveHHType

EntryDate

ExitDate

**hmis\_Services**

EnrollmentID

*BedNightDate* (*DateProvided* where *RecordType* = 200)

#### Targets

**sys\_TimePadded**

**Column Description**

**HoHID**

From tlsa\_Household

**HHType**

From tlsa\_Household

**StartDate**

-   For tlsa\_HHID **EnrollmentID**s in night-by-night ES, each *BedNightDate* associated with the enrollment between LookbackDate and ReportEnd
-   For all other tlsa\_HHID enrollments, the **EntryDate**

**EndDate**

-   For tlsa\_HHID **EnrollmentID**s in night-by-night ES, the earlier of \[**StartDate** + 6 days\] or ReportEnd
-   For all other tlsa\_HHID enrollments, the earlier non-NULL of \[**ExitDate** + 6 days\] or ReportEnd

**tlsa\_Household**

**LastInactive**

### Logic

**LastInactive** is the later of \[LookbackDate – 1 day\] and the most recent date where:

-   \[Date\] < tlsa\_Household.**FirstEntry**
-   \[Date\] is not between a *BedNightDate* and (*BedNightDate* + 6 days) for any enrollment – active or inactive -- in tlsa\_HHID where **ActiveHHType** = tlsa\_Household.**HHType**
    -   Note that a *BedNightDate* must be valid – i.e., >= **EntryDate** for the associated enrollment and < **ExitDate** if there is one – in order to be relevant. In systems that allow the creation of invalid bed night data, report code must exclude those records.
-   \[Date\] is not between a tlsa\_HHID.**EntryDate** and the associated (**ExitDate** + 6 days) for any enrollment – active or inactive -- in tlsa\_HHID where **ActiveHHType** = tlsa\_Household.**HHType**

## Get Dates of Other System Use (sys\_Time)

tlsa\_HHID

tlsa\_Household

sys\_Time

hmis\_Services

### Relevant Data

#### Source

**tlsa\_Household**

HoHID

HHType

LastInactive

**tlsa\_HHID**

HoHID

ActiveHHType

LSAProjectType

EntryDate

MoveInDate

ExitDate

**hmis\_Services**

EnrollmentID

*BedNightDate* (*DateProvided* where *RecordType* = 200)

#### Target

See section [6.11 Dates Housed in PSH or RRH](#_Dates_Housed_in_1) for column descriptions.

**sys\_Time**

**HoHID**

**HHType**

**sysDate**

**sysStatus**

### Logic

In order to create a record in sys\_Time for a household on any given \[Date\], the following must be true:

-   \[Date\] is not in sys\_Time for the same **HoHID**/**HHType;** and
-   \[Date\] > tlsa\_Household.**LastInactive**; and
-   \[Date\] <= ReportEnd.

The **sysStatus** values referenced in the next sections are based on project type:

Value

Category

3

In transitional housing

4

In emergency shelter/Safe Haven

5

Enrolled but not housed in PSH

6

Enrolled but not housed in RRH

If a \[Date\] meets the criteria for more than one **sysStatus** based on the list below, use the **sysStatus** with the lowest value. For example, if a client has overlapping enrollments in both an emergency shelter (**sysStatus** = 4) and a transitional housing project (**sysStatus** = 3) on a single date, the **sysStatus** for that date should be the lower of the two values (3).

Value

Criteria

3

**LSAProjectType** = 2 and

\[Date\] >= **EntryDate** and

\[Date\] <= the first non-NULL of \[**ExitDate** – 1 day\] and ReportEnd

4

**LSAProjectType** in (0,8) and

\[Date\] >= **EntryDate** and

\[Date\] <= the first non-NULL of \[**ExitDate** – 1 day\] and ReportEnd

4

**LSAProjectType** = 1 and

\[Date\] = *BedNightDate*

5

**LSAProjectType** = 3 and

\[Date\] >= **EntryDate** and

\[Date\] < **MoveInDate**

5

**LSAProjectType** = 3 and

\[Date\] >= **EntryDate** and

**MoveInDate** is NULL and

\[Date\] <= the first non-NULL of \[**ExitDate** – 1 day\] and ReportEnd

6

**LSAProjectType** = 13 and

\[Date\] >= **EntryDate** and

\[Date\] < **MoveInDate**

6

**LSAProjectType** = 13 and

\[Date\] >= **EntryDate** and

**MoveInDate** is NULL and

\[Date\] <= the first non-NULL of \[**ExitDate** – 1 day\] and ReportEnd

## Get Other Dates Homeless from 3.917A/B Living Situation

tlsa\_Household

tlsa\_HHID

tlsa\_Household

hmis\_Enrollment

sys\_Time

Dates that are documented as Street/ES/SH dates in *3.917 Living Situation*, do not have a status based on system use, and are contiguous to the period of continuous engagement should be counted as Street/ES/SH dates for LOTH reporting. Unlike system use, this may include both dates prior to **LastInactive** and dates prior to LookbackDate**.**

### Relevant Data

#### Source

**tlsa\_Household**

LastInactive

HoHID

HHType

**tlsa\_HHID**

HoHID

ActiveHHType

EnrollmentID

LSAProjectType

EntryDate

ExitDate

**sys\_Time**

HoHID

HHType

sysDate

**hmis\_Enrollment**

EnrollmentID

EntryDate

LivingSituation

LengthOfStay

PreviousStreetESSH

DateToStreetESSH

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**tlsa\_Household**

**Other3917Days**

### Logic

For any active enrollment or any **EnrollmentID** from tlsa\_HHID where **HoHID**/**EntryHHType** = tlsa\_Household.**HoHID**/**HHType** and:

-   **EntryDate** *>* **LastInactive**; and
-   *DateToStreetESSH* < **EntryDate**; and

*LivingSituation* in (101,118,116); or

**LSAProjectType** in (0,1,8); or

*LengthOfStay* in (10, 11) and *PreviousStreetESSH* = 1; or

*LivingSituation* in (204,205,206,207,215,225) and *LengthOfStay* in (2,3) and *PreviousStreetESSH* = 1

The value of **Other3917Days** is equal to the count of all dates:

-   Between the later of *DateToStreetESSH* or **LastInactive** and the day prior to the associated **EntryDate** where the date does not already have a status based on system use.
-   Between any *DateToStreetESSH* and the day prior to **LastInactive** where the associated **EntryDate** is > **LastInactive**.

## Set System Use Days for LSAHousehold

sys\_Time

tlsa\_Household

Counts of actual days are set in tlsa\_Household; counts of active households are grouped by ranges – e.g., ‘1-7 days’, ‘8-30 days’, etc. – in the corresponding **LSAHousehold** column.

The values in tlsa\_Household are the source for averages in LSACalculated; see section [8.1 Get Average Days for Length of Time Homeless](#_Get_Average_Days_3) through section 8.8.

### Relevant Data

#### Source

**sys\_Time**

HoHID

HHType

sysDate

sysStatus

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**Tlsa\_Household**

**ESDays**

**THDays**

**ESTDays**

**RRHPSHPreMoveInDays**

**RRHHousedDays**

**SystemDaysNotPSHHoused**

**SystemHomelessDays**

**Other3917Days**

**TotalHomelessDays**

**PSHHousedDays**

### Logic

The values for system use days columns in tlsa\_Household should be set to the actual number of days counted and NOT the associated upload value; the actual number of days are needed to generate averages for LSACalculated.

#### ESDays

This is the total number of days in emergency shelter or Safe Haven for active enrollments and inactive enrollments that fall within a period of continuous system engagement that extends into the report period. ES days are not counted if conflicting enrollment data shows that the household was housed in RRH/PSH or enrolled in a transitional housing project.

Set **ESDays** = count of distinct **sysDate**s in sys\_Time where **sysStatus** = 4 and **HoHID/HHType** \= tlsa\_Household **HoHID/HHType.**

#### THDays

This is the total number of days in transitional housing for active enrollments and inactive enrollments that fall within a period of continuous system engagement that extends into the report period. TH days are not counted if conflicting enrollment data shows that the household was housed in RRH/PSH.

Set **THDays** = count of distinct **sysDate**s in sys\_Time where **sysStatus** = 3 and **HoHID/HHType** \= tlsa\_Household **HoHID/HHType.**

#### ESTDays

This is the total number of days in emergency shelter, Safe Haven, and/or transitional housing – **ESDays** + **THDays**.

Set **ESTDays** = count of distinct **sysDate**s in sys\_Time where **sysStatus** in (3,4) and **HoHID/HHType** \= tlsa\_Household **HoHID/HHType.**

#### RRHPSHPreMoveInDays

This is the total number of days enrolled but not housed in RRH Housing and/or PSH projects for active enrollments and for inactive RRH/PSH enrollments *without move-in dates* that fall within a period of continuous system engagement that extends into the report period. Pre-move-in days are not counted if conflicting enrollment data shows that the household was housed in RRH/PSH, enrolled in a transitional housing project, or in emergency shelter or Safe Haven.

Set **RRHPSHPreMoveInDays** \= count of distinct **sysDate**s in sys\_Time where **sysStatus** in (5,6) and **HoHID/HHType** \= tlsa\_Household **HoHID/HHType.**

#### SystemHomelessDays

This is the total number of days in emergency shelter, Safe Haven, transitional housing, and/or enrolled but not housed in RRH/PSH – **ESTDays + RRHPSHPreMoveInDays**.

Set **SystemHomelessDays** = count of distinct **sysDate**s in sys\_Time where **sysStatus** in (3,4,5,6) and **HoHID/HHType** \= tlsa\_Household **HoHID/HHType.**

#### RRHHousedDays

This is the total number of days housed in RRH Housing projects for active enrollments. RRH housed days are not counted if conflicting enrollment data shows that the household was housed in PSH.

Set **RRHHousedDays** = count of distinct **sysDate**s in sys\_Time where **sysStatus** = 2 and **HoHID/HHType** \= tlsa\_Household **HoHID/HHType.**

#### SystemDaysNotPSHHoused

This is the total number of days in emergency shelter, Safe Haven, transitional housing, enrolled but not housed in RRH/PSH and/or housed in RRH – **SystemHomelessDays** **\+ RRHHousedDays**.

Set **SystemDaysNotPSHHoused**\= count of distinct **sysDate**s in sys\_Time where **sysStatus** in (2,3,4,5,6) and **HoHID/HHType** \= tlsa\_Household **HoHID/HHType.**

#### PSHHousedDays

This is the total number of days housed in PSH for active enrollments.

Set **PSHHHousedDays** = count of distinct **sysDate**s in sys\_Time where **sysStatus** = 1 and **HoHID/HHType** \= tlsa\_Household **HoHID/HHType.**

#### Other3917Days

This is the total number of days not already accounted for when the household reported being on the street or in ES/SH in *3.917A/B Prior Living Situation*.

Set **Other3917Days** \= the sum of:

-   The count of distinct **sysDate**s in sys\_Time where **sysStatus** = 7 and **HoHID/HHType** \= tlsa\_Household **HoHID/HHType;** and
-   The count of distinct dates between the earliest relevant *DateToStreetESSH* and **LastInactive** – or the difference in days between the earliest *DateToStreetESSH* and **LastInactive**, as described in [section 6.14](#_Get_Other_Dates).

## Update EST/RRH/PSH/RRHSOStatus

sys\_Time

tlsa\_Household

For any **HoHID**/**HHType** in tlsa\_Household where **Stat** = 5 (continuous engagement), the household may have system use days from prior to the report period for project types other than those from the report period. This step updates the values for EST/RRH/PSHStatus to reflect that.

### Relevant Data

#### Source

**tlsa\_Household**

HoHID

HHType

ESTStatus

RRHStatus

PSHStatus

**sys\_Time**

HoHID

HHType

sysStatus

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**tlsa\_Household**

**ESTStatus**

**RRHStatus**

**PSHStatus**

### Logic

Set **ESTStatus** = 2 (Served in contiguous period prior to report start only) where:

-   **ESTStatus** = 0 and
-   Any record in sys\_Time for the **HoHID**/**HHType** has a **sysStatus** in (3,4)

Set **RRHStatus** = 2 (Served in contiguous period prior to report start only) where:

-   **RRHStatus** = 0 and
-   Any record in sys\_Time for the **HoHID**/**HHType** has a **sysStatus** = 6

Set **PSHStatus** = 2 (Served in contiguous period prior to report start only) where:

-   **PSHStatus** = 0 and
-   Any record in sys\_Time for the **HoHID**/**HHType** has a **sysStatus** = 5

## Set EST/RRH/PSHAIR

tlsa\_HHID

tlsa\_Household

tlsa\_Household

tlsa\_Enrollment

The EST/RRH/PSHAIR columns identify households active in residence during the report period. RRH-SO enrollments are not relevant to AIR status.

### Relevant Data

#### Source

**tlsa\_Household**

HoHID

HHType

**tlsa\_HHID**

HoHID

ActiveHHType

AIR

LSAProjectType

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column descriptions.

**Tlsa\_Household**

ESTAIR

RRHAIR

PSHAIR

### Logic

Set **EST/RRH/PSHAIR** = 1 for tlsa\_Household records with one or more records in tlsa\_HHID where:

-   tlsa\_HHID.**AIR** = 1
-   tlsa\_HHID.**ActiveHHType** = tlsa\_Household.**HHType**; and
-   tlsa\_HHID.**HoHID** = tlsa\_Household.**HoHID**; and
-   Project type is consistent with project group:
-   EST - **LSAProjectType** in (0,1,2,8)
-   RRH - LSAProjectType = 13
-   PSH - LSAProjectType = 3

For households with no bed nights in the report period in a given project group, set the value to 0.

## Set SystemPath for LSAHousehold

tlsa\_Household

The **SystemPath** column is technically redundant – it is based entirely on values in other LSAHousehold columns – but having the value in a single column simplifies the processes of populating LSACalculated and, in the HDX 2.0, generating report tables.

RRH-SO enrollments are not relevant to System Path.

### Relevant Data

#### Source

**tlsa\_Household**

ESTStatus

ESDays

THDays

RRHStatus

PSHStatus

PSHMoveIn

#### Target

See section [6.1 Get Distinct Households for LSAHousehold](#_Get_Distinct_Households) for column description.

**Tlsa\_Household**

**SystemPath**

### Logic

As noted previously, heads of household housed in PSH at ReportStart who did not enroll in any other project types during the report period are excluded from all reporting on LOTH and system path, as are those who were only served in RRH-SO. For those households, **SystemPath** is always set to -1. The criteria for all values are listed below.

Name

SystemPath

ESTStatus

ESDays

THDays

RRHStatus

PSHStatus

PSHMoveIn

Not applicable

\-1

Not in (21,22)

\--

\--

Not in (21,22)

\--

\= 2

ES/SH only

1

\--

\>= 1

\= 0

\= 0

\= 0

\--

TH only

2

\--

\= 0

\>= 1

\= 0

\= 0

\--

ES/SH + TH

3

\--

\>= 1

\>= 1

\= 0

\= 0

\--

RRH only

4

\= 0

\--

\--

\>= 11

\= 0

\--

ES/SH + RRH

5

\--

\>= 1

\= 0

\>= 2

\= 0

\--

TH + RRH

6

\--

\= 0

\>= 1

\>= 2

\= 0

\--

ES/SH + TH + RRH

7

\--

\>= 1

\>= 1

\>= 2

\= 0

\--

PSH only

8

\= 0

\--

\--

\= 0

\>= 11

<> 2

ES/SH + PSH

9

\--

\>= 1

\= 0

\= 0

\>= 11

<> 2

ES/SH + PSH

9

In (21,22)

\>= 1

\= 0

\= 0

\>= 11

\= 2

ES/SH + RRH + PSH

10

\--

\>= 1

\= 0

\>= 2

\>= 11

<> 2

ES/SH + RRH + PSH

10

In (21,22)

\>= 1

\= 0

In (21,22)

\>= 11

\= 2

RRH + PSH

11

\= 0

\--

\--

\>= 2

\>= 11

<> 2

RRH + PSH

11

\= 0

\--

\--

In (21,22)

\>= 11

\= 2

All other

12

(any combination of these columns not specified above)

## LSAHousehold

tlsa\_Household

lsa\_Household

LSAHousehold includes 45 columns. **RowTotal** is a count of distinct combinations of **HoHID** and **HHType** from tlsa\_Household, grouped by the values in all other columns.

In tlsa\_Household, the following columns are populated with actual counts of days because they are needed to generate averages for LSACalculated:

**ESDays**

**RRHPreMoveInDays**

**SystemHomelessDays**

**THDays**

**RRHPSHPreMoveInDays**

**Other3917Days**

**ESTDays**

**RRHHousedDays**

**TotalHomelessDays**

**SystemDaysNotPSHHoused**

For export, the actual counts are grouped into categories as shown below.

Value

System Use/Homeless Days

Criteria

0

0 days

\[Days\] = 0

7

1-7 days

\[Days\] between 1 and 7

30

8-30 days

\[Days\] between 8 and 30

60

31-60 days

\[Days\] between 31 and 60

90

61-90 days

\[Days\] between 61 and 90

180

91-180 days

\[Days\] between 91 and 180

365

181-365 days

\[Days\] between 181 and 365

547

366-547 days

\[Days\] between 366 and 547

730

548-730 days

\[Days\] between 548 and 730

1094

731-1094 days

\[Days\] between 731 and 1094

1095

1095 days+

\[Days\] > 1094

Actual values in the **PSHHousedDays** column also have to be grouped into upload categories; the groupings differ from those used for the other columns of system use days:

Value

Time Housed in PSH

Criteria

0

None

**PSHMoveIn** not in (1,2)

3

Up to 3 months

**PSHHousedDays** between 1 and 90

6

3-6 months

**PSHHousedDays** between 91 and 180

12

6-12 months

**PSHHousedDays** between 181 and 365

24

12-24 months

**PSHHousedDays** between 366 and 730

36

25-36 months

**PSHHousedDays** between 731 and 1095

48

37-48 months

**PSHHousedDays** between 1096 and 1460

60

49-60 months

**PSHHousedDays** between 1461 and 1825

84

5-7 years

**PSHHousedDays** between 1826 and 2555

120

8-10 years

**PSHHousedDays** between 2556 and 3650

121

10+ years

**PSHHousedDays** \> 3650

All of the columns in LSAHousehold are integers; none may be NULL.

#

Column Name

1

**RowTotal**

2

**Stat**

3

**ReturnTime**

4

**HHType**

5

**HHChronic**

6

**HHVet**

7

**HHDisability**

8

**HHFleeingDV**

9

**HoHRaceEthnicity**

11

**HHAdult**

12

**HHChild**

13

**HHNoDOB**

14

**HHAdultAge**

15

**HHParent**

16

**ESTStatus**

17

**ESTGeography**

18

**ESTLivingSit**

19

**ESTDestination**

20

**RRHStatus**

21

**RRHMoveIn**

22

**RRHGeography**

23

**RRHLivingSit**

24

**RRHDestination**

25

**RRHPreMoveInDays**

26

**PSHStatus**

27

**PSHMoveIn**

28

**PSHGeography**

29

**PSHLivingSit**

30

**PSHDestination**

31

**PSHHousedDays**

32

**ESDays**

33

**THDays**

34

**ESTDays**

35

**RRHPSHPreMoveInDays**

36

**RRHHousedDays**

37

**SystemDaysNotPSHHoused**

38

**SystemHomelessDays**

39

**Other3917Days**

40

**TotalHomelessDays**

41

**SystemPath**

42

**ESTAIR**

43

**RRHAIR**

44

**PSHAIR**

45

**RRHSOStatus**

46

**RRHSOMoveIn**

4547

**ReportID**

# HMIS Business Logic: LSAExit

This section is required only if **LSAScope** <> 3 (HIC).

Each distinct combination of **Cohort**, the *PersonalID* for the head of household (**HoHID**), and household type (**HHType**) associated with one or more qualifying exits in the cohort period represents a single household/cohort member for LSAExit.

As with the active cohort, a household is identified based on each unique combination of HoHID/HHType. Aside from the dates, there are no differences in logic among the three exit cohorts.

## Identify Qualifying Exits in Exit Cohort Periods

tlsa\_HHID

tlsa\_HHID

lsa\_Project

tlsa\_CohortDates

lsa\_Report

The objective of this step is to identify records in tlsa\_HHID that represent system exits in each exit cohort period.

### Relevant Data

#### Source

**tlsa\_CohortDates**

Cohort

CohortStart

CohortEnd

**tlsa\_HHID**

EnrollmentID

HoHID

ProjectID

EntryDate

ExitDate

ActiveHHType

Exit1HHType

Exit2HHType

**lsa\_Project**

ProjectID

#### Target

A household may have multiple qualifying exits in a given cohort period. When this is the case, reporting is based on the earliest qualifying exit to a permanent destination or, if there is no exit to a permanent destination, the earliest exit to any destination.

All qualifying exits are identified in tlsa\_HHID in this step by setting the **ExitCohort** value; reportable exits are selected for each unique combination of HoHID, household type, and cohort in the next step based on the values in the **ExitCohort** and **ExitDest** columns.

**tlsa\_HHID**

**ExitCohort**

### Logic

#### Qualifying Exits

A qualifying exit is an exit from a continuum ES, SH, TH, RRH, or PSH project – limited in one of the three exit cohort periods followed by at least 14 days when the household was not active in any continuum ES, SH, TH, RRH, or PSH project.

Set tlsa\_HHID.**ExitCohort** = tlsa\_CohortDates.**Cohort** to identify a qualifying exit (qx) where:

-   qx.**ExitDate** between tlsa\_CohortDates.**CohortStart** and **CohortEnd** where **Cohort** between -2 and 0
-   There is no other record in tlsa\_HHID where:
    -   \[Other\].**HoHID** = qx.**HoHID**
    -   Household type values match:
        -   If ExitCohort = 0, ActiveHHType
        -   If ExitCohort = -1, Exit1HHType
        -   If ExitCohort = -2, Exit2HHType
    -   \[Other\].**ExitDate** is NULL or \[Other\].**ExitDate** > qx.**ExitDate**
    -   \[Other\].**EntryDate** < \[qx.**ExitDate** \+ 14 days\]

If lsa\_Report.**LSAScope** = 2 (Project-Focused), exit cohorts are limited to households served in the projects in lsa\_Project – qx.**ProjectID** in lsa\_Project.**ProjectID.** This limitation does not apply to a systemwide LSA (**LSAScope** = 1).

## Select Reportable Exits

tlsa\_HHID

tlsa\_Exit

LSAExit includes reporting on households with qualifying exits from a continuum ES/SH/TH/RRH/PSH projects in each of the exit cohort periods.

For households – unique combinations of **HoHID** and relevant household type – with more than one qualifying exit in a single cohort period, only one qualifying exit is reportable. The logic associated with identifying reportable exits is below.

### Relevant Data

#### Source

**tlsa\_HHID**

ExitCohort

ExitDest

HoHID

HouseholdID

ActiveHHType

Exit1HHType

Exit2HHType

EnrollmentID

LSAProjectType

EntryDate

MoveInDate

ExitDate

ExitTo

#### Target

**tlsa\_Exit**

**Column Description**

**HoHID**

*PersonalID* for heads of active households; distinct combinations of **HoHID**, **HHType**, and **Cohort** serve as a primary key.

**HHType**

Household type

**QualifyingExitHHID**

From tlsa\_HHID, the *HouseholdID* for household’s first exit to permanent housing in the cohort period, or – if the household does not have an exit to permanent housing – the first qualifying exit to any destination type.

LastInactive

The most recent date prior to the *EntryDate* for the qualifying exit on which the household had not been active in a continuum ES/SH/TH/RRH/PSH project for 7 or more days.

**Cohort**

Identifier for the cohort in which the exit occurs – from tlsa\_HHID.**ExitCohort**.

Stat

The household status related to continuum engagement in the two years prior to the *EntryDate* for the qualifying exit.

**ExitFrom**

Identifies the project type from which household exited and, for RRH/PSH, distinguishes between exits after a permanent housing placement (*MoveInDate*) and exits without placement.

**ExitTo**

Identifies the exit destination for the qualifying exit (from tlsa\_HHID **QXDestination**)

ReturnTime

For households with at least one enrollment in a continuum ES/SH/TH/RRH/PSH projects in the 15-720 days after the qualifying exit, the number of days between the qualifying exit date and the earliest subsequent *EntryDate*.

HHVet

Identifies whether or not the household includes a veteran.

HHChronic

Identifies whether or not the head of household or any adult household member is chronically homeless or has other specific patterns of long-term homelessness.

HHDisability

Identifies whether or not the head of household or any adult household member was identified as having a disabling condition on the enrollment associated with the qualifying exit.

HHFleeingDV

Identifies whether or not the head of household or any adult member was identified as fleeing domestic violence on the enrollment associated with the qualifying exit.

HoHRaceEthnicity

Identifies race and ethnicity for head of household.

HHAdultAge

The age groups of adult household members. The categories are mutually exclusive (a household can only fall into one group) and inclusive (every household with adults will fall into one group).

HHParent

Identifies whether or not any household member has RelationshiptoHoH = 2 (child of the HoH) on any active enrollment in the cohort period.

AC3Plus

Identifies AC households that include 3 or more children on any active enrollment in the cohort period.

SystemPath

The combinations of system use during the cohort period and in the continuous periods of service prior to the cohort period – i.e., the ‘path’ through the system. It is not dependent on the sequence of service. Categories are mutually exclusive.

**ReportID**

From lsa\_Report

### Logic

#### Exit Households

LSAExit reporting is based on a single record in tlsa\_Exit for each unique combination of:

-   tlsa\_HHID.**ExitCohort**; and
-   tlsa\_HHID.**HoHID** – the HoHID from tlsa\_HHID for each household with a qualifying exit in the cohort period; and
-   Household Type:
    -   If ExitCohort = 0, ActiveHHType
    -   If ExitCohort = -1, Exit1HHType
    -   If ExitCohort = -2, Exit2HHType

#### QualifyingExitHHID

The **QualifyingExitHHID** for an exit household is the tlsa\_HHID.**HouseholdID** associated with:

-   The earliest qualifying exit to a permanent destination / earliest **ExitDate** where **ExitDest** between 400 and 499; or
-   If there is no qualifying exit to a permanent destination, the earliest exit to a temporary destination / earliest **ExitDate** where **ExitDest** between 100 and 399; or
-   If there is no qualifying exit to an identified temporary destination, the earliest qualifying exit.

If there are two or more enrollments with the same exit date within a given destination category:

-   Select the one with the lowest **ExitDest** value; or
-   If multiple enrollments have the same exit date and **ExitDest** value, select the one with the earliest entry date; or
-   If multiple enrollments have the same exit date, **ExitDest** value, and entry date, select the one with the highest **EnrollmentID**.

#### ExitFrom

Crosswalk tlsa\_HHID. **LSAProjectType** and tlsa\_HHID **MoveInDate** for the reportable exit to the appropriate **ExitFrom** value below.

LSAProjectType

MoveInDate

ExitFrom Value

ExitFrom Category Description

0,1

n/a

2

ES

2

n/a

3

TH

8

n/a

4

SH

13

Not NULL

5

RRH after move-in to PH

3

Not NULL

6

PSH after move-in to PH

13

NULL

7

RRH without placement in PH

3

NULL

8

PSH without placement in PH

15

Not NULL

9

RRH-SO after move-in to PH

15

NULL

10

RRH-SO without placement in PH

## Set ReturnTime for Exit Cohort Households

tlsa\_Exit

tlsa\_HHID

### Relevant Data

#### Source

**tlsa\_HHID**

HoHID

HouseholdID

ExitCohort

ActiveHHType

Exit1HHType

Exit2HHType

EntryDate

ExitDate

**tlsa\_Exit**

HHType

QualifyingExitHHID

#### Target

**tlsa\_Exit**

**ReturnTime**

### Logic

#### Household Returns

A household is reported as a return if there is a later enrollment for the household in tlsa\_HHID after the qualifying exit (qx) where:

-   \[Return\].**HoHID** = tlsa\_Exit.**HoHID**
-   \[Return\].**EntryDate** between \[qx.**ExitDate** + 15 days\] and \[qx.**ExitDate** + 730 days\]
-   The household type matches tlsa\_Exit.**HHType** for the tlsa\_Exit.**Cohort**:
    -   If Cohort = 0, ActiveHHType
    -   If Cohort = -1, Exit1HHType
    -   If Cohort = -2, Exit2HHType

#### ReturnTime

If there is no later enrollment that meets the criteria for a household return, set **ReturnTime** \= -1.

Otherwise, **ReturnTime** is the number of days between

1.  The ExitDate for the QualifyingExitHHID and
2.  The **EntryDate** for the earliest return enrollment.

The value should be set in tlsa\_Exit to the actual number of days to return and NOT the associated upload value; the actual number of days are needed to generate averages for LSACalculated.

**Note**: Both LSAHousehold/tlsa\_Household and LSAExit/tlsa\_Exit have columns named **Stat** and **ReturnTime**.

For both, **Stat** is determined based on a household’s system use **prior to** active enrollments (tlsa\_Household) or a qualifying exit (tlsa\_Exit).

The logic associated with **ReturnTime** is different, however:

-   In tlsa\_Household, **ReturnTime** is associated with **Stat** and specifies the length of time between enrollment activity *prior to active enrollments* and the earliest active enrollment.
-   In tlsa\_Exit, **ReturnTime** is not associated with **Stat** – it specifies the length of time *after the qualifying exit***.**

## ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAYUAAACxCAMAAAAcYVF1AAAAAXNSR0ICQMB9xQAAAG9QTFRFAAAAGBgYCAgIEBAQICAgODg4MDAwKCgoQEBAUFBQWFhYSEhIZ0ZWeHh4f39/cHBwaGhoYGBgh4eHj4+Pl5eXn5+fvIGev7+/r6+vp6ent7e3woWjx8fH39/fz8/P19fX69fh9/f35+fn7+/v////bRFYzwAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAATRSURBVHja7d1pe+I2FIbhlxSoaRvThJk67SQZsfz/39gJYLzvNhLWoy9c8RZbt4+PjWShk4WyX0haBkHwHEbvJ8pJ1v7zRxRFr2Gw0mLzGqFguxzengOttp8oWC/vu/Xv4QcK1svPcBl4emlySOFXiYLAy2ztlsIvh9XmiIL98rb2L0+7p3D6WP3rncIPN0p6n/Yb3xj0w1SWmlmjlyzD+icK1hVOn6s9CtYVTn9/Q8G+wtsGBfsKh4VnCg7eJJ2cvIP2LxZQQAEFFFBwXEHNFSkUplRQdRVLqlPQZRE1W6HQXyEzR9XzhcJQhfPJfD2rs2e2MhHxNTP7123NJCgu61+3kdoWCi1joXjSKztft8Xiir7Fwc0rvTERCz0UZHKXeRWUsh85hXRQXT5Q6JEXpNJM0FJB6ViIL2UodFbIV2K2YmsUZMoVDAqtFa4xEF9G0heS27R0lSvFls7nSWZOr4YCz84PrHC9B0WBWEABBRRQQAEFFFBAYe4K9IRxQIH94mhRQIGjRQEFjhYFFDhaFFBAAQUUUEABhUdR4DtVJxRoX0ABBRRQQCGtQHYmFogFFFBAAYV5KQgFywqqUsi/ByoUbCh0DxgUeio0jAlwNVJhJAwUpogFFU7568ucZcNgoDCVgspygcm/eI7CxHmhZkwAFO6mYEoVuCLdRaFyTIAkbyfBgsJUCiMWFEZTGDAmAArEAgpTKrjShNXUwjVzhcZ/axwoKKCAAgoo3E3hYbLznHvCPEwsuHoHjQIKKKAwF4XDMAWNWMdq3OpsFZ62h74KMh16lqiknlVV91Vbnq2CdHYYV6FqQRQqFc4OPRS69SxJpkmmMJ540g+itjuKwwoN5begtlwWevqrfyyocC6X9SyJW1TileIGFuXNyn5z4vFj4RjVlnNtLHb/DFBQWS4wFYPpp+mUnT1nheZQWuz2w/JCm54lVQrKDMPvrcKXwdDs3KJnSblCvGQmIXiosLv8Snev54UuPUvKs7NMarKSTV5XKlHg2zzrhfaFFrs2wa9NoEAsoIACCijUK3CPRCwQCyigcBcFD/qpynmFRyl9FWTqWqSUaxNpfvZEYXqF5sBBoYdCc7tgXqGBAYUBsaBCjri1AaZaOlCYWEG3yCAWLOaF0nZBFO6sYFoqkJ0nUKhuF+RO9Y4KIxcURlEY2C6IArGAAgoooIACCiiggAIKKJQrONkRht9rY784WhTYL44WBfaLo0WB/eJoUUCBo0UBBdeOlu+RnFDgO1UUUEABBRRQcE1hzm+dEwvEAgoooDClgjrVqzqtgEIbBZkWo093URAKYyr0jAUUuis0vGX+9Yqhbh+Z95zPk+IXck16GaHQMxZUOJXjd8yT15+TRWWSOSUTUOiroHwuUAEpp2By463LoDA4L6hi3OMWCuVRhUKf7IyCPYX60aezVZvLzqmMkJpgyM49FHh2dlFh5NGnUSAWUEABBRRQQAEFFFBAoaXC/skzBSd7wkSBXwpu7lYYomC9HNcfKFgvL9+9QnBT4duLXwhOKmz/2KNguRxWO88M3FM4Pi/fvUNwTOEYLl99uxq5phC9LMOjhwYOKXxuF8F3Pw0cUYhe/3xa7w6eElhX+Ix24SZQ8Pyfj9nAssJ+EwTBUtI62IZvkdcA5/I/JNjCm9jHecAAAAAASUVORK5CYII=)Identify HoH and Adult Members of Exit Cohorts

### Relevant Data

#### Source

**tlsa\_CohortDates**

Cohort

CohortEnd

**tlsa\_Exit**

QualifyingExitHHID

Cohort

**tlsa\_HHID**

HouseholdID

EntryDate

MoveInDate

ExitDate

**tlsa\_Enrollment**

HouseholdID

PersonalID

RelationshipToHoH

ExitDate

ActiveAge

Exit1Age

Exit2Age

**hmis\_Enrollment**

EntryDate

TimesHomelessPastThreeYears

MonthsHomelessPastThreeYears

#### Target

See section [5.3 Get Active Clients for LSAPerson](#_Get_Active_Clients) for column descriptions.

**tlsa\_ExitHoHAdult**

**PersonalID**

**QualifyingExitHHID**

**Cohort**

**DisabilityStatus**

**CHStart**

**LastActive**

**CHTime**

**CHTimeStatus**

### Logic

The three-year timeframe for each head of household/adult – the CH date range – is identified in tlsa\_ExitHoHAdult with dates in the **CHStart** and **LastActive** columns. People included in more than one cohort will have different CH dates for each cohort.

#### Record Selection

An exit cohort household is only considered chronically homeless if they meet the definition in the year ending on the head of household’s exit date. As such, any household exiting from TH after a stay of at least a year or housed in RRH or PSH for a year prior to exit is excluded from this process.

For each **QualifyingExitHHID** in tlsa\_Exit, select **PersonalID**s from tlsa\_Enrollment where:

-   tlsa\_Exit.**ExitFrom** <> 3 or tlsa\_HHID.**EntryDate** > \[tlsa\_HHID.**ExitDate** – 1 year\]; and
-   tlsa\_Exit.**ExitFrom** not in (5,6) or tlsa\_HHID.**MoveInDate** > \[tlsa\_HHID.**ExitDate** – 1 year\]; and
-   tlsa\_Enrollment.HouseholdID = QualifyingExitHHID; and
-   tlsa\_Enrollment.**ExitDate** >= **CohortStart**; and
    -   tlsa\_Enrollment.**RelationshipToHoH** = 1; or
    -   **Cohort** = 0 and **ActiveAge** between 21 and 65; or
    -   **Cohort** = -1 and **Exit1Age** between 21 and 65; or
    -   **Cohort** = -2 and **Exit2Age** between 21 and 65.

#### DisabilityStatus

Set to 1 if the value is 1 for any **EnrollmentID** associated with the **QualifyingExitHHID** that meets the selection criteria.

Set to 0 if the value is 0 for any **EnrollmentID** associated with the **QualifyingExitHHID** that meets the selection criteria and there is no record for the given PersonalID that meets the criteria above.

Otherwise, set to 99.

#### LastActive

**LastActive** is the **ExitDate** from tlsa\_Enrollment where **HouseholdID** = tlsa\_Exit.**QualifyingExitHHID**.

In systems where a household member may have more than one *EnrollmentID* for a given *HouseholdID*, **LastActive** should be set to the most recent tlsa\_Enrollment.**ExitDate** associated with the **QualifyingExitHHID** that meets the selection criteria.

#### CHStart

**CHStart** is (**LastActive** – 3 years) + 1 day.

#### CHTime and CHTimeStatus

The process of setting **CHTime** and **CHTimeStatus** is described in sections 7.5 through 7.8. It is similar to the process used to set the column values in tlsa\_Person (sections 5.5-5.10). At the person level, there are three combinations of values (shown below) in these columns that – in combination with **DisabilityStatus** = 1 – indicate that the person meets the criteria for chronic homelessness, and any households of which they are a member are included in the Chronically Homeless Households population.

CHTime

CHTimeStatus

Category

365

1

Client has a ch\_Episode\_exit where **episodeDays** >= 365 with an **episodeEnd** in the year ending on **LastActive**

365

2

Client has 4 or more episodes and the sum of **episodeDays** for all ch\_Episodes\_exit is >= 365.

400

2

Based on 3.917 Living Situation for an enrollment with an **EntryDate** in the year ending on **LastActive**, client was on the street or in ES/SH for 12 or more months and in four or more episodes in three years.

There is no person-level reporting for the exit cohorts, however. The end result of any of these three, in combination with **DisabilityStatus** = 1, is that tlsa\_Exit.**HHChronic** = 1. As long as any adult or head of household associated with the **QualifyingExitHHID** is going to result in **HHChronic** = 1, there is no need to go through the processes described in steps 7.5-7.8 for the associated records in tlsa\_ExitHoHAdult. As such, we can set **CHTime** = 400 and **CHTimeStatus** = 2 directly in tlsa\_ExitHoHAdult for all members of the household where the head of household or an adult with an exit date in the cohort period has:

-   hmis\_Enrollment.*MonthsHomelessPastThreeYears* in (112,113); and
-   hmis\_Enrollment.TimesHomelessPastThreeYears = 4; and
-   hmis\_Enrollment.*EntryDate* = tlsa\_Enrollment.**EntryDate[\[2\]](#footnote-3)**
-   hmis\_Enrollment.*EntryDate* > \[**LastActive** – 1 year\]

In systems where a household member may have more than one *EnrollmentID* for a given *HouseholdID*, these values may be set based on any enrollment associated with the **QualifyingExitHHID** that meets the selection criteria.

It is not necessary to include these tlsa\_ExitHoHAdult records in the subsequent steps 7.5-7.8.

## Get Dates to Exclude from Counts of ES/SH/Street Days (ch\_Exclude\_exit)

tlsa\_ExitHoHAdult

tlsa\_Enrollment

ch\_Exclude\_exit

### Relevant Data

#### Source

**tlsa\_ExitHoHAdult**

PersonalID

CHStart

LastActive

CHTime

**tlsa\_Enrollment**

PersonalID

LSAProjectType

EntryDate

MoveInDate

ExitDate

#### Target

**ch\_Exclude\_exit**

**Column Description**

**PersonalID**

**PersonalD**

**ExcludeDate**

Distinct dates between a person’s earliest **CHStart** and latest **LastActive** when client was either in TH or housed in RRH/PSH.

### Logic

For each **PersonalID** in tlsa\_ExitAdultHoH where **CHTime** and **CHTimeStatus** were not set in step 7.4 (i.e., where **CHTime** is NULL), dates enrolled in TH or housed in RRH/PSH are inserted to ch\_Exclude\_exit based on tlsa\_Enrollment where:

-   **ExitDate** > the earliest **CHStart**; and
-   \[Date\] < tlsa\_Enrollment.**ExitDate; and**
-   \[Date\] between earliest **CHStart** and latest **LastActive;** and
    -   LSAProjectType = 2; and
    -   \[Date\] >= tlsa\_Enrollment.**EntryDate**

OR

-   -   **LSAProjectType** in (3,13); and
    -   \[Date\] >= tlsa\_Enrollment.**MoveInDate**

## Get Dates to Include in Counts of ES/SH/Street Days (ch\_Include\_exit)

tlsa\_ExitHoHAdult

tlsa\_Enrollment

ch\_Include\_exit

hmis\_Enrollment

hmis\_Services

### Relevant Data

#### Source

**tlsa\_ExitHoHAdult**

PersonalID

CHStart

LastActive

CHTime

**tlsa\_Enrollment**

PersonalID

EnrollmentID

LSAProjectType

EntryDate

MoveInDate

ExitDate

**hmis\_Enrollment**

EnrollmentID

LivingSituation

LengthOfStay

PreviousStreetESSH

DateToStreetESSH

**hmis\_Services**

EnrollmentID

*BedNightDate* (*DateProvided* where *RecordType* = 200)

#### Target

**ch\_Include\_exit**

**Column Description**

**PersonalID**

**PersonalD**

**ESSHStreetDate**

Distinct dates between earliest **CHStart** and latest **LastActive** when client was in ES/SH or on the street; also referred to as ES/SH/Street dates.

### Logic

For each **PersonalID** in tlsa\_ExitHoHAdult where **CHTime** and **CHTimeStatus** were not set in step 7.4 (i.e., where **CHTime** is NULL), any date between the earliest **CHStart** and latest **LastActive** may be counted as an **ESSHStreetDate** based on HMIS data if:

-   The date is not excluded because the client was enrolled in a TH project or enrolled and housed in an RRH/PSH project (ch\_Exclude\_exit.**ExcludeDate**); and
-   The date is consistent with any set of criteria listed below based on tlsa\_Enrollments where **ExitDate** \> than the earliest **CHStart** and **EntryDate** <= the latest **LastActive**.

#### Enrollment in Entry/Exit ES or SH

**LSAProjectType** in (0,8); and

**ESSHStreetDate** >= (later of **EntryDate** and earliest **CHStart**)*;* and

ESSHStreetDate < ExitDate

#### Bed Nights in Night-by-Night ES

LSAProjectType = 1; and

**ESSHStreetDate** = *BedNightDate*

*BedNightDate* >= LookbackDate

*BedNightDate* \>= **EntryDate** for the associated enrollment

*BedNightDate* < tlsa\_Enrollment.**ExitDate**

#### ES/SH/Street Dates from 3.917 Living Situation

For enrollments where **EntryDate** > earliest **CHStart**, dates on which the client was on the street on in ES/SH based on 3.917 are included as **ESSHStreetDate**s if they have not already been excluded or included based on prior criteria and fall between the earliest **CHStart** and latest **LastActive**.

-   An **ESSHStreetDate** is counted for ES and SH projects (**LSAProjectType** in (0,1,8)) if:
-   *LivingSituation* in (101,118,116); and
-   **ESSHStreetDate** >= *DateToStreetESSH* and < **EntryDate.**
-   For TH, PSH, and RRH projects (**LSAProjectType** in (2,3,13,15)), **ESSHStreetDate**s based on 3.917 are only counted if the client was in ES/SH or on the street prior to entry:
-   *LivingSituation* in (101,118,116); or
-   LengthOfStay in (10, 11) and PreviousStreetESSH = 1; or
-   *LivingSituation* in (204,205,206,207,215,225) and *LengthOfStay* in (2,3) and *PreviousStreetESSH* = 1
-   And **ESSHStreetDate** >= *DateToStreetESSH*; and
    -   LSAProjectType = 2 and ESSHStreetDate < EntryDate; or
    -   **LSAProjectType** in (3,13,15) and
        -   ESSHStreetDate < MoveInDate; or
        -   MoveInDate is NULL and ESSHStreetDate < ExitDate

#### Gaps of Less than Seven Days Between Two ES/SH/Street Dates

Any date that falls between two ES/SH/Street dates that have been identified using the criteria above and are less than 7 days apart is counted as a ES/SH/Street day.

\[Date\] > \[**ESSHStreetDate***1*\]*;* and

\[Date\] < \[**ESSHStreetDate***2*\]; and

(\[ESSHStreetDate*1*\] + 7 days) >= \[ESSHStreetDate*2*\]

For example, if a client has *BedNightDate*s on June 1 and June 5 of the same year, the 3 dates between – June 2, 3, and 4 – are also counted as ES/SH/Street dates.

Note that gaps of less than 7 days between **ESSHStreetDate**s are counted as ES/SH/Street dates regardless of ch\_Exclude\_exit dates.

## Get ES/SH/Street Episodes (ch\_Episodes\_exit)

ch\_Include\_exit

ch\_Episodes\_exit

### Relevant Data

#### Source

**ch\_Include\_exit**

PersonalID

ESSHStreetDate

#### Target

ch\_Episodes\_exit

Column Description

PersonalID

tlsa\_Person

episodeStart

The first ES/SH/Street date in the series.

episodeEnd

The last ES/SH/Street date in the series.

### Logic

For purposes of the LSA, an ‘episode’ is a continuous – i.e., uninterrupted by any period of seven or more contiguous days — series of ES/SH/Street dates.

Each record in ch\_Episodes\_exit represents an uninterrupted series of ES/SH/Street dates identified in the previous step. Based on ch\_Include\_exit for each HoH/adult in tlsa\_Person:

-   **episodeStart** is any **ESSHStreetDate** where there is no (**ESSHStreetDate** – 1 day) for the same *PersonalID* – i.e., any ES/SH/Street date where there is no information to indicate that the client was in ES/SH or on the street on the day before.
-   **episodeEnd** is the first **ESSHStreetDate** after **episodeStart** where (**ESSHStreetDate** + 1 day) does not exist

## CHTime and CHTimeStatus for Exit Cohorts

hmis\_Enrollment

ch\_Episodes\_exit

tlsa\_ExitHoHAdult

tlsa\_Enrollment

### Relevant Data

#### Source

**ch\_Episodes\_exit**

PersonalID

episodeStart

episodeEnd

episodeDays

**tlsa\_Enrollment**

EnrollmentID

EntryDate

ExitDate

PersonalID

LSAProjectType

**hmis\_Enrollment**

PersonalID

EntryDate

LivingSituation

LengthOfStay

DateToStreetESSH

TimesHomelessPastThreeYears

MonthsHomelessPastThreeYears

#### Target

tlsa\_ExitHoHAdult

CHTime

CHTimeStatus

### Logic

There are a total of nine valid combinations of **CHTime** and **CHTimeStatus** values in tlsa\_ExitHoHAdult. They are summarized in the table below.

Priority

CHTime

CHTimeStatus

Category

1

400

2

(see Section 7.4

2

365

1

Client has a ch\_Episode where **episodeDays** >= 365 with an **episodeEnd** in the year ending on **LastActive**

3

365

2

Client has 4 or more episodes and the sum of **episodeDays** for all ch\_Episodes is >= 365.

4

365

3

The sum of **episodeDays** for all ch\_Episodes is >= 365 but the number of episodes is less than four; no relevant information is missing from records of *3.917 Living Situation*.

4

365

99

The sum of **episodeDays** for all ch\_Episodes is >= 365 but the number of episodes is less than four; relevant information is missing from records of *3.917 Living Situation.*

\--

270

99

Client has a total of 270-364 ESSHStreet days and relevant data is missing from *3.917 Living Situation*

\--

270

\-1

Client has a total of 270-364 ESSHStreet days and is not missing any relevant *3.917 Living Situation* data

\--

0

99

Client has a total of 0-269 ESSHStreet days and relevant data is missing from *3.917 Living Situation*

\--

0

\-1

Client has a total of 270-364 ESSHStreet days and is not missing any relevant *3.917 Living Situation* data

The conditions associated with valid combinations of **CHTime** and **CHTimeStatus** are not all mutually exclusive. **CHTime** and **CHTimeStatus** should be set for the first set of criteria met by records for each person.

1.  Set **CHTime** = 365 and **CHTimeStatus** = 1 when there is a single episode where:

-   ch\_Episodes\_exit.**episodeDays** >= 365; and
-   ch\_Episodes\_exit.**episodeEnd** > (**LastActive** – 1 year)

1.  Set **CHTime** = 365 and **CHTimeStatus** = 2 where:

-   \[SUM of ch\_Episodes\_exit.**episodeDays**\] >= 365; and
-   \[COUNT of ch\_Episodes\_exit\] >= 4

1.  Set **CHTime** = 365 and **CHTimeStatus** = 3 where:

-   \[SUM of ch\_Episodes\_exit.**episodeDays**\] >= 365; and
-   \[COUNT of ch\_Episodes\_exit\] < 4

1.  Set **CHTime = 270** and **CHTimeStatus** = -1 where \[SUM of ch\_Episodes\_exit.**episodeDays**\] between 270 and 364
2.  Set **CHTime = 0** and **CHTimeStatus** = -1 where \[SUM of ch\_Episodes\_exit.**episodeDays**\] < 270

After these values are set, there is one additional update to **CHTimeStatus** to identify people who do not meet the time criteria for chronic homelessness and are missing relevant data (i.e., people who might meet the time criteria if data were complete). Set **CHTimeStatus** = 99 for all records in tlsa\_ExitHoHAdult where:

-   **CHTime** in (0,270) – The total number of **ESSHStreetDate**s in the three years ending on **LastActive** is less than 365; or
-   **CHTimeStatus** = 3 – The total number of **ESSHStreetDate**s in the three years ending on **LastActive** is at least 365, but they occur in fewer than four episodes;
-   AND there is at least one enrollment for the **PersonalID** in tlsa\_Enrollment where the exit date falls between the relevant cohort start and end dates and any of the following are true:

*DateToStreetESSH* > **EntryDate**

*LivingSituation* in (8,9,99) or is NULL

*LengthOfStay* in (8,9,99) or is NULL

*LivingSituation* in (101,116,118)

**AND**

*DateToStreetESSH* is NULL; or

*TimesHomelessPastThreeYears* in (8,9,99); or

*TimesHomelessPastThreeYears* is NULL; or

*MonthsHomelessPastThreeYears* in (8,9,99); or

*MonthsHomelessPastThreeYears* is NULL

*LivingSituation* in (101,116,118)

**AND**

*DateToStreetESSH* is NULL; or

*TimesHomelessPastThreeYears* in (8,9,99); or

*TimesHomelessPastThreeYears* is NULL; or

*MonthsHomelessPastThreeYears* in (8,9,99); or

*MonthsHomelessPastThreeYears* is NULL

**LSAProjectType** is not in (0,1,8) and

*LengthOfStay* in (2,3) and

*LivingSituation* in (204,205,206,207,215,225)

**AND**

*PreviousStreetESSH* is NULL; or

*PreviousStreetESSH* not in (0,1); or

*PreviousStreetESSH* = 1 and *DateToStreetESSH* is NULL; or

*TimesHomelessPastThreeYears* in (8,9,99); or

*TimesHomelessPastThreeYears* is NULL; or

*MonthsHomelessPastThreeYears* in (8,9,99); or

*MonthsHomelessPastThreeYears* is NULL

**LSAProjectType** is not in (0,1,8) and

*LengthOfStay* in (10,11)

**AND**

*PreviousStreetESSH* is NULL; or

*PreviousStreetESSH* not in (0,1); or

*PreviousStreetESSH* = 1 and *DateToStreetESSH* is NULL; or

*TimesHomelessPastThreeYears* in (8,9,99); or

*TimesHomelessPastThreeYears* is NULL; or

*MonthsHomelessPastThreeYears* in (8,9,99); or

*MonthsHomelessPastThreeYears* is NULL

## Set Population Identifiers for Exit Cohort Households

![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAVcAAACyCAMAAADBEXyvAAAAAXNSR0ICQMB9xQAAAUdQTFRFAAAAEBAQGBgYFxcXHR0dMDAwICAgODg4KCgoUFBQQEBASEhIWFhYW5vVX57WXp3WX53Wf39/cHBwYGBgeHh4aGhoYJ7WYZ/XeK3cbqfafrDebabZZKDYdqzccqnbaaPZcajacKjbbKXZZqLXfK/edKrbeq7daKPZj4+Pn5+fh4eHl5eXgrPfgLHfjbrhkr3kh7bgi7jikr3jlr/lkbzjlb7kjbnil7/kjrvincPml8DlmcHlqnSPv7+/t7e3p6enr6+vrc3qtdHtvtfusc/rvNbuutXtt9PsqcrpsM/qpcjoocXnstDrosfoqMrpwoWjz8/P19fX39/fx8fHxtzwxtzxwtnwyt7xy9/ywdnv1ub03+v3zuHz2+n21+b10+T03er169fh9/f35+fn7+/v+vz+6vL69fn84Oz35e/45/H48Pb7////88+r7wAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAauSURBVHja7d3tQ9pWFAbwQzewMtMVqIyi1upwg5q26KwzdlRpqqOu23yvYtVh0dot///n5Y2QQEIIJhAuz/lQMIQr/jy99+Zyj5DU57gaj8vxXSKRL+1K7Ab1/TvuleR4k0gk41GKxJMbn+Hqe9RL+Yl7sVShDlf/Y7+QikxswDWI2JiIpPbhGkSXUIglGepqQ+MqRz726AquAcTVszFWOoNQuUrSbvQNXIOIepyNmQFJf4cjjL4guseIa80pnB/xPwxX6SDOwuAVPldpchGuQbhujsM1CNd6BK5BuEoxBiaxoZsPsOOKfIUrXOEK17C5Elx9dyUnV9L/IdNZJAdcA3B1TW646npKBpJ2x5qOTq6dYeFqzVdq62uJNObGLVx7ciUje5Gvvvavjf4Arj6PW126Ytzqbv6q5anehbr1A5hn4XorZK7G+A9X5Ctc4QpXuMIVrnCFK1yHzxX7BwJxDV/AFa5whStc4QpXuGL+ivlrB1dcb8EVrnCFK1yHyRXzAeQrXOEKV7iy6ept9xV5ecLIujrXaTjtdnNxJbh2du0xX+FqZKVz/YuyaZuMG0u9hnqoUYZQM59DcHWpf9HIGmUczVOp1nzE5gBc3epf2go0yFJXQObd8FSDq03/alv/0p2rfebD1bn+Ba69ujrXvxBRC1bLuGXqWU0Hahi3cL3VR9e71b/AFfkKV7jCFa5wlULzbh1zriH5aeAK1yFzZWr/QHhcwxdsjFuMuSJf4QpXuMLVV9e6P64EV2sk4qW7una184S6wmfIlUiVDcTVc1Iz5arK9u7q/pdXrW/XD5/rN2NxzxHT3haK/3bnfHXceWJ+F3QoXb/dKHmOlMZauns/4LTzxJK2I9UPKB2sH/2r/c4Tr65srLsktGHLn3HLYeeJt36AjXXCTW2adaefpuPOE8uGHhoZ10ZgXTv8rr3vPIEr8nXoXPE+DPIVrnCFK1wZc/XxA8xqZNvq6Ll6WkYnGzly0jS3PHr73jwtow/cNSzh6uptGb15jMh6Cply3GbtffT2v3paRjc+1KxmsJHJ1Vp+NNL56m0Z3fxhRtT2JVzt+tdultGdXNtLY+Fa87CMbu9qlHqaO9ZRd/W0jG4/bplKaBvNtK69o24j3NdbQ+zqbwEnXJGvcIUrXOEKV7jCFa5wDYMr/g50IK7hC7jCFa5whStc4QpXuMK1R9frqhKHZSVe8FpkOPfI6Oe+VJ95qLYy6q431apsUeT5xxz3IKvEkqDEW1GLozP3ONLPfac+c0ltReZ+zPNFue1q9WaEXL9Ut+ScTHNT2axssS2Kn878jk+iuC23nc1OcWn+RXmr+oVt19vfBT49nV2Wc/L8rD9xLr4VlrPTaV7Y+sqm660wPfNLpW+grbyV5Sezwi17ru9nKhdng43Lysx71lz/+WHQqkpcfP8vY67Vp3MrxwNWPV6Z//GGNdfsZSXD5V6VB4N7XH6V4zKViyn2XJUfT9xZzXDzuRWhLPbH91gsCyu5eS6zuiMqXzPqqs8uK8JqTr6cmsvJwkJFntf7OUk4l9urCLJmbk6+IMutyt+gOUNm2dWIjw2A3EPlonRBvpN7LmhREU1xZHuRpUZFP/+58uQFpZmHucav62P7txwJ15ZQvbZ1J0XbiAXLosCC+aEV/fzt7i59R9G1HwFXuMI1vK4E1/64th4g8uX3gXxte5yQr724qgmp3uj3lBylFnftAOmPkPk0/Vwigqv1vzk1b9oTlM7MkPqt6bTmIeRrC1urFrXBkpGnatKa+weyZC1cO7i2KDUz2NbVZYCDK9lqtblaegZzBwBX136AWudZpn7AcDXGLXIftnC9heuCQF21Ilm4Il/hCle4whWuTLie/xQ610idAVepWBQHrioWf22+pN3o8LMq+wlP+Km18uBsxcrSz/yJ6SUtTrLhKkk3p+s89yT7ekfsJ68o/vE6O8XxwuF/lpc0dsCKqxpfqx/+5HmOm8kWBeGdGNB+2HN1b3wxO8NxPP/XB5sN8YkEA6w29QW31ZNy+SXPp/XqgjVld0VZ3cNy6RHxUn1WWWlgTWnqAcel1VqOk+qt0ws6GGOBtXM9jFoNc6pUtKyr1S2z+sYWrZrDOR7o582qz1pXGjhVmrp2fz2FMQYmA1KP9Vta9ZFzXPf6aq4mU1dMsIarLq5wf5EN1VC5bsZSDFxohcx1/9n9cXZUQ+JaX4zHHu0xpBoC188byWhkssQU6mBdd0v5xHjs3kR+lzXUgbjmk+oHvkYoGk8mNlnqUwfrWsirH/jKxvTfMf4HTjO88XSAI5kAAAAASUVORK5CYII=)

As with the active cohort, population identifiers for exit cohort households are based on the characteristics of the head of household and any adult household members.

The underlying logic is generally the same as that for the active cohort, but only data from the enrollment associated with the *HouseholdID* of the qualifying exit is used (as opposed to all enrollments active in the report period).

### Relevant Data

#### Source

**tlsa\_Exit**

Cohort

HoHID

HHType

QualifyingExitHHID

**tlsa\_HHID**

HouseholdID

ExitCohort

**tlsa\_ExitHoHAdult**

Cohort

QualifyingExitHHID

CHTime

CHTimeStatus

**tlsa\_Enrollment**

EnrollmentID

PersonalID

HouseholdID

EntryDate

RelationshipToHoH

DisabilityStatus

DVStatus

ActiveAge

Exit1Age

Exit2Age

**hmis\_Client**

PersonalID

AmIndAKNative

Asian

BlackAfAmerican

HispanicLatinao

MidEastNAfrican

NativeHIPacific

White

RaceNone

VeteranStatus

#### Target

**tlsa\_Exit**

HouseholdID

**HHVet**

**HHChronic**

**HHDisability**

**HHFleeingDV**

**HHAdultAge**

**HHParent**

**AC3Plus**

**HoHRaceEthnicity**

### Logic

#### HHVet

Set **HHVet** = 1 if any adult household member with **ExitDate** >= **CohortStart** has a *VeteranStatus* of 1. Otherwise, **HHVet** = 0.

#### HHChronic

Based on records in tlsa\_ExitHoHAdult with the same **QualifyingExitHHID**, set **HHChronic** to the first value in the table below for which any adult or HoH meets the criteria:

Value

Criteria

Category

**1**

**DisabilityStatus** = 1 and:

-   **CHTime** = 365 and **CHTimeStatus** in (1,2); or
-   CHTime = 400 and CHTimeStatus = 2

Chronically Homeless

**2**

**CHTime** in (365, 400) and **DisabilityStatus** \= 1

Long-Term Homeless with Disability

**3**

**CHTime** in (365, 400) and **DisabilityStatus** = 99

Long-Term Homeless Missing Disability Info

**4**

**CHTime** in (365, 400) and **DisabilityStatus** = 0

Long-Term Homeless without Disability

**5**

**CHTime** = 270 and **CHTimeStatus** \= 99 and **DisabilityStatus** = 1

Homeless > 6 Months with Disability (missing data)

**6**

**CHTime** = 270 and **CHTimeStatus** <> 99 and **DisabilityStatus** = 1

Homeless > 6 Months with Disability (no missing data)

**9**

**DisabilityStatus** <> 0 and **CHTimeStatus** \= 99

CH Status Unknown (missing data)

**0**

(any other)

Not Chronically Homeless

#### HHDisability

Set **HHDisability**\= 1 if the HoH or any adult household member with **ExitDate** >= **CohortStart** has a **DisabilityStatus** \= 1 for the enrollment associated with the qualifying exit. Otherwise, **HHDisability**\= 0.

#### HHFleeingDV

Set **HHFleeingDV** based on tlsa\_Enrollment for the HoH or any adult household member with **ExitDate** >= **CohortStart** where **HouseholdID** = **QualifyingExitHHID**:

In priority order:

**HHFleeingDV** = 1 (Households Fleeing Domestic Violence) if the head of household or any adult in the household has **DVStatus** = 1.

**HHFleeingDV** = 2 (Domestic Violence Survivors Not Currently Fleeing) if the head of household or any adult in the household has **DVStatus** = 2.

**HHFleeingDV** = 3 (Domestic Violence Survivors, Unknown if Currently Fleeing) if the head of household or any adult in the household has **DVStatus** = 3.

tlsa\_Enrollment.DVStatus

LSA Category

tlsa\_Exit.HHFleeingDV

1

DV survivor, currently fleeing

1

2

DV survivor, not currently fleeing

2

3

DV survivor, unknown if currently fleeing

3

Otherwise, **HHFleeingDV** = 0.

#### HoHRaceEthnicity

Set **HoHRaceEthnicity** using the same methodology defined in section 5.4.

#### HHAdultAge

Set **HHAdultAge** based on the household type and ages of all household members with **ExitDate** >= **CohortStart.**

-   -   Cohort = 0 – ActiveAge
    -   Cohort = -1 – Exit1Age
    -   Cohort = -2 – Exit2Age

Use the first / topmost of the criteria below appropriate to the household:

Upload Value

Criteria

\-1

**HHType** not in (1,2)

\-1

The maximum of all ages is >= 98 (one or more unknown ages)

18

The maximum of all ages is 21 (all adults are between 18 and 21)

24

The maximum of all ages is 24 (all adults are under 25)

55

The minimum of all ages is between 55 and 65 (all members are 55+)

25

(all other households)

#### HHParent

Set **HHParent** = 1 if at least one household member with **ExitDate** >= **CohortStart** has a *RelationshipToHoH* = 2 (Child of HoH).

#### AC3Plus

Set **AC3Plus** = 1 if **HHType** = 2 (AC) and there are three or more household members with **ExitDate** >= **CohortStart** under the age of 18. Otherwise, **AC3Plus** = 0.

## Set System Engagement Status for Exit Cohort Households

tlsa\_Exit

tlsa\_HHID

System engagement status specifies whether or not active households were actively engaged with continuum ES, SH, TH, RRH, and/or PSH projects in the two years prior to their earliest active date in the report period in the following categories:

Value

Stat

1

First-time homeless

2

Return to continuum 15-730 days after exit to permanent destination

3

Re-engage with continuum 15-730 days after exit to temporary destination

4

Re-engage with continuum 15-730 days after exit to unknown destination

5

Continuous engagement with continuum

### Relevant Data

#### Source

**tlsa\_Exit**

Cohort

HoHID

HHType

QualifyingExitHHID

**tlsa\_HHID**

HoHID

HouseholdID

ActiveHHType

Exit1HHType

Exit2HHType

EntryDate

ExitDate

ExitDest

#### Target

**tlsa\_Exit**

**Stat**

### Logic

#### Previous Activity

System engagement status is based on the EntryDate for the qualifying exit (qx) and, if it exists, the tlsa\_HHID record with the most recent (effective) **ExitDate** prior to the **ExitDate** for the qualifying exit (qx)where:

-   \[Previous\].**HoHID** = tlsa\_Exit.**HoHID**
-   \[Previous\].EntryDate < qx.EntryDate
-   \[Previous\]**.ExitDate** between \[qx.**EntryDate** – 730 days\] and \[qx.**ExitDate**\]
-   The household type matches tlsa\_Exit.**HHType** for the tlsa\_Exit.**Cohort**:
    -   If Cohort = 0, ActiveHHType
    -   If Cohort = -1, Exit1HHType
    -   If Cohort = -2, Exit2HHType

If there are two or more enrollments with the same (most recent) exit date:

-   Select the one with the lowest **ExitDest** value; or
-   If multiple enrollments have the same exit date and **ExitDest** value, select the one with the most recent entry date; or
-   If multiple enrollments have the same exit date, **ExitDest** value, and entry date, select the one with the highest **EnrollmentID**.

#### Stat

If the household had no previous activity consistent with the criteria above, or if the household had previous activity in the 14 days prior to the **EntryDate** for the reportable exit, **Stat** is set regardless of the exit destination for the previous activity.

Otherwise – if the household has an exit 15-730 days prior to the enrollment for the reportable exit – **Stat** is determined by the exit destination for the previous enrollment.

Priority

Stat

Category

Other Condition

1

1

First-time homeless

(There is no tlsa\_HHID record that meets the criteria for previous activity.)

1

5

Continuous engagement with continuum

\[Previous\].**ExitDate** > \[qx.**EntryDate** – 15 days\]

2

2

Return 15-730 days after exit to permanent destination

\[Previous\].**ExitDest** between 400 and 499

2

3

Re-engage 15-730 days after exit to temporary destination

\[Previous\].**ExitDest** between 100 and 399

2

4

Re-engage 15-730 days after exit to unknown destination

(any other)

## Last Inactive Date for Exit Cohorts

tlsa\_HHID

tlsa\_Exit

sys\_TimePadded\_exit

hmis\_Services

tlsa\_Exit

### RelevantData

**tlsa\_Exit**

Cohort

HoHID

HHType

QualifyingExitHHID

**tlsa\_HHID**

HoHID

ActiveHHType

Exit1HHType

Exit2HHType

EntryDate

ExitDate

LSAProjectType

**hmis\_Services**

EnrollmentID

*BedNightDate* (*DateProvided* where *RecordType* = 200)

#### Targets

**sys\_TimePadded\_exit**

**Column Description**

**Cohort**

From tlsa\_Exit

**HoHID**

From tlsa\_Exit

**HHType**

From tlsa\_Exit

**StartDate**

-   For tlsa\_HHID **EnrollmentID**s in night-by-night ES, each *BedNightDate* associated with the enrollment between LookbackDate and **CohortEnd**
-   For all other tlsa\_HHID enrollments, the **EntryDate**

**EndDate**

-   For tlsa\_HHID **EnrollmentID**s in night-by-night ES, the earlier of \[**StartDate** + 6 days\] or **CohortEnd**
-   For all other tlsa\_HHID enrollments, the earlier non-NULL of \[**ExitDate** + 6 days\] or **CohortEnd**

**tlsa\_Exit**

**LastInactive**

### Logic

This step identifies, based on the qualifying exit and potentially relevant inactive enrollments from the previous step, the date immediately prior to the first day of continuous system engagement for exit cohort households – or the household’s last inactive date prior to the qualifying exit.

Specifically, this is the latest date in the most recent period of at least seven nights during which a household was not enrolled in a continuum ES, SH, TH, RRH, or PSH project. Enrollments in tlsa\_HHID that occurred between the last inactive date and the **EntryDate** for the reportable exit are part of the household’s **SystemPath** if they have the same **HoHID** and there is a match for household type:

-   If tlsa\_Exit.**Cohort** = 0, **ActiveHHType**
-   If tlsa\_Exit.**Cohort** = -1, **Exit1HHType**
-   If tlsa\_Exit.**Cohort** = -2, **Exit2HHType**

**LastInactive** is the later of \[LookbackDate – 1 day\] and the most recent date where:

-   \[Date\] < tlsa\_Exit.**EntryDate**
-   \[Date\] is not between a *BedNightDate* and (*BedNightDate* + 6 days); and
-   \[Date\] is not between a tlsa\_HHID.**EntryDate** and the associated (**ExitDate** + 6 days) for project types other than ES nbn.

## Set SystemPath for LSAExit

tlsa\_HHID

tlsa\_Exit

tlsa\_Exit

### Relevant Data

#### Source

**tlsa\_Exit**

HoHID

HHType

Cohort

LastInactive

QualifyingExitHHID

**tlsa\_HHID**

HoHID

ActiveHHType

Exit1HHType

Exit2HHType

EntryDate

ExitDate

LSAProjectType

HouseholdID

MoveInDate

#### Target

**tlsa\_Exit**

**SystemPath**

### Logic

**SystemPath** is not relevant for households who were housed in PSH as of **CohortStart** or for households who had been housed in RRH or PSH for at least 365 days as of the date of the qualifying exit.

Set **SystemPath** = -1 for:

-   Any record in tlsa\_Exit where **ExitFrom** = 6 (PSH after move-in to PH) and tlsa\_HHID.**MoveInDate** for the qualifying exit < **CohortStart.**
-   Any record in tlsa\_Exit where **ExitFrom** in (5,6) (RRH/PSH after move-in to PH) and tlsa\_HHID.**MoveInDate** for the qualifying exit is 365 days or more prior to the qualifying exit date.

For all other records in tlsa\_Exit, set **SystemPath** based on the combination of **LSAProjectTypes** in tlsa\_HHID where:

-   **HoHID =** tlsa\_Exit.**HoHID**; and
-   Any part of the enrollment is after **LastInactive**; and
-   **EntryDate** <= the **ExitDate** for the qualifying exit; and
-   tlsa\_Exit.HHType =
    -   If ExitCohort = 0, ActiveHHType
    -   If ExitCohort = -1, Exit1HHType
    -   If ExitCohort = -2, Exit2HHType

SystemPath

SystemPath Project Types

tlsa\_HHID LSAProjectType(s)

1

ES/SH

in (0,1,8) and

not in (2,3,13)

2

TH

\= 2 and

not in (0,1,3,8,13)

3

ES/SH + TH

\= 2 and in (0,1,8) and

Not in (3,13)

4

RRH

\= 13 and

not in (0,1,3,8,2)

5

ES/SH + RRH

\= 13 and in (0,1,8) and

not in (2,3)

6

TH + RRH

\= 2 and = 13 and

Not in (0,1,8,3)

7

ES/SH + TH + RRH

\= 2 and in (0,1,8) and = 13 and

<> 3

8

PSH

\= 3 and

Not in (0,1,2,8,13)

9

ES/SH + PSH

\= 3 and in (0,1,8) and

Not in (2,13)

10

ES/SH + RRH + PSH

In (0,1,8) and = 13 and = 3 and <> 2

11

RRH + PSH

\= 3 and = 13 and

Not in (0,1,2,8)

12

All other combinations

## LSAExit

LSAExit includes 18 columns. **RowTotal** is a count of distinct combinations of **Cohort, HoHID** and **HHType** from tlsa\_Exit, grouped by the values in all other columns.

In tlsa\_Exit, **ReturnTime** is populated with actual counts of days because they are needed to generate averages for LSACalculated. For export, the actual counts are grouped into categories as shown below.

Value

Return Time

From

To

\-1

Not applicable

\-1

\-1

30

15-30 days

15

30

60

31-60 days

31

60

90

61-90 days

61

90

180

91-180 days

91

180

365

181-365 days

181

365

547

366-547 days

366

547

730

548-730 days

548

730

All of the columns in LSAExit are integers; none may be NULL.

#

Column Name

1

**RowTotal**

2

**Cohort**

3

**Stat**

4

**ExitFrom**

5

**ExitTo**

6

**ReturnTime** (group as shown above)

7

**HHType**

8

**HHVet**

9

**HHChronic**

10

**HHDisability**

11

**HHFleeingDV**

12

**HoHRaceEthnicity**

14

**HHAdultAge**

15

**HHParent**

16

**AC3Plus**

17

**SystemPath**

18

**ReportID**

# HMIS Business Logic: LSACalculated Averages

This section is required only if **LSAScope** <> 3 (HIC).

As in LSAHousehold, LSAPerson, and LSAExit, records are only included in LSACalculated if there are records in the raw data that represent the combination of household type, population, cohort, etc.

-   Averages are only included if there is at least one record where the value in the source column is greater than zero for at least one household represented by the combination of household type, population, etc.
-   Counts are only included if they are greater than zero.

## LSACalculated Columns

**Column**

**Description**

Value

The calculated average or count

Cohort

-   LSAHousehold averages (rows 1-16) – active cohort (1)
-   LSAExit averages (rows 18-36, 63-66, and 101-136) – exit cohorts (-2, -1, 0)
-   Counts of people and households (rows 53-56) – active and 4 point-in-time cohorts (1, 10-13)
-   Counts of bed nights (row 57) – active cohort (1)
-   Data quality reporting in rows 901-920 – active cohort (1)

Universe

-   LSAExit averages (rows 18-36, 63-66, and 101-136) – the destination type prior return (2,3,4)
-   Counts of people and households by project type (rows 53-57 and 901-920) – project groups (10-18)
-   Otherwise, n/a (-1)

HHType

The household type included in the calculation: All(0), AO (1), AC (2), CO (3), and UN (99)

Population

The population/subpopulation included in the calculation; see section 8.3

SystemPath

-   For report rows 1-9, may be -1 (section 8.4) or a value from 1 to 12 (section 8.5)
-   Otherwise it is n/a (-1)

ProjectID

-   For project-level counts (**Universe** = 10) in rows 53-57 and 901-920, a ProjectID from lsa\_Project.
-   Must be NULL for all other report rows.

ReportRow

See Section 8.2

ReportID

Must match LSAReport.**ReportID**

## Report Rows for LSACalculated Averages

All calculated values associated with LSAHousehold (rows 1-16) and LSAExit (rows 18-36, 63-66, and 101-136) are averages of counts of days.

Row

Reporting Category

Section

1

Days in ES/SH

Section 8.4, 8.5

2

Days in TH

Section 8.4, 8.5

3

Days in ES/SH or TH

Section 8.4, 8.5

4

Days homeless before move-in to RRH/PSH

Section 8.4, 8.5

5

Days documented in ES/SH, TH, or homeless before move-in

Section 8.4, 8.5

6

Days homeless self-reported in 3.917

Section 8.4, 8.5

7

Days homeless total

Section 8.4, 8.5

8

Days housed in RRH

Section 8.4, 8.5

9

Days documented homeless or housed in RRH (no 3.917)

Section 8.4, 8.5

10

Days housed in PSH as of exit date (all exits)

Section 8.6

11

Days housed in PSH for households active on last day

Section 8.6

12

Days in RRH from start to exit with no move-in date

Section 8.7

13

Days in RRH from start to report end for active homeless

Section 8.7

14

Days in RRH from start to move-in date for all housed

Section 8.7

15

Days in RRH from move-in to exit for housed exiters

Section 8.7

16

Days in RRH from move-in to report end for active housed

Section 8.7

18

Days to return after exit from ES

Section 8.8

19

Days to return after exit from TH

Section 8.8

20

Days to return after exit from SH

Section 8.8

21

Days to return after exit from RRH (placed in PH)

Section 8.8

22

Days to return after exit from PSH (placed in PH)

Section 8.8

63

Days to return after exit from RRH (not placed)

Section 8.8

64

Days to return after exit from PSH (not placed)

Section 8.8

65

Days to return after exit from RRH-SO (placed in PH)

Section 8.8

66

Days to return after exit from RRH-SO (not placed in PH)

Section 8.8

23

Days to return after exit (all)

Section 8.9

24

Days to return after ES/SH only system path

Section 8.10

25

Days to return after TH system path

Section 8.10

26

Days to return after ES/SH/TH system path

Section 8.10

27

Days to return after RRH only system path

Section 8.10

28

Days to return after ES/SH/RRH system path

Section 8.10

29

Days to return after TH/RRH system path

Section 8.10

30

Days to return after ES/SH/TH/RRH system path

Section 8.10

31

Days to return after PSH only system path

Section 8.10

32

Days to return after ES/SH/PSH system path

Section 8.10

33

Days to return after ES/SH/RRH/PSH system path

Section 8.10

34

Days to return after RRH/PSH system path

Section 8.10

35

Days to return after other system path

Section 8.10

36

Days to return after any system path (excludes those housed in PSH on start date)

Section 8.10

101

Average days to return after exit to Emergency shelter, including hotel or motel paid for with emergency shelter voucher, Host Home shelter

Section 8.11

102

Average days to return after exit to Place not meant for habitation (e.g., a vehicle, an abandoned building, bus/train/subway station/airport or anywhere outside)

Section 8.11

103

Average days to return after exit to Safe Haven

Section 8.11

104

Average days to return after exit to Psychiatric hospital or other psychiatric facility

Section 8.11

105

Average days to return after exit to Substance abuse treatment facility or detox center

Section 8.11

106

Average days to return after exit to Hospital or other residential non-psychiatric medical facility

Section 8.11

107

Average days to return after exit to Jail, prison, or juvenile detention facility

Section 8.11

108

Average days to return after exit to Foster care home or foster care group home

Section 8.11

109

Average days to return after exit to Long-term care facility or nursing home

Section 8.11

110

Average days to return after exit to Transitional housing for homeless persons (including homeless youth)

Section 8.11

111

Average days to return after exit to Staying or living with family, temporary tenure (e.g. room, apartment, or house)

Section 8.11

112

Average days to return after exit to Staying or living with friends, temporary tenure (e.g. room, apartment, or house)

Section 8.11

113

Average days to return after exit to Hotel or motel paid for without emergency shelter voucher

Section 8.11

114

Average days to return after exit to Moved from one HOPWA funded project to HOPWA TH

Section 8.11

115

Average days to return after exit to Residential project or halfway house with no homeless criteria

Section 8.11

116

Average days to return after exit to Host Home (non-crisis)

Section 8.11

117

Average days to return after exit to Rental by client, no ongoing housing subsidy

Section 8.11

118

Average days to return after exit to Owned by client, no ongoing housing subsidy

Section 8.11

119

Average days to return after exit to VASH housing subsidy

Section 8.11

120

Average days to return after exit to Other

Section 8.11

121

Average days to return after exit to Owned by client, with ongoing housing subsidy

Section 8.11

122

Average days to return after exit to Staying or living with family, permanent tenure

Section 8.11

123

Average days to return after exit to Staying or living with friends, permanent tenure

Section 8.11

124

Average days to return after exit to Moved from one HOPWA funded project to HOPWA PH

Section 8.11

125

Average days to return after exit to GPD TIP housing subsidy

Section 8.11

126

Average days to return after exit to RRH or equivalent subsidy

Section 8.11

127

Average days to return after exit to HCV voucher (tenant or project based) (not dedicated)

Section 8.11

128

Average days to return after exit to Public housing unit

Section 8.11

129

Average days to return after exit to Emergency Housing Voucher

Section 8.11

130

Average days to return after exit to Family Unification Program Voucher (FUP)

Section 8.11

131

Average days to return after exit to Foster Youth to Independence Initiative (FYI)

Section 8.11

132

Average days to return after exit to Permanent Supportive Housing

Section 8.11

133

Average days to return after exit to Other permanent housing dedicated for formerly homeless persons

Section 8.11

134

Average days to return after exit to Deceased

Section 8.11

135

Average days to return after exit to destination not provided by client

Section 8.11

136

Average days to return after exit with missing/invalid destination

Section 8.11

## Populations for Average Days from LSAHousehold and LSAExit

### Populations

All LSAHousehold and LSAExit report rows must be generated for the nine populations shown in the table below.

-   Length of Time Homeless (rows 1-9) – Section 8.4
-   Length of Time Homeless by System Path (rows 1-9) – Section 8.5
-   Cumulative Length of Time Housed in PSH (rows 10 and 11) – Section 8.6
-   Length of Time in RRH Projects (rows 12-16) – Section 8.7
-   Time to Return by Last Project Type (rows 18-22, 63-66) – Section 8.8
-   Time to Return by Population (row 23) – Section 8.9
-   Time to Return by System Path (rows 24-36) – Section 8.10
-   Time to Return by Exit Destination (rows 101-136) – Section 8.11

The **HHType** column indicates the household types for which the population is relevant.

-   Zero (0) represents a count of all records that meet the criteria, regardless of household type.
-   The value for **HHType** in LSACalculated should use the values shown below, based on tlsa\_Household.**HHType**.

When a report row is required in LSACalculated for any given population, values should be produced for all household types listed in the **HHType** column for the population that occur in LSAHousehold or LSAExit.

ID

Population

HHType

Criteria

0

All

0,1,2,3,99

All

10

Youth 18-21

1

**HHAdultAge = 18**

11

Youth 22-24

1

**HHAdultAge** \= 24

12

Parenting Youth 18-24

2

**HHParent** = 1 and **HHAdultAge** in (18,24)

13

Veteran

0,1,2,99

**HHVet = 1**

14

Non-Veteran 25+

1

**HHVet** = 0 and **HHAdultAge** in (25,55)

15

Chronically Homeless

0,1,2,3,99

**HHChronic** = 1

16

Long-Term Homeless

0,1,2,3,99

**HHChronic** in (1,2)

17

Annual Inflow Homeless

0,1,2,3,99

**HHChronic** in (0,3)

### Subpopulations

Reporting by subpopulation is limited to the following LSAExit and LSAHousehold rows:

-   Length of Time Homeless (rows 1-9) – Section 8.4
-   Time to Return by Population (row 23) – Section 8.9

Those rows are required for each subpopulation in combination with each of the parent populations in the far-right column below. The only exceptions to this are for row 23, which is not generated for subpopulations 21 or 22.

When the parent population is ‘All’ (0), the ID listed below is used. In combination with other parent populations, the subpopulation ID is a four digit number – the two digits on the left identify the parent population and the two on the right identify the subpopulation. For example, the subpopulation of Chronically Homeless Households (population 15) Fleeing DV (population 19) is identified as 1519.

ID

Population

HHType(s)

Criteria

Parent Populations

15

Chronically Homeless

0,1,2,3,99

**HHChronic** = 1

10-14

18

Disabled Adult or HoH

0,1,2,3,99

**HHDisability** = 1

0, 10-14

19

Fleeing Domestic Violence

0,1,2,3,99

**HHFleeingDV** = 1

0, 10-15

20

First Time Homeless

0,1,2,3,99

**Stat = 1**

0, 10-15

21

Returning After Exit to PH

0,1,2,3,99

**Stat** = 2

0, 10-15

22

PSH Move-In during Report Period

0,1,2,3,99

**PSHMoveIn** = 1

0, 10-15

23

American Indian, Alaska Native, or Indigenous (only) HoH

0,1,2,3,99

**HoHRaceEthnicity** = 1

0, 10-15

24

American Indian, Alaska Native, or Indigenous & Hispanic/Latina/e/o HoH

0,1,2,3,99

**HoHRaceEthnicity** = 16

0, 10-15

25

Asian or Asian American (only) HoH

0,1,2,3,99

**HoHRaceEthnicity** = 2

0, 10-15

26

Asian or Asian American & Hispanic/Latina/e/o HoH

0,1,2,3,99

**HoHRaceEthnicity** = 26

0, 10-15

27

Black, African American, or African (only) HoH

0,1,2,3,99

**HoHRaceEthnicity** = 3

0, 10-15

28

Black, African American, or African & Hispanic/Latina/e/o HoH

0,1,2,3,99

**HoHRaceEthnicity** = 36

0, 10-15

29

Hispanic/Latina/e/o (only) HoH

0,1,2,3,99

**HoHRaceEthnicity** = 6

0, 10-15

30

Middle Eastern or North African (only) HoH

0,1,2,3,99

**HoHRaceEthnicity** = 7

0, 10-15

31

Middle Eastern or North African & Hispanic/Latina/e/o HoH

0,1,2,3,99

**HoHRaceEthnicity** = 67

0, 10-15

32

Native Hawaiian or Pacific Islander (only) HoH

0,1,2,3,99

**HoHRaceEthnicity** = 4

0, 10-15

33

Native Hawaiian or Pacific Islander & Hispanic/Latina/e/o HoH

0,1,2,3,99

**HoHRaceEthnicity** = 46

0, 10-15

34

White (only) HoH

0,1,2,3,99

**HoHRaceEthnicity** = 5

0, 10-15

35

White & Hispanic/Latina/e/o HoH

0,1,2,3,99

**HoHRaceEthnicity** = 56

0, 10-15

36

Multi-Racial (not Hispanic/Latina/e/o) HoH

0,1,2,3,99

**HoHRaceEthnicity** \>=12, is not in (98, 99)**,** does not include a 6

0, 10-15

37

Multi-Racial & Hispanic/Latina/e/o) HoH

0,1,2,3,99

**HoHRaceEthnicity** \>=126**,** includes a 6

0, 10-15

38

American Indian, Alaska Native, or Indigenous (any combination) HoH

0,1,2,3,99

**HoHRaceEthnicity** includes a 1

0, 10-15

39

Asian or Asian American (any combination) HoH

0,1,2,3,99

**HoHRaceEthnicity** includes a 2

0, 10-15

40

Black, African American, or African & Any Other (any combination) HoH

0,1,2,3,99

**HoHRaceEthnicity** includes a 3

0, 10-15

41

Hispanic/Latina/e/o (any combination) HoH

0,1,2,3,99

**HoHRaceEthnicity** includes a 6

0, 10-15

42

Middle Eastern or North African & Any Other (any combination) HoH

0,1,2,3,99

**HoHRaceEthnicity** includes a 7

0, 10-15

43

Native Hawaiian or Pacific Islander & Any Other (any combination) HoH

0,1,2,3,99

**HoHRaceEthnicity** includes a 4

0, 10-15

44

White (any combination) HoH

0,1,2,3,99

**HoHRaceEthnicity** includes a 5

0, 10-15

45

Seniors 55+

1

**HHAdultAge** = 55

0,13-15

46

Parenting Children

3

**HHParent = 1**

0,15

47

Households with 3+ Children (LSAHousehold)

2

**HHChild = 3**

0,13,15

47

Households with 3+ Children (LSAExit)

2

**AC3Plus = 1**

0,13,15

48

Domestic Violence Survivors Not Identified as Currently Fleeing

0,1,2,3,99

**HHFleeingDV** \= 2

0, 10-15

## Get Average Days for Length of Time Homeless

tlsa\_Household

lsa\_Calculated

### Relevant Data

#### Source

**tlsa\_Household**

HHType

ESDays

THDays

ESTDays

RRHPSHPreMoveInDays

SystemHomelessDays

Other3917Days

TotalHomelessDays

RRHHousedDays

SystemDaysNotPSHHoused

HHChronic

HHVet

HHDisability

HHFleeingDV

HHAdultAge

HHParent

AC3Plus

HoHRaceEthnicity

Stat

HHChild

#### Target

lsa\_Calculated

**Value**

The average of the values > 0 in the source column for the **HHType** and **Population** identified

Cohort

1 (Active) for these report rows

Universe

\-1 (All) for these report rows

**HHType**

The household type included in the calculation: All(0), AO (1), AC (2), CO (3), and UN (99)

**Population**

The population/subpopulation included in the calculation; see section 8.3

SystemPath

\-1 (All) for this calculation

ProjectID

NULL

**ReportRow**

Rows 1-9 (see below)

ReportID

Must match LSAReport.**ReportID**

### Logic

See the table above for **Cohort**, **Universe**, **SystemPath**, **ProjectID**, and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### ReportRow and Value

For each **ReportRow** listed below, **Value** \= the average of \[Source Column\] from tlsa\_Household where \[Source Column\] > 0, rounded to the nearest whole number, or the result of a built-in AVERAGE or AVG function in a database that returns an integer when the datatype of the parameter is *integer*.

Report Row Category

Source Column

ReportRow

Days in ES/SH

**ESDays**

1

Days in TH

**THDays**

2

Days in ES/SH or TH

**ESTDays**

3

Days in RRH/PSH pre-move-in (excluding those overlapping with ES/SH/TH days)

**RRHPSHPreMoveInDays**

4

Days documented in ES/SH/TH or RRH/PSH pre-move-in total

**SystemHomelessDays**

5

Days homeless self-reported in 3.917 (excluding those overlapping with ES/SH/TH or RRH/PSH pre-move-in days)

**Other3917Days**

6

Days homeless total

**TotalHomelessDays**

7

Days housed in RRH

**RRHHousedDays**

8

Days documented homeless or housed in RRH total (excluding self-reported time)

**SystemDaysNotPSHHoused**

9

## Get Average Days for Length of Time Homeless by System Path

tlsa\_Household

lsa\_Calculated

### Relevant Data

#### Source

**tlsa\_Household**

HHType

ESDays

THDays

ESTDays

RRHPSHPreMoveInDays

SystemHomelessDays

Other3917Days

TotalHomelessDays

RRHHousedDays

SystemDaysNotPSHHoused

SystemPath

HHChronic

HHVet

HHAdultAge

HHParent

#### Target

lsa\_Calculated

**Value**

The average of the values > 0 in the source column for the **HHType** and **Population** identified

Cohort

1 (Active) for these report rows

Universe

\-1 (All) for these report rows

**HHType**

The household type included in the calculation: All(0), AO (1), AC (2), CO (3), and UN (99)

**Population**

The population included in the calculation; see section 8.3

**SystemPath**

Between 1 and 12 (see below)

ProjectID

NULL

**ReportRow**

Rows 1-9 (see below)

ReportID

Must match LSAReport.**ReportID**

### Logic

See the table above for **Cohort**, **Universe**, **ProjectID**, and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### ReportRow, SystemPath, and Value

For each **ReportRow** listed below, **Value** \= the average of \[Source Column\] from tlsa\_Household where \[Source Column\] > 0, rounded to the nearest whole number, or the result of a built-in AVERAGE or AVG function in a database that returns an integer when the datatype of the parameter is *integer*.

The averages for LSACalculated are grouped by the **SystemPath** values from LSAHousehold.

Report Row Category

Source Column and Criteria

ReportRow

Days in ES/SH

**ESDays**

where **SystemPath** in (1,3,5,7,9,10,12)

1

Days in TH

**THDays**

where **SystemPath** in (2,3,6,7,12)

2

Days in ES/SH or TH

**ESTDays**

where **SystemPath** in (3,7,12)

3

Days in RRH/PSH pre-move-in (excluding those overlapping with ES/SH/TH days)

**RRHPSHPreMoveInDays**

where **SystemPath** in (4,5,6,7,8,9,10,11,12)

4

Days documented in ES/SH/TH or RRH/PSH pre-move-in total

**SystemHomelessDays**

where **SystemPath** in (5,6,7,8,9,10,11,12)

5

Days homeless self-reported in 3.917 (excluding those overlapping with ES/SH/TH or RRH/PSH pre-move-in days)

**Other3917Days**

where **SystemPath** <> -1

6

Days homeless total

**TotalHomelessDays**

where **SystemPath** <> -1

7

Days housed in RRH

**RRHHousedDays**

where **SystemPath** in (4,5,6,7,10,11,12)

8

Days documented homeless or housed in RRH total (excluding self-reported time)

**SystemDaysNotPSHHoused**

where **SystemPath** <> -1

9

## Get Average Days for Cumulative Length of Time Housed in PSH

tlsa\_Household

lsa\_Calculated

### Relevant Data

#### Source

**tlsa\_Household**

HHType

PSHHousedDays

PSHMoveIn

PSHStatus

HHChronic

HHVet

HHAdultAge

HHParent

#### Target

lsa\_Calculated

**Value**

The average of the values > 0 in the source column for the **HHType** and **Population** identified

Cohort

1 (Active) for these report rows

Universe

\-1 (All) for these report rows

**HHType**

The household type included in the calculation: All(0), AO (1), AC (2), CO (3), and UN (99)

**Population**

The population included in the calculation; see section 8.3

SystemPath

\-1 (All) for these report rows

ProjectID

NULL

**ReportRow**

Rows 10 and 11 (see below)

ReportID

Must match LSAReport.**ReportID**

### Logic

See the table above for **Cohort**, **Universe**, **ProjectID**, **SystemPath**, and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### ReportRow and Value

For each **ReportRow** listed below, **Value** \= the average of \[Source Column\] from tlsa\_Household where \[Source Column\] > 0, rounded to the nearest whole number, or the result of a built-in AVERAGE or AVG function in a database that returns an integer when the datatype of the parameter is *integer*.

Report Row Category

Source Column and Criteria

ReportRow

Days housed in PSH – exited in report period

**PSHHousedDays**

(where **PSHMoveIn** in (1,2) and **PSHStatus** in (12,22))

10

Days housed in PSH – housed at report end

**PSHHousedDays**

(where **PSHMoveIn** in (1,2) and **PSHStatus** in (11,21))

11

## Get Average Days for Length of Time in RRH Projects

tlsa\_Household

lsa\_Calculated

### Relevant Data

#### Source

**tlsa\_Household**

HHType

RRHStatus

RRHMoveIn

RRHPreMoveInDays

RRHHousedDays

HHChronic

HHVet

HHAdultAge

HHParent

#### Target

lsa\_Calculated

**Value**

The average of the values > 0 in the source column for the **HHType** and **Population** identified

Cohort

1 (Active) for these report rows

Universe

\-1 (All) for these report rows

**HHType**

The household type included in the calculation: All(0), AO (1), AC (2), CO (3), and UN (99)

**Population**

The population included in the calculation; see section 8.3

SystemPath

\-1 (All) for these report rows

ProjectID

NULL

**ReportRow**

Rows 12-16 (see below)

ReportID

Must match LSAReport.**ReportID**

### Logic

See the table above for **Cohort**, **Universe**, **ProjectID**, **SystemPath**, and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### ReportRow and Value

For each **ReportRow** listed below, **Value** \= the average of \[Source Column\] from tlsa\_Household where \[Source Column\] > 0, rounded to the nearest whole number, or the result of a built-in AVERAGE or AVG function in a database that returns an integer when the datatype of the parameter is *integer*.

Report Row Category

Source Column and Criteria

ReportRow

RRH start to exit for households not placed in PH before exiting

**RRHPreMoveInDays** where

**RRHStatus** in (12,22) and **RRHMoveIn** = 0

12

RRH start to report end for active households not yet placed in PH

**RRHPreMoveInDays** where

**RRHStatus** in (11, 21) and **RRHMoveIn** = 0

13

RRH start to move-in for all households placed in PH

**RRHPreMoveInDays** where **RRHMoveIn** in (1,2) and **RRHStatus** > 2

14

RRH move-in to exit for households placed before exiting

**RRHHousedDays** where **RRHStatus** in (12,22) and **RRHMoveIn** in (1,2)

15

RRH move-in to report end for active households placed in PH

**RRHHousedDays** where **RRHStatus** in (11,21) and **RRHMoveIn** in (1,2)

16

## Get Average Days to Return/Re-engage by Last Project Type

tlsa\_Exit

lsa\_Calculated

### Relevant Data

#### Source

**tlsa\_Exit**

HHType

Cohort

ExitTo

ExitFrom

ReturnTime

HHChronic

HHVet

HHAdultAge

HHParent

#### Target

lsa\_Calculated

**Value**

The average of the values > 0 in **ReturnTime**

**Cohort**

**Cohort** value from tlsa\_Exit

**Universe**

Destination type prior to return; see below

**HHType**

The household type for the average; see section 8.3

**Population**

The population included in the calculation; see section 8.3

SystemPath

\-1 (All)

ProjectID

NULL

**ReportRow**

Rows 18-22, 63-66 (see below)

ReportID

Must match LSAReport.**ReportID**

### Logic

See the table above for **Cohort,**, **SystemPath**, **ReportRow** and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### Universe

Averages are grouped by **Universe** based on LSAExit (tlsa\_Exit) **ExitTo**.

Category

ExitTo

Universe

Return 15-730 days after exit to permanent destination

**ExitTo** between 400 and 499

2

Re-engage 15-730 days after exit to temporary destination

**ExitTo** between 100 and 399

3

Re-engage 15-730 days after exit to unknown destination

**ExitTo** < 100

4

#### ReportRow and Value

For each **ReportRow** listed below, **Value** \= the average of \[Source Column\] from tlsa\_Exit where **ReturnTime** > 0, rounded to the nearest whole number, or the result of a built-in AVERAGE or AVG function in a database that returns an integer when the datatype of the parameter is *integer*.

Report Row Category

Source Column and Criteria

ReportRow

Days to return after exit from ES

**ReturnTime** where **ExitFrom** = 2

18

Days to return after exit from TH

**ReturnTime** where **ExitFrom** = 3

19

Days to return after exit from SH

**ReturnTime** where **ExitFrom** = 4

20

Days to return after exit from RRH (placed in PH)

**ReturnTime** where **ExitFrom** = 5

21

Days to return after exit from PSH (placed in PH)

**ReturnTime** where **ExitFrom** = 6

22

Days to return after exit from RRH (not placed)

**ReturnTime** where **ExitFrom** = 7

63

Days to return after exit from PSH (not placed)

**ReturnTime** where **ExitFrom** = 8

64

Days to return after exit from RRH-SO (placed in PH)

**ReturnTime** where **ExitFrom** = 9

65

Days to return after exit from RRH-SO (not placed in PH)

**ReturnTime** where **ExitFrom** = 10

66

## Get Average Days to Return/Re-engage by Population

tlsa\_Exit

lsa\_Calculated

### Relevant Data

#### Source

**tlsa\_Exit**

HHType

Cohort

ExitTo

ExitFrom

ReturnTime

HHChronic

HHVet

HHDisability

HHFleeingDV

HHAdultAge

HHParent

AC3Plus

HoHRaceEthnicity

Stat

AC3Plus

#### Target

lsa\_Calculated

**Value**

The average of the values > 0 in **ReturnTime**

**Cohort**

**Cohort** value from tlsa\_Exit

**Universe**

Destination type prior to return; see below

**HHType**

The household type for the average

**Population**

The population/subpopulation included in the calculation; see section 8.3

SystemPath

\-1 (All)

ProjectID

NULL

**ReportRow**

23

ReportID

Must match LSAReport.**ReportID**

### Logic

See the table above for **Cohort**, **SystemPath**, **ReportRow** and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### Universe

Averages are grouped by **Universe** based on LSAExit (tlsa\_Exit) **ExitTo**.

Category

ExitTo

Universe

Return 15-730 days after exit to permanent destination

**ExitTo** between 400 and 499

2

Re-engage 15-730 days after exit to temporary destination

**ExitTo** between 100 and 399

3

Re-engage 15-730 days after exit to unknown destination

**ExitTo** < 100

4

#### Value

For each valid combination of values in other relevant columns, **Value** \= the average of \[Source Column\] from tlsa\_Exit where **ReturnTime** > 0, rounded to the nearest whole number, or the result of a built-in AVERAGE or AVG function in a database that returns an integer when the datatype of the parameter is *integer*.

## Get Average Days to Return/Re-engage by System Path

tlsa\_Exit

lsa\_Calculated

### Relevant Data

#### Source

**tlsa\_Exit**

HHType

Cohort

ExitTo

ExitFrom

ReturnTime

HHChronic

HHVet

HHAdultAge

HHParent

SystemPath

#### Target

lsa\_Calculated

**Value**

The average of the values > 0 in **ReturnTime**

**Cohort**

**Cohort** value from tlsa\_Exit

**Universe**

Destination type prior to return; see below

**HHType**

The household type for the average

**Population**

The population included in the calculation; see section 8.3

SystemPath

See below

ProjectID

NULL

**ReportRow**

See below

ReportID

Must match LSAReport.**ReportID**

### Logic

See the table above for **Cohort**, and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### Universe

Averages are grouped by **Universe** based on LSAExit (tlsa\_Exit) **ExitTo**.

Category

ExitTo

Universe

Return 15-730 days after exit to permanent destination

**ExitTo** between 400 and 499

2

Re-engage 15-730 days after exit to temporary destination

**ExitTo** between 100 and 399

3

Re-engage 15-730 days after exit to unknown destination

**ExitTo** < 100

4

#### ReportRow, SystemPath, and Value

For each **ReportRow** listed below, **Value** \= the average of **ReturnTime** where **ReturnTime** > 0 and **SystemPath** meets the listed criteria, rounded to the nearest whole number.

For **ReportRow**s 24-35, averages are grouped by the **SystemPath** value in LSAExit; the **SystemPath** value in LSACalculated should match the **SystemPath** value in LSAExit.

**ReportRow** 36 includes all records where the LSAExit value for **SystemPath** <> -1 – i.e., SystemPath values 1-12. Because the average is for multiple **SystemPath** values, the LSACalculated value for **SystemPath** = -1 for this row.

Report Row Category

tlsa\_Exit Values

ReportRow

Days to return after ES/SH only path

**SystemPath** = 1

24

Days to return after TH path

**SystemPath** = 2

25

Days to return after ES/SH/TH path

**SystemPath** = 3

26

Days to return after RRH only path

**SystemPath** = 4

27

Days to return after ES/SH/RRH path

**SystemPath** = 5

28

Days to return after TH/RRH path

**SystemPath** = 6

29

Days to return after ES/SH/TH/RRH path

**SystemPath** = 7

30

Days to return after PSH only path

**SystemPath** = 8

31

Days to return after ES/SH/PSH path

**SystemPath** = 9

32

Days to return after ES/SH/RRH/PSH path

**SystemPath** = 10

33

Days to return after RRH/PSH path

**SystemPath** = 11

34

Days to return after other path

**SystemPath** = 12

35

Days to return after any system path

**SystemPath** <> -1

36

## Get Average Days to Return/Re-engage by Exit Destination

tlsa\_Exit

lsa\_Calculated

### Relevant Data

#### Source

**tlsa\_Exit**

HHType

Cohort

ExitTo

ReturnTime

HHChronic

HHVet

HHAdultAge

HHParent

#### Target

lsa\_Calculated

**Value**

The average of the values > 0 in **ReturnTime**

**Cohort**

The **Cohort** value from tlsa\_Exit

**Universe**

Destination type prior to return; see below

**HHType**

The household type for the average

**Population**

The population included in the calculation; see section 8.3

SystemPath

\-1

ProjectID

NULL

**ReportRow**

101-136

ReportID

Must match LSAReport.**ReportID**

### Logic

See the table above for **Cohort, SystemPath, ProjectID,** and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### ReportRow, Universe, and Value

For each **ReportRow** listed below, **Value** \= the average of **ReturnTime** where **ReturnTime** > 0 and tlsa\_Exit.**ExitTo** meets the listed criteria, rounded to the nearest whole number, or the result of a built-in AVERAGE or AVG function in a database that returns an integer when the datatype of the parameter is *integer*.

The **ExitTo** column in tlsa\_Exit determines the **ReportRow** and **Universe**, which distinguishes between permanent, temporary, and unknown destination types.

Row

Row Name

ExitTo

Universe

101

Average days to return after exit to Emergency shelter, including hotel or motel paid for with emergency shelter voucher, Host Home shelter

101

3

102

Average days to return after exit to Place not meant for habitation (e.g., a vehicle, an abandoned building, bus/train/subway station/airport or anywhere outside)

116

3

103

Average days to return after exit to Safe Haven

118

3

104

Average days to return after exit to Psychiatric hospital or other psychiatric facility

204

3

105

Average days to return after exit to Substance abuse treatment facility or detox center

205

3

106

Average days to return after exit to Hospital or other residential non-psychiatric medical facility

206

3

107

Average days to return after exit to Jail, prison, or juvenile detention facility

207

3

108

Average days to return after exit to Foster care home or foster care group home

215

3

109

Average days to return after exit to Long-term care facility or nursing home

225

3

110

Average days to return after exit to Transitional housing for homeless persons (including homeless youth)

302

3

111

Average days to return after exit to Staying or living with family, temporary tenure (e.g. room, apartment, or house)

312

3

112

Average days to return after exit to Staying or living with friends, temporary tenure (e.g. room, apartment, or house)

313

3

113

Average days to return after exit to Hotel or motel paid for without emergency shelter voucher

314

3

114

Average days to return after exit to Moved from one HOPWA funded project to HOPWA TH

327

3

115

Average days to return after exit to Residential project or halfway house with no homeless criteria

329

3

116

Average days to return after exit to Host Home (non-crisis)

332

3

117

Average days to return after exit to Rental by client, no ongoing housing subsidy

410

2

118

Average days to return after exit to Owned by client, no ongoing housing subsidy

411

2

119

Average days to return after exit to Rental by client - VASH housing subsidy

419

2

120

Average days to return after exit to Rental by client - Other ongoing subsidy

420

2

121

Average days to return after exit to Owned by client, with ongoing housing subsidy

421

2

122

Average days to return after exit to Staying or living with family, permanent tenure

422

2

123

Average days to return after exit to Staying or living with friends, permanent tenure

423

2

124

Average days to return after exit to Moved from one HOPWA funded project to HOPWA PH

426

2

125

Average days to return after exit to Rental by client - GPD TIP housing subsidy

428

2

126

Average days to return after exit to Rental by client - RRH or equivalent subsidy

431

2

127

Average days to return after exit to Rental by client - HCV voucher (tenant or project based) (not dedicated)

433

2

128

Average days to return after exit to Rental by client - Public housing unit

434

2

129

Average days to return after exit to Rental by client - Emergency Housing Voucher

436

2

130

Average days to return after exit to Rental by client - Family Unification Program Voucher (FUP)

437

2

131

Average days to return after exit to Rental by client - Foster Youth to Independence Initiative (FYI)

438

2

132

Average days to return after exit to Rental by client - Permanent Supportive Housing

439

2

133

Average days to return after exit to Rental by client - Other permanent housing dedicated for formerly homeless persons

440

2

134

Average days to return after exit to Deceased

24

4

135

Average days to return after exit to destination not provided by client

98

4

136

Average days to return after exit with missing or invalid destination

99

4

# HMIS Business Logic: LSACalculated Counts

## Report Rows for LSACalculated Counts

Row

Reporting Category

Section

53

Project-level – People by household characteristics

Section 9.3

53

Project type – People by household characteristics

Section 9.3

54

Project-level – Households by household characteristics

Section 9.3

54

Project-type – Households by household characteristics

Section 9.3

55

Project level – People by personal characteristic

Section 9.4

55

Project-type – People by personal characteristic

Section 9.4

56

Project-level – Bed nights by household characteristics

Section 9.5

56

Project-type – Bed nights by household characteristics

Section 9.5

57

Project-level – Bed nights by personal characteristics

Section 9.5

57

Project-type – Bed nights by personal characteristics

Section 9.5

## Identify Active and Point in Time Cohorts for LSACalculated Counts

The ‘active’ cohort for these counts is limited to people and households with enrollments where **AIR** = 1.

This step identifies records in tlsa\_Enrollment in point-in-time cohorts (10-13) to simplify the process of generating counts.

### Relevant Data

#### Source

**tlsa\_CohortDates**

Cohort

CohortStart

CohortEnd

**tlsa\_Enrollment**

AIR

EntryDate

MoveInDate

ExitDate

LSAProjectType

**hmis\_Services**

EnrollmentID

BedNightDate (*DateProvided* where *RecordType* = 200)

#### Target

tlsa\_Enrollment

Cohort

Category

**PITOctober**

10

Active October 31

**PITJanuary**

11

Active January 31

**PITApril**

12

Active April 30

**PITJuly**

13

Active July 31

### Logic

Set **PITOctober**, **PITJanuary**, **PITApril**, and **PITJuly** to 1 where **AIR** = 1 and:

-   If **LSAProjectType** in (3,13), **MoveInDate** <= CohortEnd; and
-   If **LSAProjectType** in (0,1,2,8), **EntryDate** <= CohortEnd; and
-   If **LSAProjectType** = 1, there is a valid *BedNightDate* on CohortStart; and
-   **ExitDate** is NULL, or **ExitDate** > CohortStart.

## Counts of People and Households by Project and Household Characteristics

lsa\_Calculated

tlsa\_CohortDates

tlsa\_Enrollment

tlsa\_HHID

hmis\_Services

### Relevant Data

#### Source

**tlsa\_Enrollment**

AIR

PITOctober

PITJanuary

PITApril

PITJuly

**tlsa\_HHID**

ActiveHHType

ProjectID

LSAProjectType

HHChronic

HHVet

HHAdultAge

HHParent

HHFleeingDV

HHDisability

#### Target

lsa\_Calculated

**Value**

See below

**Cohort**

1, 10, 11, 12, 13 (see section 9.2)

**Universe**

See below

**HHType**

See below

**Population**

See below

**SystemPath**

\-1

**ProjectID**

See below

**ReportRow**

See below

ReportID

Must match LSAReport.**ReportID**

### Logic

#### Report Row and Value

Report rows 53 and 54 count people and households in the active and point-in-time cohorts (see section 9.2).

Row

Value

53

Count of distinct **PersonalID**s in tlsa\_Enrollment

54

Count of distinct combinations of **HoHID**/**ActiveHHType** in tlsa\_HHID

#### Cohort

Cohort

tlsa\_Enrollment Criteria

1

**AIR** = 1

10

**PITOctober** = 1

11

**PITJanuary** = 1

12

**PITApril** = 1

13

**PITJuly** = 1

#### Universe and ProjectID

Report rows 53 and 54 are required for each of the following **Universe** values grouped by cohort, household type, and population. For project-level counts (**Universe** = 10), the **ProjectID** from tlsa\_HHID is required and should match a record in lsa\_Project.

Universe

ProjectID

Criteria

10 = Project-level

\=tlsa\_HHID.**ProjectID**

\-

11=ES project type

NULL

tlsa\_HHID.**LSAProjectType** in (0,1)

12=SH project type

NULL

tlsa\_HHID.**LSAProjectType** = 8

13=TH project type

NULL

tlsa\_HHID.**LSAProjectType** = 2

14=Housed in RRH

NULL

tlsa\_HHID.**LSAProjectType** = 13

15=Housed in PSH

NULL

tlsa\_HHID.**LSAProjectType** = 3

16=ES/SH/TH unduplicated

NULL

tlsa\_HHID.**LSAProjectType** in (0,1,8,2)

#### Household Type and Populations

Report rows 53 and 54 are required for the following combinations of household type and population:

ID

Population

HHType

Criteria (tlsa\_HHID)

0

All

0,1,2,3,99

All

10

Youth 18-21

1

**HHAdultAge = 18**

11

Youth 22-24

1

**HHAdultAge** \= 24

12

Parenting Youth 18-24

2

**HHParent** = 1 and **HHAdultAge** in (18,24)

13

Veteran

0,1,2,99

**HHVet = 1**

14

Non-Veteran 25+

1

**HHVet** = 0 and **HHAdultAge** in (25,55)

15

Chronically Homeless

0,1,2,3,99

**HHChronic** = 1

18

Disabled Adult or HoH

0,1,2,3,99

**HHDisability** = 1

19

Fleeing Domestic Violence

0,1,2,3,99

**HHFleeingDV** = 1

45

Seniors 55+

1

**HHAdultAge** = 55

46

Parenting Children

3

**HHParent = 1**

48

Domestic Violence Survivors Not Identified as Currently Fleeing

0,1,2,3,99

**HHFleeingDV** = 2

## Get Counts of People by Project and Personal Characteristics

lsa\_Calculated

tlsa\_CohortDates

tlsa\_Enrollment

tlsa\_HHID

hmis\_Services

### Relevant Data

#### Source

**tlsa\_Enrollment**

AIR

PITOctober

PITJanuary

PITApril

PITJuly

**tlsa\_HHID**

ActiveHHType

ProjectID

LSAProjectType

HHChronic

HHVet

HHAdultAge

HHParent

HHFleeingDV

#### Target

lsa\_Calculated

**Value**

Count of distinct **PersonalIDs** in tlsa\_Enrollment

**Cohort**

1, 10, 11, 12, 13 (see section 9.2)

**Universe**

See below

**HHType**

See below

**Population**

See below

**SystemPath**

\-1

**ProjectID**

See below

**ReportRow**

55

ReportID

Must match LSAReport.**ReportID**

### Logic

#### Cohort

Cohort

tlsa\_Enrollment Criteria

1

**AIR** = 1

10

**PITOctober** = 1

11

**PITJanuary** = 1

12

**PITApril** = 1

13

**PITJuly** = 1

#### Universe and ProjectID

Report row 55 is required for each of the following **Universe** values grouped by cohort, household type, and population. For project-level counts (**Universe** = 10), the **ProjectID** from tlsa\_HHID is required and should match a record in lsa\_Project.

Universe

ProjectID

Criteria

10 = Project-level

\=tlsa\_HHID.**ProjectID**

\-

11=ES project type

NULL

tlsa\_HHID.**LSAProjectType** in (0,1)

12=SH project type

NULL

tlsa\_HHID.**LSAProjectType** = 8

13=TH project type

NULL

tlsa\_HHID.**LSAProjectType** = 2

14=Housed in RRH

NULL

tlsa\_HHID.**LSAProjectType** = 13

15=Housed in PSH

NULL

tlsa\_HHID.**LSAProjectType** = 3

16=ES/SH/TH unduplicated

NULL

tlsa\_HHID.**LSAProjectType** in (0,1,8,2)

#### Household Type and Populations

For counts by ProjectID (**Universe** 10) report row 55 is required for the following combinations of household type and population:

ID

Population

HHType

Criteria

50

Veteran

0,1,2,99

tlsa\_Person.**VetStatus = 1**

53

Chronically Homeless Adult/HoH

0,1,2,3,99

tlsa\_Person.**DisabilityStatus** = 1 and

**CHTime** = 365 and **CHTimeStatus** in (1,2); or

**CHTime** = 400 and **CHTimeStatus** = 2

1190

Age 18-21 in AO Youth Household

1

tlsa\_Enrollment.**ActiveAge** \= 21 and tlsa\_HHID.**HHAdultAge** in (18,24)

1191

Age 22-24 in AO Youth Household

1

tlsa\_Enrollment.**ActiveAge** \= 24 and tlsa\_HHID.**HHAdultAge** in (18,24)

1290

Age 18-21 in AC Parenting Youth Household

2

tlsa\_Enrollment.**ActiveAge** \= 21 and tlsa\_HHID.**HHParent** = 1 and tlsa\_HHID.HHAdultAge in (18,24)

1291

Age 22-24 in AC Parenting Youth Household

2

tlsa\_Enrollment.**ActiveAge** \= 24 and tlsa\_HHID.**HHParent** = 1 and tlsa\_HHID.HHAdultAge in (18,24)

For counts by project type (**Universe** 11-16)), report row 55 is required for the following:

ID

Population

HHType

Criteria

50

Veteran

0,1,2,99

tlsa\_Person.**VetStatus = 1**

51

Parenting Youth 18-24

**2**

tlsa\_HHID.**HHParent** = 1 and tlsa\_HHID.**HHAdultAge** in (18,24)

52

Parenting Child

3

tlsa\_HHID.**HHParent** = 1

53

Chronically Homeless Adult/HoH

0,1,2,3,99

tlsa\_Person.**DisabilityStatus** = 1 and

**CHTime** = 365 and **CHTimeStatus** in (1,2); or

**CHTime** = 400 and **CHTimeStatus** = 2

54

Disabled Adult/HoH

0,1,2,3,99

tlsa\_Person.**DisabilityStatus** = 1

55

Fleeing Domestic Violence

0,1,2,3,99

tlsa\_Person.**DVStatus** = 1

56

American Indian, Alaska Native, or Indigenous (only)

0,1,2,3,99

**RaceEthnicity** = 1

57

American Indian, Alaska Native, or Indigenous & Hispanic/Latina/e/o

0,1,2,3,99

**RaceEthnicity** = 16

58

Asian or Asian American (only)

0,1,2,3,99

**RaceEthnicity** = 2

59

Asian or Asian American & Hispanic/Latina/e/o

0,1,2,3,99

**RaceEthnicity** = 26

60

Black, African American, or African (only)

0,1,2,3,99

**RaceEthnicity** = 3

61

Black, African American, or African & Hispanic/Latina/e/o

0,1,2,3,99

**RaceEthnicity** = 36

62

Hispanic/Latina/e/o (only)

0,1,2,3,99

**RaceEthnicity** = 6

63

Middle Eastern or North African (only)

0,1,2,3,99

**RaceEthnicity** = 7

64

Middle Eastern or North African & Hispanic/Latina/e/o

0,1,2,3,99

**RaceEthnicity** = 67

65

Native Hawaiian or Pacific Islander (only)

0,1,2,3,99

**RaceEthnicity** = 4

66

Native Hawaiian or Pacific Islander & Hispanic/Latina/e/o

0,1,2,3,99

**RaceEthnicity** = 46

67

White (only)

0,1,2,3,99

**RaceEthnicity** = 5

68

White & Hispanic/Latina/e/o

0,1,2,3,99

**RaceEthnicity** = 56

69

Multi-Racial (not Hispanic/Latina/e/o)

0,1,2,3,99

**RaceEthnicity** \>=12**,** not in (98,99), does not include a 6

70

Multi-Racial & Hispanic/Latina/e/o)

0,1,2,3,99

**RaceEthnicity** \>=126**,** includes a 6

71

American Indian, Alaska Native, or Indigenous (any combination)

0,1,2,3,99

**RaceEthnicity** includes a 1

72

Asian or Asian American (any combination)

0,1,2,3,99

**RaceEthnicity** includes a 2

73

Black, African American, or African & Any Other (any combination)

0,1,2,3,99

**RaceEthnicity** includes a 3

74

Hispanic/Latina/e/o (any combination)

0,1,2,3,99

**RaceEthnicity** includes a 6

75

Middle Eastern or North African & Any Other (any combination)

0,1,2,3,99

**RaceEthnicity** includes a 7

76

Native Hawaiian or Pacific Islander & Any Other (any combination)

0,1,2,3,99

**RaceEthnicity** includes a 4

77

White (any combination)

0,1,2,3,99

**RaceEthnicity** includes a 5

86

<1 year

0,2,3,99

Maximum **ActiveAge** \= 0

87

1 to 2 years

0,2,3,99

Maximum **ActiveAge** \= 2

88

3 to 5 years

0,2,3,99

Maximum **ActiveAge** \= 5

89

6 to 17 years

0,2,3,99

Maximum **ActiveAge** \= 17

90

18 to 21 years

0,1,2,99

Maximum **ActiveAge** \= 21

91

22 to 24 years

0,1,2,99

Maximum **ActiveAge** \= 24

92

25 to 34 years

0,1,2,99

Maximum **ActiveAge** \= 34

93

35 to 44 years

0,1,2,99

Maximum **ActiveAge** \= 44

94

45 to 54 years

0,1,2,99

Maximum **ActiveAge** \= 54

95

55 to 64 years

0,1,2,99

Maximum **ActiveAge** \= 64

96

65 and older

0,1,2,99

Maximum **ActiveAge** \= 65

97

Domestic Violence Survivor Not Identified as Currently Fleeing

0,1,2,3,99

tlsa\_Person.**DVStatus** in (2,3)

1190

Age 18-21 in AO Youth Household

1

tlsa\_Enrollment.**ActiveAge** \= 21 and tlsa\_HHID.**HHAdultAge** in (18,24)

1191

Age 22-24 in AO Youth Household

1

tlsa\_Enrollment.**ActiveAge** \= 24 and tlsa\_HHID.**HHAdultAge** in (18,24)

1290

Age 18-21 in AC Parenting Youth Household

2

tlsa\_Enrollment.**ActiveAge** \= 21 and tlsa\_HHID.**HHParent** = 1 and tlsa\_HHID.HHAdultAge in (18,24)

1291

Age 22-24 in AC Parenting Youth Household

2

tlsa\_Enrollment.**ActiveAge** \= 24 and tlsa\_HHID.**HHParent** = 1 and tlsa\_HHID.HHAdultAge in (18,24)

In addition, row 55 counts by project type (**Universe** 11-16)) are required for three populations in combination with 34 subpopulations. The three parent populations are:

ID

Parent Population

50

Veteran

51

Parenting Youth 18-24

52

Parenting Child

Each of the parent populations above are reported in combination with each of the subpopulations below. The value for **Population** for these combinations is a four-digit number – the two digits on the left identify the parent population and the two on the right identify the subpopulation. For example, the subpopulation of Veterans Fleeing Domestic Violence is identified as 5055.

ID

Subpopulations

53

Chronically Homeless Adult/HoH

54

Disabled Adult/HoH

55

Fleeing Domestic Violence

56

American Indian, Alaska Native, or Indigenous (only)

57

American Indian, Alaska Native, or Indigenous & Hispanic/Latina/e/o

58

Asian or Asian American (only)

59

Asian or Asian American & Hispanic/Latina/e/o

60

Black, African American, or African (only)

61

Black, African American, or African & Hispanic/Latina/e/o

62

Hispanic/Latina/e/o (only)

63

Middle Eastern or North African (only)

64

Middle Eastern or North African & Hispanic/Latina/e/o

65

Native Hawaiian or Pacific Islander (only)

66

Native Hawaiian or Pacific Islander & Hispanic/Latina/e/o

67

White (only)

68

White & Hispanic/Latina/e/o

69

Multi-Racial (not Hispanic/Latina/e/o)

70

Multi-Racial & Hispanic/Latina/e/o)

71

American Indian, Alaska Native, or Indigenous (any combination)

72

Asian or Asian American (any combination)

73

Black, African American, or African & Any Other (any combination)

74

Hispanic/Latina/e/o (any combination)

75

Middle Eastern or North African & Any Other (any combination)

76

Native Hawaiian or Pacific Islander & Any Other (any combination)

77

White (any combination)

97

Domestic Violence Survivor Not Identified as Currently Fleeing

## Get Counts of Bednights

lsa\_Calculated

lsa\_Report

tlsa\_Enrollment

tlsa\_HHID

hmis\_Services

tlsa\_Person

### Relevant Data

#### Source

**tlsa\_Enrollment**

AIR

MoveInDate

ExitDate

**tlsa\_HHID**

ActiveHHType

ProjectID

LSAProjectType

HHAdultAge

**tlsa\_Person**

VetStatus

DisabilityStatus

CHTime

CHTimeStatus

#### Target

lsa\_Calculated

**Value**

See below

**Cohort**

1

**Universe**

See below

**HHType**

See below

**Population**

See below

**SystemPath**

\-1

**ProjectID**

See below

**ReportRow**

56 and 57 (see below)

ReportID

Must match LSAReport.**ReportID**

### Logic

These counts may be included under any circumstances but are required in LSACalculated only if:

-   ReportStart is October 1
-   ReportEnd is September 30 of the following year
-   LSAReport.**LSAScope** = 1

#### Universe and ProjectID

Report rows 56 and 57 are required for each of the following **Universe** values grouped by household type and population. For project-level counts (**Universe** = 10), the **ProjectID** from tlsa\_HHID is required and should match a record in lsa\_Project.

Universe

ProjectID

Criteria

10 = Project-level

\=tlsa\_HHID.**ProjectID**

\-

11=ES project type

NULL

tlsa\_HHID.**LSAProjectType** in (0,1)

12=SH project type

NULL

tlsa\_HHID.**LSAProjectType** = 8

13=TH project type

NULL

tlsa\_HHID.**LSAProjectType** = 2

14=Housed in RRH

NULL

tlsa\_HHID.**LSAProjectType** = 13

15=Housed in PSH

NULL

tlsa\_HHID.**LSAProjectType** = 3

16=ES/SH/TH unduplicated

NULL

tlsa\_HHID.**LSAProjectType** in (0,1,8,2)

#### ReportRow, Population, and HHType

The only difference in logic between rows 56 and 57 are the populations. Both count bed nights in the LSA report period for the populations and household types in the table below.

ReportRow

Population

Name

HHType

Criteria

56

0

All

0,1,2,3,99

\-

56

10

Youth 18-21

1

**HHAdultAge** \= 18

56

11

Youth 22-24

1

**HHAdultAge** \= 24

57

50

Veteran

0,1,2,99

**VetStatus** = 1

57

53

Chronically Homeless Adult/HoH

0,1,2,3,99

**DisabilityStatus** = 1 and:

**CHTime** = 365 and **CHTimeStatus** in (1,2); or

**CHTime** = 400 and **CHTimeStatus** = 2

#### Value

**Value** = a count of the combination of \[Date\] and distinct **PersonalID**s in tlsa\_Enrollment where **AIR** = 1 and meet the criteria for inclusion based on household type and population identfiers where \[Date\] is between ReportStart and ReportEnd and:

Project

\[Date\]

\[Date\]

**LSAProjectType** in (3,13)

**\>=MoveInDate**

<= (**ExitDate** – 1 day) or,

If **ExitDate** is NULL, ReportEnd

**LSAProjectType** in (0,2,8)

**\>=EntryDate**

<= (**ExitDate** – 1 day) or,

If **ExitDate** is NULL, ReportEnd

**LSAProjectType** = 1

*\=BedNightDate* (hmis\_Services.*DateProvided* where *RecordType* = 200)

Between ReportStart and ReportEnd

And >= **EntryDate**

And < **ExitDate** (if ExitDate is not NULL)

## Get OPH Point-in-Time Counts for HIC

lsa\_Calculated

lsa\_Report

lsa\_HMISParticipation

lsa\_Project

hmis\_Exit

hmis\_Enrollment

### Relevant Data

#### Source

**lsa\_Report**

LSAScope

ReportStart

**lsa\_Project**

ProjectID

ProjectType

**lsa\_HMISParticipation**

HMISParticipationType

HMISParticipationStatusStartDate

HMISParticipationStatusEndDate

**hmis\_Enrollment**

HouseholdID

PersonalID

EntryDate

RelationshipToHoH

MoveInDate

**hmis\_Exit**

ExitDate

#### Target

lsa\_Calculated

**Cohort**

1

**Universe**

10

**HHType**

0

**Population**

0

**SystemPath**

\-1

**ProjectID**

Must match Project.**ProjectID** where **ProjectType** in (9,10)

**ReportRow**

53

**ReportID**

Must match LSAReport.**ReportID**

### Logic

This adds a project-level point-in-time count of people housed in OPH for the HIC.

If **LSAScope** \= 3 (HIC), **Value** \= a count of distinct *PersonalID*s in hmis\_Enrollment where:

-   *EntryDate* <= ReportStart
-   *ExitDate* \> ReportStart or is NULL
-   The *HouseholdID* is associated with an enrollment that meets the following criteria:
    -   ***RelationshipToHoH*** = 1
    -   *EnrollmentCoC* = ReportCoC
    -   *EntryDate* <= ReportStart
    -   *MoveInDate* <= ReportStart
    -   MoveInDate >= EntryDate
    -   *ExitDate* > ReportStart or is NULL
    -   *ProjectID* \= lsa\_Project.**ProjectID** where **ProjectType** in (9,10)
    -   There is a record in lsa\_HMISParticipation for the ProjectID where:
        -   **HMISParticipationType** \= 1 (participating in HMIS)
        -   **HMISParticipationStatusStartDate** <= ReportStart.
        -   **HMISParticipationStatusEndDate** > ReportStart.or is null

# HMIS Business Logic: LSACalculated Project-Level Data Quality Counts

Report Rows 901-920 are project-level counts of data quality issues; this is to provide information to CoCs and the AHAR analysis team about specific sources of data quality issues.

## Static Column Values

lsa\_Calculated

**Cohort**

1

**Universe**

10

**HHType**

0

**Population**

0

**SystemPath**

\-1

**ProjectID**

Must match Project.**ProjectID**.

**ReportID**

Must match LSAReport.**ReportID**

**ReportRow** numbers and **Value** criteria are defined in the following sections.

## DQ - Enrollments Active After Project Operating End Date by Project

**ReportRow** 901 counts enrollments in tlsa\_Enrollment with no *ExitDate* in hmis\_Exit for projects that have an *OperatingEndDate* between ReportStart and ReportEnd.

**ReportRow** 902 counts enrollments in tlsa\_Enrollment where *OperatingEndDate* is between ReportStart and ReportEnd and hmis\_Exit.*ExitDate* > *OperatingEndDate*.

These counts are grouped by **ProjectID**.

**Value** = a count of distinct **EnrollmentID**s in tlsa\_Enrollment where:

-   Exit.*ExitDate* is NULL (**ReportRow** 901); or
-   Exit.*ExitDate* > Project. *OperatingEndDate* (**ReportRow** 902);

AND:

-   hmis\_Project.*OperatingEndDate* between ReportStart and ReportEnd

Records are only included when the count is greater than zero.

## DQ - Night-by-Night Enrollments with Exit Date Discrepancies by Project

**ReportRow** 903 counts enrollments without an *ExitDate* as of ReportEnd (i.e., *ExitDate* is after ReportEnd or is NULL) in continuum night-by-night ES projects that have no record of a bed night in the 90 days ending on ReportEnd.

**ReportRow** 904 counts enrollments with an *ExitDate* in continuum night-by-night ES projects between ReportStart and ReportEnd and where there is no record of a bed night on \[*ExitDate* – 1 day\].

**Value** = a count of distinct *EnrollmentID*s in hmis\_Enrollment where:

-   hmis\_Project.*ProjectType* = 1; and
-   hmis\_Project.*ContinuumProject* = 1; and
-   There is a record for the *HouseholdID* in tlsa\_HHID (i.e., the household was active in ReportCoC)
    -   Exit.*ExitDate* is NULL or Exit.*ExitDate* > ReportEnd; and
        -   **LastBedNight** <= \[CohortEnd – 90 days\](**ReportRow** 903); or
    -   Exit.*ExitDate* between ReportStart and ReportEnd and **LastBedNight** <> *ExitDate* – 1 day\] (**ReportRow** 904)

In this context, **LastBedNight** is the most recent bed night for the enrollment on or before ReportEnd.

## DQ - Counts of Households with no EnrollmentCoC by Project

**ReportRow** 905 counts households that are active in a continuum ES/SH/TH/RRH/PSH/RRHSO project during the report period and whose enrollment(s) are not associated with any CoC.

**Value** = a count of distinct *HouseholdID*s in hmis\_Enrollment where:

-   *ProjectID* = lsa\_Project.**ProjectID** and *ProjectType* is not in (9,10); and
-   *EntryDate* <= ReportEnd; and
-   hmis\_Exit*.ExitDate* is NULL or
    -   Exit*.ExitDate* >= ReportStart; and
    -   Exit*.ExitDate* > Enrollment.*EntryDate*
-   There is no hmis\_Enrollment record where:
    -   EnrollmentCoC is not NULL; and
    -   RelationshipToHoH = 1

## DQ – Enrollments in Non-Participating Projects

**ReportRow** 906 counts enrollments in hmis\_Enrollment that are active during the report period and overlap with a period in which the project was not identified as participating in HMIS. This may include enrollments that were excluded from the LSA entirely and/or enrollments used in LSA reporting with adjusted entry/exit dates.

**Value** = a count of distinct *EnrollmentID*s in hmis\_Enrollment where:

-   *ProjectID* = lsa\_Project.**ProjectID** and *ProjectType* is not in (9,10); and
-   *EntryDate* <= ReportEnd; and
-   hmis\_Exit*.ExitDate* is NULL or
    -   Exit*.ExitDate* >= ReportStart; and
    -   Exit*.ExitDate* > Enrollment.*EntryDate*
-   *EnrollmentCoC* \= ReportCoC for the head of household’s enrollment; and
-   There is no record in lsa\_HMISParticipation for the **ProjectID** where:
-   HMISParticipationType = 1 and HMISParticipationStatusStartDate <= EntryDate; and
    -   HMISParticipationStatusEndDate is null; or
    -   HMISParticipationStatusEndDate >= *ExitDate;* or
    -   *ExitDate* is null and **HMISParticipationStatusEndDate** > ReportEnd

## DQ – Enrollments Active in LSA Projects During the Report Period without Exactly One HoH

**ReportRow** 907 counts enrollments that are active in a continuum ES/SH/TH/RRH/PSH/RRHSO project during the report period and do not have exactly one HoH.

**Value** = a count of distinct *EnrollmentID*s in hmis\_Enrollment where:

-   *ProjectID* = lsa\_Project.**ProjectID** and lsa\_Project.**ProjectType** is not in (9,10)
-   *EnrollmentCoC* for the head of household’s enrollment = ReportCoC
-   hmis\_Exit.*ExitDate* is null or *ExitDate* \>= ReportStart; and
-   hmis\_Exit.*ExitDate* is null or *ExitDate* \> *EntryDate*; and
-   The count of *PersonalID*s in hmis\_Enrollment with the same *HouseholdID* and a *RelationshipToHoH* \= 1 <> 1

## DQ – Enrollments Active in LSA Projects without a Valid Relationship to HoH

**ReportRow** 908 counts enrollments that are active in a continuum ES/SH/TH/RRH/PSH/RRHSO project during the report period and do not have a valid *RelationshipToHoH.*.

**Value** = a count of distinct *EnrollmentID*s in hmis\_Enrollment where:

-   *ProjectID* = lsa\_Project.**ProjectID** and lsa\_Project.**ProjectType** is not in (9,10)
-   *EnrollmentCoC* for the head of household’s enrollment = ReportCoC
-   hmis\_Exit.*ExitDate* is null or *ExitDate* \>= ReportStart; and
-   hmis\_Exit.*ExitDate* is null or *ExitDate* \> *EntryDate*; and
-   *RelationshipToHoH* is NULL or not in (1,2,3,4,5)

## DQ – Household Entry

The **Value** for **ReportRow** 909 is a count of distinct **HouseholdID**s in tlsa\_HHID where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1).

## DQ – Client Entry

The **Value** for **ReportRow** 910 is a count of distinct **EnrollmentID**s in tlsa\_Enrollment where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1).

## DQ – Adult/HoH Entry

The **Value** for **ReportRow** 911 is a count of distinct **EnrollmentID**s in tlsa\_Enrollment where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1) and:

-   **ActiveAge** between 18 and 65; or
-   RelationshipToHoH = 1.

## DQ – Client Exit

The **Value** for **ReportRow** 912 is a count of distinct **PersonalID**s in tlsa\_Enrollment where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1) and **ExitDate** is not NULL.

## DQ – Disabling Condition

This is a subset of **ClientEntry** (the **Value** for **ReportRow** 910).

The **Value** for **ReportRow** 913 is a count of distinct **EnrollmentIDs** in tlsa\_Enrollment for **ProjectID**s in lsa\_Project where where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1) and:

-   DisabilityStatus = 99.

## DQ – Living Situation

This is a subset of **AdultHoHEntry**(the **Value** for **ReportRow** 911).

The **Value** for **ReportRow** 914 is a count of distinct **EnrollmentIDs** in tlsa\_Enrollment for **ProjectID**s in lsa\_Project where where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1) and:

-   hmis\_Enrollment**.***LivingSituation* in (8,9,99) or is NULL; and
-   **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1

## DQ – Length of Stay

This is a subset of **AdultHoHEntry**(the **Value** for **ReportRow** 911).

The **Value** for **ReportRow** 915 is a count of distinct **EnrollmentIDs** in tlsa\_Enrollment for **ProjectID**s in lsa\_Project where where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1) and:

-   hmis\_Enrollment**.***LengthOfStay* in (8,9,99) or is NULL.
-   **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1

## DQ – Date ES/SH/Street Homelessness Started

This is a subset of **AdultHoHEntry**(the **Value** for **ReportRow** 911).

The **Value** for **ReportRow** 916 is a count of distinct **EnrollmentIDs** in tlsa\_Enrollment for **ProjectID**s in lsa\_Project where where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1) and:

-   **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and
-   hmis\_Enrollment**.***DateToStreetESSH* > *EntryDate*; or
-   hmis\_Enrollment**.***DateToStreetESSH* is NULL; and
    -   tlsa\_Enrollment.**LSAProjectType** in (0,1,8); or
    -   *LivingSituation* in (101,116,118); or
    -   *PreviousStreetESSH* = 1.

## DQ – Times ES/SH/Street Homeless Last 3 Years

This is a subset of **AdultHoHEntry**(the **Value** for **ReportRow** 911).

The **Value** for **ReportRow** 917 is a count of distinct **EnrollmentIDs** in tlsa\_Enrollment for **ProjectID**s in lsa\_Project where where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1) and:

-   **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and
-   hmis\_Enrollment**.***TimesHomelessPastThreeYears* is NULL or not in (1,2,3,4); and
    -   tlsa\_Enrollment. **LSAProjectType** in (0,1,8); or
    -   *LivingSituation* in (101,116,118); or
    -   *PreviousStreetESSH* = 1.

## DQ – Months ES/SH/Street Homeless Last 3 Years

This is a subset of **AdultHoHEntry**(the **Value** for **ReportRow** 911).

The **Value** for **ReportRow** 918 is a count of distinct **EnrollmentIDs** in tlsa\_Enrollment for **ProjectID**s in lsa\_Project where where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1) and:

-   **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and
-   hmis\_Enrollment**.***MonthsHomelessPastThreeYears* is NULL or not between 101 and 113; and
    -   tlsa\_Enrollment.**LSAProjectType** in (0,1,8); or
    -   *LivingSituation* in (101,116,118); or
    -   *PreviousStreetESSH* = 1.

## DQ – Destination

This is a subset of **ClientExit** (the **Value** for **ReportRow** 912).

The **Value** for **ReportRow** 919 is a count of distinct **EnrollmentIDs** in tlsa\_Enrollment for **ProjectID**s in lsa\_Project where where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1) = 1 and:

-   **ExitDate** is not NULL; and
    -   hmis\_Exit.*Destination* is NULL or in (8,9,17,30,99) or
    -   hmis\_Exit.*Destination* = 435 and hmis\_Exit.*DestinationSubsidyType* is NULL

## DQ – Date of Birth

The **Value** for **ReportRow** 920 is a count of distinct **PersonalIDs** in tlsa\_Enrollment for **ProjectID**s in lsa\_Project where where **AIR** \= 1 or (**LSAScope** <> 3 and **Active** \= 1) and **ActiveAge** in (98,99).

## LSACalculated

LSACalculated has nine columns. Except for **ProjectID,** the datatype for all columns is integer and none may be NULL.

**Value** for every record must be greater than zero; neither averages nor counts are generated when there are no records that meet criteria specific to the household type, population, cohort, etc.

The data type for the **ProjectID** column is an alphanumeric string of no more than 32 characters.

-   If **Universe** <> 10, **ProjectID** must be NULL.
-   If **Universe** \= 10, **ProjectID** may not be NULL.

#

Column Name

1

**Value**

2

**Cohort**

3

**Universe**

4

**HHType**

5

**Population**

6

**SystemPath**

7

**ProjectID**

8

**ReportRow**

9

**ReportID**

# HMIS Business Logic: LSAReport Data Quality and ReportDate

## Data Quality: HMIS Household Enrollments Not Associated with a CoC

### Relevant Data

#### Source

**lsa\_Project**

ProjectType

**hmis\_Exit**

ExitDate

**hmis\_Enrollment**

ProjectID

RelationshipToHoH

EntryDate

EnrollmentCoC

#### Target

lsa\_Report

**NoCoC**

### Logic

#### NoCoC

The LSA is limited to enrollment records where the *EnrollmentCoC* for the head of household = ReportCoC.

This is a systemwide count of *HouseholdID*s served in continuum ES/SH/TH/RRH/PSH projects during the report period and excluded from the LSA because there is no record of the CoC in which the households were served. All enrollments in an HMIS participating project are required to have an associated CoC Code. **Any number higher than zero may have an impact on the usability of a CoC’s LSA data for AHAR and/or HIC purposes. Communities may be required to correct these issues and resubmit.**

A count of distinct *HouseholdIDs* in hmis\_Enrollment where:

-   *EntryDate* <= ReportEnd; and
-   RelationshipToHoH = 1; and
-   hmis\_Exit.*ExitDate* is NULL or *ExitDate* >= ReportStart; and
-   *ProjectID* \= lsa\_Project.**ProjectID**; and
-   lsa\_Project.**ProjectType** in (0,1,2,3,8,13); and
-   lsa\_Organization.**VictimServiceProvider** \= 0; and
-   *EnrollmentCoC* is null or *EnrollmentCoC* <> any ProjectCoC.*CoCCode* for the **ProjectID**

## Data Quality: Households Excluded from the LSA Due to HoH Errors

### Relevant Data

#### Source

**lsa\_Organization**

VictimServiceProvider

**lsa\_Project**

ProjectType

HMISParticipatingProject

**hmis\_Exit**

ExitDate

**hmis\_Enrollment**

ProjectID

HouseholdID

RelationshipToHoH

EntryDate

EnrollmentCoC

#### Target

lsa\_Report

**NotOneHoH**

### Logic

#### NotOneHoH

The LSA disregards enrollment records where there is not exactly one head of household.

This is a systemwide count of *HouseholdID*s active in continuum ES/SH/TH/RRH/PSH projects during the report period but excluded from the LSA due to this data error. **Any number higher than zero will have an impact on the usability of a CoC’s LSA data for AHAR and/or HIC purposes. Communities may be required to correct these issues and resubmit.**

A count of distinct *HouseholdID*s in hmis\_Enrollment where:

-   There are no EnrollmentIDs for the HouseholdID where RelationshipToHoH = 1; or
-   There is more than one *EnrollmentID* for the *HouseholdID* where *RelationshipToHoH* = 1.

AND:

-   *EntryDate* <= ReportEnd; and
-   hmis\_Exit.*ExitDate* is NULL or *ExitDate* >= ReportStart; and
-   *ProjectID* \= lsa\_Project.**ProjectID**; and
-   lsa\_Project.**ProjectType** in (0,1,2,3,8,13); and
-   lsa\_Organization.**VictimServiceProvider** \= 0; and
-   Any *EnrollmentCoC* associated with the *HouseholdID* = ReportCoC.

## Data Quality: Enrollments Excluded from the LSA Due to Invalid RelationshipToHoH

### Relevant Data

#### Source

**tlsa\_HHID**

HouseholdID

Active

**hmis\_Exit**

ExitDate

**hmis\_Enrollment**

ProjectID

HouseholdID

RelationshipToHoH

EntryDate

#### Target

lsa\_Report

**RelationshipToHoH**

### Logic

#### RelationshipToHoH

The LSA disregards enrollment records where there is no valid *RelationshipToHoH*.

This is a count of enrollments associated with households active during the LSA report period but excluded from the LSA due to missing relationship data. **Any number higher than zero will have an impact on the usability of a CoC’s LSA data for AHAR and/or HIC purposes; communities may be required to correct these issues and resubmit.**

A count of distinct *EnrollmentID*s in hmis\_Enrollment where:

-   *RelationshipToHoH* is NULL or not in (1,2,3,4,5); and
-   *DateDeleted* is NULL; and
-   *EntryDate <=* ReportEnd; and
-   *ExitDate* is NULL or *ExitDate* >= ReportStart; and
-   *HouseholdID* = a **HouseholdID** in tlsa\_HHID where **Active** = 1

## Data Quality: Invalid Move-In Dates

### Relevant Data

#### Source

**tlsa\_HHID**

HouseholdID

MoveInDate

Active

LSAProjectType

**hmis\_Enrollment**

HouseholdID

MoveInDate

#### Target

lsa\_Report

**MoveInDate**

### Logic

#### MoveInDate

This is a count of RRH/PSH enrollments for heads of household with move-in dates recorded in HMIS that fall either prior to project entry or after project exit. These invalid dates are otherwise ignored by the LSA; the **MoveInDate** in tlsa\_HHID is set to NULL.

A count of tlsa\_HHID.**EnrollmentID**s where

-   **LSAProjectType** in (3,13,15); and
-   **Active** \= 1, and:
-   tlsa\_HHID.**MoveInDate** is NULL; and
-   hmis\_Enrollment.*MoveInDate* <= ReportEnd

## Data Quality: Counts of Clients / HouseholdIDs / EnrollmentIDs

### Relevant Data

#### Source

**tlsa\_Person**

PersonalID

**tlsa\_HHID**

HouseholdID

Active

**tlsa\_Enrollment**

EnrollmentID

Active

ActiveAge

RelationshipToHoH

ExitDate

#### Target

lsa\_Report

**UnduplicatedClient**

**HouseholdEntry**

**ClientEntry**

**AdultHoHEntry**

**ClientExit**

### Logic

#### UnduplicatedClient

A count of distinct **PersonalID**s in tlsa\_ Enrollment where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3).

#### HouseholdEntry

A count of distinct **HouseholdID**s in tlsa\_HHID where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3).

#### ClientEntry

A count of distinct **EnrollmentID**s in tlsa\_Enrollment where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3).

#### AdultHoHEntry

A count of distinct **EnrollmentID**s in tlsa\_Enrollment where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3) and:

-   **ActiveAge** between 18 and 65; or
-   RelationshipToHoH = 1.

#### ClientExit

A count of distinct **PersonalID**s in tlsa\_Enrollment where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3) and **ExitDate** is not NULL.

## Data Quality: SSN Issues

### Relevant Data

#### Source

**tlsa\_Person**

PersonalID

**hmis\_Client**

PersonalID

SSN

SSNDataQuality

#### Target

tlsa\_Person

**SSNValid**

lsa\_Report

**SSNNotProvided**

**SSNMissingOrInvalid**

**ClientSSNNotUnique**

**DistinctSSNValueNotUnique**

### Logic

#### SSNValid

**SSNValid** in tlsa\_Person should be set to the first value in the table below where the criteria are consistent with client records:

Priority

Value

Criteria

1

9

hmis\_Client**.***SSNDataQuality* in (8,9)

2

0

hmis\_Client**.***SSNDataQuality* NOT in (8,9); and

-   Length(hmis\_Client.*SSN*) <> 9; or
-   *SSN* is NULL or set to system default; or
-   *SSN* begins with ‘000’, ‘666’, or ‘9’; or
-   *SSN* middle 2 digits are ‘00’ (e.g. 999-00-9999); or
-   *SSN* last 4 digits are ‘0000’; or
-   *SSN* contains any character other than 0-9; or
-   *SSN* in ('111111111', '222222222', '333333333', '444444444', '555555555', '777777777', '888888888', ‘123456789’, ‘234567890’, ‘345678901’, ‘456789012’, ‘567890123’, ‘678901234’, ‘789012345’, ‘890123456’, ‘901234567’)

3

1

(All others)

These checks will not catch all invalid SSNs, but others will be assumed valid.

#### SSNNotProvided

A count of distinct **PersonalID**s in tlsa\_Enrollment where:

-   tlsa\_Person.**SSNValid** = 9; and
-   **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3)

#### SSNMissingOrInvalid

A count of distinct **PersonalID**s in tlsa\_Enrollment where:

-   tlsa\_Person.**SSNValid** = 0; and
-   **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3)

#### ClientSSNNotUnique

A count of distinct **PersonalID**s in tlsa\_Enrollment where:

-   tlsa\_Person.**SSNValid** = 1; and
-   **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3); and
-   hmis\_Client.*SSN* \= \[the hmis\_Client.*SSN* for another **PersonalID** in tlsa\_Person, regardless of **LSAScope**\]

#### DistinctSSNValueNotUnique

A count of distinct hmis\_Client.*SSN* values for people with:

-   tlsa\_Person.**SSNValid** = 1; and
-   At least one record in tlsa\_Enrollment where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3); and
-   hmis\_Client.*SSN* \= \[the hmis\_Client.*SSN* for another **PersonalID** in tlsa\_Person, regardless of **LSAScope**\]

## Data Quality: Enrollment Data

### Relevant Data

#### Source

**lsa\_Project**

ProjectType

**tlsa\_Enrollment**

EnrollmentID

Active

ActiveAge

RelationshipToHoH

DisabilityStatus

**hmis\_Enrollment**

EnrollmentID

DisablingCondition

LivingSituation

LengthOfStay

DateToStreetESSH

PreviousStreetESSH

TimesHomelessPastThreeYears

MonthsHomelessPastThreeYears

**hmis\_Exit**

Destination

#### Target

lsa\_Report

**DisablingCond**

**LivingSituation**

**LengthOfStay**

**HomelessDate**

**TimesHomeless**

**MonthsHomeless**

**Destination**

### Logic

#### DisablingCond

This is a subset of **ClientEntry**.

A count of distinct **EnrollmentIDs** in tlsa\_Enrollment where where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3) and:

-   **DisabilityStatus** = 99.

#### LivingSituation

This is a subset of **AdultHoHEntry**.

A count of distinct **EnrollmentIDs** in tlsa\_Enrollment where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3) and:

-   hmis\_Enrollment**.***LivingSituation* in (8,9,99) or is NULL; and
-   **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1

#### LengthOfStay

This is a subset of **AdultHoHEntry**.

A count of distinct **EnrollmentIDs** in tlsa\_Enrollment where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3) and:

-   hmis\_Enrollment**.***LengthOfStay* in (8,9,99) or is NULL.
-   **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1

#### HomelessDate

This is a subset of **AdultHoHEntry**.

A count of distinct **EnrollmentIDs** in tlsa\_Enrollment where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3) and:

-   **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and
    -   hmis\_Enrollment**.**DateToStreetESSH > EntryDate; or
    -   hmis\_Enrollment**.***DateToStreetESSH* is NULL; and
        -   tlsa\_Enrollment.**LSAProjectType** in (0,1,8); or
        -   *LivingSituation* in (101,116,118); or
        -   PreviousStreetESSH = 1.

#### TimesHomeless

This is a subset of **AdultHoHEntry**.

A count of distinct **EnrollmentIDs** in tlsa\_Enrollment where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3) and:

-   **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and
-   hmis\_Enrollment**.***TimesHomelessPastThreeYears* is NULL or not in (1,2,3,4); and
    -   tlsa\_Enrollment. **LSAProjectType** in (0,1,8); or
    -   *LivingSituation* in (101,116,118); or
    -   PreviousStreetESSH = 1.

#### Months Homeless

This is a subset of **AdultHoHEntry**.

A count of distinct **EnrollmentIDs** in tlsa\_Enrollment where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3) and:

-   **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and
-   hmis\_Enrollment**.***MonthsHomelessPastThreeYears* is NULL or not between 101 and 113; and
    -   tlsa\_Enrollment.**LSAProjectType** in (0,1,8); or
    -   *LivingSituation* in (101,116,118); or
    -   PreviousStreetESSH = 1.

#### Destination

This is a subset of **ClientExit**.

A count of distinct **EnrollmentIDs** in tlsa\_Enrollment where **AIR** = 1 or (**Active** = 1 and **LSAScope** <> 3) and:

-   **ExitDate** is not NULL; and
    -   hmis\_Exit.*Destination* is NULL or in (8,9,17,30,99) or
    -   hmis\_Exit.*Destination* = 435 and hmis\_Exit.*DestinationSubsidyType* is NULL

## Set LSAReport ReportDate

#### Target

lsa\_Report

**ReportDate**

Set LSAReport.**ReportDate** \= the system date/time when all other data required to produce the LSA CSV files has been generated.

## LSAReport

LSAReport has 31 columns; none may be NULL. Data types are shown below.

#

Column Name

Data Type

1

**ReportID**

Integer

2

**ReportDate**

Date/time

3

**ReportStart**

Date

4

**ReportEnd**

Date

5

**ReportCoC**

6-character string (XX-999)

6

**SoftwareVendor**

String; up to 50 characters or ‘n/a’

7

**SoftwareName**

String; up to 50 characters or ‘n/a’

8

**VendorContact**

String; up to 50 characters or ‘n/a’

9

**VendorEmail**

String; up to 50 characters or ‘n/a’

10

**LSAScope**

Integer

11

**LookbackDate**

Date

12

**NoCoC**

Integer

13

**NotOneHoH**

Integer

14

**RelationshipToHoH**

Integer

15

**MoveInDate**

Integer

16

**UnduplicatedClient**

Integer

17

**HouseholdEntry**

Integer

18

**ClientEntry**

Integer

19

**AdultHoHEntry**

Integer

20

**ClientExit**

Integer

21

**SSNNotProvided**

Integer

22

**SSNMissingOrInvalid**

Integer

23

**ClientSSNNotUnique**

Integer

24

**DistinctSSNValueNotUnique**

Integer

25

**DisablingCond**

Integer

26

**LivingSituation**

Integer

27

**LengthOfStay**

Integer

28

**HomelessDate**

Integer

29

**TimesHomeless**

Integer

30

**MonthsHomeless**

Integer

31

**Destination**

Integer

1.  The only exceptions to this are OPH counts (section 9.6) and data quality reporting (sections 10 and 11). [↑](#footnote-ref-2)
    
2.  Note that this will exclude night-by-night enrollments without a record of a bed night on the entry date. [↑](#footnote-ref-3)