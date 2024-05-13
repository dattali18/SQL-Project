# Stage 1: Database Design and Implementation

## Requirements

### Organization Description
- Describe the organization's purpose and structure.

### Entity-Relationship Diagram (ERD)
- Use ERDPlus software to create an ERD with 6 entities per pair.
- Normalize the schema to at least 3NF.
- Include a description of each entity and its relationships.

### Data Structure Diagram (DSD)
- Create a DSD based on the ERD.
- Ensure correct conversion from ERD to DSD.

### Field Types and Constraints
- Choose correct field types for each field, including at least 2 of the DATE type.
- Add required constraints (not null, check, default, etc.).

### Create Table Script
- Prepare a createTable.sql file containing the create table script for all tables.
- Ensure correct conversion from ERD to tables, and do not rely on automatic conversion.

### Data Generation and Insertion
- Use the Data Generator to insert data into tables.
- Insert data in 3 ways: Excel, Python, and other methods like generatedata or mockaroo.
- Prepare insert command files for each table and save them in Git.

### Backup and Restore
- Backup and restore the data to ensure data integrity.
- Save the backup file in Git.

### Additional Requirements
- Prepare a dropTable.sql file in the correct order for all tables.
- Enter data using at least 2 significant date fields.
- Save photos of data creation methods and importing backup and recovery files in the report.

### Note
- When converting from ERD to DSD and DSD to scripts, ensure the conversion is done correctly.
- Pay attention to singular to plural relations and relations with attributes.
- Those using Oracle on a personal computer must create a user using the create user command.
