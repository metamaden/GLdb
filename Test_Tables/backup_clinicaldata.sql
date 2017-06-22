--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-06-22 16:18:45

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
-- TOC entry 200 (class 1259 OID 17107)
-- Name: clinical_data; Type: TABLE; Schema: gldata; Owner: postgres
--

CREATE TABLE clinical_data (
    rowindex integer NOT NULL,
    patient_id character varying(10) NOT NULL,
    aspirin "char",
    bmi integer,
    gender "char"
);


ALTER TABLE clinical_data OWNER TO postgres;

--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE clinical_data; Type: COMMENT; Schema: gldata; Owner: postgres
--

COMMENT ON TABLE clinical_data IS 'Patient clinical data.';


--
-- TOC entry 199 (class 1259 OID 17105)
-- Name: clinical_data_id_seq; Type: SEQUENCE; Schema: gldata; Owner: postgres
--

CREATE SEQUENCE clinical_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clinical_data_id_seq OWNER TO postgres;

--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 199
-- Name: clinical_data_id_seq; Type: SEQUENCE OWNED BY; Schema: gldata; Owner: postgres
--

ALTER SEQUENCE clinical_data_id_seq OWNED BY clinical_data.rowindex;


--
-- TOC entry 2040 (class 2604 OID 17110)
-- Name: clinical_data rowindex; Type: DEFAULT; Schema: gldata; Owner: postgres
--

ALTER TABLE ONLY clinical_data ALTER COLUMN rowindex SET DEFAULT nextval('clinical_data_id_seq'::regclass);


--
-- TOC entry 2166 (class 0 OID 17107)
-- Dependencies: 200
-- Data for Name: clinical_data; Type: TABLE DATA; Schema: gldata; Owner: postgres
--

COPY clinical_data (rowindex, patient_id, aspirin, bmi, gender) FROM stdin;
1	patient1	Y	40	M
2	patient2	N	35	M
3	patient3	N	25	F
4	patient4	N	45	F
5	patient5	Y	30	M
6	patient6	Y	50	M
7	patient7	Y	40	F
\.


--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 199
-- Name: clinical_data_id_seq; Type: SEQUENCE SET; Schema: gldata; Owner: postgres
--

SELECT pg_catalog.setval('clinical_data_id_seq', 7, true);


--
-- TOC entry 2041 (class 2606 OID 17119)
-- Name: clinical_data patient_fk; Type: FK CONSTRAINT; Schema: gldata; Owner: postgres
--

ALTER TABLE ONLY clinical_data
    ADD CONSTRAINT patient_fk FOREIGN KEY (patient_id) REFERENCES patients(patient_id);


-- Completed on 2017-06-22 16:18:46

--
-- PostgreSQL database dump complete
--

