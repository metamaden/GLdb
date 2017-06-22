--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-06-22 16:17:42

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
-- TOC entry 192 (class 1259 OID 17007)
-- Name: polyps; Type: TABLE; Schema: gldata; Owner: postgres
--

CREATE TABLE polyps (
    rowindex integer NOT NULL,
    patient_id character varying(10) NOT NULL,
    encounter_date date NOT NULL,
    polyp_id character varying(10) NOT NULL,
    polyp_size integer
);


ALTER TABLE polyps OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 17005)
-- Name: polyps_id_seq; Type: SEQUENCE; Schema: gldata; Owner: postgres
--

CREATE SEQUENCE polyps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE polyps_id_seq OWNER TO postgres;

--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 191
-- Name: polyps_id_seq; Type: SEQUENCE OWNED BY; Schema: gldata; Owner: postgres
--

ALTER SEQUENCE polyps_id_seq OWNED BY polyps.rowindex;


--
-- TOC entry 2040 (class 2604 OID 17010)
-- Name: polyps rowindex; Type: DEFAULT; Schema: gldata; Owner: postgres
--

ALTER TABLE ONLY polyps ALTER COLUMN rowindex SET DEFAULT nextval('polyps_id_seq'::regclass);


--
-- TOC entry 2168 (class 0 OID 17007)
-- Dependencies: 192
-- Data for Name: polyps; Type: TABLE DATA; Schema: gldata; Owner: postgres
--

COPY polyps (rowindex, patient_id, encounter_date, polyp_id, polyp_size) FROM stdin;
1	patient1	2002-10-15	1-3	\N
2	patient1	2002-10-15	2-3	\N
3	patient1	2002-10-15	3-3	\N
4	patient1	2010-05-06	1-5	\N
5	patient1	2010-05-06	2-5	\N
6	patient1	2010-05-06	3-5	\N
7	patient1	2010-05-06	4-5	\N
8	patient1	2010-05-06	5-5	\N
9	patient1	2015-02-11	1-1	\N
10	patient3	2016-10-11	1-2	\N
11	patient3	2016-10-11	2-2	\N
12	patient5	2000-01-01	1-4	\N
13	patient5	2000-01-01	2-4	\N
14	patient5	2000-01-01	3-4	\N
15	patient5	2000-01-01	4-4	\N
\.


--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 191
-- Name: polyps_id_seq; Type: SEQUENCE SET; Schema: gldata; Owner: postgres
--

SELECT pg_catalog.setval('polyps_id_seq', 15, true);


--
-- TOC entry 2042 (class 2606 OID 17012)
-- Name: polyps polyps_pkey; Type: CONSTRAINT; Schema: gldata; Owner: postgres
--

ALTER TABLE ONLY polyps
    ADD CONSTRAINT polyps_pkey PRIMARY KEY (rowindex, polyp_id);


--
-- TOC entry 2043 (class 2606 OID 17013)
-- Name: polyps patientid_fk; Type: FK CONSTRAINT; Schema: gldata; Owner: postgres
--

ALTER TABLE ONLY polyps
    ADD CONSTRAINT patientid_fk FOREIGN KEY (patient_id) REFERENCES patients(patient_id);


-- Completed on 2017-06-22 16:17:42

--
-- PostgreSQL database dump complete
--

