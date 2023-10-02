-- Use a transaction to execute multiple SQL commands atomically
BEGIN;
-- Backfill `status` for historical entries
UPDATE subscriptions
SET status = 'confirmed'
WHERE status IS NULL;
-- Make `status` mandatory
ALTER TABLE subscriptions ALTER COLUMN status SET NOT NULL;
COMMIT;
