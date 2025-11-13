# HMIS Business Logic: LSAExit

This section is required only if **LSAScope** \<\> 3 (HIC).

Each distinct combination of **Cohort**, the *PersonalID* for the head
of household (**HoHID**), and household type (**HHType**) associated
with one or more qualifying exits in the cohort period represents a
single household/cohort member for LSAExit.

As with the active cohort, a household is identified based on each
unique combination of HoHID/HHType. Aside from the dates, there are no
differences in logic among the three exit cohorts.

## Identify Qualifying Exits in Exit Cohort Periods

The objective of this step is to identify records in tlsa_HHID that
represent system exits in each exit cohort period.

### Relevant Data

#### Source

| **tlsa_CohortDates** |
|----------------------|
| Cohort               |
| CohortStart          |
| CohortEnd            |
| **tlsa_HHID**        |
| EnrollmentID         |
| HoHID                |
| ProjectID            |
| EntryDate            |
| ExitDate             |
| ActiveHHType         |
| Exit1HHType          |
| Exit2HHType          |
| **lsa_Project**      |
| ProjectID            |

#### Target

A household may have multiple qualifying exits in a given cohort period.
When this is the case, reporting is based on the earliest qualifying
exit to a permanent destination or, if there is no exit to a permanent
destination, the earliest exit to any destination.

All qualifying exits are identified in tlsa_HHID in this step by setting
the **ExitCohort** value; reportable exits are selected for each unique
combination of HoHID, household type, and cohort in the next step based
on the values in the **ExitCohort** and **ExitDest** columns.

|                |
|----------------|
| **tlsa_HHID**  |
| **ExitCohort** |

### Logic

#### Qualifying Exits

A qualifying exit is an exit from a continuum ES, SH, TH, RRH, or PSH
project – limited in one of the three exit cohort periods followed by at
least 14 days when the household was not active in any continuum ES, SH,
TH, RRH, or PSH project.

Set tlsa_HHID.**ExitCohort** = tlsa_CohortDates.**Cohort** to identify a
qualifying exit (qx) where:

- qx.**ExitDate** between tlsa_CohortDates.**CohortStart** and
  **CohortEnd** where **Cohort** between -2 and 0

- There is no other record in tlsa_HHID where:

  - \[Other\].**HoHID** = qx.**HoHID**

  - Household type values match:

    - If ExitCohort = 0, ActiveHHType

    - If ExitCohort = -1, Exit1HHType

    - If ExitCohort = -2, Exit2HHType

  - \[Other\].**ExitDate** is NULL or \[Other\].**ExitDate** \>
    qx.**ExitDate**

  - \[Other\].**EntryDate** \< \[qx.**ExitDate** + 14 days\]

If lsa_Report.**LSAScope** = 2 (Project-Focused), exit cohorts are
limited to households served in the projects in lsa_Project –
qx.**ProjectID** in lsa_Project.**ProjectID.** This limitation does not
apply to a systemwide LSA (**LSAScope** = 1).

## Select Reportable Exits

LSAExit includes reporting on households with qualifying exits from a
continuum ES/SH/TH/RRH/PSH projects in each of the exit cohort periods.

For households – unique combinations of **HoHID** and relevant household
type – with more than one qualifying exit in a single cohort period,
only one qualifying exit is reportable. The logic associated with
identifying reportable exits is below.

### Relevant Data 

#### Source

| **tlsa_HHID**  |
|----------------|
| ExitCohort     |
| ExitDest       |
| HoHID          |
| HouseholdID    |
| ActiveHHType   |
| Exit1HHType    |
| Exit2HHType    |
| EnrollmentID   |
| LSAProjectType |
| EntryDate      |
| MoveInDate     |
| ExitDate       |
| ExitTo         |

#### Target

|  |  |
|----|----|
| **tlsa_Exit** | **Column Description** |
| **HoHID** | *PersonalID* for heads of active households; distinct combinations of **HoHID**, **HHType**, and **Cohort** serve as a primary key. |
| **HHType** | Household type |
| **QualifyingExitHHID** | From tlsa_HHID, the *HouseholdID* for household’s first exit to permanent housing in the cohort period, or – if the household does not have an exit to permanent housing – the first qualifying exit to any destination type. |
| LastInactive | The most recent date prior to the *EntryDate* for the qualifying exit on which the household had not been active in a continuum ES/SH/TH/RRH/PSH project for 7 or more days. |
| **Cohort** | Identifier for the cohort in which the exit occurs – from tlsa_HHID.**ExitCohort**. |
| Stat | The household status related to continuum engagement in the two years prior to the *EntryDate* for the qualifying exit. |
| **ExitFrom** | Identifies the project type from which household exited and, for RRH/PSH, distinguishes between exits after a permanent housing placement (*MoveInDate*) and exits without placement. |
| **ExitTo** | Identifies the exit destination for the qualifying exit (from tlsa_HHID **QXDestination**) |
| ReturnTime | For households with at least one enrollment in a continuum ES/SH/TH/RRH/PSH projects in the 15-720 days after the qualifying exit, the number of days between the qualifying exit date and the earliest subsequent *EntryDate*. |
| HHVet | Identifies whether or not the household includes a veteran. |
| HHChronic | Identifies whether or not the head of household or any adult household member is chronically homeless or has other specific patterns of long-term homelessness. |
| HHDisability | Identifies whether or not the head of household or any adult household member was identified as having a disabling condition on the enrollment associated with the qualifying exit. |
| HHFleeingDV | Identifies whether or not the head of household or any adult member was identified as fleeing domestic violence on the enrollment associated with the qualifying exit. |
| HoHRaceEthnicity | Identifies race and ethnicity for head of household. |
| HHAdultAge | The age groups of adult household members. The categories are mutually exclusive (a household can only fall into one group) and inclusive (every household with adults will fall into one group). |
| HHParent | Identifies whether or not any household member has RelationshiptoHoH = 2 (child of the HoH) on any active enrollment in the cohort period. |
| AC3Plus | Identifies AC households that include 3 or more children on any active enrollment in the cohort period. |
| SystemPath | The combinations of system use during the cohort period and in the continuous periods of service prior to the cohort period – i.e., the ‘path’ through the system. It is not dependent on the sequence of service. Categories are mutually exclusive. |
| **ReportID** | From lsa_Report |

### Logic

#### Exit Households

LSAExit reporting is based on a single record in tlsa_Exit for each
unique combination of:

- tlsa_HHID.**ExitCohort**; and

- tlsa_HHID.**HoHID** – the HoHID from tlsa_HHID for each household with
  a qualifying exit in the cohort period; and

- Household Type:

  - If ExitCohort = 0, ActiveHHType

  - If ExitCohort = -1, Exit1HHType

  - If ExitCohort = -2, Exit2HHType

#### QualifyingExitHHID

The **QualifyingExitHHID** for an exit household is the
tlsa_HHID.**HouseholdID** associated with:

- The earliest qualifying exit to a permanent destination / earliest
  **ExitDate** where **ExitDest** between 400 and 499; or

- If there is no qualifying exit to a permanent destination, the
  earliest exit to a temporary destination / earliest **ExitDate** where
  **ExitDest** between 100 and 399; or

- If there is no qualifying exit to an identified temporary destination,
  the earliest qualifying exit.

If there are two or more enrollments with the same exit date within a
given destination category:

- Select the one with the lowest **ExitDest** value; or

- If multiple enrollments have the same exit date and **ExitDest**
  value, select the one with the earliest entry date; or

- If multiple enrollments have the same exit date, **ExitDest** value,
  and entry date, select the one with the highest **EnrollmentID**.

#### ExitFrom

Crosswalk tlsa_HHID. **LSAProjectType** and tlsa_HHID **MoveInDate** for
the reportable exit to the appropriate **ExitFrom** value below.

| LSAProjectType | MoveInDate | ExitFrom Value | ExitFrom Category Description  |
|----------------|------------|----------------|--------------------------------|
| 0,1            | n/a        | 2              | ES                             |
| 2              | n/a        | 3              | TH                             |
| 8              | n/a        | 4              | SH                             |
| 13             | Not NULL   | 5              | RRH after move-in to PH        |
| 3              | Not NULL   | 6              | PSH after move-in to PH        |
| 13             | NULL       | 7              | RRH without placement in PH    |
| 3              | NULL       | 8              | PSH without placement in PH    |
| 15             | Not NULL   | 9              | RRH-SO after move-in to PH     |
| 15             | NULL       | 10             | RRH-SO without placement in PH |

## Set ReturnTime for Exit Cohort Households

### Relevant Data

#### Source

| **tlsa_HHID**      |
|--------------------|
| HoHID              |
| HouseholdID        |
| ExitCohort         |
| ActiveHHType       |
| Exit1HHType        |
| Exit2HHType        |
| EntryDate          |
| ExitDate           |
| **tlsa_Exit**      |
| HHType             |
| QualifyingExitHHID |

#### Target

|                |
|----------------|
| **tlsa_Exit**  |
| **ReturnTime** |

### Logic

#### Household Returns

A household is reported as a return if there is a later enrollment for
the household in tlsa_HHID after the qualifying exit (qx) where:

- \[Return\].**HoHID** = tlsa_Exit.**HoHID**

- \[Return\].**EntryDate** between \[qx.**ExitDate** + 15 days\] and
  \[qx.**ExitDate** + 730 days\]

- The household type matches tlsa_Exit.**HHType** for the
  tlsa_Exit.**Cohort**:

  - If Cohort = 0, ActiveHHType

  - If Cohort = -1, Exit1HHType

  - If Cohort = -2, Exit2HHType

#### ReturnTime

If there is no later enrollment that meets the criteria for a household
return, set **ReturnTime** = -1.

Otherwise, **ReturnTime** is the number of days between

1.  The ExitDate for the QualifyingExitHHID and

2.  The **EntryDate** for the earliest return enrollment.

The value should be set in tlsa_Exit to the actual number of days to
return and NOT the associated upload value; the actual number of days
are needed to generate averages for LSACalculated.

**Note**: Both LSAHousehold/tlsa_Household and LSAExit/tlsa_Exit have
columns named **Stat** and **ReturnTime**.

For both, **Stat** is determined based on a household’s system use
**prior to** active enrollments (tlsa_Household) or a qualifying exit
(tlsa_Exit).

The logic associated with **ReturnTime** is different, however:

- In tlsa_Household, **ReturnTime** is associated with **Stat** and
  specifies the length of time between enrollment activity *prior to
  active enrollments* and the earliest active enrollment.

- In tlsa_Exit, **ReturnTime** is not associated with **Stat** – it
  specifies the length of time *after the qualifying exit***.**

## <img src="media/image3.png" style="width:4.05139in;height:1.84375in" />Identify HoH and Adult Members of Exit Cohorts

### Relevant Data

#### Source

| **tlsa_CohortDates** |
|----------------------|
| Cohort               |
| CohortEnd            |
| **tlsa_Exit**        |
| QualifyingExitHHID   |
| Cohort               |
| **tlsa_HHID**        |
| HouseholdID          |
| EntryDate            |
| MoveInDate           |
| ExitDate             |
| **tlsa_Enrollment**  |
| HouseholdID          |
| PersonalID           |
| RelationshipToHoH    |
| ExitDate             |
| ActiveAge            |
| Exit1Age             |
| Exit2Age             |

| **hmis_Enrollment**          |
|------------------------------|
| EntryDate                    |
| TimesHomelessPastThreeYears  |
| MonthsHomelessPastThreeYears |

#### Target

See section [5.3 Get Active Clients for
LSAPerson](#get-active-clients-for-lsaperson) for column descriptions.

| **tlsa_ExitHoHAdult**  |
|------------------------|
| **PersonalID**         |
| **QualifyingExitHHID** |
| **Cohort**             |
| **DisabilityStatus**   |
| **CHStart**            |
| **LastActive**         |
| **CHTime**             |
| **CHTimeStatus**       |

### Logic

The three-year timeframe for each head of household/adult – the CH date
range – is identified in tlsa_ExitHoHAdult with dates in the **CHStart**
and **LastActive** columns. People included in more than one cohort will
have different CH dates for each cohort.

#### Record Selection

An exit cohort household is only considered chronically homeless if they
meet the definition in the year ending on the head of household’s exit
date. As such, any household exiting from TH after a stay of at least a
year or housed in RRH or PSH for a year prior to exit is excluded from
this process.

For each **QualifyingExitHHID** in tlsa_Exit, select **PersonalID**s
from tlsa_Enrollment where:

- tlsa_Exit.**ExitFrom** \<\> 3 or tlsa_HHID.**EntryDate** \>
  \[tlsa_HHID.**ExitDate** – 1 year\]; and

- tlsa_Exit.**ExitFrom** not in (5,6) or tlsa_HHID.**MoveInDate** \>
  \[tlsa_HHID.**ExitDate** – 1 year\]; and

- tlsa_Enrollment.HouseholdID = QualifyingExitHHID; and

- tlsa_Enrollment.**ExitDate** \>= **CohortStart**; and

  - tlsa_Enrollment.**RelationshipToHoH** = 1; or

  - **Cohort** = 0 and **ActiveAge** between 21 and 65; or

  - **Cohort** = -1 and **Exit1Age** between 21 and 65; or

  - **Cohort** = -2 and **Exit2Age** between 21 and 65.

#### DisabilityStatus

Set to 1 if the value is 1 for any **EnrollmentID** associated with the
**QualifyingExitHHID** that meets the selection criteria.

Set to 0 if the value is 0 for any **EnrollmentID** associated with the
**QualifyingExitHHID** that meets the selection criteria and there is no
record for the given PersonalID that meets the criteria above.

Otherwise, set to 99.

#### LastActive

**LastActive** is the **ExitDate** from tlsa_Enrollment where
**HouseholdID** = tlsa_Exit.**QualifyingExitHHID**.

In systems where a household member may have more than one
*EnrollmentID* for a given *HouseholdID*, **LastActive** should be set
to the most recent tlsa_Enrollment.**ExitDate** associated with the
**QualifyingExitHHID** that meets the selection criteria.

#### CHStart

**CHStart** is (**LastActive** – 3 years) + 1 day.

#### CHTime and CHTimeStatus

The process of setting **CHTime** and **CHTimeStatus** is described in
sections 7.5 through 7.8. It is similar to the process used to set the
column values in tlsa_Person (sections 5.5-5.10). At the person level,
there are three combinations of values (shown below) in these columns
that – in combination with **DisabilityStatus** = 1 – indicate that the
person meets the criteria for chronic homelessness, and any households
of which they are a member are included in the Chronically Homeless
Households population.

| CHTime | CHTimeStatus | Category |
|:--:|:--:|----|
| 365 | 1 | Client has a ch_Episode_exit where **episodeDays** \>= 365 with an **episodeEnd** in the year ending on **LastActive** |
| 365 | 2 | Client has 4 or more episodes and the sum of **episodeDays** for all ch_Episodes_exit is \>= 365. |
| 400 | 2 | Based on 3.917 Living Situation for an enrollment with an **EntryDate** in the year ending on **LastActive**, client was on the street or in ES/SH for 12 or more months and in four or more episodes in three years. |

There is no person-level reporting for the exit cohorts, however. The
end result of any of these three, in combination with
**DisabilityStatus** = 1, is that tlsa_Exit.**HHChronic** = 1. As long
as any adult or head of household associated with the
**QualifyingExitHHID** is going to result in **HHChronic** = 1, there is
no need to go through the processes described in steps 7.5-7.8 for the
associated records in tlsa_ExitHoHAdult. As such, we can set **CHTime**
= 400 and **CHTimeStatus** = 2 directly in tlsa_ExitHoHAdult for all
members of the household where the head of household or an adult with an
exit date in the cohort period has:

- hmis_Enrollment.*MonthsHomelessPastThreeYears* in (112,113); and

- hmis_Enrollment.TimesHomelessPastThreeYears = 4; and

- hmis_Enrollment.*EntryDate* = tlsa_Enrollment.**EntryDate**[^2]

- hmis_Enrollment.*EntryDate* \> \[**LastActive** – 1 year\]

In systems where a household member may have more than one
*EnrollmentID* for a given *HouseholdID*, these values may be set based
on any enrollment associated with the **QualifyingExitHHID** that meets
the selection criteria.

It is not necessary to include these tlsa_ExitHoHAdult records in the
subsequent steps 7.5-7.8.

## Get Dates to Exclude from Counts of ES/SH/Street Days (ch_Exclude_exit)

### Relevant Data

#### Source

| **tlsa_ExitHoHAdult** |
|-----------------------|
| PersonalID            |
| CHStart               |
| LastActive            |
| CHTime                |
| **tlsa_Enrollment**   |
| PersonalID            |
| LSAProjectType        |
| EntryDate             |
| MoveInDate            |
| ExitDate              |

#### Target

| **ch_Exclude_exit** | **Column Description** |
|----|----|
| **PersonalID** | **PersonalD** |
| **ExcludeDate** | Distinct dates between a person’s earliest **CHStart** and latest **LastActive** when client was either in TH or housed in RRH/PSH. |

### Logic

For each **PersonalID** in tlsa_ExitAdultHoH where **CHTime** and
**CHTimeStatus** were not set in step 7.4 (i.e., where **CHTime** is
NULL), dates enrolled in TH or housed in RRH/PSH are inserted to
ch_Exclude_exit based on tlsa_Enrollment where:

- **ExitDate** \> the earliest **CHStart**; and

- \[Date\] \< tlsa_Enrollment.**ExitDate; and**

- \[Date\] between earliest **CHStart** and latest **LastActive;** and

  - LSAProjectType = 2; and

  - \[Date\] \>= tlsa_Enrollment.**EntryDate**

> OR

- **LSAProjectType** in (3,13); and

- \[Date\] \>= tlsa_Enrollment.**MoveInDate**

## Get Dates to Include in Counts of ES/SH/Street Days (ch_Include_exit)

### Relevant Data

#### Source

| **tlsa_ExitHoHAdult**                                    |
|----------------------------------------------------------|
| PersonalID                                               |
| CHStart                                                  |
| LastActive                                               |
| CHTime                                                   |
| **tlsa_Enrollment**                                      |
| PersonalID                                               |
| EnrollmentID                                             |
| LSAProjectType                                           |
| EntryDate                                                |
| MoveInDate                                               |
| ExitDate                                                 |
| **hmis_Enrollment**                                      |
| EnrollmentID                                             |
| LivingSituation                                          |
| LengthOfStay                                             |
| PreviousStreetESSH                                       |
| DateToStreetESSH                                         |
| **hmis_Services**                                        |
| EnrollmentID                                             |
| *BedNightDate* (*DateProvided* where *RecordType* = 200) |

#### Target

| **ch_Include_exit** | **Column Description** |
|----|----|
| **PersonalID** | **PersonalD** |
| **ESSHStreetDate** | Distinct dates between earliest **CHStart** and latest **LastActive** when client was in ES/SH or on the street; also referred to as ES/SH/Street dates. |

### Logic

For each **PersonalID** in tlsa_ExitHoHAdult where **CHTime** and
**CHTimeStatus** were not set in step 7.4 (i.e., where **CHTime** is
NULL), any date between the earliest **CHStart** and latest
**LastActive** may be counted as an **ESSHStreetDate** based on HMIS
data if:

- The date is not excluded because the client was enrolled in a TH
  project or enrolled and housed in an RRH/PSH project
  (ch_Exclude_exit.**ExcludeDate**); and

- The date is consistent with any set of criteria listed below based on
  tlsa_Enrollments where **ExitDate** \> than the earliest **CHStart**
  and **EntryDate** \<= the latest **LastActive**.

#### Enrollment in Entry/Exit ES or SH

- **LSAProjectType** in (0,8); and

- **ESSHStreetDate** \>= (later of **EntryDate** and earliest
  **CHStart**)*;* and

- ESSHStreetDate \< ExitDate

#### Bed Nights in Night-by-Night ES 

- LSAProjectType = 1; and

- **ESSHStreetDate** = *BedNightDate*

- *BedNightDate* \>= LookbackDate

- *BedNightDate* \>= **EntryDate** for the associated enrollment

- *BedNightDate* \< tlsa_Enrollment.**ExitDate**

#### ES/SH/Street Dates from 3.917 Living Situation

For enrollments where **EntryDate** \> earliest **CHStart**, dates on
which the client was on the street on in ES/SH based on 3.917 are
included as **ESSHStreetDate**s if they have not already been excluded
or included based on prior criteria and fall between the earliest
**CHStart** and latest **LastActive**.

- An **ESSHStreetDate** is counted for ES and SH projects
  (**LSAProjectType** in (0,1,8)) if:

<!-- -->

- *LivingSituation* in (101,118,116); and

- **ESSHStreetDate** \>= *DateToStreetESSH* and \< **EntryDate.**

<!-- -->

- For TH, PSH, and RRH projects (**LSAProjectType** in (2,3,13,15)),
  **ESSHStreetDate**s based on 3.917 are only counted if the client was
  in ES/SH or on the street prior to entry:

<!-- -->

- *LivingSituation* in (101,118,116); or

- LengthOfStay in (10, 11) and PreviousStreetESSH = 1; or

- *LivingSituation* in (204,205,206,207,215,225) and *LengthOfStay* in
  (2,3) and *PreviousStreetESSH* = 1

<!-- -->

- And **ESSHStreetDate** \>= *DateToStreetESSH*; and

  - LSAProjectType = 2 and ESSHStreetDate \< EntryDate; or

  - **LSAProjectType** in (3,13,15) and

    - ESSHStreetDate \< MoveInDate; or

    - MoveInDate is NULL and ESSHStreetDate \< ExitDate

#### Gaps of Less than Seven Days Between Two ES/SH/Street Dates

Any date that falls between two ES/SH/Street dates that have been
identified using the criteria above and are less than 7 days apart is
counted as a ES/SH/Street day.

- \[Date\] \> \[**ESSHStreetDate***1*\]*;* and

- \[Date\] \< \[**ESSHStreetDate***2*\]; and

- (\[ESSHStreetDate*1*\] + 7 days) \>= \[ESSHStreetDate*2*\]

For example, if a client has *BedNightDate*s on June 1 and June 5 of the
same year, the 3 dates between – June 2, 3, and 4 – are also counted as
ES/SH/Street dates.

Note that gaps of less than 7 days between **ESSHStreetDate**s are
counted as ES/SH/Street dates regardless of ch_Exclude_exit dates.

## Get ES/SH/Street Episodes (ch_Episodes_exit)

### Relevant Data

#### Source

| **ch_Include_exit** |
|---------------------|
| PersonalID          |
| ESSHStreetDate      |

#### Target

| ch_Episodes_exit | Column Description                         |
|------------------|--------------------------------------------|
| PersonalID       | tlsa_Person                                |
| episodeStart     | The first ES/SH/Street date in the series. |
| episodeEnd       | The last ES/SH/Street date in the series.  |

### Logic

For purposes of the LSA, an ‘episode’ is a continuous – i.e.,
uninterrupted by any period of seven or more contiguous days — series of
ES/SH/Street dates.

Each record in ch_Episodes_exit represents an uninterrupted series of
ES/SH/Street dates identified in the previous step. Based on
ch_Include_exit for each HoH/adult in tlsa_Person:

- **episodeStart** is any **ESSHStreetDate** where there is no
  (**ESSHStreetDate** – 1 day) for the same *PersonalID* – i.e., any
  ES/SH/Street date where there is no information to indicate that the
  client was in ES/SH or on the street on the day before.

<!-- -->

- **episodeEnd** is the first **ESSHStreetDate** after **episodeStart**
  where (**ESSHStreetDate** + 1 day) does not exist

## CHTime and CHTimeStatus for Exit Cohorts

### Relevant Data

#### Source

| **ch_Episodes_exit**         |
|------------------------------|
| PersonalID                   |
| episodeStart                 |
| episodeEnd                   |
| episodeDays                  |
| **tlsa_Enrollment**          |
| EnrollmentID                 |
| EntryDate                    |
| ExitDate                     |
| PersonalID                   |
| LSAProjectType               |
| **hmis_Enrollment**          |
| PersonalID                   |
| EntryDate                    |
| LivingSituation              |
| LengthOfStay                 |
| DateToStreetESSH             |
| TimesHomelessPastThreeYears  |
| MonthsHomelessPastThreeYears |

#### Target

| tlsa_ExitHoHAdult |
|-------------------|
| CHTime            |
| CHTimeStatus      |

### Logic

There are a total of nine valid combinations of **CHTime** and
**CHTimeStatus** values in tlsa_ExitHoHAdult. They are summarized in the
table below.

| Priority | CHTime | CHTimeStatus | Category |
|:--:|:--:|:--:|----|
| 1 | 400 | 2 | (see Section 7.4 |
| 2 | 365 | 1 | Client has a ch_Episode where **episodeDays** \>= 365 with an **episodeEnd** in the year ending on **LastActive** |
| 3 | 365 | 2 | Client has 4 or more episodes and the sum of **episodeDays** for all ch_Episodes is \>= 365. |
| 4 | 365 | 3 | The sum of **episodeDays** for all ch_Episodes is \>= 365 but the number of episodes is less than four; no relevant information is missing from records of *3.917 Living Situation*. |
| 4 | 365 | 99 | The sum of **episodeDays** for all ch_Episodes is \>= 365 but the number of episodes is less than four; relevant information is missing from records of *3.917 Living Situation.* |
| -- | 270 | 99 | Client has a total of 270-364 ESSHStreet days and relevant data is missing from *3.917 Living Situation* |
| -- | 270 | -1 | Client has a total of 270-364 ESSHStreet days and is not missing any relevant *3.917 Living Situation* data |
| -- | 0 | 99 | Client has a total of 0-269 ESSHStreet days and relevant data is missing from *3.917 Living Situation* |
| -- | 0 | -1 | Client has a total of 270-364 ESSHStreet days and is not missing any relevant *3.917 Living Situation* data |

The conditions associated with valid combinations of **CHTime** and
**CHTimeStatus** are not all mutually exclusive. **CHTime** and
**CHTimeStatus** should be set for the first set of criteria met by
records for each person.

1.  Set **CHTime** = 365 and **CHTimeStatus** = 1 when there is a single
    episode where:

- ch_Episodes_exit.**episodeDays** \>= 365; and

- ch_Episodes_exit.**episodeEnd** \> (**LastActive** – 1 year)

2.  Set **CHTime** = 365 and **CHTimeStatus** = 2 where:

- \[SUM of ch_Episodes_exit.**episodeDays**\] \>= 365; and

- \[COUNT of ch_Episodes_exit\] \>= 4

3.  Set **CHTime** = 365 and **CHTimeStatus** = 3 where:

- \[SUM of ch_Episodes_exit.**episodeDays**\] \>= 365; and

- \[COUNT of ch_Episodes_exit\] \< 4

4.  Set **CHTime = 270** and **CHTimeStatus** = -1 where \[SUM of
    ch_Episodes_exit.**episodeDays**\] between 270 and 364

5.  Set **CHTime = 0** and **CHTimeStatus** = -1 where \[SUM of
    ch_Episodes_exit.**episodeDays**\] \< 270

After these values are set, there is one additional update to
**CHTimeStatus** to identify people who do not meet the time criteria
for chronic homelessness and are missing relevant data (i.e., people who
might meet the time criteria if data were complete). Set
**CHTimeStatus** = 99 for all records in tlsa_ExitHoHAdult where:

- **CHTime** in (0,270) – The total number of **ESSHStreetDate**s in the
  three years ending on **LastActive** is less than 365; or

- **CHTimeStatus** = 3 – The total number of **ESSHStreetDate**s in the
  three years ending on **LastActive** is at least 365, but they occur
  in fewer than four episodes;

- AND there is at least one enrollment for the **PersonalID** in
  tlsa_Enrollment where the exit date falls between the relevant cohort
  start and end dates and any of the following are true:

<table>
<colgroup>
<col style="width: 34%" />
<col style="width: 10%" />
<col style="width: 54%" />
</colgroup>
<tbody>
<tr>
<td colspan="3"><em>DateToStreetESSH</em> &gt;
<strong>EntryDate</strong></td>
</tr>
<tr>
<td colspan="3"><em>LivingSituation</em> in (8,9,99) or is NULL</td>
</tr>
<tr>
<td colspan="3"><em>LengthOfStay</em> in (8,9,99) or is NULL</td>
</tr>
<tr>
<td><em>LivingSituation</em> in (101,116,118)</td>
<td><blockquote>
<p><strong>AND</strong></p>
</blockquote></td>
<td><p><em>DateToStreetESSH</em> is NULL; or</p>
<p><em>TimesHomelessPastThreeYears</em> in (8,9,99); or</p>
<p><em>TimesHomelessPastThreeYears</em> is NULL; or</p>
<p><em>MonthsHomelessPastThreeYears</em> in (8,9,99); or</p>
<p><em>MonthsHomelessPastThreeYears</em> is NULL</p></td>
</tr>
<tr>
<td><em>LivingSituation</em> in (101,116,118)</td>
<td><blockquote>
<p><strong>AND</strong></p>
</blockquote></td>
<td><p><em>DateToStreetESSH</em> is NULL; or</p>
<p><em>TimesHomelessPastThreeYears</em> in (8,9,99); or</p>
<p><em>TimesHomelessPastThreeYears</em> is NULL; or</p>
<p><em>MonthsHomelessPastThreeYears</em> in (8,9,99); or</p>
<p><em>MonthsHomelessPastThreeYears</em> is NULL</p></td>
</tr>
<tr>
<td><p><strong>LSAProjectType</strong> is not in (0,1,8) and</p>
<p><em>LengthOfStay</em> in (2,3) and</p>
<p><em>LivingSituation</em> in (204,205,206,207,215,225)</p></td>
<td><blockquote>
<p><strong>AND</strong></p>
</blockquote></td>
<td><p><em>PreviousStreetESSH</em> is NULL; or</p>
<p><em>PreviousStreetESSH</em> not in (0,1); or</p>
<p><em>PreviousStreetESSH</em> = 1 and <em>DateToStreetESSH</em> is
NULL; or</p>
<p><em>TimesHomelessPastThreeYears</em> in (8,9,99); or</p>
<p><em>TimesHomelessPastThreeYears</em> is NULL; or</p>
<p><em>MonthsHomelessPastThreeYears</em> in (8,9,99); or</p>
<p><em>MonthsHomelessPastThreeYears</em> is NULL</p></td>
</tr>
<tr>
<td><p><strong>LSAProjectType</strong> is not in (0,1,8) and</p>
<p><em>LengthOfStay</em> in (10,11)</p></td>
<td><blockquote>
<p><strong>AND</strong></p>
</blockquote></td>
<td><p><em>PreviousStreetESSH</em> is NULL; or</p>
<p><em>PreviousStreetESSH</em> not in (0,1); or</p>
<p><em>PreviousStreetESSH</em> = 1 and <em>DateToStreetESSH</em> is
NULL; or</p>
<p><em>TimesHomelessPastThreeYears</em> in (8,9,99); or</p>
<p><em>TimesHomelessPastThreeYears</em> is NULL; or</p>
<p><em>MonthsHomelessPastThreeYears</em> in (8,9,99); or</p>
<p><em>MonthsHomelessPastThreeYears</em> is NULL</p></td>
</tr>
</tbody>
</table>

## Set Population Identifiers for Exit Cohort Households

<img src="media/image4.png" style="width:3.57222in;height:1.85417in" />

As with the active cohort, population identifiers for exit cohort
households are based on the characteristics of the head of household and
any adult household members.

The underlying logic is generally the same as that for the active
cohort, but only data from the enrollment associated with the
*HouseholdID* of the qualifying exit is used (as opposed to all
enrollments active in the report period).

### Relevant Data

#### Source

| **tlsa_Exit**         |
|-----------------------|
| Cohort                |
| HoHID                 |
| HHType                |
| QualifyingExitHHID    |
| **tlsa_HHID**         |
| HouseholdID           |
| ExitCohort            |
| **tlsa_ExitHoHAdult** |
| Cohort                |
| QualifyingExitHHID    |
| CHTime                |
| CHTimeStatus          |
| **tlsa_Enrollment**   |
| EnrollmentID          |
| PersonalID            |
| HouseholdID           |
| EntryDate             |
| RelationshipToHoH     |
| DisabilityStatus      |
| DVStatus              |
| ActiveAge             |
| Exit1Age              |
| Exit2Age              |
| **hmis_Client**       |
| PersonalID            |
| AmIndAKNative         |
| Asian                 |
| BlackAfAmerican       |
| HispanicLatinao       |
| MidEastNAfrican       |
| NativeHIPacific       |
| White                 |
| RaceNone              |
| VeteranStatus         |

#### Target

|               |
|---------------|
| **tlsa_Exit** |

| HouseholdID          |
|----------------------|
| **HHVet**            |
| **HHChronic**        |
| **HHDisability**     |
| **HHFleeingDV**      |
| **HHAdultAge**       |
| **HHParent**         |
| **AC3Plus**          |
| **HoHRaceEthnicity** |

### Logic

#### HHVet

Set **HHVet** = 1 if any adult household member with **ExitDate** \>=
**CohortStart** has a *VeteranStatus* of 1. Otherwise, **HHVet** = 0.

#### HHChronic

Based on records in tlsa_ExitHoHAdult with the same
**QualifyingExitHHID**, set **HHChronic** to the first value in the
table below for which any adult or HoH meets the criteria:

<table style="width:97%;">
<colgroup>
<col style="width: 7%" />
<col style="width: 49%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr>
<th>Value</th>
<th>Criteria</th>
<th>Category</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>1</strong></td>
<td><p><strong>DisabilityStatus</strong> = 1 and:</p>
<ul>
<li><p><strong>CHTime</strong> = 365 and <strong>CHTimeStatus</strong>
in (1,2); or</p></li>
<li><p>CHTime = 400 and CHTimeStatus = 2</p></li>
</ul></td>
<td>Chronically Homeless</td>
</tr>
<tr>
<td><strong>2</strong></td>
<td><strong>CHTime</strong> in (365, 400) and
<strong>DisabilityStatus</strong> = 1</td>
<td>Long-Term Homeless with Disability</td>
</tr>
<tr>
<td><strong>3</strong></td>
<td><strong>CHTime</strong> in (365, 400) and
<strong>DisabilityStatus</strong> = 99</td>
<td>Long-Term Homeless Missing Disability Info</td>
</tr>
<tr>
<td><strong>4</strong></td>
<td><strong>CHTime</strong> in (365, 400) and
<strong>DisabilityStatus</strong> = 0</td>
<td>Long-Term Homeless without Disability</td>
</tr>
<tr>
<td><strong>5</strong></td>
<td><strong>CHTime</strong> = 270 and <strong>CHTimeStatus</strong> = 99
and <strong>DisabilityStatus</strong> = 1</td>
<td>Homeless &gt; 6 Months with Disability (missing data)</td>
</tr>
<tr>
<td><strong>6</strong></td>
<td><strong>CHTime</strong> = 270 and <strong>CHTimeStatus</strong>
&lt;&gt; 99 and <strong>DisabilityStatus</strong> = 1</td>
<td>Homeless &gt; 6 Months with Disability (no missing data)</td>
</tr>
<tr>
<td><strong>9</strong></td>
<td><strong>DisabilityStatus</strong> &lt;&gt; 0 and
<strong>CHTimeStatus</strong> = 99</td>
<td>CH Status Unknown (missing data)</td>
</tr>
<tr>
<td><strong>0</strong></td>
<td>(any other)</td>
<td>Not Chronically Homeless</td>
</tr>
</tbody>
</table>

#### HHDisability

Set **HHDisability**= 1 if the HoH or any adult household member with
**ExitDate** \>= **CohortStart** has a **DisabilityStatus** = 1 for the
enrollment associated with the qualifying exit. Otherwise,
**HHDisability**= 0.

#### HHFleeingDV

Set **HHFleeingDV** based on tlsa_Enrollment for the HoH or any adult
household member with **ExitDate** \>= **CohortStart** where
**HouseholdID** = **QualifyingExitHHID**:

In priority order:

**HHFleeingDV** = 1 (Households Fleeing Domestic Violence) if the head
of household or any adult in the household has **DVStatus** = 1.

**HHFleeingDV** = 2 (Domestic Violence Survivors Not Currently Fleeing)
if the head of household or any adult in the household has **DVStatus**
= 2.

**HHFleeingDV** = 3 (Domestic Violence Survivors, Unknown if Currently
Fleeing) if the head of household or any adult in the household has
**DVStatus** = 3.

| tlsa_Enrollment.DVStatus | LSA Category | tlsa_Exit.HHFleeingDV |
|----|----|----|
| 1 | DV survivor, currently fleeing | 1 |
| 2 | DV survivor, not currently fleeing | 2 |
| 3 | DV survivor, unknown if currently fleeing | 3 |

Otherwise, **HHFleeingDV** = 0.

#### HoHRaceEthnicity

Set **HoHRaceEthnicity** using the same methodology defined in section
5.4.

#### HHAdultAge

Set **HHAdultAge** based on the household type and ages of all household
members with **ExitDate** \>= **CohortStart.**

- Cohort = 0 – ActiveAge

- Cohort = -1 – Exit1Age

- Cohort = -2 – Exit2Age

Use the first / topmost of the criteria below appropriate to the
household:

| Upload Value | Criteria |
|----|----|
| -1 | **HHType** not in (1,2) |
| -1 | The maximum of all ages is \>= 98 (one or more unknown ages) |
| 18 | The maximum of all ages is 21 (all adults are between 18 and 21) |
| 24 | The maximum of all ages is 24 (all adults are under 25) |
| 55 | The minimum of all ages is between 55 and 65 (all members are 55+) |
| 25 | (all other households) |

#### HHParent

Set **HHParent** = 1 if at least one household member with **ExitDate**
\>= **CohortStart** has a *RelationshipToHoH* = 2 (Child of HoH).

#### AC3Plus

Set **AC3Plus** = 1 if **HHType** = 2 (AC) and there are three or more
household members with **ExitDate** \>= **CohortStart** under the age of
18. Otherwise, **AC3Plus** = 0.

## Set System Engagement Status for Exit Cohort Households

System engagement status specifies whether or not active households were
actively engaged with continuum ES, SH, TH, RRH, and/or PSH projects in
the two years prior to their earliest active date in the report period
in the following categories:

| Value | Stat |
|----|----|
| 1 | First-time homeless |
| 2 | Return to continuum 15-730 days after exit to permanent destination |
| 3 | Re-engage with continuum 15-730 days after exit to temporary destination |
| 4 | Re-engage with continuum 15-730 days after exit to unknown destination |
| 5 | Continuous engagement with continuum |

### Relevant Data

#### Source

| **tlsa_Exit**      |
|--------------------|
| Cohort             |
| HoHID              |
| HHType             |
| QualifyingExitHHID |
| **tlsa_HHID**      |
| HoHID              |
| HouseholdID        |
| ActiveHHType       |
| Exit1HHType        |
| Exit2HHType        |
| EntryDate          |
| ExitDate           |
| ExitDest           |

#### Target

|               |
|---------------|
| **tlsa_Exit** |
| **Stat**      |

### Logic

#### Previous Activity 

System engagement status is based on the EntryDate for the qualifying
exit (qx) and, if it exists, the tlsa_HHID record with the most recent
(effective) **ExitDate** prior to the **ExitDate** for the qualifying
exit (qx)where:

- \[Previous\].**HoHID** = tlsa_Exit.**HoHID**

- \[Previous\].EntryDate \< qx.EntryDate

- \[Previous\]**.ExitDate** between \[qx.**EntryDate** – 730 days\] and
  \[qx.**ExitDate**\]

- The household type matches tlsa_Exit.**HHType** for the
  tlsa_Exit.**Cohort**:

  - If Cohort = 0, ActiveHHType

  - If Cohort = -1, Exit1HHType

  - If Cohort = -2, Exit2HHType

If there are two or more enrollments with the same (most recent) exit
date:

- Select the one with the lowest **ExitDest** value; or

- If multiple enrollments have the same exit date and **ExitDest**
  value, select the one with the most recent entry date; or

- If multiple enrollments have the same exit date, **ExitDest** value,
  and entry date, select the one with the highest **EnrollmentID**.

#### Stat

If the household had no previous activity consistent with the criteria
above, or if the household had previous activity in the 14 days prior to
the **EntryDate** for the reportable exit, **Stat** is set regardless of
the exit destination for the previous activity.

Otherwise – if the household has an exit 15-730 days prior to the
enrollment for the reportable exit – **Stat** is determined by the exit
destination for the previous enrollment.

| Priority | Stat | Category | Other Condition |
|----|----|----|----|
| 1 | 1 | First-time homeless | (There is no tlsa_HHID record that meets the criteria for previous activity.) |
| 1 | 5 | Continuous engagement with continuum | \[Previous\].**ExitDate** \> \[qx.**EntryDate** – 15 days\] |
| 2 | 2 | Return 15-730 days after exit to permanent destination | \[Previous\].**ExitDest** between 400 and 499 |
| 2 | 3 | Re-engage 15-730 days after exit to temporary destination | \[Previous\].**ExitDest** between 100 and 399 |
| 2 | 4 | Re-engage 15-730 days after exit to unknown destination | (any other) |

## Last Inactive Date for Exit Cohorts

### RelevantData

| **tlsa_Exit**                                            |
|----------------------------------------------------------|
| Cohort                                                   |
| HoHID                                                    |
| HHType                                                   |
| QualifyingExitHHID                                       |
| **tlsa_HHID**                                            |
| HoHID                                                    |
| ActiveHHType                                             |
| Exit1HHType                                              |
| Exit2HHType                                              |
| EntryDate                                                |
| ExitDate                                                 |
| LSAProjectType                                           |
| **hmis_Services**                                        |
| EnrollmentID                                             |
| *BedNightDate* (*DateProvided* where *RecordType* = 200) |

#### Targets

<table>
<colgroup>
<col style="width: 21%" />
<col style="width: 78%" />
</colgroup>
<thead>
<tr>
<th><strong>sys_TimePadded_exit</strong></th>
<th><strong>Column Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Cohort</strong></td>
<td>From tlsa_Exit</td>
</tr>
<tr>
<td><blockquote>
<p><strong>HoHID</strong></p>
</blockquote></td>
<td>From tlsa_Exit</td>
</tr>
<tr>
<td><blockquote>
<p><strong>HHType</strong></p>
</blockquote></td>
<td>From tlsa_Exit</td>
</tr>
<tr>
<td><blockquote>
<p><strong>StartDate</strong></p>
</blockquote></td>
<td><ul>
<li><p>For tlsa_HHID <strong>EnrollmentID</strong>s in night-by-night
ES, each <em>BedNightDate</em> associated with the enrollment between
LookbackDate and <strong>CohortEnd</strong></p></li>
<li><p>For all other tlsa_HHID enrollments, the
<strong>EntryDate</strong></p></li>
</ul></td>
</tr>
<tr>
<td><blockquote>
<p><strong>EndDate</strong></p>
</blockquote></td>
<td><ul>
<li><p>For tlsa_HHID <strong>EnrollmentID</strong>s in night-by-night
ES, the earlier of [<strong>StartDate</strong> + 6 days] or
<strong>CohortEnd</strong></p></li>
<li><p>For all other tlsa_HHID enrollments, the earlier non-NULL of
[<strong>ExitDate</strong> + 6 days] or
<strong>CohortEnd</strong></p></li>
</ul></td>
</tr>
</tbody>
</table>

<table style="width:100%;">
<colgroup>
<col style="width: 99%" />
</colgroup>
<thead>
<tr>
<th><strong>tlsa_Exit</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p><strong>LastInactive</strong></p>
</blockquote></td>
</tr>
</tbody>
</table>

### Logic

This step identifies, based on the qualifying exit and potentially
relevant inactive enrollments from the previous step, the date
immediately prior to the first day of continuous system engagement for
exit cohort households – or the household’s last inactive date prior to
the qualifying exit.

Specifically, this is the latest date in the most recent period of at
least seven nights during which a household was not enrolled in a
continuum ES, SH, TH, RRH, or PSH project. Enrollments in tlsa_HHID that
occurred between the last inactive date and the **EntryDate** for the
reportable exit are part of the household’s **SystemPath** if they have
the same **HoHID** and there is a match for household type:

- If tlsa_Exit.**Cohort** = 0, **ActiveHHType**

- If tlsa_Exit.**Cohort** = -1, **Exit1HHType**

- If tlsa_Exit.**Cohort** = -2, **Exit2HHType**

**LastInactive** is the later of \[<u>LookbackDate</u> – 1 day\] and the
most recent date where:

- \[Date\] \< tlsa_Exit.**EntryDate**

- \[Date\] is not between a *BedNightDate* and (*BedNightDate* + 6
  days); and

- \[Date\] is not between a tlsa_HHID.**EntryDate** and the associated
  (**ExitDate** + 6 days) for project types other than ES nbn.

## Set SystemPath for LSAExit

### Relevant Data

#### Source

| **tlsa_Exit**      |
|--------------------|
| HoHID              |
| HHType             |
| Cohort             |
| LastInactive       |
| QualifyingExitHHID |
| **tlsa_HHID**      |
| HoHID              |
| ActiveHHType       |
| Exit1HHType        |
| Exit2HHType        |
| EntryDate          |
| ExitDate           |
| LSAProjectType     |
| HouseholdID        |
| MoveInDate         |

#### Target

| **tlsa_Exit**  |
|----------------|
| **SystemPath** |

### Logic

**SystemPath** is not relevant for households who were housed in PSH as
of **CohortStart** or for households who had been housed in RRH or PSH
for at least 365 days as of the date of the qualifying exit.

Set **SystemPath** = -1 for:

- Any record in tlsa_Exit where **ExitFrom** = 6 (PSH after move-in to
  PH) and tlsa_HHID.**MoveInDate** for the qualifying exit \<
  **CohortStart.**

- Any record in tlsa_Exit where **ExitFrom** in (5,6) (RRH/PSH after
  move-in to PH) and tlsa_HHID.**MoveInDate** for the qualifying exit is
  365 days or more prior to the qualifying exit date.

For all other records in tlsa_Exit, set **SystemPath** based on the
combination of **LSAProjectTypes** in tlsa_HHID where:

- **HoHID =** tlsa_Exit.**HoHID**; and

- Any part of the enrollment is after **LastInactive**; and

- **EntryDate** \<= the **ExitDate** for the qualifying exit; and

- tlsa_Exit.HHType =

  - If ExitCohort = 0, ActiveHHType

  - If ExitCohort = -1, Exit1HHType

  - If ExitCohort = -2, Exit2HHType

<table>
<colgroup>
<col style="width: 17%" />
<col style="width: 26%" />
<col style="width: 55%" />
</colgroup>
<thead>
<tr>
<th>SystemPath</th>
<th>SystemPath Project Types</th>
<th>tlsa_HHID LSAProjectType(s)</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>ES/SH</td>
<td><p>in (0,1,8) and</p>
<p>not in (2,3,13)</p></td>
</tr>
<tr>
<td>2</td>
<td>TH</td>
<td><p>= 2 and</p>
<p>not in (0,1,3,8,13)</p></td>
</tr>
<tr>
<td>3</td>
<td>ES/SH + TH</td>
<td><p>= 2 and in (0,1,8) and</p>
<p>Not in (3,13)</p></td>
</tr>
<tr>
<td>4</td>
<td>RRH</td>
<td><p>= 13 and</p>
<p>not in (0,1,3,8,2)</p></td>
</tr>
<tr>
<td>5</td>
<td>ES/SH + RRH</td>
<td><p>= 13 and in (0,1,8) and</p>
<p>not in (2,3)</p></td>
</tr>
<tr>
<td>6</td>
<td>TH + RRH</td>
<td><p>= 2 and = 13 and</p>
<p>Not in (0,1,8,3)</p></td>
</tr>
<tr>
<td>7</td>
<td>ES/SH + TH + RRH</td>
<td><p>= 2 and in (0,1,8) and = 13 and</p>
<p>&lt;&gt; 3</p></td>
</tr>
<tr>
<td>8</td>
<td>PSH</td>
<td><p>= 3 and</p>
<p>Not in (0,1,2,8,13)</p></td>
</tr>
<tr>
<td>9</td>
<td>ES/SH + PSH</td>
<td><p>= 3 and in (0,1,8) and</p>
<p>Not in (2,13)</p></td>
</tr>
<tr>
<td>10</td>
<td>ES/SH + RRH + PSH</td>
<td>In (0,1,8) and = 13 and = 3 and &lt;&gt; 2</td>
</tr>
<tr>
<td>11</td>
<td>RRH + PSH</td>
<td><p>= 3 and = 13 and</p>
<p>Not in (0,1,2,8)</p></td>
</tr>
<tr>
<td>12</td>
<td colspan="2">All other combinations</td>
</tr>
</tbody>
</table>

## LSAExit

LSAExit includes 18 columns. **RowTotal** is a count of distinct
combinations of **Cohort, HoHID** and **HHType** from tlsa_Exit, grouped
by the values in all other columns.

In tlsa_Exit, **ReturnTime** is populated with actual counts of days
because they are needed to generate averages for LSACalculated. For
export, the actual counts are grouped into categories as shown below.

| Value | Return Time    | From | To  |
|-------|----------------|------|-----|
| -1    | Not applicable | -1   | -1  |
| 30    | 15-30 days     | 15   | 30  |
| 60    | 31-60 days     | 31   | 60  |
| 90    | 61-90 days     | 61   | 90  |
| 180   | 91-180 days    | 91   | 180 |
| 365   | 181-365 days   | 181  | 365 |
| 547   | 366-547 days   | 366  | 547 |
| 730   | 548-730 days   | 548  | 730 |

All of the columns in LSAExit are integers; none may be NULL.

| \#  | Column Name                           |
|-----|---------------------------------------|
| 1   | **RowTotal**                          |
| 2   | **Cohort**                            |
| 3   | **Stat**                              |
| 4   | **ExitFrom**                          |
| 5   | **ExitTo**                            |
| 6   | **ReturnTime** (group as shown above) |
| 7   | **HHType**                            |
| 8   | **HHVet**                             |
| 9   | **HHChronic**                         |
| 10  | **HHDisability**                      |
| 11  | **HHFleeingDV**                       |
| 12  | **HoHRaceEthnicity**                  |
| 14  | **HHAdultAge**                        |
| 15  | **HHParent**                          |
| 16  | **AC3Plus**                           |
| 17  | **SystemPath**                        |
| 18  | **ReportID**                          |
