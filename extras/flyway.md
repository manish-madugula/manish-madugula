# Flyway Task


## Common Task

### Existing Database Setup (Depricated)
Define Baseline for all the databases.  The changes of prod will be the oldest so the database for prod will be baseline. All the changes between prod and qa needs to be in a separate sql script which is v1 of the database and between qa and dev will be v2. 


Say you have prod(v1), qa(v2.1), dev(2.3).

Go to production, generate the SQL Script for that.
- (For safety) Copy a container of postgres
- Run flyway baseline in production to make sure the current schema becomes the first version.

Go to test/dev
- (For safety) Copy a container of postgres.
- Backup test data.
- Run flyway clean to delete the db.
- Run flyway baseline. Now the schema matches the production.
- You need to figure out the changes after baseline that needs to be applied to qa.
- Run flyway migrate to apply all the remaining changes to qa environment. Now the schema should exactly match the previous state of the qa. This won't run the baseline script.
- Using the backup test data copy back the data if required. Directly

This approach will however not let us deploy anything intermediate versions between qa and dev in prod or qa for that matter. (say between v1 to 2.1 and from 2.1 to 2.3). Unless you have db scripts for the intermediate versions.
 
 ## Things to figure out.
- Scripts between prod and qa.
- Scripts between qa and dev.

 
 
 ## Licensing of Flyway (free vs pro)

## Ownership

### Byoc


### Jenkin's pipeline