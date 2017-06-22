--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-06-22 16:14:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = gldata, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 16953)
-- Name: patients; Type: TABLE; Schema: gldata; Owner: postgres
--

CREATE TABLE patients (
    rowindex integer NOT NULL,
    patient_id character varying(10) NOT NULL,
    dob date
);


ALTER TABLE patients OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16951)
-- Name: patients_id_seq; Type: SEQUENCE; Schema: gldata; Owner: postgres
--

CREATE SEQUENCE patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patients_id_seq OWNER TO postgres;

--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 187
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: gldata; Owner: postgres
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.rowindex;


--
-- TOC entry 2040 (class 2604 OID 16956)
-- Name: patients rowindex; Type: DEFAULT; Schema: gldata; Owner: postgres
--

ALTER TABLE ONLY patients ALTER COLUMN rowindex SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- TOC entry 2169 (class 0 OID 16953)
-- Dependencies: 188
-- Data for Name: patients; Type: TABLE DATA; Schema: gldata; Owner: postgres
--

COPY patients (rowindex, patient_id, dob) FROM stdin;
1	patient1	1950-01-15
2	patient2	1968-11-05
3	patient3	1970-10-11
4	patient4	1962-03-19
5	patient5	1973-12-01
7	patient6	1940-08-09
8	patient7	1950-01-15
\.


--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 187
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: gldata; Owner: postgres
--

SELECT pg_catalog.setval('patients_id_seq', 8, true);


--
-- TOC entry 2042 (class 2606 OID 16960)
-- Name: patients patientid_unique; Type: CONSTRAINT; Schema: gldata; Owner: postgres
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patientid_unique UNIQUE (patient_id);


--
-- TOC entry 2044 (class 2606 OID 16958)
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: gldata; Owner: postgres
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (rowindex, patient_id);


-- Completed on 2017-06-22 16:14:08

--
-- PostgreSQL database dump complete
--

