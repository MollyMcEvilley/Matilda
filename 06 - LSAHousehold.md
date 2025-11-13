# HMIS Business Logic: LSAHousehold

## Get Distinct Households for LSAHousehold

<img src="media/image2.png" style="width:3.57222in;height:1.01042in" />

This section is required only if **LSAScope** \<\> 3 (HIC).

The tlsa_Household data construct holds one record for each distinct
combination of **HoHID** and **ActiveHHType** in tlsa_HHID where
**Active** = 1. It is a household-level version of the aggregate
LSAHousehold data and is used to set values for each LSA reporting
category for each household. It includes all columns from
LSAHousehold.csv other than **RowTotal** and **ReportID**, as well as
several columns which are used as a reference to simplify business logic
but do not correlate to a column in LSAHousehold.

### Relevant Data

#### Source

| **lsa_Report** |
|----------------|
| ReportStart    |
| ReportEnd      |
| **tlsa_HHID**  |
| HoHID          |
| ActiveHHType   |
| Active         |

#### Target

The logic associated with values for columns with names in **bold**
below is described in this step. The business logic associated with
other columns is described in subsequent steps.

<table>
<colgroup>
<col style="width: 41%" />
<col style="width: 58%" />
</colgroup>
<thead>
<tr>
<th><strong>tlsa_Household</strong></th>
<th><strong>Column Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>HoHID</strong></td>
<td><em>PersonalID</em> for heads of active households; distinct
combinations of <strong>HoHID</strong> and <strong>HHType</strong> serve
as a primary key.</td>
</tr>
<tr>
<td><strong>HHType</strong></td>
<td>The household type</td>
</tr>
<tr>
<td>FirstEntry</td>
<td><p>(Does not correlate to a column in LSAHousehold.csv)</p>
<p>The earliest <em>EntryDate</em> for any active enrollment.</p></td>
</tr>
<tr>
<td>LastInactive</td>
<td><p>(Does not correlate to a column in LSAHousehold.csv)</p>
<p>For households already engaged with the continuum at the start of the
report period, the most recent date prior to <u>ReportStart</u> and the
start of the household’s period of continuous engagement.</p></td>
</tr>
<tr>
<td>Stat</td>
<td>The household status related to continuum engagement on the first
day of the earliest enrollment active during the report period.</td>
</tr>
<tr>
<td>StatEnrollmentID</td>
<td><p>(Does not correlate to a column in LSAPerson.csv)</p>
<p>For households returning or re-engaging with the continuum 15-730
days after an exit prior to <u>ReportStart</u> (<strong>Stat</strong> in
(2,3,4)), the <em>EnrollmentID</em> for the household’s most recent exit
prior to <u>ReportStart</u>.</p></td>
</tr>
<tr>
<td>ReturnTime</td>
<td>For households returning or re-engaging with the continuum 15-730
days after an exit prior to <u>ReportStart</u> (<strong>Stat</strong> in
(2,3,4)), the length of time in days between exit and the earliest
active enrollment.</td>
</tr>
<tr>
<td>HHAdult</td>
<td>Number of people (including the head of household) 18 and older
served with the HoH in active HMIS households where
<strong>HHType</strong> = tlsa_Household.<strong>HHType</strong></td>
</tr>
<tr>
<td>HHChild</td>
<td>Number of people (including the head of household) under the age of
18 served with the HoH in active HMIS households where
<strong>HHType</strong> = tlsa_Household.<strong>HHType</strong></td>
</tr>
<tr>
<td>HHNoDOB</td>
<td>Number of people (including the head of household) with no valid
date of birth with the HoH in active HMIS households where
<strong>HHType</strong> = tlsa_Household.<strong>HHType</strong></td>
</tr>
<tr>
<td>HHChronic</td>
<td>Identifies whether or not the head of household or any adult
household member is chronically homeless or has other specific patterns
of long-term homelessness. Based on <strong>DisabilityStatus</strong>,
<strong>CHTime</strong>, and <strong>CHTimeStatus</strong> values, as
determined for LSAPerson reporting.</td>
</tr>
<tr>
<td>HHVet</td>
<td>Identifies whether or not the household includes a veteran. Based on
<strong>VetStatus</strong> value, as determined for LSAPerson
reporting.</td>
</tr>
<tr>
<td>HHDisability</td>
<td>Identifies whether or not the head of household or any adult member
was identified as having a disabling condition on any active
enrollment.</td>
</tr>
<tr>
<td>HHFleeingDV</td>
<td>Identifies whether or not the head of household or any adult member
was identified as fleeing domestic violence on any active enrollment.
Based on <strong>DVStatus</strong> value, as determined for LSAPerson
reporting.</td>
</tr>
<tr>
<td>HoHRaceEthnicity</td>
<td>Identifies race and ethnicity for head of household as reported in
LSAPerson.</td>
</tr>
<tr>
<td>HHAdult</td>
<td>Number of people (including the head of household) 18 and older
served with the head of household in the household type reflected in the
<strong>HHType</strong> column.</td>
</tr>
<tr>
<td>HHChild</td>
<td>Number of people (including the head of household) under the age of
18 served with the head of household in the household type reflected in
the <strong>HHType</strong> column.</td>
</tr>
<tr>
<td>HHNoDOB</td>
<td>Number of people (including the head of household) with no valid
date of birth served with the head of household.</td>
</tr>
<tr>
<td>HHAdultAge</td>
<td>The age groups of adult household members. The categories are
mutually exclusive (a household can only fall into one group) and
inclusive (every household with adults will fall into one group).</td>
</tr>
<tr>
<td>HHParent</td>
<td>Identifies whether or not any household member has
<strong>RelationshiptoHoH</strong> = 2 (child of the HoH).</td>
</tr>
<tr>
<td>ESTStatus</td>
<td>Identifies whether the household was served in ES, SH, and/or TH
during the report period or prior to the report period during a period
of continuous system use. If served, the status indicates how the
enrollment timeframe relates to the report period.</td>
</tr>
<tr>
<td>ESTGeography</td>
<td>For households with active EST enrollments
(<strong>ESTStatus</strong> &gt; 2) during the report period, the
Geography of the most recent project in which the household was
enrolled.</td>
</tr>
<tr>
<td>ESTLivingSit</td>
<td>For households with active EST enrollments
(<strong>ESTStatus</strong> &gt; 2) during the report period, the
<em>LivingSituation</em> associated with the earliest active
enrollment.</td>
</tr>
<tr>
<td>ESTDestination</td>
<td>For households who exited an EST enrollment during the report period
and were not active in an EST project as of ReportEnd
(<strong>ESTStatus</strong> in (12,22)), the <em>Destination</em>
associated with the most recent exit.</td>
</tr>
<tr>
<td>ESTChronic</td>
<td>Population identifier specific to EST; see
<strong>HHChronic</strong>.</td>
</tr>
<tr>
<td>ESTVet</td>
<td>Population identifier specific to EST; see
<strong>HHVet</strong>.</td>
</tr>
<tr>
<td>ESTDisability</td>
<td>Population identifier specific to EST; see
<strong>HHDisability</strong>.</td>
</tr>
<tr>
<td>ESTFleeingDV</td>
<td>Population identifier specific to EST; see
<strong>HHFleeingDV.</strong></td>
</tr>
<tr>
<td>ESTAC3Plus</td>
<td>Population identifier; for AC households, specifies whether or not
there were at least three household members under the age of 18 served
with the HoH in EST.</td>
</tr>
<tr>
<td>ESTAdultAge</td>
<td>Population identifier specific to EST; see
<strong>HHAdultAge</strong>.</td>
</tr>
<tr>
<td>ESTParent</td>
<td>Population identifier specific to EST; see
<strong>HHParent</strong>.</td>
</tr>
<tr>
<td>RRHStatus</td>
<td>Identifies whether the household was served in RRH during the report
period or in an episode of homelessness that overlaps with the report
period. If served, the status indicates how the enrollment timeframe
relates to the report period.</td>
</tr>
<tr>
<td>RRHMoveIn</td>
<td>For households served in RRH during the report period, indicates if
the household has a move-in date. If so, indicates whether it was before
or during the report period.</td>
</tr>
<tr>
<td>RRHGeography</td>
<td>For households with active RRH enrollments
(<strong>RRHStatus</strong> &gt; 2) during the report period, the
Geography of the most recent project in which the household was
enrolled.</td>
</tr>
<tr>
<td>RRHLivingSit</td>
<td>For households with active RRH enrollments
(<strong>RRHStatus</strong> &gt; 2) during the report period, the
<em>LivingSituation</em> associated with the earliest active
enrollment.</td>
</tr>
<tr>
<td>RRHDestination</td>
<td>For households who exited an RRH enrollment during the report period
and were not active in an RRH project as of ReportEnd
(<strong>RRHStatus</strong> in (12,22)), the Destination associated with
the most recent exit.</td>
</tr>
<tr>
<td>RRHPreMoveInDays</td>
<td>For households who were housed in RRH at any point in the report
period, including those with a <em>MoveInDate</em> prior to
<u>ReportStart</u>, the total number of days between <em>EntryDate</em>
and <em>MoveInDate</em> for any active RRH enrollment. It differs from
other day counts in that it includes all days in RRH prior to move-in,
even if the household was simultaneously enrolled in ES/SH/TH/PSH.</td>
</tr>
<tr>
<td>RRHChronic</td>
<td>Population identifier specific to RRH; see
<strong>HHChronic</strong>.</td>
</tr>
<tr>
<td>RRHVet</td>
<td>Population identifier specific to RRH; see
<strong>HHVet</strong>.</td>
</tr>
<tr>
<td>RRHDisability</td>
<td>Population identifier specific to RRH; see
<strong>HHDisability</strong>.</td>
</tr>
<tr>
<td>RRHFleeingDV</td>
<td>Population identifier specific to RRH; see
<strong>HHFleeingDV.</strong></td>
</tr>
<tr>
<td>RRHAC3Plus</td>
<td>Population identifier; for AC households, specifies whether or not
there were at least three household members under the age of 18 served
with the HoH in RRH.</td>
</tr>
<tr>
<td>RRHAdultAge</td>
<td>Population identifier specific to RRH; see
<strong>HHAdultAge</strong>.</td>
</tr>
<tr>
<td>RRHParent</td>
<td>Population identifier specific to RRH; see
<strong>HHParent</strong>.</td>
</tr>
<tr>
<td>PSHStatus</td>
<td>Identifies whether the household was served in PSH during the report
period or in an episode of homelessness that overlaps with the report
period. If served, the status indicates how the enrollment timeframe
relates to the report period.</td>
</tr>
<tr>
<td>PSHMoveIn</td>
<td>For households served in PSH during the report period, indicates if
the household has a move-in date. If so, indicates whether it was before
or during the report period.</td>
</tr>
<tr>
<td>PSHGeography</td>
<td>For households with active PSH enrollments
(<strong>PSHStatus</strong> &gt; 2) during the report period, the
Geography of the most recent project in which the household was
enrolled.</td>
</tr>
<tr>
<td>PSHLivingSit</td>
<td>For households with active PSH enrollments
(<strong>PSHStatus</strong> &gt; 2) during the report period, the
<em>LivingSituation</em> associated with the earliest active
enrollment.</td>
</tr>
<tr>
<td>PSHDestination</td>
<td>For households who exited a PSH enrollment during the report period
and were not active in PSH as of ReportEnd (<strong>PSHStatus</strong>
in (12,22)), the <em>Destination</em> associated with the most recent
exit.</td>
</tr>
<tr>
<td>PSHHousedDays</td>
<td>From active enrollments, days spent housed in PSH. (Note that this
differs from other day counts in that it is limited to active
enrollments.)</td>
</tr>
<tr>
<td>PSHChronic</td>
<td>Population identifier specific to PSH; see
<strong>HHChronic</strong>.</td>
</tr>
<tr>
<td>PSHVet</td>
<td>Population identifier specific to PSH; see
<strong>HHVet</strong>.</td>
</tr>
<tr>
<td>PSHDisability</td>
<td>Population identifier specific to PSH; see
<strong>HHDisability</strong>.</td>
</tr>
<tr>
<td>PSHFleeingDV</td>
<td>Population identifier specific to PSH; see
<strong>HHFleeingDV.</strong></td>
</tr>
<tr>
<td>PSHAC3Plus</td>
<td>Population identifier; for AC households, specifies whether or not
there were at least three household members under the age of 18 served
with the HoH in PSH.</td>
</tr>
<tr>
<td>PSHAdultAge</td>
<td>Population identifier specific to PSH; see
<strong>HHAdultAge</strong>.</td>
</tr>
<tr>
<td>PSHParent</td>
<td>Population identifier specific to PSH; see
<strong>HHParent</strong>.</td>
</tr>
<tr>
<td>ESDays</td>
<td>Days spent in ES or SH during the report period and/or in any
continuous episode of homelessness/system use prior to the report period
when the household was not in TH or housed in RRH/PSH.</td>
</tr>
<tr>
<td>THDays</td>
<td>Days spent in TH during the report period and/or in any continuous
episode of engagement/homelessness prior to report period when the
household was not in housed in RRH/PSH.</td>
</tr>
<tr>
<td>ESTDays</td>
<td>Days spent in ES/SH/TH in the report period and/or in any continuous
episode of homelessness prior to report period when the household was
not housed in RRH/PSH.</td>
</tr>
<tr>
<td>RRHPSHPreMoveInDays</td>
<td>For households served in RRH and/or PSH, the total number of days
spent homeless in RRH/PSH in the report period or in any continuous
episode of engagement/homelessness prior to report period when household
was not housed in RRH/PSH and not active in ES/SH/TH.</td>
</tr>
<tr>
<td>RRHHousedDays</td>
<td>Days spent housed in RRH in the report period and/or in any
continuous episode of engagement/homelessness prior to report period
when the household was not housed in PSH.</td>
</tr>
<tr>
<td>SystemDaysNotPSHHoused</td>
<td>The total number of days spent in ES, SH, TH, RRH, or PSH
(pre-move-in) in the report period or in any continuous episode of
homelessness prior to the report period while not housed in PSH.</td>
</tr>
<tr>
<td>SystemHomelessDays</td>
<td>The combined total number of days in the report period or in any
episode of continuous homelessness that overlaps the report period when
the household was in ES/SH/TH or was enrolled, but not housed in RRH/PSH
(i.e. does not have a move-in date).</td>
</tr>
<tr>
<td>Other3917Days</td>
<td>The total number of days in the report period or in any episode of
continuous homelessness that overlaps the report period when the
household was on the street or in ES/SH based on 3.917 Living Situation
records for any System Path enrollment, but was not active in a
continuum ES/SH/TH/RRH/PSH project.</td>
</tr>
<tr>
<td>TotalHomelessDays</td>
<td>The combined total number of days in the report period or in any
episode of continuous homelessness that overlaps the report period when
the household was in ES/SH/TH; was enrolled, but not housed in RRH/PSH
(i.e. does not have a move-in date); or on the street or in ES/SH based
on 3.917 Living Situation records for any System Path enrollment and was
not housed in RRH/PSH.</td>
</tr>
<tr>
<td>SystemPath</td>
<td>The combinations of system use during the report period and in any
continuous period of service prior to the report period – i.e., the
‘path’ through the system. It is not dependent on the sequence of
service. System Paths are mutually exclusive.</td>
</tr>
<tr>
<td>ESTAIR</td>
<td>Identifies households active in residence for ES/SH/TH in the report
period.</td>
</tr>
<tr>
<td>RRHAIR</td>
<td>Identifies households active in residence for RRH in the report
period.</td>
</tr>
<tr>
<td>PSHAIR</td>
<td>Identifies households active in residence for PSH in the report
period.</td>
</tr>
</tbody>
</table>

### Logic

For the LSA, each distinct combination of a head of household’s
**PersonalID** and **HHType** from all **HouseholdID**s active in the
report period is counted as a single household.

Records in the intermediate household-level tlsa_Household are created
for each distinct combination of **ActiveHHType** and **HoHID** in
tlsa_HHID where **Active** = 1.

tlsa_Person

tlsa_Household

tlsa_Enrollment

tlsa_HHID

**HHAdult**, **HHChild**, and **HHNoDOB** are used together to report on
household composition. The additional household-level population
identifiers are used to report on population groups of interest.

### Relevant Data

#### Source

| **tlsa_HHID**       |
|---------------------|
| HoHID               |
| HouseholdID         |
| ActiveHHType        |
| HHChronic           |
| HHVet               |
| HHDisability        |
| HHFleeingDV         |
| HHAdultAge          |
| HHParent            |
| AC3Plus             |
| Active              |
| **tlsa_Enrollment** |
| HouseholdID         |
| PersonalID          |
| ActiveAge           |
| Active              |
| **tlsa_Person**     |
| PersonalID          |
| RaceEthnicity       |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **tlsa_Household**   |
|----------------------|
| **HHAdult**          |
| **HHChild**          |
| **HHNoDOB**          |
| **HoHRaceEthnicity** |
| **HHChronic**        |
| **HHVet**            |
| **HHDisability**     |
| **HHFleeingDV**      |
| **HHAdultAge**       |
| **HHParent**         |
| **AC3Plus**          |

### Logic

#### HHAdult

The value is a count (up to 3) of household members who was served as an
adult on *every* associated active enrollment (**ActiveAge** between 21
and 65). Anyone served as both an adult and a child with the same
**HoHID**/**ActiveHHType** should be counted as a child. (This is only
possible in AC households when a household member turns 18 between
enrollments and there is another household member still under 18.)

| Value | Category                      |
|-------|-------------------------------|
| 0     | No adult in household         |
| 1     | 1 adult in household          |
| 2     | 2 adults in household         |
| 3     | 3 or more adults in household |

If **HHType** is 1 (AO) or 2 (AC), the value in this column must be \>
0.

If **HHType** = 3 (CO), the value in this column must = 0.

#### HHChild

The value is a count of all active household members (up to 3) whose
**ActiveAge** for *any* associated active enrollment is under 18.

| Value | Category                        |
|-------|---------------------------------|
| 0     | No child in household           |
| 1     | 1 child in household            |
| 2     | 2 children in household         |
| 3     | 3 or more children in household |

If **HHType** is 1 (AO), the value in this column must = 0.

If **HHType** is 2 (AC) or 3 (CO), the value in this column must be \>
0.

**Note:** If **HHChild** = 3 and **HHType** = 2, the household is
counted in the AC Households with 3 or More Children population.

The value is a count of all active household members (up to 3) whose
**ActiveAge** is in (98,99).

| Value | Category                                          |
|-------|---------------------------------------------------|
| 0     | No person without a valid DOB in household        |
| 1     | 1 person without a valid DOB in household         |
| 2     | 2 people without a valid DOB in household         |
| 3     | 3 or more people without a valid DOB in household |

If **HHType** is 1 (AO) or 3 (CO), the value in this column must be = 0.

If **HHType** = 99 (UN), the value in this column must be \> 0.

#### HoHRaceEthnicity

Set values for **HoHRaceEthnicity** in tlsa_Household to the
**RaceEthnicity** value for the head of household in tlsa_Person.

#### HHVet, HHDisability, and HHParent

Set the value in tlsa_Household to the maximum value for the
corresponding column in tlsa_HHID – i.e., if the value is 1 for any
**HouseholdID** with the same **HoHID** and **ActiveHHType =**
**HHType**, set the value in tlsa_Household to 1. Otherwise, set the
value to 0.

These columns are used to identify populations of interest:

- Veteran Household (**HHVet** = 1)

- Household with a Disabled Adult/HoH **(HHDisability** = 1)

- Parenting Children (**HHType** = 3 and **HHParent** = 1)

- Parenting Youth 18-24 – (**HHParent** = 1 and **HHType** = 2 and
  **HHAdultAge** in (18,24))

#### HHFleeingDV

Set **HHFleeingDV** to the first value in the table below that occurs in
tlsa_HHID.**HHFleeingDV** for the same **HoHID** where **ActiveHHType**
= **HHType**:

| Priority | HHFleeingDV Value |
|----------|-------------------|
| 1        | 1                 |
| 2        | 2                 |
| 3        | 0                 |

This column is used to identify populations of interest:

- Households Fleeing Domestic Violence **(HHFleeingDV** = 1)

- Households of Domestic Violence Survivors Not Currently Fleeing
  (**HHFleeingDV** = 2)

- Households with No Reported DV History (**HHFleeingDV** = 0)

#### HHChronic

Set **HHChronic** to the first value in the table below that occurs in
tlsa_HHID.**HHChronic** for the same **HoHID** where **ActiveHHType** =
**HHType**:

| Value | Category                                               |
|:-----:|--------------------------------------------------------|
|   1   | Chronically Homeless                                   |
|   2   | Long-Term Homeless with Disability                     |
|   3   | Long-Term Homeless Missing Disability Info             |
|   4   | Long-Term Homeless without Disability                  |
|   5   | Homeless \> 6 Months with Disability (missing data)    |
|   6   | Homeless \> 6 Months with Disability (no missing data) |
|   9   | CH Status Unknown (missing data)                       |
|   0   | Not Chronically Homeless                               |

#### HHAdultAge

Set **HHAdultAge** based on the first of the criteria below met by any
active tlsa_HHID record with the same **HoHID** and **ActiveHHType =**
**HHType:**

| Priority | tlsa_HHID           | tlsa_Household.HHAdultAge |
|----------|---------------------|---------------------------|
| 1        | **HHAdultAge** = 18 | 18                        |
| 2        | **HHAdultAge** = 24 | 24                        |
| 3        | **HHAdultAge** = 55 | 55                        |
| 4        | **HHAdultAge** = 25 | 25                        |
| 5        | (any other)         | -1                        |

The populations for which **HHAdultAge** are relevant are:

- AO Unaccompanied Youth 18-21– all household members are between the
  ages of 18 and 21 (**HHType** = 1 and **HHAdultAge** = 18)

- AO Unaccompanied Youth 22-24 – at least one household member is
  between 22 and 24; all are between 18 and 24 **(HHType** = 1 and
  **HHAdultAge** = 24)

- AO Non-Veteran Households 25+ - at least one household member is over
  24 (**HHType** = 1 and **HHVet** = 0 and **HHAdultAge** in (25,55))

- AO Senior Households 55+ - all household members are 55 or older
  (**HHType** = 1 and **HHAdultAge** = 55)

- AC Parenting Youth 18-24 – all adults in the household are between 18
  and 24; there are no household members of unknown age (**HHParent** =
  1 and **HHType** = 2 and **HHAdultAge** in (18,24))

In general, each distinct combination of **HoHID**/**HHType** is counted
in all populations identified for associated **HouseholdID**s.
Technically, a non-veteran served alone –once at age 24 and again at 25
– is a member of two populations:

- Unaccompanied Young Adults 18-24; and

- Non-Veteran Households 25+.

With a single upload value for **HHAdultAge** in LSAHousehold, it isn’t
possible to identify both. Inclusion in youth and senior populations is
prioritized over the Non-Veteran Households 25+ population.

## EST/RRH/PSH/RRHSOStatus – LSAHousehold 

### Relevant Data 

#### Source

| **tlsa_HHID**  |
|----------------|
| HoHID          |
| HHType         |
| LSAProjectType |
| EntryDate      |
| ExitDate       |
| Active         |
| ActiveHHType   |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **tlsa_Household** |
|--------------------|
| **ESTStatus**      |
| **RRHStatus**      |
| **PSHStatus**      |
| **RRHSOStatus**    |

### Logic 

Like tlsa_Person, tlsa_Household includes columns to indicate the
project groups in which each household was served.

The logic and upload values associated with **ESTStatus**,
**RRHStatus**, **PSHStatus**, and **RRHSOStatus** are identical, aside
from the project group. The following sections use ‘x’ in place of the
project group identifier – e.g., **xStatus** instead of **ESTStatus**.

Values are based on:

- Earliest *EntryDate* for an active enrollment in project group; and

- A NULL value for *ExitDate* on any active enrollment in the project
  group OR the latest *ExitDate.*

For every record in tlsa_Household:

| Earliest x *EntryDate* | Latest x *ExitDate* | xStatus Value |
|----|----|----|
| NULL | n/a | 0 |
| \< <u>ReportStart</u> | NULL / there is an active enrollment for x with no *ExitDate* | 11 |
| \< <u>ReportStart</u> | Between <u>ReportStart</u> and <u>ReportEnd</u> | 12 |
| \>= <u>ReportStart</u> | NULL / there is an active enrollment for x with no *ExitDate* | 21 |
| \>= <u>ReportStart</u> | Between <u>ReportStart</u> and <u>ReportEnd</u> | 22 |

Note: 2 is also a valid value for **xStatus** but is not assigned until
a later step in section [6.16 Update
EST/RRH/PSHStatus](#update-estrrhpshrrhsostatus).

## RRH/PSH/RRHSOMoveIn – LSAHousehold 

### Relevant Data 

#### Source

| **tlsa_HHID**  |
|----------------|
| HoHID          |
| HHType         |
| ActiveHHType   |
| MoveInDate     |
| EntryDate      |
| LSAProjectType |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **tlsa_Household** |
|--------------------|
| **RRHMoveIn**      |
| **PSHMoveIn**      |
| **RRHSOMoveIn**    |

### Logic 

Aside from the project type, the logic and upload values associated with
**RRHMoveIn** and **PSHMoveIn** are identical. They are based on
**RRHStatus** and **PSHStatus**, respectively, and move-in dates for
relevant enrollments.

For all records in tlsa_Household:

| xStatus Value | MoveInDate | xMoveIn Value |
|----|----|----|
| \<= 2 | Any | -1 |
| \> 2 | There is no *MoveInDate* | 0 |
| \> 2 | Most recent *MoveInDate* is between <u>ReportStart</u> and <u>ReportEnd</u> | 1 |
| \> 2 | Most recent *MoveInDate* \< <u>ReportStart</u> | 2 |

## EST/RRH/PSHGeography – LSAHousehold 

### Relevant Data

#### Source

| **lsa_ProjectCoC** |
|--------------------|
| ProjectID          |
| GeographyType      |
| **tlsa_Household** |
| HoHID              |
| HHType             |
| EST/RRH/PSHStatus  |
| **tlsa_HHID**      |
| HoHID              |
| ActiveHHType       |
| Active             |
| ProjectID          |
| LSAProjectType     |
| EntryDate          |
| ExitDate           |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **tlsa_Household** |
|--------------------|
| **ESTGeography**   |
| **RRHGeography**   |
| **PSHGeography**   |

### Logic

Set **xGeography** = -1 for households not served in project group
during the report period (**xStatus** \< 10).

For households served in the project group during the report period
(**xStatus** \>= 10), **xGeography** is based on:

- The active enrollment for the project group with the latest active
  date in the report period; and

- The lsa_ProjectCoC.*GeographyType* for the project.

If a household has more than one project group enrollment on their most
recent active date, use the enrollment with the latest *EntryDate*.

| HMIS Value | HMIS Response Category | LSA Value |
|------------|------------------------|-----------|
| 1          | Urban                  | 1         |
| 2          | Suburban               | 2         |
| 3          | Rural                  | 3         |

## EST/RRH/PSHLivingSit – LSAHousehold 

### Relevant Data

#### Source

| **tlsa_Household**  |
|---------------------|
| HoHID               |
| HHType              |
| EST/RRH/PSHStatus   |
| **tlsa_HHID**       |
| HoHID               |
| ActiveHHType        |
| Active              |
| LSAProjectType      |
| EntryDate           |
| **tlsa_Enrollment** |
| EnrollmentID        |
| EntryDate           |
| **hmis_Enrollment** |
| EnrollmentID        |
| PersonalID          |
| EntryDate           |
| LivingSituation     |
| RentalSubsidyType   |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **tlsa_Household** |
|--------------------|
| **ESTLivingSit**   |
| **RRHLivingSit**   |
| **PSHLivingSit**   |

### Logic

Set **xLivingSit** = -1 for households not served in project group
during the report period (**xStatus** \< 10).

Set **ESTLivingSit** = 99 for any household where
tlsa_HHID.**EntryDate** \<\> hmis_Enrollment.*EntryDate* (i.e.,
night-by-night enrollments where the HMIS entry date did not correspond
to a *BedNightDate*).

For other households (**xStatus** \> 2), **xLivingSit** is based on
*LivingSituation* and *RentalSubsidyType* for the enrollment with the
earliest *EntryDate* for the project group..

- If *LivingSituation* in (8,9), set xLivingSit = 98

- If *LivingSituation* is NULL or 99, set **xLivingSit** = 99

- If *LivingSituation* = 435 and *RentalSubsidyType* is null, set
  **xLivingSit** = 99

- If LivingSituation = 435, set **xLivingSit** = RentalSubsidyType

- Otherwise, set **xLivingSit** = *LivingSituation*.

| Value | Destination |
|---:|----|
| -1 | Not applicable |
| 98 | Data not provided by client |
| 99 | Data missing or invalid |
| 101 | Emergency shelter, including hotel or motel paid for with emergency shelter voucher, Host Home shelter |
| 116 | Place not meant for habitation (e.g., a vehicle, an abandoned building, bus/train/subway station/airport or anywhere outside) |
| 118 | Safe Haven |
| 204 | Psychiatric hospital or other psychiatric facility |
| 205 | Substance abuse treatment facility or detox center |
| 206 | Hospital or other residential non-psychiatric medical facility |
| 207 | Jail, prison, or juvenile detention facility |
| 215 | Foster care home or foster care group home |
| 225 | Long-term care facility or nursing home |
| 302 | Transitional housing for homeless persons (including homeless youth) |
| 314 | Hotel or motel paid for without emergency shelter voucher |
| 329 | Residential project or halfway house with no homeless criteria |
| 332 | Host Home (non-crisis) |
| 335 | Staying or living in a family member’s room, apartment, or house |
| 336 | Staying or living in a friend’s room, apartment, or house |
| 410 | Rental by client, no ongoing housing subsidy |
| 411 | Owned by client, no ongoing housing subsidy |
| 419 | Rental by client - VASH housing subsidy |
| 420 | Rental by client - Other ongoing subsidy |
| 421 | Owned by client, with ongoing housing subsidy |
| 428 | Rental by client - GPD TIP housing subsidy |
| 431 | Rental by client - RRH or equivalent subsidy |
| 433 | Rental by client - HCV voucher (tenant or project based) (not dedicated) |
| 434 | Rental by client - Public housing unit |
| 436 | Rental by client - Emergency Housing Voucher |
| 437 | Rental by client - Family Unification Program Voucher (FUP) |
| 438 | Rental by client - Foster Youth to Independence Initiative (FYI) |
| 439 | Rental by client - Permanent Supportive Housing |
| 440 | Rental by client - Other permanent housing dedicated for formerly homeless persons |

## EST/RRH/PSHDestination – LSAHousehold 

### Relevant Data

#### Source

| **tlsa_Household** |
|--------------------|
| HoHID              |
| HHType             |
| EST/RRH/PSHStatus  |
| **tlsa_HHID**      |
| HoHID              |
| ActiveHHType       |
| Active             |
| ExitDate           |
| ExitDest           |
| LSAProjectType     |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **tlsa_Household** |
|--------------------|
| **ESTDestination** |
| **RRHDestination** |
| **PSHDestination** |

### Logic

See section [3.3 HMIS Household Enrollments](#exitdest) for logic
associated with setting destination for individual enrollments.

Set **xDestination** = -1 for households not served in project group and
households enrolled in project group at <u>ReportEnd</u> (**xStatus**
not in (12,22)).

For households that exited the project group during the report period
(**xStatus** in (12,22)), **xDestination** is based on the active
enrollment with the most recent **ExitDate** for the project group using
the tlsa_HHID.**ExitDest** value.

## EST/RRH/PSH Population Identifiers 

### Relevant Data

#### Source

| **tlsa_HHID**  |
|----------------|
| HoHID          |
| LSAProjectType |
| ActiveHHType   |
| HHChronic      |
| HHVet          |
| HHDisability   |
| HHFleeingDV    |
| HHAdultAge     |
| HHParent       |
| AC3Plus        |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **tlsa_Household**        |
|---------------------------|
| **EST/RRH/PSHChronic**    |
| **EST/RRH/PSHVet**        |
| **EST/RRH/PSHDisability** |
| **EST/RRH/PSHFleeingDV**  |
| **EST/RRH/PSHAC3Plus**    |
| **EST/RRH/PSHAdultAge**   |
| **EST/RRH/PSHParent**     |

### Logic

In section 6.2, a household is included in any given population as long
as at least one active **HouseholdID** with the same
**HoHID**/**ActiveHHType** meets the criteria.

The population identifiers listed here use similar logic, but are
specific to project group – they are only set if there is a record in
tlsa_HHID for the **HoHID**/**ActiveHHType** and the project type is
consistent with the relevant project group:

- EST – LSAProjectType in (0,1,2,8)

- RRH – LSAProjectType = 13

- PSH – LSAProjectType = 3

There are no project-group-specific columns for **HoHRaceEthnicity** as
it is not subject to change with household composition.

#### EST/RRH/PSHAC3Plus

For records in tlsa_Household where **HHType** = 2 and **HHChild** = 3,
set **EST/RRH/PSHAC3Plus** to 1 if there is any active **HouseholdID**
in tlsa_HHID for the **HoHID** where **ActiveHHType** = **2** and
**AC3Plus** = 1 and **LSAProjectType** is consistent with the project
group. For all other records, set to 0.

#### EST/RRH/PSHVet

If there is any active **HouseholdID** for the **HoHID** where
**ActiveHHType** = **HHType** and **HHVet** = 1 and **LSAProjectType**
is consistent with the project group, set the value for
**EST/RRH/PSHVet** to 1. Otherwise, set to 0.

#### EST/RRH/PSHChronic

If there is any active **HouseholdID** for the **HoHID** where
**ActiveHHType** = **HHType** and **HHChronic** = 1 and
**LSAProjectType** is consistent with the project group, set the value
for **EST/RRH/PSHChronic** to 1. Otherwise, set to 0.

#### EST/RRH/PSHDisability

If there is any active **HouseholdID** for the **HoHID** where
**ActiveHHType** = **HHType** and **HHDisability** = 1 and
**LSAProjectType** is consistent with the project group, set the value
for **EST/RRH/PSHDisability** to 1. Otherwise, set to 0.

#### EST/RRH/PSHFleeingDV

Set **EST/RRH/PSHFleeingDV** to the first value in the table below that
occurs in tlsa_HHID.**HHFleeingDV** for the same **HoHID** where
**ActiveHHType** = **HHType** and **LSAProjectType** is consistent with
the project group:

| Priority | HHFleeingDV Value |
|----------|-------------------|
| 1        | 1                 |
| 2        | 2                 |
| 3        | 0                 |

#### EST/RRH/PSHParent

If there is any active HHID for the **HoHID** where **ActiveHHType** =
**HHType** and **HHParent** = 1 and **LSAProjectType** is consistent
with the project group, set the value for **EST/RRH/PSHParent** to 1.
Otherwise, set to 0.

#### EST/RRH/PSHAdultAge 

Set **EST/RRH/PSHAdultAge** based on the first of the criteria below met
by any active HHID record for the relevant project group with the same
**HoHID** where **ActiveHHType** = **HHType**:

| Priority | tlsa_HHID           | EST/RRH/PSHAdultAge |
|----------|---------------------|---------------------|
| 1        | **HHAdultAge** = 18 | 18                  |
| 2        | **HHAdultAge** = 24 | 24                  |
| 3        | **HHAdultAge** = 55 | 55                  |
| 4        | **HHAdultAge** = 25 | 25                  |
| 5        | (any other)         | -1                  |

## System Engagement Status and Return Time

### Relevant Data

#### Source

| **tlsa_Household** |
|--------------------|
| HoHID              |
| HHType             |
| **tlsa_HHID**      |
| HoHID              |
| EntryDate          |
| ExitDate           |
| ExitDest           |
| ActiveHHType       |
| EnrollmentID       |
| Active             |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **tlsa_Household**   |
|----------------------|
| **FirstEntry**       |
| **Stat**             |
| **StatEnrollmentID** |
| **ReturnTime**       |

### Logic

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

#### FirstEntry 

A household’s **FirstEntry** is the earliest *EntryDate* associated with
any active enrollment.

#### Previous Activity / StatEnrollmentID

**StatEnrollmentID** is the tlsa_HHID.**EnrollmentID** with the most
recent (effective) **ExitDate** where:

- **HoHID** = tlsa_Household.**HoHID**

- **ActiveHHType** = tlsa_Household.**HHType**

- **ExitDate** for the earlier enrollment \>= <u>\[</u>**FirstEntry** –
  730 days\] and tlsa_HHID.**ExitDate** \< **FirstEntry**

#### ReturnTime

If StatEnrollmentID is NULL, **ReturnTime** = -1

Otherwise, set **ReturnTime** based on the number of days between
StatEnrollmentID.**ExitDate** and **FirstEntry**:

| Value | Category     |
|-------|--------------|
| -1    | 0-14 days    |
| 30    | 15-30 days   |
| 60    | 31-60 days   |
| 90    | 61-90 days   |
| 180   | 91-180 days  |
| 365   | 181-365 days |
| 547   | 366-547 days |
| 730   | 548-730 days |

#### Stat

If **FirstEntry** \< <u>ReportStart</u>, **Stat** = 5 – the active
enrollment is part of a period of continuous engagement with the
continuum that began prior to the report period. This will include any
household whose **EST**/**RRH**/**PSHStatus** is either 11 or 12, which
indicate entry prior to the start of the report period

If **FirstEntry** \>= <u>ReportStart</u>, it is necessary to look for
inactive enrollments for the household in the two years prior to
determine status.

Stat is based on **StatEnrollmentID** (if any) and the associated
**ExitDate** and **ExitDest**.

| Stat | Category | ExitDest | Other Condition |
|----|----|----|----|
| 1 | First-time homeless | (n/a) | **StatEnrollmentID** is NULL |
| 2 | Return 15-730 days after exit to permanent destination | Between 400 and 499 | **ReturnTime** between 15 and 730 |
| 3 | Re-engage 15-730 days after exit to temporary destination | Between 100 and 399 | **ReturnTime** between 15 and 730 |
| 4 | Re-engage 15-730 days after exit to other/unknown destination | \< 100 | **ReturnTime** between 15 and 730 |
| 5 | Continuous engagement with continuum | (n/a) | **StatEnrollmentID** is not NULL and **ReturnTime** = -1 |

## RRHPreMoveInDays – LSAHousehold

### Relevant Data

#### Source

| **tlsa_Household** |
|--------------------|
| HoHID              |
| HHType             |
| **tlsa_HHID**      |
| HoHID              |
| ActiveHHType       |
| LSAProjectType     |
| EntryDate          |
| MoveInDate         |
| ExitDate           |
| Active             |

#### Target

<table>
<colgroup>
<col style="width: 27%" />
<col style="width: 72%" />
</colgroup>
<thead>
<tr>
<th><strong>tlsa_Household</strong></th>
<th><strong>Column Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>RRHPreMoveInDays</strong></td>
<td><p>Counts of actual days are set in tlsa_Household; counts of active
households are grouped by ranges – e.g., ‘1-7 days’, ‘8-30 days’, etc. –
in the corresponding <strong>LSAHousehold</strong> column.</p>
<p>Averages based on the counts of actual days are inserted to
LSACalculated. (See section <a
href="#get-average-days-for-length-of-time-in-rrh-projects">8.4 Get
Average Days for Length of Time in RRH Projects</a>.)</p></td>
</tr>
</tbody>
</table>

### Logic

The logic associated with the LSAHousehold.**RRHPreMoveInDays** column
differs from others that count days engaged in various parts of the
system, referred to collectively as ‘system use days.’ The other counts
resolve potential data conflicts so that each day has a single status
and is counted only once. For example, days spent in RRH prior to
move-in that overlap with days in emergency shelter are counted as ES
days.

The **RRHPreMoveInDays** column is a count of distinct dates when a
household was enrolled in an RRH housing project but not housed,
regardless of other system use data.

For each active HHID where **HoHID**/**ActiveHHType** = tlsa_Household.
**HoHID**/**HHType** and **LSAProjectType** = 13, set
**RRHPreMoveInDays** = a count of the distinct dates between any
tlsa_HHID.**EntryDate** and the earliest associated non-NULL value for:

- MoveInDate – 1 day

- ExitDate

- ReportEnd

## Dates Housed in PSH or RRH (sys_Time)

The primary key for sys_Time is the unique combination of **HoHID**,
**HHType**, and **sysDate** – i.e., no date can be counted with more
than one status for any given LSA household.

### Relevant Data

#### Source

| **tlsa_Household** |
|--------------------|
| HoHID              |
| HHType             |
| **tlsa_HHID**      |
| HoHID              |
| ActiveHHType       |
| LSAProjectType     |
| MoveInDate         |
| ExitDate           |
| Active             |

#### Target

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<thead>
<tr>
<th><strong>sys_Time</strong></th>
<th><strong>Column Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>HoHID</strong></td>
<td><blockquote>
<p>HoHID – tlsa_Household</p>
</blockquote></td>
</tr>
<tr>
<td><strong>HHType</strong></td>
<td><blockquote>
<p>HHType – tlsa_Household</p>
</blockquote></td>
</tr>
<tr>
<td><strong>sysDate</strong></td>
<td><blockquote>
<p>Distinct dates enrolled in a continuum project and/or Street/ES/SH
dates from <em>3.917 Living Situation</em></p>
</blockquote></td>
</tr>
<tr>
<td><strong>sysStatus</strong></td>
<td><p>This step identifies dates when the household was:</p>
<ul>
<li><p>1 = Housed in PSH</p></li>
<li><p>2 = Housed in RRH</p></li>
</ul>
<p>Subsequent steps identify dates:</p>
<ul>
<li><p>3 = In TH</p></li>
<li><p>4 = In ES/SH</p></li>
<li><p>5 = In PSH pre-move-in</p></li>
<li><p>6 = In RRH pre-move-in</p></li>
<li><p>7 = Street/ES/SH (3.917)</p></li>
</ul></td>
</tr>
</tbody>
</table>

### Logic

LSAHousehold includes counts of the total number of days that a head of
household was either homeless and/or engaged in various parts of the
system, referred to collectively as ‘system use days.’ The counts are
grouped by the client’s system status – i.e., ‘Days in TH’ or ‘Days
Housed in PSH’ – on each relevant date.

Similar to the process of counting days for chronic homelessness, a head
of household’s system use status for any given date is assigned in
priority order, using the *first* status from the list below for which
the HoH meets the identified criteria based on values in tlsa_HHID and,
for night-by-night enrollments, bed night dates in hmis_Services.

<table>
<colgroup>
<col style="width: 10%" />
<col style="width: 33%" />
<col style="width: 56%" />
</colgroup>
<thead>
<tr>
<th>Priority</th>
<th>Status</th>
<th>[Date]</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>Housed in PSH</td>
<td><p>&gt;= <strong>MoveInDate</strong> and</p>
<p>&lt;= The first non-NULL of (<strong>ExitDate</strong> – 1 day) or
<u>ReportEnd</u></p></td>
</tr>
<tr>
<td>2</td>
<td>Housed in RRH</td>
<td><em>=</em> <strong>MoveInDate</strong></td>
</tr>
<tr>
<td>2</td>
<td>Housed in RRH</td>
<td><p>&gt; <strong>MoveInDate</strong> and</p>
<p>&lt;= The first non-NULL of (<strong>ExitDate</strong> – 1 day) or
<u>ReportEnd</u></p></td>
</tr>
<tr>
<td>3</td>
<td>In TH</td>
<td><p>&gt;= <strong>EntryDate</strong> and</p>
<p>&lt;= The first non-NULL of (<strong>ExitDate</strong> – 1 day) or
<u>ReportEnd</u></p></td>
</tr>
<tr>
<td>4</td>
<td>In entry-exit ES/SH</td>
<td><p>&gt;= <strong>EntryDate</strong> and</p>
<p>&lt;= The first non-NULL of (<strong>ExitDate</strong> – 1 day) or
<u>ReportEnd</u></p></td>
</tr>
<tr>
<td>4</td>
<td>In night-by-night ES</td>
<td>= <em>BedNightDate</em></td>
</tr>
<tr>
<td>5</td>
<td>Enrolled but not housed in PSH</td>
<td><p>&gt;= <em>EntryDate</em> and</p>
<p>&lt;= The first non-NULL of (<em>MoveInDate</em> – 1 day<em>),
ExitDate,</em> and <u>ReportEnd</u></p></td>
</tr>
<tr>
<td>6</td>
<td>Enrolled but not housed in RRH</td>
<td><p>&gt;= <em>EntryDate</em> and</p>
<p>&lt;= The first non-NULL of (<em>MoveInDate</em> – 1 day<em>),
ExitDate,</em> and <u>ReportEnd</u></p></td>
</tr>
<tr>
<td>7</td>
<td>Street/ES/SH (3.917)</td>
<td>&gt;= <em>DateToStreetESSH</em> and &lt; <em>EntryDate</em></td>
</tr>
</tbody>
</table>

In the CH process, enrollment dates are relevant regardless of household
type or head of household status for the enrollment. However, system use
days for a household are only counted for enrollments where the two
defining characteristics of a household – **HoHID** and **ActiveHHType**
– match tlsa_Household.

#### Dates Housed in PSH 

Dates housed in PSH are counted only for active enrollments.

For each **HoHID**/**HHType** in tlsa_Household, create a record with a
**sysStatus** = 1 in sys_Time for any \[Date\] \<= <u>ReportEnd</u>
where:

- tlsa_HHID.**HoHID =** tlsa_Household**.HoHID;** and

- tlsa_HHID.**ActiveHHType** = tlsa_Household.**HHType**; and

- tlsa_HHID.**Active** = 1; and

- tlsa_HHID.**LSAProjectType** = 3; and

- tlsa_HHID.**MoveInDate** \<= \[Date\]; and

- tlsa_HHID.**ExitDate** \> \[Date\] or is NULL

#### Dates Housed in RRH 

Dates housed in RRH are counted only for active enrollments. As noted in
section 3.3 ([HMIS Data Requirements and
Assumptions](#RRHMoveInOnExitDate)) and reflected in the criteria listed
below, the *MoveInDate* for an RRH enrollment is counted as a date
housed even if it is equal to the *ExitDate*.

For each **HoHID**/**HHType** in tlsa_Household, create a record with a
**sysStatus** = 2 in sys_Time for any \[Date\] \<= <u>ReportEnd</u>
where:

- There is no existing record for the **HoHID**/**HHType**/**Date** in
  sys_Time (i.e., the household was not housed in PSH on the date); and

- tlsa_HHID.**HoHID =** tlsa_Household**.HoHID;** and

- tlsa_HHID.**ActiveHHType** = tlsa_Household.**HHType**; and

- tlsa_HHID.**Active** = 1; and

- LSAProjectType = 13; and

- **MoveInDate** \<= \[Date\]; and

- **ExitDate** \> \[Date\] or is NULL

## Get Last Inactive Date 

This step identifies, based on active enrollments and potentially
relevant inactive enrollments, the date immediately prior to the first
day of continuous system engagement for which all system use days are
counted – or the household’s last inactive date.

Specifically, this is the latest date in the most recent period of at
least seven nights during which a household was not enrolled in a
continuum ES, SH, TH, RRH, or PSH project AND was not housed in RRH or
PSH. This is the date after which all system use days are reportable.

RRH-SO enrollments are not relevant to **LastInactive**.

### RelevantData

#### Source

| **tlsa_Household**                                       |
|----------------------------------------------------------|
| HoHID                                                    |
| HHType                                                   |
| FirstEntry                                               |
| **tlsa_HHID**                                            |
| HoHID                                                    |
| ActiveHHType                                             |
| EntryDate                                                |
| ExitDate                                                 |
| **hmis_Services**                                        |
| EnrollmentID                                             |
| *BedNightDate* (*DateProvided* where *RecordType* = 200) |

#### Targets

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 80%" />
</colgroup>
<thead>
<tr>
<th><strong>sys_TimePadded</strong></th>
<th><strong>Column Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><blockquote>
<p><strong>HoHID</strong></p>
</blockquote></td>
<td><blockquote>
<p>From tlsa_Household</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p><strong>HHType</strong></p>
</blockquote></td>
<td><blockquote>
<p>From tlsa_Household</p>
</blockquote></td>
</tr>
<tr>
<td><blockquote>
<p><strong>StartDate</strong></p>
</blockquote></td>
<td><ul>
<li><p>For tlsa_HHID <strong>EnrollmentID</strong>s in night-by-night
ES, each <em>BedNightDate</em> associated with the enrollment between
LookbackDate and <u>ReportEnd</u></p></li>
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
<u>ReportEnd</u></p></li>
<li><p>For all other tlsa_HHID enrollments, the earlier non-NULL of
[<strong>ExitDate</strong> + 6 days] or <u>ReportEnd</u></p></li>
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
<th><strong>tlsa_Household</strong></th>
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

**LastInactive** is the later of <u>\[LookbackDate – 1 day\]</u> and the
most recent date where:

- \[Date\] \< tlsa_Household.**FirstEntry**

- \[Date\] is not between a *BedNightDate* and (*BedNightDate* + 6 days)
  for any enrollment – active or inactive -- in tlsa_HHID where
  **ActiveHHType** = tlsa_Household.**HHType**

  - Note that a *BedNightDate* must be valid – i.e., \>= **EntryDate**
    for the associated enrollment and \< **ExitDate** if there is one –
    in order to be relevant. In systems that allow the creation of
    invalid bed night data, report code must exclude those records.

- \[Date\] is not between a tlsa_HHID.**EntryDate** and the associated
  (**ExitDate** + 6 days) for any enrollment – active or inactive -- in
  tlsa_HHID where **ActiveHHType** = tlsa_Household.**HHType**

## Get Dates of Other System Use (sys_Time)

### Relevant Data

#### Source

| **tlsa_Household**                                       |
|----------------------------------------------------------|
| HoHID                                                    |
| HHType                                                   |
| LastInactive                                             |
| **tlsa_HHID**                                            |
| HoHID                                                    |
| ActiveHHType                                             |
| LSAProjectType                                           |
| EntryDate                                                |
| MoveInDate                                               |
| ExitDate                                                 |
| **hmis_Services**                                        |
| EnrollmentID                                             |
| *BedNightDate* (*DateProvided* where *RecordType* = 200) |

#### Target

See section [6.11 Dates Housed in PSH or
RRH](#dates-housed-in-psh-or-rrh-sys_time) for column descriptions.

| **sys_Time**  |
|---------------|
| **HoHID**     |
| **HHType**    |
| **sysDate**   |
| **sysStatus** |

### Logic

In order to create a record in sys_Time for a household on any given
\[Date\], the following must be true:

- \[Date\] is not in sys_Time for the same **HoHID**/**HHType;** and

- \[Date\] \> tlsa_Household.**LastInactive**; and

- \[Date\] \<= <u>ReportEnd</u>.

The **sysStatus** values referenced in the next sections are based on
project type:

| Value | Category                        |
|-------|---------------------------------|
| 3     | In transitional housing         |
| 4     | In emergency shelter/Safe Haven |
| 5     | Enrolled but not housed in PSH  |
| 6     | Enrolled but not housed in RRH  |

If a \[Date\] meets the criteria for more than one **sysStatus** based
on the list below, use the **sysStatus** with the lowest value. For
example, if a client has overlapping enrollments in both an emergency
shelter (**sysStatus** = 4) and a transitional housing project
(**sysStatus** = 3) on a single date, the **sysStatus** for that date
should be the lower of the two values (3).

<table>
<colgroup>
<col style="width: 8%" />
<col style="width: 91%" />
</colgroup>
<thead>
<tr>
<th>Value</th>
<th>Criteria</th>
</tr>
</thead>
<tbody>
<tr>
<td>3</td>
<td><p><strong>LSAProjectType</strong> = 2 and</p>
<p>[Date] &gt;= <strong>EntryDate</strong> and</p>
<p>[Date] &lt;= the first non-NULL of [<strong>ExitDate</strong> – 1
day] and <u>ReportEnd</u></p></td>
</tr>
<tr>
<td>4</td>
<td><p><strong>LSAProjectType</strong> in (0,8) and</p>
<p>[Date] &gt;= <strong>EntryDate</strong> and</p>
<p>[Date] &lt;= the first non-NULL of [<strong>ExitDate</strong> – 1
day] and <u>ReportEnd</u></p></td>
</tr>
<tr>
<td>4</td>
<td><p><strong>LSAProjectType</strong> = 1 and</p>
<p>[Date] = <em>BedNightDate</em></p></td>
</tr>
<tr>
<td>5</td>
<td><p><strong>LSAProjectType</strong> = 3 and</p>
<p>[Date] &gt;= <strong>EntryDate</strong> and</p>
<p>[Date] &lt; <strong>MoveInDate</strong></p></td>
</tr>
<tr>
<td>5</td>
<td><p><strong>LSAProjectType</strong> = 3 and</p>
<p>[Date] &gt;= <strong>EntryDate</strong> and</p>
<p><strong>MoveInDate</strong> is NULL and</p>
<p>[Date] &lt;= the first non-NULL of [<strong>ExitDate</strong> – 1
day] and <u>ReportEnd</u></p></td>
</tr>
<tr>
<td>6</td>
<td><p><strong>LSAProjectType</strong> = 13 and</p>
<p>[Date] &gt;= <strong>EntryDate</strong> and</p>
<p>[Date] &lt; <strong>MoveInDate</strong></p></td>
</tr>
<tr>
<td>6</td>
<td><p><strong>LSAProjectType</strong> = 13 and</p>
<p>[Date] &gt;= <strong>EntryDate</strong> and</p>
<p><strong>MoveInDate</strong> is NULL and</p>
<p>[Date] &lt;= the first non-NULL of [<strong>ExitDate</strong> – 1
day] and <u>ReportEnd</u></p></td>
</tr>
</tbody>
</table>

## Get Other Dates Homeless from 3.917A/B Living Situation

Dates that are documented as Street/ES/SH dates in *3.917 Living
Situation*, do not have a status based on system use, and are contiguous
to the period of continuous engagement should be counted as Street/ES/SH
dates for LOTH reporting. Unlike system use, this may include both dates
prior to **LastInactive** and dates prior to LookbackDate**.**

### Relevant Data

#### Source

| **tlsa_Household**  |
|---------------------|
| LastInactive        |
| HoHID               |
| HHType              |
| **tlsa_HHID**       |
| HoHID               |
| ActiveHHType        |
| EnrollmentID        |
| LSAProjectType      |
| EntryDate           |
| ExitDate            |
| **sys_Time**        |
| HoHID               |
| HHType              |
| sysDate             |
| **hmis_Enrollment** |
| EnrollmentID        |
| EntryDate           |
| LivingSituation     |
| LengthOfStay        |
| PreviousStreetESSH  |
| DateToStreetESSH    |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **tlsa_Household** |
|--------------------|
| **Other3917Days**  |

### Logic

For any active enrollment or any **EnrollmentID** from tlsa_HHID where
**HoHID**/**EntryHHType** = tlsa_Household.**HoHID**/**HHType** and:

- **EntryDate** *\>* **LastInactive**; and

- *DateToStreetESSH* \< **EntryDate**; and

  - *LivingSituation* in (101,118,116); or

  - **LSAProjectType** in (0,1,8); or

  - *LengthOfStay* in (10, 11) and *PreviousStreetESSH* = 1; or

  - *LivingSituation* in (204,205,206,207,215,225) and *LengthOfStay* in
    (2,3) and *PreviousStreetESSH* = 1

    The value of **Other3917Days** is equal to the count of all dates:

- Between the later of *DateToStreetESSH* or **LastInactive** and the
  day prior to the associated **EntryDate** where the date does not
  already have a status based on system use.

- Between any *DateToStreetESSH* and the day prior to **LastInactive**
  where the associated **EntryDate** is \> **LastInactive**.

## Set System Use Days for LSAHousehold

Counts of actual days are set in tlsa_Household; counts of active
households are grouped by ranges – e.g., ‘1-7 days’, ‘8-30 days’, etc. –
in the corresponding **LSAHousehold** column.

The values in tlsa_Household are the source for averages in
LSACalculated; see section [8.1 Get Average Days for Length of Time
Homeless](#get-average-days-for-length-of-time-homeless) through section
8.8.

### Relevant Data

#### Source

| **sys_Time** |
|--------------|
| HoHID        |
| HHType       |
| sysDate      |
| sysStatus    |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **Tlsa_Household**         |
|----------------------------|
| **ESDays**                 |
| **THDays**                 |
| **ESTDays**                |
| **RRHPSHPreMoveInDays**    |
| **RRHHousedDays**          |
| **SystemDaysNotPSHHoused** |
| **SystemHomelessDays**     |
| **Other3917Days**          |
| **TotalHomelessDays**      |
| **PSHHousedDays**          |

### Logic

The values for system use days columns in tlsa_Household should be set
to the actual number of days counted and NOT the associated upload
value; the actual number of days are needed to generate averages for
LSACalculated.

#### ESDays

This is the total number of days in emergency shelter or Safe Haven for
active enrollments and inactive enrollments that fall within a period of
continuous system engagement that extends into the report period. ES
days are not counted if conflicting enrollment data shows that the
household was housed in RRH/PSH or enrolled in a transitional housing
project.

Set **ESDays** = count of distinct **sysDate**s in sys_Time where
**sysStatus** = 4 and **HoHID/HHType** = tlsa_Household
**HoHID/HHType.**

#### THDays

This is the total number of days in transitional housing for active
enrollments and inactive enrollments that fall within a period of
continuous system engagement that extends into the report period. TH
days are not counted if conflicting enrollment data shows that the
household was housed in RRH/PSH.

Set **THDays** = count of distinct **sysDate**s in sys_Time where
**sysStatus** = 3 and **HoHID/HHType** = tlsa_Household
**HoHID/HHType.**

#### ESTDays

This is the total number of days in emergency shelter, Safe Haven,
and/or transitional housing – **ESDays** + **THDays**.

Set **ESTDays** = count of distinct **sysDate**s in sys_Time where
**sysStatus** in (3,4) and **HoHID/HHType** = tlsa_Household
**HoHID/HHType.**

#### RRHPSHPreMoveInDays

This is the total number of days enrolled but not housed in RRH Housing
and/or PSH projects for active enrollments and for inactive RRH/PSH
enrollments *without move-in dates* that fall within a period of
continuous system engagement that extends into the report period.
Pre-move-in days are not counted if conflicting enrollment data shows
that the household was housed in RRH/PSH, enrolled in a transitional
housing project, or in emergency shelter or Safe Haven.

Set **RRHPSHPreMoveInDays** = count of distinct **sysDate**s in sys_Time
where **sysStatus** in (5,6) and **HoHID/HHType** = tlsa_Household
**HoHID/HHType.**

#### SystemHomelessDays

This is the total number of days in emergency shelter, Safe Haven,
transitional housing, and/or enrolled but not housed in RRH/PSH –
**ESTDays + RRHPSHPreMoveInDays**.

Set **SystemHomelessDays** = count of distinct **sysDate**s in sys_Time
where **sysStatus** in (3,4,5,6) and **HoHID/HHType** = tlsa_Household
**HoHID/HHType.**

#### RRHHousedDays

This is the total number of days housed in RRH Housing projects for
active enrollments. RRH housed days are not counted if conflicting
enrollment data shows that the household was housed in PSH.

Set **RRHHousedDays** = count of distinct **sysDate**s in sys_Time where
**sysStatus** = 2 and **HoHID/HHType** = tlsa_Household
**HoHID/HHType.**

#### SystemDaysNotPSHHoused

This is the total number of days in emergency shelter, Safe Haven,
transitional housing, enrolled but not housed in RRH/PSH and/or housed
in RRH – **SystemHomelessDays** **+ RRHHousedDays**.

Set **SystemDaysNotPSHHoused**= count of distinct **sysDate**s in
sys_Time where **sysStatus** in (2,3,4,5,6) and **HoHID/HHType** =
tlsa_Household **HoHID/HHType.**

#### PSHHousedDays

This is the total number of days housed in PSH for active enrollments.

Set **PSHHHousedDays** = count of distinct **sysDate**s in sys_Time
where **sysStatus** = 1 and **HoHID/HHType** = tlsa_Household
**HoHID/HHType.**

#### Other3917Days

This is the total number of days not already accounted for when the
household reported being on the street or in ES/SH in *3.917A/B Prior
Living Situation*.

Set **Other3917Days** = the sum of:

- The count of distinct **sysDate**s in sys_Time where **sysStatus** = 7
  and **HoHID/HHType** = tlsa_Household **HoHID/HHType;** and

- The count of distinct dates between the earliest relevant
  *DateToStreetESSH* and **LastInactive** – or the difference in days
  between the earliest *DateToStreetESSH* and **LastInactive**, as
  described in [section
  6.14](#get-other-dates-homeless-from-3.917ab-living-situation).

## Update EST/RRH/PSH/RRHSOStatus

For any **HoHID**/**HHType** in tlsa_Household where **Stat** = 5
(continuous engagement), the household may have system use days from
prior to the report period for project types other than those from the
report period. This step updates the values for EST/RRH/PSHStatus to
reflect that.

### Relevant Data

#### Source

| **tlsa_Household** |
|--------------------|
| HoHID              |
| HHType             |
| ESTStatus          |
| RRHStatus          |
| PSHStatus          |
| **sys_Time**       |
| HoHID              |
| HHType             |
| sysStatus          |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **tlsa_Household** |
|--------------------|
| **ESTStatus**      |
| **RRHStatus**      |
| **PSHStatus**      |

### Logic

Set **ESTStatus** = 2 (Served in contiguous period prior to report start
only) where:

- **ESTStatus** = 0 and

- Any record in sys_Time for the **HoHID**/**HHType** has a
  **sysStatus** in (3,4)

Set **RRHStatus** = 2 (Served in contiguous period prior to report start
only) where:

- **RRHStatus** = 0 and

- Any record in sys_Time for the **HoHID**/**HHType** has a
  **sysStatus** = 6

Set **PSHStatus** = 2 (Served in contiguous period prior to report start
only) where:

- **PSHStatus** = 0 and

- Any record in sys_Time for the **HoHID**/**HHType** has a
  **sysStatus** = 5

## Set EST/RRH/PSHAIR

The EST/RRH/PSHAIR columns identify households active in residence
during the report period. RRH-SO enrollments are not relevant to AIR
status.

### Relevant Data

#### Source

| **tlsa_Household** |
|--------------------|
| HoHID              |
| HHType             |
| **tlsa_HHID**      |
| HoHID              |
| ActiveHHType       |
| AIR                |
| LSAProjectType     |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
descriptions.

| **Tlsa_Household** |
|--------------------|
| ESTAIR             |
| RRHAIR             |
| PSHAIR             |

### Logic

Set **EST/RRH/PSHAIR** = 1 for tlsa_Household records with one or more
records in tlsa_HHID where:

- tlsa_HHID.**AIR** = 1

- tlsa_HHID.**ActiveHHType** = tlsa_Household.**HHType**; and

- tlsa_HHID.**HoHID** = tlsa_Household.**HoHID**; and

- Project type is consistent with project group:

<!-- -->

- EST - **LSAProjectType** in (0,1,2,8)

- RRH - LSAProjectType = 13

- PSH - LSAProjectType = 3

For households with no bed nights in the report period in a given
project group, set the value to 0.

## Set SystemPath for LSAHousehold

The **SystemPath** column is technically redundant – it is based
entirely on values in other LSAHousehold columns – but having the value
in a single column simplifies the processes of populating LSACalculated
and, in the HDX 2.0, generating report tables.

RRH-SO enrollments are not relevant to System Path.

### Relevant Data

#### Source

| **tlsa_Household** |
|--------------------|
| ESTStatus          |
| ESDays             |
| THDays             |
| RRHStatus          |
| PSHStatus          |
| PSHMoveIn          |

#### Target

See section [6.1 Get Distinct Households for
LSAHousehold](#get-distinct-households-for-lsahousehold) for column
description.

| **Tlsa_Household** |
|--------------------|
| **SystemPath**     |

### Logic

As noted previously, heads of household housed in PSH at
<u>ReportStart</u> who did not enroll in any other project types during
the report period are excluded from all reporting on LOTH and system
path, as are those who were only served in RRH-SO. For those households,
**SystemPath** is always set to -1. The criteria for all values are
listed below.

<table style="width:99%;">
<colgroup>
<col style="width: 18%" />
<col style="width: 11%" />
<col style="width: 13%" />
<col style="width: 8%" />
<col style="width: 9%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th>Name</th>
<th>SystemPath</th>
<th>ESTStatus</th>
<th>ESDays</th>
<th>THDays</th>
<th>RRHStatus</th>
<th>PSHStatus</th>
<th>PSHMoveIn</th>
</tr>
</thead>
<tbody>
<tr>
<td>Not applicable</td>
<td>-1</td>
<td>Not in (21,22)</td>
<td>--</td>
<td>--</td>
<td>Not in (21,22)</td>
<td>--</td>
<td>= 2</td>
</tr>
<tr>
<td>ES/SH only</td>
<td>1</td>
<td>--</td>
<td>&gt;= 1</td>
<td>= 0</td>
<td>= 0</td>
<td>= 0</td>
<td>--</td>
</tr>
<tr>
<td>TH only</td>
<td>2</td>
<td>--</td>
<td>= 0</td>
<td>&gt;= 1</td>
<td>= 0</td>
<td>= 0</td>
<td>--</td>
</tr>
<tr>
<td>ES/SH + TH</td>
<td>3</td>
<td>--</td>
<td>&gt;= 1</td>
<td>&gt;= 1</td>
<td>= 0</td>
<td>= 0</td>
<td>--</td>
</tr>
<tr>
<td>RRH only</td>
<td>4</td>
<td>= 0</td>
<td>--</td>
<td>--</td>
<td>&gt;= 11</td>
<td>= 0</td>
<td>--</td>
</tr>
<tr>
<td>ES/SH + RRH</td>
<td>5</td>
<td>--</td>
<td>&gt;= 1</td>
<td>= 0</td>
<td>&gt;= 2</td>
<td>= 0</td>
<td>--</td>
</tr>
<tr>
<td>TH + RRH</td>
<td>6</td>
<td>--</td>
<td>= 0</td>
<td>&gt;= 1</td>
<td>&gt;= 2</td>
<td>= 0</td>
<td>--</td>
</tr>
<tr>
<td>ES/SH + TH + RRH</td>
<td>7</td>
<td>--</td>
<td>&gt;= 1</td>
<td>&gt;= 1</td>
<td>&gt;= 2</td>
<td>= 0</td>
<td>--</td>
</tr>
<tr>
<td>PSH only</td>
<td>8</td>
<td>= 0</td>
<td>--</td>
<td>--</td>
<td>= 0</td>
<td>&gt;= 11</td>
<td>&lt;&gt; 2</td>
</tr>
<tr>
<td>ES/SH + PSH</td>
<td>9</td>
<td>--</td>
<td>&gt;= 1</td>
<td>= 0</td>
<td>= 0</td>
<td>&gt;= 11</td>
<td>&lt;&gt; 2</td>
</tr>
<tr>
<td>ES/SH + PSH</td>
<td>9</td>
<td>In (21,22)</td>
<td>&gt;= 1</td>
<td>= 0</td>
<td>= 0</td>
<td>&gt;= 11</td>
<td>= 2</td>
</tr>
<tr>
<td>ES/SH + RRH + PSH</td>
<td>10</td>
<td>--</td>
<td>&gt;= 1</td>
<td>= 0</td>
<td>&gt;= 2</td>
<td>&gt;= 11</td>
<td>&lt;&gt; 2</td>
</tr>
<tr>
<td>ES/SH + RRH + PSH</td>
<td>10</td>
<td>In (21,22)</td>
<td>&gt;= 1</td>
<td>= 0</td>
<td>In (21,22)</td>
<td>&gt;= 11</td>
<td>= 2</td>
</tr>
<tr>
<td>RRH + PSH</td>
<td>11</td>
<td>= 0</td>
<td>--</td>
<td>--</td>
<td>&gt;= 2</td>
<td>&gt;= 11</td>
<td>&lt;&gt; 2</td>
</tr>
<tr>
<td>RRH + PSH</td>
<td>11</td>
<td>= 0</td>
<td>--</td>
<td>--</td>
<td>In (21,22)</td>
<td>&gt;= 11</td>
<td>= 2</td>
</tr>
<tr>
<td>All other</td>
<td>12</td>
<td colspan="6">(any combination of these columns not specified
above)</td>
</tr>
</tbody>
</table>

## LSAHousehold

LSAHousehold includes 45 columns. **RowTotal** is a count of distinct
combinations of **HoHID** and **HHType** from tlsa_Household, grouped by
the values in all other columns.

In tlsa_Household, the following columns are populated with actual
counts of days because they are needed to generate averages for
LSACalculated:

| **ESDays**                 | **RRHPreMoveInDays**    | **SystemHomelessDays** |
|----------------------------|-------------------------|------------------------|
| **THDays**                 | **RRHPSHPreMoveInDays** | **Other3917Days**      |
| **ESTDays**                | **RRHHousedDays**       | **TotalHomelessDays**  |
| **SystemDaysNotPSHHoused** |                         |                        |

For export, the actual counts are grouped into categories as shown
below.

| Value | System Use/Homeless Days | Criteria                      |
|-------|--------------------------|-------------------------------|
| 0     | 0 days                   | \[Days\] = 0                  |
| 7     | 1-7 days                 | \[Days\] between 1 and 7      |
| 30    | 8-30 days                | \[Days\] between 8 and 30     |
| 60    | 31-60 days               | \[Days\] between 31 and 60    |
| 90    | 61-90 days               | \[Days\] between 61 and 90    |
| 180   | 91-180 days              | \[Days\] between 91 and 180   |
| 365   | 181-365 days             | \[Days\] between 181 and 365  |
| 547   | 366-547 days             | \[Days\] between 366 and 547  |
| 730   | 548-730 days             | \[Days\] between 548 and 730  |
| 1094  | 731-1094 days            | \[Days\] between 731 and 1094 |
| 1095  | 1095 days+               | \[Days\] \> 1094              |

Actual values in the **PSHHousedDays** column also have to be grouped
into upload categories; the groupings differ from those used for the
other columns of system use days:

| Value | Time Housed in PSH | Criteria                                |
|-------|--------------------|-----------------------------------------|
| 0     | None               | **PSHMoveIn** not in (1,2)              |
| 3     | Up to 3 months     | **PSHHousedDays** between 1 and 90      |
| 6     | 3-6 months         | **PSHHousedDays** between 91 and 180    |
| 12    | 6-12 months        | **PSHHousedDays** between 181 and 365   |
| 24    | 12-24 months       | **PSHHousedDays** between 366 and 730   |
| 36    | 25-36 months       | **PSHHousedDays** between 731 and 1095  |
| 48    | 37-48 months       | **PSHHousedDays** between 1096 and 1460 |
| 60    | 49-60 months       | **PSHHousedDays** between 1461 and 1825 |
| 84    | 5-7 years          | **PSHHousedDays** between 1826 and 2555 |
| 120   | 8-10 years         | **PSHHousedDays** between 2556 and 3650 |
| 121   | 10+ years          | **PSHHousedDays** \> 3650               |

All of the columns in LSAHousehold are integers; none may be NULL.

| \#   | Column Name                |
|------|----------------------------|
| 1    | **RowTotal**               |
| 2    | **Stat**                   |
| 3    | **ReturnTime**             |
| 4    | **HHType**                 |
| 5    | **HHChronic**              |
| 6    | **HHVet**                  |
| 7    | **HHDisability**           |
| 8    | **HHFleeingDV**            |
| 9    | **HoHRaceEthnicity**       |
| 11   | **HHAdult**                |
| 12   | **HHChild**                |
| 13   | **HHNoDOB**                |
| 14   | **HHAdultAge**             |
| 15   | **HHParent**               |
| 16   | **ESTStatus**              |
| 17   | **ESTGeography**           |
| 18   | **ESTLivingSit**           |
| 19   | **ESTDestination**         |
| 20   | **RRHStatus**              |
| 21   | **RRHMoveIn**              |
| 22   | **RRHGeography**           |
| 23   | **RRHLivingSit**           |
| 24   | **RRHDestination**         |
| 25   | **RRHPreMoveInDays**       |
| 26   | **PSHStatus**              |
| 27   | **PSHMoveIn**              |
| 28   | **PSHGeography**           |
| 29   | **PSHLivingSit**           |
| 30   | **PSHDestination**         |
| 31   | **PSHHousedDays**          |
| 32   | **ESDays**                 |
| 33   | **THDays**                 |
| 34   | **ESTDays**                |
| 35   | **RRHPSHPreMoveInDays**    |
| 36   | **RRHHousedDays**          |
| 37   | **SystemDaysNotPSHHoused** |
| 38   | **SystemHomelessDays**     |
| 39   | **Other3917Days**          |
| 40   | **TotalHomelessDays**      |
| 41   | **SystemPath**             |
| 42   | **ESTAIR**                 |
| 43   | **RRHAIR**                 |
| 44   | **PSHAIR**                 |
| 45   | **RRHSOStatus**            |
| 46   | **RRHSOMoveIn**            |
| 4547 | **ReportID**               |