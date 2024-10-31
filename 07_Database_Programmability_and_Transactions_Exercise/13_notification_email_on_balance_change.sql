CREATE TABLE notification_emails(
	id SERIAL PRIMARY KEY,
	recipient_id INT,
	subject VARCHAR(255),
	body TEXT
);

CREATE OR REPLACE FUNCTION trigger_fn_send_email_on_balance_change()
RETURNS TRIGGER AS
$$
	BEGIN
		INSERT INTO 
			notification_emails(recipient_id, subject, body)
		VALUES
			(old.id, ('Balance change for account: %', old.id), ('On % your balance was changed from % to %.', DATE, old.balance, new.balance));
	RETURN NEW;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER tr_send_email_on_balance_change
AFTER UPDATE ON logs
FOR EACH ROW
EXECUTE PROCEDURE trigger_fn_send_email_on_balance_change();