--
-- PostgreSQL database dump
--

\restrict Bs6ziry7FEYLW5Oh9hmvi8fOlSbG4UoTUy3OBWjVmVsZE6gg5D4hI5vKdb1gewE

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-02-03 20:09:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 33166)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 6008 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 238 (class 1259 OID 34717)
-- Name: beacon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.beacon (
    id integer NOT NULL,
    "level" integer,
    geom public.geometry(Point,4326),
    rssi double precision,
    space_id integer,
    space_version text
);


--
-- TOC entry 237 (class 1259 OID 34716)
-- Name: beacon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.beacon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6009 (class 0 OID 0)
-- Dependencies: 237
-- Name: beacon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.beacon_id_seq OWNED BY public.beacon.id;


--
-- TOC entry 240 (class 1259 OID 34734)
-- Name: edge_line; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.edge_line (
    id integer NOT NULL,
    edge_type text,
    is_walkable boolean DEFAULT true,
    is_accessible boolean DEFAULT true,
    space_id integer,
    space_version text,
    geom public.geometry(LineString,4326),
    "level" integer,
    restriction_level integer,
    source integer,
    target integer,
    cost double precision
);


--
-- TOC entry 239 (class 1259 OID 34733)
-- Name: edge_line_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.edge_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6010 (class 0 OID 0)
-- Dependencies: 239
-- Name: edge_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.edge_line_id_seq OWNED BY public.edge_line.id;





--
-- TOC entry 236 (class 1259 OID 34703)
-- Name: entry_point; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.entry_point (
    id integer NOT NULL,
    unit_id integer,
    description text,
    icon bytea,
    geom public.geometry(Point,4326)
);


--
-- TOC entry 235 (class 1259 OID 34701)
-- Name: entry_point_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.entry_point_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6012 (class 0 OID 0)
-- Dependencies: 235
-- Name: entry_point_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.entry_point_id_seq OWNED BY public.entry_point.id;


--
-- TOC entry 242 (class 1259 OID 34750)
-- Name: point_for_analytics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.point_for_analytics (
    id integer NOT NULL,
    geom public.geometry(Point,4326),
    "level" integer,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    space_id integer
);


--
-- TOC entry 241 (class 1259 OID 34749)
-- Name: point_for_analytics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.point_for_analytics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6013 (class 0 OID 0)
-- Dependencies: 241
-- Name: point_for_analytics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.point_for_analytics_id_seq OWNED BY public.point_for_analytics.id;


--
-- TOC entry 228 (class 1259 OID 34297)
-- Name: point_of_interest; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.point_of_interest (
    id integer NOT NULL,
    poi_type text,
    geom public.geometry(Point,4326),
    space_id integer,
    "level" integer,
    space_version text
);


--
-- TOC entry 227 (class 1259 OID 34296)
-- Name: point_of_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.point_of_interest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6014 (class 0 OID 0)
-- Dependencies: 227
-- Name: point_of_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.point_of_interest_id_seq OWNED BY public.point_of_interest.id;



--
-- TOC entry 232 (class 1259 OID 34675)
-- Name: space; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.space (
    id integer NOT NULL,
    name text,
    version text,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    description text
);


--
-- TOC entry 231 (class 1259 OID 34674)
-- Name: space_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.space_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6015 (class 0 OID 0)
-- Dependencies: 231
-- Name: space_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.space_id_seq OWNED BY public.space.id;


--
-- TOC entry 234 (class 1259 OID 34686)
-- Name: unit_polygon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unit_polygon (
    id integer NOT NULL,
    name text,
    unit_type text,
    space_id integer,
    space_version text,
    "level" integer,
    geom public.geometry(Polygon,4326),
    restriction_level integer,
    is_blocked boolean DEFAULT false
);


--
-- TOC entry 233 (class 1259 OID 34685)
-- Name: unit_polygon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unit_polygon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6017 (class 0 OID 0)
-- Dependencies: 233
-- Name: unit_polygon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unit_polygon_id_seq OWNED BY public.unit_polygon.id;


--
-- TOC entry 5817 (class 2604 OID 34720)
-- Name: beacon id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.beacon ALTER COLUMN id SET DEFAULT nextval('public.beacon_id_seq'::regclass);


--
-- TOC entry 5818 (class 2604 OID 34737)
-- Name: edge_line id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.edge_line ALTER COLUMN id SET DEFAULT nextval('public.edge_line_id_seq'::regclass);


--
-- TOC entry 5814 (class 2604 OID 34689)
-- Name: unit_polygon id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_polygon ALTER COLUMN id SET DEFAULT nextval('public.unit_polygon_id_seq'::regclass);


--
-- TOC entry 5815 (class 2604 OID 34705)
-- Name: entry_point id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entry_point ALTER COLUMN id SET DEFAULT nextval('public.entry_point_id_seq'::regclass);


--
-- TOC entry 5816 (class 2604 OID 34753)
-- Name: point_for_analytics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.point_for_analytics ALTER COLUMN id SET DEFAULT nextval('public.point_for_analytics_id_seq'::regclass);


--
-- TOC entry 5817 (class 2604 OID 34300)
-- Name: point_of_interest id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.point_of_interest ALTER COLUMN id SET DEFAULT nextval('public.point_of_interest_id_seq'::regclass);


--
-- TOC entry 5818 (class 2604 OID 34678)
-- Name: space id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.space ALTER COLUMN id SET DEFAULT nextval('public.space_id_seq'::regclass);



--
-- TOC entry 5840 (class 2606 OID 34725)
-- Name: beacon beacon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.beacon
    ADD CONSTRAINT beacon_pkey PRIMARY KEY (id);


--
-- TOC entry 5842 (class 2606 OID 34743)
-- Name: edge_line edge_line_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.edge_line
    ADD CONSTRAINT edge_line_pkey PRIMARY KEY (id);


--
-- TOC entry 5836 (class 2606 OID 34710)
-- Name: entry_point entry_point_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entry_point
    ADD CONSTRAINT entry_point_pkey PRIMARY KEY (id);


--
-- TOC entry 5844 (class 2606 OID 34759)
-- Name: point_for_analytics point_for_analytics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.point_for_analytics
    ADD CONSTRAINT point_for_analytics_pkey PRIMARY KEY (id);


--
-- TOC entry 5828 (class 2606 OID 34305)
-- Name: point_of_interest point_of_interest_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.point_of_interest
    ADD CONSTRAINT point_of_interest_pkey PRIMARY KEY (id);


--
-- TOC entry 5832 (class 2606 OID 34684)
-- Name: space space_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.space
    ADD CONSTRAINT space_pkey PRIMARY KEY (id);


--
-- TOC entry 5834 (class 2606 OID 34695)
-- Name: unit_polygon unit_polygon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_polygon
    ADD CONSTRAINT unit_polygon_pkey PRIMARY KEY (id);


--
-- TOC entry 5848 (class 2606 OID 34728)
-- Name: beacon beacon_space_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.beacon
    ADD CONSTRAINT beacon_space_id_fkey FOREIGN KEY (space_id) REFERENCES public.space(id);


--
-- TOC entry 5849 (class 2606 OID 34744)
-- Name: edge_line edge_line_space_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.edge_line
    ADD CONSTRAINT edge_line_space_id_fkey FOREIGN KEY (space_id) REFERENCES public.space(id);


--
-- TOC entry 5847 (class 2606 OID 34711)
-- Name: entry_point entry_point_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entry_point
    ADD CONSTRAINT entry_point_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit_polygon(id);


--
-- TOC entry 5850 (class 2606 OID 34760)
-- Name: point_for_analytics point_for_analytics_space_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.point_for_analytics
    ADD CONSTRAINT point_for_analytics_space_id_fkey FOREIGN KEY (space_id) REFERENCES public.space(id);


--
-- Name: point_of_interest point_of_interest_space_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.point_of_interest
    ADD CONSTRAINT point_of_interest_space_id_fkey FOREIGN KEY (space_id) REFERENCES public.space(id);


--
-- TOC entry 5846 (class 2606 OID 34696)
-- Name: unit_polygon unit_polygon_space_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit_polygon
    ADD CONSTRAINT unit_polygon_space_id_fkey FOREIGN KEY (space_id) REFERENCES public.space(id);


-- Completed on 2026-02-03 20:09:08

--
-- PostgreSQL database dump complete
--

\unrestrict Bs6ziry7FEYLW5Oh9hmvi8fOlSbG4UoTUy3OBWjVmVsZE6gg5D4hI5vKdb1gewE

