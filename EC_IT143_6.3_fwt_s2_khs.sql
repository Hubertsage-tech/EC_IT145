/*
    Assignment: EC_IT143 6.3 - Fun with Triggers
    Topic: Track last modified date
    Step: 2
    Student initials: KHS
    Purpose: Track changes to customer records using an AFTER UPDATE trigger.
*/


-- Current understanding:
-- A default constraint records a value when a row is inserted, not on every update.
-- An AFTER UPDATE trigger can update an audit column after a customer row changes.
-- Next step: check the table's primary key and add a LastModifiedDate column.
