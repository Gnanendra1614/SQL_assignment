ALTER TABLE gold_membership_users
ADD Status VARCHAR(10);

UPDATE gold_membership_users
SET Status = 'Yes';

SELECT *
FROM gold_membership_users;