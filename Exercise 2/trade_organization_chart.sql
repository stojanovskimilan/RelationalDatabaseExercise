-- Table: employeeassessment.trade_organizational_chart

-- DROP TABLE IF EXISTS employeeassessment.trade_organizational_chart;

CREATE TABLE IF NOT EXISTS employeeassessment.trade_organizational_chart
(
    id integer NOT NULL,
    name character varying(256) COLLATE pg_catalog."default" NOT NULL,
    "position" character varying(256) COLLATE pg_catalog."default",
    manager_id integer,
    department character varying(256) COLLATE pg_catalog."default",
    division character varying(256) COLLATE pg_catalog."default",
    CONSTRAINT trade_organizational_chart_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS employeeassessment.trade_organizational_chart
    OWNER to milan;

INSERT INTO employeeassessment.trade_organizational_chart VALUES (1, 'A1', 'Shareholder', null, null, null);
INSERT INTO employeeassessment.trade_organizational_chart VALUES (2, 'B2', 'Board', 1, null, null);
INSERT INTO employeeassessment.trade_organizational_chart VALUES (3, 'B3', 'Inspection', 1, null, null);
INSERT INTO employeeassessment.trade_organizational_chart VALUES (4, 'C1', 'Director', 2, null, null);
INSERT INTO employeeassessment.trade_organizational_chart VALUES (5, 'D1', 'Market Center', 4, null, null);
INSERT INTO employeeassessment.trade_organizational_chart VALUES (6, 'D2', 'Administrative Center', 4, null, null);
INSERT INTO employeeassessment.trade_organizational_chart VALUES (7, 'D3', 'Customer Service Department', 4, null, null);
INSERT INTO employeeassessment.trade_organizational_chart VALUES (8, 'D4', 'Marketing Department', 4, null, null);