SELECT *
FROM users;


DELETE FROM users
WHERE user_id = 'John';

SELECT *
FROM users;

DELETE FROM users
WHERE user_id = 'Michel';

SELECT *
FROM users;

ROLLBACK TRANSACTION;

SELECT *
FROM users;