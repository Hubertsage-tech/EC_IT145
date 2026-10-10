/*
    Assignment: EC_IT143 6.3 - Fun with Triggers
    Topic: Track last modified user
    Step: 2
    Student initials: KHS
    Purpose: Track changes to customer records using an AFTER UPDATE trigger.
*/


-- Current understanding:
-- SQL Server's SUSER_SNAME() returns the login name for the current security context.
-- An AFTER UPDATE trigger can save that value to a LastModifiedBy column.
-- Next step: inspect the table and then add the column and trigger.
