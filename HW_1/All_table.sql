drop table borrower;
drop table depositor;
drop table loan;
drop table account;
drop table customer;
drop table branch;

CREATE TABLE branch(
    branch_name VARCHAR(15),
    branch_city VARCHAR(15), 
    assets NUMBER(10),
    CONSTRAINT pk_branch PRIMARY KEY (branch_name)
);
INSERT into branch VALUES ('Downtown', 'Brooklyn', 900000);
INSERT into branch VALUES ('Redwood', 'Palo Alto', 2100000);
INSERT into branch VALUES ('Perryridge', 'Horseneck', 1700000);
INSERT into branch VALUES ('Mianus', 'Horseneck', 400200);
INSERT into branch VALUES ('Round Hill', 'Horseneck', 8000000);
INSERT into branch VALUES ('Pownal', 'Bennington', 400000);
INSERT into branch VALUES ('North Town', 'Rye', 3700000);
INSERT into branch VALUES ('Brighton', 'Brooklyn', 7000000);
INSERT into branch VALUES ('Central', 'Rye', 400280);


CREATE TABLE customer(
    customer_name VARCHAR(15),
    customer_street VARCHAR(15),
    customer_city VARCHAR(15),
    CONSTRAINT pk_customer PRIMARY KEY (customer_name)
);
INSERT into customer VALUES ('Jones', 'Main', 'Harrison');
INSERT into customer VALUES ('Smith', 'Main', 'Rye');
INSERT into customer VALUES ('Hayes', 'Main', 'Harrison');
INSERT into customer VALUES ('Curry', 'North', 'Rye');
INSERT into customer VALUES ('Lindsay', 'Park', 'Pittsfield');
INSERT into customer VALUES ('Turner', 'Putnam', 'Stamford');
INSERT into customer VALUES ('Williams', 'Nassau', 'Princeton');
INSERT into customer VALUES ('Adams', 'Spring', 'Pittsfield');
INSERT into customer VALUES ('Johnson', 'Alma', 'Palo Alto');
INSERT into customer VALUES ('Glenn', 'Sand Hill', 'Woodside');
INSERT into customer VALUES ('Brooks', 'Senator', 'Brooklyn');
INSERT into customer VALUES ('Green', 'Walnut', 'Stamford');
INSERT into customer VALUES ('Jackson', 'University', 'Salt Lake');
INSERT into customer VALUES ('Majeris', 'First', 'Rye');
INSERT into customer VALUES ('McBride', 'Safety', 'Rye');
INSERT into customer VALUES('Kibria', 'University', 'Dhaka');


CREATE TABLE account(
    account_number varchar(15),
    branch_name VARCHAR(15),
    balance NUMBER(10),
    CONSTRAINT pk_account PRIMARY KEY (account_number),
    CONSTRAINT fk_branch_account FOREIGN KEY (branch_name) REFERENCES  branch(branch_name)
);
INSERT into account VALUES ('A-101', 'Downtown', 500);
INSERT into account VALUES ('A-215', 'Mianus', 700);
INSERT into account VALUES ('A-102', 'Perryridge', 400);
INSERT into account VALUES ('A-305', 'Round Hill', 350);
INSERT into account VALUES ('A-201', 'Perryridge', 900);
INSERT into account VALUES ('A-222', 'Redwood', 700);
INSERT into account VALUES ('A-217', 'Brighton', 750);
INSERT into account VALUES ('A-333', 'Central', 850);
INSERT into account VALUES ('A-444', 'North Town', 625);
INSERT into account VALUES ('A-130', 'Downtown', 600);
INSERT into account VALUES ('A-230', 'Brighton', 700);


CREATE TABLE loan(
    loan_number VARCHAR(15),
    branch_name VARCHAR(15),
    amount NUMBER(10),
    CONSTRAINT pk_loan PRIMARY KEY (loan_number),
    CONSTRAINT fk_branch_loan FOREIGN KEY (branch_name) REFERENCES branch(branch_name)
);
INSERT into loan VALUES ('L-17', 'Downtown', 1000);
INSERT into loan VALUES ('L-23', 'Redwood', 2000);
INSERT into loan VALUES ('L-15', 'Perryridge', 1500);
INSERT into loan VALUES ('L-14', 'Downtown', 1500);
INSERT into loan VALUES ('L-93', 'Mianus', 500);
INSERT into loan VALUES ('L-11', 'Round Hill', 900);
INSERT into loan VALUES ('L-16', 'Perryridge', 1300);
INSERT into loan VALUES ('L-20', 'North Town', 7500);
INSERT into loan VALUES ('L-21', 'Central', 570);


CREATE TABLE depositor(
    customer_name VARCHAR(15),
    account_number VARCHAR(15),
    CONSTRAINT pk_depositor PRIMARY KEY (customer_name, account_number),
    CONSTRAINT fk_customer_depositor FOREIGN KEY (customer_name) REFERENCES customer(customer_name),
    CONSTRAINT fk_account FOREIGN KEY (account_number) REFERENCES account(account_number)
);
INSERT into depositor VALUES ('Johnson','A-101');
INSERT into depositor VALUES ('Smith', 'A-215');
INSERT into depositor VALUES ('Hayes', 'A-102');
INSERT into depositor VALUES ('Hayes', 'A-101');
INSERT into depositor VALUES ('Turner', 'A-305');
INSERT into depositor VALUES ('Johnson','A-201');
INSERT into depositor VALUES ('Jones', 'A-217');
INSERT into depositor VALUES ('Lindsay','A-222');
INSERT into depositor VALUES ('Majeris','A-333');
INSERT into depositor VALUES ('Smith', 'A-444');
INSERT into depositor VALUES ('Kibria', 'A-130');
INSERT into depositor VALUES ('Kibria', 'A-230');


CREATE TABLE borrower(
    customer_name VARCHAR(15),
    loan_number VARCHAR(15),
    CONSTRAINT pk_borrower PRIMARY KEY (customer_name, loan_number),
    CONSTRAINT fk_customer_borrower FOREIGN KEY (customer_name) REFERENCES customer(customer_name),
    CONSTRAINT fk_loan FOREIGN KEY (loan_number) REFERENCES loan(loan_number)
);
INSERT into borrower VALUES ('Jones', 'L-17');
INSERT into borrower VALUES ('Smith', 'L-23');
INSERT into borrower VALUES ('Hayes', 'L-15');
INSERT into borrower VALUES ('Jackson', 'L-14');
INSERT into borrower VALUES ('Curry', 'L-93');
INSERT into borrower VALUES ('Smith', 'L-11');
INSERT into borrower VALUES ('Williams','L-17');
INSERT into borrower VALUES ('Adams', 'L-16');
INSERT into borrower VALUES ('McBride', 'L-20');
INSERT into borrower VALUES ('Smith', 'L-21');