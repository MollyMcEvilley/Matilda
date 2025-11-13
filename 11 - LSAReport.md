# HMIS Business Logic: LSAReport Data Quality and ReportDate

## Data Quality: HMIS Household Enrollments Not Associated with a CoC 

### Relevant Data

#### Source

| **lsa_Project**     |
|---------------------|
| ProjectType         |
| **hmis_Exit**       |
| ExitDate            |
| **hmis_Enrollment** |
| ProjectID           |
| RelationshipToHoH   |
| EntryDate           |
| EnrollmentCoC       |

#### Target

| lsa_Report |
|------------|

| **NoCoC** |
|-----------|

### Logic

#### NoCoC

The LSA is limited to enrollment records where the *EnrollmentCoC* for
the head of household = <u>ReportCoC</u>.

This is a systemwide count of *HouseholdID*s served in continuum
ES/SH/TH/RRH/PSH projects during the report period and excluded from the
LSA because there is no record of the CoC in which the households were
served. All enrollments in an HMIS participating project are required to
have an associated CoC Code. **Any number higher than zero may have an
impact on the usability of a CoC’s LSA data for AHAR and/or HIC
purposes. Communities may be required to correct these issues and
resubmit.**

A count of distinct *HouseholdIDs* in hmis_Enrollment where:

- *EntryDate* \<= <u>ReportEnd</u>; and

- RelationshipToHoH = 1; and

- hmis_Exit.*ExitDate* is NULL or *ExitDate* \>= <u>ReportStart</u>; and

- *ProjectID* = lsa_Project.**ProjectID**; and

- lsa_Project.**ProjectType** in (0,1,2,3,8,13); and

- lsa_Organization.**VictimServiceProvider** = 0; and

- *EnrollmentCoC* is null or *EnrollmentCoC* \<\> any
  ProjectCoC.*CoCCode* for the **ProjectID**

## Data Quality: Households Excluded from the LSA Due to HoH Errors

### Relevant Data

#### Source

| **lsa_Organization**     |
|--------------------------|
| VictimServiceProvider    |
| **lsa_Project**          |
| ProjectType              |
| HMISParticipatingProject |
| **hmis_Exit**            |
| ExitDate                 |
| **hmis_Enrollment**      |
| ProjectID                |
| HouseholdID              |
| RelationshipToHoH        |
| EntryDate                |
| EnrollmentCoC            |

#### Target

| lsa_Report |
|------------|

| **NotOneHoH** |
|---------------|

### Logic

#### NotOneHoH

The LSA disregards enrollment records where there is not exactly one
head of household.

This is a systemwide count of *HouseholdID*s active in continuum
ES/SH/TH/RRH/PSH projects during the report period but excluded from the
LSA due to this data error. **Any number higher than zero will have an
impact on the usability of a CoC’s LSA data for AHAR and/or HIC
purposes. Communities may be required to correct these issues and
resubmit.**

A count of distinct *HouseholdID*s in hmis_Enrollment where:

- There are no EnrollmentIDs for the HouseholdID where RelationshipToHoH
  = 1; or

- There is more than one *EnrollmentID* for the *HouseholdID* where
  *RelationshipToHoH* = 1.

AND:

- *EntryDate* \<= <u>ReportEnd</u>; and

- hmis_Exit.*ExitDate* is NULL or *ExitDate* \>= <u>ReportStart</u>; and

- *ProjectID* = lsa_Project.**ProjectID**; and

- lsa_Project.**ProjectType** in (0,1,2,3,8,13); and

- lsa_Organization.**VictimServiceProvider** = 0; and

- Any *EnrollmentCoC* associated with the *HouseholdID* =
  <u>ReportCoC.</u>

## Data Quality: Enrollments Excluded from the LSA Due to Invalid RelationshipToHoH 

### Relevant Data

#### Source

| **tlsa_HHID**       |
|---------------------|
| HouseholdID         |
| Active              |
| **hmis_Exit**       |
| ExitDate            |
| **hmis_Enrollment** |
| ProjectID           |
| HouseholdID         |
| RelationshipToHoH   |
| EntryDate           |

#### Target

| lsa_Report |
|------------|

| **RelationshipToHoH** |
|-----------------------|

### Logic

#### RelationshipToHoH

The LSA disregards enrollment records where there is no valid
*RelationshipToHoH*.

This is a count of enrollments associated with households active during
the LSA report period but excluded from the LSA due to missing
relationship data. **Any number higher than zero will have an impact on
the usability of a CoC’s LSA data for AHAR and/or HIC purposes;
communities may be required to correct these issues and resubmit.**

A count of distinct *EnrollmentID*s in hmis_Enrollment where:

- *RelationshipToHoH* is NULL or not in (1,2,3,4,5); and

- *DateDeleted* is NULL; and

- *EntryDate \<=* <u>ReportEnd;</u> and

- *ExitDate* is NULL or *ExitDate* \>= <u>ReportStart</u>; and

- *HouseholdID* = a **HouseholdID** in tlsa_HHID where **Active** = 1

## Data Quality: Invalid Move-In Dates 

### Relevant Data

#### Source

| **tlsa_HHID**       |
|---------------------|
| HouseholdID         |
| MoveInDate          |
| Active              |
| LSAProjectType      |
| **hmis_Enrollment** |
| HouseholdID         |
| MoveInDate          |

#### Target

| lsa_Report |
|------------|

| **MoveInDate** |
|----------------|

### Logic

#### MoveInDate

This is a count of RRH/PSH enrollments for heads of household with
move-in dates recorded in HMIS that fall either prior to project entry
or after project exit. These invalid dates are otherwise ignored by the
LSA; the **MoveInDate** in tlsa_HHID is set to NULL.

A count of tlsa_HHID.**EnrollmentID**s where

- **LSAProjectType** in (3,13,15); and

- **Active** = 1, and:

<!-- -->

- tlsa_HHID.**MoveInDate** is NULL; and

- hmis_Enrollment.*MoveInDate* \<= <u>ReportEnd</u>

## Data Quality: Counts of Clients / HouseholdIDs / EnrollmentIDs

### Relevant Data

#### Source

| **tlsa_Person**     |
|---------------------|
| PersonalID          |
| **tlsa_HHID**       |
| HouseholdID         |
| Active              |
| **tlsa_Enrollment** |
| EnrollmentID        |
| Active              |
| ActiveAge           |
| RelationshipToHoH   |
| ExitDate            |

#### Target

| lsa_Report |
|------------|

| **UnduplicatedClient** |
|------------------------|
| **HouseholdEntry**     |
| **ClientEntry**        |
| **AdultHoHEntry**      |
| **ClientExit**         |

### Logic

#### UnduplicatedClient

A count of distinct **PersonalID**s in tlsa\_ Enrollment where **AIR** =
1 or (**Active** = 1 and **LSAScope** \<\> 3).

#### HouseholdEntry

A count of distinct **HouseholdID**s in tlsa_HHID where **AIR** = 1 or
(**Active** = 1 and **LSAScope** \<\> 3).

#### ClientEntry

A count of distinct **EnrollmentID**s in tlsa_Enrollment where **AIR** =
1 or (**Active** = 1 and **LSAScope** \<\> 3).

#### AdultHoHEntry

A count of distinct **EnrollmentID**s in tlsa_Enrollment where **AIR** =
1 or (**Active** = 1 and **LSAScope** \<\> 3) and:

- **ActiveAge** between 18 and 65; or

- RelationshipToHoH = 1.

#### ClientExit

A count of distinct **PersonalID**s in tlsa_Enrollment where **AIR** = 1
or (**Active** = 1 and **LSAScope** \<\> 3) and **ExitDate** is not
NULL.

## Data Quality: SSN Issues

### Relevant Data

#### Source

| **tlsa_Person** |
|-----------------|
| PersonalID      |
| **hmis_Client** |
| PersonalID      |
| SSN             |
| SSNDataQuality  |

#### Target

| tlsa_Person |
|-------------|

| **SSNValid** |
|--------------|

| lsa_Report |
|------------|

| **SSNNotProvided**            |
|-------------------------------|
| **SSNMissingOrInvalid**       |
| **ClientSSNNotUnique**        |
| **DistinctSSNValueNotUnique** |

### Logic

#### SSNValid

**SSNValid** in tlsa_Person should be set to the first value in the
table below where the criteria are consistent with client records:

<table>
<colgroup>
<col style="width: 8%" />
<col style="width: 7%" />
<col style="width: 83%" />
</colgroup>
<thead>
<tr>
<th>Priority</th>
<th>Value</th>
<th>Criteria</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>9</td>
<td>hmis_Client<strong>.</strong><em>SSNDataQuality</em> in (8,9)</td>
</tr>
<tr>
<td>2</td>
<td>0</td>
<td><p>hmis_Client<strong>.</strong><em>SSNDataQuality</em> NOT in
(8,9); and</p>
<ul>
<li><p>Length(hmis_Client.<em>SSN</em>) &lt;&gt; 9; or</p></li>
<li><p><em>SSN</em> is NULL or set to system default; or</p></li>
<li><p><em>SSN</em> begins with ‘000’, ‘666’, or ‘9’; or</p></li>
<li><p><em>SSN</em> middle 2 digits are ‘00’ (e.g. 999-00-9999);
or</p></li>
<li><p><em>SSN</em> last 4 digits are ‘0000’; or</p></li>
<li><p><em>SSN</em> contains any character other than 0-9; or</p></li>
<li><p><em>SSN</em> in ('111111111', '222222222', '333333333',
'444444444', '555555555', '777777777', '888888888', ‘123456789’,
‘234567890’, ‘345678901’, ‘456789012’, ‘567890123’, ‘678901234’,
‘789012345’, ‘890123456’, ‘901234567’)</p></li>
</ul></td>
</tr>
<tr>
<td>3</td>
<td>1</td>
<td>(All others)</td>
</tr>
</tbody>
</table>

These checks will not catch all invalid SSNs, but others will be assumed
valid.

#### SSNNotProvided

A count of distinct **PersonalID**s in tlsa_Enrollment where:

- tlsa_Person.**SSNValid** = 9; and

- **AIR** = 1 or (**Active** = 1 and **LSAScope** \<\> 3)

#### SSNMissingOrInvalid

A count of distinct **PersonalID**s in tlsa_Enrollment where:

- tlsa_Person.**SSNValid** = 0; and

- **AIR** = 1 or (**Active** = 1 and **LSAScope** \<\> 3)

#### ClientSSNNotUnique

A count of distinct **PersonalID**s in tlsa_Enrollment where:

- tlsa_Person.**SSNValid** = 1; and

- **AIR** = 1 or (**Active** = 1 and **LSAScope** \<\> 3); and

- hmis_Client.*SSN* = \[the hmis_Client.*SSN* for another **PersonalID**
  in tlsa_Person, regardless of **LSAScope**\]

#### DistinctSSNValueNotUnique

A count of distinct hmis_Client.*SSN* values for people with:

- tlsa_Person.**SSNValid** = 1; and

- At least one record in tlsa_Enrollment where **AIR** = 1 or
  (**Active** = 1 and **LSAScope** \<\> 3); and

- hmis_Client.*SSN* = \[the hmis_Client.*SSN* for another **PersonalID**
  in tlsa_Person, regardless of **LSAScope**\]

## Data Quality: Enrollment Data

### Relevant Data

#### Source

| **lsa_Project**              |
|------------------------------|
| ProjectType                  |
| **tlsa_Enrollment**          |
| EnrollmentID                 |
| Active                       |
| ActiveAge                    |
| RelationshipToHoH            |
| DisabilityStatus             |
| **hmis_Enrollment**          |
| EnrollmentID                 |
| DisablingCondition           |
| LivingSituation              |
| LengthOfStay                 |
| DateToStreetESSH             |
| PreviousStreetESSH           |
| TimesHomelessPastThreeYears  |
| MonthsHomelessPastThreeYears |
| **hmis_Exit**                |
| Destination                  |

#### Target

| lsa_Report |
|------------|

| **DisablingCond**   |
|---------------------|
| **LivingSituation** |
| **LengthOfStay**    |
| **HomelessDate**    |
| **TimesHomeless**   |
| **MonthsHomeless**  |
| **Destination**     |

### Logic

#### DisablingCond

This is a subset of **ClientEntry**.

A count of distinct **EnrollmentIDs** in tlsa_Enrollment where where
**AIR** = 1 or (**Active** = 1 and **LSAScope** \<\> 3) and:

- **DisabilityStatus** = 99.

#### LivingSituation

This is a subset of **AdultHoHEntry**.

A count of distinct **EnrollmentIDs** in tlsa_Enrollment where **AIR** =
1 or (**Active** = 1 and **LSAScope** \<\> 3) and:

- hmis_Enrollment**.***LivingSituation* in (8,9,99) or is NULL; and

- **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1

#### LengthOfStay

This is a subset of **AdultHoHEntry**.

A count of distinct **EnrollmentIDs** in tlsa_Enrollment where **AIR** =
1 or (**Active** = 1 and **LSAScope** \<\> 3) and:

- hmis_Enrollment**.***LengthOfStay* in (8,9,99) or is NULL.

- **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1

#### HomelessDate

This is a subset of **AdultHoHEntry**.

A count of distinct **EnrollmentIDs** in tlsa_Enrollment where **AIR** =
1 or (**Active** = 1 and **LSAScope** \<\> 3) and:

- **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and

  - hmis_Enrollment**.**DateToStreetESSH \> EntryDate; or

  - hmis_Enrollment**.***DateToStreetESSH* is NULL; and

    - tlsa_Enrollment.**LSAProjectType** in (0,1,8); or

    - *LivingSituation* in (101,116,118); or

    - PreviousStreetESSH = 1.

#### TimesHomeless

This is a subset of **AdultHoHEntry**.

A count of distinct **EnrollmentIDs** in tlsa_Enrollment where **AIR** =
1 or (**Active** = 1 and **LSAScope** \<\> 3) and:

- **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and

- hmis_Enrollment**.***TimesHomelessPastThreeYears* is NULL or not in
  (1,2,3,4); and

  - tlsa_Enrollment. **LSAProjectType** in (0,1,8); or

  - *LivingSituation* in (101,116,118); or

  - PreviousStreetESSH = 1.

#### Months Homeless

This is a subset of **AdultHoHEntry**.

A count of distinct **EnrollmentIDs** in tlsa_Enrollment where **AIR** =
1 or (**Active** = 1 and **LSAScope** \<\> 3) and:

- **ActiveAge** between 18 and 65 or **RelationshipToHoH** = 1; and

- hmis_Enrollment**.***MonthsHomelessPastThreeYears* is NULL or not
  between 101 and 113; and

  - tlsa_Enrollment.**LSAProjectType** in (0,1,8); or

  - *LivingSituation* in (101,116,118); or

  - PreviousStreetESSH = 1.

#### Destination

This is a subset of **ClientExit**.

A count of distinct **EnrollmentIDs** in tlsa_Enrollment where **AIR** =
1 or (**Active** = 1 and **LSAScope** \<\> 3) and:

- **ExitDate** is not NULL; and

  - hmis_Exit.*Destination* is NULL or in (8,9,17,30,99) or

  - hmis_Exit.*Destination* = 435 and hmis_Exit.*DestinationSubsidyType*
    is NULL

## Set LSAReport ReportDate

#### Target

| lsa_Report |
|------------|

| **ReportDate** |
|----------------|

Set LSAReport.**ReportDate** = the system date/time when all other data
required to produce the LSA CSV files has been generated.

## LSAReport

LSAReport has 31 columns; none may be NULL. Data types are shown below.

| \#  | Column Name                   | Data Type                            |
|-----|-------------------------------|--------------------------------------|
| 1   | **ReportID**                  | Integer                              |
| 2   | **ReportDate**                | Date/time                            |
| 3   | **ReportStart**               | Date                                 |
| 4   | **ReportEnd**                 | Date                                 |
| 5   | **ReportCoC**                 | 6-character string (XX-999)          |
| 6   | **SoftwareVendor**            | String; up to 50 characters or ‘n/a’ |
| 7   | **SoftwareName**              | String; up to 50 characters or ‘n/a’ |
| 8   | **VendorContact**             | String; up to 50 characters or ‘n/a’ |
| 9   | **VendorEmail**               | String; up to 50 characters or ‘n/a’ |
| 10  | **LSAScope**                  | Integer                              |
| 11  | **LookbackDate**              | Date                                 |
| 12  | **NoCoC**                     | Integer                              |
| 13  | **NotOneHoH**                 | Integer                              |
| 14  | **RelationshipToHoH**         | Integer                              |
| 15  | **MoveInDate**                | Integer                              |
| 16  | **UnduplicatedClient**        | Integer                              |
| 17  | **HouseholdEntry**            | Integer                              |
| 18  | **ClientEntry**               | Integer                              |
| 19  | **AdultHoHEntry**             | Integer                              |
| 20  | **ClientExit**                | Integer                              |
| 21  | **SSNNotProvided**            | Integer                              |
| 22  | **SSNMissingOrInvalid**       | Integer                              |
| 23  | **ClientSSNNotUnique**        | Integer                              |
| 24  | **DistinctSSNValueNotUnique** | Integer                              |
| 25  | **DisablingCond**             | Integer                              |
| 26  | **LivingSituation**           | Integer                              |
| 27  | **LengthOfStay**              | Integer                              |
| 28  | **HomelessDate**              | Integer                              |
| 29  | **TimesHomeless**             | Integer                              |
| 30  | **MonthsHomeless**            | Integer                              |
| 31  | **Destination**               | Integer                              |

<span id="_NoCoC" class="anchor"></span>

[^1]: The only exceptions to this are OPH counts (section 9.6) and data
    quality reporting (sections 10 and 11).

[^2]: Note that this will exclude night-by-night enrollments without a
    record of a bed night on the entry date.
