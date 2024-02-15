CREATE TABLE loan(
    loan_number VARCHAR(250),
    branch_name VARCHAR(250),
    amount NUMBER(10),
    CONSTRAINT pk_loan PRIMARY KEY (loan_number),
    CONSTRAINT fk_branch_loan FOREIGN KEY (branch_name) REFERENCES branch(branch_name)
);

INSERT into loan VALUES ('L-1001', 'Agrani', 100000);
INSERT into loan VALUES ('L-1002', 'Agrani', 150000);
INSERT into loan VALUES ('L-1003', 'Sonali', 50000);