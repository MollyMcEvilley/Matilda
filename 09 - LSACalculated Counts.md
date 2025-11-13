# HMIS Business Logic: LSACalculated Counts

## Report Rows for LSACalculated Counts

| Row | Reporting Category                                      | Section     |
|----:|---------------------------------------------------------|-------------|
|  53 | Project-level – People by household characteristics     | Section 9.3 |
|  53 | Project type – People by household characteristics      | Section 9.3 |
|  54 | Project-level – Households by household characteristics | Section 9.3 |
|  54 | Project-type – Households by household characteristics  | Section 9.3 |
|  55 | Project level – People by personal characteristic       | Section 9.4 |
|  55 | Project-type – People by personal characteristic        | Section 9.4 |
|  56 | Project-level – Bed nights by household characteristics | Section 9.5 |
|  56 | Project-type – Bed nights by household characteristics  | Section 9.5 |
|  57 | Project-level – Bed nights by personal characteristics  | Section 9.5 |
|  57 | Project-type – Bed nights by personal characteristics   | Section 9.5 |

## Identify Active and Point in Time Cohorts for LSACalculated Counts

The ‘active’ cohort for these counts is limited to people and households
with enrollments where **AIR** = 1.

This step identifies records in tlsa_Enrollment in point-in-time cohorts
(10-13) to simplify the process of generating counts.

### Relevant Data

#### Source

| **tlsa_CohortDates**                                   |
|--------------------------------------------------------|
| Cohort                                                 |
| CohortStart                                            |
| CohortEnd                                              |
| **tlsa_Enrollment**                                    |
| AIR                                                    |
| EntryDate                                              |
| MoveInDate                                             |
| ExitDate                                               |
| LSAProjectType                                         |
| **hmis_Services**                                      |
| EnrollmentID                                           |
| BedNightDate (*DateProvided* where *RecordType* = 200) |

#### Target

| tlsa_Enrollment | Cohort | Category          |
|-----------------|--------|-------------------|
| **PITOctober**  | 10     | Active October 31 |
| **PITJanuary**  | 11     | Active January 31 |
| **PITApril**    | 12     | Active April 30   |
| **PITJuly**     | 13     | Active July 31    |

### Logic

Set **PITOctober**, **PITJanuary**, **PITApril**, and **PITJuly** to 1
where **AIR** = 1 and:

- If **LSAProjectType** in (3,13), **MoveInDate** \<= <u>CohortEnd</u>;
  and

- If **LSAProjectType** in (0,1,2,8), **EntryDate** \<=
  <u>CohortEnd</u>; and

- If **LSAProjectType** = 1, there is a valid *BedNightDate* on
  <u>CohortStart</u>; and

- **ExitDate** is NULL, or **ExitDate** \> <u>CohortStart.</u>

## Counts of People and Households by Project and Household Characteristics

### Relevant Data

#### Source

| **tlsa_Enrollment** |
|---------------------|
| AIR                 |
| PITOctober          |
| PITJanuary          |
| PITApril            |
| PITJuly             |
| **tlsa_HHID**       |
| ActiveHHType        |
| ProjectID           |
| LSAProjectType      |
| HHChronic           |
| HHVet               |
| HHAdultAge          |
| HHParent            |
| HHFleeingDV         |
| HHDisability        |

#### Target

| lsa_Calculated |
|----------------|

| **Value**      | See below                           |
|----------------|-------------------------------------|
| **Cohort**     | 1, 10, 11, 12, 13 (see section 9.2) |
| **Universe**   | See below                           |
| **HHType**     | See below                           |
| **Population** | See below                           |
| **SystemPath** | -1                                  |
| **ProjectID**  | See below                           |
| **ReportRow**  | See below                           |
| ReportID       | Must match LSAReport.**ReportID**   |

### Logic

#### Report Row and Value

Report rows 53 and 54 count people and households in the active and
point-in-time cohorts (see section 9.2).

| Row | Value |
|----|----|
| 53 | Count of distinct **PersonalID**s in tlsa_Enrollment |
| 54 | Count of distinct combinations of **HoHID**/**ActiveHHType** in tlsa_HHID |

#### Cohort

| Cohort | tlsa_Enrollment Criteria |
|--------|--------------------------|
| 1      | **AIR** = 1              |
| 10     | **PITOctober** = 1       |
| 11     | **PITJanuary** = 1       |
| 12     | **PITApril** = 1         |
| 13     | **PITJuly** = 1          |

#### Universe and ProjectID

Report rows 53 and 54 are required for each of the following
**Universe** values grouped by cohort, household type, and population.
For project-level counts (**Universe** = 10), the **ProjectID** from
tlsa_HHID is required and should match a record in lsa_Project.

| Universe | ProjectID | Criteria |
|----|----|----|
| 10 = Project-level | =tlsa_HHID.**ProjectID** | \- |
| 11=ES project type | NULL | tlsa_HHID.**LSAProjectType** in (0,1) |
| 12=SH project type | NULL | tlsa_HHID.**LSAProjectType** = 8 |
| 13=TH project type | NULL | tlsa_HHID.**LSAProjectType** = 2 |
| 14=Housed in RRH | NULL | tlsa_HHID.**LSAProjectType** = 13 |
| 15=Housed in PSH | NULL | tlsa_HHID.**LSAProjectType** = 3 |
| 16=ES/SH/TH unduplicated | NULL | tlsa_HHID.**LSAProjectType** in (0,1,8,2) |

#### Household Type and Populations

Report rows 53 and 54 are required for the following combinations of
household type and population:

| ID | Population | HHType | Criteria (tlsa_HHID) |
|---:|----|----|----|
| 0 | All | 0,1,2,3,99 | All |
| 10 | Youth 18-21 | 1 | **HHAdultAge = 18** |
| 11 | Youth 22-24 | 1 | **HHAdultAge** = 24 |
| 12 | Parenting Youth 18-24 | 2 | **HHParent** = 1 and **HHAdultAge** in (18,24) |
| 13 | Veteran | 0,1,2,99 | **HHVet = 1** |
| 14 | Non-Veteran 25+ | 1 | **HHVet** = 0 and **HHAdultAge** in (25,55) |
| 15 | Chronically Homeless | 0,1,2,3,99 | **HHChronic** = 1 |
| 18 | Disabled Adult or HoH | 0,1,2,3,99 | **HHDisability** = 1 |
| 19 | Fleeing Domestic Violence | 0,1,2,3,99 | **HHFleeingDV** = 1 |
| 45 | Seniors 55+ | 1 | **HHAdultAge** = 55 |
| 46 | Parenting Children | 3 | **HHParent = 1** |
| 48 | Domestic Violence Survivors Not Identified as Currently Fleeing | 0,1,2,3,99 | **HHFleeingDV** = 2 |

## Get Counts of People by Project and Personal Characteristics

### Relevant Data

#### Source

| **tlsa_Enrollment** |
|---------------------|
| AIR                 |
| PITOctober          |
| PITJanuary          |
| PITApril            |
| PITJuly             |
| **tlsa_HHID**       |
| ActiveHHType        |
| ProjectID           |
| LSAProjectType      |
| HHChronic           |
| HHVet               |
| HHAdultAge          |
| HHParent            |
| HHFleeingDV         |

#### Target

| lsa_Calculated |
|----------------|

| **Value**      | Count of distinct **PersonalIDs** in tlsa_Enrollment |
|----------------|------------------------------------------------------|
| **Cohort**     | 1, 10, 11, 12, 13 (see section 9.2)                  |
| **Universe**   | See below                                            |
| **HHType**     | See below                                            |
| **Population** | See below                                            |
| **SystemPath** | -1                                                   |
| **ProjectID**  | See below                                            |
| **ReportRow**  | 55                                                   |
| ReportID       | Must match LSAReport.**ReportID**                    |

### Logic

#### Cohort

| Cohort | tlsa_Enrollment Criteria |
|--------|--------------------------|
| 1      | **AIR** = 1              |
| 10     | **PITOctober** = 1       |
| 11     | **PITJanuary** = 1       |
| 12     | **PITApril** = 1         |
| 13     | **PITJuly** = 1          |

#### Universe and ProjectID

Report row 55 is required for each of the following **Universe** values
grouped by cohort, household type, and population. For project-level
counts (**Universe** = 10), the **ProjectID** from tlsa_HHID is required
and should match a record in lsa_Project.

| Universe | ProjectID | Criteria |
|----|----|----|
| 10 = Project-level | =tlsa_HHID.**ProjectID** | \- |
| 11=ES project type | NULL | tlsa_HHID.**LSAProjectType** in (0,1) |
| 12=SH project type | NULL | tlsa_HHID.**LSAProjectType** = 8 |
| 13=TH project type | NULL | tlsa_HHID.**LSAProjectType** = 2 |
| 14=Housed in RRH | NULL | tlsa_HHID.**LSAProjectType** = 13 |
| 15=Housed in PSH | NULL | tlsa_HHID.**LSAProjectType** = 3 |
| 16=ES/SH/TH unduplicated | NULL | tlsa_HHID.**LSAProjectType** in (0,1,8,2) |

#### Household Type and Populations

For counts by ProjectID (**Universe** 10) report row 55 is required for
the following combinations of household type and population:

<table>
<colgroup>
<col style="width: 6%" />
<col style="width: 37%" />
<col style="width: 9%" />
<col style="width: 46%" />
</colgroup>
<thead>
<tr>
<th>ID</th>
<th>Population</th>
<th>HHType</th>
<th>Criteria</th>
</tr>
</thead>
<tbody>
<tr>
<td>50</td>
<td>Veteran</td>
<td>0,1,2,99</td>
<td>tlsa_Person.<strong>VetStatus = 1</strong></td>
</tr>
<tr>
<td>53</td>
<td>Chronically Homeless Adult/HoH</td>
<td>0,1,2,3,99</td>
<td><p>tlsa_Person.<strong>DisabilityStatus</strong> = 1 and</p>
<p><strong>CHTime</strong> = 365 and <strong>CHTimeStatus</strong> in
(1,2); or</p>
<p><strong>CHTime</strong> = 400 and <strong>CHTimeStatus</strong> =
2</p></td>
</tr>
<tr>
<td>1190</td>
<td>Age 18-21 in AO Youth Household</td>
<td>1</td>
<td>tlsa_Enrollment.<strong>ActiveAge</strong> = 21 and
tlsa_HHID.<strong>HHAdultAge</strong> in (18,24)</td>
</tr>
<tr>
<td>1191</td>
<td>Age 22-24 in AO Youth Household</td>
<td>1</td>
<td>tlsa_Enrollment.<strong>ActiveAge</strong> = 24 and
tlsa_HHID.<strong>HHAdultAge</strong> in (18,24)</td>
</tr>
<tr>
<td>1290</td>
<td>Age 18-21 in AC Parenting Youth Household</td>
<td>2</td>
<td>tlsa_Enrollment.<strong>ActiveAge</strong> = 21 and
tlsa_HHID.<strong>HHParent</strong> = 1 and tlsa_HHID.HHAdultAge in
(18,24)</td>
</tr>
<tr>
<td>1291</td>
<td>Age 22-24 in AC Parenting Youth Household</td>
<td>2</td>
<td>tlsa_Enrollment.<strong>ActiveAge</strong> = 24 and
tlsa_HHID.<strong>HHParent</strong> = 1 and tlsa_HHID.HHAdultAge in
(18,24)</td>
</tr>
</tbody>
</table>

For counts by project type (**Universe** 11-16)), report row 55 is
required for the following:

<table>
<colgroup>
<col style="width: 10%" />
<col style="width: 34%" />
<col style="width: 10%" />
<col style="width: 44%" />
</colgroup>
<thead>
<tr>
<th>ID</th>
<th>Population</th>
<th>HHType</th>
<th>Criteria</th>
</tr>
</thead>
<tbody>
<tr>
<td>50</td>
<td>Veteran</td>
<td>0,1,2,99</td>
<td>tlsa_Person.<strong>VetStatus = 1</strong></td>
</tr>
<tr>
<td>51</td>
<td>Parenting Youth 18-24</td>
<td><strong>2</strong></td>
<td>tlsa_HHID.<strong>HHParent</strong> = 1 and
tlsa_HHID.<strong>HHAdultAge</strong> in (18,24)</td>
</tr>
<tr>
<td>52</td>
<td>Parenting Child</td>
<td>3</td>
<td>tlsa_HHID.<strong>HHParent</strong> = 1</td>
</tr>
<tr>
<td>53</td>
<td>Chronically Homeless Adult/HoH</td>
<td>0,1,2,3,99</td>
<td><p>tlsa_Person.<strong>DisabilityStatus</strong> = 1 and</p>
<p><strong>CHTime</strong> = 365 and <strong>CHTimeStatus</strong> in
(1,2); or</p>
<p><strong>CHTime</strong> = 400 and <strong>CHTimeStatus</strong> =
2</p></td>
</tr>
<tr>
<td>54</td>
<td>Disabled Adult/HoH</td>
<td>0,1,2,3,99</td>
<td>tlsa_Person.<strong>DisabilityStatus</strong> = 1</td>
</tr>
<tr>
<td>55</td>
<td>Fleeing Domestic Violence</td>
<td>0,1,2,3,99</td>
<td>tlsa_Person.<strong>DVStatus</strong> = 1</td>
</tr>
<tr>
<td>56</td>
<td>American Indian, Alaska Native, or Indigenous (only)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 1</td>
</tr>
<tr>
<td>57</td>
<td>American Indian, Alaska Native, or Indigenous &amp;
Hispanic/Latina/e/o</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 16</td>
</tr>
<tr>
<td>58</td>
<td>Asian or Asian American (only)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 2</td>
</tr>
<tr>
<td>59</td>
<td>Asian or Asian American &amp; Hispanic/Latina/e/o</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 26</td>
</tr>
<tr>
<td>60</td>
<td>Black, African American, or African (only)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 3</td>
</tr>
<tr>
<td>61</td>
<td>Black, African American, or African &amp; Hispanic/Latina/e/o</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 36</td>
</tr>
<tr>
<td>62</td>
<td>Hispanic/Latina/e/o (only)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 6</td>
</tr>
<tr>
<td>63</td>
<td>Middle Eastern or North African (only)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 7</td>
</tr>
<tr>
<td>64</td>
<td>Middle Eastern or North African &amp; Hispanic/Latina/e/o</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 67</td>
</tr>
<tr>
<td>65</td>
<td>Native Hawaiian or Pacific Islander (only)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 4</td>
</tr>
<tr>
<td>66</td>
<td>Native Hawaiian or Pacific Islander &amp; Hispanic/Latina/e/o</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 46</td>
</tr>
<tr>
<td>67</td>
<td>White (only)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 5</td>
</tr>
<tr>
<td>68</td>
<td>White &amp; Hispanic/Latina/e/o</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> = 56</td>
</tr>
<tr>
<td>69</td>
<td>Multi-Racial (not Hispanic/Latina/e/o)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> &gt;=12<strong>,</strong> not in
(98,99), does not include a 6</td>
</tr>
<tr>
<td>70</td>
<td>Multi-Racial &amp; Hispanic/Latina/e/o)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> &gt;=126<strong>,</strong> includes a
6</td>
</tr>
<tr>
<td>71</td>
<td>American Indian, Alaska Native, or Indigenous (any combination)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> includes a 1</td>
</tr>
<tr>
<td>72</td>
<td>Asian or Asian American (any combination)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> includes a 2</td>
</tr>
<tr>
<td>73</td>
<td>Black, African American, or African &amp; Any Other (any
combination)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> includes a 3</td>
</tr>
<tr>
<td>74</td>
<td>Hispanic/Latina/e/o (any combination)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> includes a 6</td>
</tr>
<tr>
<td>75</td>
<td>Middle Eastern or North African &amp; Any Other (any
combination)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> includes a 7</td>
</tr>
<tr>
<td>76</td>
<td>Native Hawaiian or Pacific Islander &amp; Any Other (any
combination)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> includes a 4</td>
</tr>
<tr>
<td>77</td>
<td>White (any combination)</td>
<td>0,1,2,3,99</td>
<td><strong>RaceEthnicity</strong> includes a 5</td>
</tr>
<tr>
<td>86</td>
<td>&lt;1 year</td>
<td>0,2,3,99</td>
<td>Maximum <strong>ActiveAge</strong> = 0</td>
</tr>
<tr>
<td>87</td>
<td>1 to 2 years</td>
<td>0,2,3,99</td>
<td>Maximum <strong>ActiveAge</strong> = 2</td>
</tr>
<tr>
<td>88</td>
<td>3 to 5 years</td>
<td>0,2,3,99</td>
<td>Maximum <strong>ActiveAge</strong> = 5</td>
</tr>
<tr>
<td>89</td>
<td>6 to 17 years</td>
<td>0,2,3,99</td>
<td>Maximum <strong>ActiveAge</strong> = 17</td>
</tr>
<tr>
<td>90</td>
<td>18 to 21 years</td>
<td>0,1,2,99</td>
<td>Maximum <strong>ActiveAge</strong> = 21</td>
</tr>
<tr>
<td>91</td>
<td>22 to 24 years</td>
<td>0,1,2,99</td>
<td>Maximum <strong>ActiveAge</strong> = 24</td>
</tr>
<tr>
<td>92</td>
<td>25 to 34 years</td>
<td>0,1,2,99</td>
<td>Maximum <strong>ActiveAge</strong> = 34</td>
</tr>
<tr>
<td>93</td>
<td>35 to 44 years</td>
<td>0,1,2,99</td>
<td>Maximum <strong>ActiveAge</strong> = 44</td>
</tr>
<tr>
<td>94</td>
<td>45 to 54 years</td>
<td>0,1,2,99</td>
<td>Maximum <strong>ActiveAge</strong> = 54</td>
</tr>
<tr>
<td>95</td>
<td>55 to 64 years</td>
<td>0,1,2,99</td>
<td>Maximum <strong>ActiveAge</strong> = 64</td>
</tr>
<tr>
<td>96</td>
<td>65 and older</td>
<td>0,1,2,99</td>
<td>Maximum <strong>ActiveAge</strong> = 65</td>
</tr>
<tr>
<td>97</td>
<td>Domestic Violence Survivor Not Identified as Currently Fleeing</td>
<td>0,1,2,3,99</td>
<td>tlsa_Person.<strong>DVStatus</strong> in (2,3)</td>
</tr>
<tr>
<td>1190</td>
<td>Age 18-21 in AO Youth Household</td>
<td>1</td>
<td>tlsa_Enrollment.<strong>ActiveAge</strong> = 21 and
tlsa_HHID.<strong>HHAdultAge</strong> in (18,24)</td>
</tr>
<tr>
<td>1191</td>
<td>Age 22-24 in AO Youth Household</td>
<td>1</td>
<td>tlsa_Enrollment.<strong>ActiveAge</strong> = 24 and
tlsa_HHID.<strong>HHAdultAge</strong> in (18,24)</td>
</tr>
<tr>
<td>1290</td>
<td>Age 18-21 in AC Parenting Youth Household</td>
<td>2</td>
<td>tlsa_Enrollment.<strong>ActiveAge</strong> = 21 and
tlsa_HHID.<strong>HHParent</strong> = 1 and tlsa_HHID.HHAdultAge in
(18,24)</td>
</tr>
<tr>
<td>1291</td>
<td>Age 22-24 in AC Parenting Youth Household</td>
<td>2</td>
<td>tlsa_Enrollment.<strong>ActiveAge</strong> = 24 and
tlsa_HHID.<strong>HHParent</strong> = 1 and tlsa_HHID.HHAdultAge in
(18,24)</td>
</tr>
</tbody>
</table>

In addition, row 55 counts by project type (**Universe** 11-16)) are
required for three populations in combination with 34 subpopulations.
The three parent populations are:

| ID  | Parent Population     |
|-----|-----------------------|
| 50  | Veteran               |
| 51  | Parenting Youth 18-24 |
| 52  | Parenting Child       |

Each of the parent populations above are reported in combination with
each of the subpopulations below. The value for **Population** for these
combinations is a four-digit number – the two digits on the left
identify the parent population and the two on the right identify the
subpopulation. For example, the subpopulation of Veterans Fleeing
Domestic Violence is identified as 5055.

| ID  | Subpopulations                                                      |
|-----|---------------------------------------------------------------------|
| 53  | Chronically Homeless Adult/HoH                                      |
| 54  | Disabled Adult/HoH                                                  |
| 55  | Fleeing Domestic Violence                                           |
| 56  | American Indian, Alaska Native, or Indigenous (only)                |
| 57  | American Indian, Alaska Native, or Indigenous & Hispanic/Latina/e/o |
| 58  | Asian or Asian American (only)                                      |
| 59  | Asian or Asian American & Hispanic/Latina/e/o                       |
| 60  | Black, African American, or African (only)                          |
| 61  | Black, African American, or African & Hispanic/Latina/e/o           |
| 62  | Hispanic/Latina/e/o (only)                                          |
| 63  | Middle Eastern or North African (only)                              |
| 64  | Middle Eastern or North African & Hispanic/Latina/e/o               |
| 65  | Native Hawaiian or Pacific Islander (only)                          |
| 66  | Native Hawaiian or Pacific Islander & Hispanic/Latina/e/o           |
| 67  | White (only)                                                        |
| 68  | White & Hispanic/Latina/e/o                                         |
| 69  | Multi-Racial (not Hispanic/Latina/e/o)                              |
| 70  | Multi-Racial & Hispanic/Latina/e/o)                                 |
| 71  | American Indian, Alaska Native, or Indigenous (any combination)     |
| 72  | Asian or Asian American (any combination)                           |
| 73  | Black, African American, or African & Any Other (any combination)   |
| 74  | Hispanic/Latina/e/o (any combination)                               |
| 75  | Middle Eastern or North African & Any Other (any combination)       |
| 76  | Native Hawaiian or Pacific Islander & Any Other (any combination)   |
| 77  | White (any combination)                                             |
| 97  | Domestic Violence Survivor Not Identified as Currently Fleeing      |

## Get Counts of Bednights 

### Relevant Data

#### Source

| **tlsa_Enrollment** |
|---------------------|
| AIR                 |
| MoveInDate          |
| ExitDate            |
| **tlsa_HHID**       |
| ActiveHHType        |
| ProjectID           |
| LSAProjectType      |
| HHAdultAge          |
| **tlsa_Person**     |
| VetStatus           |
| DisabilityStatus    |
| CHTime              |
| CHTimeStatus        |

#### Target

| lsa_Calculated |
|----------------|

| **Value**      | See below                         |
|----------------|-----------------------------------|
| **Cohort**     | 1                                 |
| **Universe**   | See below                         |
| **HHType**     | See below                         |
| **Population** | See below                         |
| **SystemPath** | -1                                |
| **ProjectID**  | See below                         |
| **ReportRow**  | 56 and 57 (see below)             |
| ReportID       | Must match LSAReport.**ReportID** |

### Logic

These counts may be included under any circumstances but are required in
LSACalculated only if:

- <u>ReportStart</u> is October 1

- <u>ReportEnd</u> is September 30 of the following year

- LSAReport.**LSAScope** = 1

#### Universe and ProjectID

Report rows 56 and 57 are required for each of the following
**Universe** values grouped by household type and population. For
project-level counts (**Universe** = 10), the **ProjectID** from
tlsa_HHID is required and should match a record in lsa_Project.

| Universe | ProjectID | Criteria |
|----|----|----|
| 10 = Project-level | =tlsa_HHID.**ProjectID** | \- |
| 11=ES project type | NULL | tlsa_HHID.**LSAProjectType** in (0,1) |
| 12=SH project type | NULL | tlsa_HHID.**LSAProjectType** = 8 |
| 13=TH project type | NULL | tlsa_HHID.**LSAProjectType** = 2 |
| 14=Housed in RRH | NULL | tlsa_HHID.**LSAProjectType** = 13 |
| 15=Housed in PSH | NULL | tlsa_HHID.**LSAProjectType** = 3 |
| 16=ES/SH/TH unduplicated | NULL | tlsa_HHID.**LSAProjectType** in (0,1,8,2) |

#### ReportRow, Population, and HHType

The only difference in logic between rows 56 and 57 are the populations.
Both count bed nights in the LSA report period for the populations and
household types in the table below.

<table>
<colgroup>
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 23%" />
<col style="width: 20%" />
<col style="width: 30%" />
</colgroup>
<thead>
<tr>
<th>ReportRow</th>
<th>Population</th>
<th>Name</th>
<th>HHType</th>
<th>Criteria</th>
</tr>
</thead>
<tbody>
<tr>
<td>56</td>
<td>0</td>
<td>All</td>
<td>0,1,2,3,99</td>
<td>-</td>
</tr>
<tr>
<td>56</td>
<td>10</td>
<td>Youth 18-21</td>
<td>1</td>
<td><strong>HHAdultAge</strong> = 18</td>
</tr>
<tr>
<td>56</td>
<td>11</td>
<td>Youth 22-24</td>
<td>1</td>
<td><strong>HHAdultAge</strong> = 24</td>
</tr>
<tr>
<td>57</td>
<td>50</td>
<td>Veteran</td>
<td>0,1,2,99</td>
<td><strong>VetStatus</strong> = 1</td>
</tr>
<tr>
<td>57</td>
<td>53</td>
<td>Chronically Homeless Adult/HoH</td>
<td>0,1,2,3,99</td>
<td><p><strong>DisabilityStatus</strong> = 1 and:</p>
<p><strong>CHTime</strong> = 365 and <strong>CHTimeStatus</strong> in
(1,2); or</p>
<p><strong>CHTime</strong> = 400 and <strong>CHTimeStatus</strong> =
2</p></td>
</tr>
</tbody>
</table>

#### Value

**Value** = a count of the combination of \[Date\] and distinct
**PersonalID**s in tlsa_Enrollment where **AIR** = 1 and meet the
criteria for inclusion based on household type and population identfiers
where \[Date\] is between <u>ReportStart</u> and <u>ReportEnd</u> and:

<table>
<colgroup>
<col style="width: 32%" />
<col style="width: 19%" />
<col style="width: 48%" />
</colgroup>
<thead>
<tr>
<th>Project</th>
<th>[Date]</th>
<th>[Date]</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>LSAProjectType</strong> in (3,13)</td>
<td><strong>&gt;=MoveInDate</strong></td>
<td><p>&lt;= (<strong>ExitDate</strong> – 1 day) or,</p>
<p>If <strong>ExitDate</strong> is NULL, <u>ReportEnd</u></p></td>
</tr>
<tr>
<td><strong>LSAProjectType</strong> in (0,2,8)</td>
<td><strong>&gt;=EntryDate</strong></td>
<td><p>&lt;= (<strong>ExitDate</strong> – 1 day) or,</p>
<p>If <strong>ExitDate</strong> is NULL, <u>ReportEnd</u></p></td>
</tr>
<tr>
<td><strong>LSAProjectType</strong> = 1</td>
<td colspan="2"><p><em>=BedNightDate</em>
(hmis_Services.<em>DateProvided</em> where <em>RecordType</em> =
200)</p>
<p>Between <u>ReportStart</u> and <u>ReportEnd</u></p>
<p>And &gt;= <strong>EntryDate</strong></p>
<p>And &lt; <strong>ExitDate</strong> (if ExitDate is not NULL)</p></td>
</tr>
</tbody>
</table>

## Get OPH Point-in-Time Counts for HIC

### Relevant Data

#### Source

| **lsa_Report**                   |
|----------------------------------|
| LSAScope                         |
| ReportStart                      |
| **lsa_Project**                  |
| ProjectID                        |
| ProjectType                      |
| **lsa_HMISParticipation**        |
| HMISParticipationType            |
| HMISParticipationStatusStartDate |
| HMISParticipationStatusEndDate   |
| **hmis_Enrollment**              |
| HouseholdID                      |
| PersonalID                       |
| EntryDate                        |
| RelationshipToHoH                |
| MoveInDate                       |
| **hmis_Exit**                    |
| ExitDate                         |

#### Target

| lsa_Calculated |
|----------------|

| **Cohort** | 1 |
|----|----|
| **Universe** | 10 |
| **HHType** | 0 |
| **Population** | 0 |
| **SystemPath** | -1 |
| **ProjectID** | Must match Project.**ProjectID** where **ProjectType** in (9,10) |
| **ReportRow** | 53 |
| **ReportID** | Must match LSAReport.**ReportID** |

### Logic

This adds a project-level point-in-time count of people housed in OPH
for the HIC.

If **LSAScope** = 3 (HIC), **Value** = a count of distinct *PersonalID*s
in hmis_Enrollment where:

- *EntryDate* \<= <u>ReportStart</u>

- *ExitDate* \> <u>ReportStart</u> or is NULL

- The *HouseholdID* is associated with an enrollment that meets the
  following criteria:

  - ***RelationshipToHoH*** = 1

  - *EnrollmentCoC* = <u>ReportCoC</u>

  - *EntryDate* \<= <u>ReportStart</u>

  - *MoveInDate* \<= <u>ReportStart</u>

  - MoveInDate \>= EntryDate

  - *ExitDate* \> ReportStart or is NULL

  - *ProjectID* = lsa_Project.**ProjectID** where **ProjectType** in
    (9,10)

  - There is a record in lsa_HMISParticipation for the ProjectID where:

    - **HMISParticipationType** = 1 (participating in HMIS)

    - **HMISParticipationStatusStartDate** \<= <u>ReportStart</u>.

    - **HMISParticipationStatusEndDate** \> <u>ReportStart</u> or is
      null