# HMIS.one Data Constraint Model

**Status:** Current working architecture  
**Assumption:** `data_constraint.scope_type` is `INSTANCE | PARENT | IMPLEMENTATION`.  
**Purpose:** Define machine-readable integrity rules separately from narrative documentation, generated forms, exports, APIs, and future semantic representations.

## 1. Overview

The constraint model separates a rule's identity and scope from the operands needed to execute it:

- `data_constraint` declares the rule, target element, related-record path, constraint type, and comparison scope.
- `data_constraint_key` identifies the fields that partition comparable records or form the value whose uniqueness is enforced.
- `data_constraint_temporal` describes temporal points or intervals, boundary behavior, containing periods, boundary anchors, sequence requirements, and active-record cardinality.
- Intrinsic parent-child cardinality remains on `ds.element` through `parent_element_id`, `min_records`, and `max_records`; it is not duplicated in the constraint tables.

This design keeps paths, scope, keys, and temporal behavior distinct:

- A **path** describes how to navigate to related records.
- A **scope** identifies the namespace or relational context in which a constraint applies.
- A **partition key** determines which records are compared with one another.
- A **value key** determines which value or composite value must be unique.
- A **temporal specification** determines how dates or date ranges are compared.

## 2. Entity relationship diagram

```mermaid
erDiagram
    ELEMENT ||--o{ ELEMENT : "parent of"
    ELEMENT ||--o{ FIELD : "defines"
    ELEMENT ||--o{ DATA_CONSTRAINT : "is governed by"
    PATH ||--o{ DATA_CONSTRAINT : "provides related scope"
    DATA_CONSTRAINT ||--o{ DATA_CONSTRAINT_KEY : "uses keys"
    DATA_CONSTRAINT ||--o| DATA_CONSTRAINT_TEMPORAL : "has temporal operands"
    FIELD ||--o{ DATA_CONSTRAINT_KEY : "acts as key"
    FIELD ||--o{ DATA_CONSTRAINT_TEMPORAL : "acts as temporal operand"
    PATH ||--o{ DATA_CONSTRAINT_TEMPORAL : "locates container"

    ELEMENT {
        int element_id PK
        int parent_element_id FK
        int min_records
        int max_records
    }

    FIELD {
        int field_id PK
        int element_id FK
        varchar field_code
        varchar field_label
    }

    PATH {
        int path_id PK
        varchar path_name
        varchar display_text
    }

    DATA_CONSTRAINT {
        int constraint_id PK
        varchar constraint_name
        enum constraint_type
        int element_id FK
        int path_id FK
        enum scope_type
        datetime created_at
        int created_by
    }

    DATA_CONSTRAINT_KEY {
        int key_id PK
        int constraint_id FK
        int field_id FK
        int key_order
        enum key_role
        datetime created_at
        int created_by
    }

    DATA_CONSTRAINT_TEMPORAL {
        int constraint_id PK_FK
        enum temporal_kind
        enum temporal_granularity
        int point_field_id FK
        int interval_start_field_id FK
        int interval_end_field_id FK
        enum interval_boundary
        enum null_end_behavior
        int container_path_id FK
        int container_start_field_id FK
        int container_end_field_id FK
        enum container_boundary
        enum first_boundary_requirement
        int first_boundary_offset
        enum last_boundary_requirement
        int last_boundary_offset
        enum sequence_requirement
        enum active_cardinality
        timestamp created_at
        int created_by
    }
```

## 3. `data_constraint`

### Purpose

Declares a data integrity rule and identifies the element and broad context to which it applies. It should not repeat key fields, temporal operands, or intrinsic element cardinality.

### Columns

| Column | Required | Meaning |
|---|---:|---|
| `constraint_id` | Yes | Stable internal identifier for the constraint. |
| `constraint_name` | Yes | Human-readable statement of the rule. |
| `constraint_type` | Yes | Identifies the evaluation algorithm. |
| `element_id` | Yes | Element whose records are governed by the rule. |
| `path_id` | No | Optional navigation path used when the rule concerns related records. |
| `scope_type` | Yes | Namespace or relationship boundary within which the rule applies. |
| `created_at` | No | Audit timestamp. |
| `created_by` | No | Audit reference to the creating user or process. |

### `constraint_type`

| Value | Meaning |
|---|---|
| `UNIQUE` | A value or composite value must not be reused within the declared scope and partition. |
| `TEMPORAL_UNIQUENESS` | Temporal points or intervals in the same partition must satisfy the declared active-cardinality and sequence rules. |
| `TEMPORAL_CONTAINMENT` | A temporal point or interval must fall within a related container period and may be anchored to its boundaries. |
| `REFERENTIAL` | A value must identify an existing related record. |
| `VALUE_RELATIONSHIP` | Values on the same or related records must satisfy a declared relationship. |

### `scope_type`

| Value | Meaning |
|---|---|
| `INSTANCE` | The rule applies within one instance of the constrained element. |
| `PARENT` | The rule applies within the constrained record's direct parent instance. |
| `IMPLEMENTATION` | The rule applies across the full HMIS implementation namespace. |

`scope_type` does not identify a partition key or temporal evaluation mode. Those mechanics belong in `data_constraint_key` and `data_constraint_temporal`.

## 4. `data_constraint_key`

### Purpose

Defines one or more ordered fields used either to partition comparable records or to form a unique value.

### Columns

| Column | Required | Meaning |
|---|---:|---|
| `key_id` | Yes | Stable internal identifier for the key component. |
| `constraint_id` | Yes | Constraint using the key component. |
| `field_id` | Yes | Field participating in the key. |
| `key_order` | Yes | Position of the field within a composite key. |
| `key_role` | Yes | Whether the field partitions records or supplies the constrained value. |
| `created_at` | Yes | Audit timestamp. |
| `created_by` | Yes | Audit reference. |

### `key_role`

| Value | Meaning |
|---|---|
| `PARTITION` | Records sharing the ordered partition-key values are compared with one another. |
| `VALUE` | The ordered value-key fields form the value that must be unique. |

### Integrity recommendations

```sql
UNIQUE (constraint_id, key_role, key_order)
UNIQUE (constraint_id, key_role, field_id)
CHECK (key_order >= 1)
```

A write API should also require contiguous `key_order` values beginning with 1 for each `(constraint_id, key_role)` group.

## 5. `data_constraint_temporal`

### Purpose

Supplies the operands and semantics needed to evaluate a temporal constraint. A constraint has at most one temporal specification because `constraint_id` is both the primary key and a foreign key to `data_constraint`.

### Temporal representation

| Column | Meaning |
|---|---|
| `temporal_kind` | Whether each governed record represents a `POINT` or an `INTERVAL`. |
| `temporal_granularity` | Unit used to interpret offsets and adjacency: `DATE_TIME`, `DAY`, `MONTH`, or `YEAR`. |
| `point_field_id` | Date or date-time field used when `temporal_kind = POINT`. |
| `interval_start_field_id` | Inclusive starting field for an interval. |
| `interval_end_field_id` | Ending field for an interval. |
| `interval_boundary` | Determines whether the interval end is included. |
| `null_end_behavior` | Determines whether a missing interval end is open-ended or invalid. |

### Container operands

| Column | Meaning |
|---|---|
| `container_path_id` | Path from the governed record to the record supplying the containing period. |
| `container_start_field_id` | Start of the containing period. |
| `container_end_field_id` | End of the containing period. |
| `container_boundary` | Determines whether the container end is included. |

### Boundary anchoring

| Column | Meaning |
|---|---|
| `first_boundary_requirement` | Whether the earliest point or interval start must equal the container start. |
| `first_boundary_offset` | Offset from the container start, measured in `temporal_granularity`. |
| `last_boundary_requirement` | Whether the latest point or interval end must equal the container end. |
| `last_boundary_offset` | Offset from the container end, measured in `temporal_granularity`. |

### Sequence and active cardinality

| Column | Meaning |
|---|---|
| `sequence_requirement` | `NONE` allows gaps; `CONTIGUOUS` requires adjacent ordered records. |
| `active_cardinality` | `AT_MOST_ONE` prohibits duplicate or overlapping temporal coverage but permits gaps; `EXACTLY_ONE` requires one active record throughout the applicable covered/container period. |

### Enum definitions

#### `temporal_kind`

- `POINT`: The record applies at one temporal value, such as `BedNightDate`.
- `INTERVAL`: The record applies from a start value to an end value.

#### `interval_boundary` and `container_boundary`

- `CLOSED_CLOSED`: Both start and end values are included; at day granularity, a following contiguous interval starts one day after the prior interval ends.
- `CLOSED_OPEN`: The start is included and the end is excluded; a following contiguous interval may start at the prior interval's end.

#### `null_end_behavior`

- `UNBOUNDED`: A null end means that no ending value is currently expected.
- `INVALID`: A null end is not permitted for the interval.

#### Boundary requirements

- `NONE`: No equality to the corresponding container boundary is required.
- `EQUALS_CONTAINER_START`: The earliest temporal value equals the container start plus `first_boundary_offset`.
- `EQUALS_CONTAINER_END`: The latest temporal value equals the container end plus `last_boundary_offset`.

#### `sequence_requirement`

- `NONE`: Internal gaps are allowed.
- `CONTIGUOUS`: Ordered records must be adjacent under the selected granularity and boundary convention.

#### `active_cardinality`

- `AT_MOST_ONE`: No more than one record may apply at a temporal point; gaps are allowed.
- `EXACTLY_ONE`: Exactly one record must apply at every relevant temporal point; gaps and overlaps are prohibited.

## 6. Structural validation rules

The database or write API should enforce the following cross-column rules.

### Point constraints

When `temporal_kind = POINT`:

```text
point_field_id IS NOT NULL
interval_start_field_id IS NULL
interval_end_field_id IS NULL
interval_boundary IS NULL
null_end_behavior IS NULL
```

### Interval constraints

When `temporal_kind = INTERVAL`:

```text
point_field_id IS NULL
interval_start_field_id IS NOT NULL
interval_end_field_id IS NOT NULL
interval_boundary IS NOT NULL
null_end_behavior IS NOT NULL
```

### Container consistency

If any container operand is populated, require a usable containing period:

```text
container_path_id IS NOT NULL
container_start_field_id IS NOT NULL
```

`container_end_field_id` may be nullable when the model permits an open-ended container. Boundary requirements must not reference a missing container boundary.

### Applicability by constraint type

- `TEMPORAL_UNIQUENESS` requires `data_constraint_temporal` and normally at least one `PARTITION` key.
- `TEMPORAL_CONTAINMENT` requires `data_constraint_temporal` and container operands.
- `UNIQUE` requires at least one `VALUE` key; a `PARTITION` key is optional because `scope_type` may establish the full namespace.
- Non-temporal constraints should not have a `data_constraint_temporal` row unless their documented execution semantics explicitly require one.

## 7. Worked examples

The following examples document intended configurations. Field and path IDs should be resolved from canonical metadata rather than hard-coded from these names.

### 7.1 Household ID uniqueness

**Rule:** A `HouseholdID` identifies one `HouseholdEnrollment` and cannot be reused elsewhere in the HMIS implementation.

```yaml
data_constraint:
  constraint_type: UNIQUE
  element: HouseholdEnrollment
  path: null
  scope_type: IMPLEMENTATION

data_constraint_key:
  - key_role: VALUE
    key_order: 1
    field: HouseholdID
```

No `ProjectID` partition is present. Project membership does not narrow the identifier namespace.

### 7.2 CE Participation containment

**Rule:** CE Participation intervals are contained by Project operating dates; the earliest CE start equals `OperatingStartDate`; the latest CE end equals `OperatingEndDate` when the project has an end date; a null CE end is allowed only when no project end is expected.

```yaml
data_constraint:
  constraint_type: TEMPORAL_CONTAINMENT
  element: CEParticipation
  scope_type: PARENT

data_constraint_temporal:
  temporal_kind: INTERVAL
  temporal_granularity: DAY
  interval_start_field: CEParticipationStartDate
  interval_end_field: CEParticipationEndDate
  interval_boundary: CLOSED_CLOSED
  null_end_behavior: UNBOUNDED
  container_path: CEParticipation_to_Project
  container_start_field: OperatingStartDate
  container_end_field: OperatingEndDate
  container_boundary: CLOSED_CLOSED
  first_boundary_requirement: EQUALS_CONTAINER_START
  first_boundary_offset: 0
  last_boundary_requirement: EQUALS_CONTAINER_END
  last_boundary_offset: 0
```

Conditional null rule:

```text
If Project.OperatingEndDate is not null,
CEParticipationEndDate must not be null.
```

### 7.3 CE Participation exact temporal coverage

**Rule:** For one project, CE Participation intervals do not overlap and do not leave gaps.

```yaml
data_constraint:
  constraint_type: TEMPORAL_UNIQUENESS
  element: CEParticipation
  scope_type: PARENT

data_constraint_key:
  - key_role: PARTITION
    key_order: 1
    field: ProjectID

data_constraint_temporal:
  temporal_kind: INTERVAL
  temporal_granularity: DAY
  interval_start_field: CEParticipationStartDate
  interval_end_field: CEParticipationEndDate
  interval_boundary: CLOSED_CLOSED
  null_end_behavior: UNBOUNDED
  sequence_requirement: CONTIGUOUS
  active_cardinality: EXACTLY_ONE
```

At day granularity with `CLOSED_CLOSED` intervals:

```text
Next.StartDate = Previous.EndDate + 1 day
```

Together, the CE containment and uniqueness constraints establish exact coverage of the Project operating period.

### 7.4 Bed Night containment with allowable gaps

**Rule:** `BedNightDate` is a temporal point within `[EntryDate, ExitDate)`; the first date equals `EntryDate`; if `ExitDate` exists, the last date equals `ExitDate - 1 day`; internal gaps are allowed.

```yaml
data_constraint:
  constraint_type: TEMPORAL_CONTAINMENT
  element: BedNight
  scope_type: PARENT

data_constraint_temporal:
  temporal_kind: POINT
  temporal_granularity: DAY
  point_field: BedNightDate
  container_path: BedNight_to_Enrollment
  container_start_field: EntryDate
  container_end_field: ExitDate
  container_boundary: CLOSED_OPEN
  first_boundary_requirement: EQUALS_CONTAINER_START
  first_boundary_offset: 0
  last_boundary_requirement: EQUALS_CONTAINER_END
  last_boundary_offset: -1
  sequence_requirement: NONE
```

Executable containment:

```text
EntryDate <= BedNightDate
AND (ExitDate IS NULL OR BedNightDate < ExitDate)
```

### 7.5 Bed Night temporal uniqueness

**Rule:** An enrollment may have no more than one Bed Night record for a given date, while gaps remain valid.

```yaml
data_constraint:
  constraint_type: TEMPORAL_UNIQUENESS
  element: BedNight
  scope_type: PARENT

data_constraint_key:
  - key_role: PARTITION
    key_order: 1
    field: EnrollmentID

data_constraint_temporal:
  temporal_kind: POINT
  temporal_granularity: DAY
  point_field: BedNightDate
  sequence_requirement: NONE
  active_cardinality: AT_MOST_ONE
```

## 8. Evaluation outline

A constraint evaluator should:

1. Load the `data_constraint` declaration.
2. Resolve the governed element and optional related-record path.
3. Establish the comparison namespace from `scope_type`.
4. Load ordered `PARTITION` and `VALUE` keys.
5. If temporal, load and validate the temporal specification.
6. Group records by the declared scope and partition key.
7. Apply the constraint-type algorithm.
8. Return structured failures identifying the constraint, affected records, fields, and temporal range or value involved.

Suggested failure categories include:

- `VALUE_NOT_UNIQUE`
- `TEMPORAL_OVERLAP`
- `TEMPORAL_GAP`
- `OUTSIDE_CONTAINER`
- `FIRST_BOUNDARY_MISMATCH`
- `LAST_BOUNDARY_MISMATCH`
- `INVALID_NULL_END`
- `MISSING_REFERENCE`
- `VALUE_RELATIONSHIP_FAILED`

## 9. API and UI projection

### API

A constraint representation should expose:

- stable IDs and codes;
- human-readable names;
- constraint type and scope;
- resolved element, path, field, and key references;
- temporal enum values and offsets;
- validation errors in structured form;
- provenance and applicable standards version.

### Administrative UI

The editor should:

- display only operands relevant to the chosen constraint type;
- switch between point and interval field selectors based on `temporal_kind`;
- allow ordered composite partition and value keys;
- validate incompatible combinations before save;
- generate a plain-language preview of the executable rule;
- show the affected element, path, scope, and standards version.

## 10. Current decisions and assumptions

### Confirmed working decisions

- Scope values are `INSTANCE`, `PARENT`, and `IMPLEMENTATION`.
- Intrinsic parent-child cardinality is stored on `ds.element`, not in `data_constraint`.
- Temporal points are modeled explicitly rather than as zero-length intervals.
- Paths do not substitute for partition keys or identifier scope.
- Inclusive day intervals use `CLOSED_CLOSED`; half-open containers use `CLOSED_OPEN` where the end date is the first excluded date.

### Assumptions requiring implementation validation

- The current `data_constraint_key` and `data_constraint_temporal` structures remain as exported in the October 30 constraint update.
- The final database migration removes all legacy key, temporal, and cardinality columns from `data_constraint`.
- Open-ended container handling and “only the chronologically final interval may have a null end” are enforced by the evaluator or an additional cross-record validation rule.
- Applicability criteria, effective dates, standards-version references, severity, and provenance may require later columns or related tables if they are not already represented elsewhere in the canonical model.

## 11. Recommended database cleanup

1. Keep only one foreign key from `data_constraint_key.constraint_id` to `data_constraint.constraint_id`; the earlier export contained two equivalent foreign keys.
2. Add uniqueness constraints for ordered key components.
3. Add database checks where MariaDB can enforce them and duplicate the same validation in the API.
4. Confirm that all field references are valid for their constrained or container elements.
5. Update the broader criteria-model documentation so it no longer shows `min_count`, `max_count`, or the historical scope enum on `data_constraint`.
6. Add representative test fixtures for Household ID uniqueness, CE exact coverage, and Bed Night point containment.

## 12. Traceability principle

This schema is the canonical expression of the rule. Data Dictionary prose, generated forms, CSV instructions, API schemas, validation messages, and future SHACL shapes should be projections of these stored semantics rather than independent restatements of them.
