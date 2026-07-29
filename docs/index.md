---
layout: default
title: "LSA Programming Specifications"
nav_order: 1
has_children: true
has_toc: true
---
 [1 - Introduction](../01 - Introduction)

 - [1.1 Background](../01 - Introduction#11-background)
 - [1.2 About This Document](../01 - Introduction#12-about-this-document)
 - [1.3 Definitions/Acronyms](../01 - Introduction#13-definitions-acronyms)
 - [1.4 Changes Effective 11/1/2025](../01 - Introduction#14-changes-effective-11-1-2025)

 [2 - HDX 2.0 Upload](../02 - HDX 2.0 Upload)

 - [2.1 Project.csv](../02 - HDX 2.0 Upload#21-projectcsv)
 - [2.2 Organization.csv](../02 - HDX 2.0 Upload#22-organizationcsv)
 - [2.3 Funder.csv](../02 - HDX 2.0 Upload#23-fundercsv)
 - [2.4 ProjectCoC.csv](../02 - HDX 2.0 Upload#24-projectcoccsv)
 - [2.5 Inventory.csv](../02 - HDX 2.0 Upload#25-inventorycsv)
 - [2.6 HMISParticipation.csv](../02 - HDX 2.0 Upload#26-hmisparticipationcsv)
 - [2.7 Affiliation.csv](../02 - HDX 2.0 Upload#27-affiliationcsv)
 - [2.8 LSAReport.csv](../02 - HDX 2.0 Upload#28-lsareportcsv)
 - [2.9 LSAPerson.csv](../02 - HDX 2.0 Upload#29-lsapersoncsv)
 - [2.10 LSAHousehold.csv](../02 - HDX 2.0 Upload#210-lsahouseholdcsv)

 [3 - Core Concepts and Data Universe](../03 - Core Concepts and Data Universe)

 - [3.1 Report Parameters and Metadata (lsa_Report)](../03 - Core Concepts and Data Universe#31-report-parameters-and-metadata-lsa_report)
  - [ReportID](../03 - Core Concepts and Data Universe#reportid)
  - [ReportStart](../03 - Core Concepts and Data Universe#reportstart)
  - [ReportEnd](../03 - Core Concepts and Data Universe#reportend)
  - [ReportCoC](../03 - Core Concepts and Data Universe#reportcoc)
  - [LSAScope](../03 - Core Concepts and Data Universe#lsascope)
  - [User-Selected Projects (for Project-Focused LSA)](../03 - Core Concepts and Data Universe#user-selected-projects-for-project-focused-lsa)
  - [SoftwareVendor and SoftwareName](../03 - Core Concepts and Data Universe#softwarevendor-and-softwarename)
  - [VendorContact and VendorEmail](../03 - Core Concepts and Data Universe#vendorcontact-and-vendoremail)

 - [3.2 LSA Reporting Cohorts and Dates (tlsa_CohortDates)](../03 - Core Concepts and Data Universe#32-lsa-reporting-cohorts-and-dates-tlsa_cohortdates)

 - [3.3 HMIS Household Enrollments (tlsa_HHID)](../03 - Core Concepts and Data Universe#33-hmis-household-enrollments-tlsa_hhid)
  - [HMIS Data Requirements and Assumptions](../03 - Core Concepts and Data Universe#hmis-data-requirements-and-assumptions)
  - [HMISStart and HMISEnd](../03 - Core Concepts and Data Universe#hmisstart-and-hmisend)
  - [BedNightDates, FirstBedNight and LastBedNight](../03 - Core Concepts and Data Universe#bednightdates-firstbednight-and-lastbednight)
  - [Record Selection](../03 - Core Concepts and Data Universe#record-selection)
  - [EntryDate](../03 - Core Concepts and Data Universe#entrydate)
  - [MoveInDate](../03 - Core Concepts and Data Universe#moveindate)
  - [ExitDate](../03 - Core Concepts and Data Universe#exitdate)
  - [ExitDest](../03 - Core Concepts and Data Universe#exitdest)

 - [3.4 HMIS Client Enrollments (tlsa_Enrollment)](../03 - Core Concepts and Data Universe#34-hmis-client-enrollments-tlsa_enrollment)
  - [Record Selection](../03 - Core Concepts and Data Universe#record-selection)
  - [EntryDate](../03 - Core Concepts and Data Universe#entrydate)
  - [MoveInDate](../03 - Core Concepts and Data Universe#moveindate)
  - [Last Bed Night for Night-by-Night Shelter Enrollments](../03 - Core Concepts and Data Universe#last-bed-night-for-night-by-night-shelter-enrollments)
  - [ExitDate](../03 - Core Concepts and Data Universe#exitdate)
  - [DisabilityStatus](../03 - Core Concepts and Data Universe#disabilitystatus)
  - [DVStatus](../03 - Core Concepts and Data Universe#dvstatus)

 - [3.5 Enrollment Ages (tlsa_Enrollment)](../03 - Core Concepts and Data Universe#35-enrollment-ages-tlsa_enrollment)
  - [EntryAge](../03 - Core Concepts and Data Universe#entryage)
  - [ActiveAge](../03 - Core Concepts and Data Universe#activeage)
  - [Exit1Age/Exit2Age](../03 - Core Concepts and Data Universe#exit1ageexit2age)

 - [3.6 Household Types (tlsa_HHID)](../03 - Core Concepts and Data Universe#36-household-types-tlsa_hhid)
  - [EntryHHType](../03 - Core Concepts and Data Universe#entryhhtype)
  - [ActiveHHType](../03 - Core Concepts and Data Universe#activehhtype)
  - [Exit1HHType/Exit2HHType](../03 - Core Concepts and Data Universe#exit1hhtypeexit2hhtype)

 [4 - HMIS Business Logic: Project Descriptor Data for Export](../04 - Project Descriptor Data)

 - [4.1 Get Project.csv Records / lsa_Project](../04 - Project Descriptor Data#41-get-projectcsv-records--lsa_project)
 - [4.2 Get Organization.csv Records / lsa_Organization](../04 - Project Descriptor Data#42-get-organizationcsv-records--lsa_organization)
 - [4.3 Get Funder.csv Records / lsa_Funder](../04 - Project Descriptor Data#43-get-fundercsv-records--lsa_funder)
 - [4.4 Get ProjectCoC.csv Records / lsa_ProjectCoC](../04 - Project Descriptor Data#44-get-projectcoccsv-records--lsa_projectcoc)
 - [4.5 Get Inventory.csv Records / lsa_Inventory](../04 - Project Descriptor Data#45-get-inventorycsv-records--lsa_inventory)
 - [4.6 Get HMISParticipation.csv Records / lsa_HMISParticipation](../04 - Project Descriptor Data#46-get-hmisparticipationcsv-records--lsa_hmisparticipation)
 - [4.7 Get Affiliation.csv Records / lsa_Affiliation](../04 - Project Descriptor Data#47-get-affiliationcsv-records--lsa_affiliation)
 
 [5 - HMIS Business Logic - LSAPerson](../05 - LSAPerson)

 - [5.1 Identify Active and Active in Residence (AIR) HouseholdIDs](../05 - LSAPerson#51-identify-active-and-active-in-residence-air-householdids)
 [5 - HMIS Business Logic - LSAPerson](../05 - LSAPerson)

 - [5.1 Identify Active and Active in Residence (AIR) HouseholdIDs](../05 - LSAPerson#51-identify-active-and-active-in-residence-air-householdids)
  - [Active](../05 - LSAPerson#active)
  - [AIR](../05 - LSAPerson#air)

 - [5.2 Identify Active and Active in Residence (AIR) Enrollments](../05 - LSAPerson#52-identify-active-and-active-in-residence-air-enrollments)
  - [Active](../05 - LSAPerson#active)
  - [AIR](../05 - LSAPerson#air)

 - [5.3 Get Active Clients for LSAPerson](../05 - LSAPerson#53-get-active-clients-for-lsaperson)

 - [5.4 LSAPerson Demographics](../05 - LSAPerson#54-lsaperson-demographics)
  - [HoHAdult](../05 - LSAPerson#hohadult)
  - [RaceEthnicity](../05 - LSAPerson#raceethnicity)
  - [VetStatus](../05 - LSAPerson#vetstatus)
  - [HIV](../05 - LSAPerson#hiv)
  - [SMI](../05 - LSAPerson#smi)
  - [SUD](../05 - LSAPerson#sud)
  - [DisabilityStatus](../05 - LSAPerson#disabilitystatus)
  - [DVStatus](../05 - LSAPerson#dvstatus)

 - [5.5 Time Spent in ES/SH or on the Street – LSAPerson](../05 - LSAPerson#55-time-spent-in-essh-or-on-the-street--lsaperson)

 - [5.6 Enrollments Relevant to Counting ES/SH/Street Dates](../05 - LSAPerson#56-enrollments-relevant-to-counting-esshstreet-dates)

 - [5.7 Get Dates to Exclude from Counts of ES/SH/Street Days (ch_Exclude)](../05 - LSAPerson#57-get-dates-to-exclude-from-counts-of-esshstreet-days-ch_exclude)

 - [5.8 Get Dates to Include in Counts of ES/SH/Street Days (ch_Include)](../05 - LSAPerson#58-get-dates-to-include-in-counts-of-esshstreet-days-ch_include)
  - [Enrollment in Entry/Exit ES or SH](../05 - LSAPerson#enrollment-in-entryexit-es-or-sh)
  - [Bed Nights in Night-by-Night ES](../05 - LSAPerson#bed-nights-in-night-by-night-es)
  - [ES/SH/Street Dates from 3.917 Living Situation](../05 - LSAPerson#es-sh-street-dates-from-3-917-living-situation)
  - [Gaps of Less than Seven Days Between Two ES/SH/Street Dates](../05 - LSAPerson#gaps-of-less-than-seven-days-between-two-esshstreet-dates)

 - [5.9 Get ES/SH/Street Episodes (ch_Episodes)](../05 - LSAPerson#59-get-esshstreet-episodes-ch_episodes)

 - [5.10 CHTime and CHTimeStatus – LSAPerson](../05 - LSAPerson#510-chtime-and-chtimestatus--lsaperson)

 - [5.11 EST/RRH/PSH/RRHSOAgeMin and EST/RRH/PSH/RRHSOAgeMax – LSAPerson](../05 - LSAPerson#511-estrrhpshrrhsoagemin-and-estrrhpshrrhsoagemax--lsaperson)

 - [5.12 Set Population Identifiers for Active HMIS Households](../05 - LSAPerson#512-set-population-identifiers-for-active-hmis-households)
  - [HHChronic](../05 - LSAPerson#hhchronic)
  - [HHVet](../05 - LSAPerson#hhvet)
  - [HHDisability](../05 - LSAPerson#hhdisability)
  - [HHFleeingDV](../05 - LSAPerson#hhfleeingdv)
  - [HHAdultAge](../05 - LSAPerson#hhadultage)
  - [HHParent](../05 - LSAPerson#hhparent)
  - [AC3Plus](../05 - LSAPerson#ac3plus)

 - [5.13 Project Group and Population Household Types - LSAPerson](../05 - LSAPerson#513-project-group-and-population-household-types---lsaperson)

 - [5.14 Adult Age Population Identifiers - LSAPerson](../05 - LSAPerson#514-adult-age-population-identifiers---lsaperson)

 - [5.15 LSAPerson](../05 - LSAPerson#515-lsaperson)

 - [6.1 Get Distinct Households for LSAHousehold](../06 - LSAHousehold#61-get-distinct-households-for-lsahousehold)

 - [6.2 Set Population Identifiers for LSAHousehold](../06 - LSAHousehold#62-set-population-identifiers-for-lsahousehold)
  - [HHAdult](../06 - LSAHousehold#hhadult)
  - [HHChild](../06 - LSAHousehold#hhchild)
  - [HoHRaceEthnicity](../06 - LSAHousehold#hohraceethnicity)
  - [HHVet, HHDisability, and HHParent](../06 - LSAHousehold#hhvet-hhdisability-and-hhparent)
  - [HHFleeingDV](../06 - LSAHousehold#hhfleeingdv)
  - [HHChronic](../06 - LSAHousehold#hhchronic)
  - [HHAdultAge](../06 - LSAHousehold#hhadultage)

 - [6.3 EST/RRH/PSH/RRHSOStatus – LSAHousehold](../06 - LSAHousehold#63-estrrhpshrrhsostatus--lsahousehold)

 - [6.4 RRH/PSH/RRHSOMoveIn – LSAHousehold](../06 - LSAHousehold#64-rrhpshrrrhsomovein--lsahousehold)

 - [6.5 EST/RRH/PSHGeography – LSAHousehold](../06 - LSAHousehold#65-estrrhpshgeography--lsahousehold)

 - [6.6 EST/RRH/PSHLivingSit – LSAHousehold](../06 - LSAHousehold#66-estrrhpshlivingsit--lsahousehold)

 - [6.7 EST/RRH/PSHDestination – LSAHousehold](../06 - LSAHousehold#67-estrrhpshdestination--lsahousehold)

 - [6.8 EST/RRH/PSH Population Identifiers](../06 - LSAHousehold#68-estrrhpsh-population-identifiers)
  - [EST/RRH/PSHAC3Plus](../06 - LSAHousehold#estrrhpshac3plus)
  - [EST/RRH/PSHVet](../06 - LSAHousehold#estrrhpshvet)
  - [EST/RRH/PSHChronic](../06 - LSAHousehold#estrrhpshchronic)
  - [EST/RRH/PSHDisability](../06 - LSAHousehold#estrrhpshdisability)
  - [EST/RRH/PSHFleeingDV](../06 - LSAHousehold#estrrhpshfleeingdv)
  - [EST/RRH/PSHParent](../06 - LSAHousehold#estrrhpshparent)
  - [EST/RRH/PSHAdultAge](../06 - LSAHousehold#estrrhpshadultage)

 - [6.9 System Engagement Status and Return Time](../06 - LSAHousehold#69-system-engagement-status-and-return-time)
  - [FirstEntry](../06 - LSAHousehold#firstentry)
  - [Previous Activity / StatEnrollmentID](../06 - LSAHousehold#previous-activity--statenrollmentid)
  - [ReturnTime](../06 - LSAHousehold#returntime)
  - [Stat](../06 - LSAHousehold#stat)

 - [6.10 RRHPreMoveInDays – LSAHousehold](../06 - LSAHousehold#610-rrhpremoveindays--lsahousehold)

 - [6.11 Dates Housed in PSH or RRH (sys_Time)](../06 - LSAHousehold#611-dates-housed-in-psh-or-rrh-sys_time)
  - [Dates Housed in PSH](../06 - LSAHousehold#dates-housed-in-psh)
  - [Dates Housed in RRH](../06 - LSAHousehold#dates-housed-in-rrh)

 - [6.12 Get Last Inactive Date (sys_TimePadded)](../06 - LSAHousehold#612-get-last-inactive-date-sys_timepadded)

 - [6.13 Get Dates of Other System Use (sys_Time)](../06 - LSAHousehold#613-get-dates-of-other-system-use-sys_time)

 - [6.14 Get Other Dates Homeless from 3.917A/B Living Situation](../06 - LSAHousehold#614-get-other-dates-homeless-from-3917ab-living-situation)

 - [6.15 Set System Use Days for LSAHousehold](../06 - LSAHousehold#615-set-system-use-days-for-lsahousehold)
  - [ESDays](../06 - LSAHousehold#esdays)
  - [THDays](../06 - LSAHousehold#thdays)
  - [ESTDays](../06 - LSAHousehold#estdays)
  - [RRHPSHPreMoveInDays](../06 - LSAHousehold#rrhpshpremoveindays)
  - [SystemHomelessDays](../06 - LSAHousehold#systemhomelessdays)
  - [RRHHousedDays](../06 - LSAHousehold#rrhhouseddays)
  - [SystemDaysNotPSHHoused](../06 - LSAHousehold#systemdaysnotpshhoused)
  - [PSHHousedDays](../06 - LSAHousehold#pshhouseddays)
  - [Other3917Days](../06 - LSAHousehold#other3917days)

 - [6.16 Update EST/RRH/PSH/RRHSOStatus](../06 - LSAHousehold#616-update-estrrhpshrrhsostatus)

 - [6.17 Set EST/RRH/PSHAIR](../06 - LSAHousehold#617-set-estrrhpshair)

 - [6.18 Set SystemPath for LSAHousehold](../06 - LSAHousehold#618-set-systempath-for-lsahousehold)

 - [6.19 LSAHousehold](../06 - LSAHousehold#619-lsahousehold)

 - [7.1 Identify Qualifying Exits in Exit Cohort Periods](../07 - LSAExit#71-identify-qualifying-exits-in-exit-cohort-periods)
  - [Qualifying Exits](../07 - LSAExit#qualifying-exits)

 - [7.2 Select Reportable Exits](../07 - LSAExit#72-select-reportable-exits)
  - [Exit Households](../07 - LSAExit#exit-households)
  - [QualifyingExitHHID](../07 - LSAExit#qualifyingexithhid)
  - [ExitFrom](../07 - LSAExit#exitfrom)

 - [7.3 Set ReturnTime for Exit Cohort Households](../07 - LSAExit#73-set-returntime-for-exit-cohort-households)
  - [Household Returns](../07 - LSAExit#household-returns)
  - [ReturnTime](../07 - LSAExit#returntime)

 - [7.4 Identify HoH and Adult Members of Exit Cohorts](../07 - LSAExit#74-identify-hoh-and-adult-members-of-exit-cohorts)
  - [Record Selection](../07 - LSAExit#record-selection)
  - [DisabilityStatus](../07 - LSAExit#disabilitystatus)
  - [LastActive](../07 - LSAExit#lastactive)
  - [CHStart](../07 - LSAExit#chstart)
  - [CHTime and CHTimeStatus](../07 - LSAExit#chtime-and-chtimestatus)

 - [7.5 Get Dates to Exclude from Counts of ES/SH/Street Days (ch_Exclude_exit)](../07 - LSAExit#75-get-dates-to-exclude-from-counts-of-esshstreet-days-ch_exclude)

 - [7.6 Get Dates to Include in Counts of ES/SH/Street Days (ch_Include_exit)](../07 - LSAExit#76-get-dates-to-include-in-counts-of-esshstreet-days-ch_include)
  - [Enrollment in Entry/Exit ES or SH](../07 - LSAExit#enrollment-in-entryexit-es-or-sh)
  - [Bed Nights in Night-by-Night ES](../07 - LSAExit#bed-nights-in-night-by-night-es)
  - [ES/SH/Street Dates from 3.917 Living Situation](../07 - LSAExit#es-sh-street-dates-from-3-917-living-situation)
  - [Gaps of Less than Seven Days Between Two ES/SH/Street Dates](../07 - LSAExit#gaps-of-less-than-seven-days-between-two-esshstreet-dates)

 - [7.7 Get ES/SH/Street Episodes (ch_Episodes_exit)](../07 - LSAExit#77-get-esshstreet-episodes-ch_episodes)

 - [7.8 CHTime and CHTimeStatus for Exit Cohorts](../07 - LSAExit#78-chtime-and-chtimestatus-for-exit-cohorts)

 - [7.9 Set Population Identifiers for Exit Cohort Households](../07 - LSAExit#79-set-population-identifiers-for-exit-cohort-households)
  - [HHVet](../07 - LSAExit#hhvet)
  - [HHChronic](../07 - LSAExit#hhchronic)
  - [HHDisability](../07 - LSAExit#hhdisability)
  - [HHFleeingDV](../07 - LSAExit#hhfleeingdv)
  - [HoHRaceEthnicity](../07 - LSAExit#hohraceethnicity)
  - [HHAdultAge](../07 - LSAExit#hhadultage)
  - [HHParent](../07 - LSAExit#hhparent)
  - [AC3Plus](../07 - LSAExit#ac3plus)

 - [7.10 Set System Engagement Status for Exit Cohort Households](../07 - LSAExit#710-set-system-engagement-status-for-exit-cohort-households)
  - [Previous Activity](../07 - LSAExit#previous-activity)
  - [Stat](../07 - LSAExit#stat)

 - [7.11 Last Inactive Date for Exit Cohorts](../07 - LSAExit#711-last-inactive-date-for-exit-cohorts)

 - [7.12 Set SystemPath for LSAExit](../07 - LSAExit#712-set-systempath-for-lsaexit)

 - [7.13 LSAExit](../07 - LSAExit#713-lsaexit)

 - [8.1 LSACalculated Columns](../08 - LSACalculated Averages#81-lsacalculated-columns)

 - [8.2 Report Rows for LSACalculated Averages](../08 - LSACalculated Averages#82-report-rows-for-lsacalculated-averages)

 - [8.3 Populations for Average Days from LSAHousehold and LSAExit](../08 - LSACalculated Averages#83-populations-for-average-days-from-lsahousehold-and-lsaexit)

 - [8.4 Get Average Days for Length of Time Homeless](../08 - LSACalculated Averages#84-get-average-days-for-length-of-time-homeless)

 - [8.5 Get Average Days for Length of Time Homeless by System Path](../08 - LSACalculated Averages#85-get-average-days-for-length-of-time-homeless-by-system-path)

 - [8.6 Get Average Days for Cumulative Length of Time Housed in PSH](../08 - LSACalculated Averages#86-get-average-days-for-cumulative-length-of-time-housed-in-psh)

 - [8.7 Get Average Days for Length of Time in RRH Projects](../08 - LSACalculated Averages#87-get-average-days-for-length-of-time-in-rrh-projects)

 - [8.8 Get Average Days to Return/Re-engage by Last Project Type](../08 - LSACalculated Averages#88-get-average-days-to-returnre-engage-by-last-project-type)

 - [8.9 Get Average Days to Return/Re-engage by Population](../08 - LSACalculated Averages#89-get-average-days-to-returnre-engage-by-population)

 - [8.10 Get Average Days to Return/Re-engage by System Path](../08 - LSACalculated Averages#810-get-average-days-to-returnre-engage-by-system-path)

 - [8.11 Get Average Days to Return/Re-engage by Exit Destination](../08 - LSACalculated Averages#811-get-average-days-to-returnre-engage-by-exit-destination)

 - [9.1 Report Rows for LSACalculated Counts](../09 - LSACalculated Counts#91-report-rows-for-lsacalculated-counts)

 - [9.2 Identify Active and Point in Time Cohorts for LSACalculated Counts](../09 - LSACalculated Counts#92-identify-active-and-point-in-time-cohorts-for-lsacalculated-counts)

 - [9.3 Counts of People and Households by Project and Household Characteristics](../09 - LSACalculated Counts#93-counts-of-people-and-households-by-project-and-household-characteristics)

 - [9.4 Get Counts of People by Project and Personal Characteristics](../09 - LSACalculated Counts#94-get-counts-of-people-by-project-and-personal-characteristics)

 - [9.5 Get Counts of Bednights](../09 - LSACalculated Counts#95-get-counts-of-bednights)

 - [9.6 Get OPH Point-in-Time Counts for HIC](../09 - LSACalculated Counts#96-get-oph-point-in-time-counts-for-hic)

 - [10.1 Static Column Values](../10 - LSACalculated Data Quality Counts#101-static-column-values)

 - [10.2 DQ - Enrollments Active After Project Operating End Date by Project](../10 - LSACalculated Data Quality Counts#102-dq---enrollments-active-after-project-operating-end-date-by-project)

 - [10.3 DQ - Night-by-Night Enrollments with Exit Date Discrepancies by Project](../10 - LSACalculated Data Quality Counts#103-dq---night-by-night-enrollments-with-exit-date-discrepancies-by-project)

 - [10.4 DQ - Counts of Households with no EnrollmentCoC by Project](../10 - LSACalculated Data Quality Counts#104-dq---counts-of-households-with-no-enrollmentcoc-by-project)

 - [10.5 DQ – Enrollments in Non-Participating Projects](../10 - LSACalculated Data Quality Counts#105-dq--enrollments-in-non-participating-projects)

 - [10.6 DQ – Enrollments Active in LSA Projects During the Report Period without Exactly One HoH](../10 - LSACalculated Data Quality Counts#106-dq--enrollments-active-in-lsa-projects-during-the-report-period-without-exactly-one-hoh)

 - [10.7 DQ – Enrollments Active in LSA Projects without a Valid Relationship to HoH](../10 - LSACalculated Data Quality Counts#107-dq--enrollments-active-in-lsa-projects-without-a-valid-relationship-to-hoh)

 - [10.8 DQ – Household Entry](../10 - LSACalculated Data Quality Counts#108-dq--household-entry)

 - [10.9 DQ – Client Entry](../10 - LSACalculated Data Quality Counts#109-dq--client-entry)

 - [10.10 DQ – Adult/HoH Entry](../10 - LSACalculated Data Quality Counts#1010-dq--adulthoh-entry)

 - [10.11 DQ – Client Exit](../10 - LSACalculated Data Quality Counts#1011-dq--client-exit)

 - [10.12 DQ – Disabling Condition](../10 - LSACalculated Data Quality Counts#1012-dq--disabling-condition)

 - [10.13 DQ – Living Situation](../10 - LSACalculated Data Quality Counts#1013-dq--living-situation)

 - [10.14 DQ – Length of Stay](../10 - LSACalculated Data Quality Counts#1014-dq--length-of-stay)

 - [10.15 DQ – Date ES/SH/Street Homelessness Started](../10 - LSACalculated Data Quality Counts#1015-dq--date-esshstreet-homelessness-started)

 - [10.16 DQ – Times ES/SH/Street Homeless Last 3 Years](../10 - LSACalculated Data Quality Counts#1016-dq--times-esshstreet-homeless-last-3-years)

 - [10.17 DQ – Months ES/SH/Street Homeless Last 3 Years](../10 - LSACalculated Data Quality Counts#1017-dq--months-esshstreet-homeless-last-3-years)

 - [10.18 DQ – Destination](../10 - LSACalculated Data Quality Counts#1018-dq--destination)

 - [10.19 DQ – Date of Birth](../10 - LSACalculated Data Quality Counts#1019-dq--date-of-birth)

 - [10.20 LSACalculated](../10 - LSACalculated Data Quality Counts#1020-lsacalculated)

 - [11.1 Data Quality: HMIS Household Enrollments Not Associated with a CoC](../11 - LSAReport#111-data-quality-hmis-household-enrollments-not-associated-with-a-coc)
  - [NoCoC](../11 - LSAReport#nococ)

 - [11.2 Data Quality: Households Excluded from the LSA Due to HoH Errors](../11 - LSAReport#112-data-quality-households-excluded-from-the-lsa-due-to-hoh-errors)
  - [NotOneHoH](../11 - LSAReport#notonehoh)

 - [11.3 Data Quality: Enrollments Excluded from the LSA Due to Invalid RelationshipToHoH](../11 - LSAReport#113-data-quality-enrollments-excluded-from-the-lsa-due-to-invalid-relationshiptohoh)
  - [RelationshipToHoH](../11 - LSAReport#relationshiptohoh)

 - [11.4 Data Quality: Invalid Move-In Dates](../11 - LSAReport#114-data-quality-invalid-moveindates)
  - [MoveInDate](../11 - LSAReport#moveindate)

 - [11.5 Data Quality: Baseline Counts of Clients / HouseholdIDs / EnrollmentIDs](../11 - LSAReport#115-data-quality-baseline-counts-of-clients--householdids--enrollmentids)
  - [UnduplicatedClient](../11 - LSAReport#unduplicatedclient)
  - [HouseholdEntry](../11 - LSAReport#householdentry)
  - [ClientEntry](../11 - LSAReport#cliententry)
  - [AdultHoHEntry](../11 - LSAReport#adulthohentry)
  - [ClientExit](../11 - LSAReport#clientexit)

 - [11.6 Data Quality: SSN Issues](../11 - LSAReport#116-data-quality-ssn-issues)
  - [SSNValid](../11 - LSAReport#ssnvalid)
  - [SSNNotProvided](../11 - LSAReport#ssnnotprovided)
  - [SSNMissingOrInvalid](../11 - LSAReport#ssnmissingorinvalid)
  - [ClientSSNNotUnique](../11 - LSAReport#clientssnnotunique)
  - [DistinctSSNValueNotUnique](../11 - LSAReport#distinctssnvaluenotunique)

 - [11.7 Data Quality: Counts of Enrollment Issues](../11 - LSAReport#117-data-quality-counts-of-enrollment-issues)
  - [DisablingCond](../11 - LSAReport#disablingcond)
  - [LivingSituation](../11 - LSAReport#livingsituation)
  - [LengthOfStay](../11 - LSAReport#lengthofstay)
  - [HomelessDate](../11 - LSAReport#homelessdate)
  - [TimesHomeless](../11 - LSAReport#timeshomeless)
  - [MonthsHomeless](../11 - LSAReport#monthshomeless)
  - [Destination](../11 - LSAReport#destination)

 - [11.8 Set LSAReport ReportDate](../11 - LSAReport#118-set-lsareport-reportdate)

 - [11.9 LSAReport](../11 - LSAReport#119-lsareport)
