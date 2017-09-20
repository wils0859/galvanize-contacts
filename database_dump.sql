--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: benwilson
--

CREATE TABLE contacts (
    id integer NOT NULL,
    type character varying,
    value character varying,
    user_id bigint
);


ALTER TABLE contacts OWNER TO benwilson;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: benwilson
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contacts_id_seq OWNER TO benwilson;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: benwilson
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: benwilson
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    date_of_birth date,
    biography character varying,
    is_human boolean
);


ALTER TABLE users OWNER TO benwilson;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: benwilson
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO benwilson;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: benwilson
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: benwilson
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: benwilson
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: benwilson
--

COPY contacts (id, type, value, user_id) FROM stdin;
3	email	danny.fritz@galvanize.com	3
6	home	0	3
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benwilson
--

SELECT pg_catalog.setval('contacts_id_seq', 6, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: benwilson
--

COPY users (id, first_name, last_name, date_of_birth, biography, is_human) FROM stdin;
3	Danny	Fritz	1805-09-15	Definitely a human instructor, not a robot.	f
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: benwilson
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: benwilson
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: benwilson
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: benwilson
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- Name: contacts_id_seq; Type: ACL; Schema: public; Owner: benwilson
--

GRANT USAGE ON SEQUENCE contacts_id_seq TO galvanize_admin;


--
-- Name: users_id_seq; Type: ACL; Schema: public; Owner: benwilson
--

GRANT USAGE ON SEQUENCE users_id_seq TO galvanize_admin;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: benwilson
--

ALTER DEFAULT PRIVILEGES FOR ROLE benwilson IN SCHEMA public REVOKE ALL ON TABLES  FROM benwilson;
ALTER DEFAULT PRIVILEGES FOR ROLE benwilson IN SCHEMA public GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO galvanize_admin;


--
-- PostgreSQL database dump complete
--

