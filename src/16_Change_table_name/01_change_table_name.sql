
EXEC sp_rename
    'gold_member_users',
    'gold_membership_users';

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';