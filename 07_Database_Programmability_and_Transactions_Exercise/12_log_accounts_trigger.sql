CREATE TABLE logs(
	id SERIAL PRIMARY KEY,
	account_id INT,
	old_sum DECIMAL(20, 4),
	new_sum DECIMAL(20, 4)
);

CREATE OR REPLACE FUNCTION trigger_fn_insert_new_entry_into_logs()
RETURNS TRIGGER AS
$$
	BEGIN
		INSERT INTO 
			logs(account_id, old_sum, new_sum)
		VALUES
			(old.id, old.balance, new.balance);
	RETURN NEW;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER tr_account_balance_change
AFTER UPDATE OF balance ON accounts
FOR EACH ROW
WHEN (old.balance <> new.balance)
EXECUTE PROCEDURE trigger_fn_insert_new_entry_into_logs();