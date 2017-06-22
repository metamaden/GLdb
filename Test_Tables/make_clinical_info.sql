-- Table: gldata.clinical_data

-- DROP TABLE gldata.clinical_data;

CREATE TABLE gldata.clinical_data
(
    rowindex integer NOT NULL DEFAULT nextval('gldata.clinical_data_id_seq'::regclass),
    patient_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    aspirin "char",
    bmi integer,
    gender "char",
    CONSTRAINT patient_fk FOREIGN KEY (patient_id)
        REFERENCES gldata.patients (patient_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE gldata.clinical_data
    OWNER to postgres;
COMMENT ON TABLE gldata.clinical_data
    IS 'Patient clinical data.'

/* POPULATE TABLE */
INSERT INTO gldata.clinical_data (patient_id,aspirin,bmi,gender) VALUES
('patient1','Y','40','M'),
('patient2','N','35','M'),
('patient3','N','25','F'),
('patient4','N','45','F'),
('patient5','Y','30','M'),
('patient6','Y','50','M'),
('patient7','Y','40','F')
;
