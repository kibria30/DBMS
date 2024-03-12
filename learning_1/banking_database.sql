CREATE TABLE branch(
    branch_name VARCHAR(15),
    branch_city VARCHAR(15), 
    assets NUMBER(10),
    CONSTRAINT pk_branch PRIMARY KEY (branch_name)
);
INSERT into branch VALUES ('Agrani', 'Uttara', 1000000);
INSERT into branch VALUES ('Sonali', 'Mirpur', 1500000);
INSERT into branch VALUES ('Rupali', 'Motijheel', 900000);


CREATE TABLE customer(
    customer_name VARCHAR(15),
    customer_street VARCHAR(15),
    customer_city VARCHAR(15),
    CONSTRAINT pk_customer PRIMARY KEY (customer_name)
);
INSERT into customer VALUES ('Kibria', 'Ghatail', 'Tangail');
INSERT into customer VALUES ('Shakib', 'Chilmari', 'Korigram');
INSERT into customer VALUES ('Zisun', 'Talora', 'Bogura');


CREATE TABLE account(
    account_number NUMBER(10),
    branch_name VARCHAR(15),
    balance NUMBER(10),
    CONSTRAINT pk_account PRIMARY KEY (account_number),
    CONSTRAINT fk_branch_account FOREIGN KEY (branch_name) REFERENCES  branch(branch_name)
);
INSERT into account VALUES (1430, 'Agrani', 10000);
INSERT into account VALUES (1404, 'Agrani', 15000);
INSERT into account VALUES (1434, 'Sonali', 15000);


CREATE TABLE loan(
    loan_number VARCHAR(15),
    branch_name VARCHAR(15),
    amount NUMBER(10),
    CONSTRAINT pk_loan PRIMARY KEY (loan_number),
    CONSTRAINT fk_branch_loan FOREIGN KEY (branch_name) REFERENCES branch(branch_name)
);
INSERT into loan VALUES ('L-1001', 'Agrani', 100000);
INSERT into loan VALUES ('L-1002', 'Agrani', 150000);
INSERT into loan VALUES ('L-1003', 'Sonali', 50000);


CREATE TABLE depositor(
    customer_name VARCHAR(15),
    account_number NUMBER(10),
    CONSTRAINT pk_depositor PRIMARY KEY (customer_name, account_number),
    CONSTRAINT fk_customer_depositor FOREIGN KEY (customer_name) REFERENCES customer(customer_name),
    CONSTRAINT fk_account FOREIGN KEY (account_number) REFERENCES account(account_number)
);
INSERT into depositor VALUES ('Kibria', 1430);
INSERT into depositor VALUES ('Shakib', 1404);
INSERT into depositor VALUES ('Zisun', 1434);


CREATE TABLE borrower(
    customer_name VARCHAR(15),
    loan_number VARCHAR(15),
    CONSTRAINT pk_borrower PRIMARY KEY (customer_name, loan_number),
    CONSTRAINT fk_customer_borrower FOREIGN KEY (customer_name) REFERENCES customer(customer_name),
    CONSTRAINT fk_loan FOREIGN KEY (loan_number) REFERENCES loan(loan_number)
);
INSERT into borrower VALUES ('Zisun', 'L-1003');
INSERT into borrower VALUES ('Shakib', 'L-1001');
INSERT into borrower VALUES ('Kibria', 'L-1002');