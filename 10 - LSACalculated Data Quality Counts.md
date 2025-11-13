# HMIS Business Logic: LSACalculated Project-Level Data Quality Counts

Report Rows 901-920 are project-level counts of data quality issues;
this is to provide information to CoCs and the AHAR analysis team about
specific sources of data quality issues.

## Static Column Values

| lsa_Calculated |
|----------------|

| **Cohort**     | 1                                 |
|----------------|-----------------------------------|
| **Universe**   | 10                                |
| **HHType**     | 0                                 |
| **Population** | 0                                 |
| **SystemPath** | -1                                |
| **ProjectID**  | Must match Project.**ProjectID**. |
| **ReportID**   | Must match LSAReport.**ReportID** |

**ReportRow** numbers and **Value** criteria are defined in the
following sections.

## DQ - Enrollments Active After Project Operating End Date by Project

**ReportRow** 901 counts enrollments in tlsa_Enrollment with no
*ExitDate* in hmis_Exit for projects that have an *OperatingEndDate*
between <u>ReportStart</u> and <u>ReportEnd</u>.

**ReportRow** 902 counts enrollments in tlsa_Enrollment where
*OperatingEndDate* is between <u>ReportStart</u> and <u>ReportEnd</u>
and hmis_Exit.*ExitDate* \> *OperatingEndDate*.

These counts are grouped by **ProjectID**.

**Value** = a count of distinct **EnrollmentID**s in tlsa_Enrollment
where:

- Exit.*ExitDate* is NULL (**ReportRow** 901); or

- Exit.*ExitDate* \> Project. *OperatingEndDate* (**ReportRow** 902);

AND:

- hmis_Project.*OperatingEndDate* between <u>ReportStart</u> and
  <u>ReportEnd</u>

Records are only included when the count is greater than zero.

## DQ - Night-by-Night Enrollments with Exit Date Discrepancies by Project

**ReportRow** 903 counts enrollments without an *ExitDate* as of
<u>ReportEnd</u> (i.e., *ExitDate* is after <u>ReportEnd</u> or is NULL)
in continuum night-by-night ES projects that have no record of a bed
night in the 90 days ending on <u>ReportEnd</u>.

**ReportRow** 904 counts enrollments with an *ExitDate* in continuum
night-by-night ES projects between <u>ReportStart</u> and
<u>ReportEnd</u> and where there is no record of a bed night on
\[*ExitDate* – 1 day\].

**Value** = a count of distinct *EnrollmentID*s in hmis_Enrollment
where:

- hmis_Project.*ProjectType* = 1; and

- hmis_Project.*ContinuumProject* = 1; and

- There is a record for the *HouseholdID* in tlsa_HHID (i.e., the
  household was active in <u>ReportCoC</u>)

  - Exit.*ExitDate* is NULL or Exit.*ExitDate* \> <u>ReportEnd;</u> and

    - **LastBedNight** \<= \[CohortEnd – 90 days\](**ReportRow** 903);
      or

  - Exit.*ExitDate* between <u>ReportStart</u> and <u>ReportEnd</u> and
    **LastBedNight** \<\> *ExitDate* – 1 day\] (**ReportRow** 904)

In this context, **LastBedNight** is the most recent bed night for the
enrollment on or before <u>ReportEnd</u>.

## DQ - Counts of Households with no EnrollmentCoC by Project

**ReportRow** 905 counts households that are active in a continuum
ES/SH/TH/RRH/PSH/RRHSO project during the report period and whose
enrollment(s) are not associated with any CoC.

**Value** = a count of distinct *HouseholdID*s in hmis_Enrollment where:

- *ProjectID* = lsa_Project.**ProjectID** and *ProjectType* is not in
  (9,10); and

- *EntryDate* \<= <u>ReportEnd; and</u>

- hmis_Exit*.ExitDate* is NULL or

  - Exit*.ExitDate* \>= <u>ReportStart</u>; and

  - Exit*.ExitDate* \> Enrollment.*EntryDate*

- There is no hmis_Enrollment record where:

  - EnrollmentCoC is not NULL; and

  - RelationshipToHoH = 1

## DQ – Enrollments in Non-Participating Projects

**ReportRow** 906 counts enrollments in hmis_Enrollment that are active
during the report period and overlap with a period in which the project
was not identified as participating in HMIS. This may include
enrollments that were excluded from the LSA entirely and/or enrollments
used in LSA reporting with adjusted entry/exit dates.

**Value** = a count of distinct *EnrollmentID*s in hmis_Enrollment
where:

- *ProjectID* = lsa_Project.**ProjectID** and *ProjectType* is not in
  (9,10); and

- *EntryDate* \<= <u>ReportEnd; and</u>

- hmis_Exit*.ExitDate* is NULL or

  - Exit*.ExitDate* \>= <u>ReportStart</u>; and

  - Exit*.ExitDate* \> Enrollment.*EntryDate*

- *EnrollmentCoC* = <u>ReportCoC</u> for the head of household’s
  enrollment; and

- There is no record in lsa_HMISParticipation for the **ProjectID**
  where:

- HMISParticipationType = 1 and HMISParticipationStatusStartDate \<=
  EntryDate; and

  - HMISParticipationStatusEndDate is null; or

  - HMISParticipationStatusEndDate \>= *ExitDate;* or

  - *ExitDate* is null and **HMISParticipationStatusEndDate** \>
    <u>ReportEnd</u>

## DQ – Enrollments Active in LSA Projects During the Report Period without Exactly One HoH

**ReportRow** 907 counts enrollments that are active in a continuum
ES/SH/TH/RRH/PSH/RRHSO project during the report period and do not have
exactly one HoH.

**Value** = a count of distinct *EnrollmentID*s in hmis_Enrollment
where:

- *ProjectID* = lsa_Project.**ProjectID** and
  lsa_Project.**ProjectType** is not in (9,10)

- *EnrollmentCoC* for the head of household’s enrollment =
  <u>ReportCoC</u>

- hmis_Exit.*ExitDate* is null or *ExitDate* \>= <u>ReportStart</u>; and

- hmis_Exit.*ExitDate* is null or *ExitDate* \> *EntryDate*; and

- The count of *PersonalID*s in hmis_Enrollment with the same
  *HouseholdID* and a *RelationshipToHoH* = 1 \<\> 1

## DQ – Enrollments Active in LSA Projects without a Valid Relationship to HoH

**ReportRow** 908 counts enrollments that are active in a continuum
ES/SH/TH/RRH/PSH/RRHSO project during the report period and do not have
a valid *RelationshipToHoH.*.

**Value** = a count of distinct *EnrollmentID*s in hmis_Enrollment
where:

- *ProjectID* = lsa_Project.**ProjectID** and
  lsa_Project.**ProjectType** is not in (9,10)

- *EnrollmentCoC* for the head of household’s enrollment =
  <u>ReportCoC</u>

- hmis_Exit.*ExitDate* is null or *ExitDate* \>= <u>ReportStart</u>; and

- hmis_Exit.*ExitDate* is null or *ExitDate* \> *EntryDate*; and

- *RelationshipToHoH* is NULL or not in (1,2,3,4,5)

## DQ – Household Entry

The **Value** for **ReportRow** 909 is a count of distinct
**HouseholdID**s in tlsa_HHID where **AIR** = 1 or (**LSAScope** \<\> 3
and **Active** = 1).

## DQ – Client Entry

The **Value** for **ReportRow** 910 is a count of distinct
**EnrollmentID**s in tlsa_Enrollment where **AIR** = 1 or (**LSAScope**
\<\> 3 and **Active** = 1).

## DQ – Adult/HoH Entry

The **Value** for **ReportRow** 911 is a count of distinct
**EnrollmentID**s in tlsa_Enrollment where **AIR** = 1 or (**LSAScope**
\<\> 3 and **Active** = 1) and:

- **ActiveAge** between 18 and 65; or

- RelationshipToHoH = 1.

## DQ – Client Exit

The **Value** for **ReportRow** 912 is a count of distinct
**PersonalID**s in tlsa_Enrollment where **AIR** = 1 or (**LSAScope**
\<\> 3 and **Active** = 1) and **ExitDate** is not NULL.

## DQ – Disabling Condition

This is a subset of **ClientEntry** (the **Value** for **ReportRow**
910).

The **Value** for **ReportRow** 913 is a count of distinct
**EnrollmentIDs** in tlsa_Enrollment for **ProjectID**s in lsa_Project
where where **AIR** = 1 or (**LSAScope** \<\> 3 and **Active** = 1) and:

- DisabilityStatus = 99.

## DQ – Living Situation

This is a subset of **AdultHoHEntry**(the **Value** for **ReportRow**
911).

The **Value** for **ReportRow** 914 is a count of distinct
**EnrollmentIDs** in tlsa_Enrollment for **ProjectID**s in lsa_Project
where where **AIR** = 1 or (**LSAScope** \<\> 3 and **Active** = 1) and:

- hmis_Enrollment**.***LivingSituation* in (8,9,99) or is NULL; and

- **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1

## DQ – Length of Stay

This is a subset of **AdultHoHEntry**(the **Value** for **ReportRow**
911).

The **Value** for **ReportRow** 915 is a count of distinct
**EnrollmentIDs** in tlsa_Enrollment for **ProjectID**s in lsa_Project
where where **AIR** = 1 or (**LSAScope** \<\> 3 and **Active** = 1) and:

- hmis_Enrollment**.***LengthOfStay* in (8,9,99) or is NULL.

- **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1

## DQ – Date ES/SH/Street Homelessness Started

This is a subset of **AdultHoHEntry**(the **Value** for **ReportRow**
911).

The **Value** for **ReportRow** 916 is a count of distinct
**EnrollmentIDs** in tlsa_Enrollment for **ProjectID**s in lsa_Project
where where **AIR** = 1 or (**LSAScope** \<\> 3 and **Active** = 1) and:

- **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and

- hmis_Enrollment**.***DateToStreetESSH* \> *EntryDate*; or

- hmis_Enrollment**.***DateToStreetESSH* is NULL; and

  - tlsa_Enrollment.**LSAProjectType** in (0,1,8); or

  - *LivingSituation* in (101,116,118); or

  - *PreviousStreetESSH* = 1.

## DQ – Times ES/SH/Street Homeless Last 3 Years

This is a subset of **AdultHoHEntry**(the **Value** for **ReportRow**
911).

The **Value** for **ReportRow** 917 is a count of distinct
**EnrollmentIDs** in tlsa_Enrollment for **ProjectID**s in lsa_Project
where where **AIR** = 1 or (**LSAScope** \<\> 3 and **Active** = 1) and:

- **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and

- hmis_Enrollment**.***TimesHomelessPastThreeYears* is NULL or not in
  (1,2,3,4); and

  - tlsa_Enrollment. **LSAProjectType** in (0,1,8); or

  - *LivingSituation* in (101,116,118); or

  - *PreviousStreetESSH* = 1.

## DQ – Months ES/SH/Street Homeless Last 3 Years

This is a subset of **AdultHoHEntry**(the **Value** for **ReportRow**
911).

The **Value** for **ReportRow** 918 is a count of distinct
**EnrollmentIDs** in tlsa_Enrollment for **ProjectID**s in lsa_Project
where where **AIR** = 1 or (**LSAScope** \<\> 3 and **Active** = 1) and:

- **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and

- hmis_Enrollment**.***MonthsHomelessPastThreeYears* is NULL or not
  between 101 and 113; and

  - tlsa_Enrollment.**LSAProjectType** in (0,1,8); or

  - *LivingSituation* in (101,116,118); or

  - *PreviousStreetESSH* = 1.

## DQ – Destination

This is a subset of **ClientExit** (the **Value** for **ReportRow**
912).

The **Value** for **ReportRow** 919 is a count of distinct
**EnrollmentIDs** in tlsa_Enrollment for **ProjectID**s in lsa_Project
where where **AIR** = 1 or (**LSAScope** \<\> 3 and **Active** = 1) = 1
and:

- **ExitDate** is not NULL; and

  - hmis_Exit.*Destination* is NULL or in (8,9,17,30,99) or

  - hmis_Exit.*Destination* = 435 and hmis_Exit.*DestinationSubsidyType*
    is NULL

## DQ – Date of Birth

The **Value** for **ReportRow** 920 is a count of distinct
**PersonalIDs** in tlsa_Enrollment for **ProjectID**s in lsa_Project
where where **AIR** = 1 or (**LSAScope** \<\> 3 and **Active** = 1) and
**ActiveAge** in (98,99).

## LSACalculated

LSACalculated has nine columns. Except for **ProjectID,** the datatype
for all columns is integer and none may be NULL.

**Value** for every record must be greater than zero; neither averages
nor counts are generated when there are no records that meet criteria
specific to the household type, population, cohort, etc.

The data type for the **ProjectID** column is an alphanumeric string of
no more than 32 characters.

- If **Universe** \<\> 10, **ProjectID** must be NULL.

- If **Universe** = 10, **ProjectID** may not be NULL.

| \#  | Column Name    |
|-----|----------------|
| 1   | **Value**      |
| 2   | **Cohort**     |
| 3   | **Universe**   |
| 4   | **HHType**     |
| 5   | **Population** |
| 6   | **SystemPath** |
| 7   | **ProjectID**  |
| 8   | **ReportRow**  |
| 9   | **ReportID**   |
