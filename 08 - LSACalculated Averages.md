# HMIS Business Logic: LSACalculated Averages

This section is required only if **LSAScope** \<\> 3 (HIC).

As in LSAHousehold, LSAPerson, and LSAExit, records are only included in
LSACalculated if there are records in the raw data that represent the
combination of household type, population, cohort, etc.

- Averages are only included if there is at least one record where the
  value in the source column is greater than zero for at least one
  household represented by the combination of household type,
  population, etc.

- Counts are only included if they are greater than zero.

## LSACalculated Columns

<table>
<colgroup>
<col style="width: 14%" />
<col style="width: 85%" />
</colgroup>
<thead>
<tr>
<th><strong>Column</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Value</td>
<td>The calculated average or count</td>
</tr>
<tr>
<td>Cohort</td>
<td><ul>
<li><p>LSAHousehold averages (rows 1-16) – active cohort (1)</p></li>
<li><p>LSAExit averages (rows 18-36, 63-66, and 101-136) – exit cohorts
(-2, -1, 0)</p></li>
<li><p>Counts of people and households (rows 53-56) – active and 4
point-in-time cohorts (1, 10-13)</p></li>
<li><p>Counts of bed nights (row 57) – active cohort (1)</p></li>
<li><p>Data quality reporting in rows 901-920 – active cohort
(1)</p></li>
</ul></td>
</tr>
<tr>
<td>Universe</td>
<td><ul>
<li><p>LSAExit averages (rows 18-36, 63-66, and 101-136) – the
destination type prior return (2,3,4)</p></li>
<li><p>Counts of people and households by project type (rows 53-57 and
901-920) – project groups (10-18)</p></li>
<li><p>Otherwise, n/a (-1)</p></li>
</ul></td>
</tr>
<tr>
<td>HHType</td>
<td>The household type included in the calculation: All(0), AO (1), AC
(2), CO (3), and UN (99)</td>
</tr>
<tr>
<td>Population</td>
<td>The population/subpopulation included in the calculation; see
section 8.3</td>
</tr>
<tr>
<td>SystemPath</td>
<td><ul>
<li><p>For report rows 1-9, may be -1 (section 8.4) or a value from 1 to
12 (section 8.5)</p></li>
<li><p>Otherwise it is n/a (-1)</p></li>
</ul></td>
</tr>
<tr>
<td>ProjectID</td>
<td><ul>
<li><p>For project-level counts (<strong>Universe</strong> = 10) in rows
53-57 and 901-920, a ProjectID from lsa_Project.</p></li>
<li><p>Must be NULL for all other report rows.</p></li>
</ul></td>
</tr>
<tr>
<td>ReportRow</td>
<td>See Section 8.2</td>
</tr>
<tr>
<td>ReportID</td>
<td>Must match LSAReport.<strong>ReportID</strong></td>
</tr>
</tbody>
</table>

## Report Rows for LSACalculated Averages

All calculated values associated with LSAHousehold (rows 1-16) and
LSAExit (rows 18-36, 63-66, and 101-136) are averages of counts of days.

| Row | Reporting Category | Section |
|---:|----|----|
| 1 | Days in ES/SH | Section 8.4, 8.5 |
| 2 | Days in TH | Section 8.4, 8.5 |
| 3 | Days in ES/SH or TH | Section 8.4, 8.5 |
| 4 | Days homeless before move-in to RRH/PSH | Section 8.4, 8.5 |
| 5 | Days documented in ES/SH, TH, or homeless before move-in | Section 8.4, 8.5 |
| 6 | Days homeless self-reported in 3.917 | Section 8.4, 8.5 |
| 7 | Days homeless total | Section 8.4, 8.5 |
| 8 | Days housed in RRH | Section 8.4, 8.5 |
| 9 | Days documented homeless or housed in RRH (no 3.917) | Section 8.4, 8.5 |
| 10 | Days housed in PSH as of exit date (all exits) | Section 8.6 |
| 11 | Days housed in PSH for households active on last day | Section 8.6 |
| 12 | Days in RRH from start to exit with no move-in date | Section 8.7 |
| 13 | Days in RRH from start to report end for active homeless | Section 8.7 |
| 14 | Days in RRH from start to move-in date for all housed | Section 8.7 |
| 15 | Days in RRH from move-in to exit for housed exiters | Section 8.7 |
| 16 | Days in RRH from move-in to report end for active housed | Section 8.7 |
| 18 | Days to return after exit from ES | Section 8.8 |
| 19 | Days to return after exit from TH | Section 8.8 |
| 20 | Days to return after exit from SH | Section 8.8 |
| 21 | Days to return after exit from RRH (placed in PH) | Section 8.8 |
| 22 | Days to return after exit from PSH (placed in PH) | Section 8.8 |
| 63 | Days to return after exit from RRH (not placed) | Section 8.8 |
| 64 | Days to return after exit from PSH (not placed) | Section 8.8 |
| 65 | Days to return after exit from RRH-SO (placed in PH) | Section 8.8 |
| 66 | Days to return after exit from RRH-SO (not placed in PH) | Section 8.8 |
| 23 | Days to return after exit (all) | Section 8.9 |
| 24 | Days to return after ES/SH only system path | Section 8.10 |
| 25 | Days to return after TH system path | Section 8.10 |
| 26 | Days to return after ES/SH/TH system path | Section 8.10 |
| 27 | Days to return after RRH only system path | Section 8.10 |
| 28 | Days to return after ES/SH/RRH system path | Section 8.10 |
| 29 | Days to return after TH/RRH system path | Section 8.10 |
| 30 | Days to return after ES/SH/TH/RRH system path | Section 8.10 |
| 31 | Days to return after PSH only system path | Section 8.10 |
| 32 | Days to return after ES/SH/PSH system path | Section 8.10 |
| 33 | Days to return after ES/SH/RRH/PSH system path | Section 8.10 |
| 34 | Days to return after RRH/PSH system path | Section 8.10 |
| 35 | Days to return after other system path | Section 8.10 |
| 36 | Days to return after any system path (excludes those housed in PSH on start date) | Section 8.10 |
| 101 | Average days to return after exit to Emergency shelter, including hotel or motel paid for with emergency shelter voucher, Host Home shelter | Section 8.11 |
| 102 | Average days to return after exit to Place not meant for habitation (e.g., a vehicle, an abandoned building, bus/train/subway station/airport or anywhere outside) | Section 8.11 |
| 103 | Average days to return after exit to Safe Haven | Section 8.11 |
| 104 | Average days to return after exit to Psychiatric hospital or other psychiatric facility | Section 8.11 |
| 105 | Average days to return after exit to Substance abuse treatment facility or detox center | Section 8.11 |
| 106 | Average days to return after exit to Hospital or other residential non-psychiatric medical facility | Section 8.11 |
| 107 | Average days to return after exit to Jail, prison, or juvenile detention facility | Section 8.11 |
| 108 | Average days to return after exit to Foster care home or foster care group home | Section 8.11 |
| 109 | Average days to return after exit to Long-term care facility or nursing home | Section 8.11 |
| 110 | Average days to return after exit to Transitional housing for homeless persons (including homeless youth) | Section 8.11 |
| 111 | Average days to return after exit to Staying or living with family, temporary tenure (e.g. room, apartment, or house) | Section 8.11 |
| 112 | Average days to return after exit to Staying or living with friends, temporary tenure (e.g. room, apartment, or house) | Section 8.11 |
| 113 | Average days to return after exit to Hotel or motel paid for without emergency shelter voucher | Section 8.11 |
| 114 | Average days to return after exit to Moved from one HOPWA funded project to HOPWA TH | Section 8.11 |
| 115 | Average days to return after exit to Residential project or halfway house with no homeless criteria | Section 8.11 |
| 116 | Average days to return after exit to Host Home (non-crisis) | Section 8.11 |
| 117 | Average days to return after exit to Rental by client, no ongoing housing subsidy | Section 8.11 |
| 118 | Average days to return after exit to Owned by client, no ongoing housing subsidy | Section 8.11 |
| 119 | Average days to return after exit to VASH housing subsidy | Section 8.11 |
| 120 | Average days to return after exit to Other | Section 8.11 |
| 121 | Average days to return after exit to Owned by client, with ongoing housing subsidy | Section 8.11 |
| 122 | Average days to return after exit to Staying or living with family, permanent tenure | Section 8.11 |
| 123 | Average days to return after exit to Staying or living with friends, permanent tenure | Section 8.11 |
| 124 | Average days to return after exit to Moved from one HOPWA funded project to HOPWA PH | Section 8.11 |
| 125 | Average days to return after exit to GPD TIP housing subsidy | Section 8.11 |
| 126 | Average days to return after exit to RRH or equivalent subsidy | Section 8.11 |
| 127 | Average days to return after exit to HCV voucher (tenant or project based) (not dedicated) | Section 8.11 |
| 128 | Average days to return after exit to Public housing unit | Section 8.11 |
| 129 | Average days to return after exit to Emergency Housing Voucher | Section 8.11 |
| 130 | Average days to return after exit to Family Unification Program Voucher (FUP) | Section 8.11 |
| 131 | Average days to return after exit to Foster Youth to Independence Initiative (FYI) | Section 8.11 |
| 132 | Average days to return after exit to Permanent Supportive Housing | Section 8.11 |
| 133 | Average days to return after exit to Other permanent housing dedicated for formerly homeless persons | Section 8.11 |
| 134 | Average days to return after exit to Deceased | Section 8.11 |
| 135 | Average days to return after exit to destination not provided by client | Section 8.11 |
| 136 | Average days to return after exit with missing/invalid destination | Section 8.11 |

## Populations for Average Days from LSAHousehold and LSAExit

### Populations 

All LSAHousehold and LSAExit report rows must be generated for the nine
populations shown in the table below.

- Length of Time Homeless (rows 1-9) – Section 8.4

- Length of Time Homeless by System Path (rows 1-9) – Section 8.5

- Cumulative Length of Time Housed in PSH (rows 10 and 11) – Section 8.6

- Length of Time in RRH Projects (rows 12-16) – Section 8.7

- Time to Return by Last Project Type (rows 18-22, 63-66) – Section 8.8

- Time to Return by Population (row 23) – Section 8.9

- Time to Return by System Path (rows 24-36) – Section 8.10

- Time to Return by Exit Destination (rows 101-136) – Section 8.11

The **HHType** column indicates the household types for which the
population is relevant.

- Zero (0) represents a count of all records that meet the criteria,
  regardless of household type.

- The value for **HHType** in LSACalculated should use the values shown
  below, based on tlsa_Household.**HHType**.

When a report row is required in LSACalculated for any given population,
values should be produced for all household types listed in the
**HHType** column for the population that occur in LSAHousehold or
LSAExit.

| ID | Population | HHType | Criteria |
|---:|----|----|----|
| 0 | All | 0,1,2,3,99 | All |
| 10 | Youth 18-21 | 1 | **HHAdultAge = 18** |
| 11 | Youth 22-24 | 1 | **HHAdultAge** = 24 |
| 12 | Parenting Youth 18-24 | 2 | **HHParent** = 1 and **HHAdultAge** in (18,24) |
| 13 | Veteran | 0,1,2,99 | **HHVet = 1** |
| 14 | Non-Veteran 25+ | 1 | **HHVet** = 0 and **HHAdultAge** in (25,55) |
| 15 | Chronically Homeless | 0,1,2,3,99 | **HHChronic** = 1 |
| 16 | Long-Term Homeless | 0,1,2,3,99 | **HHChronic** in (1,2) |
| 17 | Annual Inflow Homeless | 0,1,2,3,99 | **HHChronic** in (0,3) |

### Subpopulations

Reporting by subpopulation is limited to the following LSAExit and
LSAHousehold rows:

- Length of Time Homeless (rows 1-9) – Section 8.4

- Time to Return by Population (row 23) – Section 8.9

Those rows are required for each subpopulation in combination with each
of the parent populations in the far-right column below. The only
exceptions to this are for row 23, which is not generated for
subpopulations 21 or 22.

When the parent population is ‘All’ (0), the ID listed below is used. In
combination with other parent populations, the subpopulation ID is a
four digit number – the two digits on the left identify the parent
population and the two on the right identify the subpopulation. For
example, the subpopulation of Chronically Homeless Households
(population 15) Fleeing DV (population 19) is identified as 1519.

| ID | Population | HHType(s) | Criteria | Parent Populations |
|---:|----|----|----|----|
| 15 | Chronically Homeless | 0,1,2,3,99 | **HHChronic** = 1 | 10-14 |
| 18 | Disabled Adult or HoH | 0,1,2,3,99 | **HHDisability** = 1 | 0, 10-14 |
| 19 | Fleeing Domestic Violence | 0,1,2,3,99 | **HHFleeingDV** = 1 | 0, 10-15 |
| 20 | First Time Homeless | 0,1,2,3,99 | **Stat = 1** | 0, 10-15 |
| 21 | Returning After Exit to PH | 0,1,2,3,99 | **Stat** = 2 | 0, 10-15 |
| 22 | PSH Move-In during Report Period | 0,1,2,3,99 | **PSHMoveIn** = 1 | 0, 10-15 |
| 23 | American Indian, Alaska Native, or Indigenous (only) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 1 | 0, 10-15 |
| 24 | American Indian, Alaska Native, or Indigenous & Hispanic/Latina/e/o HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 16 | 0, 10-15 |
| 25 | Asian or Asian American (only) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 2 | 0, 10-15 |
| 26 | Asian or Asian American & Hispanic/Latina/e/o HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 26 | 0, 10-15 |
| 27 | Black, African American, or African (only) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 3 | 0, 10-15 |
| 28 | Black, African American, or African & Hispanic/Latina/e/o HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 36 | 0, 10-15 |
| 29 | Hispanic/Latina/e/o (only) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 6 | 0, 10-15 |
| 30 | Middle Eastern or North African (only) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 7 | 0, 10-15 |
| 31 | Middle Eastern or North African & Hispanic/Latina/e/o HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 67 | 0, 10-15 |
| 32 | Native Hawaiian or Pacific Islander (only) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 4 | 0, 10-15 |
| 33 | Native Hawaiian or Pacific Islander & Hispanic/Latina/e/o HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 46 | 0, 10-15 |
| 34 | White (only) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 5 | 0, 10-15 |
| 35 | White & Hispanic/Latina/e/o HoH | 0,1,2,3,99 | **HoHRaceEthnicity** = 56 | 0, 10-15 |
| 36 | Multi-Racial (not Hispanic/Latina/e/o) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** \>=12, is not in (98, 99)**,** does not include a 6 | 0, 10-15 |
| 37 | Multi-Racial & Hispanic/Latina/e/o) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** \>=126**,** includes a 6 | 0, 10-15 |
| 38 | American Indian, Alaska Native, or Indigenous (any combination) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** includes a 1 | 0, 10-15 |
| 39 | Asian or Asian American (any combination) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** includes a 2 | 0, 10-15 |
| 40 | Black, African American, or African & Any Other (any combination) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** includes a 3 | 0, 10-15 |
| 41 | Hispanic/Latina/e/o (any combination) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** includes a 6 | 0, 10-15 |
| 42 | Middle Eastern or North African & Any Other (any combination) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** includes a 7 | 0, 10-15 |
| 43 | Native Hawaiian or Pacific Islander & Any Other (any combination) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** includes a 4 | 0, 10-15 |
| 44 | White (any combination) HoH | 0,1,2,3,99 | **HoHRaceEthnicity** includes a 5 | 0, 10-15 |
| 45 | Seniors 55+ | 1 | **HHAdultAge** = 55 | 0,13-15 |
| 46 | Parenting Children | 3 | **HHParent = 1** | 0,15 |
| 47 | Households with 3+ Children (LSAHousehold) | 2 | **HHChild = 3** | 0,13,15 |
| 47 | Households with 3+ Children (LSAExit) | 2 | **AC3Plus = 1** | 0,13,15 |
| 48 | Domestic Violence Survivors Not Identified as Currently Fleeing | 0,1,2,3,99 | **HHFleeingDV** = 2 | 0, 10-15 |

## Get Average Days for Length of Time Homeless

### Relevant Data

#### Source

| **tlsa_Household**     |
|------------------------|
| HHType                 |
| ESDays                 |
| THDays                 |
| ESTDays                |
| RRHPSHPreMoveInDays    |
| SystemHomelessDays     |
| Other3917Days          |
| TotalHomelessDays      |
| RRHHousedDays          |
| SystemDaysNotPSHHoused |
| HHChronic              |
| HHVet                  |
| HHDisability           |
| HHFleeingDV            |
| HHAdultAge             |
| HHParent               |
| AC3Plus                |
| HoHRaceEthnicity       |
| Stat                   |
| HHChild                |

#### Target

| lsa_Calculated |
|----------------|

| **Value** | The average of the values \> 0 in the source column for the **HHType** and **Population** identified |
|----|----|
| Cohort | 1 (Active) for these report rows |
| Universe | -1 (All) for these report rows |
| **HHType** | The household type included in the calculation: All(0), AO (1), AC (2), CO (3), and UN (99) |
| **Population** | The population/subpopulation included in the calculation; see section 8.3 |
| SystemPath | -1 (All) for this calculation |
| ProjectID | NULL |
| **ReportRow** | Rows 1-9 (see below) |
| ReportID | Must match LSAReport.**ReportID** |

### Logic

See the table above for **Cohort**, **Universe**, **SystemPath**,
**ProjectID**, and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### ReportRow and Value

For each **ReportRow** listed below, **Value** = the average of \[Source
Column\] from tlsa_Household where \[Source Column\] \> 0, rounded to
the nearest whole number, or the result of a built-in AVERAGE or AVG
function in a database that returns an integer when the datatype of the
parameter is *integer*.

| Report Row Category | Source Column | ReportRow |
|----|----|----|
| Days in ES/SH | **ESDays** | 1 |
| Days in TH | **THDays** | 2 |
| Days in ES/SH or TH | **ESTDays** | 3 |
| Days in RRH/PSH pre-move-in (excluding those overlapping with ES/SH/TH days) | **RRHPSHPreMoveInDays** | 4 |
| Days documented in ES/SH/TH or RRH/PSH pre-move-in total | **SystemHomelessDays** | 5 |
| Days homeless self-reported in 3.917 (excluding those overlapping with ES/SH/TH or RRH/PSH pre-move-in days) | **Other3917Days** | 6 |
| Days homeless total | **TotalHomelessDays** | 7 |
| Days housed in RRH | **RRHHousedDays** | 8 |
| Days documented homeless or housed in RRH total (excluding self-reported time) | **SystemDaysNotPSHHoused** | 9 |

## Get Average Days for Length of Time Homeless by System Path

### Relevant Data

#### Source

| **tlsa_Household**     |
|------------------------|
| HHType                 |
| ESDays                 |
| THDays                 |
| ESTDays                |
| RRHPSHPreMoveInDays    |
| SystemHomelessDays     |
| Other3917Days          |
| TotalHomelessDays      |
| RRHHousedDays          |
| SystemDaysNotPSHHoused |
| SystemPath             |
| HHChronic              |
| HHVet                  |
| HHAdultAge             |
| HHParent               |

#### Target

| lsa_Calculated |
|----------------|

| **Value** | The average of the values \> 0 in the source column for the **HHType** and **Population** identified |
|----|----|
| Cohort | 1 (Active) for these report rows |
| Universe | -1 (All) for these report rows |
| **HHType** | The household type included in the calculation: All(0), AO (1), AC (2), CO (3), and UN (99) |
| **Population** | The population included in the calculation; see section 8.3 |
| **SystemPath** | Between 1 and 12 (see below) |
| ProjectID | NULL |
| **ReportRow** | Rows 1-9 (see below) |
| ReportID | Must match LSAReport.**ReportID** |

### Logic

See the table above for **Cohort**, **Universe**, **ProjectID**, and
**ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### ReportRow, SystemPath, and Value

For each **ReportRow** listed below, **Value** = the average of \[Source
Column\] from tlsa_Household where \[Source Column\] \> 0, rounded to
the nearest whole number, or the result of a built-in AVERAGE or AVG
function in a database that returns an integer when the datatype of the
parameter is *integer*.

The averages for LSACalculated are grouped by the **SystemPath** values
from LSAHousehold.

<table>
<colgroup>
<col style="width: 39%" />
<col style="width: 44%" />
<col style="width: 15%" />
</colgroup>
<thead>
<tr>
<th>Report Row Category</th>
<th>Source Column and Criteria</th>
<th>ReportRow</th>
</tr>
</thead>
<tbody>
<tr>
<td>Days in ES/SH</td>
<td><p><strong>ESDays</strong></p>
<p>where <strong>SystemPath</strong> in (1,3,5,7,9,10,12)</p></td>
<td>1</td>
</tr>
<tr>
<td>Days in TH</td>
<td><p><strong>THDays</strong></p>
<p>where <strong>SystemPath</strong> in (2,3,6,7,12)</p></td>
<td>2</td>
</tr>
<tr>
<td>Days in ES/SH or TH</td>
<td><p><strong>ESTDays</strong></p>
<p>where <strong>SystemPath</strong> in (3,7,12)</p></td>
<td>3</td>
</tr>
<tr>
<td>Days in RRH/PSH pre-move-in (excluding those overlapping with
ES/SH/TH days)</td>
<td><p><strong>RRHPSHPreMoveInDays</strong></p>
<p>where <strong>SystemPath</strong> in (4,5,6,7,8,9,10,11,12)</p></td>
<td>4</td>
</tr>
<tr>
<td>Days documented in ES/SH/TH or RRH/PSH pre-move-in total</td>
<td><p><strong>SystemHomelessDays</strong></p>
<p>where <strong>SystemPath</strong> in (5,6,7,8,9,10,11,12)</p></td>
<td>5</td>
</tr>
<tr>
<td>Days homeless self-reported in 3.917 (excluding those overlapping
with ES/SH/TH or RRH/PSH pre-move-in days)</td>
<td><p><strong>Other3917Days</strong></p>
<p>where <strong>SystemPath</strong> &lt;&gt; -1</p></td>
<td>6</td>
</tr>
<tr>
<td>Days homeless total</td>
<td><p><strong>TotalHomelessDays</strong></p>
<p>where <strong>SystemPath</strong> &lt;&gt; -1</p></td>
<td>7</td>
</tr>
<tr>
<td>Days housed in RRH</td>
<td><p><strong>RRHHousedDays</strong></p>
<p>where <strong>SystemPath</strong> in (4,5,6,7,10,11,12)</p></td>
<td>8</td>
</tr>
<tr>
<td>Days documented homeless or housed in RRH total (excluding
self-reported time)</td>
<td><p><strong>SystemDaysNotPSHHoused</strong></p>
<p>where <strong>SystemPath</strong> &lt;&gt; -1</p></td>
<td>9</td>
</tr>
</tbody>
</table>

## Get Average Days for Cumulative Length of Time Housed in PSH

### Relevant Data

#### Source

| **tlsa_Household** |
|--------------------|
| HHType             |
| PSHHousedDays      |
| PSHMoveIn          |
| PSHStatus          |
| HHChronic          |
| HHVet              |
| HHAdultAge         |
| HHParent           |

#### Target

| lsa_Calculated |
|----------------|

| **Value** | The average of the values \> 0 in the source column for the **HHType** and **Population** identified |
|----|----|
| Cohort | 1 (Active) for these report rows |
| Universe | -1 (All) for these report rows |
| **HHType** | The household type included in the calculation: All(0), AO (1), AC (2), CO (3), and UN (99) |
| **Population** | The population included in the calculation; see section 8.3 |
| SystemPath | -1 (All) for these report rows |
| ProjectID | NULL |
| **ReportRow** | Rows 10 and 11 (see below) |
| ReportID | Must match LSAReport.**ReportID** |

### Logic

See the table above for **Cohort**, **Universe**, **ProjectID**,
**SystemPath**, and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### ReportRow and Value

For each **ReportRow** listed below, **Value** = the average of \[Source
Column\] from tlsa_Household where \[Source Column\] \> 0, rounded to
the nearest whole number, or the result of a built-in AVERAGE or AVG
function in a database that returns an integer when the datatype of the
parameter is *integer*.

<table>
<colgroup>
<col style="width: 38%" />
<col style="width: 49%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th>Report Row Category</th>
<th>Source Column and Criteria</th>
<th>ReportRow</th>
</tr>
</thead>
<tbody>
<tr>
<td>Days housed in PSH – exited in report period</td>
<td><p><strong>PSHHousedDays</strong></p>
<p>(where <strong>PSHMoveIn</strong> in (1,2) and
<strong>PSHStatus</strong> in (12,22))</p></td>
<td>10</td>
</tr>
<tr>
<td>Days housed in PSH – housed at report end</td>
<td><p><strong>PSHHousedDays</strong></p>
<p>(where <strong>PSHMoveIn</strong> in (1,2) and
<strong>PSHStatus</strong> in (11,21))</p></td>
<td>11</td>
</tr>
</tbody>
</table>

## Get Average Days for Length of Time in RRH Projects

### Relevant Data

#### Source

| **tlsa_Household** |
|--------------------|
| HHType             |
| RRHStatus          |
| RRHMoveIn          |
| RRHPreMoveInDays   |
| RRHHousedDays      |
| HHChronic          |
| HHVet              |
| HHAdultAge         |
| HHParent           |

#### Target

| lsa_Calculated |
|----------------|

| **Value** | The average of the values \> 0 in the source column for the **HHType** and **Population** identified |
|----|----|
| Cohort | 1 (Active) for these report rows |
| Universe | -1 (All) for these report rows |
| **HHType** | The household type included in the calculation: All(0), AO (1), AC (2), CO (3), and UN (99) |
| **Population** | The population included in the calculation; see section 8.3 |
| SystemPath | -1 (All) for these report rows |
| ProjectID | NULL |
| **ReportRow** | Rows 12-16 (see below) |
| ReportID | Must match LSAReport.**ReportID** |

### Logic

See the table above for **Cohort**, **Universe**, **ProjectID**,
**SystemPath**, and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### ReportRow and Value

For each **ReportRow** listed below, **Value** = the average of \[Source
Column\] from tlsa_Household where \[Source Column\] \> 0, rounded to
the nearest whole number, or the result of a built-in AVERAGE or AVG
function in a database that returns an integer when the datatype of the
parameter is *integer*.

<table style="width:99%;">
<colgroup>
<col style="width: 46%" />
<col style="width: 40%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th>Report Row Category</th>
<th>Source Column and Criteria</th>
<th>ReportRow</th>
</tr>
</thead>
<tbody>
<tr>
<td>RRH start to exit for households not placed in PH before
exiting</td>
<td><p><strong>RRHPreMoveInDays</strong> where</p>
<p><strong>RRHStatus</strong> in (12,22) and <strong>RRHMoveIn</strong>
= 0</p></td>
<td>12</td>
</tr>
<tr>
<td>RRH start to report end for active households not yet placed in
PH</td>
<td><p><strong>RRHPreMoveInDays</strong> where</p>
<p><strong>RRHStatus</strong> in (11, 21) and <strong>RRHMoveIn</strong>
= 0</p></td>
<td>13</td>
</tr>
<tr>
<td>RRH start to move-in for all households placed in PH</td>
<td><strong>RRHPreMoveInDays</strong> where <strong>RRHMoveIn</strong>
in (1,2) and <strong>RRHStatus</strong> &gt; 2</td>
<td>14</td>
</tr>
<tr>
<td>RRH move-in to exit for households placed before exiting</td>
<td><strong>RRHHousedDays</strong> where <strong>RRHStatus</strong> in
(12,22) and <strong>RRHMoveIn</strong> in (1,2)</td>
<td>15</td>
</tr>
<tr>
<td>RRH move-in to report end for active households placed in PH</td>
<td><strong>RRHHousedDays</strong> where <strong>RRHStatus</strong> in
(11,21) and <strong>RRHMoveIn</strong> in (1,2)</td>
<td>16</td>
</tr>
</tbody>
</table>

## Get Average Days to Return/Re-engage by Last Project Type

### Relevant Data

#### Source

| **tlsa_Exit** |
|---------------|
| HHType        |
| Cohort        |
| ExitTo        |
| ExitFrom      |
| ReturnTime    |
| HHChronic     |
| HHVet         |
| HHAdultAge    |
| HHParent      |

#### Target

| lsa_Calculated |
|----------------|

| **Value** | The average of the values \> 0 in **ReturnTime** |
|----|----|
| **Cohort** | **Cohort** value from tlsa_Exit |
| **Universe** | Destination type prior to return; see below |
| **HHType** | The household type for the average; see section 8.3 |
| **Population** | The population included in the calculation; see section 8.3 |
| SystemPath | -1 (All) |
| ProjectID | NULL |
| **ReportRow** | Rows 18-22, 63-66 (see below) |
| ReportID | Must match LSAReport.**ReportID** |

### Logic

See the table above for **Cohort,**, **SystemPath**, **ReportRow** and
**ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### Universe

Averages are grouped by **Universe** based on LSAExit (tlsa_Exit)
**ExitTo**.

| Category | ExitTo | Universe |
|----|----|----|
| Return 15-730 days after exit to permanent destination | **ExitTo** between 400 and 499 | 2 |
| Re-engage 15-730 days after exit to temporary destination | **ExitTo** between 100 and 399 | 3 |
| Re-engage 15-730 days after exit to unknown destination | **ExitTo** \< 100 | 4 |

#### ReportRow and Value

For each **ReportRow** listed below, **Value** = the average of \[Source
Column\] from tlsa_Exit where **ReturnTime** \> 0, rounded to the
nearest whole number, or the result of a built-in AVERAGE or AVG
function in a database that returns an integer when the datatype of the
parameter is *integer*.

| Report Row Category | Source Column and Criteria | ReportRow |
|----|----|----|
| Days to return after exit from ES | **ReturnTime** where **ExitFrom** = 2 | 18 |
| Days to return after exit from TH | **ReturnTime** where **ExitFrom** = 3 | 19 |
| Days to return after exit from SH | **ReturnTime** where **ExitFrom** = 4 | 20 |
| Days to return after exit from RRH (placed in PH) | **ReturnTime** where **ExitFrom** = 5 | 21 |
| Days to return after exit from PSH (placed in PH) | **ReturnTime** where **ExitFrom** = 6 | 22 |
| Days to return after exit from RRH (not placed) | **ReturnTime** where **ExitFrom** = 7 | 63 |
| Days to return after exit from PSH (not placed) | **ReturnTime** where **ExitFrom** = 8 | 64 |
| Days to return after exit from RRH-SO (placed in PH) | **ReturnTime** where **ExitFrom** = 9 | 65 |
| Days to return after exit from RRH-SO (not placed in PH) | **ReturnTime** where **ExitFrom** = 10 | 66 |

## Get Average Days to Return/Re-engage by Population

### Relevant Data

#### Source

| **tlsa_Exit**    |
|------------------|
| HHType           |
| Cohort           |
| ExitTo           |
| ExitFrom         |
| ReturnTime       |
| HHChronic        |
| HHVet            |
| HHDisability     |
| HHFleeingDV      |
| HHAdultAge       |
| HHParent         |
| AC3Plus          |
| HoHRaceEthnicity |
| Stat             |
| AC3Plus          |

#### Target

| lsa_Calculated |
|----------------|

| **Value** | The average of the values \> 0 in **ReturnTime** |
|----|----|
| **Cohort** | **Cohort** value from tlsa_Exit |
| **Universe** | Destination type prior to return; see below |
| **HHType** | The household type for the average |
| **Population** | The population/subpopulation included in the calculation; see section 8.3 |
| SystemPath | -1 (All) |
| ProjectID | NULL |
| **ReportRow** | 23 |
| ReportID | Must match LSAReport.**ReportID** |

### Logic

See the table above for **Cohort**, **SystemPath**, **ReportRow** and
**ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### Universe

Averages are grouped by **Universe** based on LSAExit (tlsa_Exit)
**ExitTo**.

| Category | ExitTo | Universe |
|----|----|----|
| Return 15-730 days after exit to permanent destination | **ExitTo** between 400 and 499 | 2 |
| Re-engage 15-730 days after exit to temporary destination | **ExitTo** between 100 and 399 | 3 |
| Re-engage 15-730 days after exit to unknown destination | **ExitTo** \< 100 | 4 |

#### Value

For each valid combination of values in other relevant columns,
**Value** = the average of \[Source Column\] from tlsa_Exit where
**ReturnTime** \> 0, rounded to the nearest whole number, or the result
of a built-in AVERAGE or AVG function in a database that returns an
integer when the datatype of the parameter is *integer*.

## Get Average Days to Return/Re-engage by System Path

### Relevant Data

#### Source

| **tlsa_Exit** |
|---------------|
| HHType        |
| Cohort        |
| ExitTo        |
| ExitFrom      |
| ReturnTime    |
| HHChronic     |
| HHVet         |
| HHAdultAge    |
| HHParent      |
| SystemPath    |

#### Target

| lsa_Calculated |
|----------------|

| **Value** | The average of the values \> 0 in **ReturnTime** |
|----|----|
| **Cohort** | **Cohort** value from tlsa_Exit |
| **Universe** | Destination type prior to return; see below |
| **HHType** | The household type for the average |
| **Population** | The population included in the calculation; see section 8.3 |
| SystemPath | See below |
| ProjectID | NULL |
| **ReportRow** | See below |
| ReportID | Must match LSAReport.**ReportID** |

### Logic

See the table above for **Cohort**, and **ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### Universe

Averages are grouped by **Universe** based on LSAExit (tlsa_Exit)
**ExitTo**.

| Category | ExitTo | Universe |
|----|----|----|
| Return 15-730 days after exit to permanent destination | **ExitTo** between 400 and 499 | 2 |
| Re-engage 15-730 days after exit to temporary destination | **ExitTo** between 100 and 399 | 3 |
| Re-engage 15-730 days after exit to unknown destination | **ExitTo** \< 100 | 4 |

#### ReportRow, SystemPath, and Value

For each **ReportRow** listed below, **Value** = the average of
**ReturnTime** where **ReturnTime** \> 0 and **SystemPath** meets the
listed criteria, rounded to the nearest whole number.

For **ReportRow**s 24-35, averages are grouped by the **SystemPath**
value in LSAExit; the **SystemPath** value in LSACalculated should match
the **SystemPath** value in LSAExit.

**ReportRow** 36 includes all records where the LSAExit value for
**SystemPath** \<\> -1 – i.e., SystemPath values 1-12. Because the
average is for multiple **SystemPath** values, the LSACalculated value
for **SystemPath** = -1 for this row.

| Report Row Category                     | tlsa_Exit Values       | ReportRow |
|-----------------------------------------|------------------------|-----------|
| Days to return after ES/SH only path    | **SystemPath** = 1     | 24        |
| Days to return after TH path            | **SystemPath** = 2     | 25        |
| Days to return after ES/SH/TH path      | **SystemPath** = 3     | 26        |
| Days to return after RRH only path      | **SystemPath** = 4     | 27        |
| Days to return after ES/SH/RRH path     | **SystemPath** = 5     | 28        |
| Days to return after TH/RRH path        | **SystemPath** = 6     | 29        |
| Days to return after ES/SH/TH/RRH path  | **SystemPath** = 7     | 30        |
| Days to return after PSH only path      | **SystemPath** = 8     | 31        |
| Days to return after ES/SH/PSH path     | **SystemPath** = 9     | 32        |
| Days to return after ES/SH/RRH/PSH path | **SystemPath** = 10    | 33        |
| Days to return after RRH/PSH path       | **SystemPath** = 11    | 34        |
| Days to return after other path         | **SystemPath** = 12    | 35        |
| Days to return after any system path    | **SystemPath** \<\> -1 | 36        |

## Get Average Days to Return/Re-engage by Exit Destination

### Relevant Data

#### Source

| **tlsa_Exit** |
|---------------|
| HHType        |
| Cohort        |
| ExitTo        |
| ReturnTime    |
| HHChronic     |
| HHVet         |
| HHAdultAge    |
| HHParent      |

#### Target

| lsa_Calculated |
|----------------|

| **Value** | The average of the values \> 0 in **ReturnTime** |
|----|----|
| **Cohort** | The **Cohort** value from tlsa_Exit |
| **Universe** | Destination type prior to return; see below |
| **HHType** | The household type for the average |
| **Population** | The population included in the calculation; see section 8.3 |
| SystemPath | -1 |
| ProjectID | NULL |
| **ReportRow** | 101-136 |
| ReportID | Must match LSAReport.**ReportID** |

### Logic

See the table above for **Cohort, SystemPath, ProjectID,** and
**ReportID**.

See section 8.3 for required **Population** and **HHType** combinations.

#### ReportRow, Universe, and Value

For each **ReportRow** listed below, **Value** = the average of
**ReturnTime** where **ReturnTime** \> 0 and tlsa_Exit.**ExitTo** meets
the listed criteria, rounded to the nearest whole number, or the result
of a built-in AVERAGE or AVG function in a database that returns an
integer when the datatype of the parameter is *integer*.

The **ExitTo** column in tlsa_Exit determines the **ReportRow** and
**Universe**, which distinguishes between permanent, temporary, and
unknown destination types.

| Row | Row Name | ExitTo | Universe |
|---:|----|---:|---:|
| 101 | Average days to return after exit to Emergency shelter, including hotel or motel paid for with emergency shelter voucher, Host Home shelter | 101 | 3 |
| 102 | Average days to return after exit to Place not meant for habitation (e.g., a vehicle, an abandoned building, bus/train/subway station/airport or anywhere outside) | 116 | 3 |
| 103 | Average days to return after exit to Safe Haven | 118 | 3 |
| 104 | Average days to return after exit to Psychiatric hospital or other psychiatric facility | 204 | 3 |
| 105 | Average days to return after exit to Substance abuse treatment facility or detox center | 205 | 3 |
| 106 | Average days to return after exit to Hospital or other residential non-psychiatric medical facility | 206 | 3 |
| 107 | Average days to return after exit to Jail, prison, or juvenile detention facility | 207 | 3 |
| 108 | Average days to return after exit to Foster care home or foster care group home | 215 | 3 |
| 109 | Average days to return after exit to Long-term care facility or nursing home | 225 | 3 |
| 110 | Average days to return after exit to Transitional housing for homeless persons (including homeless youth) | 302 | 3 |
| 111 | Average days to return after exit to Staying or living with family, temporary tenure (e.g. room, apartment, or house) | 312 | 3 |
| 112 | Average days to return after exit to Staying or living with friends, temporary tenure (e.g. room, apartment, or house) | 313 | 3 |
| 113 | Average days to return after exit to Hotel or motel paid for without emergency shelter voucher | 314 | 3 |
| 114 | Average days to return after exit to Moved from one HOPWA funded project to HOPWA TH | 327 | 3 |
| 115 | Average days to return after exit to Residential project or halfway house with no homeless criteria | 329 | 3 |
| 116 | Average days to return after exit to Host Home (non-crisis) | 332 | 3 |
| 117 | Average days to return after exit to Rental by client, no ongoing housing subsidy | 410 | 2 |
| 118 | Average days to return after exit to Owned by client, no ongoing housing subsidy | 411 | 2 |
| 119 | Average days to return after exit to Rental by client - VASH housing subsidy | 419 | 2 |
| 120 | Average days to return after exit to Rental by client - Other ongoing subsidy | 420 | 2 |
| 121 | Average days to return after exit to Owned by client, with ongoing housing subsidy | 421 | 2 |
| 122 | Average days to return after exit to Staying or living with family, permanent tenure | 422 | 2 |
| 123 | Average days to return after exit to Staying or living with friends, permanent tenure | 423 | 2 |
| 124 | Average days to return after exit to Moved from one HOPWA funded project to HOPWA PH | 426 | 2 |
| 125 | Average days to return after exit to Rental by client - GPD TIP housing subsidy | 428 | 2 |
| 126 | Average days to return after exit to Rental by client - RRH or equivalent subsidy | 431 | 2 |
| 127 | Average days to return after exit to Rental by client - HCV voucher (tenant or project based) (not dedicated) | 433 | 2 |
| 128 | Average days to return after exit to Rental by client - Public housing unit | 434 | 2 |
| 129 | Average days to return after exit to Rental by client - Emergency Housing Voucher | 436 | 2 |
| 130 | Average days to return after exit to Rental by client - Family Unification Program Voucher (FUP) | 437 | 2 |
| 131 | Average days to return after exit to Rental by client - Foster Youth to Independence Initiative (FYI) | 438 | 2 |
| 132 | Average days to return after exit to Rental by client - Permanent Supportive Housing | 439 | 2 |
| 133 | Average days to return after exit to Rental by client - Other permanent housing dedicated for formerly homeless persons | 440 | 2 |
| 134 | Average days to return after exit to Deceased | 24 | 4 |
| 135 | Average days to return after exit to destination not provided by client | 98 | 4 |
| 136 | Average days to return after exit with missing or invalid destination | 99 | 4 |