CREATE TABLE depositor(
    customer_name VARCHAR(250),
    account_number NUMBER(10),
    CONSTRAINT pk_depositor PRIMARY KEY (customer_name, account_number),
    CONSTRAINT fk_customer_depositor FOREIGN KEY (customer_name) REFERENCES customer(customer_name),
    CONSTRAINT fk_account FOREIGN KEY (account_number) REFERENCES account(account_number)
);

INSERT into depositor VALUES ('Kibria', 1430);
INSERT into depositor VALUES ('Shakib', 1404);
INSERT into depositor VALUES ('Zisun', 1434);