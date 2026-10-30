```mermaid erdiagram

DS_ELEMENT {
int element_id PK
varchar element_name
}
 
DS_FIELD {
int field_id PK
int element_id FK
int list_id FK
varchar field_name
}
 
DS_LIST {
int list_id PK
varchar list_name
}
 
DS_LIST_ITEM {
int item_id PK
int list_id FK
int option_type
int int_value
varchar char_value
varchar item_label
}
 
CSV_FILE {
int file_id PK
int parameter_column FK
varchar file_name
}
 
CSV_COLUMN {
int column_id PK
int file_id FK
varchar column_name
varchar data_type
int column_order
}
 
CSV_MAPPING {
int mapping_id PK
int element_id FK
int field_id FK
int file_id FK
varchar mapping_type
varchar parameter_value
text mapping_notes
}
 
CSV_MAPPING_RULE {
int rule_id PK
int mapping_id FK
int item_id FK
int column_id FK
varchar selected_value
varchar unselected_value
int rule_order
text rule_notes
}
 
DS_ELEMENT ||--|{ DS_FIELD : contains
 
DS_LIST ||--o{ DS_FIELD : used_by
DS_LIST ||--|{ DS_LIST_ITEM : contains
 
CSV_FILE ||--|{ CSV_COLUMN : contains
CSV_COLUMN o|--o| CSV_FILE : serves_as_parameter_column
 
DS_ELEMENT o|--o{ CSV_MAPPING : maps_through
DS_FIELD o|--o{ CSV_MAPPING : maps_through
CSV_FILE ||--o{ CSV_MAPPING : receives
 
CSV_MAPPING ||--|{ CSV_MAPPING_RULE : contains
DS_LIST_ITEM o|--o{ CSV_MAPPING_RULE : triggers
CSV_COLUMN ||--o{ CSV_MAPPING_RULE : targeted_by

```
