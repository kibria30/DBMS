CREATE TABLE person2(
    ID NUMBER(10),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    salary NUMBER(10),
    CONSTRAINT person_ID PRIMARY KEY (ID, first_name)
);

INSERT into person2 VALUES (1430, 'Kibria', 'Hossen', 10000);
INSERT into person2 VALUES (1430, 'Shakib', 'Islam', 15000);
INSERT into person2 VALUES (1434, 'Touhid', 'Zisun', 15000);

COLUMN ID FORMAT 99999
COLUMN first_name FORMAT A10
COLUMN last_name FORMAT A10
COLUMN salary FORMAT 99999

SELECT * from person2;