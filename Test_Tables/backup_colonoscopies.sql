--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-06-22 16:19:39

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
-- TOC entry 190 (class 1259 OID 16963)
-- Name: colonoscopies; Type: TABLE; Schema: gldata; Owner: postgres
--

CREATE TABLE colonoscopies (
    rowindex integer NOT NULL,
    patient_id character varying NOT NULL,
    encounter_date date NOT NULL,
    total_polyps_reported integer,
    index boolean
);


ALTER TABLE colonoscopies OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16961)
-- Name: colonoscopies_id_seq; Type: SEQUENCE; Schema: gldata; Owner: postgres
--

CREATE SEQUENCE colonoscopies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE colonoscopies_id_seq OWNER TO postgres;

--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 189
-- Name: colonoscopies_id_seq; Type: SEQUENCE OWNED BY; Schema: gldata; Owner: postgres
--

ALTER SEQUENCE colonoscopies_id_seq OWNED BY colonoscopies.rowindex;


--
-- TOC entry 2040 (class 2604 OID 16966)
-- Name: colonoscopies rowindex; Type: DEFAULT; Schema: gldata; Owner: postgres
--

ALTER TABLE ONLY colonoscopies ALTER COLUMN rowindex SET DEFAULT nextval('colonoscopies_id_seq'::regclass);


--
-- TOC entry 2168 (class 0 OID 16963)
-- Dependencies: 190
-- Data for Name: colonoscopies; Type: TABLE DATA; Schema: gldata; Owner: postgres
--

COPY colonoscopies (rowindex, patient_id, encounter_date, total_polyps_reported, index) FROM stdin;
2	patient1	2005-11-19	1	t
6	patient2	2013-11-01	\N	t
8	patient3	2015-02-13	\N	t
10	patient4	2017-08-09	6	t
13	patient7	2015-02-11	1	t
11	patient5	2000-01-01	6	t
1	patient1	2002-10-15	4	f
3	patient1	2010-05-06	5	f
4	patient1	2015-02-11	3	f
5	patient2	2003-10-04	\N	f
7	patient2	2015-01-07	\N	f
9	patient3	2016-10-11	6	f
\.


--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 189
-- Name: colonoscopies_id_seq; Type: SEQUENCE SET; Schema: gldata; Owner: postgres
--

SELECT pg_catalog.setval('colonoscopies_id_seq', 13, true);


--
-- TOC entry 2042 (class 2606 OID 16971)
-- Name: colonoscopies colonoscopies_pkey; Type: CONSTRAINT; Schema: gldata; Owner: postgres
--

ALTER TABLE ONLY colonoscopies
    ADD CONSTRAINT colonoscopies_pkey PRIMARY KEY (rowindex, encounter_date);


--
-- TOC entry 2043 (class 2606 OID 16972)
-- Name: colonoscopies patientid_fk; Type: FK CONSTRAINT; Schema: gldata; Owner: postgres
--

ALTER TABLE ONLY colonoscopies
    ADD CONSTRAINT patientid_fk FOREIGN KEY (patient_id) REFERENCES patients(patient_id);


-- Completed on 2017-06-22 16:19:39

--
-- PostgreSQL database dump complete
--

